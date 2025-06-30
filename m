Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2649928CF5D
	for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 13:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288460; cv=none; b=GarrTArCs4jrYvt9YNzk5Oq0Q4F1QCH2Xmjfk2aRuiH6zok3D3Jym8iuU81h7Vw+TkzkBAhfi8HuTDV5aEWRXBjm3DTSnxn2enoMfdR0QNfty21+rvV8ayHrrDw2qWfQMhM8Z6dxCKK5LVTRU55U3UB22wAewqPGYWrt7XuTgWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288460; c=relaxed/simple;
	bh=B4KdnntE/37K79ZPh7jyK3I0hRR/1p6A2DVmbrYflX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D0ZbOX1p0QB1lANY8AZTlCpkd/e4MqrShg8NwoZOKg/5QHJnukBlSPLykpZRN8bNV4eCKsdKV86/LiPwiPT86clXIwcx+hujRAV9ug4ZCRX2y9gBqmxXve1Wgyb6sinCBCacTeN+o9YZFflWH3IvnvSJz6toZxhiiarOZhb91UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N9Lvo2ED; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N9Lvo2ED"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HE4ZFr/3yO/kcvQGBFxRWJWFhigh7sWDavgkH8Q96v8=;
	b=N9Lvo2EDW0DlVkb6NYXC/ecPvSHZEmRw0oy2bjE/uQn9PO/2fvWJqo0mWIRd3SqjIvztfU
	3JW1dWT4gTo0vr7+ZG6KxWTQTNu07vSSlrfbM70oRbRMTZFn5LI8SrqgwDNJuWaBn6bXfW
	gjkoWoA1BppFxxBNP02JevTMjObrE+w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-Jzet8qJaMtqjpMqYRHwGCA-1; Mon, 30 Jun 2025 09:00:52 -0400
X-MC-Unique: Jzet8qJaMtqjpMqYRHwGCA-1
X-Mimecast-MFC-AGG-ID: Jzet8qJaMtqjpMqYRHwGCA_1751288451
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4ff581df3so2195044f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 06:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288451; x=1751893251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HE4ZFr/3yO/kcvQGBFxRWJWFhigh7sWDavgkH8Q96v8=;
        b=Jzh80kWXaGbuZ3ahEFck1bwejP1HKwJYUtFluBTGTaUIwQT0Cg9ei/+yCWu+IVUlfq
         ExJ6qgg4lSh7uEHXlS8P0B83F29p0YjXSZabVkOKmOhb5YhS4UUmAfuvYWw4O1zDXmCD
         ep+42bxz2cJW4nt+LhTAU3NLwbmsjumJ/Tl0q+cxj7jujUeQToPb5izMcDxbWf4/WIA4
         cMLXR3qaixUM8/twCULX0cuUsL0in0sk7MXJU2cCl0TSaN8AhCBJ/jLOdjbpl0T/7qF5
         Wec/gGmaGCTyc9Z+bmUCOJtB8opaC9rEgUcQ26+ya9ZXjQsuAgcfLYlrcs3UxKFSj/rU
         W5rg==
X-Forwarded-Encrypted: i=1; AJvYcCWnKCmFP6N1KCAuZWfinrQ3ngUUB0NB4pKo3bgstCn4I9V+pJTCowXQ9kBlyhgyPsJnMoWPP8/9BDI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvu5Kr5HDKO3Qp845U35MTeWBvoV9gzDFZdDLdYu4W1Mk39/VV
	IK+CGAHkAiW0wZAY8faPa1T2SXZ+NKq+3oeiCz7Aae/kWrBVTCONVeFzurLnvPYrCH2ujCxtj4U
	j3K+8+i7LRIplUXdto4Mh06FM00FNekI+qfbgHuuDCEfo6zIRBiUrXhr5YiiooQ==
