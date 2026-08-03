Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07079463
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 06:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738117; cv=none; b=pgP7tvRk/MOVY1rInPXInw0UruYxXf803IeSYcPHsG/dwE0KGZh3BPO7qqFhap8/xHuKC/qbroi7FujVs1BuvwZRFZAqtGnJX6LIqQsm3rl68l5qXiB8euR6qkuPNXLlsP8+KvnfNnwZnHHiDsVUoSKyy28HXFW9+C3kRHXf+OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738117; c=relaxed/simple;
	bh=3T+/DKd+zxVubxYRaS8FcMZwD57sBWF4MdrCwuuAiqw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k1XDBrgX4VOj9E+ZdhUpFLKP1+pN86r7XhlHOPh8le2IarFSGGHw0Fzx/fGwc9DCLBKPcQlUpVmL/U/e0fNjH3WXahkO3YnhDopIns1qoG9kvbHpqsSN11JmdRkywz7AbGWyux3hxYEawhbEX42Lh+QAaNbO45JNZDRWQht4LJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eDIQEkdK; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eDIQEkdK"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785738112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WHgL7q6z3CErxPHvG+ihsc36p4rExS74ePzEBVIZczI=;
	b=eDIQEkdKSqUxjkFWRpEuniHO0LGOE4/4kwl/QPsPV1NGJ1SFLv1Mh68jSLjF8zpw87rZsO
	TKuvN74DSwzpXsYdXhDjSshfiXAS4f8TvZ4VW8bULIjJMMpvaOkGL6FgXf+isjMnr6TK4h
	HB+0yntqP7v481n2+yWdFQC6Ot1bxno=
From: Ye Liu <ye.liu@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ye Liu <liuye@kylinos.cn>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] tools/mm/page_owner_sort: fix --sort, add module filter, improve usage
Date: Mon,  3 Aug 2026 14:20:53 +0800
Message-Id: <20260803062056.1518070-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ye Liu <liuye@kylinos.cn>

This series improves the page_owner_sort tool with a bug fix, a new
module-name feature, and better usage text.

Patch 1 fixes a long-standing bug where --sort was silently ignored
when used without a short option (-a, -m, -p, etc.).  The COMP_NO_FLAG
case fell through to COMP_NUM and overwrote the sort conditions
configured by parse_sort_args().

Patch 2 adds kernel module name support for sort, cull, and filter
operations.  Page owner stack traces already contain module names in
the "function+0xNN/0xNN [module]" format produced by %pS, but
page_owner_sort had no way to use them.  Records without module frames
are assigned "vmlinux".

  # Aggregate page usage per module
  ./page_owner_sort input.txt output.txt --cull=mod

  # Filter to records from xfs module only
  ./page_owner_sort input.txt output.txt --module xfs

  # Sort by module name, then by pid descending
  ./page_owner_sort input.txt output.txt --sort=mod,-pid

Patch 3 lists all available sort keys with abbreviations and examples
directly in the --sort help section so users no longer need to read
the source to discover valid keys.

Ye Liu (3):
  tools/mm/page_owner_sort: fix --sort option being silently ignored
  tools/mm/page_owner_sort: add module name sort/cull/filter support
  tools/mm/page_owner_sort: show available sort keys in usage text

 Documentation/mm/page_owner.rst |   8 +-
 tools/mm/page_owner_sort.c      | 135 +++++++++++++++++++++++++++-----
 2 files changed, 123 insertions(+), 20 deletions(-)
---
v2:
 - Patch 2: use regexec() directly in get_module() instead of search_pattern()
   to avoid excessive debug spam for the common vmlinux case when debug_on is true
 - Patch 2: anchor module regex to stack trace format "+0xNN/0xNN [module]" to
   prevent false matches on kernel thread comm names like [khugepaged]
 - Patch 2: add '-' to regex character class to support modules with hyphens
   (e.g. aa-bb-cc)
 - Link:https://lore.kernel.org/all/20260722023726.600200-1-ye.liu@linux.dev/

-- 
2.25.1

