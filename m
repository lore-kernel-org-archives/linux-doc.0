Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21325C636CC
	for <linux-doc@archiver.kernel.org>; Thu, 16 Feb 2023 18:23:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbjBPSXk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Feb 2023 13:23:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbjBPSXF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Feb 2023 13:23:05 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6431755E7B
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 10:22:24 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id cp18so517397pjb.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 10:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6w2bEiZ6pur5iCJunBAbzO2Rizq6VDyDF+3QNnzo8W4=;
        b=l+Os/mGF5YrQc2akg1w1/Es5B6/JyAn8aMu4QNlpR0eLtL5rBvzBv3N+L4c4RAn3e2
         NWNQNJpm0yKXy2rpw8YXGRC9gfaABRTsrNzT+6q9AHftHO6EqPvXXlSHVqvE8MtnkG85
         bkEslI8Ab9s0kLn040AFK2BWrECBEs0qEbPrv3vIrmvB5unRFZw2u0Xmp3oQ1YiYuy6l
         QKR0UKd+kZ/ZLd2MHjaHuhKZOfw+RDFIMRDmKg0/OU6e4Fd/uRFx6uWrpRekjAgwbbyv
         S89p0dZYt/HbQdps6oczHvziFLZv8Bt1VvD3m/LjDuwwTgBZm5zAel2igXlkA6trDU69
         cioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6w2bEiZ6pur5iCJunBAbzO2Rizq6VDyDF+3QNnzo8W4=;
        b=ACLO62k9b1crzvrNBreNv77EO2c6FOX5/6A8rb5Hil0TU31nfaylBK6suhRIwRA6cH
         woPsVFSCOjPqwMvzQoA6e5nldHA3sj6Tf8gOkzS6k/9SQEKUNpM7wo/s92B3JWB3OEB1
         X8woyBCAcdS1qvE2iAmVnhngs7q9A6UsCBwOEQLvJV5covcn0asseuKnsX4WW/eHD3ix
         P6p9NcvE2p/nikIo0LU0P95FqyYPTA4+NIf9GQnGTUYepMBNbpFp7jbAyjVbLbrPTrUg
         XnMbnWOwJzXmNn0fNNNx0g7rAlti/2QacbbsPzkOGi/2E7QalrGReKtQV8DY/OM7MD8j
         WMTA==
X-Gm-Message-State: AO0yUKXWrCdPgVHTU6do78unTYLNXUBA99ZoQJa6/Z8CrE/DnnnHGLon
        NtBaEdich/aqsQKO5TrEUk5WyA==
X-Google-Smtp-Source: AK7set90jL8Ub99U8TFOUkAjXVqJvu8GPAP0Rn8q+1zVd+74L+TSkgpW2/7HHEruLJohOXin4327bQ==
X-Received: by 2002:a05:6a20:c5a9:b0:c6:d84a:ce1c with SMTP id gn41-20020a056a20c5a900b000c6d84ace1cmr4929180pzb.35.1676571743596;
        Thu, 16 Feb 2023 10:22:23 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:22:23 -0800 (PST)
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
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH V2 19/21] RISC-V: Enable ACPI in defconfig
Date:   Thu, 16 Feb 2023 23:50:41 +0530
Message-Id: <20230216182043.1946553-20-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add support to build ACPI subsystem in defconfig.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 128dcf4c0814..f89f79294b34 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -218,3 +218,5 @@ CONFIG_RCU_EQS_DEBUG=y
 # CONFIG_FTRACE is not set
 # CONFIG_RUNTIME_TESTING_MENU is not set
 CONFIG_MEMTEST=y
+CONFIG_ACPI=y
+# CONFIG_PCI_QUIRKS is not set
-- 
2.34.1

