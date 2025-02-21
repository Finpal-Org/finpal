import { initializeApp } from "firebase/app";
import {
  getAuth,
  GoogleAuthProvider,
  signInWithPopup,
  onAuthStateChanged,
  createUserWithEmailAndPassword,
  signInWithEmailAndPassword,
  signInWithPhoneNumber,
  signOut,
  updateProfile,
} from "firebase/auth";

const firebaseConfig = {
  apiKey: "AIzaSyAeSN-aBItuUN21fnbsklwdNrMCMNjWjJE",
  authDomain: "finpal-5d6e8.firebaseapp.com",
  projectId: "finpal-5d6e8",
  storageBucket: "finpal-5d6e8.firebasestorage.app",
  messagingSenderId: "446406693977",
  appId: "1:446406693977:web:517d41f2c0e7a0cf880d48",
  measurementId: "G-0N6KLHTSQZ",
};

// Initialize Firebase
const app = initializeApp(firebaseConfig); //configs
const auth = getAuth(app); //auth

//user details
const emailInput: HTMLInputElement = document.getElementById(
  "email",
) as HTMLInputElement; //todo ts why string isnt viable?
const passwordInput: HTMLInputElement = document.getElementById(
  "password",
) as HTMLInputElement;

//Auth Buttons
const signUpButton = document.getElementById("signUpButton");
const signInButton = document.getElementById("signInButton");

const signUpWithGoogle = document.getElementById("signUpWithGoogle");

const signOutButton = document.getElementById("signOutButton");

//Providers
const googleProvider = new GoogleAuthProvider();

const emailDisplayName: string = "";
// Helper function to show error messages

//on SignUp With Google Click
if (signUpWithGoogle) {
  signUpWithGoogle.addEventListener("click", async (e) => {
    e.preventDefault();
    try {
      await signInWithPopup(auth, googleProvider);
      console.log("signed in with Google!");
      //redirect to home page
      window.location.href = "/index.html";
    } catch (err) {
      console.log("Error signing in with Google", err);
    }
  });
}
// on SignUp with email And password click
if (signUpButton) {
  signUpButton.addEventListener("click", async (e) => {
    e.preventDefault();
    try {
      if (emailInput && passwordInput) {
        const email = (emailInput as HTMLInputElement).value;
        const password = (passwordInput as HTMLInputElement).value;

        await createUserWithEmailAndPassword(auth, email, password);

        if (auth.currentUser) {
          await updateProfile(auth.currentUser, {
            // get username side of email
            displayName: email.split("@")[0],
          });
        }

        console.log("signed Up with email and password Success");
        //redirect to home page todo
        window.location.href = "/index.html";
      }
    } catch (err) {
      console.log("Error signing Up with email and password", err);
    }
  });
}
if (signInButton) {
  //will not be clicked unless valid
  signInButton.addEventListener("click", async (e) => {
    e.preventDefault();
    try {
      if (emailInput && passwordInput) {
        const email = (emailInput as HTMLInputElement).value;
        const password = (passwordInput as HTMLInputElement).value;

        await signInWithEmailAndPassword(auth, email, password);

        if (auth.currentUser) {
          // set displayName customized
          await updateProfile(auth.currentUser, {
            // get username side of email
            displayName: email.split("@")[0],
          });
        }

        console.log("signed in with email and password Success");
        //redirect to home page todo
        window.location.href = "/index.html";
      }
    } catch (err) {
      console.log("Error signing in with email and password", err);
    }
  });
}

//on SignOut Click
if (signOutButton) {
  //oneventlisten "click"
  signOutButton.addEventListener("click", async (e) => {
    e.preventDefault();
    try {
      await signOut(auth);

      window.location.href = "/index.html";

      console.log("Sign out success!");
    } catch (err) {
      console.log("Error signing out", err);
    }
  });
}

//fetch user info
onAuthStateChanged(auth, (user) => {
  //fire auth user name
  const displayName: string =
    user?.displayName || emailDisplayName.split("@")[0] || "Guest"; //get all chars untill @ sign

  //username element in html
  const userNameElement = document.getElementById("userName");

  if (userNameElement) {
    //inside sidebar
    console.log("displayed name is ", displayName);
    return (userNameElement.innerText = `Welcome, ${displayName}`);
  }
});
