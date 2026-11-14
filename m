Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640237;
	b=bvYdIpNWPZYNrDcb5VHgHjZ5mOmfG1NSJ05pI6nakPaXKXukxPCROF8wAiVViDzPr5u9
	 MMfPlFqkxDvgfyo4Qr2iId53ywEJqKNAZyszaSD1UtF0IU4v51Hqt+s1LBqCZPphPcmHB
	 UFfxL2GhhlWSkUKL1jnx5Vfxv8D+wM2uJrffo9Rd84B4ZXATU3gIcsVcN5xtX2+Yu39yz
	 1/VXj9rx6VUsNvuqSJijDypwB5uFS1E4Qi7xZ97Zr7GHtgCmiuwO7I3kUjNJe6xcwyKHU
	 R4i0sb/Dop/n/dr3iIINiW0s/k/uHyfpTsnrC3VXuK9nkuWvUoIA2J8qvxepC9vclcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kuOKXOl2seY2nuHPa7QaSgImf7rgxxNJypl2yP4/rNE=;
	b=pCHZSDdy5uef6kyRC7t8Sc1HUITEM8F7uyxr9LxiqlU9oYJ0sVkMmtuq8bHbYjw/dRZO
	 gweNSllGDjvzvnDxrul2lodbvlekftJTprC9DUoSaROiIZzWAi5w+6JZyadoZKqBuJEty
	 b8SYWa7NUgWMDbbwJGaxOAsHt1fcrbZK85U7yzJ6M5QiNIRfDNKExB72IMT8eZsp9PUHE
	 SUUkOX5/DWS01sMHwekN+ewxCH/RNTqKhzo3hq8Iz/0DpVK1HlGtiSC7KJUs93OtEtXuc
	 E73weqfe0SeYUMEYs+ipKixJC7RbZZs5QYBVcyXJrlW1VTQDDNskqB/tVtlooKci7Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=SHqBm5if;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBD7606B42F
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 07:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BBD7606B42F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=SHqBm5if
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91ef011e338so29793396d6.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 23:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640237; x=1795245037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kuOKXOl2seY2nuHPa7QaSgImf7rgxxNJypl2yP4/rNE=;
        b=SHqBm5ifuCi19eDdU6VNqfmX84OjLjh+oaxxPBrlTMKU80mySufaDtPUSv6TTq+zz3
         +Co78G47v6fONadDGxWKcNGUQvCgSrwXJFg8TppF+aZFOOUhKhDRDlDN+xaZiBXJsiWL
         7noGrim9jrxIISpyaZ75eU1EtKup7BugNNCXeDRghcA0y55HF5VFSXgx+LF7yGQw43gl
         GLL3BdlC928/BgZG2pu06rv3+OF8ZRWEogeefHb19bWYkkkKNU3yHRNuGBA6IGU7rTay
         OtcyhxTBnFmqdGbB+seDvJevG79lSnyMnw54BDiFQvk2elI7rbEALpd9fiaBlOif5Kem
         3c0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640237; x=1795245037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kuOKXOl2seY2nuHPa7QaSgImf7rgxxNJypl2yP4/rNE=;
        b=OAlS2ix/6WmW0gnB2uCOJ45bUlnPOCNIGpNm6Y7R8mf19R9CTmK2McuzV97An1/NeX
         kalhNLodsWkrWlRRaW351Io72ja7EV0BtL54WfOnlvwlM3iHk7VPSH4Dy6vLWqYulsdj
         tUrBw7swE78/PC++lQm4f+HbWz68WqW2m6x2zhNuEdUFudtlQYIcpn1epgfF0wdbMFR2
         xjpqZ5HvZhqKaOj+3HF6v/YNyeXANF1FZzTQY7CFQYuRyHbOua9RkowRmokI4uap70n8
         KPA2KnR93EB0xHxRlJgSQ+ttnZuF4PY9CCM7M2axe77Pr/9FwmhHyo+laDPnO0R33Uut
         A6kQ==
