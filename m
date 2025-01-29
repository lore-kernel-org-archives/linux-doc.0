Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7461D9A5D
	for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 11:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738151892; cv=none; b=uF23iGjq04oEtLcsXfg/FPiyfgyLsi9khXSwgNbDbaAASB9afjrMX15lpvOKqVjHQjaXrrevdusIsj3cMtY+1utm6e7EfWEZYJm+Nw6bn5LbNJxwGx5ht5q0U7d6pwQxMuWHvTnLdf22d5SZIIt+u8k1P/Dmg3vqeKWJy0guJ68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738151892; c=relaxed/simple;
	bh=iEPqXBJKpnaRKCZN4FWo6CByl3Jpq5LrjGBC9uGdjnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZAsVx6Z8F5EQjeDSyXiWhWcqZyZ7zs1FggzPixeIjO8aK8bmN0/HHMFUOV7WqOt+kpNCwhWkd1M26jFG4vbtHJA4upFQWVGMhDX7gViD5+sCcggoprak1yikpmxlGokJRSmeK4sSUBBAaH5vCM4g2uMj3hswhLsV0I8H9Oralok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QNYiKJgD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QNYiKJgD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738151889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d2VUZOG2JXQGulr/59KbaCbJaaQXiPGDaZBI3uCTMkc=;
	b=QNYiKJgDxMguARoJP0WC/gONaaVqaCwqphsvNlp1fvSp08b1lSHZj5CrSJZsC7CkMq/giz
	KPKIQsUItLuD8TEHA55s0QB9D482HisqFrgpGFfLA48odTxaIqy3olc5SFwZO/NFcz1XIW
	uQ4bVpQuGLlhTdH6Qtu6LBzBxND+isw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-K-n2a1OPPYaymzWKByY0OQ-1; Wed, 29 Jan 2025 06:58:08 -0500
X-MC-Unique: K-n2a1OPPYaymzWKByY0OQ-1
X-Mimecast-MFC-AGG-ID: K-n2a1OPPYaymzWKByY0OQ
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38629a685fdso2379599f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 03:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738151887; x=1738756687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2VUZOG2JXQGulr/59KbaCbJaaQXiPGDaZBI3uCTMkc=;
        b=NU0Faie0KxO7B+avzSqbjeuTWBGYOK6Lmu4nwUU7ce0xchpPGGDXfsJvFUAIVtkPlW
         RGwhfbTBlRpWLI5s181zIUxj4uS6t8j6sN4GG7fD0GQe5u3yU7kR/Fp1H7JFdS8B8/b/
         +TVLn3JrvDygb1ZjEhFJou8pHPAR1aTzde1So8kvpTuoM8h4xmQze3FKFHBnBDUbfuxz
         CzyvHNihAYaR/DCxPakbh5HFexyMkgABj2eXEWZ7HbNxdB/Ks2z10yvIM+e/SDdm2vk0
         UKCa+gg54qh15dLx7oL6X3b57h4DqxLg6MrgSB2ICyQsaGyIemwPmzy16TLjtqatwVcr
         Oj4w==
X-Gm-Message-State: AOJu0YwiJhrWlGZgRRCwS14hYQOkyRH0Gvby61NwBBX+IhIrMIxtqZP2
	Io277Qg9As5D1Q9Li/eGeemshOX3dVuRdvjP+0KfeVMj3O4WIW6jkinTvPWVXWkXUoltVcByKii
	LtEydnj6oyeARc2EfwQk7ANgxXYFPFdt55zxRvKN9txuN+Tl9N2IYIMoaI0HlIYj/9ZRf
X-Gm-Gg: ASbGncu1m9tZbCQciUpoPcGzd46T6b7PQZ3lfjt8xQ6A9mE02qhpB78Vpn8H4FzIfzU
	jfCzP4YtdtqxPw+LRhzvV1wvlOfgm8GTh8U+B/uOUwMOlp6rwNUmQhXgIGfDFtSa6s+thyk3dSA
	G+XyrnbtPyoAGwgtgyy0Ny2MrhMuxeILRV5xldlSaN8jCAhA6JWQkDbYIOSSUyJqn6wsuDc/JLn
	MZ3ewYm1xHtOnuDIZj3C7Ecd7edM5ULBqTkxGorPg524c93eX4izSsfn/sKfeVXqC/kr2ToVsbn
	VOATBv2fpr8R9pHfbvo7RwLXigYJB8GB4lLM1F/j7E1sHRx4iT0JN1DldX8cb95yGg==
X-Received: by 2002:a5d:5f4a:0:b0:385:df84:8496 with SMTP id ffacd0b85a97d-38c5194ca26mr2531082f8f.3.1738151887075;
        Wed, 29 Jan 2025 03:58:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7JXtANqVSB26MQ84y3Q20UL5y0GbKL9q7LZjVMoQlUkfabdqXk/TfkO91TOMW4G3rYudCgA==
X-Received: by 2002:a5d:5f4a:0:b0:385:df84:8496 with SMTP id ffacd0b85a97d-38c5194ca26mr2531049f8f.3.1738151886670;
        Wed, 29 Jan 2025 03:58:06 -0800 (PST)
Received: from localhost (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de. [2003:cb:c705:3b00:64b8:6719:5794:bf13])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c2a1bad87sm16858323f8f.74.2025.01.29.03.58.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 03:58:05 -0800 (PST)
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
Subject: [PATCH v1 0/4] mm: cleanups for device-exclusive entries (hmm)
Date: Wed, 29 Jan 2025 12:57:58 +0100
Message-ID: <20250129115803.2084769-1-david@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a follow-up to [1], performing some related cleanups. There
are more cleanups to be had, but I'll have to focus on some other stuff
next. I might come back to that once I'm stuck on (annoyed by :) )
other things.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "Jérôme Glisse" <jglisse@redhat.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Alex Shi <alexs@kernel.org>
Cc: Yanteng Si <si.yanteng@linux.dev>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Jann Horn <jannh@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>

[1] https://lkml.kernel.org/r/20250129115411.2077152-1-david@redhat.com

David Hildenbrand (4):
  lib/test_hmm: make dmirror_atomic_map() consume a single page
  mm/mmu_notifier: drop owner from MMU_NOTIFY_EXCLUSIVE
  mm/memory: pass folio and pte to restore_exclusive_pte()
  mm/memory: document restore_exclusive_pte()

 drivers/gpu/drm/nouveau/nouveau_svm.c |  6 +--
 include/linux/mmu_notifier.h          |  4 +-
 include/linux/rmap.h                  |  2 +-
 lib/test_hmm.c                        | 35 ++++++-----------
 mm/memory.c                           | 54 +++++++++++++++++++--------
 mm/rmap.c                             |  3 +-
 6 files changed, 54 insertions(+), 50 deletions(-)

-- 
2.48.1

