Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F423E0258
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 18:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338684; cv=none; b=BEvZ3Dvp81Lu8sOU5f0gK5x0vWvxtGNKI8EtLu0/wMYbhsKsUwFT4yNKOT6WcoD2ngFpGUY44zFJcFpm55EO4s8X2xvEGTTgOBxXaLB/Ubozjp+MKudJHrY1XLWIbet1GfAz7MWOrhNhFNnvBouubZnBeKlt34ri23NJws9N8uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338684; c=relaxed/simple;
	bh=zN4YwsmDvSboy8SYR2KDjDfnHBrzsib8W3G8GkLnsrU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XrqtSaI/QCyjp2wblnY1zufuqqm0SDVVphpdcBkQ+1BO74kNYLcS+0HQwR4ro2myqpREYM5NbbkVvHxoKfndzTschGdwGtab2ubJ6New1ucH5RnybUyE+dpzUf4xjTkvhCpDYXs0hKXV1HfXK1YmrbmgKiq0oXIV6YuFSkiot7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iABLkzyZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UDqmU3tc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iABLkzyZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UDqmU3tc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787338680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cQingZcA8JY9invl4rfVqQH3WLMP3iU/vTSgNWsiPjc=;
	b=iABLkzyZhmWpHQtQoGlcpEqnHmrnRA2/OruaJEi+XKi1i4U+HHjeu5ZM8j4aQwl8ZeCu6M
	YU3QQYC1iRzYye3scvYa8PSa5OUl1hnKMG/xQH3erBOclpdkWvKCz+npdZAgeTQ0k2mML8
	vtPTWtEDqNdSdbhykb12PlXujuPOogE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-CNlLn6JXPOCll-J55a_ing-1; Fri, 21 Aug 2026 14:57:53 -0400
X-MC-Unique: CNlLn6JXPOCll-J55a_ing-1
X-Mimecast-MFC-AGG-ID: CNlLn6JXPOCll-J55a_ing_1787338672
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9077b4c35c5so25622726d6.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 11:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787338672; x=1787943472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQingZcA8JY9invl4rfVqQH3WLMP3iU/vTSgNWsiPjc=;
        b=UDqmU3tcJpZtpwfjZKqEFCQi/5+ZVaE3mtudf8tbck29CC21rTcHwt7q/VL45p7JDn
         FmWvd+E3k7OunbMvSP8nrogF9at02YHUeV9QddnvAIIuREGa82UuOWBVt6Zi2Mi5OPTj
         uTVMcqEPBWAWfgwTqPpobqelkOMrnxTko2y+j3GMxtYD5HnZtwjdpYZCLW+Ws0QqRdBo
         ICYKDpycMQ+fBm7Vvixva83uDSc8vTJi8VgfrMEXCC5KhnK4CJrqLqdWqGY79Oe3d7bC
         q/EzRKKmqiMmGvJ5dx4ROuUVC/u3gdC9GxgECuCLZkXtIQfnrnKBsK4CcvJErs92MNZv
         0IGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787338672; x=1787943472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cQingZcA8JY9invl4rfVqQH3WLMP3iU/vTSgNWsiPjc=;
        b=oJxAIB72kJqsW6FrI2G6+UIoVa4tYm9g18fJ+l2HamCyniRjsGEGqzPDDR9SlmWB5b
         TXiMBWlXxYsiHUkPUKSVx2ZV2xEJYRFctdHuOmJ7QlWHp8GK0LvPmzJZIUxqkIAmwasl
         IL0cAFVs4ACeyWVQbKUVc9GRzhKA2fVfOge17qXz7IFoY778VOmoHyBayPeoVmubr6sh
         +2a3/Z3zN92zhDN8YdxOXneKem+CwREiZXyd/bzp5+xMdEhPKKEPIJok2gV3VprG0yWJ
         MHje8rtY7eMF48odyRxV0nTjg+LFNSjU6oFTlwUvSP91AKR0gcF5WaboH+ORSMMNwb+J
         6csg==
X-Forwarded-Encrypted: i=1; AHgh+RqQe9n+jQupIhJ7C28J6DHeo+o8ksqzqlyqYuPRAqGfIVL0a1T+EJH78Yts9U8Qa8keTntDlX0fFQ0=@vger.kernel.org
X-Gm-Message-State: AFuF++nB1xRMPdcDeU2QZi6SDvafnGcITumffB4zo97BE9isiKwP0sI1
	x6qBv1EGkY9V5dMpPFTQy1MSoK92A9mqGzB3wOlbeNKPKtaNbPoV25se1bBieSq78draJG34+GE
	8k6z1YbnlSn3pD/D/zZCRywetd/pjt7FIS7bHaD3/1wcNkCGDHr+XGhhdHhttCQ==
