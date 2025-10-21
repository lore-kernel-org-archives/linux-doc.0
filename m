Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EDD33506F
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 13:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761051607; cv=none; b=Sc8PwRfwbi93jaQDM5URELZvKKlAzCadY7CuFgNb2bzchuyrbgQfb3WKogZj1BU1q157EOyxFKJo7zCbfYUjCggfE11YMk/pYhqbiAei8f/3SRW3S33UKsBn5PISN7re4RlDD8U21q0UgmY5a1a1xc71dpN/bC2aw285TlHXwi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761051607; c=relaxed/simple;
	bh=3cTNUMp4o+oVBONpNTtzXmzjCS7SNewteQ5np8WUWzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LY0unpR4N9RIGneVa8mwGtf5EhiXfJC1GFWWhjDv1JYAGcpky/KXjOq7c0eKNyJjo+qJq5iCsQc3GXqKLo1/RJBgIb5h6xUnCG6ddXxbn1rdqyrmDGpbNGhSsT+WimFIhhQR3DcK+ZT3QjvvSkClSeQ6L67XbYF3KP0pESf0rVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CBhZKu7n; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CBhZKu7n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mx8PDzlnYvvbZ0yUyMmWAvQGgV0mnv7F+nCFHBKHb98=;
	b=CBhZKu7nWEAefyhlottPaYfHc6AZCnUa9IOsTE8v+6ucl+yqFA7+X9I5HV/WKAX61BfBOR
	rIo2Zd9VnvRsIO2SoceBZjD93bjW3DqCD2iN9Yq5yAB8WgRIe8MTNqO/bhUkVD9SpVL3xZ
	+sZB6BGjorkYfC/993B0gHIAAi5ccjs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-oCdXrT2wOj6p8l2zC0D3zQ-1; Tue, 21 Oct 2025 09:00:03 -0400
X-MC-Unique: oCdXrT2wOj6p8l2zC0D3zQ-1
X-Mimecast-MFC-AGG-ID: oCdXrT2wOj6p8l2zC0D3zQ_1761051602
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4270848ceffso5679228f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 06:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051602; x=1761656402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mx8PDzlnYvvbZ0yUyMmWAvQGgV0mnv7F+nCFHBKHb98=;
        b=iHmITtEoK86ZiRwz8vCU3mT6d7V7ScP6PbB61HjCi6kZYcRYbRqhVfWq804NTrljMs
         wq+nTZZ4PyMKBvLc1OEFuQk8FGBvBLQABqO8hHJ9MSMSo9gTIdcxmTuGSlgc2MF8afOE
         HsFHzeL8pLhJFwNdru/qdn0S4IX3y/RdygvjkrzqUy90UVI2pofJQ63+n+zqEih+mocC
         ZWEn+Qfo0qFFVTzLvs5o42ehC0nSKaSOP+kKabA+pQdGlVNW44SJMFJTa9yjZ10lnLeY
         7jWFV/Wu9Fb/bachRVCgVyL5tIfYCtsGzWug4f8KBIQCfGkKqxjqswKvQ91NR+ZIePVZ
         HHqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuYNggHI21f1g36wGgAAI9yYafKcGx4tx7f02/fW6hs24VMGYtb+0pHvU5XJYviOKJ5EFeJ85kNdA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg+0lB90eH+RH4D6PWCJY7SXhq72zDT3MeHg9HOFBFos1ynunl
	n0h2Ic2RZQ3XMsNYlj5fRusD51W/2qKVQ8Yzt+qYgRdg2K9Hvonc5gU2pawUCXxEGcJRnq97dym
	TWyf+rYsKAV08sPr4hPwA7u99WOApxZt5o+AKwD4MG+mYBJvRSR7uLnk14ibluw==
X-Gm-Gg: ASbGncui5BsSslAf8SwI9D/LnR4pZN93GL3vc4TVAWfAtPfnrtI8jxkhiBGDdD0+jsW
	FJAneeP4ui17fvk1JM41/R5Exs5QMWVaoLezgonDYKu5PB/UmWzGpDfASf9eMCo5SifRbWgUJZp
	2+vRHxaYzAt0wAzsJ5CYrbiCiftV90uDclVTCoknZXZQPer13JSOwAPt/J7NnxTipad8iK6dboJ
	4gbAI1GwZsfI0XGRN9FlKAlaeAVGkY2AHI1Mq1glK+KD9xYze70f0R2cDTrxpBugeDh6ipbyeoT
	r8BVpzm9fnTFLJSJciYVVV9N38OS01MzLlPR89aouVmbeheEAVSMr4bhY0SRF43EcMuq5u43QR2
	OLifw2uAs3D2jrZrg14Woi30nP+y5yYwwvMDZqKEDdXX6VpcxYcHT5nu+l2cK
X-Received: by 2002:a05:6000:2010:b0:426:ff7c:86e4 with SMTP id ffacd0b85a97d-42704d8df97mr11013383f8f.19.1761051601999;
        Tue, 21 Oct 2025 06:00:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQe2AF3cxcaLPsgMe+jA1+DvC9OUXEqv94FS7Gua6OqWlPAIEXZjpDAmImXhD8jvhjJ6PszQ==
X-Received: by 2002:a05:6000:2010:b0:426:ff7c:86e4 with SMTP id ffacd0b85a97d-42704d8df97mr11013339f8f.19.1761051601543;
        Tue, 21 Oct 2025 06:00:01 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f00b985esm20896549f8f.34.2025.10.21.06.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 06:00:01 -0700 (PDT)
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
Subject: [PATCH v1 13/23] mm/balloon_compaction: fold balloon_mapping_gfp_mask() into balloon_page_alloc()
Date: Tue, 21 Oct 2025 14:59:18 +0200
Message-ID: <20251021125929.377194-14-david@redhat.com>
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

Let's just remove balloon_mapping_gfp_mask().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h |  7 -------
 mm/balloon_compaction.c            | 12 ++++++++----
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index e5451cf1f6589..d1d4739398978 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -106,13 +106,6 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
 	list_add(&page->lru, &balloon->pages);
 }
 
-static inline gfp_t balloon_mapping_gfp_mask(void)
-{
-	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
-		return GFP_HIGHUSER_MOVABLE;
-	return GFP_HIGHUSER;
-}
-
 /*
  * balloon_page_finalize - prepare a balloon page that was removed from the
  *			   balloon list for release to the page allocator
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 90b2d61a593b7..709c57c00b481 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -112,10 +112,14 @@ EXPORT_SYMBOL_GPL(balloon_page_list_dequeue);
  */
 struct page *balloon_page_alloc(void)
 {
-	struct page *page = alloc_page(balloon_mapping_gfp_mask() |
-				       __GFP_NOMEMALLOC | __GFP_NORETRY |
-				       __GFP_NOWARN);
-	return page;
+	gfp_t gfp_flags = __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN;
+
+	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
+		gfp_flags |= GFP_HIGHUSER_MOVABLE;
+	else
+		gfp_flags |= GFP_HIGHUSER;
+
+	return alloc_page(gfp_flags);
 }
 EXPORT_SYMBOL_GPL(balloon_page_alloc);
 
-- 
2.51.0

