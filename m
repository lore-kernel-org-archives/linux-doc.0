Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E1333A01D
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 13:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761051613; cv=none; b=CUY4/Jsp9lFaJeut8STUK2DbUVLOMMAIFJJ5vrHma4PtzQZgyIOiHzVxNytfS59ddNXKW1viiNpBd1m6ygKKdA8NoEZ/JId10p2sreWH+8vpgcli+8QvPAaEhsFJOYDu7HCn5SwPVqjw3Fwe5Xr91Y2Rvn8txp6SLIIKKxEtmWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761051613; c=relaxed/simple;
	bh=3g40vwKIgUFnbs436ZCx9Q+N4KveSscj8YcW5wyilic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AdIO3Ln9Z+RLaV6gG75QhmP7ufM80LRc6pwNiFRtv7kaZa4ijPQbAEh2/42P8G/H+vt3aLCiLYyuO1p6+W2R1ltrH8LJic93KdAWtB82GkqmNIKes1FmsZUbOWK4x1Io2ZYVbNwqs46N17vRCSWiBwZuOhVu0YDue/dOR4N4dbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bZTD+nac; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bZTD+nac"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Pfle03AoZbMZzwKNT9cqn8RCz4Fl59OlkWq00/g7dM=;
	b=bZTD+nacieGTYh+n8mFqcxUexbB6zyEC61Nh2OY3cPK4OLC2L2BcKRDSBEC/Dj3lKa7MAX
	Z6mrPsTj5y6ujwu/1Uv3F3KZrY5H7GoHgfbMXBKTHrfw9V0xHOrN19H7Ir155DjmuSKerU
	lfCk7Il36SYx70BDoOkj9z9GAr6omKw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-UgLnlMI_OIWXFsIZGiHYeg-1; Tue, 21 Oct 2025 09:00:10 -0400
X-MC-Unique: UgLnlMI_OIWXFsIZGiHYeg-1
X-Mimecast-MFC-AGG-ID: UgLnlMI_OIWXFsIZGiHYeg_1761051609
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4721b4f3afbso14059725e9.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 06:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051609; x=1761656409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Pfle03AoZbMZzwKNT9cqn8RCz4Fl59OlkWq00/g7dM=;
        b=lCEaEPmRBwnLyCG6Aesmgu56NtR/sjA1Sq962VTIH5iVBPsEBcPkpHYjaQwvcUh8Kk
         x7WP5zD/OoIp6Bo/KHuCONtaHStb7gClOgKm/MKTflYN+mnPS22WQLiBxfsuOPMyGNG4
         hIdlbX/0O4kCvkwFKVDo13Nx7FrqkxZRMlaAhETAhQG3n4lokL4rldEuigaqE/sr9Nge
         0ROdPfPdMpyL0Lvnt8S89w2Oh+Ct59hYP7DaQQnvsi4C8ElNCrn9DDH4KyGOZdMns8ya
         WQz33BidDr79+yATsevAQ2HBd0bhaeHR6gaPpYPRbcOR40oZIlT18u7kvDZ2qzc5QqPM
         Qiow==
X-Forwarded-Encrypted: i=1; AJvYcCXTiReNzSNmuKqDPVMHmnZ2R3iiGjlmJzxRYZbIGRCjl8mU189h/3/ohAAEz3+cUPny/8/Omdt4yPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVdfNSnWVuPWZ/x++ytEfa5JKBT/895KmhiNN0JCMP9hV4FiMy
	v2+8xMlAo+0kwd5s8IoBSQ1dm9Sfsq4AaKSrWGzHTh4p6/6povVF3rA5fOXoNOPsCyfGdkXXYNW
	ooiaQYPD7RkLe49FjrRE4mzG2Efn/uTOBEKdpyVf71t7SNNCKtXsziP2432D/1w==
X-Gm-Gg: ASbGncvMTxAZhiypGl9NDXC/u3lkHGXEOYgEvhY07cbdUoVZ9QyJWbBGQqLu/V19qPw
	DZ4lm15+eN8ji9y8sLs+8rbnB6c9VVt9JEnf65APb2/sRTB6XhKbTAqRkm2vEYN827fww/X2d5C
	zl8X+RpfWVmP0UWdB5Siqre9qRP1wFVp+T3gIi9RL9HrHpjrYcF8FWlpTydOPs9x5mvhLbTLlo6
	NIJjQ9m5RGHt2sKLeuqOKUxIuwFQhBDZrOja/jaOGRY7sfk3pvxULVVo99GDJlCK7q9yD9BliBP
	lKYId2Ec2YNTMfRp6/8EPL2dy9tEfVv3zOHmufok7z31wM0s9ZvLXHnCw85XpOxvz4KmgjTuBAX
	QWG4FXH+EH/piRS2BawBPEsaT0hErMAKeDl1rH4nIBfgkfiodaGDiv6j/amDC
X-Received: by 2002:a05:600c:3544:b0:471:c72:c80b with SMTP id 5b1f17b1804b1-471178ad7b3mr117596135e9.18.1761051608648;
        Tue, 21 Oct 2025 06:00:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYkNMmF6KwTjIi+haTZNa/bZuoGNP9fBOncPRUCNa1fBr3A4oaQbG8grM5Ui4vLJ4xvDadAQ==
X-Received: by 2002:a05:600c:3544:b0:471:c72:c80b with SMTP id 5b1f17b1804b1-471178ad7b3mr117595585e9.18.1761051608200;
        Tue, 21 Oct 2025 06:00:08 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-471143663afsm278506055e9.0.2025.10.21.06.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 06:00:07 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH v1 16/23] mm/balloon_compaction: mark remaining functions for having proper kerneldoc
Date: Tue, 21 Oct 2025 14:59:21 +0200
Message-ID: <20251021125929.377194-17-david@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021125929.377194-1-david@redhat.com>
References: <20251021125929.377194-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Looks like all we are missing for proper kerneldoc is another "*".

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/balloon_compaction.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index f6e0582bd7ffe..f41e4a179a431 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -22,7 +22,7 @@ static inline struct balloon_dev_info *balloon_page_device(struct page *page)
 	return (struct balloon_dev_info *)page_private(page);
 }
 
-/*
+/**
  * balloon_page_insert - insert a page into the balloon's page list and make
  *			 the page->private assignment accordingly.
  * @balloon : pointer to balloon device
@@ -42,7 +42,7 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
 	list_add(&page->lru, &balloon->pages);
 }
 
-/*
+/**
  * balloon_page_finalize - prepare a balloon page that was removed from the
  *			   balloon list for release to the page allocator
  * @page: page to be released to the page allocator
@@ -140,7 +140,7 @@ size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
 }
 EXPORT_SYMBOL_GPL(balloon_page_list_dequeue);
 
-/*
+/**
  * balloon_page_alloc - allocates a new page for insertion into the balloon
  *			page list.
  *
@@ -163,7 +163,7 @@ struct page *balloon_page_alloc(void)
 }
 EXPORT_SYMBOL_GPL(balloon_page_alloc);
 
-/*
+/**
  * balloon_page_enqueue - inserts a new page into the balloon page list.
  *
  * @b_dev_info: balloon device descriptor where we will insert a new page
@@ -186,7 +186,7 @@ void balloon_page_enqueue(struct balloon_dev_info *b_dev_info,
 }
 EXPORT_SYMBOL_GPL(balloon_page_enqueue);
 
-/*
+/**
  * balloon_page_dequeue - removes a page from balloon's page list and returns
  *			  its address to allow the driver to release the page.
  * @b_dev_info: balloon device descriptor where we will grab a page from.
-- 
2.51.0

