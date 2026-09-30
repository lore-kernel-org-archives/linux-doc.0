Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2BE4E433F
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780896; cv=none; b=HgTBEe5mIJ8A6kY+KJh/ldeNftfQwEjvgPHJv+jEP3teHr2nFBXiXXgleikr1lsAKts0cSwyy+tQwwAqCRLi4vrhYEc7s6sGN7tXrp9MhcTEcEOTzmhGONYuOIfLdHg57QQktBNk8KMNSGDo3BNm1YJMYKrxWXlJln/x5np3gd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780896; c=relaxed/simple;
	bh=ltM6nRdA7DvC0fCSIWEk+41Eu3NFrKeK9cIAa+hnJRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IHDshbz8JZNJB08mQ0Fcg9WU4AKBhQ98KBbafzO0G0TQau2cc+ghrKyo9BglnMNnYz8lmeOjxG1qAF96Qv8XPiX8m6WKVxVfPsrCuubV9Js3lMssUi2pqiQMD6LgAdgm/kXojgzp67RD01V9C01zaOutVPuE/0H5mn69zlthnuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ZaLJn5P0; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ZaLJn5P0"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2d747f05ffcso26223905ad.0
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 08:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790780886; x=1791385686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIHsTwyZ43cnCG3HcUOwIRG07ClCz/sTU0nge1LJvus=;
        b=ZaLJn5P0hQeoiKDd9sw8viTljpvpIgFKYLvFumr8aEPK7osKNm169ccFOGVs5DQ7AV
         95zixvSDitSKc7oumBjZRGbq47U0ZPn85QcFEIcFkfh1deVE4/PcqMmyJTrP6yJJBNgF
         8KMJZjowaFcrYa4XlnLJ4u8YnbLBAK/Cw6mRc66NpmUMYdjlQVaoUFEs+iNgpSXV81m2
         8uBnpLjKnF0yJ/gRqiFl03icSW0BKuvXaK8/SV/8bpcTbZb6/Xw9pRCqPC9HxUoeA99p
         a6FkJrtxkrvf59yeOzCmpG/j45xNWkeH29O2OxxN57aUhtFqgDQuvnffV6iMVsEGrawe
         kvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790780886; x=1791385686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BIHsTwyZ43cnCG3HcUOwIRG07ClCz/sTU0nge1LJvus=;
        b=os3K5XB3ItA5Ovcle1EVwKiqlPrFlTQtknH8gEV2pbPDCvIjXwIAb5EdXn3X6ftcbH
         Bd9LTK6imXNG/pWR59pRWxcCD2ut4BoozBYD8dRv/gJEJfMbsPipB4YEM15ctJha0WTQ
         NF2EPR6jPkYIlfC5Eu8YlotGaG9HNB9AVwolzviFHclgi5YJ06eHUNta2RBX3hRd6UUg
         60lbWAth68oYUeCF5bKlafWZHW66QiNyKnkBCwxDGM7CQLJ3zUSauvOy5H3PDbZ2uvR3
         hgK7UOL3Jei3D5NxZGJACGFDdWVHgi1CCBCcvmgc8BqniOJxumYnDwRzz5Sh7sdspLnk
         m6dQ==
X-Forwarded-Encrypted: i=1; AKwUvBynYJkl35EqQIJPGRn5A8AXkwCLXlPpE+oUpunkSNmcMZsIZ2rN4L9Fs4UfEeOc+7jQeIh73U2JonY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBVpo+swaFFn3zsQO6ND7jBRsUpD/l/ZZnQgXyWbeQ7IGaYT22
	rkAlCVDX2gBi487hyq9QGKqFcnhcoWrjPAWTYrt5AJ/P3aVQBs7RGQ9DNOAmuZCHjEQ=
X-Gm-Gg: AYBFou3W6xAj3BVPp53QswfefLq30IDwierdyZ7LKr4lypM3SS9E8CecqMocVR/XzXh
	GHL+d5ZnseO/0lP7Ikip0a+OoVRT0QriODsETEhRm1gVqZLFvKe0txoqN0zvI9fKXzF6TEHoy/q
	aZCL8ijcx0VHWYPhSyEW5ay1zAFKwSJhGsbX26Izg4FD+nvRwN8ucTbU8FCvQ4/y3iw9+j8+k1F
	m7Tth+tRH9GSkyniTi5Vhi0Sfd5W3HCzX/48/smxNC6NVXbMr4UteYjSLz2jLU6xg4yj9y1QF0x
	Wge4BnYCJzozVjRKQONN0QWe0XKIOEnUhL4ed5BRGFpRm1lHpaaUJEQS3KClD2R6WAOM7wEink4
	nax9HYDVY1lFh34lNeT4FrUFnGKjulD/NzU4+dgsp1wE+ss8ebJVx/PvjMPb848ynCB5inMQU9c
	EbHurtsjXbEWZoBie6+9qJLlXepqS0JZBEA9S8tzKEqJKnQMl1I7rO5GwdIh48ia27r/uSoU1Wv
	J5QxqOv5Knl+kNXS0w=
X-Received: by 2002:a17:903:8c6:b0:2d9:26b3:547 with SMTP id d9443c01a7336-2e2e49f746cmr14145765ad.20.1790780885353;
        Wed, 30 Sep 2026 08:08:05 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e587f71bsm9426885ad.2.2026.09.30.08.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:08:03 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH] fixup! mm/sparse-vmemmap: switch device DAX to shared tail vmemmap pages
Date: Wed, 30 Sep 2026 23:07:48 +0800
Message-ID: <20260930150748.1134516-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260930140627.57431-8-songmuchun@bytedance.com>
References: <20260930140627.57431-8-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

prep_compound_tail() makes PageCompound() true. Calling
__SetPageReserved() afterwards violates the PF_NO_COMPOUND policy and
triggers VM_BUG_ON_PGFLAGS() when CONFIG_DEBUG_VM_PGFLAGS is enabled.

Set PG_reserved before preparing the compound tail.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/sparse-vmemmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 4be85e194c78..23b31bc4bf94 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -222,9 +222,9 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 		atomic_set(&page->_mapcount, -1);
 		set_page_node(page, zone_to_nid(zone));
 		set_page_zone(page, zone_idx(zone));
-		prep_compound_tail(page, NULL, order);
 		if (zone_is_zone_device(zone))
 			__SetPageReserved(page);
+		prep_compound_tail(page, NULL, order);
 	}
 
 	page = virt_to_page(addr);
-- 
2.54.0

