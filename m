Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D17C001B0
	for <linux-doc@archiver.kernel.org>; Wed,  5 Jul 2023 19:01:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232461AbjGETBF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 Jul 2023 15:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232938AbjGETBE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Jul 2023 15:01:04 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B42819B5
        for <linux-doc@vger.kernel.org>; Wed,  5 Jul 2023 12:00:42 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-262ff3a4659so19360a91.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Jul 2023 12:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688583641; x=1691175641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2aefKDjie+XpptlnykMS4cjK4bXnjT0kz0bBmi0t14U=;
        b=bBeWNn4QoiUU5WmJ9K/HMlqyJhTj+wXsBHEvd0uGz2MQnsimK3tohAPlu74IT/69YY
         U7WseCSzhKFXSkVwIpubzNpMLDTJN4v79Fx5s3gsOq1P7dcO2RrtNAb6T867Gd4UoNny
         04u0Wz0miji0CvK5q3GwOmrS0V9Fbpna8xqVWSEWEw+BxRGFqickCZHCgI0ncSPfQfxt
         BgwAWyARnAYVtjU2Hd4O1PADwr78MAV8z4dcbJ6AMs8u0C9xp7QSy3/zWRLuqoXixr9b
         sz/jlM52lXgAREg7lI63e4ZMxx2LteDx9lHj9eJtFEiBiD2E/+cX+vM3rOdsOKXsIIrh
         cb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688583641; x=1691175641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2aefKDjie+XpptlnykMS4cjK4bXnjT0kz0bBmi0t14U=;
        b=bhHlIcQR/ekFAYzMtnxxbuZpJT5umdqwvUcuUWOt7iZmOHO20HGVVDtUXleez3ac8g
         SKb9L2yDuPPr+RTX3IiR4bhdxvtfBrg6LLuna7SRoKUw5yHNf7ger47W/UK8ihGWRvcm
         zxa+9B9XDQkPRcY57ZbxbODtlrzjc0NIgtedKjVz3hWUcOtD6knQoBe4/sT8079wl20l
         uILJgYTbCZ9ANvZ9f916M9wFyjub2TRd2O+eLAe1j2mBI3ELj1bJ5RN9ONIkXtU8a/wp
         mszt8poZl3XCefm2qBn5nv8zgICnl4g5rUWzzZsEGGJ10J1RGaRXIcbNVjNUBiNGYez2
         OeNA==
X-Gm-Message-State: ABy/qLbT0gGiOXqIn054bcMcwjj6dzVCHSUwN+Vu7pAal3mv2FtiiRZv
        2eF9AeH5tiLfGfdokuT9epKbdw==
X-Google-Smtp-Source: APBJJlGxMtaefB5OYIH9A9tG4cey2jb2WUJlQHyarT2zV+fGHrgpUf+CVv6hEz+oGku5pKoWhIpl7w==
X-Received: by 2002:a17:90a:4985:b0:261:1141:b716 with SMTP id d5-20020a17090a498500b002611141b716mr16407697pjh.33.1688583641465;
        Wed, 05 Jul 2023 12:00:41 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id d7-20020a170902aa8700b001b0358848b0sm19323359plr.161.2023.07.05.12.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 12:00:41 -0700 (PDT)
From:   Charlie Jenkins <charlie@rivosinc.com>
To:     linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     charlie@rivosinc.com, conor@kernel.org, paul.walmsley@sifive.com,
        palmer@rivosinc.com, aou@eecs.berkeley.edu, anup@brainfault.org,
        konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
        mick@ics.forth.gr, jrtc27@jrtc27.com
Subject: [RESEND PATCH v3 0/2] RISC-V: mm: Make SV48 the default address space
Date:   Wed,  5 Jul 2023 11:59:40 -0700
Message-ID: <20230705190002.384799-1-charlie@rivosinc.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Make sv48 the default address space for mmap as some applications
currently depend on this assumption. Also enable users to select
desired address space using a non-zero hint address to mmap. Previous
kernel changes caused Java and other applications to be broken on sv57
which this patch fixes.

Documentation is also added to the RISC-V virtual memory section to explain
these changes.

Charlie Jenkins (2):
  RISC-V: mm: Restrict address space for sv39,sv48,sv57
  RISC-V: mm: Update documentation and include test

 Documentation/riscv/vm-layout.rst             | 22 +++++++++
 arch/riscv/include/asm/elf.h                  |  2 +-
 arch/riscv/include/asm/pgtable.h              | 21 ++++++--
 arch/riscv/include/asm/processor.h            | 34 ++++++++++---
 tools/testing/selftests/riscv/Makefile        |  2 +-
 tools/testing/selftests/riscv/mm/.gitignore   |  1 +
 tools/testing/selftests/riscv/mm/Makefile     | 21 ++++++++
 .../selftests/riscv/mm/testcases/mmap.c       | 49 +++++++++++++++++++
 8 files changed, 139 insertions(+), 13 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/mm/.gitignore
 create mode 100644 tools/testing/selftests/riscv/mm/Makefile
 create mode 100644 tools/testing/selftests/riscv/mm/testcases/mmap.c

-- 
2.41.0

