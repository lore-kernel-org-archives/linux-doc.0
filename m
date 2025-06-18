Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416EA2FFDEA
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 17:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268464; cv=none; b=hPvX5hZGazKQOrMaGm8vzjlnUpxkC++zTBQsiFfTVuPFQ9olrcfIsS5A7WY3Onb9b5pEOlPjwulRggb1pQLuET/+atN1pNywi90DmPyLD0KhaOM2+m2IxD6nKID3Dyc0oSb1Temy5rNtf/k+D3Fd40DIcjRCbjxlXeI50jLxMQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268464; c=relaxed/simple;
	bh=ltmtOsj6PvpW+vjN7IqM0EXe8b45WiKSrK0SISC1AKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nvTDRozeKsTNT20nuyjlmGHfav8tUMi18LaWGZ6MngoxTgs2It4V5lCiDp/jchH0TvCsEimDOkQvposVHytH3fzmA7rcm/ALoW0VJqtzIIt9+Ps/T/NqUbx8BcxjzAGnieuwehPrbU2hX4uoj0+sfeRHnqQaDIjs6dgT7bQ2iRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N4qXCSVT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N4qXCSVT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R518sUXauciWuWBIWO47EfDSUo24r+YyG2S8Z5J8Wko=;
	b=N4qXCSVTOqS0jmWYH8loTM3Uk4emj/K3JX/PUFypyYUko4RxqE1/MjxjURE8tTI06Wp2n3
	WM7zz4AabxtD0FBbHI20CDp0/mMIme7TAoHX2+KYut2eFrtF1NQk4F4i/ZsUGWoqm4X0+F
	TLtKWC8xikiMpOI2Aro095CFCxrqHlc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-D3aYF4X-OMKGJUXms_JVEg-1; Wed, 18 Jun 2025 13:40:56 -0400
X-MC-Unique: D3aYF4X-OMKGJUXms_JVEg-1
X-Mimecast-MFC-AGG-ID: D3aYF4X-OMKGJUXms_JVEg_1750268455
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450787c8626so55880845e9.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 10:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268455; x=1750873255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R518sUXauciWuWBIWO47EfDSUo24r+YyG2S8Z5J8Wko=;
        b=N+pTSO3/gAkpinVxk1vVbLmXPjbU2HLLIX+zUrXtkL2jNQQM78GlRb+rFim5+oI2dy
         ecnekmSTvP+8w9QSZGfYhJ+fmMME4MRxcPOJVOTLFRvIjtSKuvYB6O5RQMWi8moMiRt1
         9MK9Q+vcJfoeaVsDGzN4FjF+kyAZSDw9Uw5TjoqOxOEYZETZonAilQmuhci9T1H+lC0M
         zmvAwnt4jwplIkQIEq8kjm/9r0J4S7JGYF1rcHrGSwlJF3KrKPA0UCcnqo80Ic2eg/f+
         Uo7Pq8XgIUGrE0ER0I2y5r7pAl8bjGFIPyR8sVY3TYA+U+8gbQ70q6vryBCunZENrDzS
         ESFw==
X-Forwarded-Encrypted: i=1; AJvYcCVCxJiwCVGABDS2LJ4cFF8z//iEySMWQNwqk3IJ2im2ioqSvZjJgHGzp6iIr2Guv8/kSA6lAF15MzM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxnc/ek+lbbzros+DdyD6ohDstJ0NlmAB8dSSrM+fxwhyFUqXL
	gzQx8dEGLBTkr0Dl2Kkq5dem4HUbZDgwYrDHjaK7sS+oKdIlKVpr5ZQ7z9kB7WnZwMMEbcg3Kek
	gxe3BTiz0hJE8fpFQHlbKYQvH3xlcQTMw2ymwgfvD2pv6rDMlGQNcaPHUcptf6Q==
X-Gm-Gg: ASbGncthQtB9wdYtLvk3pdkuJxGM0Qk5LLSMbv7sSZrQ+c5mdjJD/N0GTyxUnlGrw3Z
	7r/OuQaFELqB5dsgErxMqn84aXuC4BboQgV7WpLG1CnFDuDONIoqeZMZAoWgAXF/THi0TZNKtpT
	QXdMbNzDuSMD8jF+Qm41ynU6APgaYdZF+N6I64MGkfcr3cnESn72C7vdPgPD2hmy5alokiGFJKH
	9wdI+hjzIMIjTGJ0ltIVcHCcXIhj64aBKgDvJhGOO2PH0qNNB5E3UMl82PzXzSetNa0p5+liFsK
	xphBnamnWGkE6WwuSrvTwN3mLOInZzaOszwR3W+1j8LPr9mpXAFmAcHIcHAgzM1cKnhQihUb6WM
	DjBckOg==
X-Received: by 2002:a05:600c:8509:b0:450:cf46:5510 with SMTP id 5b1f17b1804b1-4533cb53b27mr169412865e9.29.1750268454853;
        Wed, 18 Jun 2025 10:40:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECPQIWD9z7ds8IhVmKE9L3mk+qhph5JCu6Oi2OcOPUlhg6wunpBLWb7MobaQ8CxMoDDmzTIg==
X-Received: by 2002:a05:600c:8509:b0:450:cf46:5510 with SMTP id 5b1f17b1804b1-4533cb53b27mr169412335e9.29.1750268454440;
        Wed, 18 Jun 2025 10:40:54 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4535e983b14sm3703725e9.13.2025.06.18.10.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:53 -0700 (PDT)
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
Subject: [PATCH RFC 14/29] mm/migrate: remove __ClearPageMovable()
Date: Wed, 18 Jun 2025 19:39:57 +0200
Message-ID: <20250618174014.1168640-15-david@redhat.com>
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

Unused, let's remove it.

The Chinese docs in Documentation/translations/zh_CN/mm/page_migration.rst
still mention it, but that whole docs is destined to get outdated and
updated by somebody that actually speaks that language.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/migrate.h |  4 ----
 mm/compaction.c         | 11 -----------
 2 files changed, 15 deletions(-)

diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index c99a00d4ca27d..fb6e9612e9f0b 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -106,16 +106,12 @@ static inline int migrate_huge_page_move_mapping(struct address_space *mapping,
 #ifdef CONFIG_COMPACTION
 bool PageMovable(struct page *page);
 void __SetPageMovable(struct page *page, const struct movable_operations *ops);
-void __ClearPageMovable(struct page *page);
 #else
 static inline bool PageMovable(struct page *page) { return false; }
 static inline void __SetPageMovable(struct page *page,
 		const struct movable_operations *ops)
 {
 }
-static inline void __ClearPageMovable(struct page *page)
-{
-}
 #endif
 
 static inline
diff --git a/mm/compaction.c b/mm/compaction.c
index 17455c5a4be05..889ec696ba96a 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -137,17 +137,6 @@ void __SetPageMovable(struct page *page, const struct movable_operations *mops)
 }
 EXPORT_SYMBOL(__SetPageMovable);
 
-void __ClearPageMovable(struct page *page)
-{
-	VM_BUG_ON_PAGE(!PageMovable(page), page);
-	/*
-	 * This page still has the type of a movable page, but it's
-	 * actually not movable any more.
-	 */
-	page->mapping = (void *)PAGE_MAPPING_MOVABLE;
-}
-EXPORT_SYMBOL(__ClearPageMovable);
-
 /* Do not skip compaction more than 64 times */
 #define COMPACT_MAX_DEFER_SHIFT 6
 
-- 
2.49.0

