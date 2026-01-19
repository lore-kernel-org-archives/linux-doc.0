Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8B52FE05D;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839814; cv=none; b=WbvhmiAI+soPtoPE/cPslUCVAhzDEYdm/HbBOFt1bM//wqFfxBAHrmFj9Ep+eUuIlNBhbAtWbH0jKAh+LyVieTbHdh0RpwkS96J4eowRPrlinHIa/fopM/iLoBhILwMSxZFuxGBOQJ52DYZ8GV+BPb+vKYBn1guRy8rwI6IkupM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839814; c=relaxed/simple;
	bh=8E4r/s6Y7smA5NIglr3ktHdSZHhdGR4bBEvyzy03zT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QyD+nmunfv8lDfQ2uSLrhk//iy7Z4bZB5qlM2CyhAWg25/SqCv/Fngia/eVg51c8iJihB3cytiYKO1kmZUrpBkdbNjwd7wjJqHMmUHYcMG60Qw6YUXZ2wkDk509YquYm2ElSUiPcPhrHEicJjmpC+iblY95O78rMh80OVIoBzis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GvCJSL7f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GvCJSL7f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB7AC2BCFC;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=8E4r/s6Y7smA5NIglr3ktHdSZHhdGR4bBEvyzy03zT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GvCJSL7fFUz/LtAB3A2ZK+UEpWTUHPg6vLV92P46b+XbI5ddHsZfGM8GnXJ46wd0R
	 IjWlQXqOhDalkiv2OuAeQwODkSTtp0qXfdGSZSD+lc4m+WChCYQ0IjGJ9f7YgbCMfy
	 IhLUPxZ/ceIWwy6k0H7jDQMAbIfmcbi8tx0sQbY2DHplmhaEmHljQ8jyQUMZVTNm0Q
	 yrmBInbPWsk8SrKofn4VXBtX2WPPb2ip5EraC2XWYPBcKpNhpRkTM2KdvDL8oRDIsk
	 UPbaP4LVIbYCz3M//Tze12gZsOQGZO65cQvWxa5rD8ktsPnj/ngHTZ/xTJ3zsNHKtY
	 l3AkJ8xSna+nA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j2W-2Lkp;
	Mon, 19 Jan 2026 17:23:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 18/25] docs: python: abi_regex: do some improvements at documentation
Date: Mon, 19 Jan 2026 17:23:21 +0100
Message-ID: <5419ad89a5042c1571198c2f055866674808579b.1768838938.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768838938.git.mchehab+huawei@kernel.org>
References: <cover.1768838938.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Add documentation for two consts and ensure that all sentenses
will end with a dot.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/abi/abi_regex.py | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/tools/lib/python/abi/abi_regex.py b/tools/lib/python/abi/abi_regex.py
index d5553206de3c..d0c5e3ede6b5 100644
--- a/tools/lib/python/abi/abi_regex.py
+++ b/tools/lib/python/abi/abi_regex.py
@@ -16,10 +16,22 @@ from abi.abi_parser import AbiParser
 from abi.helpers import AbiDebug
 
 class AbiRegex(AbiParser):
-    """Extends AbiParser to search ABI nodes with regular expressions"""
+    """
+    Extends AbiParser to search ABI nodes with regular expressions.
 
-    # Escape only ASCII visible characters
+    There some optimizations here to allow a quick symbol search:
+    instead of trying to place all symbols altogether an doing linear
+    search which is very time consuming, create a tree with one depth,
+    grouping similar symbols altogether.
+
+    Yet, sometimes a full search will be needed, so we have a special branch
+    on such group tree where other symbols are placed.
+    """
+
+    #: Escape only ASCII visible characters.
     escape_symbols = r"([\x21-\x29\x2b-\x2d\x3a-\x40\x5c\x60\x7b-\x7e])"
+
+    #: Special group for other nodes.
     leave_others = "others"
 
     # Tuples with regular expressions to be compiled and replacement data
@@ -88,13 +100,15 @@ class AbiRegex(AbiParser):
         # Recover plus characters
         (re.compile(r"\xf7"), "+"),
     ]
+
+    #: Regex to check if the symbol name has a number on it.
     re_has_num = re.compile(r"\\d")
 
-    # Symbol name after escape_chars that are considered a devnode basename
+    #: Symbol name after escape_chars that are considered a devnode basename.
     re_symbol_name =  re.compile(r"(\w|\\[\.\-\:])+$")
 
-    # List of popular group names to be skipped to minimize regex group size
-    # Use AbiDebug.SUBGROUP_SIZE to detect those
+    #: List of popular group names to be skipped to minimize regex group size
+    #: Use AbiDebug.SUBGROUP_SIZE to detect those.
     skip_names = set(["devices", "hwmon"])
 
     def regex_append(self, what, new):
@@ -148,7 +162,7 @@ class AbiRegex(AbiParser):
     def get_regexes(self, what):
         """
         Given an ABI devnode, return a list of all regular expressions that
-        may match it, based on the sub-groups created by regex_append()
+        may match it, based on the sub-groups created by regex_append().
         """
 
         re_list = []
-- 
2.52.0

