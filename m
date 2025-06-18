Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6E42FE331
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 17:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268460; cv=none; b=OISun+HR6YsLdM3NjeevhlN7in5qlzdhnX89OsherwgWZILnyBkbp3b4x4raqiKt+CS2HLb4KuGvl00W41n7+wP5Vptgi75UytvfnPyUQ32lpuYI9AE3DYZ+xj2tc6kRpoH1ZWkh7Vmde5xAutvq9xncXms7HB02Kuzq6g7WPxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268460; c=relaxed/simple;
	bh=qF9Vy6Hq3fkswUG+ny4V9wMgoAlWF7MBQAZDgFpHwys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LlXW4W0ie4Hr2zeyt3iS4M1+XEoDlh5qOeqcwIWye+u6qxDD2n20IhXi6uXIk26D1dqM9zTekEXd2K4FhyqPAZiUkFamoJYAEtNdJCsGYi4TI0drIwl6nS15A7c0YQvd2c9bMGj+zqf90u1SAc+rlBDqF4q9zxF3m9Q0jAWmwrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PjQRiJiO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PjQRiJiO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l6C8lbjEXu6LV6W+fOxtWyWYf418kuz/nIG8TPoHlVI=;
	b=PjQRiJiOAfC+SLqlzSsEtVIWmPzHhmolqa5BTRwbREihQxzdVObbX1AS4bn/LlpMdb0CaQ
	hNXTzLva3Kfwm+35gl+N+DPo3BO+qU7RtB7Ss+V770DcqHKLy86eJljuNLzLC3RDBlOyp1
	1SndNRZUb2GlE2OgAeuEiqpe9CenllU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-PR952X0_Mge98NZKc5irfQ-1; Wed, 18 Jun 2025 13:40:53 -0400
X-MC-Unique: PR952X0_Mge98NZKc5irfQ-1
X-Mimecast-MFC-AGG-ID: PR952X0_Mge98NZKc5irfQ_1750268452
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f6ff23ccso4221911f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 10:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268452; x=1750873252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6C8lbjEXu6LV6W+fOxtWyWYf418kuz/nIG8TPoHlVI=;
        b=Gnvu73F+fNQCqPw3MK3msCJINp7UvSpIhaVVqElzruO06cYWaUPSCtfY2K8fA1IrNg
         gHvywvigqDjfCzYNQwFlDVntvKg6oMjihI56oq/cAa9s9DBGLwt3/M1Kq53TSgMurYJj
         +jtPIoUBoxv4g/MY8V3+CuRuu4RZJqWu4j51jII9hbh0MID+epazzaK3zN+oNLRwc7Cp
         EDq92WfJxI7XI9FEGgU7SwUI+n1J5pLCdWXeuZ3zUZUtPncNCMOZDtKJimRreY0ewd3v
         elRpcgiw3PD/lyk2eMGIJUm93kLjtFGyExY3IncvNr66h4LE/VREN0H9gXW4QJ69g/x9
         3Nag==
X-Forwarded-Encrypted: i=1; AJvYcCXQYelRB16uYcCVrdTNvpA3NpSnWqU2vRVqfebQ4NUxiX8VZdMOcmU05T/b2vUq7KuE9mwkQNRoyiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWxu/UTNIaUUXf8evf4DjIOhLxRmm95YrqJVzpwYcIlBVBERe0
	aExF3GHrXLu3JyP2szjRmPfykne9RDH/BzA1WwiiraL/3LD0LVaYZ8+iZj3T79Q2BAuw0loY4gN
	oA1Gxt/7LV0W2YqeZkocNXLyV+CeJy3GqMW2SoAgsuSGuZTB9036TCRPcy4DSdA==
