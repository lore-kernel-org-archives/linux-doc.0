Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A898287247;
	Thu, 29 Jan 2026 15:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769701788; cv=none; b=oW1aV/9vGflHCX0xHU31h1Fdln+2BG9qWOuNrDsbabcK8OgbdP3GYmxV3XrNBG3HUKXak4BiZkeEZzCIS0xtrGofae+MDaQj9YVuV4qbYXKcY2BPcL1cf/BrT/t5pjkRD7Srv61UhS9Ts4WAODCB7/gQTrFJ8mBeQKvC8EDJg3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769701788; c=relaxed/simple;
	bh=3n5zkoFrFUOIWGD8NapCIbtnoFCw7B0BzF+EBvzaUy8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OW9aEvRHuTmGM2t55GQCHXx5b06w5VY5gqQKrA1VzkDHPOw+BdxrBJsVRQVAGAIs2nDgv7ODPmLoE1sf9NN6qs2f963GhwxLZgtDUR5BX0rp8KfGOSgh6n4ntwIeamRk04aIvzww8ynYRWU/FezrsMu8A+/DiEAOEQ6CyaaUk/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V2Sko66H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V2Sko66H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB3BC19422;
	Thu, 29 Jan 2026 15:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769701787;
	bh=3n5zkoFrFUOIWGD8NapCIbtnoFCw7B0BzF+EBvzaUy8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V2Sko66HP6sX+xji/WahhwPRqwRDVPFypERLQlGwEduw2mZmmuXw+bn+OLvutk0DR
	 9+jyUb0mo7o9bkux0WtqsqRZPk9V0keC4HBdxqu1xInS5MGm78U5URfuP8ek6H9SPR
	 donjATfr8ZvmU3vIXvg0f8EXzvMUXPHuvng1iAk4aFMglO/JJVAeHvTJmEXgf0a1pc
	 /DnC07gM0cbGgTdxriDFxq/L6qo5BEXWJaM5HabRBe+tLz2X6zmduQowCIABPgas5O
	 ASBHbOVXPOnd7Ijz3hyWgV8AdRK7z+LwKz8XXW548PPcILFu/yNsk0JgnCZyCEqdQP
	 pqrhf9OQHZ+Sg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vlUHB-0000000FNDZ-0BTj;
	Thu, 29 Jan 2026 16:49:45 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	John Snow <jsnow@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 1/1] docs: kdoc_files: allows the caller to use a different xforms class
Date: Thu, 29 Jan 2026 16:49:37 +0100
Message-ID: <2cfd6d96ced28ae59f4aa1939d1ac77fcbbc8ce8.1769701598.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769701598.git.mchehab+huawei@kernel.org>
References: <cover.1769701598.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

While the main goal for kernel-doc is to be used inside the Linux
Kernel, other open source projects could benefit for it. That's
currently the case of QEMU, which has a fork, mainly due to two
reasons:

  - they need an extra C function transform rule;
  - they handle the html output a little bit different.

Add an extra optional argument to make easier for the code to be
shared, as, with that, QEMU can just create a new derivated class
that will contain its specific rulesets, and just copy the
remaining kernel-doc files as-is.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_files.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_files.py b/tools/lib/python/kdoc/kdoc_files.py
index 7357c97a4b01..c35e033cf123 100644
--- a/tools/lib/python/kdoc/kdoc_files.py
+++ b/tools/lib/python/kdoc/kdoc_files.py
@@ -118,7 +118,7 @@ class KernelFiles():
         if fname in self.files:
             return
 
-        doc = KernelDoc(self.config, fname, CTransforms)
+        doc = KernelDoc(self.config, fname, self.xforms)
         export_table, entries = doc.parse_kdoc()
 
         self.export_table[fname] = export_table
@@ -154,7 +154,7 @@ class KernelFiles():
 
         self.error(f"Cannot find file {fname}")
 
-    def __init__(self, verbose=False, out_style=None,
+    def __init__(self, verbose=False, out_style=None, xforms=None,
                  werror=False, wreturn=False, wshort_desc=False,
                  wcontents_before_sections=False,
                  logger=None):
@@ -193,6 +193,11 @@ class KernelFiles():
         self.config.wshort_desc = wshort_desc
         self.config.wcontents_before_sections = wcontents_before_sections
 
+        if xforms:
+            self.xforms = xforms
+        else:
+            self.xforms = CTransforms()
+
         if not logger:
             self.config.log = logging.getLogger("kernel-doc")
         else:
-- 
2.52.0

