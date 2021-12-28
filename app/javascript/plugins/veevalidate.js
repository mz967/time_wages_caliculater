import Vue from 'vue'

import {
  ValidationProvider,
  ValidationObserver,
  extend
} from 'vee-validate'

import {
  email,
  required,
  numeric,
  // integer,
  // min_value
} from 'vee-validate/dist/rules';

Vue.component('ValidationObserver', ValidationObserver)
Vue.component('ValidationProvider', ValidationProvider)

extend('email', {
  ...email,
  message: '{_field_}の形式で入力してください。'
});

extend('required', {
  ...required,
  message: '{_field_}を入力してください。'
});

extend('numeric', {
  ...numeric,
  message: '{_field_}は整数以外は登録できません(小数・マイナスは不可)。'
});

// extend('integer', {
//   ...integer,
//   message: '{_field_}は整数以外は登録できません(テキスト・小数・マイナスは不可)。'
// });

// extend('min_value', {
//   ...min_value,
//   message: '{_field_}は整数以外は登録できません(テキスト・小数・マイナスは不可)。'
// });

extend('min', {
  validate(value, { length }) {
    return value.length >= length;
  },
  params: ['length'],
  message: '{_field_}は{length}文字以上で入力してください'
});

extend('max', {
  validate(value, { length }) {
    return value.length <= length;
  },
  params: ['length'],
  message: '{_field_}は{length}文字以下で入力してください'
});

extend('password_confirmed', {
  params: ['target'],
  validate(value, { target }) {
    return value === target;
  },
  message: 'パスワードと一致しません'
});
