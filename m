Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1812EDD41;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839814; cv=none; b=bJieUhxnoOXye6TqkIaYiJvgSRdSkEVyxgST57jppBL74Zb3M9pc+xUpPNaa8LHnmZOnANOTxrX4wEAFalIlIGWsGxSInr/QoOPJztS4tb5bBT/J5R62TTlYlJl2pqianFycHIez7PCDNr9fTHUNOxfJZzZaWqyq41A5gfYwd+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839814; c=relaxed/simple;
	bh=qeD2CxushaNmzGduOrZz2GnZPSRsopACODszEDevkew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O7btT67s9xnnZpcYn+lKWPZTy53iQ0o0myaxJXqjz+dptpnL3HNSHMY9qD5eFGYL7h7piUqDFXO20NPrQ+gUJckvU/Ez5P7aB3y+oY3RsoBt2FN/jO7hoqcekZuftufQTKpMyvrZu3h8Cmgd0ZVBSKSWcjlQs3Hv/23R/G9cLS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FL/Rov7J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FL/Rov7J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38339C4AF09;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=qeD2CxushaNmzGduOrZz2GnZPSRsopACODszEDevkew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FL/Rov7JMy4A6ix7Oo1u1qLeWW9LdMvhLtX9cUNWTS5iREN8O/g1WX/Tf/WUJp+tk
	 ppcSAG6fy+XztkJs32f6sufN505nDNUdzteVk509VBUxaXdfm//nHuJj5xsaZ6nFgP
	 WnwVZ171qetVVWiMH587n/9AZ+vQx2HCBuTCvJGXK563Osykik8Db4nl7Yb7T9Osky
	 1OcuyqK0I/5otobStGX1Qhuzmn5mPTiU69DiqK70/02gArVDpfB98tnoRHP8QjsQ1Y
	 qVTKHhocZTY1xHkTxDc8fYn8axwz1nLDiGlJyzskF5bFXpZ/jZnJ0ui0FssGg2c5oK
	 Jlxb5plJZrP4g==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j2G-1uOR;
	Mon, 19 Jan 2026 17:23:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 14/25] docs: kdoc: python_version: Improve docstrings and comments
Date: Mon, 19 Jan 2026 17:23:17 +0100
Message-ID: <2153afaeb496e1bb8d3cc318fff26c3f99d99486.1768838938.git.mchehab+huawei@kernel.org>
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
 tools/lib/python/kdoc/python_version.py | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/tools/lib/python/kdoc/python_version.py b/tools/lib/python/kdoc/python_version.py
index e83088013db2..4ddb7ead5f56 100644
--- a/tools/lib/python/kdoc/python_version.py
+++ b/tools/lib/python/kdoc/python_version.py
@@ -33,21 +33,31 @@ class PythonVersion:
     """
 
     def __init__(self, version):
-        """Ïnitialize self.version tuple from a version string"""
+        """
+        Ïnitialize self.version tuple from a version string.
+        """
         self.version = self.parse_version(version)
 
     @staticmethod
     def parse_version(version):
-        """Convert a major.minor.patch version into a tuple"""
+        """
+        Convert a major.minor.patch version into a tuple.
+        """
         return tuple(int(x) for x in version.split("."))
 
     @staticmethod
     def ver_str(version):
-        """Returns a version tuple as major.minor.patch"""
+        """
+        Returns a version tuple as major.minor.patch.
+        """
         return ".".join([str(x) for x in version])
 
     @staticmethod
     def cmd_print(cmd, max_len=80):
+        """
+        Outputs a command line, repecting maximum width.
+        """
+
         cmd_line = []
 
         for w in cmd:
@@ -66,7 +76,9 @@ class PythonVersion:
         return "\n  ".join(cmd_line)
 
     def __str__(self):
-        """Returns a version tuple as major.minor.patch from self.version"""
+        """
+        Return a version tuple as major.minor.patch from self.version.
+        """
         return self.ver_str(self.version)
 
     @staticmethod
-- 
2.52.0

