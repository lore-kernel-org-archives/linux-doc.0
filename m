Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C599E39FCDE;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825080; cv=none; b=WLByfIHQlyHLwwuAF1vYKCLQBvcwJwIRcqAkvBr5wM7TVnDvweH0vkA96bGo/6+iE9YTgfYtZU8xH7TWk/aYhh4xRaj/wvE8wZ1VgdYN1GCckdWNLL02YDHDNtRAMbFrJxyIJgTCiTkiJAIVOy1kTlCdCv9Fc1ru8h1getKSIbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825080; c=relaxed/simple;
	bh=m5R1AXbCcILaBo3xNerP4PoMfOyK0t6s1ZbCKToPNNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DVHtQlcIBnxlIGUbPd/i0U6LXOwhxsmLW7gQY8yHVDEeUNC+z9wzSgMnrjRCoZWufk/6mjLJPUBgsCb+3fE53k2lxAfa7Hcq/G7mF7p6q3mNGrs+AxVqaDS8g4+NMrg9kwqADPDweqwwHyTXsyXymxeZOPVSmowTJWwpmsybC9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UbtVRubQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbtVRubQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C676C19421;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773825080;
	bh=m5R1AXbCcILaBo3xNerP4PoMfOyK0t6s1ZbCKToPNNs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UbtVRubQf8NEHQ9TwuK+JDLk+vr9iz3ePZxQ7AVpPL9G1THNE8XeqSStV/rzXj9P7
	 oQ38QZOa8M92hCl8k3AWy4FrQq85J9GaGu/SG0gyICokzxqsYKMwcXRXlGNxO2dZqf
	 uGN60FovXFUPrNOPxeFI2nf1IdBc4UhGknS05PDYxBfT+vOKFQTjHt8UAOVfTxtBYU
	 PB+sLkm5Y87lFFYxL3nJRPcZ5sHQdp/qVIF8YMiFKqVe4mfU9XbWtIG1sUNLDwGk0L
	 IREVame0g8jJev1+ERok9NZgnvPetl2jUIebHvpkZ41tG2GOCvjd+CrRuNpe5mzt26
	 aTAOLSQd/2Yxg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2mvu-00000002fpJ-1yD9;
	Wed, 18 Mar 2026 10:11:18 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 01/14] unittests: test_tokenizer: better handle mismatch error
Date: Wed, 18 Mar 2026 10:11:01 +0100
Message-ID: <6e19578bc1ffa96e536dc31997ff658017f60173.1773823995.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773823995.git.mchehab+huawei@kernel.org>
References: <cover.1773823995.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The current logic is too sensitive to how c_lex name is
placed. Also, it doesn't really check the log.

Change it to check if the expected message will be reported
after a call to C tokenizer with an invalid source.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/unittests/test_tokenizer.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tools/unittests/test_tokenizer.py b/tools/unittests/test_tokenizer.py
index 5634b4a7283e..d1f3c565b9cf 100755
--- a/tools/unittests/test_tokenizer.py
+++ b/tools/unittests/test_tokenizer.py
@@ -46,10 +46,17 @@ def make_tokenizer_test(name, data):
         #
         # Check if logger is working
         #
-        if "log_level" in data:
-            with self.assertLogs('kdoc.c_lex', level='ERROR') as cm:
+        if "log_msg" in data:
+            with self.assertLogs() as cm:
                 tokenizer = CTokenizer(data["source"])
 
+                msg_found = False
+                for result in cm.output:
+                    if data["log_msg"] in result:
+                        msg_found = True
+
+                self.assertTrue(msg_found, f"Missing log {data['log_msg']}")
+
             return
 
         #
@@ -124,7 +131,7 @@ TESTS_TOKENIZER = {
 
     "mismatch_error": {
         "source": "int a$ = 5;",          # $ is illegal
-        "log_level": "ERROR",
+        "log_msg": "Unexpected token",
     },
 }
 
-- 
2.53.0

