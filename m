Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FED530380A
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 17:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268485; cv=none; b=DBdfH5Pohm6u7XPfTm7im7CNE1oL2kJQL9bE1m+bYiMVDG5jDqzS3xSJgTBN146Ev5HCVQqgmGl2c64NB1L3IWgpDWmb0siy0Vp5HYLlRHCoC8JJl+tDo8cQxovG1sPB5tfZ+kMn/wgwOxLTsV388bchdOGLyxDUAWfS2blIpgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268485; c=relaxed/simple;
	bh=mR4wKIFzNAz9lCxg/2MhGizqJd2oyhLD6gTXEVIJK5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j3/mKaL9PaCoer8Tdg8PZbCxcByQFKXP9apV6fJswh25nU+fN6P7SzierXPKdoX1jBq+EiDtIgvzJP/1uCeBplJ0kGr5I8arcnW4XFSv9nVEqnp5wpW4rG3RneBVcOz+yLIN3vXC0396oO3bhYhXEXPZBSGVRG/0l0jN54wxlDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cnYjW/0v; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cnYjW/0v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OFGM8ws286HsZ+G2nyb5/sPhilYYDV0QN54X+S74Jfc=;
	b=cnYjW/0vveQnlf7N5lEvxILby+8nkU6rXMGZlLgddd2ngAta4V9M7fGltXuKUvhFZ0qYlI
	nMLz0+RxQShOJgLfooSdZmfnQgNjZyHWnml17wEzbFHOqmnrfNpD/i01iBeAmbOyMksW2v
	B0oTP2mqaewUus7wXN0HUlqCHV7rpPI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-kSliGw8uNeywwvIEZswuTQ-1; Wed, 18 Jun 2025 13:41:21 -0400
X-MC-Unique: kSliGw8uNeywwvIEZswuTQ-1
X-Mimecast-MFC-AGG-ID: kSliGw8uNeywwvIEZswuTQ_1750268480
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a37a0d1005so4365906f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 10:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268480; x=1750873280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFGM8ws286HsZ+G2nyb5/sPhilYYDV0QN54X+S74Jfc=;
        b=APlT0aG3ayBX+25Xe/VxnfF3mPr8Al5gWUBaQBiicWGNa6xM4Bzi5MEnk9a0j1HC8d
         unuJhhtdRZ6QhB0LZE8MPiB8r+Rwit6SKVgDfT+WfQe6XLeZw1Tm9YJbhfa96FLOD7ad
         d5+MXwoZktP9QPRfLnMABTiMC/WVgrWXd8OMnh1ldHFNV6bjxoqT825qIqDPtCy5/jUB
         A5G74TP5NZvRl6L0qDdYbhrPGyaT5yhlAIM/IQhOXMQO/R0PmGlcACy0Sx6Pq85C/CXC
         WBGk7ct+dQUSwkl9xeTxYW+wpYg1H6GQ5YP7DsLb+2r6c7BNN9AS0HX6CYYhTnNvANuy
         kwRg==
X-Forwarded-Encrypted: i=1; AJvYcCUZoyLtQyA+mrz5px5YcwscigoLaacdfBjM7xxrzXJ6PRO4n4S2RK4UVt+2VtrI88iDFIbvejGXeaY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr9N9EsSQnAbkzEqtkuus82t8RRYGPdwx4E7zsSHTdLgbsDw/T
	it9W2g3WantXGmLG2eCAdgzHkUzvx0O6Td+IyfiVVXFdnDa+kR+fmU2siL3KYPHS3PbVBHrdxgO
	za6G9C11gScnV0qzDk9evigEIpCDFbuXuj1j/kPuV/+BFZLWTSZbIZ/ybz1TEYw==
X-Gm-Gg: ASbGnct4VDoc8+aAFey2AhiXbAMR5+5L1vDRCZPqSVxmMJPnJU7K2Np+O/jb9Utlfjm
	Xuq4d7AOn7hrGGbZyPROZ/M6DAq0zpa/h/UZgYgmypU6PZm9Vt8eVGKOtfU2nIbXVidhXSnPQa2
	jDoH9n09DX7UjK/b4md7kqoIX3lbag0fkc9p75LQAS7XDmXeS9nE4TzOIeRmjycfk6qH+52mlHX
	jYgdXvANr8TATBd6ZOXk2x542UEDDLN9rFxtbRnt/Cz2dfIIXtpJ28mXRWPqbSS4iE/YwR+jgS6
	QTL2EZYwRa6aeWMP0PGsL2LM13G1Qzp+HYH2uJRajWrPr81TG1QGH9zeciqDaIAUVE/fUoTbU1i
	lvoBVoA==
X-Received: by 2002:a05:6000:2f88:b0:3a4:f8e9:cef2 with SMTP id ffacd0b85a97d-3a572e6be35mr15379295f8f.36.1750268479811;
        Wed, 18 Jun 2025 10:41:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGgOLn/JzQiVrSw8561br8iJzDS6W98mGXalaJQyvnuLaRLghELBqFwLLjepyMMgs/X1CCpA==
X-Received: by 2002:a05:6000:2f88:b0:3a4:f8e9:cef2 with SMTP id ffacd0b85a97d-3a572e6be35mr15379264f8f.36.1750268479340;
        Wed, 18 Jun 2025 10:41:19 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b62ba7sm17866251f8f.91.2025.06.18.10.41.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:41:18 -0700 (PDT)
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
Subject: [PATCH RFC 23/29] mm/page-alloc: remove PageMappingFlags()
Date: Wed, 18 Jun 2025 19:40:06 +0200
Message-ID: <20250618174014.1168640-24-david@redhat.com>
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

We can now simply check for PageAnon() and remove PageMappingFlags().

... and while at it, use the folio instead and operate on
folio->mapping.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 5 -----
 mm/page_alloc.c            | 7 +++----
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index abed972e902e1..f539bd5e14200 100644
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
index a134b9fa9520e..a0ebcc5f54bb2 100644
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
 		page->page_type = UINT_MAX;
-- 
2.49.0

