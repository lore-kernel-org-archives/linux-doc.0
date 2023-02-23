Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723A2C636D7
	for <linux-doc@archiver.kernel.org>; Thu, 23 Feb 2023 08:24:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbjBWIYo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Feb 2023 03:24:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232627AbjBWIYo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Feb 2023 03:24:44 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B7925BA2
        for <linux-doc@vger.kernel.org>; Thu, 23 Feb 2023 00:24:42 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id t15so10055451wrz.7
        for <linux-doc@vger.kernel.org>; Thu, 23 Feb 2023 00:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NkCh/AowqYCuU7zgqG0YkYb4oopQxez3cQvz40pUaxs=;
        b=RhAY7mQUp4U96B+Jiym9qVEPn1CiYxJWT2NGE4QjO8auQi1R8vtku5RKL4sN28AH4a
         dET6hsct+g7jUMueitQaqULSml1pIBpVIh4UVtqD+GGOLkIm3ViBqEmIU1jnzyZPCO2X
         AESs5WkmjDcGRwfytFKw8w2578YQu9SmvW/3VnWXhMM17YdBiUv+oH1DvtjEWM6iqpEt
         58GoG5DQgHCXzaa+VqicCPhzKAzPGFYH5Bxqd84RWSBJRETkGDYbQVBaZSsrl8FPRQBF
         8Ix999uVP0F6iuqeyGRMFLc9fQa1bkGiL5rdT66O9QamOiqj8VEr738gXCrhK44UTw3y
         +byA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NkCh/AowqYCuU7zgqG0YkYb4oopQxez3cQvz40pUaxs=;
        b=waxBeLJbL/ykLbfca6fIRAug2K0qYULrurvUKZouZSh19Ve4jWAyqFLTl95Z4GAiiu
         O93oOJR8STgdgMbaKGtkd1yVTY+D9vIR0d3uEAjd/sjaYFqOYieM9picU19nLcdOXQAE
         RrybrnEawW093GkdXAOgztTORCSCyJtV1KLedHuS05Iag2D5qWCZG5wEWk2q1qYKHCMQ
         0pvR1KL/3lsrtScZWiGLS1n/6JYfGqvzdPw2SEIlZUhhalQQFHLX0HE5ad47c3d/6yuI
         jJdrQPLPstu2+gMq9xaSD4V3wdMHCzO/NYz6ZKM1owPgVjuWszQBjhqCQLjyG42eklTu
         3uvw==
X-Gm-Message-State: AO0yUKWYGyE8Mb6Wfu2Iu+eew76M+jMR5S9U25IusreKke8V0cLUMXYF
        KMMSiRQdiDOdNifw9hBYjDmO7+Eq+mnlwxK5
X-Google-Smtp-Source: AK7set9k+etAhHHJfifyrCS12MhqVoE/6gxFjtGmJJM/kJJFfJR/OvWvQZARuqkvX0qL24LuBVs1xg==
X-Received: by 2002:a05:6000:18b:b0:2c5:4f35:1b2b with SMTP id p11-20020a056000018b00b002c54f351b2bmr9833138wrx.28.1677140681204;
        Thu, 23 Feb 2023 00:24:41 -0800 (PST)
Received: from alex-rivos.home (lfbn-gre-1-235-32.w90-112.abo.wanadoo.fr. [90.112.194.32])
        by smtp.gmail.com with ESMTPSA id i18-20020adfe492000000b002c56287bd2csm9858338wrm.114.2023.02.23.00.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 00:24:40 -0800 (PST)
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
Subject: [PATCH v6 0/1] riscv: Allow to downgrade paging mode from the command line
Date:   Thu, 23 Feb 2023 09:24:33 +0100
Message-Id: <20230223082434.1280957-1-alexghiti@rivosinc.com>
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

base-commit-tag: riscv-for-linus-6.2-rc8

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
 arch/riscv/kernel/pi/Makefile                 | 34 ++++++++++
 arch/riscv/kernel/pi/cmdline_early.c          | 62 +++++++++++++++++++
 arch/riscv/lib/memcpy.S                       |  2 +
 arch/riscv/lib/memmove.S                      |  2 +
 arch/riscv/mm/init.c                          | 36 +++++++++--
 7 files changed, 136 insertions(+), 7 deletions(-)
 create mode 100644 arch/riscv/kernel/pi/Makefile
 create mode 100644 arch/riscv/kernel/pi/cmdline_early.c

-- 
2.37.2

