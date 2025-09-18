Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21303241696;
	Thu, 18 Sep 2025 11:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758196506; cv=none; b=CejpaBv7PSc3Y/kxw+8xB4dLO5MsigJ5AsVxTenq/xPMBnH+8p7lWe0cPaO/UskXmpAI/E/ZVQYv0Ak2hnw0u0Aky33UqBiCXoTBzDWgza9GjLlRr/NACQbv1myF9BkXVc9NhkQ3Hd2dA2LWkMIZDRICRwA+gwV3otVx1bPBCFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758196506; c=relaxed/simple;
	bh=jlol1TuhVNcZDXlNqsLBvYWROc27W0iXgTQpgdIUTbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lmRlWkpObYrRZT0JRuUvolHD3SbkRrGpjRAFLGTnQlLW4mSbdWD2CRhn36r12HvvOH8qQLoLhR4HQZkCCfVOZg+YSSVPrHwTiYsh/mpIKhv+kxU91OMMFNCwz6v+tlFGc7NhcmPiVDDau+4DF0ueJ0lWycyyRdStNszc3vqu3Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eU4nKEuj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eU4nKEuj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09C7C4CEEB;
	Thu, 18 Sep 2025 11:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758196505;
	bh=jlol1TuhVNcZDXlNqsLBvYWROc27W0iXgTQpgdIUTbU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eU4nKEujOkGza7zI9NVXrOrMjS8/xIaX1IqMt/mLaPZ2MoJQpakuYI+VC06hxEPeb
	 3VNhOAMKZORuKrGeTdOaYKn2iRxvIKa2Uql2yuj3KAOjRTtTvrjdaaR5rkXJZPzOZT
	 U3yXLTjeyexWCMvMRPZE9DyqR8IJuVwq5rfteHx94JjxHHuTBd3zGGfKLqQcQWdOyp
	 XDZNxSqIsaVLzyJHnKtbK2a0dDPhme/8fiNNOFff03UAhYpMiBahJs25Nolh9ruEkN
	 j98mIx0FVuTvzKB/tyemyXbN0IaPWdaMq0pTJJuOasFYcLkumnKWlI/CPFsc++d49K
	 AJ7b0KMjsnnyg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uzDE7-0000000CrlR-3JIW;
	Thu, 18 Sep 2025 13:55:03 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 03/24] scripts/jobserver-exec: add a help message
Date: Thu, 18 Sep 2025 13:54:37 +0200
Message-ID: <64b0339eac54ac0f2b3de3667a7f4f5becb1c6ae.1758196090.git.mchehab+huawei@kernel.org>
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

Currently, calling it without an argument shows an ugly error
message. Instead, print a message using pythondoc as description.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/jobserver-exec | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/scripts/jobserver-exec b/scripts/jobserver-exec
index 40a0f0058733..ae23afd344ec 100755
--- a/scripts/jobserver-exec
+++ b/scripts/jobserver-exec
@@ -1,6 +1,15 @@
 #!/usr/bin/env python3
 # SPDX-License-Identifier: GPL-2.0+
 
+"""
+Determines how many parallel tasks "make" is expecting, as it is
+not exposed via any special variables, reserves them all, runs a subprocess
+with PARALLELISM environment variable set, and releases the jobs back again.
+
+See:
+    https://www.gnu.org/software/make/manual/html_node/POSIX-Jobserver.html#POSIX-Jobserver
+"""
+
 import os
 import sys
 
@@ -12,17 +21,12 @@ sys.path.insert(0, os.path.join(SRC_DIR, LIB_DIR))
 from jobserver import JobserverExec                  # pylint: disable=C0415
 
 
-"""
-Determines how many parallel tasks "make" is expecting, as it is
-not exposed via an special variables, reserves them all, runs a subprocess
-with PARALLELISM environment variable set, and releases the jobs back again.
-
-See:
-    https://www.gnu.org/software/make/manual/html_node/POSIX-Jobserver.html#POSIX-Jobserver
-"""
-
 def main():
     """Main program"""
+    if len(sys.argv) < 2:
+        name = os.path.basename(__file__)
+        sys.exit("usage: " + name +" command [args ...]\n" + __doc__)
+
     with JobserverExec() as jobserver:
         jobserver.run(sys.argv[1:])
 
-- 
2.51.0

