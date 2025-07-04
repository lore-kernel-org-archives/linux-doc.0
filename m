Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070F92FCE19
	for <linux-doc@vger.kernel.org>; Fri,  4 Jul 2025 10:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624796; cv=none; b=n+IQODZezTR5grq4qUSnd79pQEsAfqmb4oWiLT12jwQEIEhF0ZHn71+R6jaM82xBQNSqCxi1hyPbqMWY+RdceGkYPWCbhJck8a/Rpl3jsykckKN0IRgG+Y4r1lWX8yA71+jrp8CU7jn2NOFtwiN0bVAziN8nWrmC9keH7aHSOGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624796; c=relaxed/simple;
	bh=pHyy8UC6aDtzrad/rUQe1SyqR3fae/2pllZmxoCrbEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rBt0EqJgSQhBNXikqvb4+zzNjGMudyzJ+aypRXr/ljF+B7heeBUzVKsmHJqmqgw754K3hMv06fYQ/s2rFFkk+Bn1mLLfFhiTmxedwHYaeYNsX4YSQmhbtrHk02NS6oHE1eXud44FVQdWXqRzoof8Dul0Z81u0z6OGcHReGgpjeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HhWL3yZt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HhWL3yZt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pi83bTeEFwDlpM8pJuM4mqXwpOj3VH8gXnt6oQN+QH8=;
	b=HhWL3yZtg0JJrem8ddbLwj1uspHIAxagA7UFTI0aI7N9kNr10BiNkB2QaZO0caLfemNlmV
	EieNQTXlsXjGEjqUIRjV+1EL3QJj3dympgmZx3Vqfnq20dmb24QDXV9JA1Ryf7s+eKao5B
	frp7Kl6S2Q9M7Oi3Ixn38vAxsiGDR9A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-FPUNK0E9N9K6g-LZFU6XgA-1; Fri, 04 Jul 2025 06:26:32 -0400
X-MC-Unique: FPUNK0E9N9K6g-LZFU6XgA-1
X-Mimecast-MFC-AGG-ID: FPUNK0E9N9K6g-LZFU6XgA_1751624791
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a6d90929d6so347871f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 04 Jul 2025 03:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624791; x=1752229591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pi83bTeEFwDlpM8pJuM4mqXwpOj3VH8gXnt6oQN+QH8=;
        b=Z4Rzb8vduJmNe13IMGpLp72H5FD8vEFCs7bM/EHxSf65PLW3b+OC8b/yQ6smfKZQHD
         HiO48XeuEVK0xEAcgqcuYiy7RcS7gK0k/0WZhNOA4+cJKRjBP5NbPuX7wxUcEcrG8g+U
         C6SlkxE7u28bYWGp4EiaznZlUprePwmmg9ZcofjE5DNLToJiEGiZyRaZc/DqKL4MD23x
         dhQYmlohzHBbogaKd5m3OPXQBKVYnN107qWykOOeRMnpwp+bQEE6WNKHqFancOxqh9fO
         GYGpXlVz5QEVvNUkwRxA7Zhu7EmQreb1fSWhRFE+Kjx4WKRiFVx9Kkc/91C8nS2ppBXL
         5b1A==
X-Forwarded-Encrypted: i=1; AJvYcCV7GarIygr9+o8MQPpe61a4KdPITKqzuN/OYKJv/fwCkB8suK3p168eOKFvIp4O2heYFmNyjTbCbww=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqNa99Fi1zLBMO1UWZZTFm4bDhJA5Y4crpEU9ez0Dk6XYglNkU
	EXtmOPuxgjWIuA+ulSvnie8hM9OGcUTc7VlI1ge6W2Zedfsj0CmdIHTtt7jb1I4F3f00tAQEv1I
	hOiwBupSnlEBgB1VECG+vXpuzZd0wwIpMs7N05pjdo/J1kq67iLzR9kFBZ/yVUg==
