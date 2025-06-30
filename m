Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125B928B4FE
	for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288472; cv=none; b=rxgQbYDvVp2m0df/yQpuWx/nlly6T4EbUNRoxZLJ0QBcqbIB8wsVcc/IMTrTENaoixT+R+WFWD5nPMxrG0qu6rzWFGaAzGf+eRo3Ls1Yka9x1ce3GNz5O6NbY3/jHNjnlun1wYMitk7OTfIAglCA/m1j0c22190zhY7CbX7mZlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288472; c=relaxed/simple;
	bh=iVcKD9ZKy+q0IZPfhKWFJvDMMmEVnhfUGzTuz3ApUIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d6qeDOauclvpSjju+ea+pk55i97nqKR4/aDWWtFgq+6dNRHroZ6Q5++ndWQJP1P0sz4Hcb5ydbtqfAjUgYnhowexB9h4Kxfo6S/lLENvFT/0TKZpCx7zp8I9epbKN2+2KRVpWR90/sQ/y5FkxGChlPfKqNDsdyR5So6Btfpwlx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VDZzmIWS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VDZzmIWS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IIzDkBhnyPsIOakhHuAsjx3fJM8m9J+HURfbhEZ1A0M=;
	b=VDZzmIWSbX3G9KlJMwOl3DbTqoYlps5DlVtS8ERMD/xpoZVArHNhIrhrEorgmYCSSIY9PJ
	ZgNJ/j8u2qCBzVICw/kRkQeBE4//2RzgUy5ClKkW2PVXQEIg7rYg6u4ipddUj72mPPuGIp
	hJjlZ/HdpRU1sS0QgeEt7Aqy54x4GvU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-D94Wsg-jOkyxeqeGp22BRA-1; Mon, 30 Jun 2025 09:01:05 -0400
X-MC-Unique: D94Wsg-jOkyxeqeGp22BRA-1
X-Mimecast-MFC-AGG-ID: D94Wsg-jOkyxeqeGp22BRA_1751288464
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso23507275e9.0
        for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 06:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288464; x=1751893264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIzDkBhnyPsIOakhHuAsjx3fJM8m9J+HURfbhEZ1A0M=;
        b=DhXp7mKwrFwgNcTzSG7izxb348wExDHDXVCsrItqw19+ngg/uLco0JF4PpjbIuTiiQ
         GuXf+MXuqzvdlOrSsLGjxxb4FtkjGSguPqhTpEGIkgbGftZEz8wDc8ctx+R1i/KlSdra
         oTkdciXqepV+WUoxGA+exK8Bg4a8Uip74qEJqAErJD0GvCQ5/8RXhvgmfZX7BR8ivhWl
         n/0SezYGcbwEfS20VN3wb5HLEqlxtv+Su6oTorytREd4vVfjaZ1nPXmPajVW4DGYv//5
         Oz7kutDSj9EsyMGxo6aL7/mwAoyaG+X5wsclHL05FaMPMrX84ADO7soep1cqBGLyyEkr
         yu3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLz3+sCqZb9bN1ltv9o1OFFeNLzYFQQeQMEjzgt+H5PHq4oiNzQmegBqis0bEXtFdjAE3h/TnaAfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoJiGTFiz7OvlyAWvMFisZuEdpN/8QOQkqOwnhSK08EmSV5E/L
	c8vbg8nyBm5HXhisjY4qUOpoh1sqRi1nZGw9fQiFUBZf7C6t401tduASv4D7zLDNXtgCZ5Xxfb+
	5m17GufC26fFy1gPv7jrIe9JLxWqE3tpPdw5iT0emPa46suOG8MxwbGhDZ+TMqQ==
X-Gm-Gg: ASbGncsZLfzap+ZRriCjyI0wuNffO6k56N8+rvApIKu9nEnb33qM55PVDM1rsQP1Eev
	jjgs60jGEWMGbvzodphOClk4GCEpVi72/VWv/47kqAuESCcyLKnCwcSBhI+B0k1mbyns0F8kj9T
	iCohFdFHDCUowvtYO9l9mpdbGek9fY84UVTN6/8yReWCQ+Rx0xKRb/eE/Hdowu/RFJx2gzQhZqm
	TyD67aM98EOu6B1STeUOSpwRqnR2CqJyJTTxY6vrOGcfD20jZt5uhd57OJ38KdlBOspbeFIuI4a
	6N4oW+6yyz67d11HWwPoWgFz8ieQsfRRpqJoxeBIn9HE5saK60q/8wTTUMbFyBX7wJezpwqgluh
	+EbZxm3Q=
X-Received: by 2002:a05:600c:1994:b0:450:d79d:3b16 with SMTP id 5b1f17b1804b1-4538f309394mr135240695e9.14.1751288463668;
        Mon, 30 Jun 2025 06:01:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7zExQWNaFUjIE00JTRK6K+i5BO8qjO8BpI1TRkHw1kVlVhDi4cL0K0LNLq7UFrw8vD2WvGA==
X-Received: by 2002:a05:600c:1994:b0:450:d79d:3b16 with SMTP id 5b1f17b1804b1-4538f309394mr135239205e9.14.1751288462959;
        Mon, 30 Jun 2025 06:01:02 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453823ad247sm170241515e9.26.2025.06.30.06.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:02 -0700 (PDT)
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
Subject: [PATCH v1 17/29] mm/page_isolation: drop __folio_test_movable() check for large folios
Date: Mon, 30 Jun 2025 14:59:58 +0200
Message-ID: <20250630130011.330477-18-david@redhat.com>
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

Currently, we only support migration of individual movable_ops pages, so
we can not run into that.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_isolation.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index b97b965b3ed01..f72b6cd38b958 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -92,7 +92,7 @@ static struct page *has_unmovable_pages(unsigned long start_pfn, unsigned long e
 				h = size_to_hstate(folio_size(folio));
 				if (h && !hugepage_migration_supported(h))
 					return page;
-			} else if (!folio_test_lru(folio) && !__folio_test_movable(folio)) {
+			} else if (!folio_test_lru(folio)) {
 				return page;
 			}
 
-- 
2.49.0

