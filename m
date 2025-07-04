Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04162F3648
	for <linux-doc@vger.kernel.org>; Fri,  4 Jul 2025 10:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624742; cv=none; b=bo2azo9d3DQ/e24+h2CQCkrwJi/hkiIT+f9iY22jIuUjoC5vFLW6WKWjk6OnOHnET8mtdarNJ5l41JkvjSGclrVfv+xnG7sMAQJ88E9J6wJzwdKSLAmgXuH2vyEV3yZTfYZb3RBrHr6RUP/Z/bq+6wV9qd/OWi+RQxVaDWCQqmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624742; c=relaxed/simple;
	bh=yirVZfO+dHe5+EJCXh68ilzI6s3sApzRdgd2Lx9ZJLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qHMomp4XJmXd4rBmqSpByOWL4Y3mhUpmreAo+V0dyZ2gS9vUXEjGo+l/E3WkGjkwAmIZkQE9o0m+h2hn0BexgYLfdtqfCrYykAJC9T9g6MR//X2hLIq+u5uyi/+uxcotoX3Uw3//D0tj8rJrD9vC/9sEoWLUJlu2PalZq/tv1Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HID+IQ6n; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HID+IQ6n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Km36h+57LoMclmINdAl2JdQwpEFbx1KUS9NaV7ZwoS0=;
	b=HID+IQ6np8J+4Q66FIGqHzB62Of8Do8DLto8/eOeMErlRy1cWwSC/hoodhBR9/gAZ1XZpj
	+wc8QzXsOSH/DiRVFZWVrfWJR3/571Uv7e1V+WGTgQY2ZxYvETJV/vyF+C/JBNo7usuy+N
	F1DsNHuWg0ap0H0aTi/d/TERl0c6j0k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-dpsdwgWOMuWiC0o9mJot0g-1; Fri, 04 Jul 2025 06:25:37 -0400
X-MC-Unique: dpsdwgWOMuWiC0o9mJot0g-1
X-Mimecast-MFC-AGG-ID: dpsdwgWOMuWiC0o9mJot0g_1751624736
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4538f375e86so5909075e9.3
        for <linux-doc@vger.kernel.org>; Fri, 04 Jul 2025 03:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624736; x=1752229536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Km36h+57LoMclmINdAl2JdQwpEFbx1KUS9NaV7ZwoS0=;
        b=jt1e2/OCXOLpjxs3q5eagA8V801SmHColu/DSQ3j0PVtrChyJNZOGDTCl3YmkQdEUJ
         FsZNviSKuWjPcjBndlzI4DbtJtWchbyo/ACoCIdbc1iAA1IKNsbI0+6mE47umChamJHI
         kac6MU7qxD64dRQT0ddj04cPsoZQstUyA1qLreIRKrJ6Cp9aoAjiAhsBUFaCJayTMyFE
         57+2PNuyAf6dhsIQmhp2qkMU7XVLKKPHOiGVOY+TqnZwsFLynHQS9FxOOwbBeAPWQ9vP
         edoZ5LVtOCuZaTOtfjz8GdvcWem8zBcHA4+5dqYDFaItw4H/ZRqtXMDsilWPEizC+5rF
         nZug==
X-Forwarded-Encrypted: i=1; AJvYcCWmRxbtgN7L2yOnGHdwWgbtRORPL2FlBY+Pr9Ju2B9pW3yr3VlbGr4PwzlT0gSe76b6Mm4eUMJUk9A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz1+EFlu6XWfWFvWVWGVWqnPwF0qP7WgKFzCFduP+w1v3jV3mY
	STlbkcw98eVKUCvcWGDuWhR3MkoGBm6GrmWjY8uIanGP+m2tIU+YOBg7Im+vZRYaUbGFwuYa55G
	ktq1xcXmS6hHJmar/YUY6I2l57U+criPYTLO3gCL4Qk84w7tuRaA4OTCSiJj0y/00Hr8uFA==
