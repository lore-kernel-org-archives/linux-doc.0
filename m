Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F56DCCA47A
	for <linux-doc@archiver.kernel.org>; Tue, 14 Jun 2022 07:17:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353704AbiFNHRg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Jun 2022 03:17:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353707AbiFNHRe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Jun 2022 03:17:34 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D2B1181C
        for <linux-doc@vger.kernel.org>; Tue, 14 Jun 2022 00:17:32 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id y123-20020a253281000000b0066473f97bf1so6999489yby.3
        for <linux-doc@vger.kernel.org>; Tue, 14 Jun 2022 00:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=D1tI7WDD6BkSp8vdJUGyasd9RspDYVcf2s3K3k00n8E=;
        b=oVRZoBVjG7Z4RBep9kZJo6+f/8GPme9EC4Rjg3mMbmfp42nGp5yz4K6r1QvXRcxPJN
         9mMsDFeH6u1+l2WSoQ3O6zlXfQR4yhMIySD4Z/GkwdIaewcfx6jJrixTMAAqtgMsa34q
         RWlzUXwTCHNovn+liPTEnS7IyzwYNVTpiZlKrhsx4qhGPdMXNEitlBg7tE3NeJZWPJH1
         nTt1+klEynatT9dGdyS+6oZr5/WQoTUASriruXj9BnKhuytK+J2aIZNhfOtOrVdIxPuh
         jSLKFFaZSA+H5uB9Tl0el85eepw4IilpgV9W609BtW5CIgwFJw6QSZYoKZ6+yIMqmqg9
         4A1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=D1tI7WDD6BkSp8vdJUGyasd9RspDYVcf2s3K3k00n8E=;
        b=CbRe3enlN/k+p4G0ixwkTYLjT3ZdD8DjPtnAcWxRMr9GcP+UOSmXXEfqDydycM8SdA
         1y15eWc7KWrBPUphLtvw4cUViISs2J54mgv40DmUTtILHn4/pS/mqiiAA5SlEAiHtwkl
         cyk9vmn3MaDp4hLAX/+M/i4wTrmd69VccaN2WB6937hSDqrKotuFjS28vS+Q/v0D3P+H
         OeO0yTjuWUYUFLChh7yUzihP1kSoB/iDlyM293BYHLSHvvB5JD52RS/NreT+bG1HeH3z
         6giXy0DK4jVkqOvROoYUZTebpt1oQk8AtxbaTxLkA74Qd+EAfL/j3Z2fwBQLAMl9xUPK
         kkmg==
X-Gm-Message-State: AJIora9fbOfWYuCOAXNROBlSMarvNOe9sh+bu8GmWQahzTMroiU+P9Cq
        hop9t4p4rSI6Kylyva0JdxSYFZv+Kzk=
X-Google-Smtp-Source: AGRyM1toFkvdpMNGM0kO7TSnX52idsIuCtYt4XUqDdqzJqgRklSPx3240tBaTFSm3AZCDyJ2di6Eb18fdcQ=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:eaa7:1f3f:e74a:2a26])
 (user=yuzhao job=sendgmr) by 2002:a25:3c45:0:b0:664:cf75:c2d6 with SMTP id
 j66-20020a253c45000000b00664cf75c2d6mr3416410yba.446.1655191051871; Tue, 14
 Jun 2022 00:17:31 -0700 (PDT)
Date:   Tue, 14 Jun 2022 01:16:41 -0600
In-Reply-To: <20220614071650.206064-1-yuzhao@google.com>
Message-Id: <20220614071650.206064-5-yuzhao@google.com>
Mime-Version: 1.0
References: <20220614071650.206064-1-yuzhao@google.com>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH v12 04/14] Revert "include/linux/mm_inline.h: fold
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
2.36.1.476.g0c4daa206d-goog

