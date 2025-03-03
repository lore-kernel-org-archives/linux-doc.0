Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D108237705
	for <linux-doc@vger.kernel.org>; Mon,  3 Mar 2025 16:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741019429; cv=none; b=W4/dXL8VrY9Nci+CGY9E8mPgBOk2HG2n3Eo/0pgcB6MCY7ApjrTfKZhkQ5aksDzBlA6rDcod5/6lh7/bd9KsLlu9GLguw5+NWkYuhJhljvVmo7wmx02Y0IlgUSp1C3CBTOaeVoJi6QqLiVxC3ovhkTLWa0vLuq4qDW8Xwg0GopY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741019429; c=relaxed/simple;
	bh=3SmHXztWFIDnuQM+XInecxapotD7TtFOOmhMRtX7whw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RgbkB8060UxBrTysJSN+CrBgpnEGBwVB1gLbVW9nzY0pw3jcuQKkF3Cr7vuInhsVA3HKDAFW8Ha/K0jNuyeoZ0h2357/5GAOdk6YLL+8PT/btpXrmD9YnI1gCK2sL67H25ub2tKaXbgQ+iR1xnPEVpaYyrCng6molYEP5ieaI4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AogmwyZY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AogmwyZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741019426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8IqquS7ke+4+XOv5L24m6qSx7K0PzdfhIUdS/cnqyVA=;
	b=AogmwyZYvjq6B+tjzT0vPPxYQSzjwNV5c2Tok9ZcnIuau+dp7vow2GZ1P9cZYR1lc7Nef0
	KB7XeNPI4VX8NWoa3NywM8xoTKB7VcqggFXA10UmZV2Nf0zD/sN+yXPzVLHgRXKLO6dErH
	DeWv8bO4O/Jij3+oNkFrAe6pN/qOMDw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-Dwty9QYyNemnsqQTf4T2vA-1; Mon, 03 Mar 2025 11:30:20 -0500
X-MC-Unique: Dwty9QYyNemnsqQTf4T2vA-1
X-Mimecast-MFC-AGG-ID: Dwty9QYyNemnsqQTf4T2vA_1741019419
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4388eee7073so24304365e9.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Mar 2025 08:30:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741019419; x=1741624219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8IqquS7ke+4+XOv5L24m6qSx7K0PzdfhIUdS/cnqyVA=;
        b=U601N9lcgFsjJrF348Vnp0avijzXt0ECxbJvi55LcIpA9Psc1crpWCnRSU+SAbSbyj
         ebOLrQHTEYGP3i59nmTgHWyJ4B2rUK/YuMEVOtzMGNPnVrM6Y/X56Ta4JnK5nIyLKckY
         NV3zCTaku97jfIR+YdAmn1dq5yA0Ov4iOfP+F4ZnV2KtvLVDiZRo38d6S3wbAacuQ0kA
         3hw8Tmg6XgpJgKn3MuF1dyLdDUEFTEseKV5Gyh9xGXyad7mEy8/W3IJXTkQ1VrkICuV2
         c3cFtosaTG2fdr2Rhs8aMagz0snBXvSKj+Yz3t4oraF4RbVajzOc8oogBfK1JfbOz1Ov
         1l7g==
X-Gm-Message-State: AOJu0YxrvrGBzq7z1ZowSRoFe4S98hEea7OglInpNV2xI76kMvhlptON
	SaoyoCRzx2DBJbNns5N6Ox2furnRBg7YrzmzhmCLgdAYztAqdW7OWJNtH4dSLEf9VYfTcIt0iqW
	dXokt96wBFKX2AmHfqlVjrf9TGa6e2r+1sLOvm/3tC55WV/eqtLPfxUni2Q==
X-Gm-Gg: ASbGncsOKzWh29Ah5TbFq6oZWKM9w+qMAeGJDW4a1/uCh3tzjnQ5umRZRQNIkhz+tD8
	S0ZgyEurg5gkfHPdcs36SdZ3R7SgaYW7yFFpmfmCuUGKMuNZyNj6X8qzM5vcsfNQebYPwNfh9Jd
	DTYNDI0+W/rhvZO/WFfs3paML5MHrs9gT9GvEki0+SlT2LIqAGeWUEoY6iLEFKXbMMdDHXaiZJ1
	o3VI6FKWQKG7cZpAO0lwVf3dNoHhZhcswj6ZKb88/gZ6Nq7IoCTSSNA7t506vTd7PvU/M4oROHo
	op1MvrMYrGjKPwcHcwLxuFRs2rEyujNd9EM75EChpzULAJX/w2qtvoZrlMsrFgGFd9sprSYilu4
	d
X-Received: by 2002:a05:6000:156e:b0:390:f9d0:5e7 with SMTP id ffacd0b85a97d-390f9d00782mr6547286f8f.13.1741019419255;
        Mon, 03 Mar 2025 08:30:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXzBd/+KVXhEWpKLy7bok4As8+LKdGdnCV2QCwLiXkX4QDGRFFrxDGOYHa7Hz+LJLKECZ5dQ==
X-Received: by 2002:a05:6000:156e:b0:390:f9d0:5e7 with SMTP id ffacd0b85a97d-390f9d00782mr6547256f8f.13.1741019418889;
        Mon, 03 Mar 2025 08:30:18 -0800 (PST)
Received: from localhost (p200300cbc7349600af274326a2162bfb.dip0.t-ipconnect.de. [2003:cb:c734:9600:af27:4326:a216:2bfb])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-390e47a6a5esm15196816f8f.35.2025.03.03.08.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 08:30:18 -0800 (PST)
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
Subject: [PATCH v3 01/20] mm: factor out large folio handling from folio_order() into folio_large_order()
Date: Mon,  3 Mar 2025 17:29:54 +0100
Message-ID: <20250303163014.1128035-2-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250303163014.1128035-1-david@redhat.com>
References: <20250303163014.1128035-1-david@redhat.com>
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
index 7b21b48627b05..b2903bc705997 100644
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

