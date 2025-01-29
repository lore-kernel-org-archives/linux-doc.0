Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E591DF73A
	for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 11:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738151687; cv=none; b=cTo+4vtMZD19S0TrnrjTk9ktDtCZVpHWCsAHlkzRuBd9rqCZ3+3W+03+LVznZBk1rbPbfzwKSQiDUB+i3OE4RIH1Bj8Pz3AU/Vr0BxF4RCXv7R6+5PXsmDl9wHleuj3CYV0DFwdZm2Oa/d+Y0JckcHTKsG3lNjEVHYLID4c0YgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738151687; c=relaxed/simple;
	bh=3RX1C3dSti0Y2JUqODIhfRDdkayq20GNG0HByNlQRYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SJAHnfQhLFARo7NnNPcZaBbjqYPgeXalb9YKLcV0kGGRSlhQ51EJw2ajTHIIX1XZf3YkJhxNh7/tNTzePbAOHbZuxhlzOTonOWug6L66z2rh9czviWHArOc03lRG4MjVXMiQ5nHcFjoyUwDl1eXJ1TZZJ0YBCa3K8yHjQBsKdfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gb0AFx00; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gb0AFx00"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738151684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mNM6Zw+nv5CKX0FXtzXMADzAxRUJZ/HteqC2IEBjnh8=;
	b=Gb0AFx00hvqDSKO8mnHFf8JR1IO47yryW3Y5vQB6yJQF1oUKXgDx/6nMAjpD5m8bDyj9MG
	Wc3REuPcyRZgydF/RYu7nrJGiqgw5MeRHyKW7wwvr9JbJQSKQL3FeiUPcRf5qT4GAk20SQ
	fskMEhA1hBB2TY/nifET64ZyLILd7fA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-KFd7pCyvPyytsb8TNF_qgw-1; Wed, 29 Jan 2025 06:54:43 -0500
X-MC-Unique: KFd7pCyvPyytsb8TNF_qgw-1
X-Mimecast-MFC-AGG-ID: KFd7pCyvPyytsb8TNF_qgw
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3862c67763dso2402811f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 03:54:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738151682; x=1738756482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNM6Zw+nv5CKX0FXtzXMADzAxRUJZ/HteqC2IEBjnh8=;
        b=KJzyhtxB3soHMmZNEnsRNsl/08WVfBtZypva15arRDrfpjaGqKU+6TlcDewRycz+cn
         /hAgq9/K9rCpXlMYDakwscBmWeM/sZUiGsh29VyOXeza/2vq3U1mY0Gnj/L/LSpqjvtI
         ++XGC87DBu4ERp0+NCxmMm9zuBAKjM+xLZisfvJzKHMOB68JaY8uaxqeQFUrOXhfEUD7
         a3MaYoanr1TR7D8MpBsMJC1Jlrh70+UdQpWHDemJuboMjBpoekau5LO6BH8fm7u8CNdr
         VMxmhdz84mP4l5SKPgHpxr8ze6P92feJAh/OT0enXtW3HhTl1Q3XInnc8xYEMuIVWX2T
         YBBg==
X-Gm-Message-State: AOJu0YyDeN5FbvCs2RTeYcA5Yfr180WYHPNTQxX5FcPnSlIM+TRYafRC
	dfOkp3B0OHYl4eMru6H5cZ/DFs0/TrTRiJsQ7Y9j4HYI4TojaR3gvYDl4BImoYaKeg5S54XNhZO
	0+eC1FS60DMX8p5Pbp9HM7lAXtBGf0sfm15Ylm7zN/dvge9jGy1BghLjqwA==
X-Gm-Gg: ASbGncu5kOfBcJrWfp9jFlIpaYTj/QyQxLsk4SCdoIQWynGzHwDSWUSNO6ADKtQDeou
	iiWmEynWi2O+KU5nPA6b6wi6RBYAVtjWuHT+21TM/bFi2Gt1Up+i7nEIoqPVb51UYV+xHBA5uQ8
	2KbKbr0oaK70W8i6XRyREO/pM0cYxIy+kTZH+5O1C678wQ+4unGNXdmPbIIH7RwjI+yB6IKMGK+
	rQvmDkWFwwHZNIF41/ty7Yd8UtFubX7WAmKN+UaT75fwRBM9NLrZV3u/BywrmV7YZ1VLKYFbkuZ
	lvYIl3ea2kyAwOsnTmzPnraozriex4x53NC0sKeBRJBacFvm4qW/Zp9H2Mm3QjAKzQ==
X-Received: by 2002:a05:6000:4013:b0:385:f631:612 with SMTP id ffacd0b85a97d-38c5195f2e5mr2414996f8f.17.1738151682141;
        Wed, 29 Jan 2025 03:54:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfVb9Gb5/TQQdvQH0d8Y86brLumLHRijGlRqbPqwAUyE2LkrZ873cAyk0+z1AQr8yjahg13A==
X-Received: by 2002:a05:6000:4013:b0:385:f631:612 with SMTP id ffacd0b85a97d-38c5195f2e5mr2414952f8f.17.1738151681703;
        Wed, 29 Jan 2025 03:54:41 -0800 (PST)
Received: from localhost (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de. [2003:cb:c705:3b00:64b8:6719:5794:bf13])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c2a1c4212sm16316119f8f.87.2025.01.29.03.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 03:54:41 -0800 (PST)
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
Subject: [PATCH v1 10/12] mm/rmap: handle device-exclusive entries correctly in folio_referenced_one()
Date: Wed, 29 Jan 2025 12:54:08 +0100
Message-ID: <20250129115411.2077152-11-david@redhat.com>
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

Ever since commit b756a3b5e7ea ("mm: device exclusive memory access")
we can return with a device-exclusive entry from page_vma_mapped_walk().

folio_referenced_one() is not prepared for that, so teach it about these
non-present nonswap PTEs.

We'll likely never hit that path with device-private entries, but we
could with device-exclusive ones.

It's not really clear what to do: the device could be accessing this
PTE, but we don't have that information in the PTE. Likely MMU notifiers
should be taking care of that, and we can just assume "not referenced by
the CPU".

Note that we could currently only run into this case with
device-exclusive entries on THPs. For order-0 folios, we still adjust
the mapcount on conversion to device-exclusive, making the rmap walk
abort early (folio_mapcount() == 0). We'll fix that next, now that
folio_referenced_one() can handle it.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 903a78e60781..77b063e9aec4 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -899,8 +899,14 @@ static bool folio_referenced_one(struct folio *folio,
 			if (lru_gen_look_around(&pvmw))
 				referenced++;
 		} else if (pvmw.pte) {
-			if (ptep_clear_flush_young_notify(vma, address,
-						pvmw.pte))
+			/*
+			 * We can end up here with selected non-swap entries
+			 * that actually map pages similar to PROT_NONE; see
+			 * page_vma_mapped_walk()->check_pte(). From a CPU
+			 * perspective, these PTEs are old.
+			 */
+			if (pte_present(ptep_get(pvmw.pte)) &&
+			    ptep_clear_flush_young_notify(vma, address, pvmw.pte))
 				referenced++;
 		} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
 			if (pmdp_clear_flush_young_notify(vma, address,
-- 
2.48.1

