Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D7C1B6525
	for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 11:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738151895; cv=none; b=S4dN4UJIk4oyp3aqgqiGsZO7B4K5m4k1Da+IPOe4iPLOGeiI3IqcvJ7RRDYUtG4D2aSPwD0XWxMinlnJHEvqtG5Ir81p42EsKkv9Qf0/nRlkyXsGzBexh1kfwAiqzkNafLdR3RaSb0cQ+GY6/hz57TiLeU2acWX9Sicad2WsPq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738151895; c=relaxed/simple;
	bh=INxpcPFbFbOdxrLDGz72x2XA3kxfXFbHhUtixOst4xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aOqbLUiaEoOnWOIg9HfB3oPTgAXlC98wL1jOMaBh3BvNcg3qQvERTgxyYyFDK1iQ9s6nI0lNQFIgCWkQl4mY+iUSU3ggW0gpidbqQLyHdP1Wdhwrl06yVjUaki2us6FO7ZhEDwiEFMJ0kXvKlhveNkjWwmY8rdvNg2vsRmjStZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZL98VRbN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZL98VRbN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738151892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IvULs1yE7EOmGau/Ggivq4i0htACtoQXWVK4/nOi/M8=;
	b=ZL98VRbNMkhHlb3yXr4xzMdvoQHwBzE64EP9qBC6t+UeMMNkUKEhiM845im+KCAVjqrZyI
	KMKjC6EtNEjfm+EgyM9ExnXPJ+vFQDavJPnLBm1Xb7ZU43KoJ2WHOm7GL8GyibOQX4fvp9
	yN6c/t7p+WbSJhefF2ww+lx7iCVVqvU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-u3RPwKLUPL2T_V9P88uAxg-1; Wed, 29 Jan 2025 06:58:11 -0500
X-MC-Unique: u3RPwKLUPL2T_V9P88uAxg-1
X-Mimecast-MFC-AGG-ID: u3RPwKLUPL2T_V9P88uAxg
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4361a8fc3bdso32545285e9.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 03:58:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738151890; x=1738756690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvULs1yE7EOmGau/Ggivq4i0htACtoQXWVK4/nOi/M8=;
        b=QZmw2TdVJuNYXL34ZTQXrwn47GRxkF2wrbX6y50lRLOCaWqR14yZQUo2K5i0gVJK5Z
         0ETqaxshhLOxXI60IcpyEWaYPQ9dWWDqSP8+9uWHk1oysEKITUrM3N7rqdylFttIaaGh
         UfgtbX3LRdhZEJjaOBs/Z9yc8xJhBWcDTOIAlp37YXd+oGGLtv1l+3YFyUrzzHBMy8lk
         TfIZnVkvJb5XrLwYp4+6ANDYRx7tKMUyO6Lj5lzxAyTKR8w3WE3owPUUXRuNMXfm7X01
         N1aWG4yiyPZV2XYgGdNSxtpta+wQHC6kHwmUJKA9WZMxmMwNawlKQHP5EFfcF4td+d29
         LSfA==
X-Gm-Message-State: AOJu0YxDSl7ctDXV0i6ujzJEDqr560DRgUtzAzXCHgkwSLuWyJhJOOnh
	/rqbjnvlIz2DLbHe1i/NcGnHeESWZVEy4VSo/t29jagAFcaYvby+msEBnACfcsDUygvmdSvpV0f
	AHqo71lXJbapBoJnlrdVYdfW+UdWBP0O46GuWpxSAtSP4kMFUWyUaOrzoaA==
