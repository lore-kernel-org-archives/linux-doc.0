Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094CCF513;
	Tue, 28 Jan 2025 00:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022797; cv=none; b=XW6RCg3wmcgXye6jGLQF0fE9Wyons71o5yC0BBGjpVZjDzecq6HFfRcmBLDZYUmq1E4SvrWcQpwGAny7IiFtph2bCGG1SdvqJlF1srnoJpZbsEGBIaBdcKr+3Fe8cZXeaWxciLa8TrmZmazzoNLnJaCDkPTuv12oIPzUVQdfshg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022797; c=relaxed/simple;
	bh=b2P1ol5GI5wxTTgp3WD4NLr24nQ4aqzFQ0yVTuulMl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YJMfJvxV/e9iI+oWivMmrF+eGeNfNHXVmE/ha88Bet4YrOmR/FPsv6gXBeYoXJXsmr/DqxAzK0Ptjm12LBcjTwn4VlfpNgXebtuza3gCZZqRDgE8+dC7cxLOZwr86jo0pYWgDS3bP/Ynty6nsJ9KPtwwTkVcHSKWJalp2L5QJUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LE60cN3J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LE60cN3J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E9DC4CEF6;
	Tue, 28 Jan 2025 00:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022796;
	bh=b2P1ol5GI5wxTTgp3WD4NLr24nQ4aqzFQ0yVTuulMl0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LE60cN3J5NvMoAiEJs3LEuIZokRRIMHuzyO9j0r6duWl6f7FH8zUZj2TnkopnvoWl
	 va/h0jW3QtBwEbEPKX7Z2S2QmklSmI8tOqi3QbxBlBV6bIClA2i2P8oLKR5UZxhJYz
	 ThwcVnUreOKL1tdqSSeQgAw4evWlShfWAvAUEa22pBijZxePWVCGnxqV2fwmHVLQA2
	 TJvC7sxyPIduFK5x0G/t/c5808QtG8NdzTJbr2e99oJh/QyL27Qb6wiWipYBif2/+3
	 qsXVPdQ3jAccnlbeu2P2hZ42pqqj5yQVR1rbjVKF9mKEtS8Z6pgqRRZdvugGV7YLAN
	 RSartAhirlCCA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7i-0000000DRLn-0fFN;
	Tue, 28 Jan 2025 01:06:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 22/38] scripts/get_abi.pl: add support to parse ABI README file
Date: Tue, 28 Jan 2025 01:06:11 +0100
Message-ID: <3c900177b187a8073cffb644de12dfe84c51c1dd.1738020236.git.mchehab+huawei@kernel.org>
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

The Documentation/ABI/README file is currently outside the
documentation tree. Yet, it may still provide some useful
information. Add it to the documentation parsing.

As a plus, this avoids a warning when detecting missing
cross-references.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.py | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/scripts/get_abi.py b/scripts/get_abi.py
index 6d7fa8fbca34..3cde278b8e4c 100755
--- a/scripts/get_abi.py
+++ b/scripts/get_abi.py
@@ -276,6 +276,16 @@ class AbiParser:
         if content:
             self.warn(fdata, "Unexpected content", line)
 
+    def parse_readme(self, nametag, fname):
+        """Parse ABI README file"""
+
+        with open(fname, "r", encoding="utf8", errors="backslashreplace") as fp:
+            nametag["description"] = "```\n"
+            for line in fp:
+                nametag["description"] += "  " + line
+
+            nametag["description"] += "```\n"
+
     def parse_file(self, fname, path, basename):
         """Parse a single file"""
 
@@ -322,6 +332,10 @@ class AbiParser:
         if self.debug & DEBUG_WHAT_OPEN:
             self.log.debug("Opening file %s", fname)
 
+        if basename == "README":
+            self.parse_readme(fdata.nametag, fname)
+            return
+
         with open(fname, "r", encoding="utf8", errors="backslashreplace") as fp:
             for line in fp:
                 fdata.ln += 1
@@ -357,9 +371,6 @@ class AbiParser:
 
                 basename = os.path.basename(name)
 
-                if basename == "README":
-                    continue
-
                 if basename.startswith("."):
                     continue
 
@@ -462,8 +473,12 @@ class AbiParser:
                     continue
 
             if filter_path:
-                if v.get("path") != filter_path:
-                    continue
+                if filter_path == "README":
+                    if not names[0].endswith("README"):
+                        continue
+                else:
+                    if v.get("path") != filter_path:
+                        continue
 
             msg = ""
 
-- 
2.48.1

