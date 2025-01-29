Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F521D9346
	for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 11:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738151673; cv=none; b=c/gdla1rG3I3RnXarU8iKHzDe3DWQBF/EfkMmEUU57OaxQyJwvkn1AUbALnOkeE8KOpBqjS7MrGH80OzW5gvb4R1cgsczdKyxJALe/ZevaU1tOLyp2R+tUjH7NKd7UxSjBzU7k7dgRJNoj6YKjgmxf76OpsbO1aCNb9N1mA/Igk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738151673; c=relaxed/simple;
	bh=Yra65BGBV8k5XKIYw+5XZASeR9kSFc/ZXoKOAD23Si4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cXh6TRJNE0SnvV0+n2BsScw1Tub/fXyLd67NKN4yIMa9kkwHjRA+qy0Lricv/yGwzkniLT1FNLAs/mZhAoIW3hkxgioFN3MVBTBdlG5Zg7XKXLofWXOn3gUbogFKdP8iNRDog0aQcWXtK8OQDymrJ6gRPSgLp/uMvZXC9GK72l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HGytB2dV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HGytB2dV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738151670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/5TTv0Iu+aL+vrfHcl/JjDhmk1gN271wttPyRyQHADk=;
	b=HGytB2dVkPgiR9ejfwBiWU3gdGB46hzHD07qcVkIvzbpo+vNrbBZfVvuVm5jHegd5icUB5
	tqUvegNVk/Es8n+hRQFyg5MRW2KwD0UPjG46XQ+JUZHjqil2x5N4p+bR04OvtRpgMCV45N
	rvdmNb23GWmotgdCatioCxRvQXBiMq4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-miJ9jmXrNVCK8Q1TyjWpTg-1; Wed, 29 Jan 2025 06:54:29 -0500
X-MC-Unique: miJ9jmXrNVCK8Q1TyjWpTg-1
X-Mimecast-MFC-AGG-ID: miJ9jmXrNVCK8Q1TyjWpTg
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38a2140a400so5195813f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 03:54:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738151668; x=1738756468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5TTv0Iu+aL+vrfHcl/JjDhmk1gN271wttPyRyQHADk=;
        b=Iek38gOCYqWGve8JoxleJbfwNM22tHGeVmJ3tbg/5Cnir/YbX+jTBlo3ez549tuG18
         /YNAhtDlcfKJorlR4YIznjfyScDCDMq+rqThWjLOunxhH2lCihkCPR6RZujdiIOy9MYv
         ryOUV/r+cUPJSYkmC/SlOWnBNhdx65NfckYYO5ZjZpKtr4BMl4VGf2a9btFcLeXM7Q98
         qgZ4P5EmX/4C9sPONZYbSeNtQ9S+AtZHn+/PI1mK9RdQ4UMoPeOrlXfuz+7jhY7ZABLL
         a8WgJm5w1cvOPlvCt8AZ+vkHAcMmsCdXqIK0lWKS6J8oFihK1FyztLptQkCyvcpfiX8+
         VxLg==
X-Gm-Message-State: AOJu0YweQmUyXn7m4Ube12pycsrIWcP+Qliq/ixRu7Znzf3AOMzQMMMi
	uOSoeJz8I0qIRAIjoRxGjmcyYqln33zufW57Yj1dPfOqY0l1CE+MhuHvBI3fIsy0ohwE16FDNc2
	9m2Xu8XN99uYe1GAO2yalpONJKTA79VI0ZXoFEKsluo3DkV6EdnjTss6hKiips4+ZgEAQ
