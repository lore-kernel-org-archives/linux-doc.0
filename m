Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58274395AD4
	for <linux-doc@vger.kernel.org>; Sun, 24 May 2026 12:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779627100; cv=none; b=eT6e+Pnrl4u5IkvPFJNwy4EgWK3LcvjJBDjVE0F4b9XWJZPLmN7PUcQyD3ax9tlZUkyGfAyv9BY3DCTVMChZhH51885TbwacEYrO7ulxVsB+JKdutpdyLCFA14z34AAlb05Au/Z9ltkZiHcxU8Ff3An6GxjORye3KeCbkOj3vL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779627100; c=relaxed/simple;
	bh=hL+s7EbAAJiC5PDsEX+EeqlhhRUkFl41FxobbygN9B8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FnLmtk8+74UKQR2Kjb1iEkRKMLJuMiRG21N7qikbaAbvfJkZazDDFT+PQGcbuH/h+aezYfA6JpmEAqNFCt+dU9jH5LyD7LgMLlLtS65onm8GaUiSEQb6Adm09v2UGM1p+FPDzVLa6AoDwJdNv3oqJDuJ8S17mHRjC+Ab8vBdNvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOWIlWj3; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOWIlWj3"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-67da63ae541so2593000a12.0
        for <linux-doc@vger.kernel.org>; Sun, 24 May 2026 05:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779627096; x=1780231896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zaac+q2wcXPmSLkezcHQ4SREpixOUlTlhddu9awVmSo=;
        b=OOWIlWj3Ib9eo8R6MhsnX/Rme5GkFojnvPCQm+R9i3m56UUJCkRRy/VNNvKuaK07ML
         lf4PAiHCJV8LhAvao4EGg/5cU43yXiM3GsKF5ZwMIzZ6Lj9ALlghX4Q+2jPQGBIWpyGZ
         1eFPoNsxpz4RqdTM76xi7Fsyv0P8jzsa1L5zpFqsM+JQtfLU9c+jGkftt63ivsjaZjfK
         E7dGc7jrFiVBY/4SN5J03bpzyzkO1nhPMKRcwGxxLMivrYpr9iyiZ5PUsh5qMuphOxvD
         ZqUDtch6sQ6IOjNQV6uEBSGGAUF52W4B5+mJI3uZwqTZyOWhyfBYxRdOrejQzSMvh7pZ
         QbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779627096; x=1780231896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaac+q2wcXPmSLkezcHQ4SREpixOUlTlhddu9awVmSo=;
        b=bHWoqXZrQ0JerYbVmJCXgD8BZ0FBQrelHxzNY0lz1XYokTTiTVJhHzudpacCzzQ6/w
         AW8pweklPOQkJtqw27Ce7qY+xTnH8W4CJC9RjB+sLVUz1aua9lpfcVmasi21eCmfseE1
         Ml1cMNkiOjCAAhTkaDxgPZnKlUcc1eFG8+cjPVmXEvXJokB13iJlBQ1THtho0Jirk++l
         zlnBX5mBaYOHse6BMVFtnJ5omkHvEnL0poDdi0+X2GfehmYZjT6z7+BEAfyC3382Ualp
         BWXgLZujoRGYSoYG/sDaHL3FOD7OamHKzsiT4iQluhyVunKd5gur+KKuqkhjhd72zixO
         cm2w==
X-Forwarded-Encrypted: i=1; AFNElJ+Ay2qKKjEt/HZJRwB0rSIon8KqBjol3vxK3N+rbO9aXicAANl2IiYQ6168imeCa1RfGlvP121fGJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9m4Cc7i/IrEiBXpTCC+ZM5rMX4fgCBAsdHoptLTt1DmYtwTUo
	c+Opqwcyso/OyT4jeUXMzfZH/tn2PBjyBQ3kFRgoi+HqKwhJwIqR0ja/
