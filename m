Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739AB337BB9
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 12:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761051598; cv=none; b=OXAYr+JDWcoqYogfurxSl8JnxBVdVfba0CP/jOMT0RmvtYc+wxcj5KjdfezVSjvgQcV8J39RvQYel3QgzHfsABWKf+2Z7frwkrhhblB0QZrfYlqYlkQXPOUT3r1f05VZ6B1pw1x/eMRDdBMW/t61kC/+QCvWJ6YVQukAn8LrmXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761051598; c=relaxed/simple;
	bh=u7008y8MgBH/UJlpJQuW7nnTnLv1WM7skWUdVur6z2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RmSjpju+MsqAKiJyyJN5LUbcATk9SU+2z/1BkloaKKptmGOkqqUperzRE8/ryixFJiY7VRtnhshrviqOzlyqOI21CAsC3avKI1fQVhFNT5juSbqekI3ol2iHFe0ialy0UVZoA2P+myt9EURQdgcut4OVbwFw/TeQyh26HqfwmP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MCVBvl/C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MCVBvl/C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761051595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pex3TSD4VopdNGhgViIupu2qOIUkRM48nNF7NdH4ZpQ=;
	b=MCVBvl/CWeiU8L6YHEiokQlCPz4h/BagEaJUK6K9sErQ70IlculwjTmxYHbK3AXG8SCbDG
	P/+FGwwK1TcwTs2i9jKtwc1nRV2Bc1gv0JIuytD5breMKdj2gPANmGjXldw9GlJuIOhsBE
	IghuzugRRoi+xO2/dp4vCPxj4l/Q9hs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-6dxLYGg8PUOsLX9yap2gew-1; Tue, 21 Oct 2025 08:59:54 -0400
X-MC-Unique: 6dxLYGg8PUOsLX9yap2gew-1
X-Mimecast-MFC-AGG-ID: 6dxLYGg8PUOsLX9yap2gew_1761051593
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47113dcc1e0so46433645e9.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 05:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051593; x=1761656393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pex3TSD4VopdNGhgViIupu2qOIUkRM48nNF7NdH4ZpQ=;
        b=GKZc3vU6gdaAzvXiB2HsKL08lV1efFTUnnbZRKs7LV2VLjcvWfT0EOCGWYGGZf91HZ
         37Yb6nY+UcbWF12s5A5hTYZ5NvWQltZOOJNyqBL70nM2iFO0fWmQuDaeZz0McQH5lneE
         w72BL07teYSpv5gwNeYU0GJnTII9slq6BSDJwfsEwLy8h3q48AGd+zROo4ru6EcaFJ8v
         KH9kiKtFDkDtiha/40qtc+Zdlf+1A5KFMNm3Ls94S6OF6vmzLS5Hjip+zkFoewHS8oD5
         hPVD4LmRjGn41fYsPO/P8H9Zsa0BHAlkpRTKxl/fzIjVp+Xm8KBu7wfDERT9nSS4//+d
         QoLg==
X-Forwarded-Encrypted: i=1; AJvYcCXYxkzZ+QvLlelIykUdXxlxnrOL+89qVDYIoarOMcaMz6WmQpeXPq8dX4uTINRE3EHilZAir3YWZwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeRXJf2aZCiN9J49kLD/PnaFqW/9/hyX4dngP/6IPLJj3wZoIj
	9UAHUClFn2tPbcsxUwq/MSxgF4FYOhFwXPZHjg+mfUfHVUpkRHx9LE9I9kEUVxXB/sPtT5yqyc5
	yqT7QlyeYgQKF4+nlUKEXPqLH8XwzH+CDTLpBPt5+2zzC2RbnbxJ+V4oyw4kNtw==
X-Gm-Gg: ASbGnct5DuHDBcd2AtNubTYYUTgxVX7lG9mNyon2LPz7BgCQJi9U934XRGEAcLTOvKi
	szvTDkS2VyDdEktkVCbftRRxqyKbUSn1KyQfCELrc1zP7S7rR374isVjsO/kXausIJil9qXFpr2
	08g3izNh60GrC1ywloglcraf0h/ZSW6f6wSdkudWPolMYHHQoosGdlUwRY2lMVh+OR5DEYhIe8n
	qeWZWNYBJVSD/WMqG15FSg4TmIBLU6P9jfX9JITeTWijeub0P98KYEN7K2tb7SWiRaJnPhAKmx+
	+MgG5G+Ciqf3C6S0il3tvEUJSNzRgiplUjqbi4S9B8vX3f9bfoUbJny3kSiieH1qPbLOL4fd5pv
	32fdO03jhAvEAq9H3lX/ZA2h/a/IG8CBcfFJ9LnvOy3ewAbHVQx/UhGrq+H67
X-Received: by 2002:a05:600c:3581:b0:45d:d5df:ab2d with SMTP id 5b1f17b1804b1-4711790bf23mr118755985e9.26.1761051592827;
        Tue, 21 Oct 2025 05:59:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA4wZ2YHHfGwBY+P4joTOmyMCpMPrDXxQSxjIfhLQThHNmEp/4Y/9hLtnfofL7CHt5koNYrw==
X-Received: by 2002:a05:600c:3581:b0:45d:d5df:ab2d with SMTP id 5b1f17b1804b1-4711790bf23mr118755415e9.26.1761051592292;
        Tue, 21 Oct 2025 05:59:52 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f00ce178sm20202274f8f.46.2025.10.21.05.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:59:51 -0700 (PDT)
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
Subject: [PATCH v1 09/23] mm/balloon_compaction: make balloon_mops static
Date: Tue, 21 Oct 2025 14:59:14 +0200
Message-ID: <20251021125929.377194-10-david@redhat.com>
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

There is no need to expose this anymore, so let's just make it static.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 1 -
 mm/balloon_compaction.c            | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index ad594af6ed100..7db66c2c86cdc 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -78,7 +78,6 @@ static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
 }
 
 #ifdef CONFIG_BALLOON_COMPACTION
-extern const struct movable_operations balloon_mops;
 /*
  * balloon_page_device - get the b_dev_info descriptor for the balloon device
  *			 that enqueues the given page.
diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 28ef0cb6b3bbc..c44e0b62203cc 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -286,7 +286,7 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
 	return 0;
 }
 
-const struct movable_operations balloon_mops = {
+static const struct movable_operations balloon_mops = {
 	.migrate_page = balloon_page_migrate,
 	.isolate_page = balloon_page_isolate,
 	.putback_page = balloon_page_putback,
-- 
2.51.0

