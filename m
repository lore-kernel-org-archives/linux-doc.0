Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A64F263F52
	for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 16:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740416172; cv=none; b=rgdON/jfpp7e1Zqqg2jGotLTkzTUR1MuEWwxX1pQsVSRzvEWoBxW2D5MZJbIYwzUArqdbLvDXj2Xu7qvv5x0XEI/Zr4LWmlVzh8YO7tk+GkXZggDRQI3GWYLT+7JfqR4FiP62k2zTnjxOtCjKQczsBsDnsE6v+UziuWyw4tjTsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740416172; c=relaxed/simple;
	bh=VmpdZSRRUc/hbRQ4rkKLLuRh8r6J0srT0ICzqEnE21Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ah9xdTstY6B8N14kw2gSlx5yCoQWkgiCO8kd5Tbdut9zjFe8Qby6mTe/xDg4V9Is1YYC5X64PAAAOTRPe2I8QBw1WpCVYVb47UrJo4L+Rmv4OroKZI8QT71QFKGINecdWGpKVsLt2dBeO7xmFAMyqzq1FdrYgrx6/m6agm2oKmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jT2VXVDV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jT2VXVDV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740416170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Yy4w/XZlsv8uxY4mojETBma8CfgELpSYNnd4DKCaPQ=;
	b=jT2VXVDVNp0WrvCETXgM47QZ8N1JeIqSkNhFs1CkuqmWLzLZNbx4GtMVK0YECYI2je3ehX
	Hc1QfgzcnLU4Hf6VI2PxzPQwu0lq2kzDfrModrcnBa+6J6E2kmJ993/+G4FUyErGLA+gsM
	FhbGjMHYwC9oobmcIga1KWlDUzm38yc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-0c1xhfVsN4e09p9s5EF4Rg-1; Mon, 24 Feb 2025 11:56:08 -0500
X-MC-Unique: 0c1xhfVsN4e09p9s5EF4Rg-1
X-Mimecast-MFC-AGG-ID: 0c1xhfVsN4e09p9s5EF4Rg_1740416168
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38f2726c0faso4653884f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 08:56:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740416167; x=1741020967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Yy4w/XZlsv8uxY4mojETBma8CfgELpSYNnd4DKCaPQ=;
        b=OE4zSHX3TpEGFCTOQOd1yqq08U97tG4HDqBpYY5F7wJ1anOFrGQOpPNBqtFMjQ9vg5
         l6fYNVieNnFtH7jdczWUNnD4QxXhmRG5H2Ix3/KaM0VLd7liUxxHJ7+S+KT3OCfbu9A6
         FR82xWUyb7vgFzvHjEFHt+/xB6jzSLHBbHsaiu3UeVANOio3u4jcsnpJAMIo067SgJCi
         vnKvIODonkUfDK+35+B8mASp70kMqksE51wTVsydAJXXdj8aadzGzijeORZJ5VhxU4FR
         xMwWI5cgQlvYKj+5LtpNmRfVx33V4Tfb6oYlh5mBSPsheK/Yc7xX+ZTv/yrXMQ672V1e
         GbXg==
X-Gm-Message-State: AOJu0YymlQsYWrEhzNXCqeSkhU6Tj9QxlYmucxB8Hnvx5tEP+crT+89M
	LxiqrTNQzM0bdL7KWhDTDCnUYe0XpdfRmipl0vDbcusvEjdSltw3ryBNag14UVKVrGUt6bMx1dV
	rQy5VB8prZW+rNjx2Sj3Ws2E34fbaC/a1/do79l9KVORGo4mFN/B1KMvZcQ==
