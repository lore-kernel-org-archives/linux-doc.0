Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5F0C7618E
	for <linux-doc@archiver.kernel.org>; Mon, 24 Apr 2023 09:23:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbjDXJXU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Apr 2023 05:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjDXJXT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Apr 2023 05:23:19 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B342A1B9
        for <linux-doc@vger.kernel.org>; Mon, 24 Apr 2023 02:23:17 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f178da219bso41550435e9.1
        for <linux-doc@vger.kernel.org>; Mon, 24 Apr 2023 02:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682328196; x=1684920196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EXcFasvYcCcX5M/Oqzczio5jClnFAANnb2Xvikd7U7A=;
        b=rw3uoZSD2cv6C8bIkJfrr8Hxzj4xP6HDs9VqlScy9e0jX1XeuIikb1eMqMqq+IfTBi
         Bua7ZF8W/sP2+9rqKNbZ5bCmJy6fGE47hT6zFnUVDqPnmTK3abMMXu+ssSp9CZgl7rsh
         oGgvkHi0wgS9oLumPsYvpXu0rloUrjQvdojtvPeENhDeWql3UYihPP3Hpbiyp/4INX8A
         9ubu6OWpHGxleZ0ogFHdqrE2MM7M1ckuo92zYW1hhYhfJT7bDtIzPNIhTJab0U4rCTEB
         g8JE1P2iAvsKNRxf6IM/TaHu59mzUxW7fuSPnTt/o0dvm8YuuxjUJ+/WgnNJXvzs903p
         KNOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682328196; x=1684920196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXcFasvYcCcX5M/Oqzczio5jClnFAANnb2Xvikd7U7A=;
        b=H/mQB2T8hO9sAeoIqeTlpwwYBQvevRPSBTev8aikNBfuRcRpJWP3U/xucVSicTZIJz
         svvUsExsIKxP+5Wfk5GrLeQNgMi5C+7KaGeADU15hz9w7ri0u/W/F1dPFxhyP2roWgcC
         v+usNSik6wxW5Xop9eY4wziFxorwosSUFxoQpC4oNZBA9Jv3biaJS29sn1g1vrvlWz8x
         Q/UbN70+m7Ms7pD6E2UTW9mYPeJ3uYRxuNKkGJ1R5Zv+b4W9XkC7o4EvNQmvaxyEtG8S
         mHvfVtmWMHAoq7pa2VKWhIY9A43UBV3tdR/pfg2Zm+Ipda0bjub0FxqcxCmI4QQ4oBps
         Jk8w==
X-Gm-Message-State: AAQBX9f97Xiq/upL4ZAuTQaC8hIuwcFy8MjAKmtCoUAuSM0nEs13q/du
        pFnWo3Y/BYwTg7AZGIG/DglQrQ==
X-Google-Smtp-Source: AKy350ZGA/34dC7i7D2a/hjvz5pLQPYdT9/obwuNRSwU39wOtAvc2iVIM4u0ToVzfv8KAENelqieHQ==
X-Received: by 2002:a7b:c5c7:0:b0:3f1:75d0:6151 with SMTP id n7-20020a7bc5c7000000b003f175d06151mr7250507wmk.1.1682328195740;
        Mon, 24 Apr 2023 02:23:15 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id n16-20020adfe350000000b002c71b4d476asm10327819wrj.106.2023.04.24.02.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 02:23:15 -0700 (PDT)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Conor Dooley <conor@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v10 0/1] riscv: Allow to downgrade paging mode from the command line
Date:   Mon, 24 Apr 2023 11:23:12 +0200
Message-Id: <20230424092313.178699-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

his new version gets rid of the limitation that prevented KASAN kernels
to use the newly introduced parameters.

While looking into KASLR, I fell onto commit aacd149b6238 ("arm64: head:
avoid relocating the kernel twice for KASLR"): it allows to use the fdt
functions very early in the boot process with KASAN enabled by simply
compiling a new version of those functions without instrumentation.

I had to change the handling of the command line parsing to make the
code self-contained in kernel/pi/cmd_early.c to avoid calling too many
__pi prefixed functions from outside this file.

I'll use this approach like arm64 to handle the extraction of the random
seedi from the device tree for KASLR.

This patchset is rebased on top:

Introduce 64b relocatable kernel
(https://patchwork.kernel.org/project/linux-riscv/list/?series=734847)
base-commit-tag: v6.3-rc1

v10:
- Compile kernel/pi with -fpie to fix llvm boot issues (arm64 does just
  that)
- Rebase on top relocatable patchset that was merged
- Add -z norelro to all kernels (not just relocatable) to quiet ld.lld
  warnings

v9:
- Fix medlow builds by marking pi/ medany, as reported by Palmer

v8:
- Fix LLVM ld warning by moving the section .init.sdata from
  kernel/pi/string.c into the newly created section .init.pidata

v7:
- Rebased on top of for-next which introduces lots of errors (thanks to
  the patchwork CI)
- Add __NO_FORTIFY to avoid undefined __pi_fortify_panic
- Add an alias to our newly introduced strlen
- Remove __init as sections are already prefixed in the Makefile
- Introduce new section for kernel/pi/string.c to quiet the following
  warnings (once we have all the string functions, we'll be able to get
  rid of this):

warning: orphan section `.init__bug_table' from `arch/riscv/kernel/pi/string.pi.o' being placed in section `.init__bug_table'
warning: orphan section `.init.srodata.cst8' from `arch/riscv/kernel/pi/string.pi.o' being placed in section `.init.srodata.cst8'

v6:
- Fix llvm warning by forward declaring set_satp_mode_from_cmdline

v5:
- Handle null command line, Thanks Björn!
- Add RB/TB from Björn

v4:
- Introduce pi/ for KASAN to work

v3:
- Massage commit log to make no4lvl clearer, as asked by Conor
- Add a note to kernel-parameters.txt regarding the impossibility to use
  those parameters when KASAN is enabled, as suggested by Conor
- Add RB from Björn

v2:
- Honor CMDLINE_EXTEND and CMDLINE_FORCE as noticed by Björn

Alexandre Ghiti (1):
  riscv: Allow to downgrade paging mode from the command line

 .../admin-guide/kernel-parameters.txt         |  5 +-
 arch/riscv/Makefile                           |  3 +-
 arch/riscv/kernel/Makefile                    |  2 +
 arch/riscv/kernel/pi/Makefile                 | 39 ++++++++++++
 arch/riscv/kernel/pi/cmdline_early.c          | 62 +++++++++++++++++++
 arch/riscv/kernel/vmlinux.lds.S               | 11 +++-
 arch/riscv/lib/memcpy.S                       |  2 +
 arch/riscv/lib/memmove.S                      |  2 +
 arch/riscv/lib/strlen.S                       |  1 +
 arch/riscv/mm/init.c                          | 36 +++++++++--
 10 files changed, 154 insertions(+), 9 deletions(-)
 create mode 100644 arch/riscv/kernel/pi/Makefile
 create mode 100644 arch/riscv/kernel/pi/cmdline_early.c

-- 
2.37.2