X-Gm-Gg: AR+sD115Zdj+lMnHm3m8XH8qBUIYqSKPZ85vjNxWmxKr3sCDopVhSHhSGfElMoUs7rR
	T0OlW6ZsvcrL/MBl1zN08R8wHs/I6KX6rVfeqFZgGxajPcDXZ5fFPMn59HnLWLWFIoDwYfBU1z6
	ZTIewk9GMWfhECq72VoQb02DlLN2NGCjoib8S1eAg9BcL/JabzThJ/vF9TvzCupbOrqGoL6TggU
	ovQ2I/uQoMjVf2Kr7mqMGdeDCvRBFBUnSxikZgQb+BbVv9zfme6x9sEWfLqhqap1QmvHeCN+X3N
	jMQL4B19QrPzib5FyLn3h1PpHPIywjsSqW/G9NxaB/b/KoQe2y12ryS7ckSAX6QILa6Ha+aMLFA
	kJXVrH1xphN7S77v1WenrtFHMWml/E1vSnt7GTJOGuAZa
X-Received: by 2002:ae9:f115:0:b0:937:26c3:747f with SMTP id af79cd13be357-937468baea7mr97627485a.15.1787338672389;
        Fri, 21 Aug 2026 11:57:52 -0700 (PDT)
X-Received: by 2002:ae9:f115:0:b0:937:26c3:747f with SMTP id af79cd13be357-937468baea7mr97623985a.15.1787338671990;
        Fri, 21 Aug 2026 11:57:51 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-937205998ddsm651971585a.44.2026.08.21.11.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:57:50 -0700 (PDT)
From: Eric Chanudet <echanude@redhat.com>
Date: Fri, 21 Aug 2026 14:56:53 -0400
Subject: [PATCH 01/11] mm/cma: drop const for struct page on release API
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-cma-memcg-regions-v1-1-d21b165b8440@redhat.com>
References: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
In-Reply-To: <20260821-cma-memcg-regions-v1-0-d21b165b8440@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Tejun Heo <tj@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Maxime Ripard <mripard@redhat.com>, 
 Albert Esteve <aesteve@redhat.com>, Eric Chanudet <echanude@redhat.com>
X-Mailer: b4 0.14.3

The const is not honored. Both cma_release and cma_release_frozen do a
struct page -> pfn -> struct page round-trip to convert the const struct
page pointer to struct page and modify it:
cma_release calls put_page_testzero() directly, which modifies the page;
cma_release_frozen calls free_contig_frozen_range(pfn),
__free_contig_frozen_range, then __free_contig_range_common which
modifies the page as well.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 include/linux/cma.h | 4 ++--
 mm/cma.c            | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/cma.h b/include/linux/cma.h
index 8555d38a97b1..16e2136421b7 100644
--- a/include/linux/cma.h
+++ b/include/linux/cma.h
@@ -49,12 +49,12 @@ extern int cma_init_reserved_mem(phys_addr_t base, phys_addr_t size,
 					struct cma **res_cma);
 extern struct page *cma_alloc(struct cma *cma, unsigned long count, unsigned int align,
 			      bool no_warn);
-extern bool cma_release(struct cma *cma, const struct page *pages, unsigned long count);
+extern bool cma_release(struct cma *cma, struct page *pages, unsigned long count);
 
 struct page *cma_alloc_frozen(struct cma *cma, unsigned long count,
 		unsigned int align, bool no_warn);
 struct page *cma_alloc_frozen_compound(struct cma *cma, unsigned int order);
-bool cma_release_frozen(struct cma *cma, const struct page *pages,
+bool cma_release_frozen(struct cma *cma, struct page *pages,
 		unsigned long count);
 
 extern int cma_for_each_area(int (*it)(struct cma *cma, void *data), void *data);
diff --git a/mm/cma.c b/mm/cma.c
index a13ce4999b39..e1820fb451e4 100644
--- a/mm/cma.c
+++ b/mm/cma.c
@@ -992,7 +992,7 @@ static struct cma_memrange *find_cma_memrange(struct cma *cma,
 }
 
 static void __cma_release_frozen(struct cma *cma, struct cma_memrange *cmr,
-		const struct page *pages, unsigned long count)
+		struct page *pages, unsigned long count)
 {
 	unsigned long pfn = page_to_pfn(pages);
 
@@ -1014,7 +1014,7 @@ static void __cma_release_frozen(struct cma *cma, struct cma_memrange *cmr,
  * It returns false when provided pages do not belong to contiguous area and
  * true otherwise.
  */
-bool cma_release(struct cma *cma, const struct page *pages,
+bool cma_release(struct cma *cma, struct page *pages,
 		 unsigned long count)
 {
 	struct cma_memrange *cmr;
@@ -1037,7 +1037,7 @@ bool cma_release(struct cma *cma, const struct page *pages,
 }
 EXPORT_SYMBOL_GPL(cma_release);
 
-bool cma_release_frozen(struct cma *cma, const struct page *pages,
+bool cma_release_frozen(struct cma *cma, struct page *pages,
 		unsigned long count)
 {
 	struct cma_memrange *cmr;

-- 
2.53.0

