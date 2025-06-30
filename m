Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D55A292B42
	for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 13:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288490; cv=none; b=Dcjf1rYp7iXOhjzlzT0C57jXb4Q6w6DLWJ5ag2dIvYEjLksCor0Zc1E1zv1Bb/Y1bFeOYqE5T2AvZsBdTIebhT83/ue5FuX+9IgBftsVQCIwv8bsHL1tphKUi4CqLF+ZTirTiksi6G0v9PppbstkYtdcSNPosAETdMmxxihdO+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288490; c=relaxed/simple;
	bh=dmz2lbFNKy/5bI6qe76v2+ePPpX7/2WN9a22IrkHZ0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=euReJXe/Unbv+9WzB0t6pj6cW9L3ULtzG+J+AD0YVMHEIDiAJy53xP/A/lk/Lf85jFv70tPux7Vkkx4lipESgVIqUZx4iVem3RK1Z2xx8LLpuA9DALIescZlpSASQ/Dd4f813Rue4khUp/dZhGv1jfLGRRYG3OefY9W+AvliPdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FN6umq7O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FN6umq7O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751288488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1QasDl39udqF142inQM/Baaw9xGb/E/13xzKchOHRQc=;
	b=FN6umq7OTCoJDyt8+GPOpqKOQbbYnkMISbAVNGwltjin4e0tpGeAFkKOqKVwK06scTVMad
	j/SWTe00Ncu2gPVBimC07f4UCv9LHx/vsEPcQmufnWzhQhSaMEMvgbcNmnxtDRgOQNhV8f
	VjQ8bw86VWdt0lHF0dzDd4Yh08q6KlY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-leqdoKSGM8WvR_bryAIcPw-1; Mon, 30 Jun 2025 09:01:23 -0400
X-MC-Unique: leqdoKSGM8WvR_bryAIcPw-1
X-Mimecast-MFC-AGG-ID: leqdoKSGM8WvR_bryAIcPw_1751288482
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450db029f2aso19626665e9.3
        for <linux-doc@vger.kernel.org>; Mon, 30 Jun 2025 06:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288482; x=1751893282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1QasDl39udqF142inQM/Baaw9xGb/E/13xzKchOHRQc=;
        b=b2oQBAx93BK6olw5Fyj2qX+2JZGL+aHXG2ROklLT1Lq4Nyv5UiS8qWXHi4HtJERf0I
         aLEfCl5iHRmDmmIQK+iGBE4Uxk/hSM+QnY0ex4fL10g8pViNgE/GXrWLEEG3nhSH+KDZ
         nWLCKctGo31EYbL4kS4wffPzilUeaPlhMcuMZOtzlRpoBfQRrx+NYksP+kJfyOXHn4uV
         301/nW5wcbvj0FWTtowJxQKLBjeU+G4XL73ajvsFeuWzBOBwPBVze+u/BhbFJVK9op01
         qsWIukyO3+cNgwHIL/obqH8IY2eB3JaV367FqtGXr5gV6+ZuxvCFIIPjk5xUFONPgf3Y
         a2Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVcAKSVsqVytHg8pDhcWOe71B7FvlUEIVT1P3fVCMCzQEUEcdxb5WgFzh6Qx6mA6gO4DLHf1MJDPJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU907Ov1UMi4/cLzdK06ohv22p3WzYqRUzUlDoaw43Z9scr180
	Rb6SrnXZTFLmnXE7HW8Y1TPRWYXDJMweHlBrqJX3i4oeyIP8dr3ouILsLSIvgV0zfoK86oz7mmd
	RB570doASofap04+ucBg2Uka9GcrDHNVUfLo35OTg+kbmX7FgfoAo1hYAVpG3uw==
X-Gm-Gg: ASbGncsGbQCY/Kc7NX6BpQ4C7fifpEdI1/gbHcoRMo6BUweBiLdgitAmXbOVYIORiw9
	9aa+uQO544lIvsDP5X7bNvebCJVFHDn+2idkZJ9/hbHBnNVryHQajPz1QsPAAOOLt9AMLWWlveN
	odZBfv8nLc9J0mbciQYqQ6aU8gBPh35ngAFN/E2IwgKaPVlk7T0fduF8c/DCKJsDJ48ntPwnIvm
	jkgoGcBeoafXR6uMWyj6ZIlg9EElSSoSPGRjM0PoCH35UzUekUzF9AyAy46PeycxoTojsfvu4kg
	r469p5ziQ04db/7VSciL3TxjwhZWIwd5N+Qa0ON1Gu/ZV6no+E5HVYlB80gI377I+70l0vbCpSg
	ZPBJ3cbk=
X-Received: by 2002:a05:600c:8b6f:b0:43c:fe15:41dd with SMTP id 5b1f17b1804b1-4538f9b3107mr110835305e9.6.1751288481860;
        Mon, 30 Jun 2025 06:01:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBR/gPcUn8RUWOgibmcJHz2SRyFZ4ktYe9xvVAqHy7XBBioQHhn6lWeSN3C2mJi+xEdsRK1w==
X-Received: by 2002:a05:600c:8b6f:b0:43c:fe15:41dd with SMTP id 5b1f17b1804b1-4538f9b3107mr110833985e9.6.1751288480607;
        Mon, 30 Jun 2025 06:01:20 -0700 (PDT)
Received: from localhost (p200300d82f40b30053f7d260aff47256.dip0.t-ipconnect.de. [2003:d8:2f40:b300:53f7:d260:aff4:7256])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453823ad0fesm169286405e9.25.2025.06.30.06.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:01:20 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: [PATCH v1 23/29] mm/page-alloc: remove PageMappingFlags()
Date: Mon, 30 Jun 2025 15:00:04 +0200
Message-ID: <20250630130011.330477-24-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630130011.330477-1-david@redhat.com>
References: <20250630130011.330477-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We can now simply check for PageAnon() and remove PageMappingFlags().

... and while at it, use the folio instead and operate on
folio->mapping.

Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/page-flags.h | 5 -----
 mm/page_alloc.c            | 7 +++----
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index abed972e902e1..f539bd5e14200 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -723,11 +723,6 @@ static __always_inline bool folio_mapping_flags(const struct folio *folio)
 	return ((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS) != 0;
 }
 
-static __always_inline bool PageMappingFlags(const struct page *page)
-{
-	return ((unsigned long)page->mapping & PAGE_MAPPING_FLAGS) != 0;
-}
-
 static __always_inline bool folio_test_anon(const struct folio *folio)
 {
 	return ((unsigned long)folio->mapping & PAGE_MAPPING_ANON) != 0;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index a134b9fa9520e..a0ebcc5f54bb2 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1375,10 +1375,9 @@ __always_inline bool free_pages_prepare(struct page *page,
 			(page + i)->flags &= ~PAGE_FLAGS_CHECK_AT_PREP;
 		}
 	}
-	if (PageMappingFlags(page)) {
-		if (PageAnon(page))
-			mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
-		page->mapping = NULL;
+	if (folio_test_anon(folio)) {
+		mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
+		folio->mapping = NULL;
 	}
 	if (unlikely(page_has_type(page)))
 		page->page_type = UINT_MAX;
-- 
2.49.0

