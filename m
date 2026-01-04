Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EEE288C30
	for <linux-doc@vger.kernel.org>; Sun,  4 Jan 2026 11:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767527955; cv=none; b=c8WKHteJ3sMBcldPZqo+o4Q9lumf1Fn4tNFwWKF+MPQMUEH+WWLV5WdadrAyUTfopfRoBSaLuJENgm9STClPD3QUeF2avCbNsu2eVeXklB3N4YRMp7Ya5d5xnC268ynxxGRN5A6nYvQvoNE4jA8jO1rdYDOSWirFXXKCbGkobfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767527955; c=relaxed/simple;
	bh=4E03ZgO9fMI2tHHJ3JaLGdXlmkvDJ0Hbh4CrtNdn3nw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PbRkoiZ5zSQaOff0vA+tpX/1U7O5NYhAiNpPDzGC21aOxhwRv1AVa7TrhcT26CeF074XBOGfq5mFRDWbcRNm0u6Zhxz1MWSmq+pOuWqGQwtqWZKoq8l2zmKtHINDVuT32jhafmTKFuUxWTy9KRza4C69u02XograIOlzIu6Siu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPTjf5AA; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPTjf5AA"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-34b3f61fd0cso912624a91.0
        for <linux-doc@vger.kernel.org>; Sun, 04 Jan 2026 03:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767527953; x=1768132753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dS9ly7vk39fudlUGNfMXPKOsjDaG3o8LSHqV2Ub4ybk=;
        b=nPTjf5AAj3fq+hKelKXBpH0tM2vnk+1uoqjXt9ymDSkIt3piu4xZ+KDQd+oFZ44zmN
         2k/qEivUc0oeOzRtETe1JYntuYfKzbGRdr0g4QnLe+r00Z/SLVtNbcOEPFb+kDyHgoFS
         7GglErmh7Fl3EF0TecVEtAwN+40If8oIzWfKnmxDniScDP/9q/o+qaLW5gHrUyEaL3H/
         DLsK6hPaE7Wp1JLM7TphOCdbrRUj9DXxr82pNMchixaicowwgvnrjXKF62Y/Q6Y5nNwo
         DTPZWwsErTDGktXGIbl1Qs7R6M8XRqF6VuMCyNjTAYNULV3oxFaPXYGrNYyTT0iOGYJz
         6Q0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767527953; x=1768132753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dS9ly7vk39fudlUGNfMXPKOsjDaG3o8LSHqV2Ub4ybk=;
        b=itkFQTyWrBmiKjVBpjAotPy05V9FfnmXNPOCzbMHmW0mBAoipx7Cn+/W59OQRvTySo
         cFXWKWwn8NvQvxR+Q0+JXZKtrW/4qOhvm1xvAQfP3e1KFlchHGqSSMFmnsQpqcGdVOR3
         b5m+qB9J+Gesx6q9mpK/6J9rlaQRNG2wBnlqmOUuBVKE4aGBdsR9WF+zHmAdDUnYFs8O
         cfZ8vblSwjKDNOjhYqyJbZ1l6qlAqzB4GoOBUhqAl0EWxAhdPtYQYqfUOOufbb0rSyW2
         vIxK57/YoWYgMs/r3RKZ0IoD6+1x88f2w9AvHwRs/pr26RuRaSDLyJp/Kd+z15WwyjNA
         c55Q==
X-Gm-Message-State: AOJu0YxMq9wM7oX2LxUQsaeIdy81dqYFtjsMxVEOeI4bEoYQ+58Mt++S
	MI20lNavmnjAuZpnvKUnxeuEmSs/xt10NNn3Ux8j+gpwJgcV8pFMrzo9
