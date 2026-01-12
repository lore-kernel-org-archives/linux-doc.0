Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C00356A1E;
	Mon, 12 Jan 2026 11:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768217036; cv=none; b=CiKO5UCmatu7dZol0C9rMnzOgWDvCWZ/H/aGBMvlyk++w0hZLo56h9yNpFDjZIWNyp9+ewxBB6DnLQ17XVOfV4TgEHZ4rtSiCF6L1i+85wySRKr5gNAH6zVXSntVt6cWSKtNuAV/7sg7nCsV8X9WEmAK2vBI5/D/vhTMYzOxu70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768217036; c=relaxed/simple;
	bh=M8CQBtXD5x5BId0iNs+suDaY/SBqip9p2vko/lQ8Y1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KHQ3e/IKVZtGxRyQ6KNALRVyZlcDL4sNlSFeHIHwphdye25aqxcEHZmovrUJI0wr8soJHCoinKW8G3seIzfWIQY7CrBInWpOg2r40r8iuURAAiQF7jcd0UbkjqGZN7r3Cq9A+FHPGPTTHth1yPd+p5zJ/QayU81D1WItN5nbssw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJ2PCPpZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJ2PCPpZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04916C19421;
	Mon, 12 Jan 2026 11:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768217036;
	bh=M8CQBtXD5x5BId0iNs+suDaY/SBqip9p2vko/lQ8Y1M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VJ2PCPpZKwRx9Og7IO00VWIwe1CvaMFO8ve5wY1lHDK67zVQs4WAU/jcGqVLUW+2T
	 Ibd7bk7LepDx3o/gYDnxpSfe/vexxZy5qdUl00v2QETyZ+4qBg2FJdHZRK9sylYDPQ
	 wsVEGBRDnUQ6CrnghxwLoNo2vUOWC9ru3mN0K3xjeZDFhNfR+5pU/fxnTcfO2JEI/K
	 7i/w4eOTxFYP2/QpXd0eqwEcfxTKokJlYPbqSDgY0Pzm5k/sWau9pUdQDThigkvYsX
	 uSxWLFCrDR8sr1mrI/PO7Pe3FU7Xt3TATYJ23OhI2BiWaReG5Y3Vj/63KNyMbNPO/v
	 ql0x5FnxyAqdw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vfG1a-00000000DTi-0mD3;
	Mon, 12 Jan 2026 12:23:54 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 1/4] scripts/kernel-doc: fix logic to handle unissued warnings
Date: Mon, 12 Jan 2026 12:23:23 +0100
Message-ID: <914b07e496fd204d7082c6e1b138d99d8488da9b.1768216455.git.mchehab+huawei@kernel.org>
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

