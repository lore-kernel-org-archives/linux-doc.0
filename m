Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9921DBB3A
	for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 11:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738151666; cv=none; b=GzjP+Yq3BbHaVrBIgFRKvW22DcHgltkx1d5GfNjJ+fzoghoRap5lrsqV5+fc4uFPA9tDKLq0fNKnpItud8sOSz+W8l46EoqfHWxyCICtlI0Oj6LS/50Z/HV+QdO+c8xs9YtVBbcGzJu6Ft2KcY9pgPnh31fnhdrU/2O6X7Rmu7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738151666; c=relaxed/simple;
	bh=dVjhgUnbY5S2QZp19159xKSfA9DylzeqzqhG6tjWiv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NMb7jFHCf3mco4qWeIjDH9KzqbZLp1vKI6IbscsrVymkza0cOKVnEzWJHA3icvdcDmxwX1w2+/9PtVZuZ3tDO8P5NzyVAU89HaH5VKVFwvp1GBWxq8lGm11G5s8LWQJojCylq1CyqqQkkmGgZbmuHa9yjt4dBIIgC2c4myECHt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dgtXkhMd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dgtXkhMd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738151663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=herznK9N3+37fO8/yUnjjPI+kU1qrhYMSQrHDNQrbI8=;
	b=dgtXkhMd1JRBkDaU3GOlEzqu8vKYgBC3QQsXctI799RtnlDx5F3TU4BZPf8kEsXkbDFHfT
	Ib76mgNaq00yAHpMDEnmkVmfhOUncop4HzmAJrYMhfgGcnaceBpbn33G1B1LYMclSdpPWs
	2oLzEgH/aa7zbLYfjyCLVMlsNKw+pNk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-xt6wrNx8NMSildGeO9vXYw-1; Wed, 29 Jan 2025 06:54:22 -0500
X-MC-Unique: xt6wrNx8NMSildGeO9vXYw-1
X-Mimecast-MFC-AGG-ID: xt6wrNx8NMSildGeO9vXYw
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4361efc9dc6so36447505e9.3
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 03:54:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738151661; x=1738756461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=herznK9N3+37fO8/yUnjjPI+kU1qrhYMSQrHDNQrbI8=;
        b=ks9v5c1M9fJNDqovn4wuahbIVHNQFt4vgaUFCtgcVMfVeEM5MaLub4S2MwRvoQZqKH
         8accEjDEsOqd3NEOSTBOUtA5EgrZFfgjLzqPg6wTV4SJDWgOU9rNPG4sssGREx5wJjJP
         WxJMPvLvgLJPMHI/rAEuFYI1SVS7tOb0NKpDKLndG8PKaZEvNah6khUeNY3kSrnk/2Ez
         TUPhWN8pS9jePc459/0Lmu/O3wzDZwagPGDwkkQXiCuFAkqBfllnunPpxik4l2IgHU2A
         vRoQfcUAoJkOtgEX2TxHqrIr5VVgEESTWXMUuhs+4fq7r7/oxx6HAKD7G3791z3cWFiK
         9ClA==
X-Gm-Message-State: AOJu0Yw9J0Uo+C8A8/Tz8sqF2egTjjPzoXjb5p+ovj1brD834SaWk8rM
	XODlfqRbH72EvzPhAaw65HxKaBlVpB8YLe7eb5nMVMGfouCq+tacw2cX2XNgLX4SMXWW7rBjIQo
	azv2iarujIvcL9Xn5LtjFzgQ5jIOJAMpQ+vFvvM3MOTDCVSMW28X0GeAK+i3/b1CC3h1B
X-Gm-Gg: ASbGncvqBP6bQFLFK+kl/iSvbU58p4Ut9qDwzAV26sBHUXNPSLr29XLzcluDKexCmjM
	lfnN5kt5M07E01IyVyfT4S9/k6OLx2GXQRjemuwt+oEcGCJ10Y+ZsEZdUjiGbVYra1jKpm9Ga37
	WDRWO8KagcDa0E4FMXWi8rFQf2LBikHDCd3ThxGsQbzDYSAJTwvd5RlXPul5Bn31uPLkMFEq734
	d/glWfJlf8BHZ9W+pr/QkylvFiR6ARYhx/9BmND7Kail38hquURl7xLJmlBxYIn7FGeKljdH+Es
	C5yJqyd/V7S8ghfNupqx2V+/G8UrppSd4XGY/1w7Rr19ND37nsdr7OVGGJBKFS3JfA==
X-Received: by 2002:a05:600c:5486:b0:433:c76d:d57e with SMTP id 5b1f17b1804b1-438dc3a40d3mr26190525e9.5.1738151660689;
        Wed, 29 Jan 2025 03:54:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEopxoArzHie066mjWjUvNKTSc/02V79PTjUrPj2QcjbwdMpR1m12X2+qvEI4pAjYXanIEeWA==
X-Received: by 2002:a05:600c:5486:b0:433:c76d:d57e with SMTP id 5b1f17b1804b1-438dc3a40d3mr26190115e9.5.1738151660040;
        Wed, 29 Jan 2025 03:54:20 -0800 (PST)
Received: from localhost (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de. [2003:cb:c705:3b00:64b8:6719:5794:bf13])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-438dcbbc52dsm21427725e9.0.2025.01.29.03.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 03:54:18 -0800 (PST)
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
	Jason Gunthorpe <jgg@nvidia.com>,
	stable@vger.kernel.org
Subject: [PATCH v1 02/12] mm/rmap: reject hugetlb folios in folio_make_device_exclusive()
Date: Wed, 29 Jan 2025 12:54:00 +0100
Message-ID: <20250129115411.2077152-3-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115411.2077152-1-david@redhat.com>
References: <20250129115411.2077152-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even though FOLL_SPLIT_PMD on hugetlb now always fails with -EOPNOTSUPP,
let's add a safety net in case FOLL_SPLIT_PMD usage would ever be reworked.

In particular, before commit 9cb28da54643 ("mm/gup: handle hugetlb in the
generic follow_page_mask code"), GUP(FOLL_SPLIT_PMD) would just have
returned a page. In particular, hugetlb folios that are not PMD-sized
would never have been prone to FOLL_SPLIT_PMD.

hugetlb folios can be anonymous, and page_make_device_exclusive_one() is
not really prepared for handling them at all. So let's spell that out.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Cc: <stable@vger.kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index c6c4d4ea29a7..17fbfa61f7ef 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2499,7 +2499,7 @@ static bool folio_make_device_exclusive(struct folio *folio,
 	 * Restrict to anonymous folios for now to avoid potential writeback
 	 * issues.
 	 */
-	if (!folio_test_anon(folio))
+	if (!folio_test_anon(folio) || folio_test_hugetlb(folio))
 		return false;
 
 	rmap_walk(folio, &rwc);
-- 
2.48.1

