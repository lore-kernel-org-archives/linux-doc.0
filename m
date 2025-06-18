Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D392F4305
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 17:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268425; cv=none; b=sGacmCfp79jwVaFe11jaL3rOWrm/hCY8l3H1JZ9/aojwtwovOqcsS4Mx65Ll2f6BbZx59ttqYqgrNCtHztEDDxSsQFnH0tHnJPnuhVY5wG/SN6ZG87BMu+/74BbjFL3AxyK/0c9dRH+V5DaOVy7VZShpAij3Kae7eUrFGur+gnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268425; c=relaxed/simple;
	bh=LfUaIY7XKmkW22E2CA7zcjn2zCtCLb3wGZMadkbbvUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rOFJ1+C2oSam01SpPdIzVHc2XrRuKAVom45X4Em9u6sW+xDyYELtTWHaOKds4oNNu7fGGyRu0vpxYpJDCXRmzQ1m71ay6WpZMXIy914yZcLDkJgwkFOB9LVgfdbwrN/Mup3vVlmlLDf3+AXaliX46jjty+t8+wRZ6Z+1NX792fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BBdzmE9s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BBdzmE9s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ztkVXhL49uhBZn35+Dz91j/1BkEFGTeWr88qG2zBn1I=;
	b=BBdzmE9skDUR9PXrrfZSGKNCO2KuWFlBjWWdfrIv0KrfhjDWFY41eCBTQND5+K/MRm2Wur
	z+o1ym/WmFbHHDlaqJl/cQwjCH/JowQ/Vt2ZiVjsqH6eiz+EjDJrIWZrdLREi8nvcs05hT
	93a4fyWBBlQXy4mu0gci4x6WTkFXKw0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-jnO9p6tLNju5Ol6IU6t_EA-1; Wed, 18 Jun 2025 13:40:21 -0400
X-MC-Unique: jnO9p6tLNju5Ol6IU6t_EA-1
X-Mimecast-MFC-AGG-ID: jnO9p6tLNju5Ol6IU6t_EA_1750268420
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4ff581df3so525389f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 10:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268420; x=1750873220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ztkVXhL49uhBZn35+Dz91j/1BkEFGTeWr88qG2zBn1I=;
        b=Lr6f/2ohUMBiNefQpHiooAY0rT18kCkIZKPSMexLczCEv2lrgK+NP9Lrt8T/knUfWW
         AF1XnEpXak/5xhvX+ZNlut3rcbspSSFB3GydO+1L1LalJTJZX2+65EXoxdC3uwF2shpt
         3O/ovn+30hPqKcbey7w3u5aGbkPCuf+Z1w3kKJO+gQ9l/ySJ4ivtEY/twgbxs5sQycMN
         UdvHMw8LxUxdNG2/eT5fXsoHOBXr32dyLVK7tgaotsTXcejJXfOA54qJ60Hyk2ORXvyS
         BE621Agl1l79fCpUNEFzKBOXq1pRung7FKt+fIQ01fk7uA7BNXICHDTHBiMcAMmm+tVs
         vPsg==
X-Forwarded-Encrypted: i=1; AJvYcCXgJnNPeyHFdg8IawZJQwRtko0D1X696xfhsbQnZE9YvwhuyZV9FIO+TmqEGAUuGE2A0b2MxmMemr0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxezeIIpKIEX7Rt01MK7y0K1sJCC++uJl+vqOzYDEk11nGQ7NEB
	DYPxI9kVe9GfIFNcljeOt/OLFGNVV+q5Pb1uGnes/pIYB7b+0c1ubRqFJQL4snf3YghcQRVFFdO
	GsYWArGbvUm97zeGfvUfA7aFHbZn3sEVPcD64I6+ZsBbfhpcqIn2morCZEHTamg==
X-Gm-Gg: ASbGnctiKgM6Oggrl8brR2AJKQPzWvjdti0WygGuSmbq6LXDr26vGb3g/CIcPcFRRhE
	yQ2KIMH4AQ/NnTgeARCDYwIPvaQaeWOdl83i8ooLMoXxPFO4trGC8meqHCyLU8C1a/X2UJ0TB6v
	JWo6xCIqcBlCR8Fd95vShgcQIxFEXqutevJcJytqoeVW9MPN1x1r2BfR+0BqLgiCHilx0stsKi9
	4xKIoU9zFhzxcsBYjrlJKs0lT7bCv+9CCB4VohYMzghEx7AmG5vGbBjgp7v7F6l3PWY+VCl2cKQ
	2+d3ad93l3f8QxXg7eYpf6jLUHtps10wFIOPTfyQDwlo1C8z8s12jvdypeF2BDkLbM0RUgF/DuQ
	CHXR/ig==
X-Received: by 2002:a05:6000:22c1:b0:3a4:f7dd:6fad with SMTP id ffacd0b85a97d-3a6c96bde70mr478012f8f.14.1750268420097;
        Wed, 18 Jun 2025 10:40:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdKc/sogX7P8eUPuNrS35oj8SOpb+inlndXsECh3VUw/sMAlaRsKTNBWIAReSnT0M7eOt7jg==
X-Received: by 2002:a05:6000:22c1:b0:3a4:f7dd:6fad with SMTP id ffacd0b85a97d-3a6c96bde70mr477976f8f.14.1750268419626;
        Wed, 18 Jun 2025 10:40:19 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b0898fsm17901600f8f.54.2025.06.18.10.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:19 -0700 (PDT)
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
Subject: [PATCH RFC 01/29] mm/balloon_compaction: we cannot have isolated pages in the balloon list
Date: Wed, 18 Jun 2025 19:39:44 +0200
Message-ID: <20250618174014.1168640-2-david@redhat.com>
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

The core will set PG_isolated only after mops->isolate_page() was
called. In case of the balloon, that is where we will remove it from
the balloon list. So we cannot have isolated pages in the balloon list.

Let's drop this unnecessary check.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/balloon_compaction.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index d3e00731e2628..fcb60233aa35d 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -94,12 +94,6 @@ size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
 		if (!trylock_page(page))
 			continue;
 
-		if (IS_ENABLED(CONFIG_BALLOON_COMPACTION) &&
-		    PageIsolated(page)) {
-			/* raced with isolation */
-			unlock_page(page);
-			continue;
-		}
 		balloon_page_delete(page);
 		__count_vm_event(BALLOON_DEFLATE);
 		list_add(&page->lru, pages);
-- 
2.49.0

