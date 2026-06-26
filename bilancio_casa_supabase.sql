-- ============================================================
-- BILANCIO DI CASA — tabella unica con stato condiviso (JSONB)
-- Da eseguire in Supabase: SQL Editor > New query > Run
-- ============================================================

create table if not exists bilancio_casa (
  id          text primary key,
  dati        jsonb not null default '{}'::jsonb,
  updated_at  timestamptz not null default now()
);

-- Regola costituzionale: RLS disabilitato sulle nuove tabelle
alter table bilancio_casa disable row level security;

-- Abilita il realtime (la sincronizzazione live tra dispositivi)
alter publication supabase_realtime add table bilancio_casa;