X-Gm-Gg: ASbGnctX+nzP6cvnTwWL1NhUj1hhIDxrxNMDrci6oGoDPCHqUSE2kzC0FKNBfHU880h
	bDXsCAEw2jWiFvZ6DJnJJdNlfaRmLnlQlBUzSdKM60zTKhSWqGMwD8Xj3saqIfeZnJP5OyreC3D
	I519BBxpGYcinmXx+qvWShSAAo5su2fGWOUiqt/X4E3FWfdVjiue959xpYisIZ8GDxDrtg7S2bu
	Ilxcof2cMD5Vddn5mTHyisC8v2N5Qp+PAyEs9Cl4jb9nfT1LieLNtLi6jg6uhT+WxagDi5lB53x
	MNqFVOSV9ZmHZ3S7/Sx+OgSHpm7kLshUZzFVsSyu/WboeI4SLpIR8cwKFd08MkwAOqlhDq/aTtu
	QdBoeog==
X-Received: by 2002:a05:600c:348d:b0:453:608:a18b with SMTP id 5b1f17b1804b1-454b3096211mr21110755e9.9.1751624736366;
        Fri, 04 Jul 2025 03:25:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYWTkwuG63kWN2pUNG4mMJ/rp0CK4ANHmE+tpQrKYs+JLvfC5kMT/JJWZ4Z30efeBW784Wqg==
X-Received: by 2002:a05:600c:348d:b0:453:608:a18b with SMTP id 5b1f17b1804b1-454b3096211mr21110415e9.9.1751624735911;
        Fri, 04 Jul 2025 03:25:35 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b4708d080csm2111024f8f.23.2025.07.04.03.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:25:35 -0700 (PDT)
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
Subject: [PATCH v2 03/29] mm/zsmalloc: drop PageIsolated() related VM_BUG_ONs
Date: Fri,  4 Jul 2025 12:24:57 +0200
Message-ID: <20250704102524.326966-4-david@redhat.com>
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

Let's drop these checks; these are conditions the core migration code
must make sure will hold either way, no need to double check.

Acked-by: Zi Yan <ziy@nvidia.com>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Acked-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/zpdesc.h   | 5 -----
 mm/zsmalloc.c | 5 -----
 2 files changed, 10 deletions(-)

diff --git a/mm/zpdesc.h b/mm/zpdesc.h
index d3df316e5bb7b..5cb7e3de43952 100644
--- a/mm/zpdesc.h
+++ b/mm/zpdesc.h
@@ -168,11 +168,6 @@ static inline void __zpdesc_clear_zsmalloc(struct zpdesc *zpdesc)
 	__ClearPageZsmalloc(zpdesc_page(zpdesc));
 }
 
-static inline bool zpdesc_is_isolated(struct zpdesc *zpdesc)
-{
-	return PageIsolated(zpdesc_page(zpdesc));
-}
-
 static inline struct zone *zpdesc_zone(struct zpdesc *zpdesc)
 {
 	return page_zone(zpdesc_page(zpdesc));
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 999b513c7fdff..7f1431f2be98f 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -1719,8 +1719,6 @@ static bool zs_page_isolate(struct page *page, isolate_mode_t mode)
 	 * Page is locked so zspage couldn't be destroyed. For detail, look at
 	 * lock_zspage in free_zspage.
 	 */
-	VM_BUG_ON_PAGE(PageIsolated(page), page);
-
 	return true;
 }
 
@@ -1739,8 +1737,6 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 	unsigned long old_obj, new_obj;
 	unsigned int obj_idx;
 
-	VM_BUG_ON_PAGE(!zpdesc_is_isolated(zpdesc), zpdesc_page(zpdesc));
-
 	/* The page is locked, so this pointer must remain valid */
 	zspage = get_zspage(zpdesc);
 	pool = zspage->pool;
@@ -1811,7 +1807,6 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
 
 static void zs_page_putback(struct page *page)
 {
-	VM_BUG_ON_PAGE(!PageIsolated(page), page);
 }
 
 static const struct movable_operations zsmalloc_mops = {
-- 
2.49.0

