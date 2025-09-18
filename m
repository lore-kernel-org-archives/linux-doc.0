Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0477B3054C7;
	Thu, 18 Sep 2025 11:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196507; cv=none; b=gPQE1K2lwrf1PHCZNPq+G2luJfLUwRn0TjU1w6VyEaCogcOKWiiKjq3u0DdqGoCi6vSHbRRUdQEvdwvXHH0sKEP9S4EMmDmqGosD+kfGqoIB9UWyQ2SV6R5Ly/gQG7pQtJcRm0y9jkLeGQj3+AXcviDgP0/5vK3mW12tnFsxY7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196507; c=relaxed/simple;
	bh=k6YcbtXwsJKesw6XBa4evKMXBMHtuUFMe++T/iQChqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DDXens9UZGpaTNuz4lksIjNUIdvHstykHp40ORXlknDW7Scz7doyOuAm5Ss1O+jC4KovIuNvEyiRdDGWemsJ4t8j0SgkM6L7n1I538DqmbsWPjQzbF+YCTw5Bo4kq5kyqzjnJcaU6On3+5eyf9eL1GafW8fThcr+o9m5vB9ggZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVv/HXV5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVv/HXV5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBACBC4CEE7;
	Thu, 18 Sep 2025 11:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758196506;
	bh=k6YcbtXwsJKesw6XBa4evKMXBMHtuUFMe++T/iQChqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LVv/HXV5lJeEQx/4YKkpJbhFEJ/P8kAUlZmUu6jB2i4zMFVJ5pNBMVy5KIYuQf5ML
	 EupaPCu1Jq66TubtXjKDB0zYlO8HDgICRXeO6prILWlvG+T7mVw67M+jgMwQAwg5lx
	 fPgeiSX/bnEJdBwA6G6tC2ubAnTXV61beMv+8UTJuDx+EgRfcqRmWeANhdbvkAW8La
	 +45ns09YOnrjImSUyXt/8yzaRN2mFHSVyjT8sILAeXXDYhOSug8dCwcezEGThlehpy
	 9iVR7YzMSDRchRoRNFgT/Pv0KUqwJ/JQOWMIyRMknmEiCwizodp0tjyPtWWk4KnBvh
	 0H28n//IsHIFQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uzDE8-0000000CrtK-1EIb;
	Thu, 18 Sep 2025 13:55:04 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 18/24] tools/docs: sphinx-build-wrapper: Fix output for duplicated names
Date: Thu, 18 Sep 2025 13:54:52 +0200
Message-ID: <d4a4f16f6c0c423ad38531a490888be3bf01e574.1758196090.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758196090.git.mchehab+huawei@kernel.org>
References: <cover.1758196090.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

When SPHINXDIRS is used, basename may be identical for different
files. If this happens, the summary and error detection won't be
accurate.

Fix it by using relative names from builddir.

While here, don't duplicate names. Report, instead:

- SUCCESS
    output PDF file was built
- FAILED
    latexmk/xelatex didn't build any PDF output
- FAILED: no .tex files were generated
    Sphinx didn't build any tex file for SPHINXDIRS directories
- FAILED ({python exception})
    When a concurrent.futures is catched. Usually indicates an
    internal error at the build logic.

With that, building multiple dirs with the same name is reported
properly:

    $ make V=1 SPHINXDIRS="admin-guide/media driver-api/media userspace-api/media" pdfdocs

    Summary
    =======
    admin-guide/media/pdf/media.pdf  : SUCCESS
    driver-api/media/pdf/media.pdf   : SUCCESS
    userspace-api/media/pdf/media.pdf: SUCCESS

And if at least one of them fails, return code will be 1.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/sphinx-build-wrapper | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index 6c2580303e8e..8d1f77c4a880 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -329,9 +329,6 @@ class SphinxBuilder:
                     continue
 
                 name = name[:-len(tex_suffix)]
-
-                max_len = max(max_len, len(name))
-
                 has_tex = True
 
                 future = executor.submit(self.build_pdf_file, latex_cmd,
@@ -343,34 +340,35 @@ class SphinxBuilder:
 
                 pdf_name = name + ".pdf"
                 pdf_from = os.path.join(from_dir, pdf_name)
+                pdf_to = os.path.join(pdf_dir, pdf_name)
+                out_name = os.path.relpath(pdf_to, self.builddir)
+                max_len = max(max_len, len(out_name))
 
                 try:
                     success = future.result()
 
                     if success and os.path.exists(pdf_from):
-                        pdf_to = os.path.join(pdf_dir, pdf_name)
-
                         os.rename(pdf_from, pdf_to)
 
                         #
                         # if verbose, get the name of built PDF file
                         #
                         if self.verbose:
-                           builds[name] = os.path.relpath(pdf_to, self.builddir)
+                           builds[out_name] = "SUCCESS"
                     else:
-                        builds[name] = "FAILED"
+                        builds[out_name] = "FAILED"
                         build_failed = True
                 except futures.Error as e:
-                    builds[name] = f"FAILED ({repr(e)})"
+                    builds[out_name] = f"FAILED ({repr(e)})"
                     build_failed = True
 
         #
         # Handle case where no .tex files were found
         #
         if not has_tex:
-            name = "Sphinx LaTeX builder"
-            max_len = max(max_len, len(name))
-            builds[name] = "FAILED (no .tex file was generated)"
+            out_name = "LaTeX files"
+            max_len = max(max_len, len(out_name))
+            builds[out_name] = "FAILED: no .tex files were generated"
             build_failed = True
 
         return builds, build_failed, max_len
-- 
2.51.0

