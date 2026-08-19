Received: from mta0.migadu.com (out-109.mta0.migadu.com [91.218.175.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9693BB107
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 02:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787105792; cv=none; b=JSM3X1WqxYadgLiFYzIZ03DiXSVoLKDeWD+l3QD1tguvdzwa7ltabOzw3bgcalWK8YIFIngEcbwNGAqwERdRJk20zDYR4S8FcvZGNUlHwziW5TKqmBceW5LnFWcRmGrnLLMeiZpFusWqbrzusPMsf/uJxXyyeqH6gA1UtpnP0tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787105792; c=relaxed/simple;
	bh=+IgmQ3QdqUivnU4s8tJXVFnhCQ/DhysrQg5XBqnFDwM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dFmkvvewGyRUP6soGetAaDTyPaExreXtWD54GbRZfGmVRATEqQSzOBJjayCOofN4UmVdPfGGXZdYeH8zZku5r4MqVUFmeDbQzp73iyMwxV3b8LwI6tstIPyoJQFn3PDOdHDgmJScq96o67+upe8gCycVA6SPohiqjO3eUxou51E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Zfqpwbf5; arc=none smtp.client-ip=91.218.175.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Zfqpwbf5"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+IgmQ3QdqUivnU4s8tJXVFnhCQ/DhysrQg5XBqnFDwM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787105789; v=1; x=1787710589;
 b=Zfqpwbf5U/5+irehiTBSG3Xey7pY7NKYFdg6tnFtteZLpxydiOEdTn8EVH9W2Ebsm1h6fVsP
 DoJmwSDWj/Lw/AnW+LRvMX29gBxEnYtBMBvv0S7VNPcHdjqHy9H2mdTz8TXiBpXTmuHuybj0KXr
 U5txFejm6WFKmpE1e5vMuR1k=
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost.localdomain (223.70.159.239)
	by smtp.migadu.com with ESMTPS id 3ab2666dcb9d8750;
	Wed, 19 Aug 2026 02:16:29 +0000
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
Subject: [PATCH v3 3/3] tools/mm/page_owner_sort: show available sort keys in usage text
Date: Wed, 19 Aug 2026 10:16:11 +0800
Message-Id: <20260819021611.2910835-4-ye.liu@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260819021611.2910835-1-ye.liu@linux.dev>
References: <20260819021611.2910835-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ye Liu <liuye@kylinos.cn>

The --sort option accepts abbreviated or complete key names, but the
usage text never listed them.  Users had to read the source or the
documentation to discover valid keys.

List all available keys (full form and abbreviation) with a brief
description and examples directly in the --sort help section.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
 tools/mm/page_owner_sort.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/mm/page_owner_sort.c b/tools/mm/page_owner_sort.c
index 10a814ba5301..5c1b23c0ed8c 100644
--- a/tools/mm/page_owner_sort.c
+++ b/tools/mm/page_owner_sort.c
@@ -772,6 +772,15 @@ static void usage(void)
 		"\t\t\targument in the form of a comma-separated list with some\n"
 		"\t\t\tcommon fields predefined (pid, tgid, comm, stacktrace, allocator, module)\n"
 		"--sort <order>\t\tSpecify sort order as: [+|-]key[,[+|-]key[,...]]\n"
+		"\t\t\tAvailable keys:\n"
+		"\t\t\t  pid(p), tgid(tg), name(n), stacktrace(st),\n"
+		"\t\t\t  txt(T), alloc_ts(at), allocator(ator), module(mod)\n"
+		"\t\t\tThe \"+\" is optional since default direction is\n"
+		"\t\t\tincreasing numerical or lexicographic order.\n"
+		"\t\t\tMixed use of abbreviated and complete-form is allowed.\n"
+		"\t\t\tExamples:\n"
+		"\t\t\t  --sort=n,+pid,-tgid\n"
+		"\t\t\t  --sort=mod,at\n"
 	);
 }
 
-- 
2.25.1

