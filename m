Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6151C2FCFC8
	for <linux-doc@vger.kernel.org>; Fri,  4 Jul 2025 10:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624799; cv=none; b=R7XXNA46QsrZU1uLBQdxQJ/oeLdfC9M42WO7HKv5A/KsSbbiodjnldbejzQL5igUUFhVE/jfX6t7WL2AOuf+mxUYnX3g7/9QlpBKo0Ce2HmmTzhOL5kmxd8tA8Oajlm/7UJEadKMWhqiEutNLYCr7syrq3/OvtW1wRdZbahaXaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624799; c=relaxed/simple;
	bh=s9je96qO6r5yAAE/tRQstaImZtvw0D0SBMiOehTSPeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ifUGa2MIEbw9Jlcnqujo86cffpztFZKEJgbg2GEw5LA/vouZxW/Z2uJ+SdRg25UZmFXlHdy6IcJB145NOMGheHIjh5bHmxudq79s+0zpavWAy/96hPbaGhQbeQe8DWSsaIoe7/4s3AYdRHACals2ccto50uH4ekYykKazuYQ2bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Eb0leDh3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Eb0leDh3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fs/e8+Swpq2YGTbmX8ig9Uwxi9FIgSmYum8BwX+79CI=;
	b=Eb0leDh3vnxoajmPejIxQqniasqUmcEQXIYNzfZQ5dtpcZNcgqQfzDvdlZhxHO3XPgEJvC
	D4vuRydR/ySvMiQSwHZNyhvcS64GYZhcNPmpVtfYGbpdDvGAiVxc12123VzU3MJg7tpXNV
	OwlxsJ0de8u6JpljIkteFlzY3/K/jvc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-JVpv-URwM4qI5Vsh-SFijg-1; Fri, 04 Jul 2025 06:26:35 -0400
X-MC-Unique: JVpv-URwM4qI5Vsh-SFijg-1
X-Mimecast-MFC-AGG-ID: JVpv-URwM4qI5Vsh-SFijg_1751624794
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-453691d0a1dso4389145e9.0
        for <linux-doc@vger.kernel.org>; Fri, 04 Jul 2025 03:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624794; x=1752229594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fs/e8+Swpq2YGTbmX8ig9Uwxi9FIgSmYum8BwX+79CI=;
        b=QC4uuClZmt1eZ+PRP8OlgimSqq6e9rgiOzISLNiTmzySr3aOnvHIer+UHXYCdqZSJo
         Ud+dn0A3zhqMLpwQzd9AHeVy0BXDO1ggUP7sTjNoCvjvvzxSXy1u3Fk8HZeGBDggCnZi
         dDGWJ9NQaL3LFhj6C7XnYgK2UsdPBm9YzldKLQyGQtB/g9B3aN6Tjew23HMesdEwWBFO
         Fv0UJPDeY07s+93RAT8mdPXq71PVB8jfIjdx2CfJ9Wmuml41Cw8KWL74HCTuoPi3h0VN
         YJUb/Fspe1TJHLT1+hMVhErtKdt50vhz1VpZwzSTWBwSa/YwWN7c0uA8eWOCAJfJSChy
         Qodw==
X-Forwarded-Encrypted: i=1; AJvYcCXbDcQi1aeD9UC06Hbe2hNyG84UipgJXVc4rTF75/KAVssFCaB3Wtr797AtOWP1P1Y2d/dtE9ZxO5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLEwHIVFT4dniYGsg1Su08WKsTKCmdZ8t8HRT/wSz/a50j2Oti
	t5aFtQd/Mrbu6Ih88apYZjrXF1DFaHhCZMpsYEkEUfJU91rwciv+UUdGS2jj0NAHhcUfkBlbgVg
	7kbVzF78LMDgKYKKPptE9jrxizG6OwztAGLvxZmF3okdPnFmhLYPaivAdTtLGkA==
X-Gm-Gg: ASbGncubyojkKToyB9ihufMHlnJIszoq862QbDr0SluAJ7hk4MhJ+c2XAugAawfSR2R
	DiXfvJDdMycxvYayfy4aukuRY0V2gzqMjACqUtSxH0WSHOAyMb18dYtS7vFbrLiYo8ZGY9Xz+nT
	2nGEeKpSrR1TKxgXzSuSXubYcMRtVhkpN1YS++INuFGi1RNblqZ9Z/lC2vbpcY5uD3gXxSXAH0W
	ut3qD2Yac6DuXm9Q804C7qgHTFvmXjTAiyUJF+BFFHwWWa3qkdNqD+FKc5xQ2Arsv5Fx+lZI7hs
	dpjxs8qEn2GUVPQdBj3ald8phTvSmnCnRhh8L0hGQqRml5f0N/V/88jkDGvwFkKPyu9rlmrvgic
	Y77kWdQ==
X-Received: by 2002:a05:6000:24c9:b0:3a4:e667:922e with SMTP id ffacd0b85a97d-3b49700c540mr1015600f8f.4.1751624793976;
        Fri, 04 Jul 2025 03:26:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv4//fTRSt2GT11U1TkRjsS9jXLC3kcU+xe7g60I+SsSxP4GVJGQoWX7WuUGQypypw/2H7pw==
X-Received: by 2002:a05:6000:24c9:b0:3a4:e667:922e with SMTP id ffacd0b85a97d-3b49700c540mr1015567f8f.4.1751624793449;
        Fri, 04 Jul 2025 03:26:33 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47285c6c9sm2093397f8f.89.2025.07.04.03.26.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:32 -0700 (PDT)
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
Subject: [PATCH v2 23/29] mm/page-alloc: remove PageMappingFlags()
Date: Fri,  4 Jul 2025 12:25:17 +0200
Message-ID: <20250704102524.326966-24-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704102524.326966-1-david@redhat.com>
References: <20250704102524.326966-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As PageMappingFlags() now only indicates anon (incl. KSM) folios, we can
now simply check for PageAnon() and remove PageMappingFlags().

... and while at it, use the folio instead and operate on
folio->mapping.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 5 -----
 mm/page_alloc.c            | 7 +++----
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 094c8605a879e..fc159fa945351 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -723,11 +723,6 @@ static __always_inline bool folio_mapping_flags(const struct folio *folio)
 	return ((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS) != 0;
 }
 
-static __always_inline bool PageMappingFlags(const struct page *page)
-{
-	return ((unsigned long)page->mapping & PAGE_MAPPING_FLAGS) != 0;
-}
-
 static __always_inline bool folio_test_anon(const struct folio *folio)
 {
 	return ((unsigned long)folio->mapping & PAGE_MAPPING_ANON) != 0;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 4aefeb2ae927f..78ddf1d43c6c1 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1375,10 +1375,9 @@ __always_inline bool free_pages_prepare(struct page *page,
 			(page + i)->flags &= ~PAGE_FLAGS_CHECK_AT_PREP;
 		}
 	}
-	if (PageMappingFlags(page)) {
-		if (PageAnon(page))
-			mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
-		page->mapping = NULL;
+	if (folio_test_anon(folio)) {
+		mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
+		folio->mapping = NULL;
 	}
 	if (unlikely(page_has_type(page)))
 		/* Reset the page_type (which overlays _mapcount) */
-- 
2.49.0

