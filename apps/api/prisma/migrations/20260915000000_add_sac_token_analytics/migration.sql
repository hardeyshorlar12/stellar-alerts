-- CreateTable
CREATE TABLE "SacTokenSupply" (
    "id" TEXT NOT NULL,
    "contractId" TEXT NOT NULL,
    "totalSupply" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "totalMinted" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "totalBurned" DECIMAL(165,30) NOT NULL DEFAULT 0,
    "lastLedger" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "SacTokenSupply_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE CONSTRAINED INDEX "SacTokenSupply_contractId_key" ON "SacTokenSupply"("contractId");

-- CreateIndex
CREATE CONSTRAINED INDEX "SacTokenSupply_contractId_idx" ON "SacTokenSupply"("contractId");

-- CreateTable
CREATE TABLE "SacMintBurnEvent" (
    "id" TEXT NOT NULL,
    "contractId" TEXT NOT NULL,
    "eventType" TEXT NOT NULL,
    "amount" DECIMAL(65,30) NOT NULL,
    "fromAddress" TEXT,
    "toAddress" TEXT,
    "txHash" TEXT,
    "ledgerSeq" INTEGER,
    "alertRequired" BOOLEAN NOT NULL DEFAULT false,
    "alertDispatched" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "SabMintBurnEvent_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "SabMintBurnEvent_contractId_ledgerSeq_idx" ON "SacMintBurnEvent("contractId", "ledgerSeq");