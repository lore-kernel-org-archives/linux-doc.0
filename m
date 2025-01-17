Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4742B1A2642;
	Fri, 17 Jan 2025 17:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737136795; cv=none; b=b8h9s7Vu7DiD4987P9CfE/JWDZpcS8Ek+hA80hbLxd9d/1vBl+ovYOEjMSGhq/Me8AJO7KC0wUfhVYz+IVwNEQmxbzt5vsGp5ZHhv/bcpCvK9Bi+mwEf1aa4L4hoUHW8BBVsTsgPFm1pqf3iixF+pUtDIA7I94EandlvOqZMuZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737136795; c=relaxed/simple;
	bh=SxtEHDFzMPJqPTT2w14O7dlMQf1Le6Zyc610CsiBD+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OmEnK6Yxhp/bqIDpU1H/+RO01/8NWaCRjV0u7/7RbGM1/XRBX7OTb4b1M1TUpkL9o1V3yLpPRiUGTw4j6DicwqPwX0YJG9K4YofOSHpXFO0M02mWx351aCPlEXsoDCJW1ZCnh5yPrZa1TZvw0682ZsmHXJTf+4byhEsIDfYghYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSVlfJWt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSVlfJWt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BC0C4CEE0;
	Fri, 17 Jan 2025 17:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737136794;
	bh=SxtEHDFzMPJqPTT2w14O7dlMQf1Le6Zyc610CsiBD+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GSVlfJWtaL/eKb251XrnnWKu6+++bcVwWPUwUEMbUd/ZhEhJcCg/NUoRhPFqO8sNB
	 8e1Rg1N0PCMf5cSp6ZMr5nyrrN3BedAh427YE5grxlcG/mdP4BCAJ4tu+4XLsbOn60
	 a9C8u0f+1Dhl1QwkXlb+kUQEPJ2gg/4MYuggwDfijQxZixFrtRXmdE8O4/2fI3BsWA
	 EEZwhioL+JKwa5l0+4HVKuw3FEr0l54WyqPGjkycAAt2sqR/o97rQS2fygobWtDYGz
	 jPIZSd/FQ2cH8UUWbaOPI6gxaa7eI/AyxcYevvJCjV6jWpE5nLBUH94YsqrTw+1Kaw
	 1Kbg0qGa7+0pg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tYqdM-00000006Ak3-2SFm;
	Fri, 17 Jan 2025 18:59:52 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 09/10] [RFC] docs: use get_abi.py for ABI generation
Date: Fri, 17 Jan 2025 18:59:38 +0100
Message-ID: <a3a6826a36eab823e47b63e90e63cefdc6df8eba.1737135484.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1737135484.git.mchehab+huawei@kernel.org>
References: <cover.1737135484.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Use the new script instead of the old one when generating ABI docs.

For now, execute it via exec. A future version may just import the
class.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/abi-obsolete.rst |  1 -
 Documentation/admin-guide/abi-removed.rst  |  1 -
 Documentation/admin-guide/abi-stable.rst   |  1 -
 Documentation/admin-guide/abi-testing.rst  |  1 -
 Documentation/sphinx/kernel_abi.py         | 10 +++-------
 5 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/Documentation/admin-guide/abi-obsolete.rst b/Documentation/admin-guide/abi-obsolete.rst
index 594e697aa1b2..1adc74047ed1 100644
--- a/Documentation/admin-guide/abi-obsolete.rst
+++ b/Documentation/admin-guide/abi-obsolete.rst
@@ -8,4 +8,3 @@ The description of the interface will document the reason why it is
 obsolete and when it can be expected to be removed.
 
 .. kernel-abi:: ABI/obsolete
-   :rst:
diff --git a/Documentation/admin-guide/abi-removed.rst b/Documentation/admin-guide/abi-removed.rst
index f9e000c81828..61d247a5d296 100644
--- a/Documentation/admin-guide/abi-removed.rst
+++ b/Documentation/admin-guide/abi-removed.rst
@@ -2,4 +2,3 @@ ABI removed symbols
 ===================
 
 .. kernel-abi:: ABI/removed
-   :rst:
diff --git a/Documentation/admin-guide/abi-stable.rst b/Documentation/admin-guide/abi-stable.rst
index fc3361d847b1..445964b5b997 100644
--- a/Documentation/admin-guide/abi-stable.rst
+++ b/Documentation/admin-guide/abi-stable.rst
@@ -11,4 +11,3 @@ Most interfaces (like syscalls) are expected to never change and always
 be available.
 
 .. kernel-abi:: ABI/stable
-   :rst:
diff --git a/Documentation/admin-guide/abi-testing.rst b/Documentation/admin-guide/abi-testing.rst
index 19767926b344..6869dfe895a3 100644
--- a/Documentation/admin-guide/abi-testing.rst
+++ b/Documentation/admin-guide/abi-testing.rst
@@ -17,4 +17,3 @@ name to the description of these interfaces, so that the kernel
 developers can easily notify them if any changes occur.
 
 .. kernel-abi:: ABI/testing
-   :rst:
diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 5911bd0d7965..5970bd077a6d 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -14,7 +14,7 @@ u"""
     :license:    GPL Version 2, June 1991 see Linux/COPYING for details.
 
     The ``kernel-abi`` (:py:class:`KernelCmd`) directive calls the
-    scripts/get_abi.pl script to parse the Kernel ABI files.
+    scripts/get_abi.py script to parse the Kernel ABI files.
 
     Overview of directive's argument and options.
 
@@ -67,7 +67,6 @@ class KernelCmd(Directive):
 
     option_spec = {
         "debug"     : directives.flag,
-        "rst"       : directives.unchanged
     }
 
     def run(self):
@@ -78,15 +77,12 @@ class KernelCmd(Directive):
         srctree = os.path.abspath(os.environ["srctree"])
 
         args = [
-            os.path.join(srctree, 'scripts/get_abi.pl'),
+            os.path.join(srctree, 'scripts/get_abi.py'),
+            '-D', os.path.join(srctree, 'Documentation', self.arguments[0]),
             'rest',
             '--enable-lineno',
-            '--dir', os.path.join(srctree, 'Documentation', self.arguments[0]),
         ]
 
-        if 'rst' in self.options:
-            args.append('--rst-source')
-
         lines = subprocess.check_output(args, cwd=os.path.dirname(doc.current_source)).decode('utf-8')
         nodeList = self.nestedParse(lines, self.arguments[0])
         return nodeList
-- 
2.47.1

