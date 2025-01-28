Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C93B1552E3
	for <linux-doc@vger.kernel.org>; Tue, 28 Jan 2025 10:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738060718; cv=none; b=sZTrpJwVbgCvEX9zELKz028NlXGcLfZ48idwTWmVpmcarmcnogy5IPhiAoZxHzQRaS23wnCAUvdzMBQVWPBgNm35EpMeeMARyKlF1Gq2nmcb0873j+ySOV9m17Fub+VcXyCyYkdV9Pyyq2BzGDj5IVPk7/itd53Vn9upv/uXBkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738060718; c=relaxed/simple;
	bh=UaqHNKznmF/BsrDddonvlhQdwh5eSzF5YHWOsHe/fdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QxpvIQMbuFxIaUTMTLIO/AwdjckyDJUaBBiCVYW9jn7iShh6YYJP8oUP4cfH8YtbRy9Gdfr+ClDXnKA1mXDLC1lDkNBmmgZbE4d4w5xizU55njIVzDo1mgci7prR+AsKGzPTmdZuB/KASEEENFgEfG4QSSA8hOGbVam60IlYthI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6UhOF4p; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6UhOF4p"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f43d17b0e3so9573827a91.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Jan 2025 02:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738060716; x=1738665516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wgIdRXRvgoKowGKJz95jpFQqQyWl5c0v99Nr5KWcNsI=;
        b=X6UhOF4pHgVa8Wyljg9KDmTBscepccofhZ0g1ptlMKlhIUGlQJ5BfChtX57rC2qGQk
         SsUOrcf/ALWiobW6WuDp50zwSOb2/rpYt1j0U4NeXgbQ/txQU+W3BaPw9VAOrn/CaAUf
         H3XlnUY+5rpwduu0fzdI5AfcBLqvbGgUu9m5IhOx68rkEIAnRNrECkeJf+otzcaNCFQ9
         KTUTv7/wzW4nl/niDjlyEo+yDDUTBt3jZhw5RCzNhe7RdOGohCHvqbxP7DJn9wpHuPNY
         REdUUodHbHKOmef7TTleJ2AXHgz9rqrU8MyJu0c8F5obm9tsuKG6hB+++ltg1DjIalkL
         +Cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738060716; x=1738665516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wgIdRXRvgoKowGKJz95jpFQqQyWl5c0v99Nr5KWcNsI=;
        b=oAftNz6r8JhGSPzKzjSwEXU4rAjBPOS88fUscY8kffqkWZZyqyuhG3QEIJGOw67dBU
         7NaLTiBkm/e7DBx+5mlu6ySxf+ZuPJYpMehFnKknHLzW2VNHHU4H79dHBPICkh/d6JWm
         D9asftmYIL0vzeWeF3Dn1tJ4fDge2YEn4vPDmDLPztX0kFtV6wCfbL/7X7oFcOZMP0HX
         Nf2/F7HyaLGetC9y2zN1QDiQcXX88ba5SO09YwnTR+D58n4sPXrZEIwp1FeEQlO/6vdn
         kmCcr7JjN1ohEZyUZaXcdXWahdfTey5tsny3V05jgn9PbnXgfZdwQO+qCM+gxdhT/ZRB
         bCtA==
X-Forwarded-Encrypted: i=1; AJvYcCUgx6veFO9oaSMIdb9n1nHbAhCalXjtxmLrgnH3p0jK6NEIOFNTTruox1WDID34Jii8DM0n29LqWgY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhZM3bgkZfu07GnKHNZC+fsnG5zmEjqG7LQN0v/7tAdQwCFGnj
	nBh7MPZZm7Yj80Wci8K9gxdu1Unj1lomAOr0vw66zYfRfYXh6/o9
X-Gm-Gg: ASbGncvSFtCfEWrwQmdGLY28GWl+ZQw7z3Vr4Q5fwKxSKrzT8YydDCsfm8hCuhKq97L
	ggu1yZAZz7Jxm1LTqmdS+xXsRUwlMOkhR4tNzHjjx8mn5/alsnN1NJUEy1BVSMH5Vzt9fwQ7HYU
	V7kyuNEtlldu4JokcRpE2NvBrjtC5HSH+4pf6U21zqaGmir73ue0+AAo481aV0Xy4JqT+Wc8rkJ
	iCQx6ul3zgqYLmeiDV7St5zbLVqPupp++GwnvYB/H2MLbjqQ+F61EIJL77pt7JvD4eGkRBRBLM7
	/boxFM4MDk/ube25SgcbHtuZeDQXvbs6SPQbxRiYFBa9oPlxN7Qjm85JowMI8lGY
