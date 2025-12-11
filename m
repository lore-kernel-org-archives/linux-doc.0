Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C822301030;
	Thu, 11 Dec 2025 10:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765450154; cv=none; b=tFLd+4Nx6xcm6mocWlU/Cba/slYPx/yilD5PN0p5H/2yknOTLc5WvJZNdl2mRSjecOkRAiRNi3pGDZVMzYX59w6EM90VCp0Iu1y7wIZ0y56+zN6v029b5zoECJkQM/ac6RARAG2OaDE8ePFgobcxW7JFJVj25l0//x42EnZL8Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765450154; c=relaxed/simple;
	bh=5Xt0oJ1y1IK93s8ga3wLlwlKLYXyXjIeKskLsfe3lAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XsHwmPabTUTsG+XlnDxuBbERNMR5qUlC9qfcpLq3j31y3juOGrziaXqoEyawd0pP6PSMAtJCIVapsOUScdIHzPfurPQxkaju24xl0Qyd8Y/Zx7llJmv9OnW0prN3ToHKc1tjh0yByMhjLTVgoWqeLHHdeEQnxQTmaPLxTl2DLSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D3E5F175D;
	Thu, 11 Dec 2025 02:49:03 -0800 (PST)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.26.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF0073F73B;
	Thu, 11 Dec 2025 02:49:09 -0800 (PST)
From: Steven Price <steven.price@arm.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Steven Price <steven.price@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] kdoc: allow dots in inline @param names
Date: Thu, 11 Dec 2025 10:48:49 +0000
Message-ID: <20251211104851.45330-1-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inline kernel-doc blocks failed to parse tags containing dots (e.g.
creator.process_name in panfrost_gem.h) because the @name regex only
matched word characters. Modify the single-line pattern to match
doc_inline_sect so it includes \. and parses the same as a multi-line
comment.

Signed-off-by: Steven Price <steven.price@arm.com>
---
 tools/lib/python/kdoc/kdoc_parser.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 500aafc50032..261b484ad130 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -53,7 +53,7 @@ doc_content = doc_com_body + KernRe(r'(.*)', cache=False)
 doc_inline_start = KernRe(r'^\s*/\*\*\s*$', cache=False)
 doc_inline_sect = KernRe(r'\s*\*\s*(@\s*[\w][\w\.]*\s*):(.*)', cache=False)
 doc_inline_end = KernRe(r'^\s*\*/\s*$', cache=False)
-doc_inline_oneline = KernRe(r'^\s*/\*\*\s*(@[\w\s]+):\s*(.*)\s*\*/\s*$', cache=False)
+doc_inline_oneline = KernRe(r'^\s*/\*\*\s*(@\s*[\w][\w\.]*\s*):\s*(.*)\s*\*/\s*$', cache=False)
 
 export_symbol = KernRe(r'^\s*EXPORT_SYMBOL(_GPL)?\s*\(\s*(\w+)\s*\)\s*', cache=False)
 export_symbol_ns = KernRe(r'^\s*EXPORT_SYMBOL_NS(_GPL)?\s*\(\s*(\w+)\s*,\s*"\S+"\)\s*', cache=False)
-- 
2.43.0

