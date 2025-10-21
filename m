Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA783340A61
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 15:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761058851; cv=none; b=Z6KvkV+jBTFR4iEYrKTpsNsrwCpXWliVKisqfcsSn3IRJ3mclzqjRWUbup+wgymC4hbRCZ2VEzlzqfy49OAJHJNbydecO0ppif0YgHpaXqRkNq1OFM/ToPKsBub12HxEwcX2ZCpHfngV10msSPwTK06Ik4FJRozB+b61qt1nvsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761058851; c=relaxed/simple;
	bh=L7kBVIaKloL9qtKYYhf9Gn1Ws+54U3dYXmIRPOFuXCs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aFTIJGLB+HD0qKJXQwoGnWJjO7FfxihCqw/IAXxdquHuG1FkZci4mgUrkZyHYriqOdAp5Yzb8n75hKTWCK0cc9UN+yxcupzKfLrGzFfDT1ksImks+E4zecG1CnBvnvSANnYEpKZ9ceCjlti4E25p561JgHih29vA2G7dDPPEYzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JGgaacBF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JGgaacBF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761058848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ky9IQ4YAsBLfeIwBY21tvLCKpQrC6NzvR2EdWfDbaQg=;
	b=JGgaacBFKnJ6m/FOK27YKEeczl/yDCCZEfZSu7HBVhQwwWE/v2D7cFr069C7ynaJ/PSNH0
	gSTitES2vRPJ3YTqcw6GJB1WF3g0AaU795WM3Q/as5Qnhf2h/B2inbY7/9jIQ4hOZ1D8O1
	+QKpjdDNzBnxQuSu4bGSk+Ore8xglk8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-ue6WkQt4PYiAltQqNBQ34g-1; Tue, 21 Oct 2025 11:00:47 -0400
X-MC-Unique: ue6WkQt4PYiAltQqNBQ34g-1
X-Mimecast-MFC-AGG-ID: ue6WkQt4PYiAltQqNBQ34g_1761058846
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46e4cb3e4deso21048555e9.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 08:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761058846; x=1761663646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ky9IQ4YAsBLfeIwBY21tvLCKpQrC6NzvR2EdWfDbaQg=;
        b=McEEzrHQ08dQ6DuyGCEMgVBLAsuNLRqBxd2ghUFy1M9qNitL4cbwIzaPEKwqvyv6tT
         PDJrHQzyFt7hrVL1mQe/G2+WdjQ/mCB/nSZr13PDnrOilHnfekc/fV4xazW4z3LbZkCK
         R942LpXTbQIXVaxU8KCpONKfxPpDhqtn472bXhxjLZ17GpA2QIatv2OcPHqRNqZ2YsCM
         UGYD/ztttWQ09lD0Owfgb7Yynz+6LjXtM4SrjE2Ojy/nn9N8vj5nIDi97S8DH+OdeNZ1
         kx1xZJhpdmI/HOuuagWFYnIeb49rcVTk981mdOHajTRGsMiEDN9kQM8SG1S/zFoCHRp1
         21QQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAyAI21PNF4NjThD7rfKi7Y4a8bDHFQDKbu7LnOwtTsXHzm+IvCxaEaaJtjQ0/5UUVwMUHSUK3bdo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxoh3HFL1RqCd3tRFHpqkrBoV4k4Sm5HIjQ3bOehcSApoRVHsTq
	H3o8vKYG1DCLvMKIdN2cLZ2WBjcWRvQXejQX9rwkMTrKPz8WJVoygX7r5dI1vcFBtxVJdfm2XE0
	q2/Am3qFyMgM64y6vm7AIxeAdiv7x18fvjAzvW4UFeDI6123xURKQrUjby3HxxA==
X-Gm-Gg: ASbGncuTKV13ycm+s10yn3aj/On0iT/G1vyb266NKaOWGoPPdE7ApMlEMARVdkFSGmJ
	RYczgl3Amwt1JTKWrrH9trQdsNe5Su0kuLakaWcgREvgdUFqQs3HtK1sRUmlK92TAmp+nbQCfzy
	qwapvZP6DB6zR7+zijBjcTIsYoVvcAMkTQk0N5kidmu+inxYBWkTS40xL2L5GEjPt26HmPS0EgL
	hxRbEdC0yFKaQkMG7naGDiUQYgm18xPQN85rLAbdC8JSru361n0aCXnniP6Ctu8Eol7thL56Fym
	VGvUACZw51WDUiHIJQe3S+Y89taDtNSPC5/qyQp2N9YaGXovfw8pcgcoiGHgDAHtUrjCdQ1jgHV
	xX24sSwjpn1z9BAywdLgPqoeVVnAZow5o45J+QTWh7N/yG/sX/LMO9fNQlOwA
X-Received: by 2002:a05:600c:4856:b0:46e:6a3f:6c6 with SMTP id 5b1f17b1804b1-475c3ea4513mr292325e9.6.1761058845727;
        Tue, 21 Oct 2025 08:00:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcCb5n53mP5PF5MfJ9HO5RP4uaN8pdS2o1XXt/OVHNFMEn6HOLQj1RdbKKLXflQ72jgla+hg==
X-Received: by 2002:a05:600c:4856:b0:46e:6a3f:6c6 with SMTP id 5b1f17b1804b1-475c3ea4513mr292005e9.6.1761058845283;
        Tue, 21 Oct 2025 08:00:45 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47152959b55sm204336915e9.6.2025.10.21.08.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 08:00:44 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH v1 18/23] mm/vmscan: drop inclusion of balloon_compaction.h
Date: Tue, 21 Oct 2025 17:00:35 +0200
Message-ID: <20251021150040.498160-2-david@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021150040.498160-1-david@redhat.com>
References: <20251021125929.377194-1-david@redhat.com>
 <20251021150040.498160-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before commit b1123ea6d3b3 ("mm: balloon: use general non-lru movable page
feature"), the include was required because of isolated_balloon_page().

It's no longer required, so let's remove it.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/vmscan.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index c922bad2b8fd4..b96448b562823 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -63,7 +63,6 @@
 #include <asm/div64.h>
 
 #include <linux/swapops.h>
-#include <linux/balloon_compaction.h>
 #include <linux/sched/sysctl.h>
 
 #include "internal.h"
-- 
2.51.0