X-Gm-Gg: ASbGnctRHMNtaKLlQv5uYO/HzhZ8ReJqcS6AH0vW+pw1KWSGjL8yGtLmR6c7oVw3W96
	OrhvJd+C0Uui0frSbID+RTZzh39/dlxGE4ldKwaZ4t0cXQkJ3leTlWT9TueRMLQ37Oo5xjTwWdw
	AaKpMvWZzD81+0HbrUg/r9KR1582mAbEMBLEHtAnGEmNhrIgerrn2MPmznPoHUyOHn2gB5UxRcd
	imJU9zHEgAyARhNB2sKSo/CAvovNSFsaiyxm5Nq1PPANbVim18Y+xiBelcU6whibFG+wzccYL6L
	ImIAtUCzgL8MWMuvE6E2BulQjelomGdX4rKrm1tjr0SzJ6p5evmqoGWgnBpz/cH6hw==
X-Received: by 2002:a05:600c:5252:b0:431:6153:a258 with SMTP id 5b1f17b1804b1-438dc3ca802mr23864035e9.13.1738151890431;
        Wed, 29 Jan 2025 03:58:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqM74m4ZV9IsBXW9SIKcsLoOPVNY/fxsU8Okkl94/EsEQHDya1iNUyBhUuUArF4/LgH5tlYg==
X-Received: by 2002:a05:600c:5252:b0:431:6153:a258 with SMTP id 5b1f17b1804b1-438dc3ca802mr23863905e9.13.1738151890101;
        Wed, 29 Jan 2025 03:58:10 -0800 (PST)
Received: from localhost (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de. [2003:cb:c705:3b00:64b8:6719:5794:bf13])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-438dcc12f88sm20420515e9.2.2025.01.29.03.58.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 03:58:08 -0800 (PST)
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
Subject: [PATCH v1 1/4] lib/test_hmm: make dmirror_atomic_map() consume a single page
Date: Wed, 29 Jan 2025 12:57:59 +0100
Message-ID: <20250129115803.2084769-2-david@redhat.com>
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

The caller now always passes a single page; let's simplify, and return
"0" on success.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 lib/test_hmm.c | 33 ++++++++++-----------------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 9e1b07a227a3..1c0a58279db9 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -706,34 +706,23 @@ static int dmirror_check_atomic(struct dmirror *dmirror, unsigned long start,
 	return 0;
 }
 
-static int dmirror_atomic_map(unsigned long start, unsigned long end,
-			      struct page **pages, struct dmirror *dmirror)
+static int dmirror_atomic_map(unsigned long addr, struct page *page,
+		struct dmirror *dmirror)
 {
-	unsigned long pfn, mapped = 0;
-	int i;
+	void *entry;
 
 	/* Map the migrated pages into the device's page tables. */
 	mutex_lock(&dmirror->mutex);
 
-	for (i = 0, pfn = start >> PAGE_SHIFT; pfn < (end >> PAGE_SHIFT); pfn++, i++) {
-		void *entry;
-
-		if (!pages[i])
-			continue;
-
-		entry = pages[i];
-		entry = xa_tag_pointer(entry, DPT_XA_TAG_ATOMIC);
-		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
-		if (xa_is_err(entry)) {
-			mutex_unlock(&dmirror->mutex);
-			return xa_err(entry);
-		}
-
-		mapped++;
+	entry = xa_tag_pointer(page, DPT_XA_TAG_ATOMIC);
+	entry = xa_store(&dmirror->pt, addr >> PAGE_SHIFT, entry, GFP_ATOMIC);
+	if (xa_is_err(entry)) {
+		mutex_unlock(&dmirror->mutex);
+		return xa_err(entry);
 	}
 
 	mutex_unlock(&dmirror->mutex);
-	return mapped;
+	return 0;
 }
 
 static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
@@ -803,9 +792,7 @@ static int dmirror_exclusive(struct dmirror *dmirror,
 			break;
 		}
 
-		ret = dmirror_atomic_map(addr, addr + PAGE_SIZE, &page, dmirror);
-		if (!ret)
-			ret = -EBUSY;
+		ret = dmirror_atomic_map(addr, page, dmirror);
 		folio_unlock(folio);
 		folio_put(folio);
 
-- 
2.48.1

