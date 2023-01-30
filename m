Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA00C61D97
	for <linux-doc@archiver.kernel.org>; Mon, 30 Jan 2023 18:24:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238102AbjA3SYB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Jan 2023 13:24:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238024AbjA3SXm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Jan 2023 13:23:42 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 072873754F
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 10:23:11 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id h9so3940106plf.9
        for <linux-doc@vger.kernel.org>; Mon, 30 Jan 2023 10:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ucIkerkqr4QmI5UkdMXW8uEBrl0PvtR2G4Rv/JZMzew=;
        b=GhrwpBT3N31+nOt/CtgKmnAGMi653hgs/75GWs74Cqht6JG/AUohZ9ARL3pkvdkfmj
         GGOZc26wqFHqO7mxkcg3Ji/bn0HnDTjs+diwm80n7Jus44aORApx5bQiKn82JGyfTCYv
         hLqZbyZnw2mPfz9cuau3/Zw6fHKe0n82KCiDP07hBTERsyddqX5tlDZsMxgaTW1bTNpo
         KxuF/f6QYreKfafdgIWZX2SL50FtFfyns379QlTz0qZo60LNmMpt4E2ApfVNvqyuC5TA
         bTk7rP8MGgWtYVewzHcJEdMTwddvaOYKbkRdF7nMfjQRFzmhTRP94xlgUWzIEO/hT95a
         UI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucIkerkqr4QmI5UkdMXW8uEBrl0PvtR2G4Rv/JZMzew=;
        b=rAEK3S0iHh/1T4Lcv7aKAIW9tN+sDzGNLdEhPJdA2PyG6omxJRC3Oyrxlbbksck5uH
         rly6PkKYPN894jyW0TOjsbf52j+6u7T1zzAnoczsqbziQMtTi/w8Qqwkd9/X2eFi3GKa
         bJ1ZeQ2ho7wijzjY9jwVJLuOZ8IXsEAqCh3wkmnE1gJl9SxVSPHQJ0oSwoLjC7cJX//Z
         5zrMiZnnS2AMTOnZ0jIu3Q8t/3sFP4/GGFGc/mLsDDmfPr7F/VkwejG1vyFKPTk9Q7GL
         AIlYQYbw7s4+CY7sPJQ8LpoGJik00hxy+GUB/7tssb3uq+tjIT0yFf9JKYCRkj6iG6zW
         cjSQ==
X-Gm-Message-State: AFqh2kou02lOuq9jCq4x2raD8aLq5Dm3Kst8FjF+bNpFcB9g0vFcexo1
        RN0kw2gYrkvoOgCt/aGyvCBkHw==
X-Google-Smtp-Source: AMrXdXuB44m0KVUm0j9aNOAU3dJJ68bswZ8ULTfSewfLquMpMN9Q/ZK2SmPbqXYnMOJ4+lGGcK7FKA==
X-Received: by 2002:a17:90b:348e:b0:229:5cab:67a8 with SMTP id kd14-20020a17090b348e00b002295cab67a8mr52332355pjb.24.1675102986650;
        Mon, 30 Jan 2023 10:23:06 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:23:05 -0800 (PST)
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
Subject: [PATCH 07/24] RISC-V: ACPI: Enable ACPI build infrastructure
Date:   Mon, 30 Jan 2023 23:52:08 +0530
Message-Id: <20230130182225.2471414-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Enable build infrastructure to add ACPI support for
RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d153e1cd890b..f664350679bc 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -12,6 +12,9 @@ config 32BIT
 
 config RISCV
 	def_bool y
+	select ACPI_GENERIC_GSI if ACPI
+	select ACPI_MCFG if (ACPI && PCI)
+	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
 	select ARCH_CLOCKSOURCE_INIT
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
@@ -598,6 +601,7 @@ config EFI_STUB
 config EFI
 	bool "UEFI runtime support"
 	depends on OF && !XIP_KERNEL
+	select ARCH_SUPPORTS_ACPI if 64BIT
 	select LIBFDT
 	select UCS2_STRING
 	select EFI_PARAMS_FROM_FDT
@@ -703,3 +707,4 @@ source "drivers/cpufreq/Kconfig"
 endmenu # "CPU Power Management"
 
 source "arch/riscv/kvm/Kconfig"
+source "drivers/acpi/Kconfig"
-- 
2.38.0

