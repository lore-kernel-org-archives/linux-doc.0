Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C67E29D0D
	for <linux-doc@vger.kernel.org>; Tue,  3 Jun 2025 17:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748971082; cv=none; b=UZoN7s/TG/zrIzJhmtNSvoVRafti0vWJ8Zf/MlQ3qlF8uLK25lSrQ3OVgNLLq9XRH6Vydsnv7GjIH8t5YwLHHjzTE0Dn92dcGJziUMPfrPf0O/KqBkkXZfZunmjTVKvPAig3J3aX6CzwzVlpEzdz7GI3HJPBIbEKAOGjTgjVed8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748971082; c=relaxed/simple;
	bh=w+x5EtVeulng9PpPz+ExoPWJJgNvx82MA2y8ogCBhm4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q6ey/r2vnhblcCCJ1varupFYcJ36yN6IcUAIeeoOqfdYATNb8bhmEXmxtFvO/degBoKMB8CkISOuPT9DoqT5AA7p2Odafkx1ZMGhsJWnezm36bJTKOw63FkUrXt0OuXusa+i8cM2ikRrFJgh+RJ2kvG5GKfAPDZ7eEwZjI5Y81w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=sEPUM7Kk; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="sEPUM7Kk"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EED3741A90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1748971080; bh=/2OD630KcWDbxU1BrSON61gtfdnERcyDJM90BTpkBnw=;
	h=From:To:Cc:Subject:Date:From;
	b=sEPUM7KkKL9EaX83uo2r9zTmcROQZyflYs6eTH0O6Lg1eS2kAgOAJDQ8FEm+TaUbw
	 6QqX22F00rzhLLaZiLw8cVgL9KcKG1PIsrDjfkC/4l31tTtAAng0RRbkLHgcuRzRa/
	 cwPZYdsDu91oLSS/T0AiVUy34tSLt5s1Ct40SOtvNFTg/A+vP1tcBcatwCst65Regc
	 wtsUZxjBuaEmnGXOIHrRDcEdQp2mmZ32sxGaLPfy+HKR/7f8XzwvU0sRnUTtPGbTyU
	 +9GFkF6j960vfZrxxYh2nrQld/L0F1YtAjzahl93ANjXOdADS03NHXjnQYYg227lAq
	 isEpqlQLNsCYw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EED3741A90;
	Tue,  3 Jun 2025 17:17:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] docs: automarkup: Remove some Sphinx 2 holdovers
Date: Tue, 03 Jun 2025 11:17:59 -0600
Message-ID: <87h60wlp6g.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Remove a few declarations that are no longer doing anything now that we
have left Sphinx 2 behind.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/sphinx/automarkup.py | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
index fd633f7a0bc3..347de81c1ab7 100644
--- a/Documentation/sphinx/automarkup.py
+++ b/Documentation/sphinx/automarkup.py
@@ -150,20 +150,12 @@ def markup_func_ref_sphinx3(docname, app, match):
     return target_text
 
 def markup_c_ref(docname, app, match):
-    class_str = {# Sphinx 2 only
-                 RE_function: 'c-func',
-                 RE_generic_type: 'c-type',
-                 # Sphinx 3+ only
-                 RE_struct: 'c-struct',
+    class_str = {RE_struct: 'c-struct',
                  RE_union: 'c-union',
                  RE_enum: 'c-enum',
                  RE_typedef: 'c-type',
                  }
-    reftype_str = {# Sphinx 2 only
-                   RE_function: 'function',
-                   RE_generic_type: 'type',
-                   # Sphinx 3+ only
-                   RE_struct: 'struct',
+    reftype_str = {RE_struct: 'struct',
                    RE_union: 'union',
                    RE_enum: 'enum',
                    RE_typedef: 'type',
-- 
2.49.0