X-Gm-Gg: ASbGncuq87daH0h0mPo7XqRCuVpoqG4Q3v8Xuk9XWlNp+0zRVR3KUUCvKyW/fhjyCxr
	gaacantuDMASFcwxX12YPH5jyo7XVpPdGk47XNTGbmPVbbkALqUKbkXD9YH20g1diOgpUpMKltx
	nuQzY3jm0ifu96y3tBn2ml+4VJ3UsVSqgztzQJYYTNaiIS5wxBycEd0A7qAp2Yamnyvj+H1QEya
	KZ3iX3un/yOa925vs0fLqeJTDmmMp3MMIwvTuNBdyqn/GSiSHcHGDuV/PkDQrsFKsnqi3VTVbo3
	n1qE7ylKnus9MV10CiRTGVjHVT/gqhm6+akLs+q68ok9RbqYbsjx13FsTprvlM5LXSXkynuiPBo
	CM27c7g==
X-Received: by 2002:a5d:64ce:0:b0:3a4:f513:7f03 with SMTP id ffacd0b85a97d-3a572e8bfb1mr13954331f8f.44.1750268452316;
        Wed, 18 Jun 2025 10:40:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4X4ziwIkhys2144e75SHEIZN/Ibpbo9aRHgWcvkByvBS3juQ4aklJtEd9sXicogG+MbEwPQ==
X-Received: by 2002:a5d:64ce:0:b0:3a4:f513:7f03 with SMTP id ffacd0b85a97d-3a572e8bfb1mr13954276f8f.44.1750268451787;
        Wed, 18 Jun 2025 10:40:51 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b089c2sm17710418f8f.59.2025.06.18.10.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:51 -0700 (PDT)
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
Subject: [PATCH RFC 13/29] mm/balloon_compaction: stop using __ClearPageMovable()
Date: Wed, 18 Jun 2025 19:39:56 +0200
Message-ID: <20250618174014.1168640-14-david@redhat.com>
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

We can just look at the balloon device (stored in page->private), to see
of the page is still part of the balloon.

As isolated balloon pages cannot get released (they are taken off the
balloon list while isolated), we don't have to worry about this case in
the putback and migration callback. Add a WARN_ON_ONCE for now.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h |  4 +---
 mm/balloon_compaction.c            | 11 +++++++++++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index bfc6e50bd004b..9bce8e9f5018c 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -136,10 +136,8 @@ static inline gfp_t balloon_mapping_gfp_mask(void)
  */
 static inline void balloon_page_finalize(struct page *page)
 {
-	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
-		__ClearPageMovable(page);
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
 		set_page_private(page, 0);
-	}
 	/* PageOffline is sticky until the page is freed to the buddy. */
 }
 
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index ec176bdb8a78b..e4f1a122d786b 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -206,6 +206,9 @@ static bool balloon_page_isolate(struct page *page, isolate_mode_t mode)
 	struct balloon_dev_info *b_dev_info = balloon_page_device(page);
 	unsigned long flags;
 
+	if (!b_dev_info)
+		return false;
+
 	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
 	list_del(&page->lru);
 	b_dev_info->isolated_pages++;
@@ -219,6 +222,10 @@ static void balloon_page_putback(struct page *page)
 	struct balloon_dev_info *b_dev_info = balloon_page_device(page);
 	unsigned long flags;
 
+	/* Isolated balloon pages cannot get deflated. */
+	if (WARN_ON_ONCE(!b_dev_info))
+		return;
+
 	spin_lock_irqsave(&b_dev_info->pages_lock, flags);
 	list_add(&page->lru, &b_dev_info->pages);
 	b_dev_info->isolated_pages--;
@@ -234,6 +241,10 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
 	VM_BUG_ON_PAGE(!PageLocked(page), page);
 	VM_BUG_ON_PAGE(!PageLocked(newpage), newpage);
 
+	/* Isolated balloon pages cannot get deflated. */
+	if (WARN_ON_ONCE(!balloon))
+		return -EAGAIN;
+
 	return balloon->migratepage(balloon, newpage, page, mode);
 }
 
-- 
2.49.0

