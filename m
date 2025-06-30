Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D5F28C02C
	for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 13:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288439; cv=none; b=VfEuGMthfCUWIudZsN3trkCTkGWCA/M6jtylKRExvwPBcULAxZL1NNL+N9CFf9bt3/cbrst6hgCc12kIXUFHh3RjRlVgvynyY3QtOw9qDjann7pZmo+xopMQ1Ng0MFwlqcbfvFMx/fu2J1oDGXxLxipFh4EnkjXSvBycOf18amE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288439; c=relaxed/simple;
	bh=4MxWzYVQT6MaRWyD8DaQIwXKPr34x2kzXAmctRW17zM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wdpy92B2zORK+M1Nf9LdXqf75kxabIwl/mn9zPNVhL1cQgPNBVc/USB2jCXRgV1exaR1kWYI4r1cunwh4rblALle7QRP0eKWqYkQLFueW4En/eXEakyu2lFf5IdMpwOJ4TZrw9rd+bsjQJzNBCwQmjfcAxKJ45Q8kNTuc5UDaBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WpJUbV+9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WpJUbV+9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zonaY4DxD0y8MNMLsQ+Z7vSDV1xV1t770zE0DCe01j4=;
	b=WpJUbV+9Ek6gCOucl+Uac64kYsnQm+k7woyRjZjW/Wp7joayhfp+mLEm/75Hc2eDd6QwXr
	Qrv4+ttSgR2kyqOzpTx9VlARPHhZikV8txjiiKOe7N9LH4hDwBHlTU289DFL+Tl1azHZqQ
	kppBQTYI2/y68MiYVIFB9je0/18+tK4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-85HCdBWjNXyk6CayWiDRtA-1; Mon, 30 Jun 2025 09:00:30 -0400
X-MC-Unique: 85HCdBWjNXyk6CayWiDRtA-1
X-Mimecast-MFC-AGG-ID: 85HCdBWjNXyk6CayWiDRtA_1751288429
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso13576985e9.2
        for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 06:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288429; x=1751893229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zonaY4DxD0y8MNMLsQ+Z7vSDV1xV1t770zE0DCe01j4=;
        b=u2MWRgqHFNhEoM21Zk3/4caWCOOng0W4IxFIFIC1MiJ8IflyP6cWG+WchFhCo+7dFd
         ETBBXgDJT5NuCWqsCullfT/j636bKCwLK777BV1uDwtWvZr7x529p1hxLZLAQkW7ROF2
         IttaKD/FqHZIJ007LSJKXPWKyHeQ7zXez0QVeu0guFKY+iRJyYZVWwLH1ohPGt8mtr0S
         lHDXN1kWzLvOFDUHrAbkTAvk2wlG/gHwdmH0WlwXs3fFMhjbTzbkso82IVHjMcFr1S6v
         Glsb6R+2tMDBPWcH4sgU1MRLM+7Eahsu2S/ssWjxeMdW6ynqmZApNEbe6cw7E5AsQwAg
         IMZA==
X-Forwarded-Encrypted: i=1; AJvYcCXgEGlExUL7tWAFjXQvdR7wKzZiyB0NEpOqSdjE40YkODo2gjz2lqPm6FSBGaItCWuTBjS9yZ0Pceg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwumAGksk0YUutL3orlGV9r0IDRF60owZl7UvFEsEJ3x6ZnMK7H
	oQQQNxS/2QhZuNrbdokW7hLsARHOUWcBjIvwGl8KKCsTrycLEK1006nWidyuI4u3Ze5K3Nft2WV
	ecgYhVnGKrxtz+ab/ffaWeg/pS7A+tLJn/m2ZYJQUjN71MLvzUtIm++ww8QucxA==
X-Gm-Gg: ASbGncvf8KteWj6EkeS9eMAv4iQX02NmGIGmw5XhWG6NBsP8FoTwuiVcxl3YFeMsE42
	zLv1O7bRnhQAqmcpMnww1kIAvGslMexRnGz9qxdHG2jVNX1LbVJ7vIc5dDYdzwxc5/gtl++fBSh
	lGhpOgWzWmLZ5CSrWGl/kWb9HC64F/4ldPEhZS8QK2MPBHq2D8pz9e5IN/PUle4RtQgO7xKYS6Q
	hCJ7ZfuIKFW41s781aqiJc6PESUkxTzzyduwpSjA6ayJfQDyI0xuyjQlC2SNpgsx9CyPtxO7y/E
	miGnmjybL8AMj6kjWV9ppepc11FbNzs65IRTH/f91Qkr6Bw6YdrtwN69czKtwvVWlM8ZkeWrO3r
	hxe2QmZc=
X-Received: by 2002:a05:600c:3b8e:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-453913c5a63mr120766935e9.14.1751288428812;
        Mon, 30 Jun 2025 06:00:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQsOsTnGBejCVgyOLl0Qh2EVLJQ4G+kbMgNeqpJuJaGM9Kh9Xe41tPUK3+55dbuJ7ci0FJ3Q==
X-Received: by 2002:a05:600c:3b8e:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-453913c5a63mr120766035e9.14.1751288428255;
        Mon, 30 Jun 2025 06:00:28 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453823ad0fesm169262535e9.25.2025.06.30.06.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:00:27 -0700 (PDT)
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
Subject: [PATCH v1 05/29] mm/balloon_compaction: make PageOffline sticky until the page is freed
Date: Mon, 30 Jun 2025 14:59:46 +0200
Message-ID: <20250630130011.330477-6-david@redhat.com>
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

Let the page freeing code handle clearing the page type.

Acked-by: Zi Yan <ziy@nvidia.com>
Acked-by: Harry Yoo <harry.yoo@oracle.com>
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

