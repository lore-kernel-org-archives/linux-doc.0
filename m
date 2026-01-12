Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77E42C11D5;
	Mon, 12 Jan 2026 15:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768230487; cv=none; b=ch8AH515XyLXU22xg1MqMnwoz7yunYEuXmSrTxYf3IQ50ceutLgoYzWhXBEJkFnmYvAzuVi3l9TDfd7D+YjIWfWaP0i9UBU5vEdGuHpiqPKcC3nPufsNk3C1KDDu3EP0Oowj5BilbOM0jLDSgGnyXYV0OM1bNlPNFfDdzHxKbIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768230487; c=relaxed/simple;
	bh=z88sTeFfUqwT1Sl7+wGd+pah5LIlpO5VdoqCx8UsYkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lztko1giT6BwLI2p5RG1wVigeTB7V5cBI1unvUC3ywHtjPNv9Blm7RqShlYFLkgjJWzaMaGYzLHjyh54M/clMPLpJEsohbZLb2OcRnc2p6UqtplaM66PAFb+/SAavkN0VAik7IKdjuczW1YNGF3SNOnaFY4uXHLmU2V8NHKhEwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ws0oDdcz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ws0oDdcz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 708EFC4AF09;
	Mon, 12 Jan 2026 15:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768230487;
	bh=z88sTeFfUqwT1Sl7+wGd+pah5LIlpO5VdoqCx8UsYkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ws0oDdczja0Qb/XtQ9VnWWv4tqsv2MaZcvUO5DnPgwwGDsab93x4VDWPx52JloVFC
	 ehyE/V+lH+1DwDIi3Ao6ggv+xjbn232Ufro7xw2czZFy8kZbKnGb07jlsayWYLHFtE
	 1LR8c3IN5BFauqK1cPvF1nw7oj/Kd9QFbUFC6V2IKazkA/3EXCyStIBx0f2J3s85Un
	 Za1kOzLq5iB3ZEmK+e0F7iak76jLZQuhiqv93fBX3mqqDmXb+0rYC1onv4bOeOTxp5
	 SR57fG+srgQNsxxhVvwHvG0YYR8dXPUAX/tlD+roZDp4yzmKDFfnTS8Nl9tLURwTtQ
	 WOdZ6UeWXwPEg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vfJWX-00000000JWm-2pB6;
	Mon, 12 Jan 2026 16:08:05 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 1/4] scripts/kernel-doc: fix logic to handle unissued warnings
Date: Mon, 12 Jan 2026 16:06:50 +0100
Message-ID: <afac0e4eec12bd5cc9a5040359f26058a3c1df1e.1768229902.git.mchehab+huawei@kernel.org>
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

Changeset 469c1c9eb6c9 ("kernel-doc: Issue warnings that were silently discarded")
didn't properly addressed the missing messages behavior, as
it was calling directly python logger low-level function,
instead of using the expected method to emit warnings.

Basically, there are two methods to log messages:

- self.config.log.warning() - This is the raw level to emit a
  warning. It just writes the a message at stderr, via python
  logging, as it is initialized as:

    self.config.log = logging.getLogger("kernel-doc")

- self.config.warning() - This is where we actually consider a
  message as a warning, properly incrementing error count.

Due to that, several parsing error messages are internally considered
as success, causing -Werror to not work on such messages.

While here, ensure that the last ignored entry will also be handled
by adding an extra check at the end of the parse handler.

Fixes: 469c1c9eb6c9 ("kernel-doc: Issue warnings that were silently discarded")
Closes: https://lore.kernel.org/linux-doc/20260112091053.00cee29a@foz.lan/
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 tools/lib/python/kdoc/kdoc_parser.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index a9a37519145d..aed07fdaa561 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -459,7 +459,7 @@ class KernelDoc:
         #
         if self.entry and self.entry not in self.entries:
             for log_msg in self.entry.warnings:
-                self.config.log.warning(log_msg)
+                self.config.warning(log_msg)
 
         self.entry = KernelEntry(self.config, self.fname, ln)
 
@@ -1741,6 +1741,10 @@ class KernelDoc:
                         # Hand this line to the appropriate state handler
                         self.state_actions[self.state](self, ln, line)
 
+            if self.entry and self.entry not in self.entries:
+                for log_msg in self.entry.warnings:
+                    self.config.warning(log_msg)
+
         except OSError:
             self.config.log.error(f"Error: Cannot open file {self.fname}")
 
-- 
2.52.0

