Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D75386452;
	Mon, 23 Mar 2026 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257059; cv=none; b=V+iUoIYoiGjevZ3wdss8sAablpVE6/43ghHHIVL1evLwGPFLimyWziXohDp3K+pIILnO7Mewx5U3dDFpjYAbKQI1d7zm25gu2BENBpPbdOS0MFqBB6bcqJMvqxQfsYt+26wztMeHOnjq5kfS5Wi83+WILJNg9Owo5cGhioKG4Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257059; c=relaxed/simple;
	bh=a05Vd8qHdqT2ZnuRBv0SnC55B9ItAT/pJgyul5M5lIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uo2QzlvUDVhyztB7zmwyaF8U1wOW/Ptp1F3Ub50ytE/jCKNNYpxHBPBLXB7f07rWbydX71TLrXSGc2aWVShtgt2uNhM58Y56sPJ62VbAct+DGHenqR7LrHFYTLbQybqvLHYiCvGlsRGhOTDbGRp6qkQ9WsS9KHImUQibuQ+fIiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1nF5H6k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1nF5H6k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C41C4AF0C;
	Mon, 23 Mar 2026 09:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774257058;
	bh=a05Vd8qHdqT2ZnuRBv0SnC55B9ItAT/pJgyul5M5lIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W1nF5H6klfS2mJn9aIZd43KfU7bK+Qy/KezTPgU5AJJZFaq93mlK330jq6vyGTPCm
	 dQDuZMJ/ZXhxG2PzIZ3HQi8VJxHSpDDE8MbUbYk6T2Nlb5spvakGvj/coIvHKg0aG7
	 ZN/UmOSiuc97oML14CsMoTaIor+bCyqTaDwnipAPFomANaOHLr1KllkSuun6cQkxuS
	 6dx307FQI8jgsOsLIu/VOYoeoPyJ7vZzZRNYtV11IaNFwunc5HgnoszVH0pJ/iIrX/
	 G3LocYeFG+uRcL+K+IC7cP6yw/zdubiXZ/yYT52jyn9m/uYF4NK07PVx+lBnpH/Ua/
	 R6QURklPtj5QA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w4bJI-00000002yWc-2B6s;
	Mon, 23 Mar 2026 10:10:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 06/10] docs: kdoc_output: fix handling of simple tables
Date: Mon, 23 Mar 2026 10:10:49 +0100
Message-ID: <dea95337c05040f95e5a95ae41d69ddef0aaa8d6.1774256269.git.mchehab+huawei@kernel.org>
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

Fix check for simple table delimiters.

ReST simple tables use "=" instead of "-". I ended testing it with
a table modified from a complex one, using "--- --- ---", instead
of searching for a real Kernel example.

Only noticed when adding an unit test and seek for an actual
example from kernel-doc markups.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_output.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 1b54117dbe19..2bfcd356654b 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -846,14 +846,14 @@ class ManFormat(OutputFormat):
         colspec_row = None
 
         pos = []
-        for m in KernRe(r'\-+').finditer(lines[i]):
+        for m in KernRe(r'\=+').finditer(lines[i]):
             pos.append((m.start(), m.end() - 1))
 
         i += 1
         while i < len(lines):
             line = lines[i]
 
-            if KernRe(r"^\s*[\-]+[ \t\-]+$").match(line):
+            if KernRe(r"^\s*[\=]+[ \t\=]+$").match(line):
                 i += 1
                 break
 
@@ -969,7 +969,7 @@ class ManFormat(OutputFormat):
                     self.data += text
                     continue
 
-                if KernRe(r"^\-+[ \t]\-[ \t\-]+$").match(line):
+                if KernRe(r"^\=+[ \t]\=[ \t\=]+$").match(line):
                     i, text = self.simple_table(lines, i)
                     self.data += text
                     continue
-- 
2.53.0

