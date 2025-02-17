Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF442163AD
	for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 11:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739791920; cv=none; b=JhnNkLaSf4bQG13moY0M1klg0MH/YoAHB4AY9rK1Q40nozQWjX6u6MIp6+qIGLVhkh1a+OhZbOE+gA8MD/ttCwqdkxIPtI9bLU5gZ6ERYVXbvVsnp9qJ1EI1c2k60UWc1JwHOvmnrrNQDmWT+mZbOaMKcTx8PWZq5ndzqJz4eps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739791920; c=relaxed/simple;
	bh=+hLWA2hCnKT5kulKutuWGIx2zEUObNyrhqOjKdPI9nQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VeOv8NQYzjeDxQLFaIOdwyck/spbNVnC6fzrbhRK9xm7XUjYfMMyVnaKxMNLSb9dTgjUrqWxSgE88YNNJ3RUmV6XZN0Z2QrROjvrT9+lI3acdWwhhLLAg0xjnB0GxQny/6V6JQOVaxBFVvuuqF8vNCgNgB9ZBHhUilN7wCP7tlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sPFMBWWt; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sPFMBWWt"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab7f9f57192so61365866b.3
        for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 03:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739791917; x=1740396717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oKimg4pzOrqaPAD9ALPNCd7JMmdFnSaV4akqnAMH+aM=;
        b=sPFMBWWt8A9jgcuPvG4ovrehKfJc/Fn+3Q4YXus57fEYgun1t0bARqoIcFf8d2i/0S
         ocB9QKSy8JXld2eC9BTFlbAhG2BPE5hbXYGFpClB1EscXBesRrF9PB3+OYS9bA4HbkBF
         aUReJKMYYZlrXNp4OLMJSQ7c09L8AA/w03fd/J3Ql7tuTisIuvuSaae20B/unvGLaRI2
         DgWZbyEv5fIHKZ5iNMu3vpuc/B90hqdCE32Z642LcetDEC0NMcgkOae8OpAmrAEEZ6mx
         y5F1KdSr08CGljLMrgwYZLnyG/16irMovSAFpQgq/+43kpD4twTyFmajOhmfTj/Gnbx7
         PITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739791917; x=1740396717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKimg4pzOrqaPAD9ALPNCd7JMmdFnSaV4akqnAMH+aM=;
        b=TDKHkenCYLP+iTS7/JCK2wzuhQHJkICQcN4QDOCeuvSeMB/f5rADvBvedhKbHQu7iv
         UDIkz52QPpufykWKbnI9Cy5qgt/+AP8s2fG6c0nYdEUbA2+RQcm6r/u1fGQ7aS2UYBsj
         wSylch4AROQ59MGk0kbiqxvN5vEhj88UBekL7X2QwAdGitPREbeJxTIc6qO3vKYUVNt5
         gtyMcEXJjOV4vmf+PPOWoBJ4t67c8RR1DSUs+BuUxx2WWoFX2iRIdp6EQ4hDifbGzP9l
         SKtKhBDatQy7tYC8rkUYh3KU6FSPSL0+nfqqbdJxPcCsHHfcK8Cga3n2LIu8Oq7TJ00e
         1i7A==
X-Forwarded-Encrypted: i=1; AJvYcCU4jw7xbQRantHQdptY8q36MR9xvVU1N6a5NN/tgXBIbup/L0wUhsB8fFd7+IONTqZR/SMBnJNt79I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDLvwa38ivmSZV1leKckVvYFhmoHgHa6qgVpRcLwmiksFKaat8
	L2+Sdt+S1vz9uDhCS1NC52l9EbULlBGIHNqAapTwHlBCN7fu0/TbSCACFxyoEupMOrMFvOz7O11
	s
X-Gm-Gg: ASbGncuiSW9Si6Z6+hfyNCbDAkBh7GopSQnSCL1HSj51M2MwzcOGz/WsJwEa5/HHVJv
	ei6aeMIn5W9aWcVypJl/gXHNTastu0QJMctD8WhrJq3WU3Y2sT26pmkh9qgJncKhQPo1lquem/e
	1I/Nm5y1Kc3KpHZNBFRrYeJYd3d186fE2/YS4bjv+vD48lODaKnMOjz62UY3U1fN2Ds9zcY0gi4
	HeeR32H+cIx0OXndlWGkkJHRIfhggds+q/pjI7/vdQEreBBJDb6rL20+EfvuyOkjebCzRLn+r54
	Kxok3bhv3p4SWROvbVIQG64silFp9Q==
X-Google-Smtp-Source: AGHT+IF187xjpbv8MjESEcHWSW3tQgy/oCc4RlywDfwrTREL9mIvbOFSssZRofy6CqOFM+/0HK3Tag==
X-Received: by 2002:a17:907:d8b:b0:ab6:58e4:4fec with SMTP id a640c23a62f3a-abb7093370fmr369717266b.3.1739791916663;
        Mon, 17 Feb 2025 03:31:56 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb1e1bef3esm554323866b.146.2025.02.17.03.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 03:31:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3] docs: kconfig: Mention IS_REACHABLE as way for optional dependency
Date: Mon, 17 Feb 2025 12:31:53 +0100
Message-ID: <20250217113153.161476-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several drivers express optional Kconfig dependency with FOO || !FOO,
but for many choices this is not suitable: lack of stubs for !FOO
like in HWMON.  Describe the second, less favorable way of optional
dependency with IS_REACHABLE by moving the code from "imply" chapter to
"Optional dependencies".

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. Significant rewrite to mark IS_REACHABLE as less favorable.

Changes in v2:
1. Replace FOO->BAR
2. Instead of referencing earlier "imply", move the code here and add
   more text (Masahiro)
---
 Documentation/kbuild/kconfig-language.rst | 29 ++++++++++++++---------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 2619fdf56e68..c8c20a34525e 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -194,16 +194,6 @@ applicable everywhere (see syntax).
   ability to hook into a secondary subsystem while allowing the user to
   configure that subsystem out without also having to unset these drivers.
 
-  Note: If the combination of FOO=y and BAZ=m causes a link error,
-  you can guard the function call with IS_REACHABLE()::
-
-	foo_init()
-	{
-		if (IS_REACHABLE(CONFIG_BAZ))
-			baz_register(&foo);
-		...
-	}
-
   Note: If the feature provided by BAZ is highly desirable for FOO,
   FOO should imply not only BAZ, but also its dependency BAR::
 
@@ -588,7 +578,9 @@ uses the slightly counterintuitive::
 	depends on BAR || !BAR
 
 This means that there is either a dependency on BAR that disallows
-the combination of FOO=y with BAR=m, or BAR is completely disabled.
+the combination of FOO=y with BAR=m, or BAR is completely disabled.  The BAR
+module must provide all the stubs for !BAR case.
+
 For a more formalized approach if there are multiple drivers that have
 the same dependency, a helper symbol can be used, like::
 
@@ -599,6 +591,21 @@ the same dependency, a helper symbol can be used, like::
   config BAR_OPTIONAL
 	def_tristate BAR || !BAR
 
+Much less favorable way to express optional dependency is IS_REACHABLE() within
+the module code, useful for example when the module BAR does not provide
+!BAR stubs::
+
+	foo_init()
+	{
+		if (IS_REACHABLE(CONFIG_BAR))
+			bar_register(&foo);
+		...
+	}
+
+IS_REACHABLE() is generally discouraged, because the code will be silently
+discarded, when CONFIG_BAR=m and this code is built-in.  This is not what users
+usually expect when enabling BAR as module.
+
 Kconfig recursive dependency limitations
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-- 
2.43.0

