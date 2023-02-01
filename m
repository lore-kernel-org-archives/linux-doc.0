Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB10C38142
	for <linux-doc@archiver.kernel.org>; Wed,  1 Feb 2023 09:42:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbjBAJmO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Feb 2023 04:42:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232124AbjBAJmN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Feb 2023 04:42:13 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18555D133;
        Wed,  1 Feb 2023 01:42:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2136EB820FE;
        Wed,  1 Feb 2023 09:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F2FC433EF;
        Wed,  1 Feb 2023 09:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675244528;
        bh=sTT5tFQj78EtBxJrbx7/2N2UtNu0GVF7LSD4xsZyJRo=;
        h=From:To:Cc:Subject:Date:From;
        b=lxpdvwxW69qOeH8nRIRn22n8a2aq0MCQ0QNtVNyf5R23bo4FxmphAZfxJh++eX5P6
         Nu+58oXH4b5tIbBjT8yxQQ37Ls6mpRiccbTJSs7f9wjORn0xSN2SZ28OeLu0CkaXK8
         Bts/ruDT6NprBx48Pv0mbDE6+bwEgRPpwRjkkihxLVZex8o86aDvvUJZn/vdGRaaYA
         Aek1nA6mbTpnDvZ1WLcbX/9H0/pTvn1x0lDVQwwFq6xyveSioTgtJsc6dg8YWpXX07
         jSSQWArCuuAN8dBGoXj3yj7ayjRSfiF1nCGGpMZ4ECGLW+m671pF+17p/K2WJEDroU
         GC/3tVLeeN14Q==
From:   Mike Rapoport <rppt@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Mike Rapoport <rppt@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v3 0/3] docs/mm: remove useless markup
Date:   Wed,  1 Feb 2023 11:41:53 +0200
Message-Id: <20230201094156.991542-1-rppt@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Hi,

Following Jon's gripe about top-of-file labels [1], I went ahead and
updated admin-guide/mm and mm docs to use file names instead of labels for
document cross-referencing.

[1] https://lore.kernel.org/all/87r0vh9n17.fsf@meer.lwn.net

v3:
* fix more missed references in zn_CH translation (kbuild)
* add markup removal in Documentation/mm/physical_memory.rst as the
  first patch in the series to keep Fixe: and Acked-by: tags
* rebase on docs-next

v2: https://lore.kernel.org/all/20230131144220.822989-1-rppt@kernel.org
* fix missed reference in zn_CH translation (kbuild)

v1: https://lore.kernel.org/all/20230129075018.207678-1-rppt@kernel.org

Mike Rapoport (IBM) (3):
  docs/mm: Physical Memory: remove useless markup
  docs/mm: remove useless markup
  docs/admin-guide/mm: remove useless markup

 Documentation/admin-guide/mm/concepts.rst           | 13 +++++--------
 Documentation/admin-guide/mm/hugetlbpage.rst        |  4 +---
 Documentation/admin-guide/mm/idle_page_tracking.rst |  7 ++-----
 Documentation/admin-guide/mm/index.rst              |  3 +--
 Documentation/admin-guide/mm/ksm.rst                |  2 --
 Documentation/admin-guide/mm/memory-hotplug.rst     |  2 --
 Documentation/admin-guide/mm/numa_memory_policy.rst |  2 --
 Documentation/admin-guide/mm/numaperf.rst           |  2 --
 Documentation/admin-guide/mm/pagemap.rst            | 11 ++++-------
 Documentation/admin-guide/mm/shrinker_debugfs.rst   |  2 --
 Documentation/admin-guide/mm/soft-dirty.rst         |  2 --
 Documentation/admin-guide/mm/swap_numa.rst          |  2 --
 Documentation/admin-guide/mm/transhuge.rst          |  2 --
 Documentation/admin-guide/mm/userfaultfd.rst        |  2 --
 Documentation/admin-guide/mm/zswap.rst              |  2 --
 Documentation/core-api/dma-api.rst                  |  2 --
 Documentation/mm/active_mm.rst                      |  2 --
 Documentation/mm/arch_pgtable_helpers.rst           |  2 --
 Documentation/mm/balance.rst                        |  2 --
 Documentation/mm/free_page_reporting.rst            |  2 --
 Documentation/mm/frontswap.rst                      |  2 --
 Documentation/mm/highmem.rst                        |  2 --
 Documentation/mm/hmm.rst                            |  4 +---
 Documentation/mm/hugetlbfs_reserv.rst               |  4 +---
 Documentation/mm/hwpoison.rst                       |  2 --
 Documentation/mm/ksm.rst                            |  4 +---
 Documentation/mm/memory-model.rst                   |  2 --
 Documentation/mm/mmu_notifier.rst                   |  2 --
 Documentation/mm/numa.rst                           |  4 +---
 Documentation/mm/page_frags.rst                     |  2 --
 Documentation/mm/page_migration.rst                 |  6 ++----
 Documentation/mm/page_owner.rst                     |  2 --
 Documentation/mm/page_reclaim.rst                   |  2 --
 Documentation/mm/page_table_check.rst               |  2 --
 Documentation/mm/physical_memory.rst                | 12 ++++++------
 Documentation/mm/remap_file_pages.rst               |  2 --
 Documentation/mm/slub.rst                           |  2 --
 Documentation/mm/split_page_table_lock.rst          |  2 --
 Documentation/mm/transhuge.rst                      |  2 --
 Documentation/mm/unevictable-lru.rst                |  2 --
 Documentation/mm/z3fold.rst                         |  2 --
 Documentation/mm/zsmalloc.rst                       |  2 --
 .../translations/zh_CN/admin-guide/mm/index.rst     |  2 +-
 Documentation/translations/zh_CN/mm/hmm.rst         |  2 +-
 .../translations/zh_CN/mm/hugetlbfs_reserv.rst      |  2 +-
 Documentation/translations/zh_CN/mm/numa.rst        |  2 +-
 46 files changed, 29 insertions(+), 113 deletions(-)


base-commit: 747a5a95bf3e48feba8350265aeed85a6b516bbd
-- 
2.35.1

