Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D9C2ED141;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839814; cv=none; b=t5XDzEyc2WVf9YSUl8xEzq1BNbJFq5Rlx4vW5aP98QniAR+rC4+eePG+QfN3CYy7gK6kBNng67GRNAlbqL4bNkF1NBtwpLme0cjiwRbMculrOE22uLS+t8xezIa7dPmXXdkSzep/v6oiPIToB6xK8yd6Ti3Yq8D+FixvIetUvvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839814; c=relaxed/simple;
	bh=AT9QRc72PaX75+hy9TLUQhCbT/HxXyi982eiR6wBTwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Za4/qOREt7AwAKgLw3tWXp0aPIBbUJwcVqPo4ZPfUmpjXaybnzaIwLDREc5I3wrvGUIbNADwog20g5rjM2fAJThJ3D+Wm/mR7IyYl/c0X9YhlUEJid110bqZN0dCxzarLBMi2aeLIko3bq2yux8GP9pvWzgAzOuBUN+xl16lGiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUBhz+mE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oUBhz+mE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E28BC2BCB2;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=AT9QRc72PaX75+hy9TLUQhCbT/HxXyi982eiR6wBTwU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oUBhz+mE+VQypBJfENSOxgKBKsis1kBEXhuXOWOm1g2q+6qtbAEIHCfG3lDhax88Q
	 EEPBWHPGaDGnwfIwUo4nmHMsvSfhudNf8I2vAsQI2sE0y1gKu9zSaoAEAGW63T5QLf
	 z9rhp2MKN6mbEqJaC4kog4RU78rhTIv0Q3VUB5tgtrzora5uBIaJcHpj+5BL7W0Tc/
	 ayFSRfj0FbXXYNLStbV6D86M2CEfowTPQs/goRkjlLsblkwgSWRZcNLgDPvNIg6Fv/
	 UE8HTAyEO+N81bgFWp0RjOC8nHf+10ZaS2uGgC4329+5c/FYeu1thz5vcAQMXU7B1V
	 G+/PPDODEJGhQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j24-1ZqU;
	Mon, 19 Jan 2026 17:23:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 11/25] docs: kdoc_re: Improve docstrings and comments
Date: Mon, 19 Jan 2026 17:23:14 +0100
Message-ID: <14a12a43144d52345bfd405d0401d246f0885acf.1768838938.git.mchehab+huawei@kernel.org>
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

In preparation to document kernel-doc module, improve its
documentation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_re.py | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_re.py b/tools/lib/python/kdoc/kdoc_re.py
index 2dfa1bf83d64..2816bd9f90f8 100644
--- a/tools/lib/python/kdoc/kdoc_re.py
+++ b/tools/lib/python/kdoc/kdoc_re.py
@@ -51,6 +51,9 @@ class KernRe:
         """
         return self.regex.pattern
 
+    def __repr__(self):
+        return f're.compile("{self.regex.pattern}")'
+
     def __add__(self, other):
         """
         Allows adding two regular expressions into one.
@@ -61,7 +64,7 @@ class KernRe:
 
     def match(self, string):
         """
-        Handles a re.match storing its results
+        Handles a re.match storing its results.
         """
 
         self.last_match = self.regex.match(string)
@@ -69,7 +72,7 @@ class KernRe:
 
     def search(self, string):
         """
-        Handles a re.search storing its results
+        Handles a re.search storing its results.
         """
 
         self.last_match = self.regex.search(string)
@@ -77,28 +80,28 @@ class KernRe:
 
     def findall(self, string):
         """
-        Alias to re.findall
+        Alias to re.findall.
         """
 
         return self.regex.findall(string)
 
     def split(self, string):
         """
-        Alias to re.split
+        Alias to re.split.
         """
 
         return self.regex.split(string)
 
     def sub(self, sub, string, count=0):
         """
-        Alias to re.sub
+        Alias to re.sub.
         """
 
         return self.regex.sub(sub, string, count=count)
 
     def group(self, num):
         """
-        Returns the group results of the last match
+        Returns the group results of the last match.
         """
 
         return self.last_match.group(num)
@@ -110,7 +113,7 @@ class NestedMatch:
     even harder on Python with its normal re module, as there are several
     advanced regular expressions that are missing.
 
-    This is the case of this pattern:
+    This is the case of this pattern::
 
             '\\bSTRUCT_GROUP(\\(((?:(?>[^)(]+)|(?1))*)\\))[^;]*;'
 
@@ -121,6 +124,7 @@ class NestedMatch:
     replace nested expressions.
 
     The original approach was suggested by:
+
         https://stackoverflow.com/questions/5454322/python-how-to-match-nested-parentheses-with-regex
 
     Although I re-implemented it to make it more generic and match 3 types
-- 
2.52.0

