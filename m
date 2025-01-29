Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54F11DA60B
	for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 11:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738151903; cv=none; b=YWWY4T61CDqYAy5xoy+w1cYlPWtjOiz8uCWE7k92x9Mryjw5KgjKd88jKxSq15ql0U0dPGDfYYGspIWzywizRXpX8Epk5ih4FEHFJL1QtgR8zw1hln4qyXTgbl4lpiQb2BPfaylBs4JzJehsczvQH7/umreo/Y5is77yenaKzsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738151903; c=relaxed/simple;
	bh=9PHBiuSbQfK/gtAQxmhDt+JDCvJOGqXhhiGP82nYoCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bzuNFdK1eVuH/4srIWbbKdVFBSkU9PI6Ct6zDEbmXrdccYSv78yCvPfxRjbSB5GLe75/EiyRyVLWx3DPjzC2YQsHc2WSHxNv/xuVUXB9XdTpYrEGGc7oEGHL58D4bHBDkdQ4L0HPaZfc7vBx6G2iQOpHQ6YLXJKpE66tYIVkcmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gMr8HFVc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gMr8HFVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738151900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FOqcQk5sbfQYMqiwFwVZu0o4Vgt4WnJhwl3OPDX2fpI=;
	b=gMr8HFVcJxKmjbJtkRH5yYQNFiu+zGbYkXCvDU2GOw937a/JXRypnyGGXSHVHpAmECcrN/
	UBmA4626jYNkkxJT2MSCdjeRdkTefZXAfVlNbj/215MglLlGDTr6df95Zpz+SM48N73Hm6
	GpQM4Px0kTr/PTHcqVgNbCoXgrgGqOk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-_wyBgZeDPpiZUy0AmGgvpA-1; Wed, 29 Jan 2025 06:58:19 -0500
X-MC-Unique: _wyBgZeDPpiZUy0AmGgvpA-1
X-Mimecast-MFC-AGG-ID: _wyBgZeDPpiZUy0AmGgvpA
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4388eee7073so3083175e9.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 03:58:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738151898; x=1738756698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOqcQk5sbfQYMqiwFwVZu0o4Vgt4WnJhwl3OPDX2fpI=;
        b=QpuFBvGzhdtcUuSCipk7p40oi3i3a8Z8yedKAc9HT2Z06M6GvrM9ovR/N0ybmBtxov
         d0/AKB80+oJSyqnKXcST823wys/H60QyrLX37GfqnLCabnL4L/AtlMu8z4/80TKogMOq
         1Qjdj0KQ6cfAagPLHmdHKrY8DCetCyKv5CWJxcTHRrJj2KXf17EuQkWX5XPOmkOG34Tp
         28JfPS4n6/AB7wymv/mVMCPMY8tp2W5Fbtjy7CdQGQngUNPtK7PRgrjm7sK786m0TNp9
         Mex6mGU4qilbYuOM37qQKwsgsWLcxuYCR6SXNzofAPOTcBcAda9Gdx0dlxu38wUNwIFF
         hwZw==
X-Gm-Message-State: AOJu0Yx6KXB9JotZl6pa0xQALhnpazI2PXiZazmi6dclIMf+KDGQo6Al
	J+f+WMUUScCRsum5VA8q99ZXAH3Hfx1QevipRPatiTzIccrZzSEW+TB9e4TaQfLYhVtjTMrY7es
	L902uYeummj9m50g6RfwQeAwYVSjy70qc1fWSyGzjuJB2hU/TVpxYRQRDsw==
X-Gm-Gg: ASbGncvYdFHeV4227LWl7fHx2spOGHdAoyCaOg9ZyO1Ak/kRFadVgf+e4EzTnQNmo1o
	O90iksHjO2Ch7heL7k2lYCGJqqtLSsAQrKW7f+yWfPIltuP5u4hmAoHP+OqOP+whaPiN1i8fxzB
	Hdpj8oD5bMv0j1woLdNYMNgO7/9E1Qxa8U7Q+Yr9UIZ8QtkflWRL2l7Dm3gQNUqPhyINmjK/zIm
	1LK5zHsbCIQ16xpXrCAV+Xh2s0aeO2EOLqyQFd4AStbCbMLIo8KS/HPBBeHiWXfXKn8wQkFhAdx
	T8oKdKkbRbzJrNj40eje09HPr8qXw2DSHaCr+pDxFMG65Qqq38fPcsC8eFvH298q6w==
X-Received: by 2002:a05:600c:3d87:b0:436:1b0b:2633 with SMTP id 5b1f17b1804b1-438dbe9a124mr27335835e9.9.1738151898334;
        Wed, 29 Jan 2025 03:58:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUOJXNPPQ6xLco9EGZUl9hRUezUN+y2Deyf0uuUDDMY6E4w4fKpt4O5zyjSgxt4LyQtnHPOg==
X-Received: by 2002:a05:600c:3d87:b0:436:1b0b:2633 with SMTP id 5b1f17b1804b1-438dbe9a124mr27335535e9.9.1738151897999;
        Wed, 29 Jan 2025 03:58:17 -0800 (PST)
Received: from localhost (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de. [2003:cb:c705:3b00:64b8:6719:5794:bf13])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-438dcc33e04sm20207605e9.29.2025.01.29.03.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 03:58:17 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org,
	nouveau@lists.freedesktop.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Xu <peterx@redhat.com>,
	Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v1 4/4] mm/memory: document restore_exclusive_pte()
Date: Wed, 29 Jan 2025 12:58:02 +0100
Message-ID: <20250129115803.2084769-5-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115803.2084769-1-david@redhat.com>
References: <20250129115803.2084769-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's document how this function is to be used, and why the requirement
for the folio lock might maybe be dropped in the future.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index 46956994aaff..caaae8df11a9 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -718,6 +718,31 @@ struct folio *vm_normal_folio_pmd(struct vm_area_struct *vma,
 }
 #endif
 
+/**
+ * restore_exclusive_pte - Restore a device-exclusive entry
+ * @vma: VMA covering @address
+ * @folio: the mapped folio
+ * @page: the mapped folio page
+ * @address: the virtual address
+ * @ptep: PTE pointer into the locked page table mapping the folio page
+ * @orig_pte: PTE value at @ptep
+ *
+ * Restore a device-exclusive non-swap entry to an ordinary present PTE.
+ *
+ * The folio and the page table must be locked, and MMU notifiers must have
+ * been called to invalidate any (exclusive) device mappings. In case of
+ * fork(), MMU_NOTIFY_PROTECTION_PAGE is triggered, and in case of a page
+ * fault MMU_NOTIFY_EXCLUSIVE is triggered.
+ *
+ * Locking the folio makes sure that anybody who just converted the PTE to
+ * a device-private entry can map it into the device, before unlocking it; so
+ * the folio lock prevents concurrent conversion to device-exclusive.
+ *
+ * TODO: the folio lock does not protect against all cases of concurrent
+ * page table modifications (e.g., MADV_DONTNEED, mprotect), so device drivers
+ * must already use MMU notifiers to sync against any concurrent changes
+ * Maybe the requirement for the folio lock can be dropped in the future.
+ */
 static void restore_exclusive_pte(struct vm_area_struct *vma,
 		struct folio *folio, struct page *page, unsigned long address,
 		pte_t *ptep, pte_t orig_pte)
-- 
2.48.1

