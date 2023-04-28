Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1581EC77B61
	for <linux-doc@archiver.kernel.org>; Fri, 28 Apr 2023 19:06:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346521AbjD1TGV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 28 Apr 2023 15:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjD1TGT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 28 Apr 2023 15:06:19 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E444940F9
        for <linux-doc@vger.kernel.org>; Fri, 28 Apr 2023 12:06:16 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1a920d4842bso2496335ad.2
        for <linux-doc@vger.kernel.org>; Fri, 28 Apr 2023 12:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682708776; x=1685300776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z7CXCSpVGMZwlJc9agpmg1mVXv2Z1n756Do/clETpg4=;
        b=3iKbY/L1kcMW/nkDKn0zG/qygIat+lYQ9xCBRzlv/+txh7nL7tH9Kk7taPffuRVV0t
         Jg4XHTdUa23X4HjhOhoDWS9JoXK6Y70R4hRtNgkbNECSUUnNHsVkK8XLYTQAjBtCYwut
         P6uCtNz3A+ExkBT7fUdhCrExZuOCgzc7Rt9/QqFpD91I847M0DImYjpwun4/lOASRn0G
         MuhLMWTc26o3cxHS0PwEFNBmUkTLgh6M2ZCGQLO4KObMAswrNg/YO9APCcL1uKw6kGbo
         2HvZUzv/lxYSYGqaLjveBvBY+V6GHdlhsWVuc29UPAIXfYNfUI6pxq8f2ShOmlEefqWe
         oF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682708776; x=1685300776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z7CXCSpVGMZwlJc9agpmg1mVXv2Z1n756Do/clETpg4=;
        b=WxM3xDmtyVd7KSzSAytawjrzY6JX9PdMizLa8TUlrLZMaPKOUvmv/GgAFFdxKUQzdQ
         CU3qhCKEkcPyA3J5kaa/dSXejmanYQ/Sq3SSszEMnWSjRaNjDs5c/KKxr5zRGP1dm6ZG
         YblMhxUJ0soONsJ00VRo0DYoyT9i6shqwbenK/91IVMaYE/p1GCGu6ja/EKDxvxjP8Sl
         mVJZIkE2Kt1ZApl74/YFvzQxzHr+LYrfEJ4htaLYYGiV7WGOAHviLAyLhqy4W6b0AzbF
         qnpycMjMzLjDWrdh2CvDNV0BwGSPwkvr/LTrkUNASB34wgWreMByciuhhd5LmWw4Rb8l
         a7yA==
X-Gm-Message-State: AC+VfDwq2CDUpy2vHimsupOKisrHgYPOE/Z4RL3oJrSjmINAaIPvr06D
        7KLrijTwiHAndivd6MvqIh/C8w==
X-Google-Smtp-Source: ACHHUZ5bl9aZkrVmX8UgFEMi974XV7W/i2zRAEerPhd7l6PlWqjxEN/CCQPy3oDNjJBzAorqJcEz4w==
X-Received: by 2002:a17:903:11c7:b0:1a9:7e26:d72 with SMTP id q7-20020a17090311c700b001a97e260d72mr6763944plh.9.1682708776298;
        Fri, 28 Apr 2023 12:06:16 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id w15-20020a170902d70f00b001a6c58e95d7sm13580733ply.269.2023.04.28.12.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 12:06:15 -0700 (PDT)
From:   Evan Green <evan@rivosinc.com>
To:     Palmer Dabbelt <palmer@rivosinc.com>
Cc:     Evan Green <evan@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Bresticker <abrestic@rivosinc.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Celeste Liu <coelacanthus@outlook.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Dao Lu <daolu@rivosinc.com>,
        Heiko Stuebner <heiko.stuebner@vrull.eu>,
        Jisheng Zhang <jszhang@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH 0/3] RISC-V: Export Zba, Zbb to usermode via hwprobe
Date:   Fri, 28 Apr 2023 12:06:05 -0700
Message-Id: <20230428190609.3239486-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


This change detects the presence of Zba and Zbb extensions and exports
them per-hart to userspace via the hwprobe mechanism. Glibc can then use
these in setting up hwcaps-based library search paths.

There's a little bit of extra housekeeping here: the first change adds
Zba to the set of extensions the kernel recognizes, and the second
change starts tracking ISA features per-hart (in addition to the ANDed
mask of features across all harts which the kernel uses to make
decisions). Now that we track the ISA information per-hart, we could
even fix up /proc/cpuinfo to accurately report extension per-hart,
though I've left that out of this series for now.


Evan Green (3):
  RISC-V: Add Zba extension probing
  RISC-V: Track ISA extensions per hart
  RISC-V: hwprobe: Expose Zba and Zbb

 Documentation/riscv/hwprobe.rst       |  7 +++++
 arch/riscv/include/asm/cpufeature.h   | 10 +++++++
 arch/riscv/include/asm/hwcap.h        |  1 +
 arch/riscv/include/uapi/asm/hwprobe.h |  2 ++
 arch/riscv/kernel/cpu.c               |  1 +
 arch/riscv/kernel/cpufeature.c        | 19 ++++++++----
 arch/riscv/kernel/sys_riscv.c         | 43 ++++++++++++++++++++++-----
 7 files changed, 70 insertions(+), 13 deletions(-)

-- 
2.25.1

