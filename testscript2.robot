import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.support.ui.ExpectedConditions;
import java.time.Duration;
import org.testng.annotations.*;
import org.testng.Assert;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.nio.file.Paths;
import java.util.UUID;

public class TS0002 {
    public static WebDriver driver;
    public static WebDriverWait wait;
    private static final int WAIT_TIMEOUT_SECONDS = 15;

    @BeforeSuite
    public void suiteSetUp() {
        try {
            // Default ChromeDriver setup (backward compatible)
            ChromeOptions options = new ChromeOptions();
            options.addArguments("--headless");
            options.addArguments("--no-sandbox");
            options.addArguments("--disable-dev-shm-usage");
            options.addArguments("--disable-gpu");
            options.addArguments("--disable-software-rasterizer");
            options.addArguments("--no-first-run");
            options.addArguments("--disable-extensions");
            options.addArguments("--disable-web-security");
            options.addArguments("--allow-running-insecure-content");
            options.addArguments("--remote-debugging-port=0");
            options.addArguments("--user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36");

            String uniqueProfile = "/tmp/chrome_" + java.util.UUID.randomUUID().toString().replace("-", "");
            options.addArguments("--user-data-dir=" + uniqueProfile);

            driver = new ChromeDriver(options);
            driver.manage().window().maximize();
            wait = new WebDriverWait(driver, Duration.ofSeconds(5));
        } catch (Exception e) {
            System.err.println("Suite setup failed: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
    }

    @Test(timeOut = 120000)
    public void tS0002() {
        try {
            if (wait == null && driver != null) {
                wait = new WebDriverWait(driver, Duration.ofSeconds(WAIT_TIMEOUT_SECONDS));
            }
            driver.manage().window().setSize(new org.openqa.selenium.Dimension(1920, 1080));
            driver.get("https://practicetestautomation.com/");
            wait.until(ExpectedConditions.urlContains("practicetestautomation.com"));
            Assert.assertTrue(driver.getCurrentUrl().contains("practicetestautomation.com"), "Expected URL to contain practicetestautomation.com");
            WebElement element1 = wait.until(ExpectedConditions.elementToBeClickable(By.linkText("Blog")));
            element1.click();
            Assert.assertTrue(wait.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("Blog"))).isDisplayed());
            driver.get("https://practicetestautomation.com/blog/");
            wait.until(ExpectedConditions.urlContains("/blog/"));
            Assert.assertTrue(driver.getCurrentUrl().contains("/blog/"), "Expected URL to contain /blog/");
            WebElement element2 = wait.until(ExpectedConditions.elementToBeClickable(By.linkText("Contact")));
            element2.click();
            Assert.assertTrue(wait.until(ExpectedConditions.visibilityOfElementLocated(By.linkText("Contact"))).isDisplayed());
            driver.get("https://practicetestautomation.com/contact/");
            wait.until(ExpectedConditions.urlContains("/contact/"));
            Assert.assertTrue(driver.getCurrentUrl().contains("/contact/"), "Expected URL to contain /contact/");
            WebElement element3 = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("wpforms-161-field_0-last")));
            element3.clear();
            element3.sendKeys("heloo");
            WebElement element4 = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("wpforms-161-field_0")));
            element4.clear();
            element4.sendKeys("hi");
            WebElement element5 = wait.until(ExpectedConditions.visibilityOfElementLocated(By.id("wpforms-161-field_1")));
            element5.clear();
            element5.sendKeys("jjakakaa");
            System.out.println("Test script 1 completed successfully!");
        } catch (Exception e) {
            System.err.println("Test script 1 failed: " + e.getMessage());
            e.printStackTrace();
            takeScreenshot();
            Assert.fail("Test script 1 failed: " + e.getMessage());
        }
    }

    @AfterSuite
    public void suiteTearDown() {
        try {
            // Default teardown (screenshot + quit)
            if (driver != null) {
                try {
                    TakesScreenshot screenshot = (TakesScreenshot) driver;
                    byte[] screenshotBytes = screenshot.getScreenshotAs(OutputType.BYTES);
                    String screenshotPath = "/tmp/screenshot_" + System.currentTimeMillis() + ".png";
                    java.nio.file.Files.write(java.nio.file.Paths.get(screenshotPath), screenshotBytes);
                    System.out.println("Screenshot saved: " + screenshotPath);
                } catch (Exception e) {
                    System.err.println("Failed to capture screenshot: " + e.getMessage());
                }
                driver.quit();
            }
        } catch (Exception e) {
            System.err.println("Suite teardown failed: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static void takeScreenshot() {
        try {
            if (driver instanceof TakesScreenshot) {
                File screenshot = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);
                String timestamp = String.valueOf(System.currentTimeMillis());
                String tempDir = System.getProperty("java.io.tmpdir");
                File destFile = new File(tempDir, "selenium-screenshot-" + timestamp + ".png");
                Files.copy(screenshot.toPath(), destFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
                System.err.println("Screenshot saved: " + destFile.getAbsolutePath());
            }
        } catch (IOException ex) {
            System.err.println("Failed to capture screenshot: " + ex.getMessage());
        }
    }
}