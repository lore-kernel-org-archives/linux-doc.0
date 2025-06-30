Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FD328C020
	for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288439; cv=none; b=d/WxCV8CI3nk2mxceclrw20RixToN7DADMhGU/oxv+YMcsXDudboGSwDwuZFEFl/tXiavacxIbWxNhYRxtbopOf0GFf2pOB6THrnFpq3Rb/JZ/9DIMSZ70TpZobpuP2CuRG6hY5m3hjz8qxmasDg2HFAc92YKVCDzXrzRojexgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288439; c=relaxed/simple;
	bh=19X4bQvLwR3+OfNQbpdo9I8RjESqqjGAQVBNJ6TpCho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ua5u/H+CNBjICoZqJtWfhcdcU+1GGW6ND8QHJ7vY1IWMrOilECwojboHl1IAz9p75ADro2ZRCF2MtHCYY7oVQUNSz3zaYDy7DIp37eGZhN8ER9l/Y5RwSKh1rcDqT/+aKqHAQllWhF5ruStIduC9LaKncxESF23fXbxfdb64lhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZZtiPm4C; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZZtiPm4C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nJlezl1jqk1KHM/JmX+CbcKO2aiRBLF0rBMpUlNHwJA=;
	b=ZZtiPm4CRBEJXRO+ZdNFie79VtmD+a2dEM4gwhi+A4Egp8saFYdPIz5D0SJDMbY/GtxLOt
	dOYFAz8OjWo3etSx3Eao4doNb+1uu3RAQ9v3czBysn3PMhgH86vUbE9kkG2G8vU18/kaTH
	HC/wbAE8D9RPR6C30OWKvd2iYA3iNsc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-bizGEmLLOdCKnOLusOLTPw-1; Mon, 30 Jun 2025 09:00:33 -0400
X-MC-Unique: bizGEmLLOdCKnOLusOLTPw-1
X-Mimecast-MFC-AGG-ID: bizGEmLLOdCKnOLusOLTPw_1751288432
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-453a5d50b81so1634635e9.1
        for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 06:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288432; x=1751893232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJlezl1jqk1KHM/JmX+CbcKO2aiRBLF0rBMpUlNHwJA=;
        b=HBB2JWG9e/zKZL1hUp7k2x+sMKqRrUigel9KLcE+jXEHaSUQZMbcVT9safhtXO66wQ
         lhdZh7WBv97QVhrtCd49zxImouwHjLE4KbI6G0h26gaHdScGwGHTeoNVwrcEYLhFvTlp
         x4by762svlELeW805s46EnxeKgJy9kfL/WdwnmFgjI/JZJfo5A/g5jX0sjG3+lrEU/Ru
         dS/28x/HCxHnuiu+l+VNQM4YWUB5d30HwHddmPMK5v2EZEi6NK/pBJZauVyAUbLnDlN+
         It/uV14Mgb23D84waOQiVD8yVNep61x6sBy4tnoXsPUP4W+ngiw9m5v3v4QaUIiKu8Zi
         yhdA==
X-Forwarded-Encrypted: i=1; AJvYcCV4nyo8omSltttuYKwhTyf0SPcVc14mvwId9Tr/vPOtCc51BAqEdaWtAnW8CUSTZ6USzUZuR8btafw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzivquUz1taZMgJ9qUQlye17BCKArZCpCFX0ZC08PaKGnH6dp/
	OqhIPi447Kyi3sz21N51QHxrKnzn1OOGklw47bpSxB6XUKhohaenhGkBotv6jU2BqbvhV7rY2RM
	T0mI3bLMjkD22mZH74BcI+BiGE1AvDJhf+r80W5VS94oVCHvGePB8QM8qBhISeQ==
X-Gm-Gg: ASbGncslrpteS2YRhJOgUnNfmOM+j34nLuXHzY1XKg9xJOz+EjpUFfSpxHLGgi1A1Sx
	SIMXKGT8sSrGVQL13lwGvahq78lZO/0lzCBmm6LLCTPyh3K1m+9N3oXJ+3ZufPUEEdUZ0q1bNVE
	SBDWp1f7A03+416+2xKsyn8gqSTQ/j4dxleqHWewqvXZusIWAFjJTJB/E54GEKYuE3Yf7mUiiWX
	tyZ5IWfroIEr7dOhAkMZca4DuVZtgCYCziCP+mnHydiKw9fUnNj6t9kPfAlDUMd+wc0l3mQuNq7
	D8+No3QFNsuJj8RA29Qo3V3LlrHGuocT7fH9vHQWsSOBO4EAqfAYEGceJjkmXGUJBlm8H/6BYNR
	x77bwpqE=
X-Received: by 2002:adf:e181:0:b0:3a4:f038:af76 with SMTP id ffacd0b85a97d-3a8feb844cemr10501253f8f.53.1751288431534;
        Mon, 30 Jun 2025 06:00:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGEarPHGaA16flG07pTm8Y+2ZoBRaEqSqyGzIU15EPr/yTHmV5lKxwKCSS//XnEer0oKPVNw==
X-Received: by 2002:adf:e181:0:b0:3a4:f038:af76 with SMTP id ffacd0b85a97d-3a8feb844cemr10501216f8f.53.1751288430998;
        Mon, 30 Jun 2025 06:00:30 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a88c7fadf3sm10557609f8f.34.2025.06.30.06.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:30 -0700 (PDT)
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
Subject: [PATCH v1 06/29] mm/zsmalloc: make PageZsmalloc() sticky until the page is freed
Date: Mon, 30 Jun 2025 14:59:47 +0200
Message-ID: <20250630130011.330477-7-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630130011.330477-1-david@redhat.com>
References: <20250630130011.330477-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let the page freeing code handle clearing the page type.

Acked-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Acked-by: Harry Yoo <harry.yoo@oracle.com>
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