X-Forwarded-Encrypted: i=1; AL+hErEv3iRZQWNkxDXek5i1o8ijtRY1qsxKB+CrXj2smkMS7coaeBzVVZc0Ci2WGRQVLz92ctX/WpeMtx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s/1qP4E3RDZKbVQGQQ5JQRRiRyQTrIQtyGEH+Z19h3yUNcmE7
	hUXZZnz7ICMZ2vG6z2pQU6Wrn9DHRJz9qbk+YaMFdT/HVOIzy4WZC4CNoN8iMJQx5og=
X-Gm-Gg: AYBFou01Sp4qjfdEMZ5GqItBXxpH1jHnPis0tsOGSHH2AsIiSVAtu6FcLxjS5F4rApa
	S5npp5w6ZZr0T5cOziIt/1u/BXfjjVsYs69YqLPi/DRel14TLUi7VyCe8v0Fjc5hlux0hMEMoJr
	XbksaDdbgzJY8McyDCnSTDLkHdsswmM/6qt4c/Szf2YKhuQs9DJiv+QKnRLg26Gki4eeAcLKzAw
	PJpEzY9jny0ut3F+aqAIw7WVjUpXPndvk0UJrsniT72bTTPjnpCrBVNmbJG1KWcSRZpBnA4k0F2
	2MetaX69U1pXwOXc5UVzye88M2/j1P8JcDeH6DJVujX81hKbK7X5vQUS3PedskFfMHUcmugmUFD
	lxoCWC6DOJocc2LmIvG86hO3sSy+yL4wruzaSJwjmOCACmQo0RLtt0IUhj7PZoFxZsulpMSIdv1
	9ecaZ0GdsOwuoSEne/G+YiPfA0+zMtfdhsjDxEYgtXh0rxYvpZUGoQDv59aiM54ez5cGbUsrULC
	/a8nAiWQARCVvc+w6eC5VjcbrrnsWtjGnH9o/AnHijtoDn2is1mK6BtY/WurL76ydGQERs69Viu
	OkFuLrrfm0zhqKSRqoltRqKTPkneAvecYQeQcQYT+OcJEwojx3UslWejCie8kE3XsAUBYM1aBVx
	YVhcAnJFCLghpL90=
X-Received: by 2002:a05:6214:3b85:b0:91c:15ce:66ce with SMTP id 6a1803df08f44-91f24194ac5mr80511276d6.11.1794640236685;
        Fri, 13 Nov 2026 23:10:36 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:36 -0800 (PST)
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
Subject: [PATCH 15/22] mm/oom_kill: compare OOM constraints against common memory
Date: Sat, 14 Nov 2026 02:09:52 -0500
Message-ID: <20261114070959.3490008-16-gourry@gourry.net>
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

Ordinary allocations reach only common-memory zonelists. Compare policy
and cpuset constraints against N_MEMORY_COMMON, so nodes outside it
neither make an otherwise global policy appear constrained nor inflate
the constrained capacity.

All memory is common at this point, so behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/oom_kill.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/oom_kill.c b/mm/oom_kill.c
index 5d48bd862c27b..1ec22bdad1fd4 100644
--- a/mm/oom_kill.c
+++ b/mm/oom_kill.c
@@ -274,9 +274,9 @@ static enum oom_constraint constrained_alloc(struct oom_control *oc)
 	 * get_page_from_freelist().
 	 */
 	if (oc->nodemask &&
-	    !nodes_subset(node_states[N_MEMORY], *oc->nodemask)) {
+	    !nodes_subset(node_states[N_MEMORY_COMMON], *oc->nodemask)) {
 		oc->totalpages = total_swap_pages;
-		for_each_node_mask(nid, *oc->nodemask)
+		for_each_node_mask_state(nid, *oc->nodemask, N_MEMORY_COMMON)
 			oc->totalpages += node_present_pages(nid);
 		return CONSTRAINT_MEMORY_POLICY;
 	}
@@ -289,7 +289,8 @@ static enum oom_constraint constrained_alloc(struct oom_control *oc)
 
 	if (cpuset_limited) {
 		oc->totalpages = total_swap_pages;
-		for_each_node_mask(nid, cpuset_current_mems_allowed)
+		for_each_node_mask_state(nid, cpuset_current_mems_allowed,
+					 N_MEMORY_COMMON)
 			oc->totalpages += node_present_pages(nid);
 		return CONSTRAINT_CPUSET;
 	}
-- 
2.53.1-Meta

