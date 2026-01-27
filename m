Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BE333BBCB;
	Tue, 27 Jan 2026 10:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508821; cv=none; b=PuluYWXG/4vPCAWe8n8onczn/r7Wq+t9eTixEUR3wF6vfu68l3F4VyPxa3X9f+8SGmvvv84e4/L557VKMOHw8fQccLKFXMHaAyCY2YGtb60f5xRdXwnj7f6MhgIquZGY6CitfcicQhy6+j8190rWdk8LO4+V/mt12fyo+XSoxZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508821; c=relaxed/simple;
	bh=+xVptzqRruVFqEOm9JgDrCeaX8+5ZVn9iOeipoWVdOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ij8RZbeVsfUBZkUfo1kgESiFcxnyjuFq7awNpk9ZTJ2+UXprIebmCNjMQMgPrPvjP5pDGOaoMwAHQ+EyOG20BqD13WwxGCNDtn1j7P5wQchBNjrmHkqlKKaRbaIuMhqP2FV7rM7xQT+fl/H6WSzPHvs8o4Hk3nxqPttGAFwMQtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRdc03mE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRdc03mE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C0F4C116C6;
	Tue, 27 Jan 2026 10:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769508821;
	bh=+xVptzqRruVFqEOm9JgDrCeaX8+5ZVn9iOeipoWVdOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LRdc03mEksiMbO5EihWeqkPc4EC65xmD5ew1lx3nf+in0wIZDbLqaSp9MqbsnO9hF
	 ZUwGbYPKO3ldcJ49bOBjZDTolEaJMl6zEopZcGujtUrZVJu6Rt55rG59XRuzbsoQXR
	 /etpug0uFo3T0iXLBT916WgSKSEvHukI/K4pv+RhbDLuSdnBCGJZxT5UNafyPv4qrN
	 QIopQFKp7zftXQ/ysmiZtK2l5VbX469blgKHyWE489VgWUAc2bVyPHNeb5f5YmCHQz
	 nNJX91CewqfBo9NX8VfdXKx6GE2XSjpdlCu+DVVkh6cfEFcGuuWnxLMwXEvmx3NKBe
	 cyVX9A9Xvnq3w==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vkg4p-0000000BVKx-2ET0;
	Tue, 27 Jan 2026 11:13:39 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 04/14] docs: kdoc_parser: don't mangle with function defines
Date: Tue, 27 Jan 2026 11:13:23 +0100
Message-ID: <2ef0ce1d668207cdbab9ffe9ebb568c9f4135de7.1769508371.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769508371.git.mchehab+huawei@kernel.org>
References: <cover.1769508371.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Mangling with #defines is not nice, as we may end removing
the macro names, preventing several macros from being properly
documented.

Also, on defines, we have something like:

	#define foo(a1, a2, a3, ...)			 \
		/* some real implementation */

The prototype part (first line on this example) won't contain
any macros, so no need to apply any regexes on it.

With that, move the apply_transforms() logic to ensure that
it will be called only on functions.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index de75b102dd64..834a527542b3 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -166,7 +166,7 @@ struct_nested_prefixes = [
 #
 # Transforms for function prototypes
 #
-function_xforms  = [
+function_xforms = [
     (KernRe(r"^static +"), ""),
     (KernRe(r"^extern +"), ""),
     (KernRe(r"^asmlinkage +"), ""),
@@ -1049,10 +1049,7 @@ class KernelDoc:
         found = func_macro = False
         return_type = ''
         decl_type = 'function'
-        #
-        # Apply the initial transformations.
-        #
-        prototype = apply_transforms(function_xforms, prototype)
+
         #
         # If we have a macro, remove the "#define" at the front.
         #
@@ -1071,6 +1068,11 @@ class KernelDoc:
                 declaration_name = r.group(1)
                 func_macro = True
                 found = True
+        else:
+            #
+            # Apply the initial transformations.
+            #
+            prototype = apply_transforms(function_xforms, prototype)
 
         # Yes, this truly is vile.  We are looking for:
         # 1. Return type (may be nothing if we're looking at a macro)
-- 
2.52.0

