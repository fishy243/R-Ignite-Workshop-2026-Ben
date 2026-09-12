## =========================================================
## Simple Health Data Analysis: Logistic Regression
## Dataset: HANES_R_Ignite.csv (NHANES, 10,000 observations)
## Outcome: Diabetes (Yes/No)
## =========================================================

## 1. Load data
df <- read.csv("HANES_R_Ignite.csv", stringsAsFactors = TRUE)
cat("Rows:", nrow(df), " Columns:", ncol(df), "\n")

## 2. Select relevant variables & clean
vars <- c("Diabetes", "Age", "Gender", "BMI", "BPSysAve", "BPDiaAve",
          "TotChol", "PhysActive", "Smoke100")
df <- df[, vars]
df <- na.omit(df)
cat("Rows after removing missing values:", nrow(df), "\n")

## 3. Quick EDA
cat("\n--- Summary ---\n")
print(summary(df))

cat("\n--- Diabetes counts ---\n")
print(table(df$Diabetes))

## 4. Train/test split (70/30)
set.seed(42)
n <- nrow(df)
train_idx <- sample(1:n, size = 0.7 * n)
train <- df[train_idx, ]
test  <- df[-train_idx, ]

## 5. Logistic regression model
model <- glm(Diabetes ~ Age + Gender + BMI + BPSysAve + BPDiaAve +
               TotChol + PhysActive + Smoke100,
             data = train, family = binomial)

cat("\n--- Logistic Regression Summary ---\n")
print(summary(model))

cat("\n--- Odds Ratios ---\n")
print(round(exp(coef(model)), 3))

## 6. Predict on test set
pred_prob  <- predict(model, newdata = test, type = "response")
pred_class <- ifelse(pred_prob > 0.5, "Yes", "No")

## 7. Evaluate
accuracy <- mean(pred_class == test$Diabetes)
cat("\n--- Model Evaluation ---\n")
cat("Accuracy:", round(accuracy, 3), "\n")

cat("\nConfusion Matrix:\n")
print(table(Predicted = pred_class, Actual = test$Diabetes))
