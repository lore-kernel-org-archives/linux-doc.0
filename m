Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF3533F8B5
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 15:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761058857; cv=none; b=jt6NR6dBmtvh5MHwtMhIaKbSrtbcUIzNKCZPnYlFGxEjCkTIIu6Tlh60WRGmqMOGbl8vegHdq0bdL+F4z7ySBQhYkr0Qr43XOtRDnzjED2/iLZF38xLWub3YncrgI0a2IAZhWGvMK2LciiROqSviPBUP/MKwskQL0fBuQATCQHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761058857; c=relaxed/simple;
	bh=bQcdfA2mrt7mpXYEYdKFgafDPjdfDxx4+RaAhMIH5Tk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OTXG317LOYCvGveSNL4CPj+dH2Ew0DhQkAbiSde7KEO04DCmtPV9iimExgJOJvaIQguIzeN3UThICmN3Pq94JUwGpNj6kMSQnB281qBj4xnWyyHugvm7qJcWHkDhxurveGshAg5MFhz0pgJzLbKnrv8NtTEdAblFOqyV5EjN+Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=STLSOe03; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="STLSOe03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761058854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XDLrgg+nqjJKw4aq9VppMtv44pG2L3C4aYFxjxK1b9A=;
	b=STLSOe03TfPufvrGzt0aU2Zyrz6z5gNSoma57o56SO8p/QrTtRt55vOhZRQYP1Bfve/ret
	TWV64IvMGxiACegnQ/h0h9iOZeP8BiMYgYo1DN0VmrRAhuiRg2/SVXTdH3OqnytC28uwQ0
	lpd3q7Aljc7PpBjfDZo/17NEnKev4tI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-gwZlSZTGOzmP-5pWGkb-iQ-1; Tue, 21 Oct 2025 11:00:52 -0400
X-MC-Unique: gwZlSZTGOzmP-5pWGkb-iQ-1
X-Mimecast-MFC-AGG-ID: gwZlSZTGOzmP-5pWGkb-iQ_1761058850
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-471005f28d2so22199295e9.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 08:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761058850; x=1761663650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDLrgg+nqjJKw4aq9VppMtv44pG2L3C4aYFxjxK1b9A=;
        b=l58xOd8NdfFACGkCgCRTfdTORWIta00wonCACGh3q3HvDAJ2+OiLJnstWtXuz29QKp
         ywhFxw/Skx3HY2YkZdOy2jSj59IsPI2jnYMiH/5Os/Tn4SubzrIpEI7kmiOZJ5ITeesH
         RwKp3mFGbLeluxtixVPlBn0XEtA1ASCiHZ+7S5JBwkS7lKlhl5xXOy4vPTA3p5b21XlV
         Gnesa2BPKNTVhdUJ5HDsbrjBdH2G5OoXDEzX8BVRukrkwImeqyV1bVVXS0br5Sze0eKx
         j4mE1N3bzI4MFFeDpBEhh5Z2N2z+N524Ssak17SKOKV+ytR2IG95mHzz8plnoitvjBoC
         Hvmw==
X-Forwarded-Encrypted: i=1; AJvYcCWGm9mQSrQA+3Vhj+Am8v/CgL9JAsEFombGs165h8+LXA+ldLRKKwRxM686SGrzltsjtq+D1N2HP7k=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfp6zJNp/Rb8++FR5CROxOujOenQ+LvNaCnqzLZSa8mIKRi4RK
	DksIFG6xAJfQYeUoUjhFREqvjD7aWMXUZN/yYqbJznKf+GjoXOviWJLii0BykLtcSYxwnH/U5sl
	uF2paoeRQr62CjeNaVKZKIgE3nDgRZs13/KMJCqN2BHHEsZUixMeWtV7z0q3RIA==
X-Gm-Gg: ASbGncvqm4KIjhZ+8nk9HV9pqux6DB2BdsPE3lQFQz3HLoVAUU5DOuccgribKX1hXIO
	lVjpv1P4JYp/3Zg3bHGW2uqIa776M1oy6/z4aZZ1j95mjLGxGVX6hYS9wQN7Y+MtFO2vb5x/Tk/
	WTlK9bii3vzmC6b+3c8UOgmglF/g+KfMeh5T4CuBM9o3E6Qs/4KtIKsg0p7BYQkp87VL04+OiFk
	9cu5Ss/qfkBeoTK6tRdIPHqSa+xtgxJNE6A1YFXHW+zJ2Qezy57mXldn5s5Ldjw6qIUmvjzPNOI
	24ZU85s9XF02EtU8aP237RGWHA0L9fQ1Suq3/o1rijB8cJqUULISr45OOEytl99zt68mEplqxhC
	DRX/R4Dj4a1/mpOPi80dcD+/Ob5d9vgqhMYMGVKig0q49hU7HMrPQyUKG062G
X-Received: by 2002:a05:600c:3f10:b0:46e:59f8:8546 with SMTP id 5b1f17b1804b1-471178afb7amr120260005e9.17.1761058850149;
        Tue, 21 Oct 2025 08:00:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDk/chsWh4lmzSq81oi5QgoA5chh2GWI8u8p0fIiNZPQgGrNl16RwScdXvWvZ/Onc3FnooFg==
X-Received: by 2002:a05:600c:3f10:b0:46e:59f8:8546 with SMTP id 5b1f17b1804b1-471178afb7amr120259635e9.17.1761058849707;
        Tue, 21 Oct 2025 08:00:49 -0700 (PDT)
Received: from localhost (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-471553f8a3asm233676345e9.16.2025.10.21.08.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 08:00:49 -0700 (PDT)
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
Subject: [PATCH v1 20/23] mm/kconfig: make BALLOON_COMPACTION depend on MIGRATION
Date: Tue, 21 Oct 2025 17:00:37 +0200
Message-ID: <20251021150040.498160-4-david@redhat.com>
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

Migration support for balloon memory depends on MIGRATION not
COMPACTION. Compaction is simply another user of page migration.

The last dependency on compaction.c was effectively removed with
commit 3d388584d599 ("mm: convert "movable" flag in page->mapping to a
page flag"). Ever since, everything for handling movable_ops page
migration resides in core migration code.

So let's change the dependency and adjust the description +
help text.

We'll rename BALLOON_COMPACTION separately next.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/Kconfig | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/mm/Kconfig b/mm/Kconfig
index e47321051d765..3aff4d05a2d8c 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -599,17 +599,14 @@ config MEMORY_BALLOON
 #
 # support for memory balloon compaction
 config BALLOON_COMPACTION
-	bool "Allow for balloon memory compaction/migration"
+	bool "Allow for balloon memory migration"
 	default y
-	depends on COMPACTION && MEMORY_BALLOON
-	help
-	  Memory fragmentation introduced by ballooning might reduce
-	  significantly the number of 2MB contiguous memory blocks that can be
-	  used within a guest, thus imposing performance penalties associated
-	  with the reduced number of transparent huge pages that could be used
-	  by the guest workload. Allowing the compaction & migration for memory
-	  pages enlisted as being part of memory balloon devices avoids the
-	  scenario aforementioned and helps improving memory defragmentation.
+	depends on MIGRATION && MEMORY_BALLOON
+	help
+	  Allow for migration of pages inflated in a memory balloon such that
+	  they can be allocated from memory areas only available for movable
+	  allocations (e.g., ZONE_MOVABLE, CMA) and such that they can get
+	  migrated for memory defragmentation purposes by memory compaction.
 
 #
 # support for memory compaction
-- 
2.51.0

