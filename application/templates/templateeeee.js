
// Fonction pour stocker le userId dans le local storage
function saveUserIdToLocalStorage(userId) {
    localStorage.setItem('userId', userId);
}

// Fonction pour récupérer le userId du local storage
function getUserIdFromLocalStorage() {
    return localStorage.getItem('userId') || 'defaultValue';
}

// // Fonction pour vérifier ou créer un userId et le stocker dans localStorage
// function checkOrCreateUserId() {
//     let userId = localStorage.getItem('userId');
//     if (!userId) {
//         userId = generateUUID();
//         localStorage.setItem('userId', userId);
//     }
//     return userId;
// }
//
// // Appeler cette fonction au chargement de votre application web
// const userId = checkOrCreateUserId();
// console.log("UserID:", userId);
//
