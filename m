Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B3739B4AC;
	Wed, 14 Jan 2026 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768396652; cv=none; b=DWdwkr79nOl5DWcAiClS8WfagZ/RnGd6y9cHoCR7wXH4EA8976FlmXsv0ixkTBjslwK0068IFJKRqD9R6rfp1eHq0e2CXFkOpyb5HT8RpRtbiPt9BdiW5RaW5CHFv3XD/L5qjW/0+n6SxgsbU/t3nk+k0ei5nZVZ6O5oCZL/CZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768396652; c=relaxed/simple;
	bh=kmk1GvA8qQBm6LrMB53lcAYigASy9DuUwFJjdBAuCYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H6pMDdpWdwaVhUoMSrs4/TgrVfr4YQ9ZijZ33ZjEmhe+rqA+xgvj+rpAA/8eDL2SRpgeiHeitSt3vEFVlabAg4K3eckvJwYsklVy7l6ZbtfKOOdw+ScTSDuJSEqab6Nah62BjsyvBUtX0Daszlge321pgNSSSI4KPaRptpYMDn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A1Qae+5k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1Qae+5k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923E9C2BCB3;
	Wed, 14 Jan 2026 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768396652;
	bh=kmk1GvA8qQBm6LrMB53lcAYigASy9DuUwFJjdBAuCYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A1Qae+5kagWskVqy9Jf63IY27hG6XPXtll2q3XoMsUoRLbqevfIaIbAC1W84fqAYc
	 ZdkZyrMwKDQqz3unUakl3I7HOTZUiNW5osgkM2rIug/Zr6aRbq3d7LJl2vZLkYvttO
	 giVVrg8ktCAbjrIejkpF9qOyVHjOrFF/1M5mxe1hOktoMi0PO7UBitaLmfzwV0VoaK
	 Gm1h9+1NFixYnJiBkPt8gbFUuPDvuqF8H+/g2lg1THJGFlREKXksFepIrKFg9Mhs77
	 2sviVB8zuRed9W2u4eHrq3P+lnrgKhTo12qieakYMR1Bf2Fyn9KDPQDoFIoX8YzCIr
	 5CbUvOj069bhQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vg0kc-00000002mxs-3TsK;
	Wed, 14 Jan 2026 14:17:30 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 06/13] docs: kdoc_item: Improve docstrings and comments
Date: Wed, 14 Jan 2026 14:17:19 +0100
Message-ID: <11886c558d094e382acb415bf834fa4da05053ad.1768396023.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768396023.git.mchehab+huawei@kernel.org>
References: <cover.1768396023.git.mchehab+huawei@kernel.org>
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
 tools/lib/python/kdoc/kdoc_item.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/lib/python/kdoc/kdoc_item.py b/tools/lib/python/kdoc/kdoc_item.py
index 19805301cb2c..2b8a93f79716 100644
--- a/tools/lib/python/kdoc/kdoc_item.py
+++ b/tools/lib/python/kdoc/kdoc_item.py
@@ -4,7 +4,16 @@
 # then pass into the output modules.
 #
 
+"""
+Data class to store a kernel-doc Item.
+"""
+
 class KdocItem:
+    """
+    A class that will, eventually, encapsulate all of the parsed data that we
+    then pass into the output modules.
+    """
+
     def __init__(self, name, fname, type, start_line, **other_stuff):
         self.name = name
         self.fname = fname
@@ -24,6 +33,9 @@ class KdocItem:
         self.other_stuff = other_stuff
 
     def get(self, key, default = None):
+        """
+        Get a value from optional keys.
+        """
         return self.other_stuff.get(key, default)
 
     def __getitem__(self, key):
@@ -33,10 +45,16 @@ class KdocItem:
     # Tracking of section and parameter information.
     #
     def set_sections(self, sections, start_lines):
+        """
+        Set sections and start lines.
+        """
         self.sections = sections
         self.section_start_lines = start_lines
 
     def set_params(self, names, descs, types, starts):
+        """
+        Set parameter list: names, descriptions, types and start lines.
+        """
         self.parameterlist = names
         self.parameterdescs = descs
         self.parametertypes = types
-- 
2.52.0

