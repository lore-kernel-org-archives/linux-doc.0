Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640229;
	b=BKJnQiXHon8l3d4GlHvFnDXDKNU8fK99c1920j0Fk40yR/hlWUbxV46d54M1SnMOhv21
	 0DocyQGWDEnwjFAek+lXeQmcdbhSclYRVdAoKS0DpyqJwjPyj1qVc0mJWzHsMG58laEJS
	 6GV2ast6nhKTuNzEbXDU1oycNreVkgPZK4H34jcBgkqBUo7DU2WE52oydBtl/7d/W9vzo
	 kyQfl7cXYKA18y4h+K8fHBXN3E+hdilfd4eEAxKI81rdWB/XJ1h6g/V2qHh7MJbSr2Yvy
	 EHxLZRw2TtO+4ouEQ6Uq4XtSVuA0AD9t0cWiM/T8T7JFZDWcNgkxRM5QKFwe/bPjatw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ug/CLwAsG6XPyYIr9OCoTcVisBprjwnxP+sIccpst3I=;
	b=I96+1elCFu4o7CazL7Ayzbozv7gHcHctQJFq8mvBeSY1ZwMp0aZBbfXTLW5dDY84mTNL
	 9Du/4U9i/ghyUbjOhVIfyUgA1P3mJg+RR7QWysADYbAou9Wq3iz5ubINbbzADHhw2cH5B
	 ebyjhZLil3Lsfo50h84nh/oriJptK3Me65dBuoGJZn0bpRHiuo1C6aCiWfzFVO+8WEMaW
	 7A4zt+LZUW7IjLzEXDl09a4bwOvGcwXdFqvaFR9Er0L5JwDy29KM221VBbko0FT47a3UO
	 5QP3P5Aix+2I5ZkVd6tu+GjR4+pPoGGnipWHAXSebTZmjBw7H7BLcfl7woZX44cX84Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=e0f1NE1E;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA0F60A6F46
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 07:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DA0F60A6F46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=e0f1NE1E
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91f2b826fe9so19623096d6.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 23:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640227; x=1795245027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ug/CLwAsG6XPyYIr9OCoTcVisBprjwnxP+sIccpst3I=;
        b=e0f1NE1Exmdl9VHCTyMwen0H8NFFA5ewM0qJqz9IIPFvpUDfghWuuQsLrxK1SzRsz7
         hUQ5k4c56+KPd+CCYf2/vIqRWl8gHz2BKZUrM5Ij4T2/PSEWok0NnE0FUoNCiSoWO8Mq
         GMGUsUR317UBvVBakiAaXs2gi4djBungqVsPEPVmsCYYKAXaOtbrEV2mN7H/GYUItFZG
         FKQhip0+198HqCVpa7oWo0gCnkVC8uPd0d1wG9uCGO/6pyKs254gzQjdaZ9eM/glICrr
         l+E2ixDmEv243sGYSgL1CoNQGZsrUgbQgXYKwaNyBH+knN+wWZHgnaTTI9p959iurBvU
         zUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640227; x=1795245027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ug/CLwAsG6XPyYIr9OCoTcVisBprjwnxP+sIccpst3I=;
        b=cLU5sTUOap+6+EkNO9Ir/tKzvJBPgfHg4zSUdXbLOAWpJeTsAFKRzCIZVdixU0tga8
         mElVxq2qVVxL9/4y880hbfacm1M/oahMXUlwyla3BkjuecACXuI8XR/UbuZoGERJVP5I
         Zuq0WDNTBOHng53nG0TcUKT89eFQKAuOc3g5ds399cjZwvw994jgqpSKCt+T9a/TcDCW
         DKr1pfCHMqkIFresAsKajCAAhJW7+MKQIoC83TN16DbRY8UC8HFaY3EKnJJ37X+lsGg1
         j8NnQuzpeFQkONbLYyjmCxW9IHg5kGLTxOIr6E8PzYYIyXU2jpu0m0PA9weIez15zaw3
         kFNg==