X-Gm-Gg: ASbGncsjlm+nZw+hv48mV9FWdW5XHDwAuynJzPNe8Fq3HMkbARYx5rl3bz2FvtPvUaB
	ttmsG1LiJ9j/zcwJfSG2f21QSZJ50bhJTVXeHL+qy/Gvxnjb08OOlbKCxXNdh9tqYnY70lvehu5
	YrJEFhLQiFoyYizwBRz7iGt4vsS9V+zoevYymU5hM86DkQ7WQveKeQROjj06sxr+10N4U9vGmwq
	wLMdgM9d48X3e7IE6LZv+v6hi9O9cJl6jA1kVQ0VAmSVPYfgDhRedQFhKVdeaGd5pGNXmcFr+Lo
	Zd0D16hRkFVqTTPyD6vHxCHLw9n88z7OgZ51gYYtnC4S8GciQW3RviEBMm1f+9NI+iwKRSkhMHE
	/QSV/GA==
X-Received: by 2002:a05:6000:420f:b0:3a5:25e0:ab53 with SMTP id ffacd0b85a97d-3b497038f53mr1271075f8f.32.1751624791434;
        Fri, 04 Jul 2025 03:26:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrTbC9DKT0t3aMKhVtx8nltW/QfximYUsOEu1FNJGdEflOepjIkffBp71QlqU0uLEDVp5xtw==
X-Received: by 2002:a05:6000:420f:b0:3a5:25e0:ab53 with SMTP id ffacd0b85a97d-3b497038f53mr1271044f8f.32.1751624790899;
        Fri, 04 Jul 2025 03:26:30 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b471b97732sm2167298f8f.59.2025.07.04.03.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:26:30 -0700 (PDT)
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
Subject: [PATCH v2 22/29] mm/page-flags: rename PAGE_MAPPING_MOVABLE to PAGE_MAPPING_ANON_KSM
Date: Fri,  4 Jul 2025 12:25:16 +0200
Message-ID: <20250704102524.326966-23-david@redhat.com>
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

KSM is the only remaining user, let's rename the flag. While at it,
adjust to remaining page -> folio in the doc.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 8b0e5c7371e67..094c8605a879e 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -697,10 +697,10 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
  * folio->mapping points to its anon_vma, not to a struct address_space;
  * with the PAGE_MAPPING_ANON bit set to distinguish it.  See rmap.h.
  *
- * On an anonymous page in a VM_MERGEABLE area, if CONFIG_KSM is enabled,
- * the PAGE_MAPPING_MOVABLE bit may be set along with the PAGE_MAPPING_ANON
+ * On an anonymous folio in a VM_MERGEABLE area, if CONFIG_KSM is enabled,
+ * the PAGE_MAPPING_ANON_KSM bit may be set along with the PAGE_MAPPING_ANON
  * bit; and then folio->mapping points, not to an anon_vma, but to a private
- * structure which KSM associates with that merged page.  See ksm.h.
+ * structure which KSM associates with that merged folio.  See ksm.h.
  *
  * Please note that, confusingly, "folio_mapping" refers to the inode
  * address_space which maps the folio from disk; whereas "folio_mapped"
@@ -714,9 +714,9 @@ PAGEFLAG_FALSE(VmemmapSelfHosted, vmemmap_self_hosted)
  * See mm/slab.h.
  */
 #define PAGE_MAPPING_ANON	0x1
-#define PAGE_MAPPING_MOVABLE	0x2
-#define PAGE_MAPPING_KSM	(PAGE_MAPPING_ANON | PAGE_MAPPING_MOVABLE)
-#define PAGE_MAPPING_FLAGS	(PAGE_MAPPING_ANON | PAGE_MAPPING_MOVABLE)
+#define PAGE_MAPPING_ANON_KSM	0x2
+#define PAGE_MAPPING_KSM	(PAGE_MAPPING_ANON | PAGE_MAPPING_ANON_KSM)
+#define PAGE_MAPPING_FLAGS	(PAGE_MAPPING_ANON | PAGE_MAPPING_ANON_KSM)
 
 static __always_inline bool folio_mapping_flags(const struct folio *folio)
 {
-- 
2.49.0

