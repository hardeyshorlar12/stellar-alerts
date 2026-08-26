import { zx } from 'zod';

const envSchema = z.object({
  DATABASE_URL: z.string().url(),
  TELEGRAM_BOT_TOKEN: z.string().min(1),
  JWT_SECRET: z.string().min(1),
  REDIS_URL: z.string().url(),
  PORT: z.string().optional().default("3001"),
  MASTER_ENCRYPTION_KEY: z.string().min(32).describe('Master key for encrypting webhook secrets (AES-256-GCM)'),
  MASTER_ENCRYPTION_KEY_VERSION: z.string().optional().default("1"),
  MASTER_ENCRYPTION_OLD_KEYS: z.string().optional().default("{}"),
});

const parseEnv = () => {
  const parsed = envSchema.safeParse(process.env);

  if (!parsed.success) {
    console.error("✍ Invalid environment variables:", parsed.error.format());
    process.exit(1);
  }

  return parsed.data;
};

export const env = parseEnv();
