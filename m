Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E6D3570AE;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768491642; cv=none; b=uSNd0REL+KUK1eXG78ZseTsWsm/Featu3QMdUh/OPHpe1dV0KWMc3bgGBSGNJPxRyscoYfp/aKDXCUSVl3xmMkfeEKniw6yJwkBrpK64FJzbMD+ozcd+CXTemAw+eWeBuzuDqBIVTcNt5C2zhqNyrHQgE+3jkrWFYANMztRVuac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768491642; c=relaxed/simple;
	bh=TCHwfk8ThCkFaLgmH3fFwJfEQHJ1oXz9bzKs/OW/Myg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eGHqszTO22rc5u6jLu30z0sq4XSlzQARxrxI19WtZGR9x0745848zkCW6WiivDVIxo/IZJoiEp1+i+qjW4Bt+7Xa4Y2q1S7SzZM09saREZ87uyEl0/aMoBfNXAX26l0savjVDylCYlyneZGvqHjVMgnpG1gvKB/fahboGQtXfsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQpcTweP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQpcTweP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ABCFC16AAE;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768491642;
	bh=TCHwfk8ThCkFaLgmH3fFwJfEQHJ1oXz9bzKs/OW/Myg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dQpcTwePp0HWy37rz5HnMQzk/fEX5PE24Pmo5QExdQbmd4ZVUwPD1J8+jau1s40mi
	 w9/i1/T6bwDmP4INdUw5BXgEOcEHI1x2TQxt6BAOFdvSgzulWRg/Vy/A5c2W9rY7CL
	 9BIe4/Ma107GQ1G3MRxzS/WRyU8W2m09Myzas1td9OLEA1EQSxafX47zY/zHpogTsA
	 6WJRAYHen6DPuJ2DIwJsClUR6HJbdRDDlfeZ/4bRfjUYizquj8jPHqGdYXUZPEvI9A
	 TYyTeKckemUOFgrL30YV/fOEHg62WO0/GF2lPTwmKhl2Aq6zK6LrDG9ym1oUXmMc3N
	 I9wPfu+NnJGpw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vgPSi-000000043IF-0cno;
	Thu, 15 Jan 2026 16:40:40 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jani Nikula <jani.nikula@linux.intel.com>
Subject: [PATCH v2 02/15] docs: conf.py: don't use doctree with a different meaning
Date: Thu, 15 Jan 2026 16:40:23 +0100
Message-ID: <34a3b676b2eaa58058a2578f5aa1427274fc633e.1768488832.git.mchehab+huawei@kernel.org>
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

At Sphinx, doctree is a directory where doc build cache is stored.
Use a better name.

No functional changes.

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/conf.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 1ea2ae5c6276..548e57b1fb01 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -33,7 +33,7 @@ else:
     include_patterns = ["**.rst"]
 
 # Location of Documentation/ directory
-doctree = os.path.abspath(".")
+kern_doc_dir = os.path.abspath(".")
 
 # Exclude of patterns that don't contain directory names, in glob format.
 exclude_patterns = []
@@ -70,7 +70,7 @@ def config_init(app, config):
     # setup include_patterns dynamically
     if has_include_patterns:
         for p in dyn_include_patterns:
-            full = os.path.join(doctree, p)
+            full = os.path.join(kern_doc_dir, p)
 
             rel_path = os.path.relpath(full, start=app.srcdir)
             if rel_path.startswith("../"):
@@ -80,7 +80,7 @@ def config_init(app, config):
 
     # setup exclude_patterns dynamically
     for p in dyn_exclude_patterns:
-        full = os.path.join(doctree, p)
+        full = os.path.join(kern_doc_dir, p)
 
         rel_path = os.path.relpath(full, start=app.srcdir)
         if rel_path.startswith("../"):
@@ -92,7 +92,7 @@ def config_init(app, config):
     # of the app.srcdir. Add them here
 
     # Handle the case where SPHINXDIRS is used
-    if not os.path.samefile(doctree, app.srcdir):
+    if not os.path.samefile(kern_doc_dir, app.srcdir):
         # Add a tag to mark that the build is actually a subproject
         tags.add("subproject")
 
-- 
2.52.0