X-Google-Smtp-Source: AGHT+IFVaTqW2gqik5sDcGNQZzptdY6bfZCxi4cLef2Xfh51g17+OPtplrkWGIHeefb414x2vSWWdg==
X-Received: by 2002:a05:6a00:2184:b0:725:ef4b:de33 with SMTP id d2e1a72fcca58-72daf88b1b9mr67032883b3a.0.1738060716488;
        Tue, 28 Jan 2025 02:38:36 -0800 (PST)
Received: from ubuntu-2204.. (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a763468sm8973518b3a.106.2025.01.28.02.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 02:38:36 -0800 (PST)
From: Akira Yokosawa <akiyks@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>,
	Tsugikazu Shibata <shibata@linuxfoundation.org>
Subject: [PATCH 2/2] docs: submit-checklist: Expand on build tests against different word sizes
Date: Tue, 28 Jan 2025 19:28:05 +0900
Message-Id: <20250128102805.112691-2-akiyks@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128102805.112691-1-akiyks@gmail.com>
References: <20250128102805.112691-1-akiyks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Existing sentence on cross-compilation that mentions ppc64 does not
make much sense in today's perspective.

Expand it for the benefits of testing against architectures of
different word sizes and endianness.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Tsugikazu Shibata <shibata@linuxfoundation.org>
---
 Documentation/process/submit-checklist.rst             |  9 ++++++---
 .../translations/ja_JP/process/submit-checklist.rst    | 10 ++++++----
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/Documentation/process/submit-checklist.rst b/Documentation/process/submit-checklist.rst
index e531dd504b6c..88b6358258d7 100644
--- a/Documentation/process/submit-checklist.rst
+++ b/Documentation/process/submit-checklist.rst
@@ -91,9 +91,12 @@ Build your code
      fix any issues.
 
 2) Builds on multiple CPU architectures by using local cross-compile tools
-   or some other build farm. Note that ppc64 is a good architecture for
-   cross-compilation checking because it tends to use ``unsigned long`` for
-   64-bit quantities.
+   or some other build farm.
+   Note that testing against architectures of different word sizes
+   (32- and 64-bit) and different endianness (big- and little-) is effective
+   in catching various portability issues due to false assumptions on
+   representable quantity range, data alignment, or endianness, among
+   others.
 
 3) Newly-added code has been compiled with ``gcc -W`` (use
    ``make KCFLAGS=-W``).  This will generate lots of noise, but is good
diff --git a/Documentation/translations/ja_JP/process/submit-checklist.rst b/Documentation/translations/ja_JP/process/submit-checklist.rst
index b9da826d30ae..41af64d5a73d 100644
--- a/Documentation/translations/ja_JP/process/submit-checklist.rst
+++ b/Documentation/translations/ja_JP/process/submit-checklist.rst
@@ -112,10 +112,12 @@ Kconfig 変更のレビュー
       が無いこと。
       ``make htmldocs`` または ``make pdfdocs`` でビルドし、問題があれば修正。
 
-2) ローカルのクロス・コンパイル・ツール、その他のビルド環境を使って、
-   複数の CPU アーキテクチャ向けのビルドができるか。
-   ``unsigned long`` を 64 ビットの数量に対して使ってしまうことが多いという
-   点で ppc64 は、クロス・コンパイルの検査対象として好適である。
+2) ローカルのクロス・コンパイル・ツール、その他のビルド環境を使って、複数の
+   CPU アーキテクチャ向けのビルドをしたか。
+   特に、ワードサイズ (32 ビットと 64 ビット) やエンディアン (ビッグとリトル)
+   の異なるアーキテクチャを対象とするテストは、表現可能数値範囲・データ整列・
+   エンディアンなどについての誤った仮定に起因する様々な移植上の問題を捕える
+   のに効果的。
 
 3) 新規に追加されたコードについて (``make KCFLAGS=-W`` を使って)
    ``gcc -W`` でコンパイルしたか。
-- 
2.34.1

