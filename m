Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BDB2F49F6
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 17:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268442; cv=none; b=eA+nJqpB/lVudLOaUQBVPVLkvP6XkxwgE9jBtxALhLnJyBGT54hvLAr7xhabrWzMYkqbjhs+6cPmciXQLcHmaQqwzRIz6cdK4QqP1i34nGl7v/rFvvajX+JkBIjnLdLSSrOJck/X7DGCZjrG10JUPbzQS6JJEz3CI8TydQhS6/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268442; c=relaxed/simple;
	bh=9PSofqRI4P1+E7gv4s7LsRbrQULLczAgLmwV7OUNB6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RAEhN0KTY6ObVKDpkDQSOg6hM/iwGOUmdSYkuoBNNos3dmBeZSqB4IV/ia8d+CbS11y7i+ZJ55e4I5WNOvkp/B1u/t+Rrb3eNKt3uBF9RmDj7BglZSrur3fTa38q57MGkdUeCXAWPcijEtisrTm+gMfFrsdEx8NUDv40FQ4hSw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Snc1nipK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Snc1nipK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=piFGbpStSQJy+mcXr4hbLewWyhEioJRgfJ7dmrDuxBM=;
	b=Snc1nipKaNdkcNg8AjK+9VyrpB/4ixVoOgM1ZU/w8EGDO/fJg7RDi0yH7IwiHFlGWJ6zcC
	n+8NBjD9SaCn0MNB3CagI9oEDfzz/UPFmfsC8pilDvFGDIE+hwf2bNp3lUqW8ETtKh8Pb+
	66eTEEZRMuXiMiZllS45ZBjkNVdybII=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-F4GteVkwMkurVWguRs-nCg-1; Wed, 18 Jun 2025 13:40:34 -0400
X-MC-Unique: F4GteVkwMkurVWguRs-nCg-1
X-Mimecast-MFC-AGG-ID: F4GteVkwMkurVWguRs-nCg_1750268433
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-451dda846a0so56144375e9.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 10:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268433; x=1750873233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=piFGbpStSQJy+mcXr4hbLewWyhEioJRgfJ7dmrDuxBM=;
        b=li60H4Tmlj4xvWeiYD48vWBakMI29ZM7xUt/6EWlPj45G1nYAbwCVgz6YFk2nicopV
         sObpFqT0q+RDrvt7ygzCm1Qwe5+pY0+iz+tqbQBkKr2ba24lc4SOnnlZctQimgyhC2EG
         Z4nX+wEFVgwXK5gTYRAOno7gksGq7AbgkcAxXxgTzaq+zlxEJYVC6D5pwS/4WO5Pv13M
         A9oPV/cr3pJifwrluDvdrfeSTTUfu9wjLfZ4h2K/Uwg2b9/nz9RKNr7pQGfEpvagaYee
         bGq296oTgzX3didnvdP8nw26dw7Wj13w2OzSuFFuUqR2Gxq8C+4sV5nD73fkCTgzsqrZ
         jtYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3HWX+/FikAU/S5BDCFc9/ZXHih19E8nU9mnRuDwHIxCly0yRWcfioG5LIMOka9vUwSvigXwIXf6E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykmm0dVcWLz8dXUt+To0RAmRVsFC582isVyiy/W46o88W7xcdG
	V2xW+nkoOlnRb0BQ2ieBXo4ydEV2uhBRYjaRxNppKUsKhTSqTSurympWDefmNUP5nCAkF2pna1l
	qP4/pMhslBSRHdWvocJ9YWEE+OJwJ9Ytop6tJbAkglubwoDXgijRr4tWTBtFDCg==
X-Gm-Gg: ASbGnctqCdYgur2d7oVzc4tUi6L90LyYcykgA3SPTNxu695wJGLlJpdiDLdwW+btMTq
	08MxHvFI/Sa/OqIaYqBvMiCawcvHw+Cme0cTKqi5nASf2uN3o9ThTx0CZSINDEOkC5XsXueWMy/
	kKxvltR2b3mCbWCleSyfwkGG2We6FyF6WHv5Sa1Nd7RJ3qRpUleVD4SGcf2o6hglzPfcGoL/mxg
	uTs6cnBHfrP93BHnD2H0SSQpHJV45mg/8qWNNoL36ZiuNHaeaciRResVKR+8tdb2V/pXpyBSDqX
	mtPxfoCx9T/VektR8cMdLyBwC8TMdGy5W3cDN1n2rpxYG7xZ6eAyxE3m4JJPRHyRbxd7BJ2x1uj
	e6sdMUg==
X-Received: by 2002:a05:600c:8b26:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-4533ca6635amr196392775e9.10.1750268433003;
        Wed, 18 Jun 2025 10:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPWAw9+UfLP1Ct5dqz9wzZx48CMnDwfNIf0E7YgKYn6BQsIliiNikQN1x74QYxh04+83mIbA==
X-Received: by 2002:a05:600c:8b26:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-4533ca6635amr196392375e9.10.1750268432585;
        Wed, 18 Jun 2025 10:40:32 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535e99d5bbsm3600465e9.36.2025.06.18.10.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:32 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: [PATCH RFC 06/29] mm/zsmalloc: make PageZsmalloc() sticky
Date: Wed, 18 Jun 2025 19:39:49 +0200
Message-ID: <20250618174014.1168640-7-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618174014.1168640-1-david@redhat.com>
References: <20250618174014.1168640-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let the buddy handle clearing the type.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/zpdesc.h   | 5 -----
 mm/zsmalloc.c | 3 +--
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/mm/zpdesc.h b/mm/zpdesc.h
index 5cb7e3de43952..5763f36039736 100644
--- a/mm/zpdesc.h
+++ b/mm/zpdesc.h
@@ -163,11 +163,6 @@ static inline void __zpdesc_set_zsmalloc(struct zpdesc *zpdesc)
 	__SetPageZsmalloc(zpdesc_page(zpdesc));
 }
 
-static inline void __zpdesc_clear_zsmalloc(struct zpdesc *zpdesc)
-{
-	__ClearPageZsmalloc(zpdesc_page(zpdesc));
-}
-
 static inline struct zone *zpdesc_zone(struct zpdesc *zpdesc)
 {
 	return page_zone(zpdesc_page(zpdesc));
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 7f1431f2be98f..f98747aed4330 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -880,7 +880,7 @@ static void reset_zpdesc(struct zpdesc *zpdesc)
 	ClearPagePrivate(page);
 	zpdesc->zspage = NULL;
 	zpdesc->next = NULL;
-	__ClearPageZsmalloc(page);
+	/* PageZsmalloc is sticky until the page is freed to the buddy. */
 }
 
 static int trylock_zspage(struct zspage *zspage)
@@ -1055,7 +1055,6 @@ static struct zspage *alloc_zspage(struct zs_pool *pool,
 		if (!zpdesc) {
 			while (--i >= 0) {
 				zpdesc_dec_zone_page_state(zpdescs[i]);
-				__zpdesc_clear_zsmalloc(zpdescs[i]);
 				free_zpdesc(zpdescs[i]);
 			}
 			cache_free_zspage(pool, zspage);
-- 
2.49.0

