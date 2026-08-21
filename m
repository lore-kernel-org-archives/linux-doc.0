Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310A43E0093
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 18:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338704; cv=none; b=fGoUQJU4Ry4jVK/WGgZIk6zHEUBGVprG3hatibuJvC35N3YjT4IOiInV8/mN7D+DwSST5GRpat8Io0VYITv8Cz3uDM1rpwPmhdXYsXtmkPY0jQUjS4OAtK+RUPAtnDj49ZLJfUvnPckRBmPXSUGkOAJB58zNslIAv/5gfnD7ONg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338704; c=relaxed/simple;
	bh=rkPzVVDgoOEfaKV2nREKbkjAXfc0pbvyd/oIWLflpYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GB2so9m6hjAFUItVKGrT7qoXOnt+d+kmhwcJ5iN8lU8vpd0oVtbFkqeVaDoSwl+gS5XWJlsh7lKw+mdAKAFyV87OuCJcr/UBlHKncsu26ZYIWQW+NMsUHe3K/HAQfMxR9Rn0j1DGMFxM7Yo8o/j61ea8lYb2oai8jqSPBTMev6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qs0L3KOQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rxlCG2kq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qs0L3KOQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rxlCG2kq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787338699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/8joInrEG3wyxgyxVErJ5zORrPbi9GYjPiUJzUhqISA=;
	b=Qs0L3KOQebDIG56XPCr9EkuLNWsfzFz2VfUJAhSPHGykHKGKWRcrHyoYrmUaKil8pD/5c0
	ufbpHP5MOjKoDygKNTS0GdBs7+XpWwuOC32U5rr/1KZaiS0giBV1KF8GQRRU8aqK5NAh9s
	RrXSzbJyHqqSX5m61T05dDRbHN5YY5U=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-IxxTqmAPPZeVji0XZTcfdA-1; Fri, 21 Aug 2026 14:58:17 -0400
X-MC-Unique: IxxTqmAPPZeVji0XZTcfdA-1
X-Mimecast-MFC-AGG-ID: IxxTqmAPPZeVji0XZTcfdA_1787338697
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so9186036d6.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 11:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787338697; x=1787943497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/8joInrEG3wyxgyxVErJ5zORrPbi9GYjPiUJzUhqISA=;
        b=rxlCG2kqriWBMcgab2d3GVQ2Te0Knk3Gk4AHZpf0049aZuDbpX0tXN239B8k7QTrqf
         iUaUtwvyPYN9SDqseT28lrdjCReapuR89ef8EWveh8gf+P4A4HhjwpVuuoI0jfRLcWZH
         rYuCF/eh/pEk+Bh+a3g3VmCdp4cf7wAqOBoNF0Lae4Y765+br/2ZntD1Br8pvineUH82
         Wvk9lHF5TCtAJYcNB6ofA4I/aukQMANFbZ0YKPY/uZ+GKlcwT4TBeJC5B5zzLyDQHF/C
         zB/f72Q1qqGRI5/FZyI2qKM5tb98p4fOoZo2lHutQ+Q3byGFmJJQsD7JSR45gfqRa3CS
         9yJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787338697; x=1787943497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/8joInrEG3wyxgyxVErJ5zORrPbi9GYjPiUJzUhqISA=;
        b=Yu4GiFe2aPa535j4eRoPaUq01SztOk//o4f9TFgdAbrgMjSUh4idMadxYk9jYmIVnt
         4keBL607uEOKrBHdm1w/mqDM8/5a5c6WCYJJNAqqCJjXTUIQNSCdVhqPgsFqKcU0ApCj
         P+hjffKe7HC4nHLYDWKa1U98HAELkIvLWMYd6UPn9Z883fsIvYJ2kXrS9yPApstYYxhb
         YHLmAv+kmWhSBXP/ZuXvvIqMXpMR6sQakHbPF0qDFxHQRNBLRvLzsiUvhsqGZrShYxst
         ZD5Kq8cH6H2oZoD1bSWLs3WRNvH0/Nh9W0lHpZAP+I+MhUeHB1yCn9kdw9O2ef+C+oRd
         R4Iw==
