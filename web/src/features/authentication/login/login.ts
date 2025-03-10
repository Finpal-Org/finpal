document.addEventListener("DOMContentLoaded", function () {
  const loginForm = document.getElementById("loginForm") as HTMLFormElement;
  const emailInput = document.getElementById("email") as HTMLInputElement;
  const passwordInput = document.getElementById("password") as HTMLInputElement;

  // Create error message containers
  const createErrorContainer = (inputElement: HTMLInputElement) => {
    const container = document.createElement("div");
    container.className = "text-red-500 text-sm mt-1";
    inputElement.parentNode?.appendChild(container);
    return container;
  };

  const emailError = createErrorContainer(emailInput as HTMLInputElement);
  const passwordError = createErrorContainer(passwordInput as HTMLInputElement);

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
    if (password.length < 6) {
      passwordError.textContent = "Password must be at least 6 characters";
      return false;
    }
    passwordError.textContent = "";
    return true;
  };

  // Real-time validation
  emailInput?.addEventListener("input", () => {
    validateEmail(emailInput.value);
  });

  passwordInput?.addEventListener("input", () => {
    validatePassword(passwordInput.value);
  });

  // Form submission
  loginForm?.addEventListener("submit", function (e) {
    e.preventDefault();

    const isEmailValid = validateEmail(emailInput.value);
    const isPasswordValid = validatePassword(passwordInput.value);

    if (isEmailValid && isPasswordValid) {
      // Proceed with login
      console.log("Form is valid, proceeding with login");
      // Add your login API call or further processing here
    }
  });
});
