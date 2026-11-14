Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640250;
	b=sCVjIWN3pBy78LqDGL913e0eOfsjmDOUHRZnCFNRlzD+msraDg9aVoWtpFIUL16nCxmO
	 LxrldEcR8ODnWLJNZhAOheA62N30jUdTiFdrKcnwayD031mJBfb5PorpruGV/b64taOxp
	 6mMElQeV7xFf1UwrGtw9gpG7E0dgdeQcsJfOjJiNb3H4Uz3t0lYkMq9gPl+hEu9+BebER
	 awVl2fbhvtk4lnlmAXq8oBucZZh0TfPdXdS/iV/2y/xenH509nr5cI9LXPlCfnZLqsrrJ
	 kPb0DXohobzZZNoGMQOMaA4iH+DHN2lM+Qv+jmaM+j5yC8HKcETjp1Z2BgPmfM/YJBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SG9odMntLujN1bfv7U8SkJUk66Dld0t8e7Q+mOyqXTQ=;
	b=XLA39r4wc2getxzJKVf7aMwn4kx3ilsbBx/OVEbvDmNU1m3FzyX8/8RynaXwoNH1B1nv
	 AWW1cCIr7DUNfxrBv7je8EExLQwKQraFdRRJf+Kew6ygi43eVVl8GO2UIXJ4lgRJx65Cs
	 NX3/y4yj5sYuirMsQJ89bPGESIEKfs+mio5U+xCyG1nyzxA4aDzPG406QEPJydDFjJD3n
	 g5FEH+FwqIi/Jlo17hIFZgAxqtNgA0kyNqKWbEZ5uwvpMeFmSIDROyikrKOr2gOagi76L
	 i0ZJl3qzsZeEMauh4BRcGZwlEqVV/v+ahlw1JL/ZjlaeOof0uVhqW+pI9lzY/CtF22Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=nUe3qafv;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7429606CD99
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 07:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7429606CD99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=nUe3qafv
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91ecbdf5343so39952986d6.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 23:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640249; x=1795245049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SG9odMntLujN1bfv7U8SkJUk66Dld0t8e7Q+mOyqXTQ=;
        b=nUe3qafv9syivid2So3rSgvuH7DZPXQ+C2hNnSKPxSgCSgNstQOq5ZauJDPuC8EzGe
         EPc3rvJ8i7VX8Vx4z3rdkuz4b5/v9ZapBbQpvdki/go/ijbQrxbYSU1NDWob3cDW97LD
         LnMvjnQ9of22Wo+EjgkaA7b+zyM2DJPnxYp2a89EeFLotBMzHlXVjFeFCTHrKTeY5NcQ
         91ghXJtB51aOfQmHtaFyRmryRQlu5a3ABAK7+f8sC33jgP5MHGfXKYht3G8gkN0Q90UI
         KipjlM6Ftuf2DaQAouZwIsVVWwkNGIDa3kAx+zcyykQArICxW/XrYq3vejy92XQ0eKEp
         S3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640249; x=1795245049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SG9odMntLujN1bfv7U8SkJUk66Dld0t8e7Q+mOyqXTQ=;
        b=wPAJoXRjGiQbqgA7q7d5JUfQBkir/TKk7OeZYBxAuUSOQZ4BFIRieSCtBCmkr3Z/Cn
         w7mjWKLDR29URKtZ6COve+8/BgffU4+3A+Ly/Od0cARfq0/6Du48A9QZPlq4u9arSwkO
         StcPdr9hjHHVBBtdVvEqLEg051mhnc8zXMZ3V/1G1WzgMVF6d3xPB7Ijv0hxuiOIvCtT
         e+mfh/GPzG7vn8uAWvsmGnFaHOPKyosHLo0IqKRlyKumaqKWjfeLp1xStpyy9f5DsLqw
         Rt2OIYLu1NmJuoGejKpkdPW2UNfiQKgFxKX/tDIC8IZGKRuRjbxXRT9P10KtR+Hbl+Hf
         IpPA==
X-Forwarded-Encrypted: i=1; AL+hErHMEAq9R7dLswV/AaECC+CvSjlqyLeVdxBxOWnlV+CrpbkffIV3Dvxi//sH+3V8pEaJXzN4cjXSP/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yjPvVioPdGM5OOjFcV37AhRJNvAtAfn9Trl/Ox+W4mdy9PWzG
	JqQ4sarjhTXmBFK/LZKbCao69kGRDZd+E+/kC+WjcyoWhTU9hdIC8U8wmt6I55JoLXM=
X-Gm-Gg: AYBFou16opUisJn+3g1Oj0Zq8d3WmOXK2aN+cmz+0+8BD+4D4P1CsthGHRA8duAx4xD
	Gg+yASM0OA0c3y6vjDHEaWbjvv1mIlf83piqBfe8/y0voQj58WFZsTprKgzxLGkC8Gc4TNVsoDl
	KTE4xx4RhrSIR0dGW/0LR5gY8jkwBJulsrGE9W1++ukSconqM8OfidRJWhHYiXBtenlp/5rlBaG
	oz+fB+wlsAN4PhjRBvMWB3qjeSeEgLR9GdltTq1QvFHkCV90N143VKmyIGuBoo9QUsp9xrLkyQK
	Ot7cRN0m1eKEUZCuZ6QFmch13TZR4lxEzONyTUH+8+B41YkiNtz3KsUD68q4OvbT6rUZQoEgUi9
	sPaet6K8K6XTYf0/avjkO3diwO3S+M6MNWwaAPOSJnunOXQj1Jzmjd2wuQqVucOaawF+YIaPZgY
	EZr64MpaKpCO9Rt4awpOwJwh0qG4/9MewXKE40NDfmuVYfzCbxHMBGw0ivFttZxRx8DMtYMqj9N
	VijC3MvPPWIRfbWj/NfrJFj1VZXDC7sbor2OyQZf+/xj6cZz6/oTqxmf7mD3Bj9e4RRBIVwTH4E
	zqeDllPIBLOx3/rscP03Ej7kMjXi4a4dpQf65yKMJu0UrYgpteUrR91CW3SVF2bOSGBPKid+hYR
	Gf2xwgcUIj8WqABTb
X-Received: by 2002:ad4:574d:0:b0:91c:913:462c with SMTP id 6a1803df08f44-91f23f211e7mr73834306d6.0.1794640248788;
        Fri, 13 Nov 2026 23:10:48 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:48 -0800 (PST)
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
Subject: [PATCH 21/22] mm/khugepaged: base the recommended min_free_kbytes on common memory
Date: Sat, 14 Nov 2026 02:09:58 -0500
Message-ID: <20261114070959.3490008-22-gourry@gourry.net>
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

set_recommended_min_free_kbytes() reserves two pageblocks per populated
zone to help THP allocations avoid fragmentation. The reserve serves
ordinary allocations, which use only common memory, so count only the
zones on N_MEMORY_COMMON nodes.

Every node with memory is common, so the recommendation is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/khugepaged.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index b4bd29f25c145..fac314b89a234 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -3149,7 +3149,7 @@ void set_recommended_min_free_kbytes(void)
 		goto update_wmarks;
 	}
 
-	for_each_populated_zone(zone) {
+	for_each_populated_zone_state(zone, N_MEMORY_COMMON) {
 		/*
 		 * We don't need to worry about fragmentation of
 		 * ZONE_MOVABLE since it only has movable pages.
-- 
2.53.1-Meta

