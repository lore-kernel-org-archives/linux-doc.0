Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E581639B4BD;
	Wed, 14 Jan 2026 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768396653; cv=none; b=rpKnENtIL6wfbbcIAqK9w9Lprmj5amqqgY37SXuqeFpQrqrC6WnRiHVFzvNKbHXieeSC5kO2Z7RJK3gM3xiI3lqvNLZchEanYmvIt+GPfXN01XNyML+YzBKYbElS6cNkxmSQcPjnWmFXYMJBmVgL/QlL0Nb+FppCfQW6Uo4ctwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768396653; c=relaxed/simple;
	bh=qeD2CxushaNmzGduOrZz2GnZPSRsopACODszEDevkew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HrPWAXu78/s4Lqv0WEsHpaQANa1PNlTsHVeiFCZGrrDHJ+DX48Yi1fXXv0ac3TNO9Aimlb6aUSrOukdSijDHR0pjh3A/YeP/nByW11BYnffDev/iQU7z6k81j0qmkE3pFr7iJopFrh/N/ZULv6fLSy5Q6USAbHknwQZSOKmqVKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nxRyHydP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nxRyHydP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABBE5C4AF0C;
	Wed, 14 Jan 2026 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768396652;
	bh=qeD2CxushaNmzGduOrZz2GnZPSRsopACODszEDevkew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nxRyHydPtCXWNMVn+k9Nv4QXcZEY+FngSC6plZr4STdEr8EuDSZrLxYSLBM2uFGhw
	 9yT2HkeUcxkQlMrGIXfvA7/Ubx3y2WK3myulNYcYtH0Y36/Qu49PKXp+FlewEcTCUC
	 qygjlFQilUM+Mtc2oulnPCKc42p5UUji45xoEo3diz8aLDOgyeada/wq4ahEtRoOld
	 XVrtH/M9ndjcBEj2LUj5YOrvcvElcxdX+0s2qILS8OLdi9Mo78I0zCBEFupC1Vo8bm
	 lVtiouHD/2JqWa5Vq3rMQcD0vDOue0XKM1J92Q+8r9qLMtcRE3PA4gHhk/N9VoV/Sv
	 MNu20iSUHPonQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vg0kc-00000002myG-475X;
	Wed, 14 Jan 2026 14:17:30 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 12/13] docs: kdoc: python_version: Improve docstrings and comments
Date: Wed, 14 Jan 2026 14:17:25 +0100
Message-ID: <340032ca56db393a2a10dd828bedf5e63c7983ca.1768396023.git.mchehab+huawei@kernel.org>
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

