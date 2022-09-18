Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBE7C6FA86
	for <linux-doc@archiver.kernel.org>; Sun, 18 Sep 2022 08:01:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiIRIBL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 18 Sep 2022 04:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbiIRIBI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 18 Sep 2022 04:01:08 -0400
Received: from mail-il1-x14a.google.com (mail-il1-x14a.google.com [IPv6:2607:f8b0:4864:20::14a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD94025E8F
        for <linux-doc@vger.kernel.org>; Sun, 18 Sep 2022 01:01:07 -0700 (PDT)
Received: by mail-il1-x14a.google.com with SMTP id i27-20020a056e021d1b00b002eb5eb4d200so17528794ila.21
        for <linux-doc@vger.kernel.org>; Sun, 18 Sep 2022 01:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:from:to:cc:subject:date;
        bh=LfXLdPDU9TThOhZ4D2zE649TQFD3EB2UjkrzF5+qab4=;
        b=SlZAvCwe70kcEYStzy3ejhcQi3d7Xy7elLllvxMkvk59q1SQYhhYi7+r2b7aX/pqim
         BjIUN56FwknIr6rOSB7nJUWyc9ojfXyUH72SJ+F+8lQnaJWUfJ/3BRto0kDqMWrcoEqn
         BwcVk95+p2CPlmy4aZoHof2DqblnOfudgeZ9DbzjGlwGUNunV9jUU5Lj96I/sobaZZzJ
         l1AErF1eCZf+PiVTrxC3kOBunHre5Tl5HOqGwUGYvngWRQEDq81KsC6PLSXX9BDfaxn2
         ldS1LqZwQ122hUlG4bJC3reWnejDFjkXs5VdXrwDVPXA84qoBlylRQ9lhOEnZ7Zl4Ps9
         o5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:x-gm-message-state:from:to
         :cc:subject:date;
        bh=LfXLdPDU9TThOhZ4D2zE649TQFD3EB2UjkrzF5+qab4=;
        b=jwok3PoRBQJg4HYN6h9b9aDNMqXpiw1uEdwoprDz/rCrwtGSJNC/tvVdYxhxtG9xVJ
         fJFYbzR7ubkV8MoXGnbHjlKImM01V7SV93cbaaeQJxZiFPI9cA3of/Kkt5ItrhaF73cB
         mTJwngIrVTG9gEFVKzkqlUPN3bGoETOqua3rxQJ3MELQ0KfkAAD30qgpi2GJVj4wrti1
         uwv7bNhPO1KC1Qz8EL7vR31ouDsfIve4eHOx/bZo2Fp5IkFebPilXKvvDAYbwmkJ2VtD
         mnfgqsZFkPkmz+VYnV5UMehFj/LbfYtTtmurd9C7n19qAmDWhSHnb+9Z7rtafbHMbHSP
         +ZRw==
X-Gm-Message-State: ACrzQf38N6/TREBNnEkRlSHDm9ce9YXtebsX1leDkn0apb+6amrhzbok
        8wz8AlO1zOybsIU4anDtiPiC+1zKokM=
X-Google-Smtp-Source: AMsMyM755bmDWnBK6LJsVSzni+E6x/QOF90An1XIDUfgsb2t5MR125J+BErzWcPBoilK3Vf0mfhlesRNgHg=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:c05a:2e99:29cd:d157])
 (user=yuzhao job=sendgmr) by 2002:a05:6602:2f01:b0:678:935f:abd8 with SMTP id
 q1-20020a0566022f0100b00678935fabd8mr4892732iow.20.1663488067079; Sun, 18 Sep
 2022 01:01:07 -0700 (PDT)
Date:   Sun, 18 Sep 2022 02:00:01 -0600
In-Reply-To: <20220918080010.2920238-1-yuzhao@google.com>
Message-Id: <20220918080010.2920238-5-yuzhao@google.com>
Mime-Version: 1.0
References: <20220918080010.2920238-1-yuzhao@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Subject: [PATCH mm-unstable v15 04/14] Revert "include/linux/mm_inline.h: fold
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
2.37.3.968.ga6b4b080e4-goog

