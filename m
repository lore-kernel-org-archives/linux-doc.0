Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E9A3ECBF9;
	Fri,  6 Mar 2026 15:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811960; cv=none; b=Oi9aBT8nd+23gPLAQFsY82pnZJ1nmSJb8i2s685ibyKwh+TBiGm/3QEecOKduufsw6JM386DnXzcHVtVgtRxu/75gm5HuMfvY44VZznvAOaqSpoBacO2UT9xbmSeaC2f3VSbon3tJOiwp2vL32Xk6a7JRWggN//bda35xmLoyn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811960; c=relaxed/simple;
	bh=MS/zYjbr+V2Nm7k+PjrM1v8QWG/dh6kCG5IJ1RaUFN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XdfXzFx3VK+WZ2CWZXcf9TbYaT1kalPJXwoVxOgSww7gi5oPhMmPywzfAUZdPQw5DETP15lQ3/jGLPLgOoOgsPAlZmg3nB4NYFcNtViJWXEFkNDC2FENZS8Th95FDlaWwwadCucrefN3pyO/PXuyL5SrV6b0SJnSVqDt7UfNJbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fch3smz4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fch3smz4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051A6C2BC86;
	Fri,  6 Mar 2026 15:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772811960;
	bh=MS/zYjbr+V2Nm7k+PjrM1v8QWG/dh6kCG5IJ1RaUFN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fch3smz438CA+oTGrtqc5Ldt4nCK4gNkQlXQIrJHKMKVNUxUNIUyahabjRIioFQaM
	 9m45N7U6IOH5Gz62LdZcvJxyT9Uu1EteJ5oANIzpJvjx3TtBnGyLpgqd5FOrUkvEYe
	 z9VSvr2wGA57p2z+tvu4Veide7TvvIC6cGDHngCXHlPX46KQ7SPlNG0rwBcrgK8NBW
	 Z/HkQIDiXiJ3Tlw7fVVhRegmCpKttJZ6wel0hSzpeJwWgrO2OdYYBnaIPijygzvQEt
	 O3v9LTi/IfROxCXqdncJlOcJtpnBGCJp70HIBdeJHfaMQ0CpyxJw3def2PwBKsDVMH
	 B/RYwR/J3KHFQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyXNG-00000007Ejv-1CsT;
	Fri, 06 Mar 2026 16:45:58 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/13] docs: kdoc_output: add support to handle code blocks
Date: Fri,  6 Mar 2026 16:45:50 +0100
Message-ID: <fb6f16ad345f7ec1b1ebe4c5ec7ea3d9cd6de4fb.1772810752.git.mchehab+huawei@kernel.org>
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

It is common to have code blocks inside kernel-doc markups.
By default, troff will group all lines altogether, producing a
very weird output. If a code block is detected by disabling
filling inside code blocks, re-enabling it afterwards.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_output.py | 64 ++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 7848514a4d22..df9af444da57 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -864,6 +864,65 @@ class ManFormat(OutputFormat):
 
         return i, self.emit_table(colspec_row, rows)
 
+    def code_block(self, lines, start):
+        """
+        Ensure that code blocks won't be messed up at the output.
+
+        By default, troff join lines at the same paragraph. Disable it,
+        on code blocks.
+        """
+
+        line = lines[start]
+
+        if "code-block" in line:
+            out = "\n.nf\n"
+        elif line.startswith("..") and line.endswith("::"):
+            #
+            # Handle note, warning, error, ... markups
+            #
+            line = line[2:-1].strip().upper()
+            out = f"\n.nf\n\\fB{line}\\fP\n"
+        elif line.endswith("::"):
+            out = line[:-1]
+            out += "\n.nf\n"
+        else:
+            # Just in case. Should never happen in practice
+            out = "\n.nf\n"
+
+        i = start + 1
+        ident = None
+
+        while i < len(lines):
+            line = lines[i]
+
+            m = KernRe(r"\S").match(line)
+            if not m:
+                out += line + "\n"
+                i += 1
+                continue
+
+            pos = m.start()
+            if not ident:
+                if pos > 0:
+                    ident = pos
+                else:
+                    out += "\n.fi\n"
+                    if i > start + 1:
+                        return i - 1, out
+                    else:
+                        # Just in case. Should never happen in practice
+                        return i, out
+
+            if pos >= ident:
+                out += line + "\n"
+                i += 1
+                continue
+
+            break
+
+        out += "\n.fi\n"
+        return i, out
+
     def output_highlight(self, block):
         """
         Outputs a C symbol that may require being highlighted with
@@ -894,6 +953,11 @@ class ManFormat(OutputFormat):
                     self.data += text
                     continue
 
+                if line.endswith("::") or KernRe(r"\.\.\s+code-block.*::").match(line):
+                    i, text = self.code_block(lines, i)
+                    self.data += text
+                    continue
+
                 if line[0] == ".":
                     self.data += "\\&" + line + "\n"
                     i += 1
-- 
2.52.0

