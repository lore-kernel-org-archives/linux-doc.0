Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DBCC4332F
	for <linux-doc@archiver.kernel.org>; Tue, 18 Oct 2022 08:18:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbiJRISQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Oct 2022 04:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbiJRISP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Oct 2022 04:18:15 -0400
Received: from out30-56.freemail.mail.aliyun.com (out30-56.freemail.mail.aliyun.com [115.124.30.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E42C39378B;
        Tue, 18 Oct 2022 01:18:13 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=24;SR=0;TI=SMTPD_---0VSTz0X5_1666081077;
Received: from localhost.localdomain(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VSTz0X5_1666081077)
          by smtp.aliyun-inc.com;
          Tue, 18 Oct 2022 16:18:07 +0800
From:   Xianting Tian <xianting.tian@linux.alibaba.com>
To:     paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, anup@brainfault.org, heiko@sntech.de,
        guoren@kernel.org, mick@ics.forth.gr,
        alexandre.ghiti@canonical.com, bhe@redhat.com, vgoyal@redhat.com,
        dyoung@redhat.com, corbet@lwn.net, Conor.Dooley@microchip.com,
        bagasdotme@gmail.com
Cc:     kexec@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        crash-utility@redhat.com, heinrich.schuchardt@canonical.com,
        k-hagio-ab@nec.com, hschauhan@nulltrace.org, yixun.lan@gmail.com,
        Xianting Tian <xianting.tian@linux.alibaba.com>
Subject: [PATCH V3 0/2] Support VMCOREINFO export for RISCV64
Date:   Tue, 18 Oct 2022 16:17:53 +0800
Message-Id: <20221018081755.6214-1-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As disscussed in below patch set, the patch of 'describe VMCOREINFO export in Documentation'
need to update according to Bagas's comments. 
https://lore.kernel.org/linux-riscv/22AAF52E-8CC8-4D11-99CB-88DE4D113444@kernel.org/

As others patches in above patch set already applied, so this patch set only contains below two
patches.

------
Changes:
   Fix commit message in patch 2: use "Document these RISCV64 exports above" instead of
   "This patch just add the description of VMCOREINFO export for RISCV64."
V1 -> V2:
   Remove unnecessary overline above header text in patch 2.
V2 -> V3:
   Fix commit message in patch 1,2; 
   Use 'space' instead of 'region' for vmemmap description in patch 2.

Xianting Tian (2):
  RISC-V: Add arch_crash_save_vmcoreinfo support
  Documentation: kdump: describe VMCOREINFO export for RISCV64

 .../admin-guide/kdump/vmcoreinfo.rst          | 30 ++++++++++++++++++
 arch/riscv/kernel/Makefile                    |  1 +
 arch/riscv/kernel/crash_core.c                | 29 +++++++++++++++++
 3 files changed, 61 insertions(+)
 create mode 100644 arch/riscv/kernel/crash_core.c

-- 
2.17.1

