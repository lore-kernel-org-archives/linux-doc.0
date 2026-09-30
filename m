Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95414BE423
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 15:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782137; cv=none; b=PmcuOyVHCwBpptHtVH3ziX3fGrDzazTstm+R4zbCwAoVqJ6dSy3QTH4f/GjF7eFHc0hqnEbKzRI5CGLIgMBTqOCCAD34K6mjaW/0ZzO7P6+0bd9qMxYSUrUn4RxT6t4dKWayhduBGoBLbk/bDp5owZWrtNrGydFFyEzEA/nvg7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782137; c=relaxed/simple;
	bh=2Ggxf1QJMVzAn7z3bWwrwpi9VQNSETBx43AfVJ4a5jE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D77EZMRfOn91yFiDmJoQ0rQHf8EopqO3EFRDkUS/aafVoSCcQEcR2ItafJ+/UeQTlCXztek0yjZ1t7E9zajMDNweu6Bc2CsrfeOBvF3807forGK2Sy0SwMES393C3DAf88G/7WI+Vsqv0jAYWue3CNUr0xGkikm+3IlQV0yzcoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=k41tjchO; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="k41tjchO"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so5235264eec.0
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 08:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790782124; x=1791386924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cc+9rKSOSGawoxpJ2ipg52Wvw6p1Y1gNn8hY21fAsGA=;
        b=k41tjchOeNuQm/A50C17+3cfj639ABE7thfMk6YhMkICiSG5sdsQ5q7om4BYS+5QWn
         D09YaKyioATHoAaoA3FrW7iYaRPfoX6ME8wx0O9kUTlmhCBpUdB548En+XYverqGsHv2
         CtTrlRSEyCxSx6qo++UikX+8rrIsCgKmR+X/4dZru2D7DFxbBD/IOSQg7M6KgQt7YwhL
         DAdFL68a3X2Qk7wJcJmUCkGwJ9Fr78pCP7plXUvjWsp0W2uuxycbZDppl+ggtRNcto0p
         D9n2mG09dLyW38CBwjv7afMkY717VrE4GOS+j61zx5mNPYeHPQqMKqjI+Det/tVmN3D5
         lcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790782124; x=1791386924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cc+9rKSOSGawoxpJ2ipg52Wvw6p1Y1gNn8hY21fAsGA=;
        b=ps3+bdpGgOfuK5SihbxuY1Es98KHnDNTFtG/wVdlw5g52q5hjxoXMVidA6i0F82xKK
         KXmdR9izg/QMo/S4KZXVfLgFhNRT3T6oCAuKKHx0wpoKUCAnlsI7WzCr1js8odrYqUnP
         UR5RoBpxZWfds1z3O4AWnQ1DlW50G7I6I6dpQ3LeT7emi48lKKASAlBzad2txKVik8bA
         dTBA2LkGxsdG0jQ13Xw44WU8JyoCvLNFu5LgWrHdphtxeUdt9iINncwwrBh3eS6DO1PM
         4lEIkcFKl/jTEMBJqs00SRKshZs9E3PP+h+nWjmaaEMcHJeXpth7CynuMPfi8O4lZ94W
         j6BQ==
X-Forwarded-Encrypted: i=1; AKwUvByc9omTZ8T1CuFMGf3DvTQl+ZAnPboylXKGKfRincyE1jcKK9TlESVt8vpQcoAk2S5nCDvZId9L0HE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoCusAFf7+LaKiE2LsHquc7DWb6xPx2z8KoenzJ5tL2SadEMgP
	dgUMnxjXKdBuitsEBC0veIB0Ws2YXMc6fdLULSYZjoQyUW0ZrcIEfN2ClMbxtkmflq2d1jQjcbd
	QeNzQO7M=
X-Gm-Gg: AYBFou3wX5uaP51Yf3t+D2xItLMxTKBwE5ZqdBKE3MNcB/gB4eNUP3Nt4fSHdDwBiM2
	n9Ih7bZy1TwfvFoo8gulyBEyJU7DFBfpurq5U1QU6LmyF6DFeVMjF1SLyG+AleNHoF4YZR1FKdl
	tbV141G6jW2L2kE+9jFPZajdbiuvjWM9HuEmGNNJpHlaQQszfKqTp9WtS8NuCfeuMbtP+n/ueWE
	H089ZOxgkWayphgP0WcQ37eawg8Ke+xkGkiP6MFaMjDC7YfFozqHa9PR0AyFO36ZYJVQK3hGmvC
	EQSKsESlpx8tv2naiz/pVVP83+ZRBJ/5Naxq2SB353B7w0hS1XIklVTiPlEjrcok8fG7712Fb/a
	hWF8jykJ0KByCQTMOEenpW/pgZROofWwkrHhrYsQYIcJ1nmvlsNYSF4Hzw2EPfZtLeCgViU7zDj
	F1GU7G2qH8UUlG6DC520AB7S932dtQdW5KpLijHA/Hh5/EpyfIFSu4OvlgDjyTrxcjwP4BsEfga
	mNkUrDzW1mqWEaofe8=
X-Received: by 2002:a05:7301:fc04:b0:339:85bf:dd89 with SMTP id 5a478bee46e88-34cdd2a42a2mr2004450eec.35.1790782123219;
        Wed, 30 Sep 2026 08:28:43 -0700 (PDT)
Received: from G6L4RL2QG9 ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf5b3ea3csm5750493eec.23.2026.09.30.08.28.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 08:28:42 -0700 (PDT)
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
Subject: [PATCH] fixup! powerpc/mm: switch device DAX to shared tail vmemmap pages
Date: Wed, 30 Sep 2026 23:28:26 +0800
Message-ID: <20260930152826.76084-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260930140627.57431-10-songmuchun@bytedance.com>
References: <20260930140627.57431-10-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PowerPC radix path takes one reference for every PTE that maps the
shared tail page. Unlike the generic path, get_page() lets the counter
continue after it becomes non-positive and eventually cycle to zero.

Use try_get_page() so vmemmap population fails before the shared page
reference count can cycle, matching the generic implementation.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 9ca28e4a610a..a3332f32ffb2 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1042,13 +1042,17 @@ static pte_t * __meminit radix__vmemmap_pte_populate(pmd_t *pmdp, unsigned long
 			/*
 			 * When a PTE/PMD entry is freed from the init_mm
 			 * there's a free_pages() call to this page allocated
-			 * above. Thus this get_page() is paired with the
+			 * above. Thus this try_get_page() is paired with the
 			 * put_page_testzero() on the freeing path.
 			 * This can only called by certain ZONE_DEVICE path,
 			 * and through vmemmap_populate_compound_pages() when
 			 * slab is available.
+			 *
+			 * Use try_get_page() to prevent the shared page refcount
+			 * from overflowing.
 			 */
-			get_page(reuse);
+			if (!try_get_page(reuse))
+				return NULL;
 			p = page_to_virt(reuse);
 			pr_debug("Tail page reuse vmemmap mapping\n");
 		}
-- 
2.54.0