X-Gm-Gg: ASbGncsWsNkutgadbml095lsTH0rijNt5Jk4xOZz+ty4i4EI7FQp1U0gp76XK7aghOt
	II6jqQo2RToY96Ob74lZ/po/dUTJ5/3gshNJTSTF9nIZrxd3y6To28UQGX6FwRpJKG6KOTchZV/
	DOsJuUiRjsAHqVOeT6oi31QVBEYAJy+h1IaMdXeyYIYe5/fNw7gciDU2wUaCPorQ+D3pyG071HV
	kaW5D1njyV7uLlEqlTNGFbDr3qsKQRsuIN5rnQUUnesb9aZV+scAYPpR/sBDN5WT3cvfL5E7FVs
	UH5+DEtdCVeh+6JfWxPtUXdYtJvwGsh9rYW19keLHA==
X-Received: by 2002:a05:6000:1ac7:b0:38f:2a99:b377 with SMTP id ffacd0b85a97d-38f6f0c4523mr13709705f8f.53.1740416167619;
        Mon, 24 Feb 2025 08:56:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrYsCtuTnI9EW4wn4ZrbygGJqAwQI73Wf+OvRO5jakiYr702W8tJwU3BfJXILKECpWzIC3lQ==
X-Received: by 2002:a05:6000:1ac7:b0:38f:2a99:b377 with SMTP id ffacd0b85a97d-38f6f0c4523mr13709656f8f.53.1740416167205;
        Mon, 24 Feb 2025 08:56:07 -0800 (PST)
Received: from localhost (p4ff234b6.dip0.t-ipconnect.de. [79.242.52.182])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f259d5e92sm32611493f8f.66.2025.02.24.08.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 08:56:06 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-api@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Tejun Heo <tj@kernel.org>,
	Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Muchun Song <muchun.song@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Lance Yang <ioworker0@gmail.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Subject: [PATCH v2 01/20] mm: factor out large folio handling from folio_order() into folio_large_order()
Date: Mon, 24 Feb 2025 17:55:43 +0100
Message-ID: <20250224165603.1434404-2-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224165603.1434404-1-david@redhat.com>
References: <20250224165603.1434404-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's factor it out into a simple helper function. This helper will
also come in handy when working with code where we know that our
folio is large.

Maybe in the future we'll have the order readily available for small and
large folios; in that case, folio_large_order() would simply translate to
folio_order().

Reviewed-by: Lance Yang <ioworker0@gmail.com>
Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index d82feabbe44f8..d00214e22a174 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1194,6 +1194,11 @@ struct inode;
 
 extern void prep_compound_page(struct page *page, unsigned int order);
 
+static inline unsigned int folio_large_order(const struct folio *folio)
+{
+	return folio->_flags_1 & 0xff;
+}
+
 /*
  * compound_order() can be called without holding a reference, which means
  * that niceties like page_folio() don't work.  These callers should be
@@ -1207,7 +1212,7 @@ static inline unsigned int compound_order(struct page *page)
 
 	if (!test_bit(PG_head, &folio->flags))
 		return 0;
-	return folio->_flags_1 & 0xff;
+	return folio_large_order(folio);
 }
 
 /**
@@ -1223,7 +1228,7 @@ static inline unsigned int folio_order(const struct folio *folio)
 {
 	if (!folio_test_large(folio))
 		return 0;
-	return folio->_flags_1 & 0xff;
+	return folio_large_order(folio);
 }
 
 #include <linux/huge_mm.h>
@@ -2139,7 +2144,7 @@ static inline long folio_nr_pages(const struct folio *folio)
 #ifdef CONFIG_64BIT
 	return folio->_folio_nr_pages;
 #else
-	return 1L << (folio->_flags_1 & 0xff);
+	return 1L << folio_large_order(folio);
 #endif
 }
 
@@ -2164,7 +2169,7 @@ static inline unsigned long compound_nr(struct page *page)
 #ifdef CONFIG_64BIT
 	return folio->_folio_nr_pages;
 #else
-	return 1L << (folio->_flags_1 & 0xff);
+	return 1L << folio_large_order(folio);
 #endif
 }
 
-- 
2.48.1

