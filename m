Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45C038A70D;
	Wed, 14 Jan 2026 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768396652; cv=none; b=RSHjcYxUu2hKGnzFj8v3DHJsToMVMnv9XPgO7+KKrJGjTqN9Eu3ZklgFRPDros5H/n+PxTJBz+CNt6SP2ZWJvLzZadIFccPRM6y9aQf5H1wPweYfOszkw2oQONRx8v+tevzI7fgrRrFaKy7s4eibYqkup9BT5UFVMJKAMgsXPws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768396652; c=relaxed/simple;
	bh=/ChTPMTJWguRRKmJf9yWMTMAI3kBzNamShtWjsKKzK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sRmLkBATKLx/78r8QFeTzmrGpr4ovP1t9ZcDOhHCk1daES5oACxlZqMe9ZCcXwFjc2JORh+mKjEoJ9kv/XoY7NAfGFNKSEBnE9x62EhoXf8DW4jEarjCDiTfORxiAWeMdxrZ0JK2FiDoYTG7zXZqaUpXh5Ig6prbCmyUSZXdJrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0mWXyYy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0mWXyYy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B199C4CEF7;
	Wed, 14 Jan 2026 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768396652;
	bh=/ChTPMTJWguRRKmJf9yWMTMAI3kBzNamShtWjsKKzK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W0mWXyYylmF9Xe+hgWcLLha5QQdff4rTPSA+fV1xfBvz6p3fTDozwo9vfHyXmWHsF
	 Fs9+ll1kSlgyrv8nFjILCDwf/ehOQzXddTdEBQcCnugQHSkgNZecMsMolIk6TnG/pn
	 xN1w8h35iYsej9N+NExloaYJ4/itoPqozOUFp2yvAVr1BCLlxkuamkSqWleDFRbj2p
	 gCtTXqCO3QmI3cF46QQnKwBTriXTR5zexdgOOVYV7IpiORRhz266ssI3cJ4q8p2IhT
	 wpxO8vLPoLh1qS8BTg1NzwzZSS6W9P0kUkfEt0XY87LSU+HRU/ge2XE4OABZr4iTvp
	 GJ1cGy+4vkqeA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vg0kc-00000002mxc-3392;
	Wed, 14 Jan 2026 14:17:30 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 02/13] docs: enable Sphinx autodoc extension to allow documenting python
Date: Wed, 14 Jan 2026 14:17:15 +0100
Message-ID: <6aa5a5b4a686f07c8f3e6cb04fe4c07ed9c1d071.1768396023.git.mchehab+huawei@kernel.org>
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

Adding python documentation is simple with Sphinx: all we need
is to include the ext.autodoc extension and add the directories
where the Python code sits at the sys.path.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/conf.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 1ea2ae5c6276..429fcc9fd7f7 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -13,11 +13,18 @@ from  textwrap import dedent
 
 import sphinx
 
+# Location of Documentation/ directory
+doctree = os.path.abspath(".")
+
 # If extensions (or modules to document with autodoc) are in another directory,
 # add these directories to sys.path here. If the directory is relative to the
 # documentation root, use os.path.abspath to make it absolute, like shown here.
 sys.path.insert(0, os.path.abspath("sphinx"))
 
+# Allow sphinx.ext.autodoc to document from tools and scripts
+sys.path.append(f"{doctree}/../tools")
+sys.path.append(f"{doctree}/../scripts")
+
 # Minimal supported version
 needs_sphinx = "3.4.3"
 
@@ -32,9 +39,6 @@ else:
     # Include patterns that don't contain directory names, in glob format
     include_patterns = ["**.rst"]
 
-# Location of Documentation/ directory
-doctree = os.path.abspath(".")
-
 # Exclude of patterns that don't contain directory names, in glob format.
 exclude_patterns = []
 
@@ -151,6 +155,7 @@ extensions = [
     "maintainers_include",
     "parser_yaml",
     "rstFlatTable",
+    "sphinx.ext.autodoc",
     "sphinx.ext.autosectionlabel",
     "sphinx.ext.ifconfig",
     "translations",
-- 
2.52.0

