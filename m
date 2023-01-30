Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04399C636D3
	for <linux-doc@archiver.kernel.org>; Mon, 30 Jan 2023 18:26:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238115AbjA3S0l (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Jan 2023 13:26:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238103AbjA3S0R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Jan 2023 13:26:17 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7D49470B7
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 10:24:26 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so16434120pjq.0
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 10:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuVGWrNUUEjIXx2KjigY2fz+dkSBCOERpinGp69EYJM=;
        b=iIZwFAAWGocdPshz3LmlC28vm5OGG56ziFBKl6XO1HZptYcLVhgEw6dYylimgH3fPM
         /9B3J5Y8Z5oJw8BWXUq7KJyb9hzrJEQ6lFjc1pcEcZkbDfsSey1/GskMpm4Hehh4ioBU
         Wt5Pm8Wx6kDDEj97kMeoEwJqCcK8bmo/I04WY0p9wPLCQTVCK7oSRboKeRvATTbLoWjS
         /eXynBB9Ka/mxjLhT+mtMnDY71dEocS7MrjhN4DDRdN4Kj0dm292Qdi9kCBQTP+i8mj1
         uIkxGhN1NA5vTZ36y79ou9www5avH7oUT2PdeyaFoDgA5qOxVcK8Fof3w4fsrUICEmlw
         HjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wuVGWrNUUEjIXx2KjigY2fz+dkSBCOERpinGp69EYJM=;
        b=mTlvzGIfVbdLAuakWppdKroktIUIbPw4ICToX3IsKuPG39V3jUn2pxt7cLZGPYPWcO
         lnoAb99/CLKhjSYQsG9/fnemMxGHFLywdIP+C162bf2epUpfAYcQscO0ib4fqVP0G/n3
         FC0M+MoJi8GOpaq36+qYjkIuoxxfhrUGOZUkJVdixMih7RwkgOWrMfl2iy/V0odeNiEQ
         H+2jRPq6uhbryVhbGlh7vWuErs8Zm6eqv/z70YdhQZptnRg5lwpe5S87jvKtAHKfwLu4
         6Zggd+FyPsz6XOlRae8ygWhLG/gcwxQHONHVl6Psvdu73kkyUgPOGOqmIOG/RsOQXgh/
         Fl8w==
X-Gm-Message-State: AO0yUKWlvXyi5gaHG+0ptJUORtqMDCViuelHouITdStgqReBihrRrNok
        k8y6207oXvHaOw+z9P4HVwF/nQ==
X-Google-Smtp-Source: AK7set+n/r2CZrElPyDBS1vKdJq6Onz/PLzE1JlEypVANy/qXderCMMOJZw49AYfFbT7RutNUjOs0A==
X-Received: by 2002:a05:6a20:a003:b0:bc:3537:34a4 with SMTP id p3-20020a056a20a00300b000bc353734a4mr17049951pzj.39.1675103064549;
        Mon, 30 Jan 2023 10:24:24 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:24:23 -0800 (PST)
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
Subject: [PATCH 24/24] Documentation/kernel-parameters.txt: Add RISC-V for ACPI parameter
Date:   Mon, 30 Jan 2023 23:52:25 +0530
Message-Id: <20230130182225.2471414-25-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

With ACPI support added for RISC-V, this kernel parameter also
supported on RISC-V. Hence, update the documentation.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6cfa6e3996cf..d9795418aaf8 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1,9 +1,9 @@
-	acpi=		[HW,ACPI,X86,ARM64]
+	acpi=		[HW,ACPI,X86,ARM64,RISC-V]
 			Advanced Configuration and Power Interface
 			Format: { force | on | off | strict | noirq | rsdt |
 				  copy_dsdt }
 			force -- enable ACPI if default was off
-			on -- enable ACPI but allow fallback to DT [arm64]
+			on -- enable ACPI but allow fallback to DT [arm64,riscv]
 			off -- disable ACPI if default was on
 			noirq -- do not use ACPI for IRQ routing
 			strict -- Be less tolerant of platforms that are not
@@ -12,6 +12,8 @@
 			copy_dsdt -- copy DSDT to memory
 			For ARM64, ONLY "acpi=off", "acpi=on" or "acpi=force"
 			are available
+			For RISC-V, ONLY "acpi=off", "acpi=on" or "acpi=force"
+			are available
 
 			See also Documentation/power/runtime_pm.rst, pci=noacpi
 
-- 
2.38.0

