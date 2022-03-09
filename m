Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7CCC433EF
	for <linux-doc@archiver.kernel.org>; Wed,  9 Mar 2022 02:13:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231414AbiCICOq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Mar 2022 21:14:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231390AbiCICOd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Mar 2022 21:14:33 -0500
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AC2DBF62
        for <linux-doc@vger.kernel.org>; Tue,  8 Mar 2022 18:13:30 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-2d7eaa730d9so6060677b3.13
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 18:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc:content-transfer-encoding;
        bh=Yy5tsDcd68WP2pPFOldj5ImTljRQrxxQbB0W/VdFifI=;
        b=myj6QehgUcdDMIUhTwdMb7r1e8LG/9RAcTZLsXL2s1OyAMur23bVwSIu/k0KWXTzHZ
         fH6S3KpBUYP9/S+Nl8cXsW8N7nLYs/WKHpKRwHjVYn6HmjdVT0/XtIUyuGb1Adn14Lvg
         WQyZLXWhYg9nY1KZbF12jC3ZfQapf+qkKjMbZ5mYgl9TlgonX5fA6K1ZrJPHQrScC6cq
         1M8gea2KivZ8ZpuYKgHlY+xUi7xQYbydOVC8lEvVedSOPfSvtpyhfZsf4LV7jrd3PW0H
         +c9VPO2jvNITKLnKaoTAuHlBIAsvvUiXE+UzYE49Gg+dNQIKahrsy9g+RSH1QcKItEtE
         GZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc:content-transfer-encoding;
        bh=Yy5tsDcd68WP2pPFOldj5ImTljRQrxxQbB0W/VdFifI=;
        b=aS1huf0SdXFK141ZwzeemXXTOV5Pd75zMT72Lo8fn77M/mUEt5e8DJmxVCJOHB88Vh
         ckNW2QYHXO8/SU5A+3JzQYIdHklWt8D3ftGj3iYqWdOYH+IFH3dsDfb8zx3lOJcoBN7q
         N4sRduj2AtDpODHGcwKHY75X9UGISjvI/PYO8wts8I2WA3alglMZ84LT/JaGcFA4spin
         fMdXtubXUjOtz05efByVNFP0vveZHXtTIlSP+PEU0Jf8lqWdcJaYlY0uLvbQDeAzCkqP
         k5Pyx9bwbNy2whh8Va2cXPUWPnf7p3pHQkjyKjBBg0G5GrhpXSOHqZ45tzVSDRkxLCII
         ERpQ==
X-Gm-Message-State: AOAM530D6ZezuYyJ+kWmGPdkCwz/vNUf0s1MdFaRNFpPWgKO0a7dvfSV
        kuw23SGIf4SGcQH+0kXlFnkyK39VB1A=
X-Google-Smtp-Source: ABdhPJxG7tkbMAgu/ZC1YYwUV9yx9Fb/tWNMRDV4ylGpUleQae7EMbOLUvvFr5QrPOxokWS7h8ZsZ3UPNk0=
X-Received: from yuzhao.bld.corp.google.com ([2620:15c:183:200:57a6:54a6:aad1:c0a8])
 (user=yuzhao job=sendgmr) by 2002:a81:238a:0:b0:2dc:49c9:bbaf with SMTP id
 j132-20020a81238a000000b002dc49c9bbafmr14833715ywj.103.1646792009104; Tue, 08
 Mar 2022 18:13:29 -0800 (PST)
Date:   Tue,  8 Mar 2022 19:12:21 -0700
In-Reply-To: <20220309021230.721028-1-yuzhao@google.com>
Message-Id: <20220309021230.721028-5-yuzhao@google.com>
Mime-Version: 1.0
References: <20220309021230.721028-1-yuzhao@google.com>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH v9 04/14] Revert "include/linux/mm_inline.h: fold
 __update_lru_size() into its sole caller"
From:   Yu Zhao <yuzhao@google.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
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
        Mike Rapoport <rppt@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, x86@kernel.org,
        Yu Zhao <yuzhao@google.com>, Brian Geffon <bgeffon@google.com>,
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
index cf90b1fa2c60..2c24f5ac3e2a 100644
--- a/include/linux/mm_inline.h
+++ b/include/linux/mm_inline.h
@@ -32,7 +32,7 @@ static inline int page_is_file_lru(struct page *page)
 	return folio_is_file_lru(page_folio(page));
 }
=20
-static __always_inline void update_lru_size(struct lruvec *lruvec,
+static __always_inline void __update_lru_size(struct lruvec *lruvec,
 				enum lru_list lru, enum zone_type zid,
 				long nr_pages)
 {
@@ -41,6 +41,13 @@ static __always_inline void update_lru_size(struct lruve=
c *lruvec,
 	__mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
 	__mod_zone_page_state(&pgdat->node_zones[zid],
 				NR_ZONE_LRU_BASE + lru, nr_pages);
+}
+
+static __always_inline void update_lru_size(struct lruvec *lruvec,
+				enum lru_list lru, enum zone_type zid,
+				int nr_pages)
+{
+	__update_lru_size(lruvec, lru, zid, nr_pages);
 #ifdef CONFIG_MEMCG
 	mem_cgroup_update_lru_size(lruvec, lru, zid, nr_pages);
 #endif
--=20
2.35.1.616.g0bdcbb4464-goog

