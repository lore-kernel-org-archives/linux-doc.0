Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2F9DB7DD31
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Apr 2018 23:28:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753666AbeDSX2h (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Apr 2018 19:28:37 -0400
Received: from exmail.andestech.com ([59.124.169.137]:47086 "EHLO
        ATCSQR.andestech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753581AbeDSX2g (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Apr 2018 19:28:36 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
        by ATCSQR.andestech.com with ESMTP id w3JNLVGI003066;
        Fri, 20 Apr 2018 07:21:31 +0800 (GMT-8)
        (envelope-from alankao@andestech.com)
Received: from atcsqa06.andestech.com (10.0.1.85) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Fri, 20 Apr 2018
 07:27:57 +0800
From:   Alan Kao <alankao@andestech.com>
To:     Palmer Dabbelt <palmer@sifive.com>, Albert Ou <albert@sifive.com>,
        "Peter Zijlstra" <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        "Arnaldo Carvalho de Melo" <acme@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        "Namhyung Kim" <namhyung@kernel.org>,
        Alex Solomatnikov <sols@sifive.com>,
        Atish Patra <atish.patra@wdc.com>,
        Jonathan Corbet <corbet@lwn.net>,
        <linux-riscv@lists.infradead.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Alan Kao <alankao@andestech.com>,
        Greentime Hu <greentime@andestech.com>,
        Nick Hu <nickhu@andestech.com>
Subject: [PATCH v5 0/2] perf: riscv: Preliminary Perf Event Support on RISC-V
Date:   Fri, 20 Apr 2018 07:27:48 +0800
Message-ID: <1524180470-8622-1-git-send-email-alankao@andestech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.1.85]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com w3JNLVGI003066
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This implements the baseline PMU for RISC-V platforms.

To ease future PMU portings, a guide is also written, containing
perf concepts, arch porting practices and some hints.

Changes in v5:
 - Fix patch errors from checkpatch.pl.

Changes in v4:
 - Fix several compilation errors.  Sorry for that.
 - Raise a warning in the write_counter body.

Changes in v3:
 - Fix typos in the document.
 - Change the initialization routine from statically assigning PMU to
   device-tree-based methods, and set default to the PMU proposed in
   this patch.

Changes in v2:
 - Fix the bug reported by Alex, which was caused by not sufficient
   initialization.  Check https://lkml.org/lkml/2018/3/31/251 for the
   discussion.

Alan Kao (2):
  perf: riscv: preliminary RISC-V support
  perf: riscv: Add Document for Future Porting Guide

 Documentation/riscv/pmu.txt         | 249 ++++++++++++++
 arch/riscv/Kconfig                  |  13 +
 arch/riscv/include/asm/perf_event.h |  79 ++++-
 arch/riscv/kernel/Makefile          |   1 +
 arch/riscv/kernel/perf_event.c      | 485 ++++++++++++++++++++++++++++
 5 files changed, 823 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/riscv/pmu.txt
 create mode 100644 arch/riscv/kernel/perf_event.c

-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
