import { expect, type Page } from '@playwright/test';

export class LoansPage {
  constructor(private readonly page: Page) {}

  async signInAsAdmin(email: string): Promise<void> {
    await this.page.goto('/');
    await this.page.getByRole('radio', { name: /Curso 2/ }).check();
    await this.page.getByRole('button', { name: 'Continuar' }).click();
    await this.page.getByLabel('Email').fill(email);
    await this.page.getByRole('button', { name: 'Ingresar' }).click();
    await expect(this.page.getByRole('heading', { name: /Bienvenido/ })).toBeVisible();
  }

  async openLoan(id: number): Promise<void> {
    await this.page.getByRole('link', { name: 'Préstamos' }).first().click();
    await this.page.getByRole('link', { name: String(id), exact: true }).click();
    await expect(this.page.getByRole('heading', { name: `Préstamo N° ${id}` })).toBeVisible();
  }

  async expectOutstandingBalanceAndNextInstallment(balance: string): Promise<void> {
    await expect(this.page.getByText('Saldo pendiente', { exact: true })).toBeVisible();
    await expect(this.page.getByText(balance, { exact: true })).toBeVisible();

    const nextInstallment = this.page.getByTestId('v2-prestamos-cuotas-row-6');
    await expect(nextInstallment).toContainText('Pendiente');
  }
}
