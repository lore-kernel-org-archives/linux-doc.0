Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA7CCC433F5
	for <linux-doc@archiver.kernel.org>; Tue,  4 Jan 2022 20:24:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233711AbiADUYT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 Jan 2022 15:24:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232911AbiADUXj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Jan 2022 15:23:39 -0500
Received: from mail-io1-xd4a.google.com (mail-io1-xd4a.google.com [IPv6:2607:f8b0:4864:20::d4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C4B4C061399
        for <linux-doc@vger.kernel.org>; Tue,  4 Jan 2022 12:23:34 -0800 (PST)
Received: by mail-io1-xd4a.google.com with SMTP id p129-20020a6b8d87000000b00601b30457cdso20671647iod.17
        for <linux-doc@vger.kernel.org>; Tue, 04 Jan 2022 12:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=3mcZXTFAVVKAScTp9T3FYR4LKZEXMUV/Knzjk0tHVBE=;
        b=mCSkJPXwf5wHh/HtH5JZ+zUi3W3uwEIfDgmRUzHvNJepZwEhIS/LNb9n1UjALu6Szd
         LW2tgMSnTS94ajbP0LuotYeROOEjgYIqL1r52Fu2ahDG5lg6pwzoRhy2smYNkegSkyCh
         fxekftRQoLrHbGM7wBD6FLHByCTPJBiPTHg5NzOXkEp8FArYs2b/ajTU7WVFy14ke9FT
         wVCe1XGRcC2oVFeMgkzm4EvQ8o3PjhPioXo3Im20qILTBCqmMzInC/LY06qm4KQ5/lUz
         pqVasfgkpB0nb6Ec57SKzh/tKLoHnlE0A5BzuFT1bUxWh1TICakRWiay0NjrwCrWvetR
         mEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=3mcZXTFAVVKAScTp9T3FYR4LKZEXMUV/Knzjk0tHVBE=;
        b=vq1A9ArqpmEAJUPofxGGlhp4xB9fzxnAB8jJdGdXJF78IgfanYtTynZy5trf5+5+KJ
         RolwBkgymQem3Jr6XZCh4QLpgE7M+nw9+1F98GE/5c/lIYioA0oFn/all40JpvaXEEw3
         mVgEIdvUBaDpvcY+4hc4JAI2YU0oJBSTKiX6I3uqIsvw+WOEdsYnfn4wE8IJCMnH1GCz
         wEP7iNq6CP4zOxuk4ZI+3DpPbHGd4nmzXgMGsXg/TilMPmmcowzyJBwbfPkn6K38pTMf
         K+9ZIYbkHnA86dq+o2bGnULFQiCqBXkzDl4CMpDRtvsYFP3XEh+s6uEqOctEjdqJunCl
         YsJw==
X-Gm-Message-State: AOAM531iO7bApYaGeh74jtm0kTMXqhjomFCxpfC3TUh1MlMKvadzTfO9
        rciydZA3lRbNg1lNOWUz3TQ5LHfD95M=
X-Google-Smtp-Source: ABdhPJyZPE5V4Ptt+nYa5Cps4VQsza0yacqlO/1013IgaXvoQvd8iavdrzdCI+Jz1MdsuYRS3ehUPNavaKw=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:6c8c:5506:7ca2:9dfd])
 (user=yuzhao job=sendgmr) by 2002:a92:d849:: with SMTP id h9mr24622336ilq.181.1641327813743;
 Tue, 04 Jan 2022 12:23:33 -0800 (PST)
Date:   Tue,  4 Jan 2022 13:22:28 -0700
In-Reply-To: <20220104202227.2903605-1-yuzhao@google.com>
Message-Id: <20220104202227.2903605-10-yuzhao@google.com>
Mime-Version: 1.0
References: <20220104202227.2903605-1-yuzhao@google.com>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH v6 9/9] mm: multigenerational lru: Kconfig
From:   Yu Zhao <yuzhao@google.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, x86@kernel.org,
        Yu Zhao <yuzhao@google.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add configuration options for the multigenerational lru.

Signed-off-by: Yu Zhao <yuzhao@google.com>
Tested-by: Konstantin Kharlamov <Hi-Angel@yandex.ru>
---
 Documentation/vm/multigen_lru.rst | 18 ++++++++++++
 mm/Kconfig                        | 48 +++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/Documentation/vm/multigen_lru.rst b/Documentation/vm/multigen_lru.rst
index 6f9e0181348b..a54c5637c455 100644
--- a/Documentation/vm/multigen_lru.rst
+++ b/Documentation/vm/multigen_lru.rst
@@ -6,6 +6,13 @@ Multigenerational LRU
 
 Quick start
 ===========
+Build configurations
+--------------------
+:Required: Set ``CONFIG_LRU_GEN=y``.
+
+:Optional: Set ``CONFIG_LRU_GEN_ENABLED=y`` to enable this feature by
+ default.
+
 Runtime configurations
 ----------------------
 :Required: Write ``1`` to ``/sys/kernel/mm/lru_gen/enable`` if the
@@ -25,6 +32,17 @@ Personal computers
 
 Data centers
 ------------
+:Optional: Change ``CONFIG_NR_LRU_GENS`` to a larger value to support
+ more generations for ``Working set estimation`` and
+ ``Proactive reclaim``.
+
+:Optional: Change ``CONFIG_TIERS_PER_GEN`` to a larger value to
+ support more tiers, which generally provide better protection for
+ page cache when under heavy buffered I/O workloads.
+
+:Optional: Set ``CONFIG_LRU_GEN_STATS=y`` to enable full stats for
+ debugging. See ``Debugfs interface``.
+
 :Debugfs interface: ``/sys/kernel/debug/lru_gen`` has the following
  format:
  ::
diff --git a/mm/Kconfig b/mm/Kconfig
index 356f4f2c779e..8a33605917f5 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -900,6 +900,54 @@ config IO_MAPPING
 config SECRETMEM
 	def_bool ARCH_HAS_SET_DIRECT_MAP && !EMBEDDED
 
+# multigenerational lru {
+config LRU_GEN
+	bool "Multigenerational LRU"
+	depends on MMU
+	# the following options can use up the spare bits in page flags
+	depends on !MAXSMP && (64BIT || !SPARSEMEM || SPARSEMEM_VMEMMAP)
+	help
+	  A high performance LRU implementation for memory overcommit. See
+	  Documentation/vm/multigen_lru.rst for details.
+
+config LRU_GEN_ENABLED
+	bool "Enable by default"
+	depends on LRU_GEN
+	help
+	  This option enables the multigenerational lru by default.
+
+config NR_LRU_GENS
+	int "Max number of generations"
+	depends on LRU_GEN
+	range 4 31
+	default 4
+	help
+	  This option uses order_base_2(N+1) bits in page flags.
+
+	  Do not configure more generations than you plan to use. They have a
+	  per-memcg and per-node memory overhead.
+
+config TIERS_PER_GEN
+	int "Number of tiers per generation"
+	depends on LRU_GEN
+	range 2 5
+	default 4
+	help
+	  This option uses N-2 bits in page flags.
+
+	  Larger values generally provide better protection for page cache when
+	  under heavy buffered I/O workloads.
+
+config LRU_GEN_STATS
+	bool "Full stats for debugging"
+	depends on LRU_GEN
+	help
+	  This option keeps historical stats for evicted generations.
+
+	  Do not enable full stats unless you plan to look at them. They have a
+	  per-memcg and per-node memory overhead.
+# }
+
 source "mm/damon/Kconfig"
 
 endmenu
-- 
2.34.1.448.ga2b2bfdf31-goog

