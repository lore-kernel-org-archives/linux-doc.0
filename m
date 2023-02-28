Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1011FC64ED6
	for <linux-doc@archiver.kernel.org>; Tue, 28 Feb 2023 15:46:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbjB1Pqi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Feb 2023 10:46:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjB1Pqh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Feb 2023 10:46:37 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7DF030EA6
        for <linux-doc@vger.kernel.org>; Tue, 28 Feb 2023 07:46:34 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id bv17so10247524wrb.5
        for <linux-doc@vger.kernel.org>; Tue, 28 Feb 2023 07:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677599193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UoR1tCMqBp+csZse58QFeQTl6XiwfpRChiE77LfzzYo=;
        b=yVJiteKDOKx05exhBTQfkblzBUFYBV3RpEh+t371JH9Huxj90BDLY3pgO6oCDUt197
         Xs+BgPVxxh80ZymxFXB1moFb8j8LT3tgjv69XJdDbLKNi/o2Mt/cYEK/rWElTEpqTyE7
         APoBkOHpaTb0w9nMY3rlg6SgNf2f27WlvinT/x3If0c5gq6dMYf4e+OtXlgwFAfQCOt4
         S3kK3mFZdbnvlt8uxBfWhqLu3eV9TnsMwtX9Yeb13iIu6qp1pANC3A6yRct7k2xmBE3o
         dlyqutgCzf4bMuUG9eJ7AK0JT2oZxYSNE2o54sZVm7t3318xqY3VYDBLNP3AFSQujlyV
         rSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677599193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoR1tCMqBp+csZse58QFeQTl6XiwfpRChiE77LfzzYo=;
        b=Ivn8uq/csw9bRJWLq53fHM2vExDO5YtHu1HugLDP93ZH/bQyQpS69uT8Mfw0guReur
         8QBjqAoP8B/VD0l3+aFN0iOGer1i+6I1TNdHN3ORuCB1VQ+gPPiEtEPeUUWwr3BTN9HO
         s4fKcdXNGiQbf2+2xe7sowQtLzQWLoc7Go/nrOsr4/y2qhuwI+jdiHwGh/8LLjZjRn9f
         QCxu/sk4DPXJ3EwuvpJ6p9zfNAVbw1q8KdkkIaGywK2fffhFJqwtYnEGRn/1clzHotoN
         2QbyGhZiaQ5kjOYHRttioaC3MwZnSMXBggOK8tW3d35EIEowO4Jvd8J5fad5XlhFgeG0
         Fi0Q==
X-Gm-Message-State: AO0yUKUgC4yX242yAWb9kg/C/Tz7H6ua+hyiK6KT/pvVJClKvp6nOjKm
        3AVGBqhqUg50SuqB50xM7Te/uw==
X-Google-Smtp-Source: AK7set9VVCtNON7BjfYFEn4DTD0yqlg1psIpUaMtYWkHZHahodZ1gU0u3rTiKHVc8V7atr0Iv41aKQ==
X-Received: by 2002:adf:fe8b:0:b0:2cc:3308:514f with SMTP id l11-20020adffe8b000000b002cc3308514fmr2142195wrr.57.1677599193296;
        Tue, 28 Feb 2023 07:46:33 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-gre-1-235-32.w90-112.abo.wanadoo.fr. [90.112.194.32])
        by smtp.gmail.com with ESMTPSA id c4-20020adffb04000000b002c70bfe505esm10122806wrr.82.2023.02.28.07.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 07:46:32 -0800 (PST)
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
Subject: [PATCH v8 0/1] riscv: Allow to downgrade paging mode from the command line
Date:   Tue, 28 Feb 2023 16:46:28 +0100
Message-Id: <20230228154629.240541-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This new version gets rid of the limitation that prevented KASAN kernels         
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

base-commit: eb9be8310c58 ("RISC-V: add a spin_shadow_stack declaration")

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
 arch/riscv/kernel/Makefile                    |  2 +
 arch/riscv/kernel/pi/Makefile                 | 37 +++++++++++
 arch/riscv/kernel/pi/cmdline_early.c          | 62 +++++++++++++++++++
 arch/riscv/kernel/vmlinux.lds.S               |  8 +++
 arch/riscv/lib/memcpy.S                       |  2 +
 arch/riscv/lib/memmove.S                      |  2 +
 arch/riscv/lib/strlen.S                       |  1 +
 arch/riscv/mm/init.c                          | 36 +++++++++--
 9 files changed, 148 insertions(+), 7 deletions(-)
 create mode 100644 arch/riscv/kernel/pi/Makefile
 create mode 100644 arch/riscv/kernel/pi/cmdline_early.c

-- 
2.37.2

