Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CFB356A1F;
	Mon, 12 Jan 2026 11:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768217036; cv=none; b=sWrd977JUaaGXjJauyz/aQkaQRwFg/AbaWPfy9Uj2zjU6xNSv3GYh0/i8jBUpvyiEWBNXEn9N18tf/WKC7gV/4ma4tWlFJBQoVhZxHnX7v5+cd21qnniySn7JsI71LMljUvKv1u8DEPsSHqa2N2kVplmfQwgLpaEisJKxlZ2IU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768217036; c=relaxed/simple;
	bh=+lKeuLhTf7AU/sOR7BZ3YNtBXxJWLuRjIlJ5L7U7ggc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f6NmwvxsqFunitup+PwgcvHc3IE+M/rUhIJ+XwsEeF32qEbHRVvbjSjBvpFZKOPnqJL7oQsrkLBuYPIaghYgxUpCbWwJv9HhPwEZnoc4CahuNxGWgAscU+jStmBkEP213RpMNsYeibPNQ6TJyVqRUzBwO+1cjhZ7jBwxqe7HPGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7XbkGCE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7XbkGCE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04944C19422;
	Mon, 12 Jan 2026 11:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768217036;
	bh=+lKeuLhTf7AU/sOR7BZ3YNtBXxJWLuRjIlJ5L7U7ggc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M7XbkGCEWSXWUsXDuonazQSbzqRGmb1S75byvKBLVhq+byuOdBs3LxpvRVO7OKchb
	 cHCejjzGwB0c5PYDQtkoDNvkuXuPTL191EJJpC6LFW257rDKQrnNAV80zg5mvWRFLn
	 T8caJaYDeSJQMfZuwW/RDsZUrzYyDhn9yLC+H53VFDGB8u7hH/QFUbNcCmESooyrCt
	 WAqvaqXN5XLCn28U8Xje2Rcrgiy4BkocXq6/1nWJXcr1zG8+j0XYorY52nQ85ZL6AU
	 mgMa6Lx4WAeVLOvfrojoP2ZVH2CV1lbomXXgf+5Bh5969IqaiLcOaB5CW8g4nRO64m
	 XZjcfc+E1Yy1g==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vfG1a-00000000DTm-0sz9;
	Mon, 12 Jan 2026 12:23:54 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@intel.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 2/4] scripts/kernel-doc: avoid error_count overflows
Date: Mon, 12 Jan 2026 12:23:24 +0100
Message-ID: <bb0bd9ecbf38f8d28749ea15f8d04fb640e0c76d.1768216455.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768216455.git.mchehab+huawei@kernel.org>
References: <cover.1768216455.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The glibc library limits the return code to 8 bits. We need to
stick to this limit when using sys.exit(error_count).

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc.py | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
index 7a1eaf986bcd..600bdfea6a96 100755
--- a/scripts/kernel-doc.py
+++ b/scripts/kernel-doc.py
@@ -176,7 +176,14 @@ class MsgFormatter(logging.Formatter):
         return logging.Formatter.format(self, record)
 
 def main():
-    """Main program"""
+    """
+    Main program
+    By default, the return value is zero on parsing errors or when the
+    Python version is not compatible with kernel-doc. The rationale is
+    to not break Linux compilation on such cases.
+    If -Werror is used, it will return the number of parse errors, up to
+    255 errors, as this is the maximum value allowed by glibc.
+    """
 
     parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter,
                                      description=DESC)
@@ -321,18 +328,23 @@ def main():
     if not error_count:
         sys.exit(0)
 
+    if args.verbose:
+        print("%s errors" % error_count)                # pylint: disable=C0209
+
+
     if args.werror:
         print("%s warnings as errors" % error_count)    # pylint: disable=C0209
+
+        #
+        # Return code is 8-bits, as seen at:
+        #   https://www.gnu.org/software/libc/manual/html_node/Exit-Status.html
+        # Truncate to avoid overflow
+        #
+        if error_count > 255:
+            error_count = 255
+
         sys.exit(error_count)
-
-    if args.verbose:
-        print("%s errors" % error_count)                # pylint: disable=C0209
-
-    if args.none:
-        sys.exit(0)
-
-    sys.exit(error_count)
-
+    sys.exit(0)
 
 # Call main method
 if __name__ == "__main__":
-- 
2.52.0

