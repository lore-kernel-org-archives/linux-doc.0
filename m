Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA91139B;
	Tue, 21 Jan 2025 00:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737419469; cv=none; b=fCtUcdayEXLRrkgCtB+1Mch9hnFLBP8thG3mRiQJCiJeMv4sfaEph4rZJlmPBC47Yg8HgmRvik3CaVBMvH3a4xwbTh2W98/FwQAGFiUaNY9sGYkAq2wAfDCgBWcjFQCjkdvHpajBxpiGEk3r2qE6ll5Xa8kFOR/19NAcMPJdNG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737419469; c=relaxed/simple;
	bh=9wzSYAeZZClYn3q0ZVlrU55QndmQuWhEjYFxNJRqIaQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SIVBXEFWE+w1ELHbqQVC+KSwuhwX8O3NAn68pBcnMj31PbOIJvfUOGQJPS84XwIqzIE0CuItkdf6YBBIOlPWhrgj2a6UbVT3AeEkdoh4a4l3XAsVF6JUYWife2da+2jJemEQtDvjiG0qVzqgrWXucnZp6HK30FM+f3FrHHS3I4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5qlQ0QT; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5qlQ0QT"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-540218726d5so4805181e87.2;
        Mon, 20 Jan 2025 16:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737419466; x=1738024266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oqioTkkcGWedO9BsvANmsPd4mjwpPN0sWc5743EStk4=;
        b=J5qlQ0QT1yvFYlzFzR74TJHXSM9fmU8MiZZK0rboegkcKQcqFeifk7A8U2VstopF12
         JQdG+P30Fpod+ILsGPJwSRll+PYQ46QjdjRIOqpcRSE+mFz5CUT/0JETEICARwPU9keY
         Ez5cV7lSCKJdD2pNQeDPIZXrhAbx80BSiWXg54jvb8wz3RyMTw1AtDx1OzvwYPyb3nCB
         X3mXVrw7+ITGRbOlX3ZaqIHkYHUGmY7rK7DhCVVbRkkI4XAnQVucbBvX5TkNblDtvBEB
         SvdaCYhBOCIX05X8ecyEHqYVG81NIFUenTHu7EXwGHxiagAwle+J4Z0ps2ATzrXMyhYY
         efpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737419466; x=1738024266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqioTkkcGWedO9BsvANmsPd4mjwpPN0sWc5743EStk4=;
        b=To1W0cu//BuJzrOU/Q969QMFkK2HabneIo9lnxc6TKQ3qZICq2nu8JpuJIKlvDSejb
         PbyoeqhOfKsFCjYIZsmf6HLKsoMOJwjBFoXdZGbreqFV56OG689JI1ORf1rad+jKMzwj
         Lg6WCupkDZFMDBcHcj9D2TXpQnvU52NFE//de2xrCC5AwonjdwMXYSUZp3oLNPLDtBuO
         fOVNUnmz5/oP1ccBC9LAuO+mhg8R51ZsT9CBOSe9coVLrTpERZMEVpeDj7r+Cn4NhqyD
         YWxkSB5HfDvXWvE/MoXq7qI5+jz36ChOffq3tFsUXTTm6MOZWyt/OviqACw2s/YdYvdn
         G+3w==
X-Gm-Message-State: AOJu0YwfWAC4MYuxb70euETKafjNl/Wru7gEbN3Y0sgCLrftykcPfUO5
	61D980g8ufaT06gRrh/w//jDpdHwaSbJ6Aj2VKFPIgdoxm4Yck75lRhgoi5N
X-Gm-Gg: ASbGnctMvomC8U966KuQhqrjk4Ljq9jDaucyeYYKs5CEpefTyj3tAwmxMG+1VGRuuf9
	yUh4dmIIfwSJkNiBAc7vvGWH1JwwfTw8/liC7exvao6idq17E5jK+u/sORdUSTBV48Jtrp5Nryx
	9BmI+kFaJlrZU1iVWn5c1TCKPVUHlbt6YWjXziCTcCtFumto3b5hZ5rWV33a+tZ8bKq4g3gmu3H
	ATSBRjOaoHxB1sAe5NcRGRjhAZ9nn1Mv0Hh4OXwh4qsWhVwmUyBn8xeBPd6mqmvZuTacX2MXtAl
	7686eky5zL5CbJT/pg==
X-Google-Smtp-Source: AGHT+IHsEpgv+Jrmuz+fq4GrQfDSp/FVxWMGBwMx+AZSZFVvwgtmKlyfySv3mPjhFZiHHbyIvs4GAg==
X-Received: by 2002:ac2:5e9e:0:b0:540:2da2:f282 with SMTP id 2adb3069b0e04-5439c2830b2mr4165471e87.42.1737419465365;
        Mon, 20 Jan 2025 16:31:05 -0800 (PST)
Received: from localhost.localdomain ([37.208.4.15])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0eb65sm1556640e87.93.2025.01.20.16.31.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 20 Jan 2025 16:31:04 -0800 (PST)
From: carlodelos90 <carlodelos90@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	carlodelos90 <carlodelos90@gmail.com>
Subject: [PATCH] docs: Fix backticks in README instructions
Date: Tue, 21 Jan 2025 01:30:56 +0100
Message-Id: <20250121003056.10930-1-carlodelos90@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commands `make pdfdocs` and `make htmldocs` were incorrectly formatted
with only two backticks, which caused confusion and didn't render properly
in some contexts. This change updates the documentation to use triple
backticks for consistency and clarity.

Signed-off-by: carlodelos90 <carlodelos90@gmail.com>
---
 README | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/README b/README
index fd903645e6de..21294cc9fd04 100644
--- a/README
+++ b/README
@@ -5,8 +5,8 @@ There are several guides for kernel developers and users. These guides can
 be rendered in a number of formats, like HTML and PDF. Please read
 Documentation/admin-guide/README.rst first.
 
-In order to build the documentation, use ``make htmldocs`` or
-``make pdfdocs``.  The formatted documentation can also be read online at:
+In order to build the documentation, use ```make htmldocs``` or
+```make pdfdocs```.  The formatted documentation can also be read online at:
 
     https://www.kernel.org/doc/html/latest/
 
-- 
2.39.5 (Apple Git-154)