X-Forwarded-Encrypted: i=1; AL+hErFy1OuGSwAAnLVUnSaOK+z5UwPbSuLZ2xhpgyDgXBQd0eUqjZwo4L2ZqJADvbkibYf3WWbLhYRPSnY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vybebRd/aySlBmXkfU9OvMe0C97TxLj5azYxl6s7qetN3D65Q
	49+klwA5clPOqGFJsnG/mmxT+ITvjCaBsxMI52tYRPfI2CE4AbpyhcPvOElnvxY03DM=
X-Gm-Gg: AYBFou1AqrwRAhlb2TYVmQhbGHlHVpsz0alDfw6Ll/fe536xFl6dWIc2JXX5barl3k3
	VsGk7yUOwNiF5NpW/1Z24qrlrSeIOXkpU5sFHzQk+9XCb+R8gbEhIln9pvp4pFcXEL7n0TLurhv
	8QQsqIfZnQLkEBS7obtc+dpLvc2AZY/cuAwJenyU75c3J78K//o+Jjh4eYmvjtfL2z1aTRaiZxb
	qZh/c2hMmq2vfTJiX3EhZBDTjktdeughK9+odk5n7sIG4EA7wkq5Tn+8YsbNpg2SQaW908R3dFI
	YD9vye7Yp4hGb6GRBFnlSrLD2SPcju1DKc0wmKlKiui8DGUaN3Z6XiPNVyyAC5h3FAMLpQEYU0l
	FZ9bxeBndtd3KoCmRhgP303HK4LUFB4TeiAWiJFIeT3hXaQlUlrMCjWssEaw9R+K0RIVhmsn3wH
	GP+DIFkVX4QGcg/GNPaSWEJCm0cF+xqpgGtPLMQIhMT/RteFaRKrQ7yyBh2aaeBW7bJf8MA8YeJ
	MvZzIpr3olhnTXQ0pDE5WE/TxLhPpzwgqxyguDNqDiDmerv8NylcL1Azv/NamD2f/XEzlyYyaUQ
	zbEfOeBoJ/N3IiyBxF8BefMRylHGujlK25hRk6S0UsOZUc8dMTHDRlFqy2b8pqEOkBa2Xr9aYdA
	Ux7nC2QGML+dNPE4=
X-Received: by 2002:a05:6214:dc1:b0:91f:1bc7:b779 with SMTP id 6a1803df08f44-91f24251f4dmr78714166d6.56.1794640227399;
        Fri, 13 Nov 2026 23:10:27 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:27 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-serial@vger.kernel.org,
	linux-pm@vger.kernel.org,
	damon@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	johan@kernel.org,
	jirislaby@kernel.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	pavel@kernel.org,
	lenb@kernel.org,
	hannes@cmpxchg.org,
	brendan.jackman@linux.dev,
	ziy@nvidia.com,
	sj@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	xu.xin@linux.dev,
	chengming.zhou@linux.dev,
	gourry@gourry.net,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	matthew.brost@intel.com,
	byungchul@sk.com,
	apopple@nvidia.com,
	rientjes@google.com
Subject: [PATCH 11/22] mm/mempolicy: don't NUMA-hint folios outside common memory
Date: Sat, 14 Nov 2026 02:09:48 -0500
Message-ID: <20261114070959.3490008-12-gourry@gourry.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114070959.3490008-1-gourry@gourry.net>
References: <20261114070959.3490008-1-gourry@gourry.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NUMA balancing scanner installs PROT_NONE only on folios that
balancing may migrate.

folio_can_map_prot_numa() already skips ZONE_DEVICE folios. Skip folios
outside the common memory pool (N_MEMORY_COMMON) as well. Do not inject
hint faults on those folios or migrate them.

Convert the zone_device check to a common memory check (which includes
the zone device check explicitly).

All memory is common at this point, so behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/mempolicy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 662ab420fe03c..619970f0eb954 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -863,7 +863,7 @@ bool folio_can_map_prot_numa(struct folio *folio, struct vm_area_struct *vma,
 {
 	int nid;
 
-	if (!folio || folio_is_zone_device(folio) || folio_test_ksm(folio))
+	if (!folio || !folio_is_common_memory(folio) || folio_test_ksm(folio))
 		return false;
 
 	/* Also skip shared copy-on-write folios */
-- 
2.53.1-Meta

