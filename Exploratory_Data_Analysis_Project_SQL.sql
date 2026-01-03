-- Exploratory Data Analysis

Select * 
From layoffs_staging2;

Select MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

Select * 
From layoffs_staging2
WHERE percentage_laid_off = 1;

SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

Select SUBSTRING(`date`, 1, 7) as `Month`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) is not null
GROUP BY `Month`
ORDER BY 1 ASC;

WITH Rolling_Total AS
(
Select SUBSTRING(`date`, 1, 7) as `Month`, SUM(total_laid_off) as total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) is not null
GROUP BY `Month`
ORDER BY 1 ASC
)
Select `Month`, total_off, SUM(total_off) OVER(ORDER BY `Month`) As rolling_total
From Rolling_Total; # Rolling total of number of people laid off by month

Select company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company 
ORDER BY 2 DESC;

Select company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC;

WITH Company_Year (company, years, total_laid_off) AS
(
Select company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
), 
Company_Year_Rank AS 
(Select *, DENSE_RANK() OVER (partition by years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
)
Select * 
FROM Company_Year_Rank
WHERE Ranking <= 5; # Top 5 Companies per year who laid off the most employees

