Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A33C18052;
	Tue, 28 Jan 2025 00:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022797; cv=none; b=NJtVvaBzuU4nflso9rBlVI63Gv+8fLReH3isoYMGzlukx9CyDZeUvof5NxDExPfBTU23iJnkTlXyzelsG89P7xbsmU2EdN5OWHfpuWBCKyFk19Tq+e2JBjT+npOllZRbNnKeiNmX4MS7JNeM2X33sennPKm+xQcFcUDo256oFw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022797; c=relaxed/simple;
	bh=svI6Yddco5aZW7xRQWuqtZoHkCHFW0NEnfZcjQdfwEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KVhMcibc+iKG0PU3pzXYxGiYwrzoZt4m0GBOIkpTqa9gmTlWFAHM6FPzXbGwtcERBtM/aAD2oN9xMS/5u6D4i6mMvGvaTfzMRdFWldXCV/ZJwUqagrr5dfLmAOjEsq0clwoUAR6lVyDV2ubs+S7xMt8020ThnNZIAl4FjQQv9kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M6Rz+mlA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M6Rz+mlA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF90C113CF;
	Tue, 28 Jan 2025 00:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022796;
	bh=svI6Yddco5aZW7xRQWuqtZoHkCHFW0NEnfZcjQdfwEk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M6Rz+mlAUamSJNBj3NZwDFbo2SLKdKGrJgD3PlS7oX5ze/ueCmACplFNoLKBxhFfN
	 FzI8sXNkwL4PE2SMbzUPgDYVqvf/IjOh4/uLmqxkpE+4jKbg3+YKUd6SBzE0ekFJXy
	 AOHmW/KdbAsJyqM0oIpAlOUvM7ouAQvuxtrLq8esqndxRUbZgvECuIOn1q6GoQ1TD3
	 Iiq6YfdSrkL1zfJVxkRaXHF27hJ2GaV21mdK8d+pmvaPfGXYVBCyGbVcr/4VhXHaAn
	 4CIv2bYCAWTGRqRf/NyGpj3aUlTE2jOYwpPLYraTKy3sTWwsH+M4FBvGXfdZzqwPV5
	 GSO3TM2muIZng==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7i-0000000DRM3-16Ve;
	Tue, 28 Jan 2025 01:06:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 26/38] docs: sphinx/kernel_abi: avoid warnings during Sphinx module init
Date: Tue, 28 Jan 2025 01:06:15 +0100
Message-ID: <87b384db252838a858243f4aaa3fdf58360a96dd.1738020236.git.mchehab+huawei@kernel.org>
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

Sphinx logging system doesn't like warnings during module load,
as it understands that such logs are produced at the wrong time:

	WARNING: while setting up extension automarkup: /sys/devices/system/cpu/cpuX/topology/physical_package_id is defined 2 times: /new_devel/v4l/docs/Documentation/ABI/stable/sysfs-devices-system-cpu:27; /new_devel/v4l/docs/Documentation/ABI/testing/sysfs-devices-system-cpu:70
	WARNING: while setting up extension automarkup: /sys/devices/system/cpu/cpuX/topology/ppin is defined 2 times: /new_devel/v4l/docs/Documentation/ABI/stable/sysfs-devices-system-cpu:89; /new_devel/v4l/docs/Documentation/ABI/testing/sysfs-devices-system-cpu:70

So, use a function to allocate/process ABI files and use it to
be called at kernel_abi.py, as automarkup also needs it to
produce the right cross-references.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/automarkup.py |  4 +++-
 Documentation/sphinx/kernel_abi.py | 23 +++++++++++++++++++----
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
index 7d91c39b4ca6..22defc18d6d2 100644
--- a/Documentation/sphinx/automarkup.py
+++ b/Documentation/sphinx/automarkup.py
@@ -11,7 +11,7 @@ from sphinx.errors import NoUri
 import re
 from itertools import chain
 
-from kernel_abi import kernel_abi
+from kernel_abi import get_kernel_abi
 
 #
 # Python 2 lacks re.ASCII...
@@ -287,6 +287,8 @@ def markup_abi_ref(docname, app, match):
     #
     # Go through the dance of getting an xref out of the std domain
     #
+    kernel_abi = get_kernel_abi()
+
     fname = match.group(1)
     target = kernel_abi.xref(fname)
 
diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 6d1b34e44d46..379a877b75f9 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -52,10 +52,23 @@ __version__ = "1.0"
 logger = logging.getLogger('kernel_abi')
 path = os.path.join(srctree, "Documentation/ABI")
 
-# Parse ABI symbols only once
-kernel_abi = AbiParser(path, logger=logger)
-kernel_abi.parse_abi()
-kernel_abi.check_issues()
+_kernel_abi = None
+
+def get_kernel_abi():
+    u"""
+    Initialize kernel_abi global var, if not initialized yet.
+
+    This is needed to avoid warnings during Sphinx module initialization.
+    """
+    global _kernel_abi
+
+    if not _kernel_abi:
+        # Parse ABI symbols only once
+        _kernel_abi = AbiParser(path, logger=logger)
+        _kernel_abi.parse_abi()
+        _kernel_abi.check_issues()
+
+    return _kernel_abi
 
 def setup(app):
 
@@ -83,6 +96,8 @@ class KernelCmd(Directive):
     }
 
     def run(self):
+        kernel_abi = get_kernel_abi()
+
         doc = self.state.document
         if not doc.settings.file_insertion_enabled:
             raise self.warning("docutils: file insertion disabled")
-- 
2.48.1

