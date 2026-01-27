Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B75930EF6F;
	Tue, 27 Jan 2026 10:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508824; cv=none; b=cTRdLBEFaNXnMuuH+GSfgGrhv6ZCm+KULaBp8YPMYVPuVYcZox8By8oTqPlLHE+uP/vRHrf/LNbdwmVjhUFQrDNvcu/1oE560iCOqNdlyWxCsuTgyRz/cel7RLU//XdefYFp+zCfxt3IlTwlJ9MlXDXMrUk0IzYDsg+jeEG8k/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508824; c=relaxed/simple;
	bh=K6lgztanQK3FhPi/2k/qKibFfdvBvH02DI26eVVDCJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ah3e7QUIRMIdltGQJn9A9nWAdinFwRqXyczaOu3D0bn88CpphcM3ph5huDs59fDXpkRmw2QrXqtrAKxP66iLhLi23wYpkrBogqCqsr+EMWwVvoDuO9s1YTTXLUnNtQBaFWlm/wmbuGWSYLgUVVI0qd1PnbcxmAAPagYsLLOcERM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dgUOrDPj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dgUOrDPj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E515CC4AF0C;
	Tue, 27 Jan 2026 10:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769508823;
	bh=K6lgztanQK3FhPi/2k/qKibFfdvBvH02DI26eVVDCJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dgUOrDPjusY1lvYPQrXE1WmcZPN8nJyKWdZIaI+/nWK7byy4c6ZPDVFBKhUrPEMjQ
	 vZ/BK/QKC9F2xFYPLDlsvdelTXTxeiCRdLwboQGTj0BuIHXw6INga97tqNk+Gvpi4h
	 XE3IE9lRScd5vTq3z9VcvMy3SehQeMEShysg9CAe86sjARfbep+NVqBYN0x+H6n0t3
	 mB3j9yg+9/dSaOjZPfT9E3pttAAtUOyzHCyWK+/QnLUqWCGojzNJJGZdSCbFeGdg2W
	 fUDhD0UC6KF723X11ZUBkKtNy+TZbXclCXcRzndkLasFVGaIleXNQAJoe/b+xGGajQ
	 osR8nmyDc2L/g==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vkg4r-0000000BVTH-3ceC;
	Tue, 27 Jan 2026 11:13:41 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 11/14] docs: kdoc_parser: fix parser to support multi-word types
Date: Tue, 27 Jan 2026 11:13:30 +0100
Message-ID: <9bfa6b2325075af1850919285327601730a9b210.1769508371.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769508371.git.mchehab+huawei@kernel.org>
References: <cover.1769508371.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The regular expression currently expects a single word for the
type, but it may be something like  "struct foo".

Add support for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index ee3a09396a78..8531113ee28d 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -1009,7 +1009,7 @@ class KernelDoc:
 
         default_val = None
 
-        r= KernRe(OPTIONAL_VAR_ATTR + r"[\w_]*\s+(?:\*+)?([\w_]+)\s*[\d\]\[]*\s*(=.*)?")
+        r= KernRe(OPTIONAL_VAR_ATTR + r"\s*[\w_\s]*\s+(?:\*+)?([\w_]+)\s*[\d\]\[]*\s*(=.*)?")
         if r.match(proto):
             if not declaration_name:
                 declaration_name = r.group(1)
@@ -1020,7 +1020,7 @@ class KernelDoc:
                                   r.groups(), proto)
 
         else:
-            r= KernRe(OPTIONAL_VAR_ATTR + r"(?:[\w_]*)?\s+(?:\*+)?(?:[\w_]+)\s*[\d\]\[]*\s*(=.*)?")
+            r= KernRe(OPTIONAL_VAR_ATTR + r"(?:[\w_\s]*)?\s+(?:\*+)?(?:[\w_]+)\s*[\d\]\[]*\s*(=.*)?")
 
             if r.match(proto):
                 default_val = r.group(1)
-- 
2.52.0

