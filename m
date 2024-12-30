Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D0F1AAA1A
	for <linux-doc@vger.kernel.org>; Mon, 30 Dec 2024 14:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735568658; cv=none; b=WDuMCkzwsh7+QRbsXWq0x5/FKwMCHYG99dCKRzBIo9g5k1qthNzma9MQMDBdzTe+1i2SRgBEnXEswRZJCXBopUlXELO7ztlE7zqHGo50WkBp5jyPdbtly/NQITPV09bKFm8dy5xFWHKiq0e5gYbvcxaV1tw0fzO6BlfGNK2RN3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735568658; c=relaxed/simple;
	bh=riqKkyM9akRaX1QToakRQt2HKZxJfQmlWPKBKamryN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SH0CIEi5YzrR26GwZsC1S7yJNqmpW5vSnjZFemTM73LzCHR9gi8M+sujt2v8NgV3RPzua+J2juX6wjFgGtAFrNEjnwkmy/NK6fuIn96jnTS9d1Qhxw9VNyQLWcOeOD9YM2CDKD3feqAQLHggUz/DL6z0l9QNT8kGDpxNrM6/joI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AuOaDau/; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AuOaDau/"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa6c0d1833eso1911468366b.1
        for <linux-doc@vger.kernel.org>; Mon, 30 Dec 2024 06:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1735568655; x=1736173455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/xjs7J+W/ttqDs1occ4gvPsm7x6ioMVSDeQBqY18Vao=;
        b=AuOaDau/riCtxdZV6VY4TN5rnnUZGbHMXBYKabcB2wjmoqcE3ox7WeDdBKnXjEtpOA
         KPpOzca0dtVuwcfu1zMv3GRXUUJ2l5ZmsZExLXy7fbx7ytG7bSiqEYlETPOil/X4w0Df
         oY7tzIuat3jbdEv4CSPcOCZ/pDGfyDvGNDq88apQfGMAof4VyTt9Mzl+Kw2P54pDPx+Q
         XDCB84Yvn+8mZ8rCQ6ROCn0lQ1YtFqfRgG15OBlXOCkeCyBlnuVVOI327dBaA+ksH14y
         6MLNMHg77eDD0p52lAWqleWi60vnfRRyE5vQ5HaHepwluJDiSmL0F403k9gIlcP3QKFc
         u/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735568655; x=1736173455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/xjs7J+W/ttqDs1occ4gvPsm7x6ioMVSDeQBqY18Vao=;
        b=fTGraP7iqVER9ubBySpyRJgXEPXf9wsMqn3bEzrg+nhJP8gtVWx5q2MuEwRi4oV40Y
         21mU9mBldgiaBH5VKe5LsMCx5an+qG3cISme3zEjacJ3z58etZb4LP70GGBIvGmMZeeE
         gwULA9esl36h/QTyRn2KbHfgm6H7EWyA5Hw84o5bwnxLIMKGG5zb8YScMRLzB8r67NyE
         molYc9Z6ZkhdPyscWRqc/x79PRkOVZ65sInxnF5ODjbGh3tyD5UVwf3qRpHfs2Ujmxtf
         JgCZw8Ft/pQ4swzi7lKLRXhgv8YNbkydhumUVWA+Lsi99TruXKzLM8UM+ABTF2uFLG2x
         79SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXumqSOyygvYdg77j8XsgAPzp1k6sZN0Z26iTpV+a1/fiN0lQNln5q6wJSbdvx8m6a6Kn4mxuLSKcE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9TIbnSCTj1S7Lpv+hxEYtTfNyNtaDQe6U3+y75p3oAUmdkEGG
	pJlP98lhzJtQlq1oHuH/vABk0WlM5nlt8jFr/e12vQSRM2s0WP9TG6h1fqJjObg=
