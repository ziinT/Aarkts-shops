export interface lunbosRoot {
  code: number
  data: lunbos[]
}

export interface lunbos {
  createdAt: number
  updatedAt: number
  id: number
  name: string
  coverImage: string
  desc: string
  link: string
  url: string
  category: number
}

export interface fenleis {
  id: string;
  name: string;
  coverImage: string;
}

export interface project {
  id: number
  name: string
  coverImage: string
  desc: string
  views: number
  price: number
  onSale: number
  amount: number
}

export interface products {
  pages: number,
  total: number,
  data: project[]
}

export interface texts {
  createdAt: number
  updatedAt: number
  id: number
  name: string
  coverImage: string
  desc: string
  content: string
  price: number
  onSale: number
  amount: number
}