X-Gm-Gg: ASbGncvPWQt2CvttyFvRV0w95lOOQkFCR2TVqk/twUPLG1oFnWRDhXVhzDMvad+uDNS
	uAA49qpom0eiMtRaYp6ozFv5w93ZuQPzeequII5/QsM9VI/+MT7mz19O0VtTrggT4hPQFPZuDQJ
	qxiINbDrvgFwXBVEWqYgGHmOseInFlqMTQcIvp9M4SKoWDaPDHABGBpEBUKHZN7/OSVXZ/Jx4SN
	7+xU245IZ4Eg6455eY+Vqk6tYXs7fio5mxVCGUN71ldotIauCwhsSeBBEH0O3Sc6p/Qk53cBg1a
	jsvb30e/ST1VZkDDU6D74b3gGdDpZXaS9yV4v3uW0eaNDjFZnDFReKQTEwsrJBsUVQ==
X-Received: by 2002:a05:6000:1fac:b0:386:3329:6a04 with SMTP id ffacd0b85a97d-38c51e8de63mr2549378f8f.39.1738151668340;
        Wed, 29 Jan 2025 03:54:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3OskkNotGDGa9hKk/bhinDJ94hVo+TUAo4zN3qwEB+ZEXq9Nn9aY72BgysSoJ/r2gZh7hQQ==
X-Received: by 2002:a05:6000:1fac:b0:386:3329:6a04 with SMTP id ffacd0b85a97d-38c51e8de63mr2549347f8f.39.1738151667985;
        Wed, 29 Jan 2025 03:54:27 -0800 (PST)
Received: from localhost (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de. [2003:cb:c705:3b00:64b8:6719:5794:bf13])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c2a188fe8sm17066981f8f.56.2025.01.29.03.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 03:54:27 -0800 (PST)
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
Subject: [PATCH v1 05/12] mm/memory: detect writability in restore_exclusive_pte() through can_change_pte_writable()
Date: Wed, 29 Jan 2025 12:54:03 +0100
Message-ID: <20250129115411.2077152-6-david@redhat.com>
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

Let's do it just like mprotect write-upgrade or during NUMA-hinting
faults on PROT_NONE PTEs: detect if the PTE can be writable by using
can_change_pte_writable().

Set the PTE only dirty if the folio is dirty: we might not
necessarily have a write access, and setting the PTE writable doesn't
require setting the PTE dirty.

With this change in place, there is no need to have separate
readable and writable device-exclusive entry types, and we'll merge
them next separately.

Note that, during fork(), we first convert the device-exclusive entries
back to ordinary PTEs, and we only ever allow conversion of writable
PTEs to device-exclusive -- only mprotect can currently change them to
readable-device-exclusive. Consequently, we always expect
PageAnonExclusive(page)==true and can_change_pte_writable()==true,
unless we are dealing with soft-dirty tracking or uffd-wp. But reusing
can_change_pte_writable() for now is cleaner.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 03efeeef895a..db38d6ae4e74 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -725,18 +725,21 @@ static void restore_exclusive_pte(struct vm_area_struct *vma,
 	struct folio *folio = page_folio(page);
 	pte_t orig_pte;
 	pte_t pte;
-	swp_entry_t entry;
 
 	orig_pte = ptep_get(ptep);
 	pte = pte_mkold(mk_pte(page, READ_ONCE(vma->vm_page_prot)));
 	if (pte_swp_soft_dirty(orig_pte))
 		pte = pte_mksoft_dirty(pte);
 
-	entry = pte_to_swp_entry(orig_pte);
 	if (pte_swp_uffd_wp(orig_pte))
 		pte = pte_mkuffd_wp(pte);
-	else if (is_writable_device_exclusive_entry(entry))
-		pte = maybe_mkwrite(pte_mkdirty(pte), vma);
+
+	if ((vma->vm_flags & VM_WRITE) &&
+	    can_change_pte_writable(vma, address, pte)) {
+		if (folio_test_dirty(folio))
+			pte = pte_mkdirty(pte);
+		pte = pte_mkwrite(pte, vma);
+	}
 
 	VM_BUG_ON_FOLIO(pte_write(pte) && (!folio_test_anon(folio) &&
 					   PageAnonExclusive(page)), folio);
-- 
2.48.1

