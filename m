Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA371DE880
	for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 11:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738151678; cv=none; b=Ln9OPIKx2nZoskxpzHM39F8nnjfUCEU1pyK6LbLWsM74xA1hhItAqWBduLnfz6r4+ofKh66rURxKjGqB3I7lpFszRFpaDa/rZHgK8noEUaFABvfnOWl0/KKmhMzP604SdHFFYyjksXiMwT4NHlAfHOZaL7YP6s6+6rzTzi0s/S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738151678; c=relaxed/simple;
	bh=QeZqoAVJcsJt2vivLq7R8JTlFiXhijsLw+UaLook7wY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DBdmCt7EIvnE16cSgm+FGpR8aG6Wq6QLPKSKoNXRHdGJVDwINMg+JlO3pqwezDrt4Z6nXA+2xQU7w9/Jwvu1S+S/uam+OC+zuwlp+9SUoN3BgHufwaA1XMQxad4SUY+8n2mUlBQZwwpkZSgFKtsApZo6JPp4dct9YWkht/ugJvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FaU4Y73n; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FaU4Y73n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738151676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SXa0V5qonctJf7EFSiCmTQng5dHGkyNA7f/zw6SOSBk=;
	b=FaU4Y73nHwhJUv5oxG/hEg25zcWBirtuEctnpAEhaR/X8ZZ+PaIr1rYYP6gN9ZByTnvNK2
	CuUWKYnLAcEKBSN/A86y4WRAujAN77NkOKngKYv/lQECBv+NkHaYSWn1B6L0D/vLQTDi8T
	eChfjz8L1xTj8saP1xo3oEf/+ESsyng=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-G0HPE53ZPLeBlbDd8hTtFw-1; Wed, 29 Jan 2025 06:54:35 -0500
X-MC-Unique: G0HPE53ZPLeBlbDd8hTtFw-1
X-Mimecast-MFC-AGG-ID: G0HPE53ZPLeBlbDd8hTtFw
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4361ecebc5bso34372095e9.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 03:54:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738151674; x=1738756474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXa0V5qonctJf7EFSiCmTQng5dHGkyNA7f/zw6SOSBk=;
        b=ia2uNQ2uMazKEn31WetfO3nPW2LISiK+3dVehM0iJSaTzwqjqrz9XL6ZOA6DMoSW39
         UFfoOTgle1tE1R6TMXFDgOA5IWB9E/E/9+7LRqzkU/xY/S3wcrl12XnV1vOV6Sz6ImTr
         kX4o/DHmaMIdntCdm80pTOPiMuslmsx+jCQrLOXwXTGEXAcYDr60+IEY+jfXPynD6zAX
         HzguN49qqz+O4+YdaWn3pH1f9j8shg8NeL6aRz7mpUweTcL2ylm7AlL8zcGHoxYKzbrC
         LpOj7iIqae1imTQxIDIWGxmRWUSKcAKjCoMunokThdFXetHTBpq5JfpiPFfpl925GS9P
         dK+g==
X-Gm-Message-State: AOJu0YwXW+ylkmwSPiWbEOlKmWOK0NVN8l0CifOvnOB0YMOxqfOzMS4Q
	RSr6Hf4BGT8i3x2Bcm/yRPUdsq86tkrVw/3RCOLooc0zUVhw/0evd+4NucT4hx8HJwHEKOj85m7
	fjJzmzZvv6JbNmsW8jJMJDLAMkQRNBrsCZ+HnlWtq7ft9K5cjPA9d+OZYBw==
X-Gm-Gg: ASbGnctImfKyFBvY9G30BjBm8Y5pq5QqJzz+DL9vKijkL2muEyeJWAQ1ZvPoMBpgnP3
	NqIF+bIHtQKuGYJABvAqmALhlC58ufqQT8w8OG60jHIMrMurd9JdtGpon8/N1rIuqMz21873fGm
	vAkzeX/XsSrQ1DXCIRmiCvnsjjVXNyAeQ2SiUAh0q9L9ZVu381DzQ8EcfDhkiiGBFv5btPddghM
	h8Zeu/VJB2sChXHeLvVyhc+lTllr2mtqeJtCMTNfea3aEjJlwkODU0wsi9ETXBXMGBf7oJTSDQ2
	sExVtwEHvX7EDPwOM67yqmRxwLyU3gLzT4RIwd1w3eAWfmXxYtPhLKFjnXSAOVn7Pg==
X-Received: by 2002:a5d:61cd:0:b0:385:f7ef:a57f with SMTP id ffacd0b85a97d-38c519744d5mr2113617f8f.27.1738151674157;
        Wed, 29 Jan 2025 03:54:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYVCfHEVHB5xz9x9tgAenDwJY8DuXR9neg40xsYB0gvwDn7frPxCs2ZGd0+jvQzBFPN5gg9A==
X-Received: by 2002:a5d:61cd:0:b0:385:f7ef:a57f with SMTP id ffacd0b85a97d-38c519744d5mr2113590f8f.27.1738151673837;
        Wed, 29 Jan 2025 03:54:33 -0800 (PST)
Received: from localhost (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de. [2003:cb:c705:3b00:64b8:6719:5794:bf13])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c2a1bb040sm16943248f8f.67.2025.01.29.03.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 03:54:32 -0800 (PST)
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
Subject: [PATCH v1 07/12] mm/page_vma_mapped: device-private entries are not migration entries
Date: Wed, 29 Jan 2025 12:54:05 +0100
Message-ID: <20250129115411.2077152-8-david@redhat.com>
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

It's unclear why they would be considered migration entries; they are
not.

Likely we'll never really trigger that case in practice, because
migration (including folio split) of a folio that has device-private
entries is never started, as we would detect "additional references":
device-private entries adjust the mapcount, but not the refcount.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_vma_mapped.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index 81839a9e74f1..32679be22d30 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -111,8 +111,7 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
 			return false;
 		entry = pte_to_swp_entry(ptent);
 
-		if (!is_migration_entry(entry) &&
-		    !is_device_exclusive_entry(entry))
+		if (!is_migration_entry(entry))
 			return false;
 
 		pfn = swp_offset_pfn(entry);
-- 
2.48.1

