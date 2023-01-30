Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24107C636CB
	for <linux-doc@archiver.kernel.org>; Mon, 30 Jan 2023 18:24:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238033AbjA3SYC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Jan 2023 13:24:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237919AbjA3SXq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Jan 2023 13:23:46 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE4525E02
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 10:23:12 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id m13so643942plx.13
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 10:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPNO/SxCaad+QHrUHg1W5XYbXIP+iBGVf1xglNrkc7w=;
        b=WAt9qxmLcMCzx3x9infWfLlyTRY7lQwbLQgH+mqXQo8DaInODomPFYDru14it+/rwL
         FKOjU3kGSGvjRCJYGNq2J3I07ZEnZ2Bph7Cb19sB1kEq1iHguj5rtG6WsoXH3ZD7TYZN
         Ls5e3cWuM0m3oJ0jAOuLWK/MdCpxiTs0N/t0Izo9LfJy+vGfhYn87Vrttba7ZDWMziE/
         A08N/tccmOYsLazLRWGMy8dyvGbcOWNX9dDkplIHbZ2N65daS8oRYxkaa404MTl8Exiw
         wpa6wUWNjRjFB4qsp0OXBmuBLPbZxKyUhU+EuhlYJBnfoixeacW/CA9qkRNTfKQxDHfo
         1lpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tPNO/SxCaad+QHrUHg1W5XYbXIP+iBGVf1xglNrkc7w=;
        b=1VcTLDPvMGiicv8giRDwrUpQWkx4qZIVYhHM02axMIM/nHqs516/4mtfLk0khQ5cfI
         lX54ipVYV8bEommazXhJ28CAD7C0r0eRdE3fxiVuCC/sZY2t5cO0XNWYRJIpUia2Uz1i
         1Qxg7SfKqygMIomKaiG3m+qWvq68T2vDvYXkAgbld2gDBrQhxRZibihYv/OSVCUBKEUp
         tmQ6g+e81Ug9l/zp1Z2qcth3pI24PA23BgfYWNcp5f70ItbaGv2I6iEiCcVrtS9jo4H4
         nmGGlPplqFMEiN5tmU31bud0yEdsMuwRwlmGPAtrzBh/XxY31Whbw4tH7Wt7v59IKLGS
         YvYg==
X-Gm-Message-State: AO0yUKUAFeCVkDMDJXBCvWUbqQi0upuwxC8QLFa0HcHAVkdkZf3VR2Sv
        t+i+aHtyngUvre7rIuRW9eroYw==
X-Google-Smtp-Source: AK7set+8WSMVCSxjvJ7pcIybsaePEVFCKPT/8u2wMLIFDS/YpCiIenEFMsDbeymxOLvTs+dp4pi/rw==
X-Received: by 2002:a17:90b:20a:b0:22c:147d:137f with SMTP id fy10-20020a17090b020a00b0022c147d137fmr20585364pjb.17.1675102991516;
        Mon, 30 Jan 2023 10:23:11 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:23:10 -0800 (PST)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Anup Patel <apatel@ventanamicro.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 08/24] ACPI: Enable ACPI_PROCESSOR for RISC-V
Date:   Mon, 30 Jan 2023 23:52:09 +0530
Message-Id: <20230130182225.2471414-9-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The ACPI processor driver is not currently enabled for RISC-V.
Enable it

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index ccbeab9500ec..b44ac8e55b54 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -281,7 +281,7 @@ config ACPI_CPPC_LIB
 
 config ACPI_PROCESSOR
 	tristate "Processor"
-	depends on X86 || IA64 || ARM64 || LOONGARCH
+	depends on X86 || IA64 || ARM64 || LOONGARCH || RISCV
 	select ACPI_PROCESSOR_IDLE
 	select ACPI_CPU_FREQ_PSS if X86 || IA64 || LOONGARCH
 	select THERMAL
-- 
2.38.0

