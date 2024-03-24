String getGenderURL(String input) {
  if (input.toUpperCase() == 'MALE') {
    return 'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg';
  } else if (input.toUpperCase() == 'FEMALE') {
    return 'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436180.jpg';
  } else {
    // Handle invalid input
    return 'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg';
  }
}