Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EF936C0BB;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768491642; cv=none; b=JnmDTFOT0eYyDMehGOW1RIxcJ6KJWdNRZKvjzcysiLRmrkeI/Gbq91SGUPXSsQWpdGd231lgqr2BrmA+hONMy3Kv5I0aDz59Dt87VcMkG9uMgUgiM+Cbfq4kfGnSKCOoNiifIkTxQhx6fT/wzHnYk0fxm+CJn8P4HnVOwLebBfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768491642; c=relaxed/simple;
	bh=X8zMAMrZ2rBw2/CZgBSnLB3g6EePAZnuEoYA7VDGxVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ie3TJdgtOsh76I+uOAjjGIYnRQeUx++DpcsDksR0lji3yjSNjKvvq8R7CP7fydXt8eXtNW7vCIiyp4JGZFY8LUwh1KCVDkwx2GjuMU3WzPszwPPDos3lD84SNx1FIxb+EK73ENjXrax2iVZkiMlsSvlo5W8cbAt69fSDRybq27s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGxa6w1K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGxa6w1K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F83C116D0;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768491642;
	bh=X8zMAMrZ2rBw2/CZgBSnLB3g6EePAZnuEoYA7VDGxVw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dGxa6w1KOdMP9L1iYgISs4fmGMEFr5/LoYZ9S+c6KKAEDLx2tbiAcfUOrPZCwqf+m
	 u1suTMmt+YKt3Vd8shGPkQkGIM9qDf2WPPXZnZMQ29d/nOvaHaHqofRgP51QKYyluP
	 ffQwaeAECmYxqX9ARplfuKs8E1ma20YcuSqXrfoeo9R/WQXz1k807hnB0qm3t9rtoS
	 YHFsenebMhw3ecot8GqhIFnmgOFAeaFrW5DOufKT25xqC2KMQLWo7IE3Lqv+pHbRfd
	 xO5zlhzeq4cmn5SsYN91qpAHKB/PdDds56jIaZAG/oX9S0o1LngTfwd8f3l7gvk0i9
	 RL3425TpA6F1g==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vgPSi-000000043IJ-0jbf;
	Thu, 15 Jan 2026 16:40:40 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v2 03/15] docs: conf: don't rely on cwd to get documentation location
Date: Thu, 15 Jan 2026 16:40:24 +0100
Message-ID: <57823e4d8d025ad34e4891215e387778564fcdcb.1768488832.git.mchehab+huawei@kernel.org>
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

Instead of relying that Sphinx will be called from Documentation/
dir, pick the location based on __file__.

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/conf.py | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 548e57b1fb01..f62982f83501 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -13,10 +13,11 @@ from  textwrap import dedent
 
 import sphinx
 
-# If extensions (or modules to document with autodoc) are in another directory,
-# add these directories to sys.path here. If the directory is relative to the
-# documentation root, use os.path.abspath to make it absolute, like shown here.
-sys.path.insert(0, os.path.abspath("sphinx"))
+# Location of Documentation/ directory
+kern_doc_dir = os.path.dirname(os.path.abspath(__file__))
+
+# Add location of Sphinx extensions
+sys.path.insert(0, os.path.join(kern_doc_dir, "sphinx"))
 
 # Minimal supported version
 needs_sphinx = "3.4.3"
@@ -32,9 +33,6 @@ else:
     # Include patterns that don't contain directory names, in glob format
     include_patterns = ["**.rst"]
 
-# Location of Documentation/ directory
-kern_doc_dir = os.path.abspath(".")
-
 # Exclude of patterns that don't contain directory names, in glob format.
 exclude_patterns = []
 
-- 
2.52.0

