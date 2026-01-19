Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2C1278753;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839814; cv=none; b=KW1lmBgf6X60rZSqXS/+y2S4kG93hGbJyIYZdykIvFUnu1339+V6UZRmdlh0zEHWCBbYSeZr0AwGnjqyNUnV39mGQaZVrI8RNFxYW1nhRBxAZjdmhN+kwzt/AHMcphdBQ1saKkEDnroQUxTw5IkjZc3NgRLVIeYF3mMR88Th/Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839814; c=relaxed/simple;
	bh=q9VxELkw10h/rayaXE5+jzYIauBY7bQAjcvZ82AeO5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GJimQdfHm+RcqOihXCGzOtWp1YK+Aeh3yZmzpdZkNEyv1YOHMF1VnUNobtnum8oE6pQplvcOExv7SOnhGAuNWN8xkrRMGjQDNN6Mhyt15Mg5D8J5ei67l507s/b4RLjaoEqo/YoZRtX2uJjyCpvnHbNMKLbq6nidXPCkFzcFV0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTN9MNJH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTN9MNJH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ABA9C19424;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=q9VxELkw10h/rayaXE5+jzYIauBY7bQAjcvZ82AeO5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jTN9MNJHKq7WPD8YIdnuGw36G+6WOcbFAc+GtI/JhosWzODPfVU6qtfsS/oQ333Jx
	 PyCGrVVYU9SNKL8LWbgalCTZRh0wlveViokXxunoO8hjo5VFZYSRvczZJi4ywB2EzP
	 Cg06e5LZ8dWDJAqUYp1f8Ukvx0G5qCZ8Tmko47cKNRmn/52AS37mbuhXcpYa9PKbam
	 Qj1DiR5PxDIs9ip7SH/y0FXbVPaUrqA831Nj0HL/D28Huw+toS2/8kAnqS+9q43NeG
	 /WUQmzEkFLINPT+yzxbG1lj1MGOr8gGF2Q4zVY9tClXGvMF+7s+DPbsg/QJhS+qk/z
	 jTw32JR6d3ufg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j1U-0Zzq;
	Mon, 19 Jan 2026 17:23:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH 02/25] docs: conf.py: don't use doctree with a different meaning
Date: Mon, 19 Jan 2026 17:23:05 +0100
Message-ID: <bab090bb4b95c735bd570c9c23c6e97851b2bf7b.1768838938.git.mchehab+huawei@kernel.org>
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

At Sphinx, doctree is a directory where doc build cache is stored.
Use a better name.

No functional changes.

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/conf.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 16d025af1f30..10322b1a28a7 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -33,7 +33,7 @@ else:
     include_patterns = ["**.rst"]
 
 # Location of Documentation/ directory
-doctree = os.path.abspath(".")
+kern_doc_dir = os.path.abspath(".")
 
 # Exclude of patterns that don't contain directory names, in glob format.
 exclude_patterns = []
@@ -73,7 +73,7 @@ def config_init(app, config):
     # setup include_patterns dynamically
     if has_include_patterns:
         for p in dyn_include_patterns:
-            full = os.path.join(doctree, p)
+            full = os.path.join(kern_doc_dir, p)
 
             rel_path = os.path.relpath(full, start=app.srcdir)
             if rel_path.startswith("../"):
@@ -83,7 +83,7 @@ def config_init(app, config):
 
     # setup exclude_patterns dynamically
     for p in dyn_exclude_patterns:
-        full = os.path.join(doctree, p)
+        full = os.path.join(kern_doc_dir, p)
 
         rel_path = os.path.relpath(full, start=app.srcdir)
         if rel_path.startswith("../"):
@@ -95,7 +95,7 @@ def config_init(app, config):
     # of the app.srcdir. Add them here
 
     # Handle the case where SPHINXDIRS is used
-    if not os.path.samefile(doctree, app.srcdir):
+    if not os.path.samefile(kern_doc_dir, app.srcdir):
         # Add a tag to mark that the build is actually a subproject
         tags.add("subproject")
 
-- 
2.52.0

