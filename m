Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C865C1DF99F
	for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 11:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738151690; cv=none; b=XOExQOCe1XKe6dtSEtpZk0WV7ia4Sm0ttZSFZOc1Ue52F2sdnsXwyT0ccsaUh6ZPp7g5DlsK/GZSlklI+UEM+DU5S2iyGfZdNFFaMpsnBwyn/aMXuod37gpjiyKvZ6p53Ph2XucAIzBaPZtpteYFYVpYRtJ37pZNQHFBk2875B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738151690; c=relaxed/simple;
	bh=+HDKfekOU+adc/V3u+TwozxiLolT/68LibYtSwb3K4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LI5fsKk2XNi8fgoQ85HJLRZm9mEkWULp9ljfXLvwn0EkKwZ8AeH3df3aRziZir4Lf4viMdY/7pF+B0JNzWzMmgGj5K23ZfYkdeZ2gX6iC1ISYE5IOesVV1g8GSs+rvM6cFXB3z1MIm/vHF/ogMtZJCs7uKSb9mA86G2aFaKkp+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=av7fo/7Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="av7fo/7Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738151687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1V8bFv4UpnBG412679q6Wat0SbxTmvFr7JjVIwnpoX4=;
	b=av7fo/7ZiKXCT15FVAfYlmZ4Q+Rx4IVINVNEpv3pPxakAPGt2A76IYkVb/+MOYhYmFiFyB
	UvNoYrso3Riev6MHDi79qNmgKdCxWjWaKywnXBsx2ZNavEXNyn+BqG+BV2SMXbKSy9l0ng
	f3NT3uZRj5Om4OPzlfxWOHg8G6805Ds=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-5ctE1-v7Pvi3N7511ZAPPg-1; Wed, 29 Jan 2025 06:54:46 -0500
X-MC-Unique: 5ctE1-v7Pvi3N7511ZAPPg-1
X-Mimecast-MFC-AGG-ID: 5ctE1-v7Pvi3N7511ZAPPg
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38c24ac3706so5219064f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 03:54:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738151685; x=1738756485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1V8bFv4UpnBG412679q6Wat0SbxTmvFr7JjVIwnpoX4=;
        b=aRMcrrxVmWdpfpweXGISClz2RPRXN5XBSAgTyFxw6/+xL1qMy2EqQy6wHpZ57gyFWk
         bPXDZQEKcFs6uKDtJRMmzf6tDPMT61F8obqujgST0uKpiV7p63U7AUhHoz2vPYW1pJZr
         1jJ+2KDcfNqqBqP7ajhlWrestCcwzptbR1bBo9yx1VGbxEXNz6l5yCiYXcWYzHiJ1+pr
         QJZngfS7oWQxedLrSYHOphWQhztlr3Ceq//AT0v5064x05Op4cFSwJ+FzDJbNUp4AQE9
         k5HTtih1rSFv3Qq23u8nVIlZj6IzjJqRjBqKaYl2UqW3LMPF9btPF6UP9govXIeoW4+5
         ITMA==
X-Gm-Message-State: AOJu0Yxqwf1Zs3FNmEvtHUd0BF4bmmAbxpPT6kzeFWHJCgIFqppq5W1C
	YVJnEi39zSsyHR3KTTpu+hWnLEl57ZSynQMKRa5MhAhDijirBU+HTvH78wo0jK7Z5EWICOQClKu
	PyKAap+ZNRY8cIYn6TWRcWVHLWrbTjm2Vq00UI2AyDaT0Q2oPHy9KTpBKdg==
X-Gm-Gg: ASbGnctN5xwWnP7Uyvrsv63HYsDjhHhg/e+ZLF58moxOxPB40zDtYmArHk9vatyeGmk
	PPVnnG5oObNto/uTB9B7w80E7+rbvxnYgqXGhYlshpeM4ARFXiddUk+YjaqHdFSgmj+mcaOOFmi
	3paSn64b+DLZ5qnBLEb4dBJgef08CNZeB5UCttrUBzeVD16cxOlPP0jGHCT+y+An2U3u5bveXCr
	hUHbyVd+oKuqQaRFk3zHDkrxnE4LPmOHGzkGV5/1L9D/BJTR2TBM2SCTfHj8fy+HOl+uOmTHfIk
	DuhsBwhuCz0v7Mqdf9MVDFtgmTXC9R5hPezAYsosty2KfQY14YnPKiEEal6AXdwJ5g==
X-Received: by 2002:a05:6000:1f88:b0:385:e176:4420 with SMTP id ffacd0b85a97d-38c5194da70mr2305436f8f.10.1738151685476;
        Wed, 29 Jan 2025 03:54:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUbIgz0SPBde6y+6m4GBK9jxdSxFJzhj9pSmwm9jjlsojNxFlCvTBxohQUGPQAzMIjP8ET+w==
X-Received: by 2002:a05:6000:1f88:b0:385:e176:4420 with SMTP id ffacd0b85a97d-38c5194da70mr2305401f8f.10.1738151685052;
        Wed, 29 Jan 2025 03:54:45 -0800 (PST)
Received: from localhost (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de. [2003:cb:c705:3b00:64b8:6719:5794:bf13])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-438dcc2ef08sm20681625e9.22.2025.01.29.03.54.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 03:54:43 -0800 (PST)
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
Subject: [PATCH v1 11/12] mm/rmap: handle device-exclusive entries correctly in page_vma_mkclean_one()
Date: Wed, 29 Jan 2025 12:54:09 +0100
Message-ID: <20250129115411.2077152-12-david@redhat.com>
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

page_vma_mkclean_one() is not prepared for that, so teach it about these
non-present nonswap PTEs.

We'll likely never hit that path with device-private entries, but we
could with device-exclusive ones.

It's not really clear what to do: the device could be accessing this
PTE, but we don't have that information in the PTE. Likely MMU notifiers
should be taking care of that, and we can just assume "not writable and
not dirty from CPU perspective".

Note that we could currently only run into this case with
device-exclusive entries on THPs. We still adjust the mapcount on
conversion to device-exclusive, making the rmap walk
abort early (folio_mapcount() == 0) for order-0 folios. We'll fix that
next, now that page_vma_mkclean_one() can handle it.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/rmap.c b/mm/rmap.c
index 77b063e9aec4..9e2002d97d6f 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1050,6 +1050,14 @@ static int page_vma_mkclean_one(struct page_vma_mapped_walk *pvmw)
 			pte_t *pte = pvmw->pte;
 			pte_t entry = ptep_get(pte);
 
+			/*
+			 * We can end up here with selected non-swap entries
+			 * that actually map pages similar to PROT_NONE; see
+			 * page_vma_mapped_walk()->check_pte(). From a CPU
+			 * perspective, these PTEs are clean and not writable.
+			 */
+			if (!pte_present(entry))
+				continue;
 			if (!pte_dirty(entry) && !pte_write(entry))
 				continue;
 
-- 
2.48.1

