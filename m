Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02516C61DA4
	for <linux-doc@archiver.kernel.org>; Thu, 16 Feb 2023 18:21:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbjBPSVN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Feb 2023 13:21:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbjBPSVL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Feb 2023 13:21:11 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D90AD2A15A
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 10:21:01 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id k13so2979574plg.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 10:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3T/9WMqfcgE40kVyTz05I09P0F9v/Zdvsnucdf4/Z5g=;
        b=MBRj07iUrgHWwP/PL9m6AtLW+qb8U18eyO6/36bns9c6UoAOz2OzMnR2e4Cdh6Kv4c
         5U3H0CPnIrADmR9yLkbugn1hcLCwwqX07zxNNUuoWIr+c6fZODCF7wT2aZuT+AzlLvOa
         Q1ROw/0yRUOXRLx+2eqd2dsbqX+/BhpdhlpB5hqPlV9ELFw9Sc/nDaT/FlGczY596ewa
         V3OBgDoq6t1w7RJfsd72MzeoWGcwoO9R7yCsPe0OdQTxO/2T1f/tTd9iv2nhXTZPKIzc
         3dZUhwf3Fr6ueWe9wpMBUEMC2rqOMV0kbLLOHPkBfH84LyRg+JVQuMaOop0ElzXAP9ut
         jG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3T/9WMqfcgE40kVyTz05I09P0F9v/Zdvsnucdf4/Z5g=;
        b=X/LxFKJh0qyyLXvYTBKxtKVhCI1FXVNwb0t1wRJuGjddQY2c8tPr4mx5JBdhgX8A+4
         KTDh8X57yyBQgrOm7qmnnRGPTA9WRMsrc908BJQ2KwIc/ytKO/PrhXcWjImtD2/qiNM/
         G7/NTk2njKnV2+cS2jBPpzdt8m0zi0sUqC+9xobo+Ad8KXPqGbO0/rpJU6jPzFTuYSDQ
         66JNzgNgqd0GyNk4PI4AQ7uWsFCTR2J1PNwdeAGiX2ypYc/DnehuTSswVQZ3V/dNDYKg
         3LoVNdLyEeQjaAq9B1jcs2RrkveEb1aY8o2qyCaMo8DmcTF0frzwMnewwN/be9zttBgY
         DYcA==
X-Gm-Message-State: AO0yUKUNVvMui0eK4EQ1OcF90aaArMngYIYC89t+wvdmWYzNWN0Hil6u
        8DJCVTzmkLJzuD3swq02iRMadw==
X-Google-Smtp-Source: AK7set8o22c6x1/057iVtVepqFXyS1Iug9Z7IPjx7jh1+w4cPpbGWJMNy8wLXDEg7dW4snHpwIby/Q==
X-Received: by 2002:a05:6a20:8f07:b0:bc:7bdd:551b with SMTP id b7-20020a056a208f0700b000bc7bdd551bmr9022499pzk.45.1676571661568;
        Thu, 16 Feb 2023 10:21:01 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:21:01 -0800 (PST)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Robert Moore <robert.moore@intel.com>,
        acpica-devel@lists.linuxfoundation.org,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH V2 02/21] ACPICA: MADT: Add RISC-V INTC interrupt controller
Date:   Thu, 16 Feb 2023 23:50:24 +0530
Message-Id: <20230216182043.1946553-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The ECR to add RISC-V INTC interrupt controller is approved by
the UEFI forum and will be available in the next revision of
the ACPI specification.

This patch is not yet merged in ACPICA but a PR is raised.

ACPICA PR: https://github.com/acpica/acpica/pull/804
Reference: Mantis ID: 2348

Cc: Robert Moore <robert.moore@intel.com>
Cc: acpica-devel@lists.linuxfoundation.org
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 include/acpi/actbl2.h | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/include/acpi/actbl2.h b/include/acpi/actbl2.h
index b2973dbe37ee..abb700d246df 100644
--- a/include/acpi/actbl2.h
+++ b/include/acpi/actbl2.h
@@ -891,7 +891,8 @@ enum acpi_madt_type {
 	ACPI_MADT_TYPE_MSI_PIC = 21,
 	ACPI_MADT_TYPE_BIO_PIC = 22,
 	ACPI_MADT_TYPE_LPC_PIC = 23,
-	ACPI_MADT_TYPE_RESERVED = 24,	/* 24 to 0x7F are reserved */
+	ACPI_MADT_TYPE_RINTC = 24,
+	ACPI_MADT_TYPE_RESERVED = 25,   /* 25 to 0x7F are reserved */
 	ACPI_MADT_TYPE_OEM_RESERVED = 0x80	/* 0x80 to 0xFF are reserved for OEM use */
 };
 
@@ -1250,6 +1251,24 @@ enum acpi_madt_lpc_pic_version {
 	ACPI_MADT_LPC_PIC_VERSION_RESERVED = 2	/* 2 and greater are reserved */
 };
 
+/* 24: RISC-V INTC */
+struct acpi_madt_rintc {
+	struct acpi_subtable_header header;
+	u8 version;
+	u8 reserved;
+	u32 flags;
+	u64 hart_id;
+	u32 uid;  /* ACPI processor UID */
+};
+
+/* Values for RISC-V INTC Version field above */
+
+enum acpi_madt_rintc_version {
+	ACPI_MADT_RINTC_VERSION_NONE       = 0,
+	ACPI_MADT_RINTC_VERSION_V1         = 1,
+	ACPI_MADT_RINTC_VERSION_RESERVED   = 2	/* 2 and greater are reserved */
+};
+
 /* 80: OEM data */
 
 struct acpi_madt_oem_data {
-- 
2.34.1

