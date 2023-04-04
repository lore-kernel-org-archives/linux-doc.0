Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C3CC6FD1D
	for <linux-doc@archiver.kernel.org>; Tue,  4 Apr 2023 18:26:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236441AbjDDS0A (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 Apr 2023 14:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236226AbjDDSZR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Apr 2023 14:25:17 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698A75FD4
        for <linux-doc@vger.kernel.org>; Tue,  4 Apr 2023 11:23:10 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id j13so31493981pjd.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Apr 2023 11:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8jniZVFM5VdIC7zEQqZON+ttcH4hGM09Ty8jho7PtM=;
        b=l4Jw1Rq2ntfHAMU4Y/Hm9cQCfDsI39b8psQRCZLgg7ZBeveqOfGhPNw3A44NfjsPNt
         CDKqtSOQE0ZvLjdx7COmE7Mmmrg95qIj8JP5YmXaGEVFBmrJrdMDDFWnVXKN/Hi3Wdzv
         m7j9aJzVpOi+j8aj17Zs85oruoTEu/NnXDzWeoMKKL+qQSnp6dtAlbbUr8MJhZ7snY/m
         UAdB4JApQKXF0moipSxBKcnvaKFXZhpP/jzffrNHKJ3HaMLoqBJk2NDoulhVo6A56Xt4
         64gplAMVGV20KfPamu5185j/DJgIptQzQinjGOAraB+/y3g6Hlz9Pwdurbr5SvSLD1Kn
         nvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8jniZVFM5VdIC7zEQqZON+ttcH4hGM09Ty8jho7PtM=;
        b=oOP5sh5ewUAyK+xnwSltaTwWENgaNw+2Fkf/360donWLecTCvMyZ14qQpUx66/RgUj
         rjw6hsvQ7/ZcK1x4Ms3kh8V8K7wY/IpLvjwGOtZZZlt+PQiNknfM0PnVf6ZFSDPyrImr
         rrycPrlOpb1trAezP0WFTE/9TSRItVaBsv8MPwbXdcqOwjQS2kMfDdzxnCph33A8oR3C
         6vIWxFvALADh59j5Q3X+C6Jk0b44+e/cZUa1XfHosC7EzcH3f12WtNUQD8Q3kh5Xeafr
         Ulmllw7yEvi+Z9fXTXDSq5htGJwsCMGUjfIX6emKJYTGB1Yd5L0pIwkxymThL9ezfW6Q
         fHog==
X-Gm-Message-State: AAQBX9dNUr8jPl9M5txQKXK3gxzPCWAC+Tum2EGoY9y+pbqqBhYTUwbj
        xhwIyht27PPYNhMtpRkpL+5jc0B7Vo/ZNPtIKqM=
X-Google-Smtp-Source: AKy350YWtiByLvuA5MHF6bNdPYqUjMVVmlzTK+bqmZihos/8knO44e4LwsVq3Bx9usreNyRcUWXZ0w==
X-Received: by 2002:a05:6a20:7b2a:b0:db:1d43:18fe with SMTP id s42-20020a056a207b2a00b000db1d4318femr3016723pzh.8.1680632588299;
        Tue, 04 Apr 2023 11:23:08 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:23:08 -0700 (PDT)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        llvm@lists.linux.dev
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Weili Qian <qianweili@huawei.com>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Marc Zyngier <maz@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Sunil V L <sunilvl@ventanamicro.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH V4 20/23] RISC-V: Enable ACPI in defconfig
Date:   Tue,  4 Apr 2023 23:50:34 +0530
Message-Id: <20230404182037.863533-21-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404182037.863533-1-sunilvl@ventanamicro.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add support to build ACPI subsystem in defconfig.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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

