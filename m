Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743FB2DEA98
	for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 09:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904770; cv=none; b=YXx04KA4nFHzXzQB04kIYyxqiI5c1nmptp0KMO1buj6vafRdr+UT1/7lb0IEp6i7V8JvUjUw8B6IycAe4b9LovKgCGo5RikA1ruCE9tz7A6HYteyh584xAOPvQ7o3/SQ7K7srSh6usC9ZZLeL8Ap8z4+i0HmJtGv0D36iugEc9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904770; c=relaxed/simple;
	bh=o8uIpvdm8rS/o+S1mykUYGGLHkWfPhCsX3cg0yw1X58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e1V+388wi0rHDUWMt7AqzjdIE7R5vTVbCKSParH/0WEvLXZ/EJHqqQXBbRfcmTT/CMciAN2DyTVkeZXN/TIKRRsb+BYWFz+2c3p1n/ryiWunep9LCIX7mGptE1qzTSGx5ccfS59U0JzSTB1OcZ3rSM5KFD4b2q1afunitB5qA4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l1+Db/9x; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l1+Db/9x"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-458bdde7dedso27497615e9.0
        for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 02:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754904766; x=1755509566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S28JNZPWK+3sAmARH83rSsyGla0uTsZRncPjJTp9toA=;
        b=l1+Db/9xG7MHbrXegbBRTEwdSYzS59sxv21Cik8GWAbImQn4MZ4UAm5FNjQzKdbc2Q
         1QeFmuEwWLKk7IviqZq3PU63dFt97pahZrznp39RbZvnojyTbFjGarDPsjwreh1cvkEk
         Fa+Uq9QnMb6RBnXkuN02q83aXgl3KEhzcPWYCDys5p58orENTARKWat9Ux/cbCsEl0Bd
         tEfcArtd3dQZF0P2dWyY8fQj22t9i6KfSwA4UznMG0F6KPMOvGDaFKEgJ7eLmD8y+5b2
         uCKPYthgmE2I3mMbcchffRnZRVeYlqzm1g1RP2dzyikgej9S5vj2azpZ6qO96ASL+9LG
         q9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754904766; x=1755509566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S28JNZPWK+3sAmARH83rSsyGla0uTsZRncPjJTp9toA=;
        b=ZZAwvyZsIa4CX5lKqutKUpBu81DtiRZd20YXwthDX+rjqDZtYRhhzq2yjZnl91cooN
         GmSkUmYeOVFh8+/CS/XaBdxPKr3Y3LZwShd4ximPbLnlUws/hAWU8EwThXqjOJpTEED/
         u8ifBl7rv6mqcg08sCowTFIpTJS/bonSH/GsJciY745XAG4xuXQe94OoYd/htukodhNb
         VBWWAuOSbuzcbGWL661QsqyryQTmgr4xwOKVsK7dDltF6QSevzMy3fvD1qmSsV/Wp7vY
         KCt6EoHDxPoM998Izdjo6D8Gy9FyJBy6cMx22kaNTzF661cfptKgUzklReLNyaZZCtmc
         a1ag==
X-Forwarded-Encrypted: i=1; AJvYcCV9ba8PA+ujMdYJZbiaMBMFazhQHYIoxetu0sA1BsgnB8z7e36jbR8g8KTRPFQhP8ma58YpGcFF8YU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa9fDvzj2Foy6nv6zTT/gUQi4yz0Y5mUYfEfgLiilY3MoHg5qq
	qE+CDjRxapiSxNdOhfyRbwLuUhqHwvXJh/5hLgxC/Rx99IQdLxuVrRwrnLDV8TVRQME=
X-Gm-Gg: ASbGncumnhY6nGRHNgn0jr6fHzhqIYj5lKwINvnSm4lqMyoqW9IvwaVUXPSvxkMhUUt
	/CFqpMdtE4Qn4T+EeuQuF5NsZmh53YB6E5Yd545s5Mwl+m9NYqqUy09xzF174h2rPmFXxOE4unu
	HY6Desoj+ohfV4IkElijImIzpIxelButXLxAs6jGYLUolmNDmMK0rVYRhrV1MGcpezJVHgqrKPn
	PbZ9P7UljbJsxVxGz+iLW7z6maV/CndL7AQENROmCNtAQw7mWEQmiZn2kREhG4GhJ+1NXEnEYyX
	CvWjT/KgD7guSHUHLw8+Ero21QfLPkRCe3o++n6ftAO0ff3Tu1MizeOTNXKBHDcngmeUGrHAKzS
	MzTyRYoqNSIRzzcAe/MsCchCazJGhjyo=
X-Google-Smtp-Source: AGHT+IFaTuEhnneSdqUPVkp8FKoh0YP1/7nEOnYDv0UVx8tWLL1thpj3XGM6kh71NmUAd49x6WzJSg==
X-Received: by 2002:a05:600c:4509:b0:456:496:2100 with SMTP id 5b1f17b1804b1-459f4f2bac3mr129344465e9.31.1754904766361;
        Mon, 11 Aug 2025 02:32:46 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm39904799f8f.39.2025.08.11.02.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 02:32:45 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 11 Aug 2025 10:32:11 +0100
Subject: [PATCH 6/6] coresight: docs: Document etm4x ts_interval
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-james-cs-syncfreq-v1-6-b001cd6e3404@linaro.org>
References: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org>
In-Reply-To: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Document how the new field is used, maximum value and the interaction
with SYNC timestamps.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 Documentation/trace/coresight/coresight.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
index 806699871b80..0cd83119b83f 100644
--- a/Documentation/trace/coresight/coresight.rst
+++ b/Documentation/trace/coresight/coresight.rst
@@ -619,6 +619,20 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
      - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
        default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold
        value, as indicated via TRCIDR3.CCITMIN, then the minimum value will be used instead.
+   * - ts_level
+     - Controls frequency of timestamps. The reload value of the
+       timestamp counter is 2 raised to the power of this value. If the value is
+       0 then the reload value is 1, if the value is 10 then the reload value is
+       1024. Maximum allowed value is 15, and setting the maximum disables
+       generation of timestamps via the counter, freeing the counter resources.
+       Timestamps will be generated after 2 ^ ts_level cycles.
+
+       Separately to this value, timestamps will also be emitted when a SYNC
+       packet is generated, although this is only for every 4096 bytes of trace.
+       Therefore it's not possible to generate timestamps less frequently than
+       that and ts_level timestamps are always in addition to SYNC timestamps.
+       Timestamps must be enabled for this to have effect.
+
 
 How to use the STM module
 -------------------------

-- 
2.34.1

