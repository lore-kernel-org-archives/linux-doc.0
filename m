Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C35A2F745D
	for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 02:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784687897; cv=none; b=hTXwWDyNaTBcNNjdBrVLqk+sn8vtQ37vjD8AmC9oQClMGocDpuU73yIQABe7C29NADNhjxvItQ/2jgTmWbvog2oQGK9Z2uJlDPngsL85yE1zXVkrNkp4y2nz9SYxu3ECM/6ql/bEfN/SKICzEhAOn0HOqvZl4s01rhcO4dUwMS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784687897; c=relaxed/simple;
	bh=V1tkE/Iqm8Ll1E91rJzh6adocMuhR6hteT/6dS1xPM0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QHiqT8R/Cd9iPusbadh7+xXOJ+//Lp4dG+H4/nVU490dezFRK3nA3yuOMun/qc3yZZfgppe+DR+stjfznu0DABsrGhNTKMq1CMX4jkM048VHNAb6Upj1lb0ps4KozsU+ZiGEPVeaGheFQhNRNZbqWkEkppLObyJ8O6x1q4fkTSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jG0JqRcv; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jG0JqRcv"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784687882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ml2B/ksyU1FNvd+iabrZqVktSSMC0qeu3ATx01Yf8Tw=;
	b=jG0JqRcv9aUBRHoUTpnC+RthNmdjxiNQnok24toetuarjDeMOy5DT256Z9xD+c9NaSLoZE
	QYTWHNBQTvl9j8a/4Gvq9b6Jg2h78lsw8jzK7P5p+gi/5aCfh7M/Ij1lX0c+OcdAnxzj5i
	3fV7mMoreBPOkNcuEKiyBmOtpzSb9Dw=
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
Subject: [PATCH 0/3] tools/mm/page_owner_sort: fix --sort, add module filter, improve usage
Date: Wed, 22 Jul 2026 10:37:23 +0800
Message-Id: <20260722023726.600200-1-ye.liu@linux.dev>
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
the [module] format produced by %pS, but page_owner_sort had no way
to use them.  Records without module frames are assigned "vmlinux".

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
 tools/mm/page_owner_sort.c      | 125 +++++++++++++++++++++++++++-----
 2 files changed, 113 insertions(+), 20 deletions(-)

-- 
2.25.1

