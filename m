Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 257F9EB64D9
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jun 2023 22:23:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjF0WXP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Jun 2023 18:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjF0WXP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Jun 2023 18:23:15 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05BAF1FD7
        for <linux-doc@vger.kernel.org>; Tue, 27 Jun 2023 15:23:14 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1b80b514fb7so16172795ad.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Jun 2023 15:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687904593; x=1690496593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mc8gTI3W4RW6dHKji0wpJv9Z8xook1q3V9GncqmxBNs=;
        b=LAT8nPi6+wPrYAAarEcLR//bannYKxM8K2dl8ard+Y2T6mC9jXOCXNcLymbItILWIH
         /+H7q2vAEnLRtuwthXmhTqhSVBpIHecv+WxeBEQVTiJ2w7paLH2FctuZjJ5duvgdkbcj
         AIqTdsBNVUzyOEnJREJTHReyK2k34ws/RMgINpSix9QKQDuWwZroz0aVAGIQWhtjZTRh
         fp6hWKMyp1zNuJEbEwFRzTbaAjWOAKUX6oavJwTLtXzpB1jrw+5jdM/GHgFGmHvzLA/B
         BS16AMVlhBO4yMR5F3Q73dbS991hIP9AK3JozP+KoWMnN9yakmMjccjrKTeo7hZPEwUM
         Yu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687904593; x=1690496593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mc8gTI3W4RW6dHKji0wpJv9Z8xook1q3V9GncqmxBNs=;
        b=TCQdtXr9n1F1EyYCys/FzfmULDosupvEVsyNyItn9Dtch7wdlfPnosAq5BHEIIMQa4
         vV0USVJR+gQemDvRYiwXx6AoucmwsftGY5o/oGHV0dkVWsREVb6hJAp9Tm4f0dG78MfT
         rWC6EL/YyFq/5tVvSqSLkO0fgg+eIs0TiQ6kJSLcteXzYEcduLJqX5/ksYV71KKSZ0OD
         QiW/SWCJ2Z/EOuq8wkFctaDb3FEV2BEO4qVZsuK6oxMybK4t6sn3J+PcK3NBpwZAchjP
         ex8ys8EepxXiGZvP0Tn7x797nMbfCRuIS/ecv31Cb7usEr4v+0ckUGLcadPaJgP8LIF6
         Yh9Q==
X-Gm-Message-State: AC+VfDy8J07q2HkRMr+t5pL19I4Tt8nEO6vvzC3dK20l376AY4ETdu0q
        cwVx53/HA22rNsSud5FMZ3D2Pw==
X-Google-Smtp-Source: ACHHUZ5dzHKMQEs5WRpPvm7HuTITuvtAXHdpkIka0TGrn0KnIqw30wJDTznkQRgHRkjUNqcdLIe4ag==
X-Received: by 2002:a17:902:c403:b0:1b3:fafd:11c5 with SMTP id k3-20020a170902c40300b001b3fafd11c5mr10089706plk.44.1687904593551;
        Tue, 27 Jun 2023 15:23:13 -0700 (PDT)
Received: from ghost.hq.rivosinc.com ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id 4-20020a170902c24400b001ac94b33ab1sm5108271plg.304.2023.06.27.15.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 15:23:12 -0700 (PDT)
From:   Charlie Jenkins <charlie@rivosinc.com>
To:     alexghiti@rivosinc.com
Cc:     charlie@rivosinc.com, atishp@rivosinc.com, conor@kernel.org,
        paul.walmsley@sifive.com, palmer@rivosinc.com,
        aou@eecs.berkeley.edu, bjorn@rivosinc.com, anup@brainfault.org,
        evan@rivosinc.com, linux-riscv@lists.infradead.org,
        konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH 0/2] Make SV39 the default address space
Date:   Tue, 27 Jun 2023 15:21:50 -0700
Message-Id: <20230627222152.177716-1-charlie@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Make sv39 the default address space for mmap as some applications
currently depend on this assumption. The RISC-V specification enforces
that bits outside of the virtual address range are not used, so
restricting the size of the default address space as such should be
temporary. A hint address passed to mmap will cause the largest address
space that fits entirely into the hint to be used. If the hint is less
than or equal to 1<<38, a 39-bit address will be used. After an address
space is completely full, the next smallest address space will be used.

Documentation is also added to the RISC-V virtual memory section to explain
these changes.

Charlie Jenkins (2):
  RISC-V: mm: Restrict address space for sv39,sv48,sv57
  RISC-V: mm: Update documentation and include test

 Documentation/riscv/vm-layout.rst             | 20 ++++++++
 arch/riscv/include/asm/elf.h                  |  2 +-
 arch/riscv/include/asm/pgtable.h              | 21 ++++++--
 arch/riscv/include/asm/processor.h            | 41 +++++++++++++---
 tools/testing/selftests/riscv/Makefile        |  2 +-
 tools/testing/selftests/riscv/mm/Makefile     | 22 +++++++++
 .../selftests/riscv/mm/testcases/mmap.c       | 49 +++++++++++++++++++
 7 files changed, 144 insertions(+), 13 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/mm/Makefile
 create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap.c


base-commit: eef509789cecdce895020682192d32e8bac790e8
-- 
2.34.1