X-Gm-Gg: AY/fxX619U4Ra6fBZsHLxjAOpWrtUn18jETJ5Cr6MqrrbJXXksDluG4ytp89+S0RllA
	ZwHyZR6IhV6BoAyAvI6HaLoGnm35tsfbfPuO5G4Mms3pE5us8Ayy2s76xjtJMSQtidnKja+CKrt
	VpOc6lbfQ6e3K74nW3Je3KuxnnpCAmrtKGf4dJ76DoL3D1l3BibHsSxCID8b18J5SVM0f6CcuCi
	6UjSr5IX11kFe0wmHqu32dfneMNA9N8xQjE3c4M4QXF/l8T5g+QixHlDzhwLcPwpdH2CbHLci78
	kp9zNcXbP4Gb4NTsO9J8OjKCSDiMAtEcujgnce7hs77Dgx/14iTr1+Iu/02CE//nSKfiKuLjPa2
	f0ObdDhz6KKYzJrdUMywCDjED8tevjbvvF5fkh5l+w1sce3b2/h7g/bn4AeA+HwvULCZhCzBnQZ
	67we5X6ALh7/vqKyzqzMA=
X-Google-Smtp-Source: AGHT+IHA4GTQtSO5nyMQiu6575+ANEpIERZz7oJ97KByb9EZNJg+3naFLwEfHy4CsR+3Aw7C/E4lWQ==
X-Received: by 2002:a17:90b:3f86:b0:340:e8e4:1166 with SMTP id 98e67ed59e1d1-34e921c1ab2mr29431692a91.5.1767527953351;
        Sun, 04 Jan 2026 03:59:13 -0800 (PST)
Received: from [192.168.20.112] ([2400:4050:d860:9700:75bf:9e2e:8ac9:3001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f47709616sm3621148a91.11.2026.01.04.03.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 03:59:13 -0800 (PST)
From: Masaharu Noguchi <nogunix@gmail.com>
Date: Sun, 04 Jan 2026 20:58:40 +0900
Subject: [PATCH v2 1/2] docs/ja_JP: fix typos and duplicated phrases in
 kernel development guide
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260104-ja-howto-v2-1-8cac525b3dfe@gmail.com>
References: <20260104-ja-howto-v2-0-8cac525b3dfe@gmail.com>
In-Reply-To: <20260104-ja-howto-v2-0-8cac525b3dfe@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masaharu Noguchi <nogunix@gmail.com>
X-Mailer: b4 0.14.2

Fix obvious typos and duplicated phrases in the Japanese translation.

No change in meaning intended.

Acked-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
---
 Documentation/translations/ja_JP/process/howto.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/translations/ja_JP/process/howto.rst b/Documentation/translations/ja_JP/process/howto.rst
index 5e307f90982ca39576c40b008a80697559e40b45..a47d7679364aa3da57b9802807a3571ca23b7122 100644
--- a/Documentation/translations/ja_JP/process/howto.rst
+++ b/Documentation/translations/ja_JP/process/howto.rst
@@ -61,7 +61,7 @@ info ページ( info gcc )を見てください。
 発手順について高度な標準を持つ、多様な人の集まりです。地理的に分散した
 大規模なチームに対してもっともうまくいくとわかったことをベースにしなが
 ら、これらの標準は長い時間をかけて築かれてきました。これらはきちんと文
-書化されていますから、事前にこれらの標準について事前にできるだけたくさ
+書化されていますから、これらの標準について事前にできるだけたくさ
 ん学んでください。また皆があなたやあなたの会社のやり方に合わせてくれる
 と思わないでください。
 
@@ -363,7 +363,7 @@ linux-next の実行テストを行う冒険好きなテスターは大いに歓
 
 あなたのハッキングのスキルを訓練する最高の方法のひとつに、他人がレポー
 トしたバグを修正することがあります。あなたがカーネルをより安定化させる
-こに寄与するということだけでなく、あなたは 現実の問題を修正することを
+ことに寄与するということだけでなく、あなたは 現実の問題を修正することを
 学び、自分のスキルも強化でき、また他の開発者があなたの存在に気がつきま
 す。バグを修正することは、多くの開発者の中から自分が功績をあげる最善の
 道です、なぜなら多くの人は他人のバグの修正に時間を浪費することを好まな

-- 
2.52.0

