Return-Path: <SRS0=2m1s=C2=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35E9C43461
	for <linux-doc@archiver.kernel.org>; Thu, 17 Sep 2020 08:10:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 810A1221E7
	for <linux-doc@archiver.kernel.org>; Thu, 17 Sep 2020 08:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600330224;
	bh=c5TmzbpIrEVAt9sd99ho7XUbJVUUU2idBFIUP3aW+UA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ng+ODxMoOZpXYAJHFdbGQX1IBRkYMGG4y+GTSgH1xgDTrEPMmOXoQgRu+fMhdQIS8
	 4+w9vLsNdPKCBinCmWUcl8rWzr6kpKNJlVelX1NqbktBWR41Z6fQtoNmFoiRlkYW6M
	 tNjsB8TdIjD6yGXv6qydGPg0fak1BqhMN8GDyz1s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgIQIGc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Sep 2020 04:06:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:47904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726419AbgIQIGJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 17 Sep 2020 04:06:09 -0400
Received: from mail.kernel.org (ip5f5ad5d2.dynamic.kabel-deutschland.de [95.90.213.210])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BD1652083B;
        Thu, 17 Sep 2020 08:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600329870;
        bh=c5TmzbpIrEVAt9sd99ho7XUbJVUUU2idBFIUP3aW+UA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KzPSefoMA5MrB5981SX7oyhdBEhPQ6cFFxfHdNGFYWefsdDcqxVPIPVHF7pMwbKjy
         93aj74UoZ96o1nro4vBCmMi0hDfAp3TbgL7vK/meYXPa7kCIXWI1FCD0PwjjSSWgBB
         tmXN2I7Kk1tucOoNJgd0SueYLpsYaqQ1Wk/7mPac=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kIou4-0051LS-9p; Thu, 17 Sep 2020 10:04:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Andreas Gruenbacher <agruenba@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Guoqing Jiang <guoqing.jiang@cloud.ionos.com>,
        Jens Axboe <axboe@kernel.dk>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        William Kucharski <william.kucharski@oracle.com>,
        Yang Shi <yang.shi@linux.alibaba.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] mm: pagemap.h: fix two kernel-doc markups
Date:   Thu, 17 Sep 2020 10:04:26 +0200
Message-Id: <8e49099fa71f0f5098c21c6d1e2575d4c357f8c0.1600328701.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1600328701.git.mchehab+huawei@kernel.org>
References: <cover.1600328701.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset 6c8adf8446a3 ("mm: add find_lock_head") renamed the
index parameter, but forgot to update the kernel-doc markups
accordingly.

Fixes: 6c8adf8446a3 ("mm: add find_lock_head")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/linux/pagemap.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 4e52a3ff92fb..965ee92df1ad 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -308,9 +308,9 @@ static inline struct page *find_get_page_flags(struct address_space *mapping,
 /**
  * find_lock_page - locate, pin and lock a pagecache page
  * @mapping: the address_space to search
- * @offset: the page index
+ * @index: the page index
  *
- * Looks up the page cache entry at @mapping & @offset.  If there is a
+ * Looks up the page cache entry at @mapping & @index.  If there is a
  * page cache page, it is returned locked and with an increased
  * refcount.
  *
@@ -327,9 +327,9 @@ static inline struct page *find_lock_page(struct address_space *mapping,
 /**
  * find_lock_head - Locate, pin and lock a pagecache page.
  * @mapping: The address_space to search.
- * @offset: The page index.
+ * @index: The page index.
  *
- * Looks up the page cache entry at @mapping & @offset.  If there is a
+ * Looks up the page cache entry at @mapping & @index.  If there is a
  * page cache page, its head page is returned locked and with an increased
  * refcount.
  *
-- 
2.26.2

