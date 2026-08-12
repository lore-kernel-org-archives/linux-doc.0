Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DC5418346
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 10:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529100; cv=none; b=YUbCbS6e5jYdUMkvTlZ6JXTwb8g7l1KFm2e0txjx4W2COjSGtY6NqsBEu8V2K21z8ERKXEkm38cpsw3WrE7WOiSujHvMz2ECXY6GkTz/QLPlhyTPuVJ8HglOZhBT43slPZ9fbjoOm6/mBsjx7LTo5/uu/Xxq9/SfWHKBtK+A9m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529100; c=relaxed/simple;
	bh=EHmNb5OrnnC4mKZ2Bjz94rRJJr1n/ZIhoUobvZIv6hk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n2vCsMQCazPVhhj7UwOVRebFM91NBAn8JTmxVnbW9ndghpou6OOujcUl8T08oGbTptN67WXjmzGYfMoJre/Gm7anuQsVcD1ozhMdUIYJa7JlQXcxXGerFCnSlKKxNv+js1fZQEf5juYBCOt2lMVgbHTwdBihlrVHADN/fg5V4wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCCPBqP+; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCCPBqP+"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e08baf860so922037a91.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 03:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786529098; x=1787133898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5rY136w+JpL/ylEjfYfCsqSvAnSrsJPi+k0wPlzk9EU=;
        b=WCCPBqP+J7EnXbTsypWpY+YqbLj8FK90wm+nj1hAseE01qM/j1p4Xm7Wo/SHOj7sOU
         NDNn9d0y2osuKCRqappYaq+6g66IyoTFZKa7ZdmAh7f6NQW8sOSeDTp4g1Z5eSaJt6z5
         jsife/3ZjEE7Bs4tBSlg/OHRoguEsNWNrTAo0FKGje/13rTNGcmYNyu9/zLRNPZN7hRb
         F5kcuPOcgLnsJ48ZM6MEqPbHx74DaCLWZCZ0rz3pUBldG6FNcRPS/OXGvUGWCyJkEoP1
         UtMQ0FsEJMwzGH5GvisALoHaSokfTGm/L0Hi04A5AFu9nj0NS7Ren8l3euAqY2mBjbJv
         JsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529098; x=1787133898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5rY136w+JpL/ylEjfYfCsqSvAnSrsJPi+k0wPlzk9EU=;
        b=XN79QZs61qfvrAXg6AluIir4Co/fP49qS1EpnDlfasp3Mw5s/h1JNq8wdYf317smsG
         2H6pbjuXPBXXm4ZkUl1NEBJSq5fJHQaSwtkU+0V2numef4nwDT+2zz8pTjWly9g0eBYi
         YI+VbpvSdL0yxjrnEl6YDWlN1wcmzgaZJYMuspxKIpTHatfBGGV/nNszKfEfpYB7ViXv
         kQKorukluTgB4U4OQm4tsC+T+BvrOkIBsKrux/SZY759ZuxhC41Rc1J5F2gLyAqMXEyt
         TNF1Op+en1LLvqHYZaOL00TMtVe+Nge59oP+aN3Zhx1ZcRPFKuc6S+WWuerb975AyHEH
         SeLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp54lOfg8DrxlVZpDsHh969y9qaPX5pFYhnCfAhJ9zepM9I01/7AXVT8TAjzbqVsrcmLqzcmQuEiSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCEEQKsOLcqRjkq+aoaaejRYZwAonGSqpMfA9wzqr/xZvLvnZB
	rJ8skDcgktHs8L8zYupdsMav8YE1QGGTLsjsmpmfm9b3KBNKro1o0LrQ
X-Gm-Gg: AR+sD13yu0+qQB5fKW16mfx3LZycJ4UawC6gAowRyZ18KH1w4E6B547WR3u7o1pUA/p
	v8Ba19AOTeasX8e5wO/JtpDAGoqDCm8kOs+1VbUD18uGmCujfRbDTtw2CzdXStESvbVQq50VXrz
	24FXJR0Plfu4dEbYOgN2PR0cbAqzqYkvdL06aTjvJNoq2cED63zVXc28dnXEgIpE6oVWxHgaih0
	7sQyVL6fKyFGauH4z/9gOzpwK6MmuGr4I6nZ1c3+fPlmQVoK5EZ0n0ouDJlI5hXVTXBv7KeDEt8
	8BClBvxmUUnHOyX7cx+0PzrleySqQ6tMRJ+3lGjRb/V1Er9bMnDQv2lPexlA2aV0kQl9kkdHgjd
	g+G8jt1wlpSA8upVN8KnKkKNCRMZBEnu7DOLBeDv0Lk7a9yALv/wZN65wEbcsk6/WSkkDEgB3oc
	90ujJ99V/A6PD1rmqslQ5SCF7+U4Z+26hAWkIslDSGFihPNiEhL/GMb03pldWCi+CDuCnFFDwak
	WaFfQS4+rZMd28=
X-Received: by 2002:a17:90b:1a8b:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39301253b3bmr3943475a91.4.1786529098246;
        Wed, 12 Aug 2026 03:04:58 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:85a:5c46:85a5:ec7:8aa8:72be])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14124454d3csm8821247c88.2.2026.08.12.03.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:04:57 -0700 (PDT)
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
Subject: [PATCH 3/3] docs/mm/damon/design: fix typo of max_nr_snapshots
Date: Wed, 12 Aug 2026 18:04:33 +0800
Message-ID: <20260812100433.6288-4-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812100433.6288-1-aethernet65535@gmail.com>
References: <20260812100433.6288-1-aethernet65535@gmail.com>
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
index 1fcf0b8c044b..62ba6cc2e999 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -871,8 +871,8 @@ action is ``pageout`` while all pages of the region are unreclaimable, applying
 the action to the region will fail.
 
 Unlike normal stats, ``max_nr_snapshots`` is set by users.  If it is set as
-non-zero and ``nr_snapshots`` be same to or greater than ``nr_snapshots``, the
-scheme is deactivated. Note that, unlike watermarks, even if a scheme's
+non-zero and ``nr_snapshots`` equals or is greater than ``max_nr_snapshots``,
+the scheme is deactivated. Note that, unlike watermarks, even if a scheme's
 ``nr_snapshots`` reaches ``max_nr_snapshots``, monitoring will not stop.
 
 To know how user-space can read the stats via :ref:`DAMON sysfs interface
diff --git a/include/linux/damon.h b/include/linux/damon.h
index d642ce4fc83c..75ece3d03be2 100644
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

