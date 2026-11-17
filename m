Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794887413;
	b=bNXmD8H3Q3gGVfrb1OQ+NB3AOJe4uykhlvb2mIk8Uw5LQ+8WkeD3+Xs9vEehBn2bHRKy
	 YeWXRQBUVTrIyu7G3t20kua2onBQERJ3N/NAewRoQQAIz9BZU2vuvzJJ7u/h02YyjYjdt
	 RGYkRSpYLtCJxR6QTlMwR0mKlgFY/LxLDVg4B53HdMTa/tIVkq2Fn2SlRASJ3jJLj3mIK
	 z2aFXDb1UIPJuo81RGyOYT5/0sgoSRsWqGUW+WvNjRFTjcYulYokHTM4S4zHig1xnlOrz
	 FyKD13oyzGkbQAs9CdcElxCesI9TweP6R5CcjbccuhwJHrHsHhwIkBjLxVb4IQN/RXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794887413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=LOoNOnATt95HfTbuHjeUZKrmhPL7FnCynFFlsveEyZ4=;
	b=CCJqNMsJFzoTEdxIQFn0mw/FO0ag0s2PI8Fzyko/VJxC7rHJy9HGUFTo9G1Ndrqfcuo/
	 FIfJchgS3ASF2SRdqpwhkkEWhFJLcfh4wU9bnPR+wH3wrD4edLrS1EBTFFGzhb+4mPsrv
	 XKFkSSoPcuNIUqWkVoFwJcNJCtglapKfTugv2MfJLkKgjIeF8GKvnZyAnhkUjan6uC0e9
	 T5zAA3MyHGOkDh6ajmg/UTe8JEto4A3mTgbVwVoqbVlnl7ZPFbVVQTFqF6tQoNvgTbSju
	 V2AWEHa4QNamjuQeXRgHW5jl9HSG0TaCxJ/kFhjgLEVqOLnLb2rqlL7IvXNS+nqLNCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vKahpC9z;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4852B606A31C
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 03:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4852B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vKahpC9z
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso5304431c88.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 19:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794887412; x=1795492212; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LOoNOnATt95HfTbuHjeUZKrmhPL7FnCynFFlsveEyZ4=;
        b=vKahpC9z4zXsPVil5aOTXJcx35DZauHTt1wHOPxzzmnUR2HZjJod3TEZ22RtXXEFzv
         MUMNN31nuJScfj22Eu7r0XNsUI7MsQuhuM/CiZ7JnBeUZ0plR4zf9NC3wCVk7zpl2a8P
         GU3Y48e8D/e+8IH8bTn2NV1iIrhH6ilLCEwxdFBexfgV5CN7t9PjC9bUAH/Hj7TmeR9/
         LzK8kKBP2bf0E2hPN5lG+8TJhjwOISjEKwpwachfhzVmJofEhf1l2qU3slJ6I8fvp4iR
         TojInpQZl3aojVzO38N4+0grQT80wEFd/0CCyoY00DCTpWpxf4BisHJPv5XwSNuJ9tog
         o+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794887412; x=1795492212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOoNOnATt95HfTbuHjeUZKrmhPL7FnCynFFlsveEyZ4=;
        b=v9PzErcTPGO84bIsdeB1xdxZaq8rhAbzi8ia1D4FfOHyYDkAUiqUCk2bZpkOYKIPLC
         /pPzkCtBKPB6pxJdzzFOXNWku8DEfiJEeXpatD+R0A6Fon/vujou7Qatrt8L2wsu+EeS
         Z8/b4GRT2HKe5XNc3nARNy1ojejTeb4eggVreInU8ULHExRt8oxt8bP4FxjJxx1p/Vt+
         epG1VftKMb3u7Rwu0NYZ/QOejVR8ZBuEWsINlyxguf/fT5Wd52oBe95z6yAfoioKxvoP
         7/a/ZTp7YTwA4Csk8ZGIMK7B0Fdq8YYjHKerziIaavhYocjb/NgwJXAX30hJ1OMfIpSO
         GXAw==
