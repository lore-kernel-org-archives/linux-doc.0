Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DF238645C;
	Mon, 23 Mar 2026 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257059; cv=none; b=eCbA6i+x5PvOI3wKwRPOE1dyjJYoOT0YlsrbEp60IDglDtX2osJIh5OWnMGdEMo4rhQ/MYNOtXnM9Jyb56wtGY5khV2vzVFkfU+A38gg3dADAS65lCoL6uPMpwFln78vrvFUGA5o4FKI1loNvADlN46nStI1/0LlzObMGsODNJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257059; c=relaxed/simple;
	bh=SZbd372k/0FI0Z5e+bMZ4b4koJeDa2OHUSQu+POB+Eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gB5nCKyIPdO5ZplZ5gQCHrofCDiz0e8gzJOr3S+tJMTAd9FfEpDHuosE/CNSFxSvu0AJ7k2Lsx+cquI6sNMh2uHpHi/llQ6ZF7Hs5LE3m0s0PpNpgYVYGibhd3hLkZaUncW7iQNtcPXCleZ2h8+bP3EGdB1b1QqAhZVB2oWORag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZlUeLCsE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZlUeLCsE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE19C2BCB1;
	Mon, 23 Mar 2026 09:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774257058;
	bh=SZbd372k/0FI0Z5e+bMZ4b4koJeDa2OHUSQu+POB+Eg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZlUeLCsEWUOGMRKsvciqc+0sdMlCoolYL2g0TQa69E4dFX1jtrs40Q3r+A7LSp37M
	 4EyfioJ2fGr+lJ+6YHVy0fKa3IOdS6Y82fcCmI1g0UjQArbz2RrMCfBvlpC14Tju+6
	 NMWKYiGu782suDfxm67EuJ6ROdoIHVQn06R97obWzoVL3FLK2sqaKoZVW33dMUfn+y
	 sLFf4Um1GPvI42eNnfIF2Ot6DRLRRb+moz5mQtFXvY4XXpJd621vSyIiNUHptgU5dx
	 BwZarOgC8Ok5o2n7LG915ShFr02MKHXjC9ToWLBd8QWNPQjUlpJqm+sNZxpZfhged9
	 l8SHVVJRE+s/Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w4bJI-00000002yWs-2czj;
	Mon, 23 Mar 2026 10:10:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 10/10] docs: c_lex.py: store logger on its data
Date: Mon, 23 Mar 2026 10:10:53 +0100
Message-ID: <467979dc18149e4b2a7113c178e0cb07919632f2.1774256269.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774256269.git.mchehab+huawei@kernel.org>
References: <cover.1774256269.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

By having the logger stored there, any code using CTokenizer can
log messages there.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/c_lex.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/c_lex.py b/tools/lib/python/kdoc/c_lex.py
index e01b154f458e..cb95f5172448 100644
--- a/tools/lib/python/kdoc/c_lex.py
+++ b/tools/lib/python/kdoc/c_lex.py
@@ -177,7 +177,7 @@ class CTokenizer():
     # This class is inspired and follows the basic concepts of:
     #   https://docs.python.org/3/library/re.html#writing-a-tokenizer
 
-    def __init__(self, source=None, log=None):
+    def __init__(self, source=None):
         """
         Create a regular expression to handle RE_SCANNER_LIST.
 
@@ -188,6 +188,12 @@ class CTokenizer():
         when matching a code via RE_SCANNER.
         """
 
+        #
+        # Store logger to allow parser classes to re-use it
+        #
+        global log
+        self.log = log
+
         self.tokens = []
 
         if not source:
-- 
2.53.0

