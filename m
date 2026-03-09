Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9809B3DA7C7;
	Mon,  9 Mar 2026 16:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074886; cv=none; b=kvO2R2mO3MD77MHM/eh5F4ivw7J3jPA7fcWsv0LvikN39kFeZLaNqi8txLvcIvYP5QhMwGzVBwV8QJU136xzDWN12sneCqMEsz9pILvj8v1A/Yv1zFZCOsbNMWU/d8WqxAX5Wgjm+Z0XNdwiERt8xIsaEf2PyskBOzDUZjIFjZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074886; c=relaxed/simple;
	bh=xi9HTFCdsv+dCAkW0Hiur3D5yVumKUkJ/b9uKkf9fw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F5oZhzjGk9prDiNmfb2ylmgMzBl2E/t6LlMf8yhqBJ+HX6ucLdAN2BmAqRzipcSidvbvfeCdR/cyR3+7OUnRnDhIseNZqv72qcn0kbN8um9+4DJegrXK9jgvFLgujBhdY6zreQMxRslgWuifhxbHM+q3h+/wLMm2/ocYr7dTGg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y8R6jAP0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y8R6jAP0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F38C2BCB0;
	Mon,  9 Mar 2026 16:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773074886;
	bh=xi9HTFCdsv+dCAkW0Hiur3D5yVumKUkJ/b9uKkf9fw8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y8R6jAP0iDqMNKIQpA+QJcNIY1PhRXYegtYcoXKlnd2t6bR1/6O8apZdpLybxfnuJ
	 nul2hkuArze/3mM/TxZ4mLcBil/xb9bl3z2Jp/61B3HvjFiRg33w6n3eGlKMGxUaXz
	 nBwpmQFLoYQ3IvgwkgrXhSdJUXsUx9sSReZK9mvJwSdMHMZNw3G7GdY3/5YIhhRo4w
	 jfDs7jMEllzSwq4cxmFr1WAPBLFfUJxgf4xv99WlGgknyKFgdrOcWPlYMsBteCUONd
	 E5zJAmM0mm2qZv11l74QkgD5KD0vrs1I4FQi/S5Zb2yEjFHiHtxWlZ3GxSNkWN0Vbn
	 FYYImXuwnbfzg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vzdm0-0000000BheJ-2rxL;
	Mon, 09 Mar 2026 17:48:04 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 6/8] docs: kdoc: use tokenizer to handle comments on structs
Date: Mon,  9 Mar 2026 17:47:57 +0100
Message-ID: <f83ee9e8c38407eaab6ad10d4ccf155fb36683cc.1773074166.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1773074166.git.mchehab+huawei@kernel.org>
References: <cover.1773074166.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Better handle comments inside structs. After those changes,
all unittests now pass:

  test_private:
    TestPublicPrivate:
        test balanced_inner_private:                                 OK
        test balanced_non_greddy_private:                            OK
        test balanced_private:                                       OK
        test no private:                                             OK
        test unbalanced_inner_private:                               OK
        test unbalanced_private:                                     OK
        test unbalanced_struct_group_tagged_with_private:            OK
        test unbalanced_two_struct_group_tagged_first_with_private:  OK
        test unbalanced_without_end_of_line:                         OK

  Ran 9 tests

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 4b3c555e6c8e..6b181ead3175 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -13,7 +13,7 @@ import sys
 import re
 from pprint import pformat
 
-from kdoc.kdoc_re import NestedMatch, KernRe
+from kdoc.kdoc_re import NestedMatch, KernRe, CTokenizer
 from kdoc.kdoc_item import KdocItem
 
 #
@@ -84,15 +84,9 @@ def trim_private_members(text):
     """
     Remove ``struct``/``enum`` members that have been marked "private".
     """
-    # First look for a "public:" block that ends a private region, then
-    # handle the "private until the end" case.
-    #
-    text = KernRe(r'/\*\s*private:.*?/\*\s*public:.*?\*/', flags=re.S).sub('', text)
-    text = KernRe(r'/\*\s*private:.*', flags=re.S).sub('', text)
-    #
-    # We needed the comments to do the above, but now we can take them out.
-    #
-    return KernRe(r'\s*/\*.*?\*/\s*', flags=re.S).sub('', text).strip()
+
+    tokens = CTokenizer(text)
+    return str(tokens)
 
 class state:
     """
-- 
2.52.0