X-Gm-Gg: ASbGncsFhXguJbgISCaKNAQB3KAoVYTmg1UvVtUZ97ALSzeoLo0VVllOPBzdY49XA9m
	zKvCpaaHQUSaT3hhmJW76dRgEIbufF6Yfow+xG0mMw86iaY+njISoIam9CHUa+b+k79NG1GVR87
	tFH+mS3Xjzduiz7iG3kXYX0pdQVcVRJr2v3/S4nrke6vidJR2k/4vmaQM2SbJLovs2UhVk4w/I/
	m4g4xchhcfj4qvA2XE5M2dQ3EO17zuOdizJsd2tVuq4KzReKYhM4zdU1mtnN877ydZMJv+lT9wY
	IACOTt7mgA==
X-Google-Smtp-Source: AGHT+IFyy9NNGSmVpY1h0VDz0oNXG2SdHrUvBSZei4PSFoh1BjCSTNBFpNPjatAVgDk3IoRGxKn/Xg==
X-Received: by 2002:a17:907:97d0:b0:aa6:2c18:aaa2 with SMTP id a640c23a62f3a-aac2d447071mr3266674866b.27.1735568654824;
        Mon, 30 Dec 2024 06:24:14 -0800 (PST)
Received: from localhost (p50915bc6.dip0.t-ipconnect.de. [80.145.91.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaf379e34e4sm434430966b.121.2024.12.30.06.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 06:24:14 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Maennich <maennich@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] doc: module: Fix documented type of namespace
Date: Mon, 30 Dec 2024 15:23:59 +0100
Message-ID: <20241230142357.3203913-5-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241230142357.3203913-4-u.kleine-koenig@baylibre.com>
References: <20241230142357.3203913-4-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1482; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=riqKkyM9akRaX1QToakRQt2HKZxJfQmlWPKBKamryN0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBncq0A/FFYP2Z9mEg4HqPUGtrDhRrubtr9oi/U2 gzkNxXj79mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ3KtAAAKCRCPgPtYfRL+ To+tB/wI8V+cIbuWFIQcN1/wDx5ot6AY7NFp1AL2rqCFEClcevQLZD32aKy+mJnl84fUXYOE7Gw paqI5TbyhWvADClUKdscANwoo+f2cv8NrUm3XVX+Y3hRMbokpQqMtgTZK37AA/M9auT2KzMUcrs nDsQ8aUEusLiYgYsCQtcka/gP9SrnnglpRd9aUEPLO9VOQtIgLENDYMpAJL8+QkfwNUHLoO+NrJ zttSaBblbfFNxMffoCajOaOeKnFUjD3CHcvk9gvjnldWkUV0jfQVUDd8o4U7dohOcBB+dTYgyEc hLJZYvbYzftTV708+qemmMtxRWhZVkTvtlX932V0UJfRAF66
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Since commit cdd30ebb1b9f ("module: Convert symbol namespace to string
literal") the namespace has to be a string. Fix accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Link: https://lore.kernel.org/r/6fe15069c01b31aaa68c6224bec2df9f4a449858.1733305665.git.ukleinek@kernel.org
---
 Documentation/core-api/symbol-namespaces.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/core-api/symbol-namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
index 27a9cccc792c..473d025657fd 100644
--- a/Documentation/core-api/symbol-namespaces.rst
+++ b/Documentation/core-api/symbol-namespaces.rst
@@ -41,9 +41,9 @@ entries.
 In addition to the macros EXPORT_SYMBOL() and EXPORT_SYMBOL_GPL(), that allow
 exporting of kernel symbols to the kernel symbol table, variants of these are
 available to export symbols into a certain namespace: EXPORT_SYMBOL_NS() and
-EXPORT_SYMBOL_NS_GPL(). They take one additional argument: the namespace.
-Please note that due to macro expansion that argument needs to be a
-preprocessor symbol. E.g. to export the symbol ``usb_stor_suspend`` into the
+EXPORT_SYMBOL_NS_GPL(). They take one additional argument: the namespace as a
+string constant. Note that this string must not contain whitespaces.
+E.g. to export the symbol ``usb_stor_suspend`` into the
 namespace ``USB_STORAGE``, use::
 
 	EXPORT_SYMBOL_NS(usb_stor_suspend, "USB_STORAGE");
-- 
2.45.2

