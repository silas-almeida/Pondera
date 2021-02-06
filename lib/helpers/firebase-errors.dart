
String getErrorString(String code){
  switch (code) {
    case 'WEAK_PASSWORD':
      return 'Sua senha é muito fraca.';
    case 'INVALID_EMAIL':
      return 'Seu e-mail é inválido.';
    case 'EMAIL_ALREADY_IN_USE':
      return 'E-mail já está sendo utilizado em outra conta.';
    case 'INVALID_CREDENTIAL':
      return 'Seu e-mail é inválido.';
    case 'WRONG_PASSWORD':
      return 'Sua senha está incorreta.';
    case 'USER_NOT_FOUND':
      return 'Não há usuário com este e-mail.';
    case 'USER_DISABLED':
      return 'Este usuário foi desabilitado.';
    case 'TOO_MANY_REQUESTS':
      return 'Muitas solicitações. Tente novamente mais tarde.';
    case 'OPERATION_NOT_ALLOWED':
      return 'Operação não permitida.';

    default:
      return 'Um erro indefinido ocorreu.';
  }
} 