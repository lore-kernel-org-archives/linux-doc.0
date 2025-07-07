Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDCA28642E
	for <linux-doc@vger.kernel.org>; Mon,  7 Jul 2025 07:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751875040; cv=none; b=WmncDMEwdgXFQwUU58EldWZs9S6dOc5mqlTFcMGJXJ0b2/i0zoGroixRGSHo3yxi6xLRbJmz0mfD16ROEeS0qXKwvjtlGDSYoUn4oQr5XKCqzEG5tcjk0uDs5mBRRYBO26W4dsZii6s0SnUZjzfIhd9Zm4O/JBoklv7y2J47zvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751875040; c=relaxed/simple;
	bh=3jDMpGyu6tKmKZCNbOyYSDDf/AFtsCO10XzjbaachO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h8IZjIss4KBw6jBaZla3Y1V19RCV7VOXNRAUy/xzZ3/YeX0SVbECiJXRvye1hZVCuEcKOtXDSXw5pDwXUDEvOgMSqomMapA5PU8BS9Gdm6WOr1wwYDQi8j90cUWex3hak7L/g+RZE4enCPdA4K/B3vUW7akemVvrDzLS+QLnjhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=BMp0egYB; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="BMp0egYB"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-748e81d37a7so1625706b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 07 Jul 2025 00:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1751875038; x=1752479838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fQK/9TljJT68jk0i2VGXxC4KsVLmbF/aNC235kAq204=;
        b=BMp0egYBCiMzKolyxk6mbibOEsssG3fnHXVBbUYOU/9+oN7wG8BqvxVZJc4R9faK70
         Uzj2Li5c3CA9B68vvAj57JpIro7pj1B7ge6Xj4mhZUSY38EBPBENYUXakam31BagpUJ6
         168sBEpVhSxWjtotMjB7IBpLAbWGPQHPi9DRjTr3oUkJymPd79zsKUJ54FMFJiQJc1AI
         o3uSRCHgDZruIvfjyn9D7CjY+mSKUMbSAdmv11gKw+FDrwR4LEtsflYzAP3RXrJXClup
         HnnQ+1wAoJqJnnjvZkSfnGT2Tzu5WdxBKWT85P/B0iTkCOEpeODuVJYt5TgukhA094Aw
         +txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751875038; x=1752479838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQK/9TljJT68jk0i2VGXxC4KsVLmbF/aNC235kAq204=;
        b=AdjE1Rc+sHxIIkNaVVj7xp8REIrv7mR1eYtvDgkrBZJI6+f0zLH8nvo53hhTVfi7G9
         1DhdZSpkrdvZRbCjSH6bPW7KSzV/In1E+kGkpxUhgUmSoXsMlevgQbJWolyv9tPgfnqx
         EPdd5HHl9G0dBI1mN9G0AlnvqtWsKEiOCZdo8HpYJ25cNAl18V8+hHFnPOilGWI4wRtc
         Qkq2ypzOIFt0z3ikucs1CpBt+/qdF91JresD6BzQieDIzxo6XnvuI1FylYUkN097TA4Y
         IvojxiorrphoP2p+TpdZfoXkuwUsxhl6+IPK5BZCgEtWtxRaIURrrzcfpSS2c0qcVgv0
         zu2g==
X-Forwarded-Encrypted: i=1; AJvYcCXc3Xajuz8hmXcvRW3sACmFrvGeAQDaVA1oX7SxlmR8lkrZXXqAvRj5xn7ludnb9p6S6a9PPUJy2Gg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyaG3ridF7ZKt6e1NjnPXmCCLws2lbN0NlwmwyWLmdPSFA99qW
	yLidQz5N6ESwfHwZmUZuao+ZIso/Y3239pArJhb+36f9jiD4PrkxF5RdAkYD+JfP7MY=
X-Gm-Gg: ASbGncsPtGlHr7cUhPZ88bq2CNu+7blMfMxXhE04QMt3dE24TLZox2pfAvEEzRP3HSh
	CLTtNataTno3YtlaubNw/hhJUG/zpBzk+Yh9rNYXXcYhEmaDA4ZNyLEhWPhjiIsKZuYTc/PybLb
	n87OmngLIxhIW8kCCXkxHRDGxgnKP1zU5wKPkqFDKvve1jv2TUDPnZT7fUIjvWr4o0j/Ao6DTNJ
	IqVLUmpFQcKIrsm983eqcmG45YMlJon+faEVVmMdtvVFp+GWZVnqxjbUwcsCJwGOcU8+G2cQEbd
	hp6IE7tyIZFgCN9B70M/b7tLtaBDv1y9rm6PXHlhrI59v17EjQISAYzN31OLDntH85OJfbKETVD
	tkcGMgKSk+HmAukAUsA==
X-Google-Smtp-Source: AGHT+IE2lbn1qBhh8KgJDxKX2gey0GXo1rH+SaJuo7y82wLYHSPHk5Utp4cnQZCTDw+CPsMhqqQlfw==
X-Received: by 2002:a05:6a20:9189:b0:21f:5aa1:3102 with SMTP id adf61e73a8af0-2272235311bmr12458991637.37.1751875037995;
        Mon, 07 Jul 2025 00:57:17 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee62f8bdsm8246476a12.57.2025.07.07.00.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:57:17 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH 0/3] drm: docs: Remove deprecated MIPI DSI macro
Date: Mon,  7 Jul 2025 01:56:55 -0600
Message-ID: <20250707075659.75810-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes the unintuitive mipi_dsi_generic_write_seq() macro
and related mipi_dsi_generic_write_chatty() method from the drm
subsystem. This is in accordance with a TODO item from Douglas Anderson
in the drm subsystem documentation. Tejas Vipin (among others) has
largely spearheaded this effort up until now, converting MIPI panel
drivers one at a time.

The first patch of the series converts the last remaining driver to use
the preferred _multi() variant of mipi_dsi_generic_write_seq(). This
work likely hasn't been completed until now because the panel's usage of
two separate MIPI DSI interfaces at once requires special treatment. Any
behavioral modification to the jdi lpm102a188a panel driver by this
series is unintentional.

Brigham Campbell (3):
  Replace usage of deprecated MIPI function
  Remove unused MIPI write seq and chatty functions
  Remove completed task from drm TODO list

 Documentation/gpu/todo.rst                    | 18 ----------
 drivers/gpu/drm/drm_mipi_dsi.c                | 34 ++-----------------
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 18 ++++++----
 include/drm/drm_mipi_dsi.h                    | 23 -------------
 4 files changed, 15 insertions(+), 78 deletions(-)


base-commit: e33f256dbc293a1a3a31f18d56f659e7a27a491a
-- 
2.49.0

