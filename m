Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D658734D934;
	Tue, 16 Dec 2025 14:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765895186; cv=none; b=NT6dt03QoPVntZqmMm+wtSa/OgEnKgFY86HLhlLbjz6t393+KZJl2Oov2JDkTCrfoGYThC6RGHrF8B0VsfqpCFvAK3tk/4KWStTwb91vgZPnA5namMSOmKYHkN2ZsuLiwqOTF8Bu0myicnymUkq9xIItW98sU7G5YU1yPFSRHTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765895186; c=relaxed/simple;
	bh=V3q0OW77JHsfRVR1rTc4eyv6RLc6cSrB8gvXSOLS46Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fwdgoh7DKRPRYSbM3P4CAhv81vmxamh6AUtmKEvnuloENIX9polLBiDlrZcCAZCjA1cmT6vnO0Rh6MM5Caq32rU50CvK1igwLFYer/CvkoAi1WN/sNxRIpx1fiEzJTDm7D6cyNBG3N9gqGpBGtNIPNc+Vs4zoiT+XWY2UpLxEdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXfwIuHe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXfwIuHe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E468C19423;
	Tue, 16 Dec 2025 14:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765895186;
	bh=V3q0OW77JHsfRVR1rTc4eyv6RLc6cSrB8gvXSOLS46Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fXfwIuHeMj0XhngTQfhH2LLKaJhEOkFBCU1goraFJwFGZIlg3viURjPjGYlfxpOOG
	 mkD8HNp3SwOh6CASAMmF++l+R5Gl4qRW7za+ie0FHMPkqDcKx/Z9hsElzjMQbyyh3I
	 w35ZV3OnvUztpboHckjaiHTgbeZKyByyX9n3aotoQKZqCUDSXwZaVL3vUfE252lNzk
	 12GbHGVg0rFDom2OF0i/Aea59s8M5OwvU2LNGYJa4REAEJ/3eD7nsrspnEkX5cbXzf
	 5CjJWOumBVtsa16oayXojIocHM2YdnBpHw/lrGDUYFwnJklNLU0IiqWYcSJmx74Wv9
	 54tew7sJ1EgjA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vVW0O-00000000syA-32vm;
	Tue, 16 Dec 2025 15:26:24 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Randy Dunlap" <rdunlap@infradead.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/6] docs: kernel-doc.rst: Parse DEFINE_ macros without prefixes
Date: Tue, 16 Dec 2025 15:26:17 +0100
Message-ID: <be16e087cbc065fbd041fb6d6f8fa5cf0426cca5.1765894964.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765894964.git.mchehab+huawei@kernel.org>
References: <cover.1765894964.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Currently, the logic for vars require a
	type DEFINE_foo();

where type is usually "static".

Make the logic more generic.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/linux-doc/e1dad7e4-a0ca-4be6-a33c-97b75175c12f@infradead.org/
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index aaa352855717..e137bd9a7dac 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -977,17 +977,23 @@ class KernelDoc:
         # Variable name is at the end of the declaration
         #
 
+        default_val = None
+
         r= KernRe(OPTIONAL_VAR_ATTR + r"\w.*\s+(?:\*+)?([\w_]+)\s*[\d\]\[]*\s*(=.*)?")
-        if not r.match(proto):
+        if r.match(proto):
+            if not declaration_name:
+                declaration_name = r.group(1)
+
+            default_val = r.group(2)
+        else:
+            r= KernRe(OPTIONAL_VAR_ATTR + r"(?:\w.*)?\s+(?:\*+)?(?:[\w_]+)\s*[\d\]\[]*\s*(=.*)?")
+        if r.match(proto):
+            default_val = r.group(1)
+
+        if not declaration_name:
            self.emit_msg(ln,f"{proto}: can't parse variable")
            return
 
-        var_type = r.group(0)
-
-        if not declaration_name:
-            declaration_name = r.group(1)
-
-        default_val = r.group(2)
         if default_val:
             default_val = default_val.lstrip("=").strip()
 
-- 
2.52.0

