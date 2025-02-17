import { initializeApp } from 'firebase/app';
import {
  getAuth,
  GoogleAuthProvider,
  signInWithPopup,
  onAuthStateChanged,
  signInWithEmailAndPassword,
  signOut,
} from 'firebase/auth';

const firebaseConfig = {
  apiKey: 'AIzaSyAeSN-aBItuUN21fnbsklwdNrMCMNjWjJE',
  authDomain: 'finpal-5d6e8.firebaseapp.com',
  projectId: 'finpal-5d6e8',
  storageBucket: 'finpal-5d6e8.firebasestorage.app',
  messagingSenderId: '446406693977',
  appId: '1:446406693977:web:517d41f2c0e7a0cf880d48',
  measurementId: 'G-0N6KLHTSQZ',
};

// Initialize Firebase
const app = initializeApp(firebaseConfig); //configs
const auth = getAuth(app); //auth

//user details
const emailInput = document.getElementById('emailAuth'); //todo ts why string isnt viable?
const passwordInput = document.getElementById('passwordAuth');

//Auth Buttons
const signUpButton = document.getElementById('signUpButton');
const signInButton = document.getElementById('signInButton');

const signUpWithGoogle = document.getElementById('signUpWithGoogle');
const signOutButton = document.getElementById('signOutButton');

//Providers
const googleProvider = new GoogleAuthProvider();

// Helper function to show error messages

//on SignUp With Google Click
if (signUpWithGoogle) {
  signUpWithGoogle.addEventListener('click', async () => {
    try {
      await signInWithPopup(auth, googleProvider);
      console.log('signed in with Google!');
      //redirect to home page
      // window.location.href = '/index.html';
    } catch (err) {
      console.log('Error signing in with Google', err);
    }
  });
}
// on SignUp with email&password click
if (signUpButton) {
  signUpButton.addEventListener('click', () => {
    try {
      if (emailInput && passwordInput) {
        const email = (emailInput as HTMLInputElement).value;
        const password = (passwordInput as HTMLInputElement).value;

        signInWithEmailAndPassword(auth, email, password);
        console.log('signed in with email and password Success');
        //redirect to home page todo
        //display name?
      }
    } catch (err) {
      console.log('Error signing in with email and password', err);
    }
  });
}
if (signInButton) {
  //will not be clicked unless valid
  signInButton.addEventListener('click', () => {
    try {
      const email = (emailInput as HTMLInputElement).value;
      const password = (passwordInput as HTMLInputElement).value;
      signInWithEmailAndPassword(auth, email, password);
      console.log('signed in with email and password Success');
      //redirect to home page todo
      //display name?
    } catch (err) {
      console.log('Error signing in with email and password', err);
    }
  });
}

//on SignOut Click
if (signOutButton) {
}

// Handle Sign Up with Email/Password

//Email Password Sign In

//fetch user info
onAuthStateChanged(auth, (user) => {});
