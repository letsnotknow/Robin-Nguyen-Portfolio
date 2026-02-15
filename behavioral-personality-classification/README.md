# Predicting Personality Type Using Behavioral Data

## Overview

This project builds a machine learning classification model to predict whether an individual is an **Introvert or Extrovert** based on behavioral and social indicators.

The project demonstrates a complete end-to-end data science workflow, including:

- Data cleaning and preprocessing  
- Exploratory Data Analysis (EDA)  
- Feature engineering  
- Model training  
- Model evaluation  
- Model explainability using SHAP  

Although framed around personality classification, this project reflects real-world applications such as:

- Customer segmentation  
- User behavior analysis  
- Marketing targeting  
- Social engagement prediction  
- Behavioral analytics  

---

## Business Framing

Organizations often need to understand behavioral patterns in users or customers to:

- Personalize experiences  
- Predict engagement levels  
- Improve retention strategies  
- Optimize marketing campaigns  

This project simulates how behavioral data can be used to classify user types and uncover key predictive drivers behind those classifications.

---

## Dataset

- ~2,900 observations  
- 9 behavioral features  
- Target variable: `Personality` (Introvert / Extrovert)

### Key Features

- `Time_spent_Alone`
- `Social_event_attendance`
- `Going_outside`
- `Friends_circle_size`
- `Post_frequency`
- `Drained_after_socializing`
- `Stage_fear`

Missing values were handled using imputation techniques.

---

## 🧹 Data Preprocessing

The following preprocessing steps were performed:

- Handling missing values using `SimpleImputer`
- Checking and removing duplicates
- Separating numerical and categorical features
- Encoding categorical variables
- Data validation and cleaning

---

## Exploratory Data Analysis (EDA)

EDA included:

- Distribution plots
- Behavioral frequency comparisons
- Count plots
- Summary statistics

### Key Insights

- Individuals who spend more time alone tend to lean toward introversion.
- Larger friend circles and higher social event attendance correlate with extroversion.
- Feeling drained after socializing is a strong predictive indicator of introversion.

---

## Modeling Approach

The project includes:

- Train-test split
- Supervised classification modeling
- Model performance evaluation
- Feature importance analysis

### Evaluation Metrics

- Accuracy
- Confusion Matrix
- Precision & Recall
- Classification Report

---

## Model Explainability (SHAP)

SHAP (SHapley Additive Explanations) was used to:

- Identify the most influential features
- Understand individual prediction drivers
- Provide transparent and interpretable model insights

This demonstrates the ability to go beyond black-box modeling and deliver explainable AI solutions.

---

## Tech Stack

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Scikit-learn
- SHAP

---

## Results

The final model achieved strong classification performance.

### Most Influential Features

- Time spent alone
- Social event attendance
- Feeling drained after socializing
- Friends circle size

SHAP analysis validated that behavioral intensity plays a significant role in determining personality classification.

---

## 🚀 How to Run This Project

```bash
# Clone repository
git clone https://github.com/yourusername/behavioral-personality-classification.git

# Navigate to folder
cd behavioral-personality-classification

# Install dependencies
pip install -r requirements.txt

# Run notebook
jupyter notebook
