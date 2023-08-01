Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68360C00528
	for <linux-doc@archiver.kernel.org>; Tue,  1 Aug 2023 22:11:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbjHAWLw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Aug 2023 18:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232457AbjHAWLs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Aug 2023 18:11:48 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9E1A1BE3
        for <linux-doc@vger.kernel.org>; Tue,  1 Aug 2023 15:11:46 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bb9e6c2a90so49084165ad.1
        for <linux-doc@vger.kernel.org>; Tue, 01 Aug 2023 15:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690927906; x=1691532706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EphR5J8NlVw9aGESxNNo7nFogyYyjvlP41J+N6zpMN4=;
        b=y7NW+zieDLM/W7+ypsqsCtPiWnnIH04Nh/EnZlNAiWtB1wCcSeS/2P170ExkpuMcat
         l17yWzv/OURRhmg8ep8l3xYYGWphXO2/LBuJKw64khflFVDpnsB99uJAEJxZzdahvEFa
         2mpp6qHBfYF718gM4Eu2uoW7V40xlSnySbdeWewNRXt2JAiq24pH/4XbxyJYHqPvt9aG
         CbIxHqFnH1IWyAWCBKB/KWDXfTh6RxfEN4uFtLi2VjRCjiXwCIKviU6MiKot4Q8j/sHb
         luG9DlHBlbQvWXuu0hlqbSP9yR4lffg2dkgu1JU0K9G/8GhaMId+VlauMaMLaJR1iPt4
         vM3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690927906; x=1691532706;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EphR5J8NlVw9aGESxNNo7nFogyYyjvlP41J+N6zpMN4=;
        b=lWdmKIFOVvl48qTW47v673g8VovDkOjmP598TH1/Cgnj4UcdrO5bBU3RJLUFfBO2zf
         mv/QMz3x2pT9fTudNg/vLH+mNCJjyWju463AMba6KiUy1qI8yIjYen9Pg2+PwM9FyRNc
         6IA6jwZ4KIYvWxOkg2t5rFigxBUY7P42mov5tgiM1lCBauj/yD3LAsAXuNbdD/MUbfD3
         S6YNDhFa8+6WAOl9q7nFhy07+kzn50J1GcgOAn+wckvN3oPrLb9/Qwxr9jUSbxFXbUB1
         pyMhhRFx0MtZU+7VMih/jF50D73Xjdex9x3P/afYeUjmW4Jd908tQuu+YiaxiipBCrb7
         tWBA==
X-Gm-Message-State: ABy/qLbtEZRbEriOedNoCQI/ctV41D/bNRv8TFtL7Fc7Q4lokl653rkX
        jp9b7C6VgSC4ePHu6bTIgZP71g==
X-Google-Smtp-Source: APBJJlFik9lHaC/GCg8rL5KIk8u/kiNikokxqkkmugbiCjx2njcIi553RmWiBvIrzoSJRjqs2Gv1nw==
X-Received: by 2002:a17:903:120a:b0:1b8:b288:626e with SMTP id l10-20020a170903120a00b001b8b288626emr15998535plh.35.1690927906280;
        Tue, 01 Aug 2023 15:11:46 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id u9-20020a17090a410900b00268dac826d4sm19586pjf.0.2023.08.01.15.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 15:11:45 -0700 (PDT)
From:   Evan Green <evan@rivosinc.com>
To:     Palmer Dabbelt <palmer@rivosinc.com>
Cc:     David Laight <David.Laight@aculab.com>,
        Simon Hosie <shosie@rivosinc.com>,
        Evan Green <evan@rivosinc.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Andy Chiu <andy.chiu@sifive.com>,
        Anup Patel <apatel@ventanamicro.com>,
        =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Greentime Hu <greentime.hu@sifive.com>,
        Guo Ren <guoren@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Jisheng Zhang <jszhang@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Ley Foon Tan <leyfoon.tan@starfivetech.com>,
        Marc Zyngier <maz@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Samuel Holland <samuel@sholland.org>,
        Sia Jee Heng <jeeheng.sia@starfivetech.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Xianting Tian <xianting.tian@linux.alibaba.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/2] RISC-V: Probe for misaligned access speed
Date:   Tue,  1 Aug 2023 15:11:35 -0700
Message-Id: <20230801221138.2086734-1-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


The current setting for the hwprobe bit indicating misaligned access
speed is controlled by a vendor-specific feature probe function. This is
essentially a per-SoC table we have to maintain on behalf of each vendor
going forward. Let's convert that instead to something we detect at
runtime.

We have two assembly routines at the heart of our probe: one that
does a bunch of word-sized accesses (without aligning its input buffer),
and the other that does byte accesses. If we can move a larger number of
bytes using misaligned word accesses than we can with the same amount of
time doing byte accesses, then we can declare misaligned accesses as
"fast".

The tradeoff of reducing this maintenance burden is boot time. We spend
4-6 jiffies per core doing this measurement (0-2 on jiffie edge
alignment, and 4 on measurement). The timing loop was based on
raid6_choose_gen(), which uses (16+1)*N jiffies (where N is the number
of algorithms). By taking only the fastest iteration out of all
attempts for use in the comparison, variance between runs is very low.
On my THead C906, it looks like this:

[    0.047563] cpu0: Ratio of byte access time to unaligned word access is 4.34, unaligned accesses are fast

Several others have chimed in with results on slow machines with the
older algorithm, which took all runs into account, including noise like
interrupts. Even with this variation, results indicate that in all cases
(fast, slow, and emulated) the measured numbers are nowhere near each
other (always multiple factors away).


Changes in v3:
 - Fix documentation indentation (Conor)
 - Rename __copy_..._unaligned() to __riscv_copy_..._unaligned() (Conor)
 - Renamed c0,c1 to start_cycles, end_cycles (Conor)
 - Renamed j0,j1 to start_jiffies, now
 - Renamed check_unaligned_access0() to
   check_unaligned_access_boot_cpu() (Conor)

Changes in v2:
 - Explain more in the commit message (Conor)
 - Use a new algorithm that looks for the fastest run (David)
 - Clarify documentatin further (David and Conor)
 - Unify around a single word, "unaligned" (Conor)
 - Align asm operands, and other misc whitespace changes (Conor)

Evan Green (2):
  RISC-V: Probe for unaligned access speed
  RISC-V: alternative: Remove feature_probe_func

 Documentation/riscv/hwprobe.rst      |  11 ++-
 arch/riscv/errata/thead/errata.c     |   8 ---
 arch/riscv/include/asm/alternative.h |   5 --
 arch/riscv/include/asm/cpufeature.h  |   2 +
 arch/riscv/kernel/Makefile           |   1 +
 arch/riscv/kernel/alternative.c      |  19 -----
 arch/riscv/kernel/copy-unaligned.S   |  71 ++++++++++++++++++
 arch/riscv/kernel/copy-unaligned.h   |  13 ++++
 arch/riscv/kernel/cpufeature.c       | 104 +++++++++++++++++++++++++++
 arch/riscv/kernel/smpboot.c          |   3 +-
 10 files changed, 198 insertions(+), 39 deletions(-)
 create mode 100644 arch/riscv/kernel/copy-unaligned.S
 create mode 100644 arch/riscv/kernel/copy-unaligned.h

-- 
2.34.1

