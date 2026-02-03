Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D633ACF01;
	Tue,  3 Feb 2026 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130555; cv=none; b=GitdkBy/O9G1XUPWLBfe0PeKqBARNP8RBHEDJm5d1MNm8djA72duyP0yutBluLHi6YGK7ou3Ur/MCsSb2JsbzKJkif1yUGLa+vfIaW/QFdlxv9weLWXqUi8/XYL4bDnoE2Gji+4w3zfJDIXslnqFFbs/Rf7/druqb+P/t+PuiZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130555; c=relaxed/simple;
	bh=c+lWtus7uYVGOL7ZaUEaEUQ07MpkIkG4WhZzL62rQhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PXqfI5Fv6vpwwP9xrhjkseVtlVSLUIAHMaKyhVNTmy1p7eTa2dz/YluRO1AhiOFZ+bakOTjr7qT0pWHzmVIpxEN1z/LMZKqKSkAG0QmQ0yV6dDG4+/9pA2Zy21/q0EQfokoHOv3Lq083VrPvLd7rJ8Jprk2BaRXl/f1GxHGUuvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MGuPs9xj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MGuPs9xj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFCB2C2BCB0;
	Tue,  3 Feb 2026 14:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770130554;
	bh=c+lWtus7uYVGOL7ZaUEaEUQ07MpkIkG4WhZzL62rQhY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MGuPs9xjUkE5gdBJmQr4gw+D29rzhHUuMRDvBDGbmfB3nxC3RqZ3dwfbiO6hvwL3A
	 uqHV5fJ06hfLK87n+JFNl/MKoD/0OmOB8kPsh/SVphgxQy2tM1UodiKL3Vipyam+25
	 TD1YjUyUrYR+XDJYvtEX67xWKu3lK42s8bwfY3w/EMgqRpdWLG90RTWsOpxZucTYGp
	 z/+0BXRj+5ksZUttwFT3ip9jcUQLvND3ChvwGWbVkVMavcG+nh1FO25AT8aPQYMLRH
	 6iX1fSla1xILO68Ga5RMrOgEEgYeg2CE5bUa+9y53XM0B3UssQHFzzQixUyNz6Xl5N
	 DgbRvLWj1fYUw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vnHom-000000027U8-3NzE;
	Tue, 03 Feb 2026 15:55:52 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 01/15] unittests: unittest_helper: store verbosity at the environment
Date: Tue,  3 Feb 2026 15:55:29 +0100
Message-ID: <a3dff083d3534b3fdc9f8b25dca1681cb3a8279c.1770128540.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770128540.git.mchehab+huawei@kernel.org>
References: <cover.1770128540.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

As tests may want to add their own verbosed messages, pass
the defined verbosity level to the test classes via env.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/unittest_helper.py | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/tools/lib/python/unittest_helper.py b/tools/lib/python/unittest_helper.py
index d2efb78d8561..55d444cd73d4 100755
--- a/tools/lib/python/unittest_helper.py
+++ b/tools/lib/python/unittest_helper.py
@@ -279,14 +279,19 @@ class TestUnits:
         if not caller_file and not suite:
             raise TypeError("Either caller_file or suite is needed at TestUnits")
 
-        if env:
-            patcher = patch.dict(os.environ, env)
-            patcher.start()
-            # ensure it gets stopped after
-            atexit.register(patcher.stop)
-
         verbose = args.verbose
 
+        if not env:
+            env = os.environ.copy()
+
+        env["VERBOSE"] = f"{verbose}"
+
+        patcher = patch.dict(os.environ, env)
+        patcher.start()
+        # ensure it gets stopped after
+        atexit.register(patcher.stop)
+
+
         if verbose >= 2:
             unittest.TextTestRunner(verbosity=verbose).run = lambda suite: suite
 
-- 
2.52.0

