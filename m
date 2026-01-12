Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76EE24A07C;
	Mon, 12 Jan 2026 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768230487; cv=none; b=aoggwnwuyLiahO5jCFUl31ogKsjdL5xUuw/nhjPi0MC5WAGsWoyjqKfUviClobOTvYYwQSt8Xlrbz0iYWTmcTEKufZve02k3mv5FlqklBEvDMM9HREDuzhmfp1ISkzW9M+qVjj1si1tJ/RJ3PBB04e/7mrrtK0lVEBbrW0WvjTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768230487; c=relaxed/simple;
	bh=efaAoQJ46q/MA7bC6BpXipDb0T3zDwPIKRwh3uhkakE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TXuKSiAcFS/botL/1ioXdQ91r5IR4GzyjNNnsc89/BwimGhO4h5dpyfUwncTBtK7H2N17jdQ68uvVHpe/QeqcoJqHV3myokrT2SufmgaTxOLSNATIaHk2iMA8OMnqYqK4wHtNl9uSu/6EyEuidbxnpPuoSL2mhD/T2sG6Kypa3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LkjbItZ+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LkjbItZ+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A70C19424;
	Mon, 12 Jan 2026 15:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768230487;
	bh=efaAoQJ46q/MA7bC6BpXipDb0T3zDwPIKRwh3uhkakE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LkjbItZ+1RIo9EN+ZfuO1cglb8iIEPZJysYmwGsp9M+abK6EyLkTOUYHGtmIaKYXi
	 RK4946RKw5GlUcYO31ELvxXVPRT6Gwb3VTzF2VVgVPO2j4W7pcAmGPBNvcl2EMhwaO
	 DN/7Qxg2jX66CXDnJgBj9gt4pw+evTg/tSgG0RDPsQ50R4raUgiUnuJc97kehnbdH5
	 mckCS9Eo6FRsuMbUGupOr+6zyeWOk9nrqKABrsxb6YjQotxFwPVelnLagSTd58IYVq
	 +vbksYNjQD2cxXuMBZV2OszPSCvMhK6jk4sW5umpW/NG9ebhAvRUs7PQ7qKRyNFNYE
	 MHP72fR2FWB8Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vfJWX-00000000JWq-2w5B;
	Mon, 12 Jan 2026 16:08:05 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 2/4] scripts/kernel-doc: avoid error_count overflows
Date: Mon, 12 Jan 2026 16:06:51 +0100
Message-ID: <32749671865f095a5e981f36bf380771a83f3b09.1768229902.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768229902.git.mchehab+huawei@kernel.org>
References: <cover.1768229902.git.mchehab+huawei@kernel.org>
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
 scripts/kernel-doc.py | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
index 7a1eaf986bcd..5d2f29e90ebe 100755
--- a/scripts/kernel-doc.py
+++ b/scripts/kernel-doc.py
@@ -116,6 +116,8 @@ SRC_DIR = os.path.dirname(os.path.realpath(__file__))
 
 sys.path.insert(0, os.path.join(SRC_DIR, LIB_DIR))
 
+WERROR_RETURN_CODE = 3
+
 DESC = """
 Read C language source or header FILEs, extract embedded documentation comments,
 and print formatted documentation to standard output.
@@ -176,7 +178,21 @@ class MsgFormatter(logging.Formatter):
         return logging.Formatter.format(self, record)
 
 def main():
-    """Main program"""
+    """
+    Main program
+    By default, the return value is:
+
+    - 0: parsing warnings or Python version is not compatible with
+      kernel-doc. The rationale for the latter is to not break Linux
+      compilation on such cases;
+
+    - 1: an abnormal condition happened;
+
+    - 2: arparse issued an error;
+
+    - 3: -Werror is used, and one or more unfiltered parse warnings
+         happened.
+    """
 
     parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter,
                                      description=DESC)
@@ -323,16 +339,12 @@ def main():
 
     if args.werror:
         print("%s warnings as errors" % error_count)    # pylint: disable=C0209
-        sys.exit(error_count)
+        sys.exit(WERROR_RETURN_CODE)
 
     if args.verbose:
         print("%s errors" % error_count)                # pylint: disable=C0209
 
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

