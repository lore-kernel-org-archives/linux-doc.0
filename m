Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F370B30507F;
	Thu, 18 Sep 2025 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196507; cv=none; b=R37Jw4JoHSkP9eKLkB/1I+7fOEiRDAJsnMmvePn0NXoMD+fcIA48BDtfkydmkqoi7+Ri9X7cv7bqL/UiNaubbzNZqEK7sVbt/MFYFQyzPtnkr+kmvwex5PRSDZT3INvxsq5s8uO0plx2M9tBqgJM9Q3l63ni4BnGqyC7W+B5S6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196507; c=relaxed/simple;
	bh=WDtXWJRYNGux0wtm1BAyWaADemyId01OLfJz/YWYDuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EP439z9DqAmlTBwrS6oZuRIG8UYZN2f6wAqM2HGeYXyfOLMs3cxqg8pj2wHIubuEg5EuzP+aA2Qx9D1fS6svk4FwHQP15eOp98Ur3IAvp+cAWMQqEJm7ZHjZH/9i/NqC47BlriaQEM7aLdAj/BGW4/6ltPrNdcy2x3d7ehkT71c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9HwUcC8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9HwUcC8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D487AC4AF0C;
	Thu, 18 Sep 2025 11:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758196506;
	bh=WDtXWJRYNGux0wtm1BAyWaADemyId01OLfJz/YWYDuE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i9HwUcC8S4myQ3uK5hVbP+BgkoxMBw9lONzsssuAWnwkXKxLsvpueRpRMuRzKyj5B
	 9pefEFMHKh8DjCbTt+vCCrpzTHZo93TBsUkkMrnPdCYJpnLwjoIgKUziMbwv7npKgf
	 KeFOAy9e5b2FUoyVv11fFIcyE10oWoY1d0iFqRALQw4ljgz58tCTdIlkd2cHIle/Uo
	 yO3N5OfE8wI1GWwDZSF1YmaHW/wLg39X7lwZEW6RdaN8ST/VR6cGJTjRYgmAZWpm0o
	 4jWBWf62N75xYcJRb/GNMssyChY0K4JtwrhrSI6hdvkj6BMbl3ajV5kFc9x8wCtXMw
	 eRJZjN9vz3Tsg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uzDE8-0000000CrtF-1521;
	Thu, 18 Sep 2025 13:55:04 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 17/24] tools/docs,scripts: sphinx-*: prevent sphinx-build crashes
Date: Thu, 18 Sep 2025 13:54:51 +0200
Message-ID: <1d0afad8fe3d83182be3a08eb00dd71322e23e69.1758196090.git.mchehab+huawei@kernel.org>
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

On a properly set system, LANG and LC_ALL is always defined.
However, some distros like Debian, Gentoo and their variants
start with those undefioned.

When Sphinx tries to set a locale with:

	locale.setlocale(locale.LC_ALL, '')

It raises an exception, making Sphinx fail. This is more likely
to happen with test containers.

Add a logic to detect and workaround such issue by setting
locale to C.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/sphinx-build-wrapper | 11 +++++++++++
 tools/docs/sphinx-pre-install   | 14 +++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index 0fe21b343e7a..6c2580303e8e 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -45,6 +45,7 @@ the newer version.
 """
 
 import argparse
+import locale
 import os
 import shlex
 import shutil
@@ -565,6 +566,16 @@ class SphinxBuilder:
         if not sphinxdirs:
             sphinxdirs = os.environ.get("SPHINXDIRS", ".")
 
+        #
+        # The sphinx-build tool has a bug: internally, it tries to set
+        # locale with locale.setlocale(locale.LC_ALL, ''). This causes a
+        # crash if language is not set. Detect and fix it.
+        #
+        try:
+            locale.setlocale(locale.LC_ALL, '')
+        except locale.Error:
+            self.env["LC_ALL"] = "C"
+
         #
         # sphinxdirs can be a list or a whitespace-separated string
         #
diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
index d6d673b7945c..663d4e2a3f57 100755
--- a/tools/docs/sphinx-pre-install
+++ b/tools/docs/sphinx-pre-install
@@ -26,6 +26,7 @@ system pacage install is recommended.
 """
 
 import argparse
+import locale
 import os
 import re
 import subprocess
@@ -422,8 +423,19 @@ class MissingCheckers(AncillaryMethods):
         """
         Gets sphinx-build version.
         """
+        env = os.environ.copy()
+
+        # The sphinx-build tool has a bug: internally, it tries to set
+        # locale with locale.setlocale(locale.LC_ALL, ''). This causes a
+        # crash if language is not set. Detect and fix it.
         try:
-            result = self.run([cmd, "--version"],
+            locale.setlocale(locale.LC_ALL, '')
+        except Exception:
+            env["LC_ALL"] = "C"
+            env["LANG"] = "C"
+
+        try:
+            result = self.run([cmd, "--version"], env=env,
                               stdout=subprocess.PIPE,
                               stderr=subprocess.STDOUT,
                               text=True, check=True)
-- 
2.51.0

