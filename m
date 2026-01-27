Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AE1225775;
	Tue, 27 Jan 2026 08:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769501022; cv=none; b=gjX9oHCr3P48/Cp9MWYNQv7SVqUqB0iO8SD08UEugpXwiHBfTGKe+XPiFl4pY1A3pT6fhBZ1iqFQJmJAUGgSfYddFP9mdSpsnw4TEYgDfHRDHyWzW9OB84JZX5XeFKNUGo9/qULxCg78P3HrA+TG5Z2pTj2Wtch0fFJer6D/xzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769501022; c=relaxed/simple;
	bh=4aMfKYcVERhHxWAsYjEi8+tgICvrID1mZsAmSUTyoxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qSL09zp8nE249UHgFx7+s52jBXoTRxTb19YoREJ3ki1vTnujSTAyY3TlFYoUcIZPnouEsqjl93Wl34TrTUD3uzcBNFxQf/0OFUJmrYaHWpaB82xK/P7grujgjGQl6T6FCYnUJLJXAPP/V+haVfR2DRCYsj2qIrxdOxzdLorSWU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e8PHfVcH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e8PHfVcH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E80C116C6;
	Tue, 27 Jan 2026 08:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769501022;
	bh=4aMfKYcVERhHxWAsYjEi8+tgICvrID1mZsAmSUTyoxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e8PHfVcH/mZAFCMK5DqBk883olLDCPcr17h91d3uQKrA2u6ubr+MdvIehBPVLgM8I
	 mfXJut+OaXnmfyJ9IzWu7hox3WfPZHBZ17A6z8EePcMbKkQMMNgb+DaVzSBo/BkKTn
	 E4QonkU2WX1g7zPu9LuRbYkUTUujHWTuw12ykSmIyC1cO9G0oL+w2b43ruWFi2QZJt
	 Z/xLRMHnMnxieQ8qmbL6AS+8rqNSZ4OUs0Mx2xZHL1BvCKfcyWgByMiCgH/dPM36dN
	 rrn9XmIcKcpsCs9KDImkNUn6iEViehR7pRrh2CJyp8gRyRFS5BED50JBLeRlnQ1SCn
	 rRQTZHbKD7W4A==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vke32-0000000BNMC-2JjR;
	Tue, 27 Jan 2026 09:03:40 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 2/3] docs: sphinx-build-wrapper: allow -v override -q
Date: Tue, 27 Jan 2026 09:03:33 +0100
Message-ID: <38b24e97a3cbd2def418359a8e69b1b087a945ad.1769500383.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769500383.git.mchehab+huawei@kernel.org>
References: <cover.1769500383.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Documentation builds were using "-q" for a long time, but sometimes
it is nice to see the Sphinx progress, without increasing build
verbosity - which would also turn on kernel-doc verbosity.

Instead of doing that, let's parse the sphinx-build already-existing
-v: each time it is used, it increases the verbosity level.

With that, if the default is to use -q, a single -v will disable
quiet mode. Passing more -v will keep increasing its verbosity.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/sphinx-build-wrapper | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index 78ff7ac202ef..8080ace60680 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -168,6 +168,7 @@ class SphinxBuilder:
         parser = argparse.ArgumentParser()
         parser.add_argument('-j', '--jobs', type=int)
         parser.add_argument('-q', '--quiet', action='store_true')
+        parser.add_argument('-v', '--verbose', default=0, action='count')
 
         #
         # Other sphinx-build arguments go as-is, so place them
@@ -179,10 +180,14 @@ class SphinxBuilder:
         # Build a list of sphinx args, honoring verbosity here if specified
         #
 
-        verbose = self.verbose
         sphinx_args, self.sphinxopts = parser.parse_known_args(sphinxopts)
+
+        verbose = sphinx_args.verbose
+        if self.verbose:
+            verbose += 1
+
         if sphinx_args.quiet is True:
-            verbose = False
+            verbose = 0
 
         #
         # If the user explicitly sets "-j" at command line, use it.
@@ -195,8 +200,11 @@ class SphinxBuilder:
         else:
             self.n_jobs = None
 
-        if not verbose:
+        if verbose < 1:
             self.sphinxopts += ["-q"]
+        else:
+            for i in range(1, sphinx_args.verbose):
+                self.sphinxopts += ["-v"]
 
     def __init__(self, builddir, venv=None, verbose=False, n_jobs=None,
                  interactive=None):
-- 
2.52.0

