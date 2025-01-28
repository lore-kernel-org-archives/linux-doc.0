Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F402BEAF6;
	Tue, 28 Jan 2025 00:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022797; cv=none; b=du6LSgEVOVeTBnLNW0zrBKmKbUJCMqFMw1UVM3ASJKzpeu51RqoZCCee3xcOMEfr1h1OITWdQvPZmQOjlB6wxe25HtZTLmOPnJOywdxaiuNdfMtO3i/Cj5bTzdzqLNT27PlWHVEjqSGb1b87xG1jKfKD07Ho04IpR5Lx29lFyv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022797; c=relaxed/simple;
	bh=Kz1uLR2W8G1KJ3PcmTy6dzY11GbizJ0wg4lGv6G2Aa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X9EGA8+5BaPLgSXcc2LuVAsVaIZom+vi9vht9WY8/cUMb6zvN0dQFj8Oq32POcy6Y/7CWA+lc1ACraeoc2yIbasBFA1eO6OgZ5NBMxnPQmF1eWMc0GvQxb0KQp9F8EiHHmKcf5Id3Z7D803wmkfUq+zjyrN6j1Ij8pkZgQXOwJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q37w48HH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q37w48HH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB192C4CEF3;
	Tue, 28 Jan 2025 00:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022795;
	bh=Kz1uLR2W8G1KJ3PcmTy6dzY11GbizJ0wg4lGv6G2Aa0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q37w48HH8J8UhYsLOIflAod5F6g8oZbCRRoGS3TMca6/9L+Fc3u9+T/P5xL4DGhRY
	 JJqImBsK4hxEeha3G3MmEIt4To/DdfN4wS6Pu/NXqsBbtzrdpRARp+Eu1Sx2TwBSF2
	 8jpzAc9IB2MiPG2TKTnb3GDl1YGQy68wUB850/OILqwNNZx1jnSm4vpI33DoYcYHKo
	 8S4Ncj4b9dPn0kRL6+zlEjG9luu1nROyx4Mvh46mWJiQVT05lpokoJ5Qbzk83dO0LP
	 gg0wmIze/oXY6UPvqAZycy925XR9pNhA1gERnW+7oWQABkx0iBtEaMjDuJN0XzIcRU
	 gMG8GUb9ucNZA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7h-0000000DRLL-45hO;
	Tue, 28 Jan 2025 01:06:33 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 15/38] docs: use get_abi.py for ABI generation
Date: Tue, 28 Jan 2025 01:06:04 +0100
Message-ID: <54e28a202be41992fa74ffac8c4ee12bb9e9adf5.1738020236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738020236.git.mchehab+huawei@kernel.org>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Use the new script instead of the old one when generating ABI docs.

For now, execute it via exec. Future changes will better integrate it
by using the class defined there directly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/abi-obsolete.rst |  1 -
 Documentation/admin-guide/abi-removed.rst  |  1 -
 Documentation/admin-guide/abi-stable.rst   |  1 -
 Documentation/admin-guide/abi-testing.rst  |  1 -
 Documentation/sphinx/kernel_abi.py         | 10 +++-------
 5 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/Documentation/admin-guide/abi-obsolete.rst b/Documentation/admin-guide/abi-obsolete.rst
index b655615917f1..6d4d9ab7b8c3 100644
--- a/Documentation/admin-guide/abi-obsolete.rst
+++ b/Documentation/admin-guide/abi-obsolete.rst
@@ -10,4 +10,3 @@ The description of the interface will document the reason why it is
 obsolete and when it can be expected to be removed.
 
 .. kernel-abi:: ABI/obsolete
-   :rst:
diff --git a/Documentation/admin-guide/abi-removed.rst b/Documentation/admin-guide/abi-removed.rst
index ba941c1af178..9fc78af6f077 100644
--- a/Documentation/admin-guide/abi-removed.rst
+++ b/Documentation/admin-guide/abi-removed.rst
@@ -4,4 +4,3 @@ ABI removed symbols
 ===================
 
 .. kernel-abi:: ABI/removed
-   :rst:
diff --git a/Documentation/admin-guide/abi-stable.rst b/Documentation/admin-guide/abi-stable.rst
index 5d738f345333..c47c2a295865 100644
--- a/Documentation/admin-guide/abi-stable.rst
+++ b/Documentation/admin-guide/abi-stable.rst
@@ -13,4 +13,3 @@ Most interfaces (like syscalls) are expected to never change and always
 be available.
 
 .. kernel-abi:: ABI/stable
-   :rst:
diff --git a/Documentation/admin-guide/abi-testing.rst b/Documentation/admin-guide/abi-testing.rst
index a867e6578bf7..40b31985e587 100644
--- a/Documentation/admin-guide/abi-testing.rst
+++ b/Documentation/admin-guide/abi-testing.rst
@@ -19,4 +19,3 @@ name to the description of these interfaces, so that the kernel
 developers can easily notify them if any changes occur.
 
 .. kernel-abi:: ABI/testing
-   :rst:
diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index a1887b50a900..fc7500fad119 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -14,7 +14,7 @@ u"""
     :license:    GPL Version 2, June 1991 see Linux/COPYING for details.
 
     The ``kernel-abi`` (:py:class:`KernelCmd`) directive calls the
-    scripts/get_abi.pl script to parse the Kernel ABI files.
+    scripts/get_abi.py script to parse the Kernel ABI files.
 
     Overview of directive's argument and options.
 
@@ -66,7 +66,6 @@ class KernelCmd(Directive):
 
     option_spec = {
         "debug"     : directives.flag,
-        "rst"       : directives.unchanged
     }
 
     def run(self):
@@ -77,15 +76,12 @@ class KernelCmd(Directive):
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
2.48.1

