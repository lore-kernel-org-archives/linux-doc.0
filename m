Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E064B30AAAE;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839815; cv=none; b=r/16ppy9sC5b+8XlhoGmmJ+6FmQ9GkFr9c2R1FAScuouxFi2CswTvFSc+9rMWRQ+Pt1ssW15beri9Hb6iIeIWNJSYUpkUVnXTj/c4Yg097UlSfUspeuZFQOWAsJNG1ZsP+bdn/5kKuEDeKL4PS0oLKWZTASfs5MLPfdxrr3HBbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839815; c=relaxed/simple;
	bh=KGpR4v2g6e7qWnJ0WpTGEj6sxp/k07RotpfNnId0sdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=POBYcIiXeptRpMNX03i4De3Rkk78F4ZROxT0DK1UWBhk+tT9Ivb/oiTab7JVj8XKzSOgZbYhT73MyHCJJDqVDN6fN70+7TOUce0I+IbwWkPQ9PCU7e+F1MD9tJTIdw+dk+rzosQcO3ugZ2pPtJPTpeMHOY3j5kJC5hp/7vO4kAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1oBQMaV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1oBQMaV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4F8C2BCF6;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=KGpR4v2g6e7qWnJ0WpTGEj6sxp/k07RotpfNnId0sdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e1oBQMaVmHSJRQ4YHLaniWoZWdd/nL2tOi6Bewme1B0qL+5NeT2EuLaz7Cshq9k5m
	 J90hvdXHZbNcqaelzpjQPsuCGUMpPwOSv/WRM2/nkwBw/Lscsfqn4Ge6fDbt2++NUY
	 kN3UbW5/OX4b1DT+BU4KDyIwyh7HsiW1cUlHfhgeNSdGXOB+PpuKqfGadi5lawwM41
	 lpIc4uiKvWRe6jdvPbJCHI+uVOitdBzkrR1EtWdZyFg1dUAZmznkxDmzLNtyfj+aBx
	 5toqI0k43/iInby3E0vAnj0shpUrVou1XhXe1bpc6v+vgaBB6laAwB8gc2WSqG+E9F
	 iYcA4CNH9PRqw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j30-37Jk;
	Mon, 19 Jan 2026 17:23:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 25/25] docs: parse_features: make documentation more consistent
Date: Mon, 19 Jan 2026 17:23:28 +0100
Message-ID: <3722f10361638561a5ced18cf4f409930c88270b.1768838938.git.mchehab+huawei@kernel.org>
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

Do some changes to:
- add missing documentation strings to vars;
- add a missing docstring;
- ensure that phases will end with a period.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/feat/parse_features.py | 27 ++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/tools/lib/python/feat/parse_features.py b/tools/lib/python/feat/parse_features.py
index b88c04d3e2fe..41a51d9d6f62 100755
--- a/tools/lib/python/feat/parse_features.py
+++ b/tools/lib/python/feat/parse_features.py
@@ -21,14 +21,25 @@ class ParseFeature:
     from it.
     """
 
+    #: feature header string.
     h_name = "Feature"
+
+    #: Kernel config header string.
     h_kconfig = "Kconfig"
+
+    #: description header string.
     h_description = "Description"
+
+    #: subsystem header string.
     h_subsys = "Subsystem"
+
+    #: status header string.
     h_status = "Status"
+
+    #: architecture header string.
     h_arch = "Architecture"
 
-    # Sort order for status. Others will be mapped at the end.
+    #: Sort order for status. Others will be mapped at the end.
     status_map = {
         "ok":   0,
         "TODO": 1,
@@ -40,7 +51,7 @@ class ParseFeature:
 
     def __init__(self, prefix, debug=0, enable_fname=False):
         """
-        Sets internal variables
+        Sets internal variables.
         """
 
         self.prefix = prefix
@@ -63,11 +74,13 @@ class ParseFeature:
         self.msg = ""
 
     def emit(self, msg="", end="\n"):
+        """Helper function to append a new message for feature output."""
+
         self.msg += msg + end
 
     def parse_error(self, fname, ln, msg, data=None):
         """
-        Displays an error message, printing file name and line
+        Displays an error message, printing file name and line.
         """
 
         if ln:
@@ -82,7 +95,7 @@ class ParseFeature:
             print("", file=sys.stderr)
 
     def parse_feat_file(self, fname):
-        """Parses a single arch-support.txt feature file"""
+        """Parses a single arch-support.txt feature file."""
 
         if os.path.isdir(fname):
             return
@@ -204,7 +217,7 @@ class ParseFeature:
         self.max_size_arch_with_header = self.max_size_arch + len(self.h_arch)
 
     def parse(self):
-        """Parses all arch-support.txt feature files inside self.prefix"""
+        """Parses all arch-support.txt feature files inside self.prefix."""
 
         path = os.path.expanduser(self.prefix)
 
@@ -281,7 +294,7 @@ class ParseFeature:
 
     def output_feature(self, feat):
         """
-        Output a feature on all architectures
+        Output a feature on all architectures.
         """
 
         title = f"Feature {feat}"
@@ -331,7 +344,7 @@ class ParseFeature:
 
     def matrix_lines(self, desc_size, max_size_status, header):
         """
-        Helper function to split element tables at the output matrix
+        Helper function to split element tables at the output matrix.
         """
 
         if header:
-- 
2.52.0

