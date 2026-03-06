Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2423EBF3A;
	Fri,  6 Mar 2026 15:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811959; cv=none; b=rbVIQQwoM0thMhw5hTBDGvg7En2gQ74l8UWRbC9nZIO+FTZN+CmQaJ5k2dys68hk7uWUbbMijwEHLVuUAExtDU/GzyndRkig9DU4ctctz9WOOlxzHzmclXtfBJQK5thecKAlqmEJaEXyyt+1WSsT3dHERDUp5GFgX1NyGZuPyVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811959; c=relaxed/simple;
	bh=7COCcajjMpNCqEJgxqFWGc78MkIQYZ67DzkUU7rjqRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a2DsSNMtmOyd0SEJXxNE7gLeQSoRzbbDlMFeKiW17oPQEj7mf6/bMs1Oq28GKC1XrIAxosI9YVZeA/0kYm+FnH/NrqVMQQ2HdDO3xbVWW8okVtU4gUiEPYYC53lzICvi5uYY4JoHqXvg0U7pTf/zCdjVdOaLkJTXfcLDPzBLuVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IOhL2ByE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IOhL2ByE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBB6C2BC86;
	Fri,  6 Mar 2026 15:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772811959;
	bh=7COCcajjMpNCqEJgxqFWGc78MkIQYZ67DzkUU7rjqRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IOhL2ByEDIFS0CnFrHKGZFuEBlNYkixExxWTKmB+DsgpqtPFJP63Qpt/r3YEjzNUp
	 LNgnreZ7FAtmLbuqzqlIWcG2PE2V7/5+mCcj8U1kBjiawAAkC3GXEGYXp3+cMUkeBR
	 GP1iO1ZWtJopXrMR7s/u+6Nr/0pbzNz46tSw0RddIWMjKqB3CL6oKJ85YtKzSHpoLk
	 gW6xty15axxJ1IEZaZOXgB6HqB8nXuAaD7J+uYmOyfuRWiKpdRllk3Kc8B/guwb7Ca
	 Q9NJOtFq41G1nA5VoAuL4+xmgKZgVUYlY7xY2UmD6O0gDAZdJbOkALn9186ywxgMg1
	 1WW0FLEj5ncSQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyXNF-00000007EhU-3p6I;
	Fri, 06 Mar 2026 16:45:57 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/13] docs: kdoc_output: Change the logic to handle man highlight
Date: Fri,  6 Mar 2026 16:45:48 +0100
Message-ID: <6ae2301a40b3fcb4381dd9dda8c75d14f9616b46.1772810752.git.mchehab+huawei@kernel.org>
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

The code inside ManFormat code to output man pages is too simple:
it produces very bad results when the content has tables or code
blocks.

Change the way lines are parsed there to allow adding extra
logic to handle some special cases.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_output.py | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index c25f80a39cdc..9caffe0d9753 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -755,15 +755,23 @@ class ManFormat(OutputFormat):
         if isinstance(contents, list):
             contents = "\n".join(contents)
 
-        for line in contents.strip("\n").split("\n"):
-            line = KernRe(r"^\s*").sub("", line)
-            if not line:
-                continue
-
-            if line[0] == ".":
-                self.data += "\\&" + line + "\n"
-            else:
-                self.data += line + "\n"
+        lines = contents.strip("\n").split("\n")
+        i = 0
+
+        while i < len(lines):
+            org_line = lines[i]
+
+            line = KernRe(r"^\s*").sub("", org_line)
+
+            if line:
+                if line[0] == ".":
+                    self.data += "\\&" + line + "\n"
+                    i += 1
+                    continue
+
+            i += 1
+
+            self.data += line + "\n"
 
     def out_doc(self, fname, name, args):
         if not self.check_doc(name, args):
-- 
2.52.0

