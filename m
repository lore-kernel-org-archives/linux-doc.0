Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0426E187561
	for <linux-doc@vger.kernel.org>; Wed,  4 Dec 2024 10:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733306502; cv=none; b=JN2ET+W+3zSzw/MvrO37z9bz8Tv5OBhgQmbZKe1KPenc2L3L4GyK9nbrmz++shGTPDN8FeEEsC6OtEMITphqLxVJ5H2GdO6lZOOrdIOy1WxamQS1VN2BTtHyGoLtnAAg3JAoCr8Ja/ti8e5Oljlag4bOdGU9XU0qjLDcS1o7Gu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733306502; c=relaxed/simple;
	bh=OY51iaNt++wUkGeXL/3RGnmJazb5JgcstUIT3FLQ2nU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NPYlOaMS8MFeFPqW7YuwcCZFVaz1o+txayfIg+MyD6liLfKwsBOWsWzMtDyq7eKX3IN7cz8kp3EOqx4C43Lv18ZO1dGmcBGS4EgpWH7RvD6a5ODZ+g7O6UCsg8oM++MZR9lDidL+bYOpIJFgkQsvSoYxI1cg1KZFbV4t26Yd/sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LDcmDFTW; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LDcmDFTW"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-385ea29eee1so2748036f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Dec 2024 02:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733306498; x=1733911298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zq3RJq2fqhtYeZuvz6OgfpNyrnUUP6rae9B6jpa/3NQ=;
        b=LDcmDFTWoVfNE6DiEg6Kv+8VGR7SUzSNqBHCzRAANQsQ57b3O1s9RpWsSvbhZeg+CR
         p4CpnlLWEyhXaWRZr4cN2aAmnYvGVAUYT9IoKvhB8Jja30GPj5AVK6QJdqjshUpQCL+v
         njkCTyVN2qNRev73kbEmPAxZ+JJ14wGM/cIe6hFm6ZWQPD0MglxeSURNr4jAxPmxKbtY
         ywZUuk/Vm+gEDzopRp0//4X/V29nw173w99VwEFDOSH+7JfUZtyPzPiNiyTMHqKSBr7x
         lHSzXb5F+bUjax4uuuVsVYokMY7CRsAgrkzwwDUqyC4Uhv/su5Cfcm0kBVeoGGxGrpXi
         sdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733306498; x=1733911298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zq3RJq2fqhtYeZuvz6OgfpNyrnUUP6rae9B6jpa/3NQ=;
        b=thrleU9Wy3r+2Q+RFhIRhpzPfEj9a2ieAHUyER2Oef+CwvFQjLpV7IP/qE0fpYWylQ
         8UU1d5TJSNcXoYvUS0XaUw3b/OdByQg2lX4G5XefqbijdNsAUoSp3GOnweYs2udTu1aS
         8B4lX3rwCULxEtzEsMyGO98WrB+NhHJ7CmyjiVa9IcAyTwUMu2Uy/YyqgWREGaLPUfJ9
         npK8VRkBs/MxJC87jJ5ZhVvngt5xye4zyXZ1QJXRbRJBCTTleXa8Q0EJW5bv3dLJMWws
         cLBxfFkACljYaPgEJUvHBNotfWVqJwMs9ws7KpIXIGlQAl4O8BKFxegq+loqNq35BNbd
         WsLw==
X-Forwarded-Encrypted: i=1; AJvYcCU0pWotlm0twW0fXD57SV3ehY3RlN3tTMwOSjRSAkvM+xg6HdjI0MujihKTtKWYRrFM4fqJiNPi0n0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza/WwY5e9jdeX9I+n9gVWfxs8Cr4sCIRjxFSokcccJxv5tmYxR
	wBqXQReKeB2dDmtjZPpxFTHLMGr3ouLAooiwdcXnufO3qtbdBGtygktQamKJ3k0=
X-Gm-Gg: ASbGncuA+ZkoJErIF3y/0aL000gmpaVG2lrZ1DiNhZHBP5OaSnb/mMIRoDuk5iv6dD2
	bhAPyFv25lzA2S2kIN55c18V/qwZBRwCWbHjjbz47yuqpw8pjjgOmlR+0Odgk1ibCNG9Qc+BUoI
	ea8yzze2TT0Pncfp3KtCbegnU4BRq97Qn3ea5Wj8a7U23Daf9+Dz98iNfx/cfnUa0ZnO090xGIH
	KiFC4EBf922tPiWDOkhDLR9P/OnQoF1DIQEnORfT2Cdi/4yhxdaD+iv49ZQIu0dCSVnNyFPKD2r
	4Bi8
X-Google-Smtp-Source: AGHT+IH5bQavvdT/WYtMf/I6+6DOVMJd5U0IR8N6Tg4dhOQ0CbdP86UanWwhVFCSXQzoS7tY5qNJuA==
X-Received: by 2002:a5d:47a6:0:b0:385:e055:a294 with SMTP id ffacd0b85a97d-385fd55f1b4mr5108948f8f.59.1733306498432;
        Wed, 04 Dec 2024 02:01:38 -0800 (PST)
Received: from localhost (p5dc6838f.dip0.t-ipconnect.de. [93.198.131.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd3a71bsm17746611f8f.55.2024.12.04.02.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 02:01:37 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Maennich <maennich@google.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] doc: module: Two clearifications
Date: Wed,  4 Dec 2024 11:01:09 +0100
Message-ID: <cover.1733305665.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=864; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=OY51iaNt++wUkGeXL/3RGnmJazb5JgcstUIT3FLQ2nU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnUChlzSf6ehtUHG4Ml6mJXztndF29No3czo6y0 VRUSTjT/+GJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ1AoZQAKCRCPgPtYfRL+ To54CACTMayUGPq5eZTEqhC7RTDHvYQT3rPa/qu9lfxIT/vkclG+sDQm/bhB2pRPw/IP2Jef+fS Z3SkdMEpKdOFpPUKbOzLw2Qr7ZV/ZWe9Kejp725QNlsWqa+FAg7FxmFIzwUCcqheyLHthxjazr+ b/tyWpVj+ADvPiNdhU7xDwaTvee3I2872hhTHRF2Xm0w3Le+GNA6luiQ0HG8kQaIN7fNWoON1i+ o3rIXx4/vMdqba+I39LzabSfmORhJssBUu7RqWTW7SIObr4H8QyES2EYgSkauHNhPlOHLas+5Ls bH2wUy+jXNIIjf9hpCEsh+dw0cPUm6aKLK+qDvnXH+o75QdX
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

here come to fixes for the symbol namespace docs around
DEFAULT_SYMBOL_NAMESPACE. The first updates the text to say that a
namespace has to be a C-string. Before it claimed it should be a
preprocessor symbol. I'm not sure how to understand it, but today it's
wrong for sure.

Fixes a statement that Andy pointed out to be wrong in the docs while
discussing the respective fix in drivers/i2c/busses/i2c-designware-*.
(See
https://lore.kernel.org/linux-i2c/20241203173640.1648939-2-u.kleine-koenig@baylibre.com)

Uwe Kleine-König (2):
  doc: module: Fix documented type of namespace
  doc: module: DEFAULT_SYMBOL_NAMESPACE must be defined before #includes

 Documentation/core-api/symbol-namespaces.rst | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)


base-commit: ceb8bf2ceaa77fe222fe8fe32cb7789c9099ddf1
-- 
2.45.2

