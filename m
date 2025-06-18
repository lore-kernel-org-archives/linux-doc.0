Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052412F5481
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 17:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268438; cv=none; b=XZWWPg41gMYaUaMlade25igeOtFM3AoBFBxsveqHu0lUVsCLOxhPTnp/puox6K4GlS0FnJtjhOn6utgNEK0hogWBBJPdRTym8upg951rzqQnIoDY/tAaqBJ6IcBv7GARAAU4IELf7DSI8agsGXcK+ZjVEmYeQj+jFi4EnbEs2xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268438; c=relaxed/simple;
	bh=qK/hSpqxPHXWhlFplYYMa5g7zmr2Q/EzGHQmEAB7ZSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oYLjnjjghgz9E0uyOzZxIhNzC28+J15xvf9Wczv+dH3ruKlQiPEfCalYX7u3frP3FKDoIELNFRnZGRVNooz8NycpvwQhT0lJgSizcBbc2AdSb0mCmHOcNrtxXGgMEJ9n3ky3VEpQtyvVX2Xt5tXk+PyeVG2aScrPS1C0l4HaYGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EhtLsgzf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EhtLsgzf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750268433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fkYbA0acVo3UX9Us91PPuYxLoMCXI95NEZ07wm0hikY=;
	b=EhtLsgzfMZkgE5F0oWe6t92jj8EvCV5QPrIEAA2XI23MHq7o/UlGBzCWlwaYninRVD6j4e
	ojK4KnQ6Ho4L2lBEAMVqSqpBtHeq8FQ43VWuCxkXt2YQH+5sM9B+J5omI5RgMScd5zUWdK
	f6cnQZW5NjLs1Bvgch2kz0ks0+baWio=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-iNIlMHqHMamGcsA_D1_0cA-1; Wed, 18 Jun 2025 13:40:31 -0400
X-MC-Unique: iNIlMHqHMamGcsA_D1_0cA-1
X-Mimecast-MFC-AGG-ID: iNIlMHqHMamGcsA_D1_0cA_1750268430
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4fac7fa27so3083620f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 10:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268430; x=1750873230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkYbA0acVo3UX9Us91PPuYxLoMCXI95NEZ07wm0hikY=;
        b=Yu/9UhR4+j7lk7CJ7ZI5a4D+8//lftlEQjB0faBM7RD8nYCKjnsCECVcHgWUcuPZj7
         wPw0PiIJF1DxKoRwDrMYiEhlrljY1Ma/cmrzOX2Gc0ZA7OpUdjRDZVhFqaqXFdrJlJZk
         qjw7uNH7DLDX4rQikE8jo6f5Nmhq11c47QXqdZeAlf/DEfWP8KVH8WnAWBLVJdGwuc7c
         sXbxTkVjjLdTOmI28kG6UAQzzX2hUT/crTyyr2ocDySQr52VTbESMrIUUgPq5Nangqxi
         f6pOgwQHiqCHRKMNbl/bKFZlZNTtFY/UuxlraZW4ICc46hCSKhSQCIGoeeU5yKmbHcBX
         oNGA==
X-Forwarded-Encrypted: i=1; AJvYcCWRaJkTUoQmkeu6Sw3g1TuPt+SBdcbBnUAPko6nPjcuTvi5pP34IK5ZHFuYsKHTZmSKpJPzyxgeVkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZYvw/ibkXFqPOSOGNtyLFDi6AQeeUE5CFP8FtvZABWjKHPKDB
	Mx83onS9ZjdpevGIOGOW3T88Jy0ZOBa0r4adb6JZG4D9kF3X6p82QhvKNC/Hs/PxaNPJkgX+f5V
	Wej5yzTz9QSRpK97oAmCGUsATvr1TxLYxzEtVh0ZhoEBBpPqvEiFzKsJWrXUQ/A==
X-Gm-Gg: ASbGnctM6LnTpg/cBHAQHdnKgqtl2uQdzV5v8+QhlV24n/W4DTfMcI4tWWVrx63sTos
	zN8qY4imJWoYxHS93SEGXJicYJa4tlX82hwV4sELr3X7/hl6zxJvjHFtMujd+8MHBOHwFh6262I
	3e1sGFlSk05vLn/2/9ZJasekdNvLX20qWISjY9P7ht282+hy9KhLSzHxBv38B2Yh1elUjJSus6M
	J2mxdwleGBx2b8f/3c7itPBHgz/8JPMHYVi8J41EzaOichnK1GZBvZ1+fGw2aBrIw/f5je4iXbf
	agXp51np6L2sUAl5iYPxNvWPMtCE9HAZgkSi7cYcs1txvmb2d+Ze0SeQIdZtvvbJPGY3argeW3Y
	eszPM+w==
X-Received: by 2002:a05:6000:71c:b0:3a4:dc93:1e87 with SMTP id ffacd0b85a97d-3a572367972mr13745221f8f.1.1750268430452;
        Wed, 18 Jun 2025 10:40:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzzxL/ng01qs/lSRwaNlZPiY9y2+iVmfz3gXJp3VGo7LunL2znQ2yg0q95yDx7nL6kngLoWg==
X-Received: by 2002:a05:6000:71c:b0:3a4:dc93:1e87 with SMTP id ffacd0b85a97d-3a572367972mr13745179f8f.1.1750268430076;
        Wed, 18 Jun 2025 10:40:30 -0700 (PDT)
Received: from localhost (p200300d82f2d2400405203b5fff94ed0.dip0.t-ipconnect.de. [2003:d8:2f2d:2400:4052:3b5:fff9:4ed0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b62ba7sm17864640f8f.91.2025.06.18.10.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:40:29 -0700 (PDT)
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
Subject: [PATCH RFC 05/29] mm/balloon_compaction: make PageOffline sticky
Date: Wed, 18 Jun 2025 19:39:48 +0200
Message-ID: <20250618174014.1168640-6-david@redhat.com>
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

Let the buddy handle clearing the type.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index b9f19da37b089..bfc6e50bd004b 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -140,7 +140,7 @@ static inline void balloon_page_finalize(struct page *page)
 		__ClearPageMovable(page);
 		set_page_private(page, 0);
 	}
-	__ClearPageOffline(page);
+	/* PageOffline is sticky until the page is freed to the buddy. */
 }
 
 /*
-- 
2.49.0

