Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01A939733E
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 06:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738127; cv=none; b=uC6Gp7aBAyNefGwnvmBJ7JHze/dG3ohZ0QzQvYlTHl/T8EIS4iWEBhcmqopKOkUR6jiQSQAzWILLzwrrnmutwhAxrdaCQ3NYRTuQQqEPI4mHADal/IU4cPdy0rcGA2uEsAy3WLW0wtY+ButZi7SBzESZzVHFV2KLxH6/XpwxBlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738127; c=relaxed/simple;
	bh=RGVucR04hfZ25inLk7EYpUcqpdjuyQS/+ajU7ajzzrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bRRO+BHyap/fNaCUg8O+Rf/xN19kKXRNb+gGycWXcUF0TI1WucpGpwK9ICLDRBh1hmRu7BBvEMnWp8yHK+eRGUb/hy5BcRLnuTNFwoudzUVmMqyos3H2W5ENjeVpJTv4Pysdzqs1rNrZq/UiXKlMS3MnHWPOJn3I8vFrH/6MRkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QR4RRCzo; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QR4RRCzo"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785738123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l14XFaHja8SkCVrzQL34bHRSsjPVNxuVLQml/d9+YaA=;
	b=QR4RRCzoJMvQic8P0H2GCo2necBHge0T2l4fn2VBtwgq8BASSaU3qhIbt2jHuC1ARmESLP
	XDq7v2vSz4XRM7vXN/Pc2J1+9z+j0yezogPli2LhV8Jl0QSD9h5UdHBx5IhW48my8TRLo4
	JIbg7JU9CGdrCIhEKN3Eecig49j4bMw=
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
Subject: [PATCH v2 3/3] tools/mm/page_owner_sort: show available sort keys in usage text
Date: Mon,  3 Aug 2026 14:20:56 +0800
Message-Id: <20260803062056.1518070-4-ye.liu@linux.dev>
In-Reply-To: <20260803062056.1518070-1-ye.liu@linux.dev>
References: <20260803062056.1518070-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ye Liu <liuye@kylinos.cn>

The --sort option accepts abbreviated or complete key names, but the
usage text never listed them.  Users had to read the source or the
documentation to discover valid keys.

List all available keys (full form and abbreviation) with a brief
description and examples directly in the --sort help section.

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 tools/mm/page_owner_sort.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/mm/page_owner_sort.c b/tools/mm/page_owner_sort.c
index 70d1c76561e8..c5bc3b524c0a 100644
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

