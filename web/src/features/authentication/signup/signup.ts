// Validation
document.addEventListener("DOMContentLoaded", function () {
  const signupForm = document.getElementById("signupForm") as HTMLFormElement;
  const emailInput = document.getElementById("email") as HTMLInputElement;
  const passwordInput = document.getElementById("password") as HTMLInputElement;
  const confirmPasswordInput = document.getElementById(
    "confirmPassword",
  ) as HTMLInputElement;

  // Create error message containers
  const createErrorContainer = (inputElement: HTMLInputElement) => {
    const container = document.createElement("div");
    container.className = "text-red-500 text-sm mt-1";
    inputElement.parentNode?.appendChild(container);
    return container;
  };

  const emailError = createErrorContainer(emailInput as HTMLInputElement);
  const passwordError = createErrorContainer(passwordInput as HTMLInputElement);
  const confirmPasswordError = createErrorContainer(
    confirmPasswordInput as HTMLInputElement,
  );

  // Validation functions
  const validateEmail = (email: string) => {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!email) {
      emailError.textContent = "Email is required";
      return false;
    }
    if (!emailRegex.test(email)) {
      emailError.textContent = "Please enter a valid email address";
      return false;
    }
    emailError.textContent = "";
    return true;
  };

  const validatePassword = (password: string) => {
    if (!password) {
      passwordError.textContent = "Password is required";
      return false;
    }
    if (password.length < 8) {
      passwordError.textContent = "Password must be at least 8 characters";
      return false;
    }
    if (!/[A-Z]/.test(password)) {
      passwordError.textContent =
        "Password must contain at least one uppercase letter";
      return false;
    }
    if (!/[a-z]/.test(password)) {
      passwordError.textContent =
        "Password must contain at least one lowercase letter";
      return false;
    }
    if (!/[0-9]/.test(password)) {
      passwordError.textContent = "Password must contain at least one number";
      return false;
    }
    passwordError.textContent = "";
    return true;
  };

  const validateConfirmPassword = (confirmPassword: string) => {
    if (!confirmPassword) {
      confirmPasswordError.textContent = "Please confirm your password";
      return false;
    }
    if (confirmPassword !== passwordInput.value) {
      confirmPasswordError.textContent = "Passwords do not match";
      return false;
    }
    confirmPasswordError.textContent = "";
    return true;
  };

  // Real-time validation
  emailInput.addEventListener("input", () => {
    validateEmail(emailInput.value);
  });

  passwordInput.addEventListener("input", () => {
    validatePassword(passwordInput.value);
    if (confirmPasswordInput.value) {
      validateConfirmPassword(confirmPasswordInput.value);
    }
  });

  confirmPasswordInput.addEventListener("input", () => {
    validateConfirmPassword(confirmPasswordInput.value);
  });

  // Form submission
  signupForm.addEventListener("submit", function (e) {
    e.preventDefault();

    const isEmailValid = validateEmail(emailInput.value);
    const isPasswordValid = validatePassword(passwordInput.value);
    const isConfirmPasswordValid = validateConfirmPassword(
      confirmPasswordInput.value,
    );

    if (isEmailValid && isPasswordValid && isConfirmPasswordValid) {
      // Proceed with signup
      console.log("Form is valid, proceeding with signup");
      // Add your signup API call or further processing here
    }
  });
});
