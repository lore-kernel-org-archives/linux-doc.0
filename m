Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548DD342C95
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761058862; cv=none; b=YtjLiYgg8w2feJ66wuFiQyToeKJ4IdzPvSmufRgY6i5L9fcm3tYHcDGS+65Jxo7wccmkCslcre9TSSsLXxERpA4qZLRdqX0bHwWwJYfrZgcNaPJgNHDBFjjYudqzo/RDn4NMgmHuHJV4zlk7v/K6Qhg2hb1+GPF/4wdvmLDuvWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761058862; c=relaxed/simple;
	bh=ulLWxUh8EsRrOFrJv2gdzbq5iaYJxZBYyWiTN0ivhT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XmZdg1/clEgT33+wzhMSdJ37j3faxyi/fxBHhqZiNlo9wiP/oCnevss69Es6jBQZGXCxseMfLCxr/hhR9nsEbm9Ee8zTrLrVtiT8J/JgXQYht7NwUl+h+NOdQkP22oc0cJMW3Igr5/IZl+B+IBZvY0p2amxjpst/hVnOZzIiRVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K5ydAzyA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K5ydAzyA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761058860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lRubUKoIKZa05nEVw7UJ7l9fUFkh873Slwn5354MkBU=;
	b=K5ydAzyA7Dk6FCtgUGfOK356kYsdGmwQY/nCZNuNBTdr8EmMxX0EQliC02n8jJ28xyhA8q
	XR/3A0R+WTQwx5HZNatDscjt8twHSJAKooVn2UWWVbddOPV5QdWtSXGN/DKP+HlNQRGq9L
	E0/vRMqsMEYbBys2uLpjGHjcmBEDGHw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-8w2b7C-vPtm05iyATl_jyQ-1; Tue, 21 Oct 2025 11:00:59 -0400
X-MC-Unique: 8w2b7C-vPtm05iyATl_jyQ-1
X-Mimecast-MFC-AGG-ID: 8w2b7C-vPtm05iyATl_jyQ_1761058858
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-427060bc12dso5836192f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 08:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761058858; x=1761663658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRubUKoIKZa05nEVw7UJ7l9fUFkh873Slwn5354MkBU=;
        b=wRbspxcjUnsiXGMAtOnJ50R5YXuuEMdVD44uAWSHOrwc2K6mxmxU9Sck6q+7YgJ9Cl
         URemaCw/l7pVj1ZEp7wAnDbJ6goZXWg+92ysVsxRdYz+a9EBLkKcQe9vdXdfwXTkYBZJ
         phtYTYxLuSUdYWlvKhFEYCKga4nlsWNUb5lCoITWv0VJ+dM7anU6zqBlOx/KNqruzBDs
         Dw7mbcDX12edvBZTRQ1R+8ITrOTNMk5UL91bDD3v72DE2VZkNMrbaXGj1qyXjD2nZLOu
         B91MTVLv5oI8db74X+7wsCCArNtm/H1dgLHtLis3nT8/TWu+WBgQuxDmpq07AClfzjCS
         bURA==
X-Forwarded-Encrypted: i=1; AJvYcCXaz0L6yYTU8ekQkRQvykV4GTL2BFaXdTWUcwq8EiZXFTs37usITlW98zSpew2p96O8ttG495+0244=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn/+Fp8JXF6gpoF24igzqqwY9XrA6sxc3vzvEFjxKD50hRXAc9
	R0xvI1zV473WLL/vwO7niWqQSDxyjro9sKXK6bPkhTY4ydjMyTRFFlPSqFxDpeEFdS/odHtbikE
	ZZbo+vH1G8l87lP4BZjKnQPMBsFcN5pmWxGU05mRLjWPaNzPKocNjY3sh6eMeQw==
X-Gm-Gg: ASbGncvDZ7JoU+2lJsRdzcgQ+7aoVoNmWkAPsX96tP3ozJEg0aGpI/FHDfr4aBORksf
	QrjjDGEn045+UD5xeWLEKvz+IUPYxooNgZM7ZX538a8RjIOdmu+Gn/yE+XnFc5ZL0jaryDhodg8
	N3USPuhssdHV7kIJRFEjX1IcXJYTdn9Nd/S+Nif8ixhoz3Eyo8Z5v3ABEqydEO4T5QFQPSy0G73
	yOimnkXsodjFKXjHs1LD/GfMhnxVPYCXsKKKDwZSkwMNP4fPJv3ikWUlyvTPoJ+61BhVrQibLJk
	JcBFcw9usY1IV4MAPlklPR+zRmQcX5/2audAnnTNSl3Asdfl8o1KSu3i+QpXtvlivFeOfi+SHfs
	4XaqAQWkBO+ZTZxOZiup3Cbkz7PH84XZuDFqYLlydepIOyauBNtAFxYR7qmsR
X-Received: by 2002:a5d:5d05:0:b0:427:809:eff5 with SMTP id ffacd0b85a97d-4270809f252mr11795590f8f.53.1761058857378;
        Tue, 21 Oct 2025 08:00:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuNdQq7IEo7xmxPaMqWMcC8QeroaNoRnXCBpBegLE0FB0KNfhJhInOomIlaVikmeTIuzyODg==
X-Received: by 2002:a5d:5d05:0:b0:427:809:eff5 with SMTP id ffacd0b85a97d-4270809f252mr11795534f8f.53.1761058856848;
        Tue, 21 Oct 2025 08:00:56 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f009a78csm20793541f8f.26.2025.10.21.08.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 08:00:56 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
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
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v1 23/23] MAINTAINERS: move memory balloon infrastructure to "MEMORY MANAGEMENT - BALLOON"
Date: Tue, 21 Oct 2025 17:00:40 +0200
Message-ID: <20251021150040.498160-7-david@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021150040.498160-1-david@redhat.com>
References: <20251021125929.377194-1-david@redhat.com>
 <20251021150040.498160-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nowadays, there is nothing virtio-balloon special anymore about these
files, the basic infrastructure is used by multiple memory balloon
drivers.

For now we'll route it through Andrew's tree, maybe in some future it
makes sense to route this through a separate tree.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 MAINTAINERS | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 878e53d0f65ed..17fbf5c1ea2fb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16225,6 +16225,16 @@ T:	quilt git://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new
 F:	mm/
 F:	tools/mm/
 
+MEMORY MANAGEMENT - BALLOON
+M:	Andrew Morton <akpm@linux-foundation.org>
+M:	David Hildenbrand <david@redhat.com>
+L:	linux-mm@kvack.org
+S:	Maintained
+W:	http://www.linux-mm.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
+F:	include/linux/balloon.h
+F:	mm/balloon.c
+
 MEMORY MANAGEMENT - CORE
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	David Hildenbrand <david@redhat.com>
@@ -27062,9 +27072,7 @@ M:	David Hildenbrand <david@redhat.com>
 L:	virtualization@lists.linux.dev
 S:	Maintained
 F:	drivers/virtio/virtio_balloon.c
-F:	include/linux/balloon.h
 F:	include/uapi/linux/virtio_balloon.h
-F:	mm/balloon.c
 
 VIRTIO BLOCK AND SCSI DRIVERS
 M:	"Michael S. Tsirkin" <mst@redhat.com>
-- 
2.51.0

