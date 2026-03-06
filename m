Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599C33EBF14;
	Fri,  6 Mar 2026 15:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811959; cv=none; b=Pr+1T6afhrsuiat1Ox4OBPFqTNvIMmDMm2C4xV61SocyFzUECovWzimO3kPYwjUNOYE6tmKDNRnYitbNeUhrJwhiYN1/dul9ZBGXzMXyH5T3lebIL8Xbryj7AZVoXoJ1mIOeaIWsh6a5qfw9IQ2nx283c+V7JPjTNV4yvDfM1Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811959; c=relaxed/simple;
	bh=P85ihOR34EEBJ4aigkm1P5PoviijGjWWN5/y18JiWZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mlIYN5QB2ToIxyQCmaDK6/XpCj4/AWuA1+1bmw6tbNqB//FalNU4OyriemRs5US5e5wXqt+24cS3prUG5PbgXDEjKnSiI3XuhmxkE5nNttTyUDimsCJycFT7F/1mIj2r5fLj8UpapKYJw21kC/yZWlioWo0HCQBwN5IOj0e0i4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljwJXY5D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljwJXY5D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0AECC2BC86;
	Fri,  6 Mar 2026 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772811958;
	bh=P85ihOR34EEBJ4aigkm1P5PoviijGjWWN5/y18JiWZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ljwJXY5DGeXwmepUd5oP5BZDV1PGY5fw/Bs8B8tzxG+ddAvW0xpgc0wPcTUnOjzSN
	 IyQynFXPnO4fN0drHYLOwidE9KjQRXst21BUZcOgEhB+gY1Lzt0SJh6E+Pb3UNdoGp
	 NS9EFBFqZSsLZhALRwitx2f0ugBZXw5IzMVN2yianiueq5PMv8QPmxjZfzCVO3803R
	 pNuic2aJPa/IZcBydngE5wEBqT5O1FXRDmO1CcvVNWs1E3e4yIGfYsu2SEC+vYZI+v
	 Ka1HWxps5j8hjKmcyfDPUVcI+fFrbY0ThxmX2xRPhmPl5yPetsRIDY0LEC6iJtf0Rl
	 9qqZB+a6abO6Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyXNF-00000007Eca-0d94;
	Fri, 06 Mar 2026 16:45:57 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/13] docs: kdoc_output: don't use a different modulename for functions
Date: Fri,  6 Mar 2026 16:45:44 +0100
Message-ID: <978259bdf3e8d310c646ecf76ce56d054f6d5738.1772810752.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772810752.git.mchehab+huawei@kernel.org>
References: <cover.1772810752.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

It doesn't make much sense to have a different modulename just
for functions, but not for structs/enums/...

Use the same header everywere.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_output.py | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 24ee1fad681e..62e300e65405 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -607,14 +607,11 @@ class ManFormat(OutputFormat):
         "%m %d %Y",
     ]
 
-    def emit_th(self, name, modulename = None):
+    def emit_th(self, name):
         """Emit a title header line."""
         name = name.strip()
 
-        if not modulename:
-            modulename = self.modulename
-
-        self.data += f'.TH "{modulename}" {self.section} "{name}" '
+        self.data += f'.TH "{self.modulename}" {self.section} "{name}" '
         self.data += f'"{self.date}" "{self.manual}"\n'
 
     def __init__(self, modulename, section="9", manual="Kernel API Manual"):
@@ -748,7 +745,7 @@ class ManFormat(OutputFormat):
 
         out_name = self.arg_name(args, name)
 
-        self.emit_th(out_name, modulename = name)
+        self.emit_th(out_name)
 
         self.data += ".SH NAME\n"
         self.data += f"{name} \\- {args['purpose']}\n"
-- 
2.52.0

