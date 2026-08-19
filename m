Received: from mta0.migadu.com (out-84.mta0.migadu.com [91.218.175.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C93282F3A
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 02:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787105781; cv=none; b=ZQGrxWQGCSHS1bVCVlR9UwGZ77NB4/UD7DX5csuO4lJhjBsqV84RQgyEcgqNTNWEmm9xt5NPbyAjPdvf1jzDAV8SIXpwDdmbeZ891xvzQkxc63dnjrt3y5OLlpLMN9VVJMKEHRpkCJ9CPRIiFBNN7A9iNmtXliChUTmrTs+3v98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787105781; c=relaxed/simple;
	bh=4q4HADBiida0K9D2Blnlucj+RLJw1l5XMARr9t3DAZU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m2YKw3edy7xFMNNkwoC8l8VIFBIxxTdoZu/LcF6oUuOoSlf7TimnSByVFMR01wL1xX0qfIIP1BJquQdBOBgJM5TtR8GG2Hv7Dj8gE/T0uZR9qwnmjmC7LLsZiRzyfLogc3jsx3Hxv80a2YPVA3ywdJC4NhOLJDrIZcWwR0533Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bWa4bjk/; arc=none smtp.client-ip=91.218.175.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bWa4bjk/"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4q4HADBiida0K9D2Blnlucj+RLJw1l5XMARr9t3DAZU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787105776; v=1; x=1787710576;
 b=bWa4bjk/uOt9QiFh4ZzoKKReRAGqww0LbgDjGZRAj+z9uiQbx0ldc/1sR+XHgSs2UU2I65m7
 yZOXciBQkKFBMHrYdvAmd04OUpgF4CgBU1/PswjVSFE7JNTYhd2C4XD+0Wo533bLBE0sQo94iRz
 fIKjZfUtTYdNBPo7kol7B0KE=
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost.localdomain (223.70.159.239)
	by smtp.migadu.com with ESMTPS id 817f9be3478d872c;
	Wed, 19 Aug 2026 02:16:16 +0000
X-Migadu-Flow: FLOW_OUT
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
Subject: [PATCH v3 0/3] tools/mm/page_owner_sort: fix --sort, add module filter, improve usage
Date: Wed, 19 Aug 2026 10:16:08 +0800
Message-Id: <20260819021611.2910835-1-ye.liu@linux.dev>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
 tools/mm/page_owner_sort.c      | 134 +++++++++++++++++++++++++++-----
 2 files changed, 122 insertions(+), 20 deletions(-)
---
v3:
 - Patch 1: Use fallthrough to COMP_NUM per David's review.
 - Link:https://lore.kernel.org/all/20260803062056.1518070-1-ye.liu@linux.dev/
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