X-Gm-Gg: Acq92OFW6gSEiyoyLdUiE1vzU/rR8UgYd7W84RpVzGDM6hLRsRYXMoSTIGh6vEJliJJ
	sr+0uIhKyxY308L4JL2N7wSJrEbSBqYFXpjtP751UvuCIkPvMmJleqPoFzII/1yFMB8gXwAD9GG
	uvFs5+dyRCw1sNWHk5IXUmLjd6H886zG8MG+OpzgN0Wp2aHEcMqa0FkG02OvLSOpszUXzDyH0EW
	SQG/mbyhJe6TMqeLggOnWWfV7rYYZrdO80jHjwrjtdRf8lOGHNCT7PqkGQdX9NKtaaf4/gLsNd/
	vnTtAuWqptIFdE4QS9iy8T3JIW8OfY/g7xX5YrkI3DyKRaCmzm2bswFINk9yGA3lIJz4w2xd4ls
	ETgO4VcDzW0k/FKgAcYsJmYXhlwZBNyIX1EvDsAArXeEhLACXqgBNpz5hCosPVNkh0H4dqgzNDX
	1X96Jdjmy1Uvr8JZ4KqGi8NsK4H48+lMB8WvVXT/fkaRaCcyJxolJffEF/65oNViD4QcY=
X-Received: by 2002:a05:6402:370a:b0:680:c843:a1d0 with SMTP id 4fb4d7f45d1cf-6889c432224mr5618565a12.3.1779627095441;
        Sun, 24 May 2026 05:51:35 -0700 (PDT)
Received: from nixos.tail35a60b.ts.net (86-103-11-136.ip.tng.de. [86.103.11.136])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9f6084fsm3042930a12.11.2026.05.24.05.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 05:51:34 -0700 (PDT)
From: mattsva <mattsva.kernel@gmail.com>
To: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: mattsva <mattsva.kernel@gmail.com>,
	SeongJae Park <sj@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	damon@lists.linux.dev (open list:DAMON),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] docs/mm: fix spelling mistakes in memory management docs
Date: Sun, 24 May 2026 14:49:21 +0200
Message-ID: <20260524124924.405071-1-mattsva.kernel@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: mattsva <mattsva.kernel@gmail.com>
---
 Documentation/admin-guide/mm/damon/lru_sort.rst | 2 +-
 Documentation/admin-guide/mm/damon/reclaim.rst  | 2 +-
 Documentation/admin-guide/mm/transhuge.rst      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/lru_sort.rst b/Documentation/admin-guide/mm/damon/lru_sort.rst
index 14cc6b2db897..25e2f042a383 100644
--- a/Documentation/admin-guide/mm/damon/lru_sort.rst
+++ b/Documentation/admin-guide/mm/damon/lru_sort.rst
@@ -75,7 +75,7 @@ Make DAMON_LRU_SORT reads the input parameters again, except ``enabled``.
 
 Input parameters that updated while DAMON_LRU_SORT is running are not applied
 by default.  Once this parameter is set as ``Y``, DAMON_LRU_SORT reads values
-of parametrs except ``enabled`` again.  Once the re-reading is done, this
+of parameters except ``enabled`` again.  Once the re-reading is done, this
 parameter is set as ``N``.  If invalid parameters are found while the
 re-reading, DAMON_LRU_SORT will be disabled.
 
diff --git a/Documentation/admin-guide/mm/damon/reclaim.rst b/Documentation/admin-guide/mm/damon/reclaim.rst
index d7a0225b4950..01a34c215b66 100644
--- a/Documentation/admin-guide/mm/damon/reclaim.rst
+++ b/Documentation/admin-guide/mm/damon/reclaim.rst
@@ -67,7 +67,7 @@ Make DAMON_RECLAIM reads the input parameters again, except ``enabled``.
 
 Input parameters that updated while DAMON_RECLAIM is running are not applied
 by default.  Once this parameter is set as ``Y``, DAMON_RECLAIM reads values
-of parametrs except ``enabled`` again.  Once the re-reading is done, this
+of parameters except ``enabled`` again.  Once the re-reading is done, this
 parameter is set as ``N``.  If invalid parameters are found while the
 re-reading, DAMON_RECLAIM will be disabled.
 
diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
index 5fbc3d89bb07..5d08a2a1c15f 100644
--- a/Documentation/admin-guide/mm/transhuge.rst
+++ b/Documentation/admin-guide/mm/transhuge.rst
@@ -210,7 +210,7 @@ PMD-mappable transparent hugepage::
 	cat /sys/kernel/mm/transparent_hugepage/hpage_pmd_size
 
 All THPs at fault and collapse time will be added to _deferred_list,
-and will therefore be split under memory presure if they are considered
+and will therefore be split under memory pressure if they are considered
 "underused". A THP is underused if the number of zero-filled pages in
 the THP is above max_ptes_none (see below). It is possible to disable
 this behaviour by writing 0 to shrink_underused, and enable it by writing
-- 
2.54.0

