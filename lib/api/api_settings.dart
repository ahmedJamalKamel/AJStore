
class ApiSettings
{
  static const _baseUrl = "https://smart-store.mr-dev.tech/";
  static const _apiUrl = _baseUrl + "api/";
  static const register = _apiUrl + 'auth/register';
  static const login = _apiUrl + 'auth/login';
  static const logout = _apiUrl + 'auth/logout';

  static const forgetPassword = _apiUrl + 'auth/forget-password';
  static const resetPassword = _apiUrl + 'auth/reset-password';
  static const changePassword = _apiUrl + 'auth/change-password';
  static const activatePhone = _apiUrl + 'auth/activate';
  static const storeApiKey="d8ecf007-bdbf-4836-8568-101c98a1b048";
  static const categories= _apiUrl +'categories';
  static const home= _apiUrl +'home';
  static const cities= _apiUrl +'cities';
  static const categoriesSup= _apiUrl +'categories/';
  static const product= _apiUrl +'sub-categories/';
  static const productDetales= _apiUrl +'products/';
  static const favoriteProducts= _apiUrl +'favorite-products';
  static const updateProfile= _apiUrl +'auth/update-profile';
  static const contactRequests= _apiUrl +'contact-requests';
  static const faqs= _apiUrl +'faqs';
  static const productsRate= _apiUrl +'products/rate';
  //// setting for payment
  static const addresses= _apiUrl +'addresses';
  static const addressesDel= _apiUrl +'addresses/';
  static const paymentcards= _apiUrl +'payment-cards/';
  static const orders= _apiUrl +'orders';


}