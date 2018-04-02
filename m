Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4789F7E8A0
	for <lwn-linux-doc@archive.lwn.net>; Mon,  2 Apr 2018 12:32:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752303AbeDBMcP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Apr 2018 08:32:15 -0400
Received: from exmail.andestech.com ([59.124.169.137]:23763 "EHLO
        ATCSQR.andestech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751897AbeDBMcN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Apr 2018 08:32:13 -0400
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
        by ATCSQR.andestech.com with ESMTP id w32CQYoE097130;
        Mon, 2 Apr 2018 20:26:34 +0800 (GMT-8)
        (envelope-from alankao@andestech.com)
Received: from atcsqa06.andestech.com (10.0.1.85) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Mon, 2 Apr 2018
 20:31:39 +0800
From:   Alan Kao <alankao@andestech.com>
To:     Palmer Dabbelt <palmer@sifive.com>, Albert Ou <albert@sifive.com>,
        "Peter Zijlstra" <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        "Arnaldo Carvalho de Melo" <acme@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        "Namhyung Kim" <namhyung@kernel.org>,
        Alex Solomatnikov <sols@sifive.com>,
        "Jonathan Corbet" <corbet@lwn.net>,
        <linux-riscv@lists.infradead.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Alan Kao <alankao@andestech.com>
Subject: [PATCH 0/2] perf: riscv: Preliminary Perf Event Support on RISC-V
Date:   Mon, 2 Apr 2018 20:31:22 +0800
Message-ID: <1522672284-29593-1-git-send-email-alankao@andestech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.0.1.85]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com w32CQYoE097130
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This implements the baseline PMU for RISC-V platforms.

To ease future PMU portings, a guide is also written, containing
perf concepts, arch porting practices and some hints.

Changes in v2:
 - Fix the bug reported by Alex, which was caused by not sufficient
   initialization.  Check https://lkml.org/lkml/2018/3/31/251 for the
   discussion.

Alan Kao (2):
  perf: riscv: preliminary RISC-V support
  perf: riscv: Add Document for Future Porting Guide

 Documentation/riscv/pmu.txt         | 249 +++++++++++++++++++
 arch/riscv/Kconfig                  |  12 +
 arch/riscv/include/asm/perf_event.h |  76 +++++-
 arch/riscv/kernel/Makefile          |   1 +
 arch/riscv/kernel/perf_event.c      | 468 ++++++++++++++++++++++++++++++++++++
 5 files changed, 802 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/riscv/pmu.txt
 create mode 100644 arch/riscv/kernel/perf_event.c

-- 
2.16.2

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
