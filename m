Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C180C433ED
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 09:40:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E05B36135F
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 09:40:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240515AbhERJlb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 May 2021 05:41:31 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:51855 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S241065AbhERJlb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 May 2021 05:41:31 -0400
X-UUID: c8d085b27e6f43a3b8daca99f7e1c1a8-20210518
X-UUID: c8d085b27e6f43a3b8daca99f7e1c1a8-20210518
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <miles.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1650008695; Tue, 18 May 2021 17:40:10 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 May 2021 17:40:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 18 May 2021 17:40:08 +0800
From:   Miles Chen <miles.chen@mediatek.com>
To:     Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>
CC:     <kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-mm@kvack.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH v2 0/2] mm: unify the allocation of pglist_data instances
Date:   Tue, 18 May 2021 17:24:44 +0800
Message-ID: <20210518092446.16382-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patches is created to fix the __pa() warning messages when
CONFIG_DEBUG_VIRTUAL=y by unifying the allocation of pglist_data
instances.

In current implementation of node_data, if CONFIG_NEED_MULTIPLE_NODES=y,
pglist_data is allocated by a memblock API. If CONFIG_NEED_MULTIPLE_NODES=n,
we use a global variable named "contig_page_data".

If CONFIG_DEBUG_VIRTUAL is not enabled. __pa() can handle both
allocation and symbol cases. But if CONFIG_DEBUG_VIRTUAL is set,
we will have the "virt_to_phys used for non-linear address" warning
when booting.

To fix the warning, always allocate pglist_data by memblock APIs and
remove the usage of contig_page_data.

Warning message:
[    0.000000] ------------[ cut here ]------------
[    0.000000] virt_to_phys used for non-linear address: (____ptrval____) (contig_page_data+0x0/0x1c00)
[    0.000000] WARNING: CPU: 0 PID: 0 at arch/arm64/mm/physaddr.c:15 __virt_to_phys+0x58/0x68
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Tainted: G        W         5.13.0-rc1-00074-g1140ab592e2e #3
[    0.000000] Hardware name: linux,dummy-virt (DT)
[    0.000000] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO BTYPE=--)
[    0.000000] pc : __virt_to_phys+0x58/0x68
[    0.000000] lr : __virt_to_phys+0x54/0x68
[    0.000000] sp : ffff800011833e70
[    0.000000] x29: ffff800011833e70 x28: 00000000418a0018 x27: 0000000000000000
[    0.000000] x26: 000000000000000a x25: ffff800011b70000 x24: ffff800011b70000
[    0.000000] x23: fffffc0001c00000 x22: ffff800011b70000 x21: 0000000047ffffb0
[    0.000000] x20: 0000000000000008 x19: ffff800011b082c0 x18: ffffffffffffffff
[    0.000000] x17: 0000000000000000 x16: ffff800011833bf9 x15: 0000000000000004
[    0.000000] x14: 0000000000000fff x13: ffff80001186a548 x12: 0000000000000000
[    0.000000] x11: 0000000000000000 x10: 00000000ffffffff x9 : 0000000000000000
[    0.000000] x8 : ffff8000115c9000 x7 : 737520737968705f x6 : ffff800011b62ef8
[    0.000000] x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
[    0.000000] x2 : 0000000000000000 x1 : ffff80001159585e x0 : 0000000000000058
[    0.000000] Call trace:
[    0.000000]  __virt_to_phys+0x58/0x68
[    0.000000]  check_usemap_section_nr+0x50/0xfc
[    0.000000]  sparse_init_nid+0x1ac/0x28c
[    0.000000]  sparse_init+0x1c4/0x1e0
[    0.000000]  bootmem_init+0x60/0x90
[    0.000000]  setup_arch+0x184/0x1f0
[    0.000000]  start_kernel+0x78/0x488
[    0.000000] ---[ end trace f68728a0d3053b60 ]---

[1] https://lore.kernel.org/patchwork/patch/1425110/

Change since v1:
- use memblock_alloc() to create pglist_data when CONFIG_NUMA=n

Miles Chen (2):
  mm: introduce prepare_node_data
  mm: replace contig_page_data with node_data

 Documentation/admin-guide/kdump/vmcoreinfo.rst | 13 -------------
 arch/powerpc/kexec/core.c                      |  5 -----
 include/linux/gfp.h                            |  3 ---
 include/linux/mm.h                             |  2 ++
 include/linux/mmzone.h                         |  4 ++--
 kernel/crash_core.c                            |  1 -
 mm/memblock.c                                  |  3 +--
 mm/page_alloc.c                                | 16 ++++++++++++++++
 mm/sparse.c                                    |  2 ++
 9 files changed, 23 insertions(+), 26 deletions(-)


base-commit: 8ac91e6c6033ebc12c5c1e4aa171b81a662bd70f
-- 
2.18.0

