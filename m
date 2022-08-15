Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB8CC25B0E
	for <linux-doc@archiver.kernel.org>; Mon, 15 Aug 2022 07:14:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241425AbiHOHOY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Aug 2022 03:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241418AbiHOHOV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Aug 2022 03:14:21 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40EF5167E3
        for <linux-doc@vger.kernel.org>; Mon, 15 Aug 2022 00:14:20 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id j144-20020a25d296000000b0067ba828624fso5397232ybg.16
        for <linux-doc@vger.kernel.org>; Mon, 15 Aug 2022 00:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:from:to:cc;
        bh=ohb0g91xU7D2DdYA0JL1cRax0OQX/W61A7iD2+1uSHg=;
        b=dVv56SDG5EnRcQXMZs6Ezlt98xykYA1hTodXE2lnoHYSxyrpaXDgnZt25dKOZ5gaSO
         S2MFDM/Kv+sJH9kS2kB7ziVaf2T9ZHUDBSuO3TV3SZhY7Ij9fLhIv3SG+KITwptljgV6
         w6frt+X0PkDvIqzDWCKGfOWNKHbKAtG1uiKY9ZztzcR5Leaol7GekDlsjEyv7fKrVZZ1
         0HfZ4uPIhe5kXIKFL+HQiRDJanA8fbiXtzXnmRU+InRk5t6nMihmNluu/R5f2oS3pH//
         ASN+5omr8+oWHvyHfo5322qaN2oeZRJlvTQs0A8wCxdNY+CQQBEsz8z1NQSVaxFzSEaH
         3j3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:x-gm-message-state:from:to
         :cc;
        bh=ohb0g91xU7D2DdYA0JL1cRax0OQX/W61A7iD2+1uSHg=;
        b=uWjH6ESuIilEtBIFo4x84Hmu6x2yXlxqFhvGlhDRrJRN2mCRmWcJtSNTY20FxvX1po
         iUt3Pzf/+aofQHLzwQSEaJhviQVHHJoXbbzNXp5+6XSM4kgJB3Rpw2wlE5jpHbhC52HG
         E0946LWXD1Ff4xg1Irw8xxJPh/HRU1GgyyHS/8N5gzD119QgftbioImhDRT0/uftEVR1
         EAZK8ayUtZ30HlX9rE9ZBIRYPFyMuEDbe4OT0ppRaA8ZhZb7qv7uDJIdxcFqdvvwXpaB
         sOdlWYC7+ksKnzJrdCLwLXbTC9Hc/TpxyZBVTp7d1dOwqvua705dNmKMQQWfNghi1oma
         V9ag==
X-Gm-Message-State: ACgBeo0Jpwak8Xh6dzei8Mr8Br114iI7ASPbGKOiF/uLDP9slalOCbSd
        o75/5XUmb427iy8ZH+Yk0Wt7caivwA4=
X-Google-Smtp-Source: AA6agR4o82qI9d9hU/6omiKprw+LPrjRcmI3uYcb9udtkqgeRITd057VCgySuKCF1NblY2iSEHVTEXu2yHI=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:d91:5887:ac93:ddf0])
 (user=yuzhao job=sendgmr) by 2002:a81:7382:0:b0:328:306f:26d2 with SMTP id
 o124-20020a817382000000b00328306f26d2mr12012904ywc.486.1660547659513; Mon, 15
 Aug 2022 00:14:19 -0700 (PDT)
Date:   Mon, 15 Aug 2022 01:13:23 -0600
In-Reply-To: <20220815071332.627393-1-yuzhao@google.com>
Message-Id: <20220815071332.627393-5-yuzhao@google.com>
Mime-Version: 1.0
References: <20220815071332.627393-1-yuzhao@google.com>
X-Mailer: git-send-email 2.37.1.595.g718a3a8f04-goog
Subject: [PATCH v14 04/14] Revert "include/linux/mm_inline.h: fold
 __update_lru_size() into its sole caller"
From:   Yu Zhao <yuzhao@google.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Tejun Heo <tj@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        page-reclaim@google.com, Yu Zhao <yuzhao@google.com>,
        Miaohe Lin <linmiaohe@huawei.com>,
        Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        "=?UTF-8?q?Holger=20Hoffst=C3=A4tte?=" 
        <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch undoes the following refactor:
commit 289ccba18af4 ("include/linux/mm_inline.h: fold __update_lru_size() i=
nto its sole caller")

The upcoming changes to include/linux/mm_inline.h will reuse
__update_lru_size().

Signed-off-by: Yu Zhao <yuzhao@google.com>
Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>
Acked-by: Brian Geffon <bgeffon@google.com>
Acked-by: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
Acked-by: Oleksandr Natalenko <oleksandr@natalenko.name>
Acked-by: Steven Barrett <steven@liquorix.net>
Acked-by: Suleiman Souhlal <suleiman@google.com>
Tested-by: Daniel Byrne <djbyrne@mtu.edu>
Tested-by: Donald Carr <d@chaos-reins.com>
Tested-by: Holger Hoffst=C3=A4tte <holger@applied-asynchrony.com>
Tested-by: Konstantin Kharlamov <Hi-Angel@yandex.ru>
Tested-by: Shuang Zhai <szhai2@cs.rochester.edu>
Tested-by: Sofia Trinh <sofia.trinh@edi.works>
Tested-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 include/linux/mm_inline.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
index 7b25b53c474a..fb8aadb81cd6 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -34,7 +34,7 @@ static inline int page_is_file_lru(struct page *page)
 	return folio_is_file_lru(page_folio(page));
 }
=20
-static __always_inline void update_lru_size(struct lruvec *lruvec,
+static __always_inline void __update_lru_size(struct lruvec *lruvec,
 				enum lru_list lru, enum zone_type zid,
 				long nr_pages)
 {
@@ -43,6 +43,13 @@ static __always_inline void update_lru_size(struct lruve=
c *lruvec,
 	__mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
 	__mod_zone_page_state(&pgdat->node_zones[zid],
 				NR_ZONE_LRU_BASE + lru, nr_pages);
+}
+
+static __always_inline void update_lru_size(struct lruvec *lruvec,
+				enum lru_list lru, enum zone_type zid,
+				long nr_pages)
+{
+	__update_lru_size(lruvec, lru, zid, nr_pages);
 #ifdef CONFIG_MEMCG
 	mem_cgroup_update_lru_size(lruvec, lru, zid, nr_pages);
 #endif
--=20
2.37.1.595.g718a3a8f04-goog

