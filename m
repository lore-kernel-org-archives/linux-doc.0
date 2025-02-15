Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A59B1A23BA
	for <linux-doc@vger.kernel.org>; Sat, 15 Feb 2025 11:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739619750; cv=none; b=Onodzl4W9nj9zI1F5t7VVuM6kdpvKZUOcAqLV0b036ZYsjFZ6wk1gRZWKbvxDEEsdWVrmpPmoAd4BUhCFXVCWe8GUjDeuYsaa8BArQfcqnJtZvxNax5ktLieoEaKrNyJt4kcEQQI4cbsG0HuT9u9ZvOBYs/jxUl8rD58j1IAYhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739619750; c=relaxed/simple;
	bh=jlEMrtSuczn3fzzoK0xcr40k7TWs77qzuwIsfCAKNZk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZlwBahATteTwn8f3TjIpWMkDBe8oqXbNxLFkoQT50SYs/9sDHhPT1OPT3Cb0sDDb/Q3ee5I/ZN8aE7t+xU6Cv5Ior82khOiqUf4Y4EvPO3lh8lfOQB43r3gKgSD6uW8Vu9JbgF85zELUSz09FjON6LTc+1DTNdovFlTUmxuteGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pfaB/H/9; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pfaB/H/9"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5ded7cb613eso385857a12.2
        for <linux-doc@vger.kernel.org>; Sat, 15 Feb 2025 03:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739619746; x=1740224546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J/9aiwr25oAJ3edH5d9HAj7m2t+5rjX23Aj4vPngA6s=;
        b=pfaB/H/9WBoSSrCcsGBA5+FGpJFd4TqfOqqacNP//cZ+ITb0gs1XmRhFwj6qqfMWTn
         NGfVpuCBVVZIXEQPqwAd4HaRxRT6Fp75iXVrx3c5oFYxnamaR8FwJtxL7uPHpyrD9MIN
         p5pcCBrRcgRnCj5vkPcogpUteE0NpEivaezFdleHjDZLB7Q+rWsB8QwKKkV1Tj6efoP4
         SNAJ4PayvBPf6bhQokH0fRVFknsMgCyZg2pPLHnXb2f2hmVEp1bNMBHgdnfW2IyJbUQY
         zubGLmLJX9Lu/ZLGIHQ1t+P/cZArHCsNwTOQGaIxgZMCBL1KjvJikSRjqsl8liUOYk1e
         hoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739619746; x=1740224546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/9aiwr25oAJ3edH5d9HAj7m2t+5rjX23Aj4vPngA6s=;
        b=iTwSgKibQYImkVsvV0HtRtKG6LBOs0mtIJcHipTVkDHJ9Eb5ROatkc8eKZgxP1t4N3
         AMvn906MZ5jNgD7D4DrY0uu7ASgfgPbzImdsJgBAoa0Y7g3E0rMcC294YfL9VY2cQ/ew
         1hc/pWnvTxI32NuPGJdiSFIxDxgM5PeKvQQR7HoIGyNHtVFeWqcAK8h89aTXXHkM5xK7
         qrMfGccuCDT2CJvOLnELOF67dFNSqUdNotBewsXaxMMXmBqplKZdGpUJUmip0hUCRfTq
         9VJoO/vKTLvQ44nwliy8q3pUkmTqDibagYuShLWTyI1i4HUNThK4rUPR5alFlTtmquQb
         oijQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpnXrRmEW+mOb0Z05Ap0ECf1YKNbQTpB07hfREkucrtS5qMfb8YCg2UKOqvvBD8aDyZ8WomKjK+w8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJQerb5x6vUmx6JniuCOtCVB11SJ4w6Q2srCGRe1tSigw+Imr0
	F1WSJMy4gEtYOoF/ci8k+dwSli2t6ctpOdhi2tp7W1EPKp/OrcJEd8T2I+6N1CE=
X-Gm-Gg: ASbGnctXMmns7JTUYnbmf72OxtVym0jNKzsW3VylRQ/nknkETt++Pqw6l83AF9f9Ile
	87pWgdHedmWjnhD1q7RzRRa3sIQ0v3j706GFpLgtpMukbuP5rvmnyQYOrVrsfwpExPzLpqpJY8b
	KcJ1y5Wz1/27GbwCe7ZL9BJnvLEzMMDpbPVXFITFeKqtrUv9tcMWEU13jJaSXxLJ6hrvaU5n894
	JHBoxM8pOwE5oJ1+RAfHdAzKa7OveJFPZAt/qyF2AzwmbLTBD2EmbYUMERJnzLVGz4dvf51YtBP
	BhxqZcHKbdlW5En03dy8lGZlM+kopA==
X-Google-Smtp-Source: AGHT+IHUivwWZ3VEikRDrRYHKU+IYVIYHCuZ3UwvO0EOUSMr15+9iT2JsZ91Gm5M8EVhs19uFDlv4g==
X-Received: by 2002:a17:907:9716:b0:ab3:8bcc:3d97 with SMTP id a640c23a62f3a-abb70ab8c13mr102363266b.5.1739619745715;
        Sat, 15 Feb 2025 03:42:25 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53231e10sm517697266b.35.2025.02.15.03.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:42:25 -0800 (PST)
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
Subject: [PATCH] docs: kconfig: Mention IS_REACHABLE as way for optional dependency
Date: Sat, 15 Feb 2025 12:42:23 +0100
Message-ID: <20250215114223.140688-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several drivers express optional Kconfig dependency with FOO || !FOO,
but for many choices this is neither suitable (lack of stubs for !FOO
like in HWMON) nor really needed and driver can be built in even if FOO
is the module.  This is achieved with IS_REACHABLE, so provide cross
reference to it.

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/kbuild/kconfig-language.rst | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 2619fdf56e68..66248294a552 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -194,6 +194,8 @@ applicable everywhere (see syntax).
   ability to hook into a secondary subsystem while allowing the user to
   configure that subsystem out without also having to unset these drivers.
 
+.. _is_reachable:
+
   Note: If the combination of FOO=y and BAZ=m causes a link error,
   you can guard the function call with IS_REACHABLE()::
 
@@ -580,10 +582,15 @@ Some drivers are able to optionally use a feature from another module
 or build cleanly with that module disabled, but cause a link failure
 when trying to use that loadable module from a built-in driver.
 
-The most common way to express this optional dependency in Kconfig logic
-uses the slightly counterintuitive::
+There are two ways to express this optional dependency:
 
-  config FOO
+1. If pre-processor can discard entire optional code or module FOO does not
+   provide !FOO stubs then in the C code :ref:`IS_REACHABLE<is_reachable>`
+
+2. Otherwise (and module FOO must provide all !FOO stubs) use the slightly
+   counterintuitive Kconfig syntax::
+
+     config FOO
 	tristate "Support for foo hardware"
 	depends on BAR || !BAR
 
-- 
2.43.0

