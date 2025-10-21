Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576B4335BB4
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 13:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761051612; cv=none; b=o+2Numqp+EKFYr41KNTuPQhvpmN3N8HZyC+PstejL4S+BQUQfIbkmLi+CN5Tnde7g8q2hb0J/RKfw2BGtZZ2JYDF/8JD2jd+4kAaY7xV1WmOrzvFtlFpxiImP+q3wZbB/0v0+VFBg1VYA7WxUcQ8aQPFcFRrGJj6aQZVTw8J78g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761051612; c=relaxed/simple;
	bh=I1RjduQwNLAJmKC+Ha7d0wSfsDgz8ai3C7Mi619iPgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M38QbA1zN1+LTkChroi5sAANgaDrf5IO64pNRPc1lxPD0aoj23CvBoULWHwwnrRPp8qw+Lq5e7t/q4Lvu1ViWJzTtASoj+svT80q/99YCQpB5a3EYcplDoPnBBhVoUr1D9BfibgeYmeP8CueEQ9hBSPACLzA9socd4++D5Y2rLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mcd/vd7y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mcd/vd7y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qyA8pCV8ZcD9NKgO0LjiJR2j4wGQSpAi/OG88VVUt3A=;
	b=Mcd/vd7y0dVxzAgdl4QxX6chElcqwjUQDYDLnFZgLVLf3aHFoUCISolM6HQYcuDrHhSdAE
	WtJQ2+cBgUWqVVKFiIv7iZw7kRQ8HaAPEU1nP4ByArqaXEnM8Nym/sbEN6pUoMH6S1zXoy
	FvO8zamVtoLOfG5Fd4ss9DytKDJbCdA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-itjtCXCaNmSaRqmj-nC6Gg-1; Tue, 21 Oct 2025 09:00:07 -0400
X-MC-Unique: itjtCXCaNmSaRqmj-nC6Gg-1
X-Mimecast-MFC-AGG-ID: itjtCXCaNmSaRqmj-nC6Gg_1761051607
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-470fd49f185so43785255e9.2
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 06:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051606; x=1761656406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyA8pCV8ZcD9NKgO0LjiJR2j4wGQSpAi/OG88VVUt3A=;
        b=a1zoEZ6KKxe3NiUN1MOlN1qVpu7aDaztKZuBH1i+XAwi9bcleYnikSDa1isM6UZTZW
         YeAcyWZUkPilif67aBeF65T1sYiEnqjrQxEo0qFz13/MizUoyeQ7HzOhK9k1/tYhIlxQ
         6FxjqqcjvLOJmRJohC02XqpXWd5XarU5eOu+UpnBqCHCEZzEuRH8aO49sI8+EYdD/7en
         D3PUUuBdwU0JUJ1Xv3SzDCBI2pETnZMPoCp9g5gKQzFuOxIkbpzWFIsx/ivbV+ghhmrU
         /4xqWeajrEsyNz/zsWj0fttlVHc2ivK8lycE63XV423v8E1cxLhi6quJOmWG3XwUBHQo
         26Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXiOrPC8K+cVvNEbPjBqqYJjIuLLVHy70D2PbZYuCSptWDNPG+HeZf6NOvayluZS/AFtlzY86GHyIk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz24E+l4wZbQeJccp6+8uzmdNG5zibKD7CcX5p2nZo1fKQr0uNR
	AbZBez1I1r8ItilTXa2qYbLdRAvHWLaXP0wN7SyEYaVWcK6M3kMy2WQfv7haQPLvpQTyeDDnEfQ
	o19x6GK0E7QI58uNEj6nhJPMmQvkVzhHWYTNnzkMNv4riYmxzRvPTNjKO6PFcEQ==
X-Gm-Gg: ASbGncudMP01Gjdqw0OQgkuUZI9GI4uZ5+X6lrO3vNIcZQF2bqyVfRIT+4xxkOfCAVR
	xSIWx4G72QqgiRHkBL8io6haO8D180vbY2t9xuHcRQkyJIO/3REzrX2lojZm+jV4QE3GILHjXIK
	k4YdSuHLFJrkwVnbmVu+LhoA1A/o3ZsFuai7tXRl424omTgDDLiBQTOOQyGMTSoGpqZ4pElXpTK
	/TjSUmeMKKkpsUXbEZvrYwUU4YexjqN8UMdqSoc50b74bZZrvhIJF/B97P3Uxv2XnAzNTpX0Bqe
	H0bevFzr60+vDJSG+vQ8giBUHt8vU/Z/l+qbki1R7KFAeiy4XlbdPB4QFCDj7aCNHvoYpUkTPUX
	Oy5Q53cGpDl9z8ax7U/FY3bKxSynGzvbS9vRbxZr0tHj1zVw4SoMfuyVEJ0Ys
X-Received: by 2002:a05:600c:64cf:b0:46e:3b81:c3f9 with SMTP id 5b1f17b1804b1-471178a80f7mr116647425e9.17.1761051606590;
        Tue, 21 Oct 2025 06:00:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbkCxQxFQj6JOplMg8GsGSdkTVrb2edAU/Gb4AKN0gQYX2xa+Zptcgj0djfMLZWDQvHioQbg==
X-Received: by 2002:a05:600c:64cf:b0:46e:3b81:c3f9 with SMTP id 5b1f17b1804b1-471178a80f7mr116647115e9.17.1761051606167;
        Tue, 21 Oct 2025 06:00:06 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-471144d17cdsm278222645e9.18.2025.10.21.06.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 06:00:05 -0700 (PDT)
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
Subject: [PATCH v1 15/23] mm/balloon_compaction: assert that the balloon_pages_lock is held
Date: Tue, 21 Oct 2025 14:59:20 +0200
Message-ID: <20251021125929.377194-16-david@redhat.com>
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

Let's add some sanity checks for holding the balloon_pages_lock when
we're effectively inflating/deflating a page.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/balloon_compaction.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 717bc43732d09..f6e0582bd7ffe 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -33,6 +33,7 @@ static inline struct balloon_dev_info *balloon_page_device(struct page *page)
 static inline void balloon_page_insert(struct balloon_dev_info *balloon,
 				       struct page *page)
 {
+	lockdep_assert_held(&balloon_pages_lock);
 	__SetPageOffline(page);
 	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION)) {
 		SetPageMovableOps(page);
@@ -50,6 +51,7 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
  */
 static inline void balloon_page_finalize(struct page *page)
 {
+	lockdep_assert_held(&balloon_pages_lock);
 	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
 		set_page_private(page, 0);
 	/* PageOffline is sticky until the page is freed to the buddy. */
-- 
2.51.0

