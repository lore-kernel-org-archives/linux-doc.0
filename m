Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9116133F8BB
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 19:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767726573; cv=none; b=ZaHwUX8ioJXgQRP63MlszMR4505yYCsw18QLjwqr8I/7KbKhMZP9HN6IMwhhZ7nZhxrI5koVf6KpaRKLv3eCigQF/NyQKMOWl5eie14yzRyhF/KRS07Wh7Eb6WjqdXkwZhW14G0qLYca2U5VMTUdTUT8tytW3E+0aGjV/LBbOdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767726573; c=relaxed/simple;
	bh=j0jDV4lbFVQ9QVQdB139GuIVebX7BEtCYepQXaLrbqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mvTX3uJBwjJwVik1Ru08NgPAxt0dwsJSbOcq7k1OsxOaXTpPund2rggoh55tMaDkA9mm06bSk1p9WrXgg4paGWhYFYctkQBYepl0tr/4qlpkKWDaQYqRYMhAORRZhmxBkSX/Hjab0HfGHBAjH+0DhalHFGudXyQQUvN/krxIjtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FS6D/Mta; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FS6D/Mta"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2a099233e8dso11650065ad.3
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 11:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767726571; x=1768331371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZDIxAuQXdSZKM+omOFdw1K6fCzWMGD3B/LiysTgYjs=;
        b=FS6D/MtaN2mec5qP9Q2U7xSzHsDTnCfOl01/noWmYTPyH2osEUrnCX8bDLz2nVJqbm
         OZZyC33z8LppBERZS8VGJHrAFKUeymTSdow3dTfe7CB43z1R6yOQzRVVJ8vvy69G3ZMu
         YgdnXptH+lI0NMu/B1MJ+zkGw1OA4xE6+2AnwTKKTy2j/14GqB7QzERjL1OgPr11oAht
         SV5QI9uSi4xQ6uhxuf7R3yrCjNEPajlnWuRpUeB6V0veQH7LenSI40mfmT+1egx4cWAJ
         yoceJFfHC4l+tuwObO15/JeiptK06VGDQtMJxpu1jRhDleW6GUH4chW4vAHTLt3pbTgb
         2qHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767726571; x=1768331371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ZDIxAuQXdSZKM+omOFdw1K6fCzWMGD3B/LiysTgYjs=;
        b=GbhOWlWsyWgLlJxEOcMOYxBzvAaIqR2XkLuwzqvLTyZfLB52mH5EtSPJ8XcIpafOeR
         RsZSww59rokRlo/fm1ZJv8ovg8p8tUCcuBqA2YeuAsLal0md0i9zG6BxuwkyIJHBFS7u
         1VvljAwei5zgBD/Ixc2HpFfW2hYPks1l8mghqcf4SmQwPYIBClMkLBHzLAhtqzz9g8jM
         aTsqgPZb5fFw20Ztjc9GsvM9cA3Kx2QFmXbMlzFwGw53XeKRIXNbYBMxXslna1ThouFe
         O/BVrj/UqMJIlON3EzGLjLT4/G8Ou5amo1EdI1GFyA2bD3ABqm2LyPoT79+Wyptv8OQa
         sNLg==
X-Forwarded-Encrypted: i=1; AJvYcCWhHl7+SSyoQ4Y/FEVWGWV2C9oIU5BSjZeJtp2Qh+I1pLT+dkQ1V80n353+nGewcORZOn6FkvV3mcI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu7isMo4lLxFHUuRPH01GfA78vbLnpCXeK8yi4HzJ50vRYJmrT
	3V2V4S0cTTlEFqameqX3MYc/lQmJVbZlPP8USKZ09NaAyzO2mSdjxnat
