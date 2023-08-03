Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F99C001DB
	for <linux-doc@archiver.kernel.org>; Thu,  3 Aug 2023 18:03:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232476AbjHCSDR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Aug 2023 14:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231493AbjHCSCf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Aug 2023 14:02:35 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66CA84C06
        for <linux-doc@vger.kernel.org>; Thu,  3 Aug 2023 11:01:38 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-686daaa5f1fso893867b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 03 Aug 2023 11:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691085694; x=1691690494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95yH1ZRY1l5+vMULtm7DKGPnoBqPk/7PEb2F1bhVxfo=;
        b=V2wPisBDGbePHms2A4risrsDPrMUWBaceOkrdFeRUdqmk8sYzA5KDWJo5ROYiF0CjX
         Z74IQMZ1avQxf45hCxGVP3uqUF/sUXX9QWVu+q4wSB19tXd6YUul2EoHn+erVyy3sXpW
         Jwz/h2pkxAshzi43we+dfVrIdTOcl++Q/N4ri/20PthUznYPeIaLZpuiw1cnyJwnvSDM
         pcI9H5/RIULmGhhKhSoYJUA3vVFvfyjZhhZxhPigphk2shP6Errk5T1R3GEjLQvcK1W+
         BuCSuJIxsNVj9LrjOIwPOA0PDc0afRT+ExMZ+FldLPxVOWhYHGBeKMhWgQmR5Pe/ln4m
         1JKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085694; x=1691690494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95yH1ZRY1l5+vMULtm7DKGPnoBqPk/7PEb2F1bhVxfo=;
        b=BS2c/Nn/GjgY+zwZB2y/yQ064QGnA7zbT+B13E3R9s/A1K1LciZaGFQkXvvlwagZ66
         ufyM6oi/+FvzuX5oWAiGQNswigx6RLS75L4KHniq1dt47Wf+VhSNzdpuvvy1+4iHIzmi
         BUlVuTDD1PVtJIyxgEAkSeeb5P+BhW+6km5PDtBwnoz1DFIWpI3+Fq+r8g1kAfXvwqCT
         KOLgoWpZbs0Q69b48t+FbYDmKCo0ePL+I5dVmNP6Y+fNWhWCqQSnY5m5SkQ+uWDxusC2
         iexP8MabHr17ELcPDo0Eu1jCnkwmxIAv2gZ8u2lAhGSOHna50I9+i6uGnkvhNEyX2YHu
         lxOg==
X-Gm-Message-State: ABy/qLZ2VAKuw9HvP65V03JxwilW9FuID2VEhzHNGU7h/9iR6oK2ZIbr
        dvySbhuzwk5uSxr6nVQDGT3DGfZxprLSOF7btQY=
X-Google-Smtp-Source: APBJJlGnVuM193+CpDLoy7mFWMwR938XQnrV4s+XW2zz4aJ0EBbZLOLGESYCRhXm5hyH4ZPKVToj3A==
X-Received: by 2002:a05:6a00:843:b0:67a:9208:87a with SMTP id q3-20020a056a00084300b0067a9208087amr21529015pfk.23.1691085693539;
        Thu, 03 Aug 2023 11:01:33 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78d48000000b0065a1b05193asm134952pfe.185.2023.08.03.11.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 11:01:33 -0700 (PDT)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Anup Patel <anup@brainfault.org>,
        Marc Zyngier <maz@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Robert Moore <robert.moore@intel.com>,
        Haibo Xu <haibo1.xu@intel.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Atish Kumar Patra <atishp@rivosinc.com>,
        Sunil V L <sunilvl@ventanamicro.com>
Subject: [RFC PATCH v1 16/21] ACPI: Add APLIC IRQ model for RISC-V
Date:   Thu,  3 Aug 2023 23:29:11 +0530
Message-Id: <20230803175916.3174453-17-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add the IRQ model for RISC-V APLIC so that acpi_set_irq_model
can use this for RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/bus.c   | 3 +++
 include/linux/acpi.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 9a8c16170a4b..dd9d80630bf6 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1132,6 +1132,9 @@ static int __init acpi_bus_init_irq(void)
 	case ACPI_IRQ_MODEL_LPIC:
 		message = "LPIC";
 		break;
+	case ACPI_IRQ_MODEL_APLIC:
+		message = "APLIC";
+		break;
 	default:
 		pr_info("Unknown interrupt routing model\n");
 		return -ENODEV;
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index d16739928888..698d120a1bd2 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -95,6 +95,7 @@ enum acpi_irq_model_id {
 	ACPI_IRQ_MODEL_PLATFORM,
 	ACPI_IRQ_MODEL_GIC,
 	ACPI_IRQ_MODEL_LPIC,
+	ACPI_IRQ_MODEL_APLIC,
 	ACPI_IRQ_MODEL_COUNT
 };
 
-- 
2.39.2

