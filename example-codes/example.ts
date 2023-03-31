// @ts-nocheck



// 这是一段 TypeScript 代码
import { User } from './models/user';

export const getUserDisplayName = (user: User): string => {
  switch (user.type) {
    case 'superadmin':
      return `${user.firstName} ${user.lastName} (Super Admin)`;
    case 'admin':
      return `${user.firstName} ${user.lastName} (Admin)`;
    default:
      return `${user.firstName} ${user.lastName}`;
  }
};

export const fetchUsers = async (): Promise<User[]> => {
  const response = await fetch('/api/users');
  const json = await response.json();
  return json.map((userdata) => ({
    id: userdata.id,
    firstName: userdata.firstName,
    lastName: userdata.lastName,
    type: userdata.type as UserType,
  }));
};

type UserType = 'user' | 'admin' | 'superadmin';



