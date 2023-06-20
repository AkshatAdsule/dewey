
DROP POLICY "Public profiles are viewable by everyone." ON "public"."profiles";
DROP POLICY "Users can insert their own profile." ON "public"."profiles";
DROP POLICY "Users can update own profile." ON "public"."profiles";
ALTER TABLE "public"."profiles" DROP CONSTRAINT "profiles_id_fkey";
ALTER TABLE "public"."profiles" DROP CONSTRAINT "profiles_username_key";
ALTER TABLE "public"."profiles" DROP CONSTRAINT "username_length";
ALTER TABLE "public"."profiles" DROP CONSTRAINT "profiles_pkey";
DROP INDEX IF EXISTS "public"."profiles_pkey";
DROP INDEX IF EXISTS "public"."profiles_username_key";
DROP TABLE "public"."profiles";