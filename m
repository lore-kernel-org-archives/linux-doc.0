Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8190AC7EE26
	for <linux-doc@archiver.kernel.org>; Mon, 15 May 2023 05:51:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238677AbjEOFvP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 May 2023 01:51:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234967AbjEOFuW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 May 2023 01:50:22 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE79B2705
        for <linux-doc@vger.kernel.org>; Sun, 14 May 2023 22:50:04 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1aad6f2be8eso113683665ad.3
        for <linux-doc@vger.kernel.org>; Sun, 14 May 2023 22:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129804; x=1686721804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wcGbfhUP5NrwGCYl7Q1yL0FMzRdJBr1PIlnUSkktJs=;
        b=n/aiVJ2ZI/20dmw/nnIas4SmVxjrQZ4QoNuC10rt/EBsMYeY3s9rOAtcRswQ/rS0gj
         +YF3uZ3+BrCTAsb8/zas05gp3eHMHogoCDyF5CgphQCtWV7jDS0w6dAIyI/LOHIuFUD/
         66tP/o1kfQ8lwgIgmMGChYLD4QdvhYXxlgITerrPqiWqRvbQqD1j+FMl1+Z+T/R1rPbg
         biqO2FNrYffCTix/m9i9JkHtz7X1ewyYTYJ/wpngbMBRGNjNr/kfcPGXoWWvX02AFi5Z
         JZRL5gwnt9JqBz9jMuE4h8qnmO/g76/vz4OrXrBsX3Ex3DVowPdQK8yPfYn/rHP5EbLV
         lenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129804; x=1686721804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wcGbfhUP5NrwGCYl7Q1yL0FMzRdJBr1PIlnUSkktJs=;
        b=VgZZpX7uxiS020jqU18yVwEOHIHiLVtiE5SV/6u4dxxZzDESYpoSJX3p93MJsfJ8mj
         WoyWson9Gc7rH2+Yu4MtxK2ueEjpOWFowXSXOiahoSQYDL/HJX/lZYuAxyVEAky56Iue
         pGpVxSHgJBYAHWg1VjEbvghTxnK2k4gwMb3pjfiX0dLDvwD1Uz1u+aYFtIyLQQ7nOIW5
         /0hR460dpGllGSVTDT5KuzqETlET6/mdlIoxsPI31duTl/4rcF0k0zRPSe65241EqNgW
         FzdWVw5KR1cqQKTI7jziGBrLg2Qn1qQBZZOESiTJWun0YogU8mVkcX0AnAlT3NVEDe50
         RcVQ==
X-Gm-Message-State: AC+VfDyZQMErnqrlB5V6W4NBODVFxm4zarfF5bj1R3ZzBcJrLaEb4rF1
        LUXWDpzO78XEV356RdUjSkfj7BS6QC71Le90smo=
X-Google-Smtp-Source: ACHHUZ5G5pSurpLSfBqE/5dREIdQpF2iiBuall6PO0uWHa8iwPoH3QvLtzsBkdmMfKChnq/qafBiBQ==
X-Received: by 2002:a17:902:c1cd:b0:1ab:18ea:f922 with SMTP id c13-20020a170902c1cd00b001ab18eaf922mr32696313plc.52.1684129804048;
        Sun, 14 May 2023 22:50:04 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:50:03 -0700 (PDT)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        llvm@lists.linux.dev
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Weili Qian <qianweili@huawei.com>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Marc Zyngier <maz@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH V6 04/21] ACPI: tables: Print RINTC information when MADT is parsed
Date:   Mon, 15 May 2023 11:19:11 +0530
Message-Id: <20230515054928.2079268-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When MADT is parsed, print RINTC information as below:

ACPI: RISC-V INTC (acpi_uid[0x0000] hart_id[0x0] enabled)
ACPI: RISC-V INTC (acpi_uid[0x0001] hart_id[0x1] enabled)
...
ACPI: RISC-V INTC (acpi_uid[0x000f] hart_id[0xf] enabled)

This debug information will be very helpful during bring up.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/acpi/tables.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/acpi/tables.c b/drivers/acpi/tables.c
index 7b4680da57d7..8ab0a82b4da4 100644
--- a/drivers/acpi/tables.c
+++ b/drivers/acpi/tables.c
@@ -220,6 +220,16 @@ void acpi_table_print_madt_entry(struct acpi_subtable_header *header)
 		}
 		break;
 
+	case ACPI_MADT_TYPE_RINTC:
+		{
+			struct acpi_madt_rintc *p = (struct acpi_madt_rintc *)header;
+
+			pr_debug("RISC-V INTC (acpi_uid[0x%04x] hart_id[0x%llx] %s)\n",
+				 p->uid, p->hart_id,
+				 (p->flags & ACPI_MADT_ENABLED) ? "enabled" : "disabled");
+		}
+		break;
+
 	default:
 		pr_warn("Found unsupported MADT entry (type = 0x%x)\n",
 			header->type);
-- 
2.34.1

