Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE57DC64EC4
	for <linux-doc@archiver.kernel.org>; Fri,  3 Mar 2023 13:40:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbjCCNj7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Mar 2023 08:39:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbjCCNj2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Mar 2023 08:39:28 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5748A5A6C5
        for <linux-doc@vger.kernel.org>; Fri,  3 Mar 2023 05:38:35 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id cp7-20020a17090afb8700b0023756229427so6169675pjb.1
        for <linux-doc@vger.kernel.org>; Fri, 03 Mar 2023 05:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owG1+TzWR6HEJY+37PeJPSBafU3Oc/UAH6XvLtB/Z/0=;
        b=ALnrkentJ1XuHyMDt3GVTiBFmglXp+J6oGK63Gndd4ta2Iqmd0yyXUHUzA/66j+ChC
         2lmK4PZbb6G/W0q8nI72pwOXxW0Vrf+WQU5IJMtPE8lYZV8RYHGFnogdZVTzWnPbbBWW
         XxkBRyJbtBI1GfpKT/y0ctvBAQDlMVtZgblbX/A0LX1ts/Ahm4hwacWBS2rskn/TqLgY
         xOuLFnWoTtLa0ogk8vo9eBf72slJXcy5BT761CltNiFsbODtBE/YsJoajPMzn4enIQXH
         zB52DGs6nFmaKmIgVLexdnUL+BGSJ6NyqXc5vaJ7w254O/0/OKVXzf0xAY6AiaQ1W4Az
         zvnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=owG1+TzWR6HEJY+37PeJPSBafU3Oc/UAH6XvLtB/Z/0=;
        b=Vy/oSMtVxJMepaoVIpq6qFuIFs73zyyiNOOtLSnIJLuSI9qOfU50R95MG6+9M1Okfj
         6mmbUD5jVFlwNdOQGowPZdnS7/VoFveujvBjueRkFgRJx5gLIOJIdkDzO+FC6JE5v6rG
         hCqlK0KzY0Jl76i8Bmy75m5TlcrjpHmtYUpOaqYbc/E/6284MuyKhsM8wCGm0O1YwtZz
         MfszhuvD1k3OB/tZfVFNET8tTluZdm37LatRJ/wTbkIfgtjuXaIZDF9xYQwGIol4UJZM
         8d/ohMEbHB3cEC8qt353+arBPg1mLXzL3m7sxbZsKf07BWblcG7gqR8gC5syiGfNxN9W
         YeFQ==
X-Gm-Message-State: AO0yUKVQAjqHyLP34bU0RDJ+gwYBvrQznki6kjmPk/OqMRBWxR5Wo+8j
        X8qqbi2Zi4jHx+X/m+79HNuhwg==
X-Google-Smtp-Source: AK7set8+s+vonEa4TIjfEZbBRmSw5IumgOEqh4wINo2KaMWe7mIDI15umXRgR+Cfyx6Wj+QLOH3mEw==
X-Received: by 2002:a17:902:db02:b0:19c:edcd:26cf with SMTP id m2-20020a170902db0200b0019cedcd26cfmr1870646plx.61.1677850706583;
        Fri, 03 Mar 2023 05:38:26 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:38:26 -0800 (PST)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Anup Patel <apatel@ventanamicro.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        'Conor Dooley ' <conor.dooley@microchip.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH V3 19/20] RISC-V: Enable ACPI in defconfig
Date:   Fri,  3 Mar 2023 19:06:46 +0530
Message-Id: <20230303133647.845095-20-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add support to build ACPI subsystem in defconfig.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index d98d6e90b2b8..8822b49ddb59 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -238,3 +238,4 @@ CONFIG_RCU_EQS_DEBUG=y
 # CONFIG_FTRACE is not set
 # CONFIG_RUNTIME_TESTING_MENU is not set
 CONFIG_MEMTEST=y
+CONFIG_ACPI=y
-- 
2.34.1