X-Forwarded-Encrypted: i=1; AHgh+RrFKbhJgzaG39oBnd7P3LDOuX83fQQ++PdXPVlHlKwKy6ZOSle2f+RrDNW2MyNSYIyBNr/fxP5m67U=@vger.kernel.org
X-Gm-Message-State: AFuF++lGu69YL4RUzsv6xldnFTnKDMYpPzfelarEKNtxVxKPd5DCC25U
	UJj47llzS7DeTDCBZbkI+ekoqKef+p5DatsawJPx9d3tVrEN2N3BQc8iiFF9DuzSURhT7t7g7Nf
	j/7RZxTmC8/omFMOsTCcM7fOq3JEoGtBRyCrCJaILqCmJCqpXqZDn3SHsTEbZhw==
X-Gm-Gg: AR+sD13Twq+gPCVfu4p/1PUT8Yrg2mne4l00JetgJWJWMokXNxfOf58TbDhd0ODDPqZ
	CWQdAnAmnLipWM8ZYyY7Izy5hZJZL91xJh3hm/YXAAqOoj5JeJ+fHdseYPtwGY0NZXeV0KRUUm7
	HXFsezV2JmV9ME0YouLlW0ApA/Pxs7QtALFPQpzAnHWAqR8+wCZK23ITsW/N69r6ieGrgh8nvhi
	axrGmy2x7BT2xLAcVbvC48mn82mjjtCfWreq/arkBZO05pU0QoFp4/dy6oaUsuDTM/fHJGCYwqn
	ZHJW2df0x9hzAI9Iv+0F7B8z07eafbhB8mbOhYTVYn4wDyTphHUNTeL0qTtMtGlrOe/Uhk/qtJs
	crtyyUn4qOf2fubWcdStmUQ/8Zsb58AvfCw1b4AZzkQpI
X-Received: by 2002:a05:6214:21cb:b0:8f3:cf36:15ca with SMTP id 6a1803df08f44-90c8098e804mr82074656d6.9.1787338697310;
        Fri, 21 Aug 2026 11:58:17 -0700 (PDT)
X-Received: by 2002:a05:6214:21cb:b0:8f3:cf36:15ca with SMTP id 6a1803df08f44-90c8098e804mr82074206d6.9.1787338696872;
        Fri, 21 Aug 2026 11:58:16 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2905d6sm68917236d6.29.2026.08.21.11.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:58:16 -0700 (PDT)
From: Eric Chanudet <echanude@redhat.com>
Date: Fri, 21 Aug 2026 14:57:03 -0400
Subject: [PATCH 11/11] selftests: cgroup: amend vmtest-memcg to run the
 hugetlb cma tests
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-cma-memcg-regions-v1-11-d21b165b8440@redhat.com>
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

Add HUGETLBFS to the selftest configuration. Amend the vmtest script to
pass hugetlb_cma=1G and hugetlb_cma_only=1. In order for hugepages to be
available, ask qemu for 3G of memory so the CMA reservation succeeds.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 tools/testing/selftests/cgroup/config          | 1 +
 tools/testing/selftests/cgroup/vmtest-memcg.sh | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cgroup/config b/tools/testing/selftests/cgroup/config
index c4f7df4f1b24..1c9034017682 100644
--- a/tools/testing/selftests/cgroup/config
+++ b/tools/testing/selftests/cgroup/config
@@ -8,3 +8,4 @@ CONFIG_CMA=y
 CONFIG_DMA_CMA=y
 CONFIG_DMABUF_HEAPS=y
 CONFIG_DMABUF_HEAPS_CMA=y
+CONFIG_HUGETLBFS=y
diff --git a/tools/testing/selftests/cgroup/vmtest-memcg.sh b/tools/testing/selftests/cgroup/vmtest-memcg.sh
index b19b96731784..534a95ef5e07 100755
--- a/tools/testing/selftests/cgroup/vmtest-memcg.sh
+++ b/tools/testing/selftests/cgroup/vmtest-memcg.sh
@@ -116,7 +116,8 @@ vm_start() {
 		--qemu="$(command -v "$QEMU")" \
 		--user root \
 		--ssh "$SSH_GUEST_PORT" \
-		--append "cma=64M" \
+		--memory 3G \
+		--append "cma=64M hugetlb_cma=1G hugetlb_cma_only=1" \
 		--rw &>"$logfile" &
 
 	local vng_pid=$!

-- 
2.53.0

