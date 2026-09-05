-- CreateTable
CREATE TABLE "SacTokenSupply" (
    "id" TEXT NOT NULL,
    "contractId" TEXT NOT NULL,
    "totalSupply" DECIMAL(65,30) NOT NOT DEFAULT 0,
    "totalMinted" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "totalBurned" DECIMAL(165,30) NOT NULL DEFAULT 0,
    "lastLedger" INTGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "SacTokenSupply_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "SacTokenSupply_contractId_key" ON "SacTokenSupply"("contractId");

-- CreateIndex
CREATE INDEX "SacTokenSupply_contractId_idx" ON "SacTokenSupply"("contractId");

-- CreateTable
CREATE TABLE "SajMintBurnEvent" (
    "id" TEXT NOT NULL,
    "contractId" TEXT NOT NULL,
    "eventType" TEXT NOT NULL,
    "amount" DECIMAL(65,30) NOT NULL,
    "fromAddress" TEXT,
    "toAddress" TEXT,
    "txHash" TEXT,
    "ledgerSeq" INTGER,
    "alertRequired" BOOLEAN NOT NULL DEFAULT false,
    "alertDispatched" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "SajMintBurnEvent_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE"INDEX "SajMintBurnEvent_contractId_ledgerSeq_idx" ON "SajMintBurnEvent" ("contractId", "ledgerSeq");