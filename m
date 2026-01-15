Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9463ACF12;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768491642; cv=none; b=POsk1x2Y6C5OyNXPxQX3tReaoJW1P2weFdQulWRXGFseZ7P8iB746alR+rDSh6lqBFCmJ54gduqdERA13WmE+gr5okziUrq1pSLfTLsq2fQyi/LXqL3Zw7/8KkCf2YyJ0SJG4vFfkX+iG8lQRuWGxZD1yju7R/lPZEj3IICB1+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768491642; c=relaxed/simple;
	bh=qeD2CxushaNmzGduOrZz2GnZPSRsopACODszEDevkew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JLIzrtdKbhQfUeAOOgL3bVjjDcVlbjDJEQ02QoWhfalzXuibMMA3dsxRuVDFUGXrNp24wEvVbJG5yOfvWfStQ6ihzKMJBhvjwigupUbQE3uS/BUyzT6cpw/NWBh7HcMXFPa4uXiRAs1gZ04XMd/e+JvM5nOqH10vhYh57KaC96I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s4qL0sM5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s4qL0sM5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325F1C4AF0D;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768491642;
	bh=qeD2CxushaNmzGduOrZz2GnZPSRsopACODszEDevkew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s4qL0sM5okyH0oUGSgP0m0xmk89HRsmoIily9HKJ5uMw8QDdMkrhbBJX4PWTCRY3v
	 5+mqr+xjtshQA1zfAS/rfeXBkhj5oTTVEsga7aIiWPBXwQtmMEU5A9lHeteBCKpW0t
	 oS7GTKb5MRsZQp89op3SsDMGRf2MrWxdVUdxUrV/Drb8Cf9LMhtIyZVqrufCWDoTKe
	 AtSZTRMOQ71gJYlwBBJP0Cx5NJOaES+WNmdTtgHBuFLRJ0pk0cFbl8ZZheXqZyaT1K
	 uicznAnWAlj6ONTjmtRKfus3gnfgRpqKbgiCEMxRuACNd2paAnKk82BQxCOST5bIH+
	 QjTZefIwU84oA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vgPSi-000000043J1-1woA;
	Thu, 15 Jan 2026 16:40:40 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 14/15] docs: kdoc: python_version: Improve docstrings and comments
Date: Thu, 15 Jan 2026 16:40:35 +0100
Message-ID: <d89acbc1a1e3c97a336b58934e56299f17e265ed.1768488832.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768488832.git.mchehab+huawei@kernel.org>
References: <cover.1768488832.git.mchehab+huawei@kernel.org>
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