X-Gm-Gg: AY/fxX5uSP5xjdgdfWt4AwpO1eYe9cIryN4Xm8bExDNxoROdqTBwJXVacCjMwuSOLC3
	ygIABaNX4kMyXhwCbW/DqLLSWaJKsUl6pirGCeqr+pHzTAeqatFv05xYFJorZhiV7B3+J5NSeg8
	xlbv+vk/JgbaIv9fft+V2jmaiB0guQ0rxp/xu0epHYSZ+h987F1Vw1EgJlLG0VlVd3hbZe4NHOx
	HjVtgUxtakeucwBNG/bYeS6ZEzwA6wyStgSfhYvd0GiuHB3u7Bc4giG/XKRg8xhWXj0kzUfgQhQ
	ClL/Sk23GWezZ5ae2aWwNeaMjuKqJaDy47KLde2mNHJ6rIZaP8l0kctSzEbn6XsQXrA5TPCz84f
	tPqY/h7idrZjtKPTWN/OAKf/L5h/ZaYknufX5i9kkgtnY0Z5FzafV3DKPK6uAmbq/A6wyxjR434
	FHBtCzWxvGsovVsrUnCQ==
X-Google-Smtp-Source: AGHT+IE1WFyskV9UBz53SZomuLYRFUJQlyS3/Vk4tjY//MxsM+cH3sL/yfbwmTq7HM4vYlJFb86sSA==
X-Received: by 2002:a17:902:e80d:b0:295:9db1:ff3a with SMTP id d9443c01a7336-2a3e2df5181mr37055245ad.28.1767726570816;
        Tue, 06 Jan 2026 11:09:30 -0800 (PST)
Received: from rivendell ([101.0.62.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc78c0sm29380975ad.69.2026.01.06.11.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:09:30 -0800 (PST)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Jonathan Corbet <corbet@lwn.net>
Cc: cocci@inria.fr,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Benjamin Philip <benjamin.philip495@gmail.com>
Subject: [PATCH RESEND 3/3] Documentation: Coccinelle: document debug log handling
Date: Wed,  7 Jan 2026 00:38:36 +0530
Message-ID: <20260106190836.36630-4-benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106190836.36630-1-benjamin.philip495@gmail.com>
References: <20260106190836.36630-1-benjamin.philip495@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current debug documentation does not mention that logs are printed
to stdout unless DEBUG_FILE is set. It also doesn't mention that
Coccinelle cannot overwrite debug files.

Document this behaviour in the examples and reference it in the
debugging section.

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 Documentation/dev-tools/coccinelle.rst | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-tools/coccinelle.rst
index 6e70a1e9a3c0..c714780d458a 100644
--- a/Documentation/dev-tools/coccinelle.rst
+++ b/Documentation/dev-tools/coccinelle.rst
@@ -127,6 +127,18 @@ To enable verbose messages set the V= variable, for example::
 
    make coccicheck MODE=report V=1
 
+By default, coccicheck will print debug logs to stdout and redirect stderr to
+/dev/null. This can make coccicheck output difficult to read and understand.
+Debug and error messages can instead be written to a debug file instead by
+setting the ``DEBUG_FILE`` variable::
+
+    make coccicheck MODE=report DEBUG_FILE="cocci.log"
+
+Coccinelle cannot overwrite a debug file. Instead of repeatedly deleting a log
+file, you could include the datetime in the debug file name::
+
+    make coccicheck MODE=report DEBUG_FILE="cocci-$(date -Iseconds).log"
+
 Coccinelle parallelization
 --------------------------
 
@@ -208,11 +220,10 @@ include options matching the options used when we compile the kernel.
 You can learn what these options are by using V=1; you could then
 manually run Coccinelle with debug options added.
 
-Alternatively you can debug running Coccinelle against SmPL patches
-by asking for stderr to be redirected to stderr. By default stderr
-is redirected to /dev/null; if you'd like to capture stderr you
-can specify the ``DEBUG_FILE="file.txt"`` option to coccicheck. For
-instance::
+An easier approach to debug running Coccinelle against SmPL patches is to ask
+coccicheck to redirect stderr to a debug file. As mentioned in the examples, by
+default stderr is redirected to /dev/null; if you'd like to capture stderr you
+can specify the ``DEBUG_FILE="file.txt"`` option to coccicheck. For instance::
 
     rm -f cocci.err
     make coccicheck COCCI=scripts/coccinelle/free/kfree.cocci MODE=report DEBUG_FILE=cocci.err
-- 
2.52.0

