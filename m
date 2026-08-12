Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C531421A07
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 10:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786531218; cv=none; b=Wm1zYE7WyCkeGueen3TS9xXUxwvaxZeBfUyZFXJOHIqQrnneFH4fjPI20o2NUeaasfmqNlePY7hVC7gVS9+IFHeDCRuu12iPwLBOjdfELVbuCEOH4hKjUv+fTD0pIo3t4VFXXbg3vVrk4F6A8lHdjspIt4/IsDJrc0Jc9hfN164=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786531218; c=relaxed/simple;
	bh=2I+1B+A6lfClYXCgovEXx02WRIJ9oH5CQgeIM39TVAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jX86JHxGUsEksFlYbu+ZORGL/Z5BvkqDx2mQ3xgBOiuldQu1PFSl9caIZrlwpINnLlg4AaoH3vNjzQOMuMrInO3YAB6DeG6A7amqwrZip57Z5AkkHKo4eludHJfXiQc/dsiTsj1mgebm++v7cnL7/Bib8VEanKyhrX/lFOnSTLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbhPo4bV; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbhPo4bV"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38101f85591so1919407a91.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 03:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786531217; x=1787136017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qJ+Hxoz344ZJ6+13dkxOMiOcxZbShSOPZl6HyMgRs+M=;
        b=QbhPo4bVv6j0bFLi3/6j3k6GiKIf45BkOQFj9Q3DOjkEw5qVx1QsdWjodzB6nTb78F
         20sd6fKCv5laEx7fF3O0ZF8B+kHT3Prv0F7bXXl6ERgN8Lo43T045/UvDLzwzTlgGKqg
         S0o+/SVJd/82jA9CgZQJiefVOn1pHySC9NvF2hA1rlLmdr0fZKZ+AEpfXqG0lBAd43xX
         DkYEsh2q7BK+GE+CFe3sJN+BMnHPVRFHX0gmCvf/U1zWY2+eg6lm060q/DDWJq31M4XH
         N3JdgJYKvOyJx64Vzt/7ke6eo4HwumOoHNfWBRk2kkSjnJopvIoO74a9lgQuL7i8jpUM
         5PwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786531217; x=1787136017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qJ+Hxoz344ZJ6+13dkxOMiOcxZbShSOPZl6HyMgRs+M=;
        b=BQ+aDqax9rPTl66uMVH8JHhtRy1TDz0d7Wkgc3jNqeW/vxB+7S2BCsgPm8dVqJt5YI
         cmHL9tT8lPEO4cdsxw4K8VeAMlrx6L3OcsCgBf60SW0cuqZq5GZpze5YXgcFNTmDldOl
         xw+MyTVvxleSbWcZJMV+fVV5hTWDqR6T+3QhQntMA289qbQSdO+RfU2hrNP1JWs5GLdJ
         ph6sjpyDITzc2342KClfTGp9ZTDDQb5X1UVdkqjyCTenr7J/7pxAx1vp5QPuDgDXIsr6
         fgWq/i/vCtYnrgZDHXdIlfjbxHTMyIcCl/RrsvtYOJDhAqIkCNPLkNbxQbHbCrVS/tnn
         fIfw==
X-Forwarded-Encrypted: i=1; AHgh+RrNPBdqZhxWKcUty5MYnB96y9nWqN8LaDpgmrSqfaHUTk4pwk7ywBeFxZey9qGfqkkBJLBHxMHln4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKX9rthMrBpX2FzFzuEESWPkUtV6rkCJPrX8l1CS0R69aN+8H4
	5/BkeNDwwYXby/z59OryiSqSQFpPsbOOhZpzabbF5K6g2F22EcP/e2b2
X-Gm-Gg: AR+sD12BjLJAakUrnAzTBL8dbHVqHY/bZXaol3zkPCiZM2yHRNaZqQgu8hAVuLTQEih
	XDEzzThrzw5NmNxDsRMlvU/bGfl/bhz4sgkS7hP94fR+OTZsdL8RX23yZ+MSlP3NuBDFvdaQEUe
	012M5VN7T1gNsjHO/wHTou71ipUWKHr5/uYvwa2DtHP7U7wB8Iefdnu/70NWwDwlg9xbHW1wQgO
	hsn5yxeTXzUApipxZ0z0W90n7nXoY23Y7x6CVd7LEorSoieoEjvTknu1Cc8vV06ujm93IG14Xht
	xCyhLFKZLUCzZ9gUyzKfN0f7unc+URi57NbQLsFl6vmdOQ97GxQ8k+MWUFy9ATzcQ9DxQHAsR1K
	EVoUTGpxzsEu2rhYJTobJaNIFyquv2fGzuocQEdlCM+qvXDyW/An5wEvCt89NcSrVTjca0PR3tk
	4mmbWKnFXzM1XtpYfw2XlNEmVGF6QdsSVuC1p6UBjcM73b/o9BebD/zh07dpOwxGNnsjGlSLj6L
	zku5Yxe2gAiGgr0M2Gs2D0nbA==
X-Received: by 2002:a17:90b:5203:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-392f3f08abdmr4412175a91.1.1786531216574;
        Wed, 12 Aug 2026 03:40:16 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:85a:5c46:85a5:ec7:8aa8:72be])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3d0b432sm9931990eec.8.2026.08.12.03.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:40:16 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liew Rui Yan <aethernet65535@gmail.com>
Subject: [PATCH v2 3/3] docs/mm/damon/design: fix typo of max_nr_snapshots
Date: Wed, 12 Aug 2026 18:40:02 +0800
Message-ID: <20260812104002.15225-4-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812104002.15225-1-aethernet65535@gmail.com>
References: <20260812104002.15225-1-aethernet65535@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a typo (nr_snapshots -> max_nr_snapshots) and corrects a grammar
error.

Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
Reviewed-by: SJ Park <sj@kernel.org>
---
 Documentation/mm/damon/design.rst | 4 ++--
 include/linux/damon.h             | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index e7977f005ac0..d1dd9050ebf4 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -871,8 +871,8 @@ action is ``pageout`` while all pages of the region are unreclaimable, applying
 the action to the region will fail.
 
 Unlike normal stats, ``max_nr_snapshots`` is set by users.  If it is set as
-non-zero and ``nr_snapshots`` be same to or greater than ``nr_snapshots``, the
-scheme is deactivated.  Note that, unlike watermarks, even if a scheme's
+non-zero and ``nr_snapshots`` equals or is greater than ``max_nr_snapshots``,
+the scheme is deactivated.  Note that, unlike watermarks, even if a scheme's
 ``nr_snapshots`` reaches ``max_nr_snapshots``, monitoring will not stop.
 
 To know how user-space can read the stats via :ref:`DAMON sysfs interface
diff --git a/include/linux/damon.h b/include/linux/damon.h
index cbdf5f77978e..4b0d2d2e4ea4 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -549,7 +549,7 @@ struct damos_migrate_dests {
  *
  * After applying the &action to each region, &stat is updated.
  *
- * If &max_nr_snapshots is set as non-zero and &stat.nr_snapshots be same to or
+ * If &max_nr_snapshots is set as non-zero and &stat.nr_snapshots equals or is
  * greater than it, the scheme is deactivated.
  */
 struct damos {
-- 
2.55.0