X-Gm-Gg: ASbGnctXf5gMsSsT2sZCZ32sux6oLevX6A2iMJRaw+ZhBJNvYwQRuYobjHyzQuXbrg9
	XByXb0xaMNrzL8vevfiJgWDmKWDlmonh3qGqvjqOAjRqL1+0x4FkAfk057X+ONlehP6F6qNlkCh
	GmaTJYnSOhBvBfcel6f3REGlO4t0BaTMIqq0dDeP973Cy89btA5dcvA7/1OWB1Sl+3NyXJHSJQv
	tN6j3XUSSbMpzpVqAXcZ01UmLCX5jQJrRUZdVOZwaE6swO+CDFmTNqxuttz0r/tYHJu+qG2+xu4
	KI4QO+/cl0ruW20PpXIh1v1kW5IGFEChGRNXwJQJpCnbGqEfGgQIUQI8aJ/4Lco4q6f3ORw4Whb
	GbLaG+e0=
X-Received: by 2002:a05:6000:2186:b0:3aa:ac7b:705a with SMTP id ffacd0b85a97d-3aaac7b761amr5970037f8f.11.1751288448882;
        Mon, 30 Jun 2025 06:00:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB1TGCDIUZET9zX0pBSLAtGHjOK3AMuobCCTliN5r8xMP/2a92mQUobTb4bSUGBJMrG9p6Jg==
X-Received: by 2002:a05:6000:2186:b0:3aa:ac7b:705a with SMTP id ffacd0b85a97d-3aaac7b761amr5969952f8f.11.1751288447748;
        Mon, 30 Jun 2025 06:00:47 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a88c80b5aesm10252042f8f.44.2025.06.30.06.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:47 -0700 (PDT)
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
Subject: [PATCH v1 12/29] mm/zsmalloc: stop using __ClearPageMovable()
Date: Mon, 30 Jun 2025 14:59:53 +0200
Message-ID: <20250630130011.330477-13-david@redhat.com>
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

Instead, let's check in the callbacks if the page was already destroyed,
which can be checked by looking at zpdesc->zspage (see reset_zpdesc()).

If we detect that the page was destroyed:

(1) Fail isolation, just like the migration core would

(2) Fake migration success just like the migration core would

In the putback case there is nothing to do, as we don't do anything just
like the migration core would do.

In the future, we should look into not letting these pages get destroyed
while they are isolated -- and instead delaying that to the
putback/migration call. Add a TODO for that.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/zsmalloc.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index f98747aed4330..72c2b7562c511 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -876,7 +876,6 @@ static void reset_zpdesc(struct zpdesc *zpdesc)
 {
 	struct page *page = zpdesc_page(zpdesc);
 
-	__ClearPageMovable(page);
 	ClearPagePrivate(page);
 	zpdesc->zspage = NULL;
 	zpdesc->next = NULL;
@@ -1715,10 +1714,11 @@ static void replace_sub_page(struct size_class *class, struct zspage *zspage,
 static bool zs_page_isolate(struct page *page, isolate_mode_t mode)
 {
 	/*
-	 * Page is locked so zspage couldn't be destroyed. For detail, look at
-	 * lock_zspage in free_zspage.
+	 * Page is locked so zspage can't be destroyed concurrently
+	 * (see free_zspage()). But if the page was already destroyed
+	 * (see reset_zpdesc()), refuse isolation here.
 	 */
-	return true;
+	return page_zpdesc(page)->zspage;
 }
 
 static int zs_page_migrate(struct page *newpage, struct page *page,
@@ -1736,6 +1736,13 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 	unsigned long old_obj, new_obj;
 	unsigned int obj_idx;
 
+	/*
+	 * TODO: nothing prevents a zspage from getting destroyed while
+	 * isolated: we should disallow that and defer it.
+	 */
+	if (!zpdesc->zspage)
+		return MIGRATEPAGE_SUCCESS;
+
 	/* The page is locked, so this pointer must remain valid */
 	zspage = get_zspage(zpdesc);
 	pool = zspage->pool;
-- 
2.49.0