X-Forwarded-Encrypted: i=1; AL+hErHB2iskjh9AHu0hZNkd4Z6oLlLC3j6UgL9PCnF17O/hBhWuZ2u7H0kH/GSlWXRV1gf8DA/P8C4NXTE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yUJa88ov7+a/D1iWzS5fLfEReRzjWj4boRdXwnhq0Qv7oyODc
	JXymEb0TGoz+zrVeq1q70/cululcir0EMUOMTsIqAJCp12kW6IplmPFw08ccI+pD
X-Gm-Gg: AYBFou017za+YfyIdNSKHOFV5ONn0hs4/A75/aJE+RpfrL/Yte8Ur69Jv/JLF1MArDf
	L15zpZ08FDgENFQm2ySiBEibyrvPLelppyCuluVLI61S4NBupoiY0ocCcGGALsu0pGWX1xCSFsB
	cSzGbPX38GKiIBVNOlZThAmCtEaHTlpE/MMsWltPsXmElKy5Pw8V9QMaNHZWaVAQss00zRQmYbg
	8Ub1FHU9KhdhJr15yHju8keu2M/tAIeeXv6OYyVpDTmwoxjh5LAVpnmJbap/JSXIuP33zG9Wvv+
	M36Aigz85tg/XrN+HEIkGYSJJD1bEeY7GBrPDaLkFB/YY4hXe2DKJZTsagwsakWWXMYCvYCUAyh
	HGmvKNLJOS9RwCv8UG7RC/NlZl4xTyHForVdM8Lr5kJ9FGugCGwUGm8Q0neY7i9NaMYO14qw2o6
	YcdqxQEUKAOppVF1ZY90VC+OZ5gNRTeP+iUJIxzZ4ChPYMobtNlqc7DZIlLYugWmTEg8UUwySmd
	glbv0KncBXf1opFUVNAvIfw8rOa4JhYlpegASJFSn+WfGxQSBaB5WZ8d/jGmfydmRVJZSdOiGn+
	TXv8ycb/WKD3VTXLMPgMzeiCqHw=
X-Received: by 2002:a05:7022:3b87:b0:1b2:43cc:48 with SMTP id a92af1059eb24-1b5030d2bf7mr12705249c88.33.1794887412161;
        Mon, 16 Nov 2026 19:50:12 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e008sm36666360c88.6.2026.11.16.19.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 19:50:11 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 7D82B420B801; Tue, 17 Nov 2026 10:50:06 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	NeilBrown <neil@brown.name>,
	Eric Sandeen <sandeen@redhat.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] fs: porting: Retitle
Date: Tue, 17 Nov 2026 10:50:04 +0700
Message-ID: <20261117035004.12262-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=926; i=bagasdotme@gmail.com; h=from:subject; bh=EDshUAUUgNEFJDafoIdKOxSbO0GYM1siJAlD4D9V22k=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDFm/z+VX+H/Pj99z8cEFO94N6ZKi92J2TXv76Xa89cZJV 0u28/hf6ihlYRDjYpAVU2SZlMjXdHqXkciF9rWOMHNYmUCGMHBxCsBE6ooYGTpOPPfn7EvN2/Lk 7KPMdVL8F955fmJvyrHRWxK3N3vCt1KG/xWJ6++zdvMr9i8qz5/w/0HsC5Xr/HWToj8oJa9qrFx UyQUA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

porting.rst is a technical reference on what changes to the fs subsystem
(since 2.5.0), not the whole kernel as the existing title may imply.

Retitle it.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/filesystems/porting.rst | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/porting.rst b/Documentation/filesystems/porting.rst
index c38f5df755bb50..dd5a55e68ba7b6 100644
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@ -1,6 +1,8 @@
-====================
-Changes since 2.5.0:
-====================
+=============================
+Filesystems API Porting Guide
+=============================
+
+This document details changes to the filesystem subsystem.
 
 ---
 

base-commit: 2138148bf44fd84d3e0a863f0e8cb3627cdcc606
-- 
An old man doll... just what I always wanted! - Clara

