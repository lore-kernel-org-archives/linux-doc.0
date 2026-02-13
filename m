Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B18B17555
	for <linux-doc@vger.kernel.org>; Fri, 13 Feb 2026 00:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770941720; cv=none; b=EkUzt4St0wxsmQGgNFqnRXmdgjmriVExkHsW9fkAzMUtfe3HxCTRj4jVrL0+dxgOuiDWf+u9bbC2CAsRUTCKj8cM2HJfoC+0/Cy4nXa9I+IQ32Q9vh75ynhrhNa72j1IoVEiLXuSe2r81dOD4TBt1sij6onZWRSwxZ9ljBABSzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770941720; c=relaxed/simple;
	bh=/59rGIqsmF4WshNdFxUG9ogPXvNXVfB7MoZDczfEldg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jWY4nLOyPfrQDG4BPk+iYuYK+KMDLluCsCnkeewsvLm6b5hjc9wpHpXg+73oMHHeWCQZPSab8s+0nEE2oD0dEMNapNEwrqhdKamjIONrU9duGvHrmtUbgc7/u3lK8KV2Y+G3K6ejSdQrmEaG+iGisUjWWXIeMUfxrElpp9TSCiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ByKOXRJY; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ByKOXRJY"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-482f454be5bso24444755e9.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 16:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770941717; x=1771546517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iBcBAJOpsKdY0lf+0KvuBm9F2SiCUmZwqgnRHrAG5Ag=;
        b=ByKOXRJYP0hFvfdXG9g4Zx5PGYv2chrA8Pg1XuyECYpmbH40mRCt4Mw4NAT+EoIvrL
         TskvzXYDrLoIp3VdbP8/43hS8LHO7v3mglyEZgZGek1dSbgUNcF67Sw1p0qeMoE4o0G9
         tEgGCv8Dc7Q/6ZsVnOfnNsWXN8iq90u5MGkdzJeD/mltMgbJD44r9YL31yFlQ44/Vgi8
         fMaK53Hk8+yXagWXhET3YxWtntTzdVhLhi1YeYiO0P+I+YE3F0MGtKa0C5IyK+bYzgy5
         fnHov9qptwZ8BMvUCHA95HUxBfLhBsn+36k9aT2IH6eZvqdquQb3RyOYzi1vIt20wOWZ
         2KKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770941717; x=1771546517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBcBAJOpsKdY0lf+0KvuBm9F2SiCUmZwqgnRHrAG5Ag=;
        b=PN0Pfhf4JRNdw3rfCwCto0MEFbNbJWOBPHhKCwdB7iL/UWP4sniiKXnSNJ2YeJAkK6
         io1HWyDt0ZqDIsB87VDnnIuhIsb9Kgg7OlBtaoHzZrPryDgu/VkX55G/yg4T3VPX7xlc
         DnpqPhH1yDsf8K3dNfYrQut7AknmMeZ7X5NKtDs67/zyfVEodrej2Ut0a42oxptP2wPL
         hmCfGPqoa3Ly5d2VD3msf0d16SpIrBs3YQVQD7Bal+s8At/faJP1NZjr9pTvbwo5VG5N
         py7LnkqmsQ2GulVJPFvQNEVpG8Wi795VkuZw5oI3mvzMzS3DpnXPDn99Qsb9H3FrFcJ+
         Ci9w==
X-Forwarded-Encrypted: i=1; AJvYcCWX4EA8q+oGkWW+zfyyKZcfUQMyaOnmLp4uxKzVNx4z0ya0S078DniLlNmYJv42j4XtL0ijDhX9K8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YznrSY3EvPlx3bGj6WkLvdA2V2Fsp8HcIS79XPkN0SwmNV4u1fM
	vv5/OXz+fFGbpygnS5+ugyHAN78cWzqKEpjPskqr88w6mSc8VLjc4EIqrl6STCEXOJusZ/SUeSE
	Ln/5yefI=
X-Gm-Gg: AZuq6aKPFEhQfw9d7i9KRJMAkkWPchdfhqervRVwQ23UBjTgSV+AfdbQilpmo+caBto
	xj+cpeOR8jWtFjDDKf/qmIyc+LSduMfz0Qm0otPkOGt9AxvmUlHcZTYlwGuD9zQo1F2WkKLi3ne
	v0oP4J0hhvBSiPn6FuzIB4NAQsTb2eLofvObYzMWCMiZqAu0GIAZKnbW/fH9EZNkAreO373Pmtt
	D65494cfCS4FVEw2nElWdml07I4CLl7G4k5emt2hnSvpIy3ph2/FiMVfpCz3Bj416BSpjCKMh1S
	lE7hnb+zNeA8DtZ278pKYiweendGX/L8ta+YEiFQKO2CqngYWzwsaqmZ5ODafE3WYhJVk7jf6Bi
	5L6a0f0yrCf6pooGhluSatZjBwvPCzjnnEo+SNJ9JO/mjC3gjDZzV84MAvGMZCxgKI/eNyMlOWU
	zvd1RVya5Oi6PTGHdaG7H27FX5A5RijNo0dhf4Y278jjfjcy8yCtqPgvIZNQgvFBmmLhsb8Vu/r
	r8xPe+Alw==
X-Received: by 2002:a7b:ce14:0:b0:477:991c:a17c with SMTP id 5b1f17b1804b1-48372f1dd02mr872455e9.6.1770941716393;
        Thu, 12 Feb 2026 16:15:16 -0800 (PST)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99497asm234440945e9.6.2026.02.12.16.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 16:15:15 -0800 (PST)
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
To: jbrunet@baylibre.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>
Subject: [PATCH v2 0/3] Add TI TPS1689 pmbus eFuse
Date: Fri, 13 Feb 2026 02:14:05 +0200
Message-Id: <20260213001408.2454567-1-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework TPS25990 eFuse pmbus driver to provide more unified way for
non standard direct conversions.Remove existing defines for TPS25990
conversions and replace them with enum listing all supported parameters
and structure using m, b, R. Add functions to covert raw to real value
and real value back to raw. Add data structure to hold pmbus_driver_info
and local_direct_values for direct conversion.

Add support TPS1689 support to TPS25990 driver, since both
chips are sharing a lot of similar internal functions with exception of
work range like Voltage and Current.

Change log 1v -> v2:
- Fix error detected from kernel test bot
- Add Acked-by to dt-bindings commit
- Drop "support" from dt-bindings commit subject

Stoyan Bogdanov (3):
  hwmon: (pmbus/tps25990): Rework TPS25990 non standatd direct
    conversion
  dt-bindings: hwmon: pmbus/tps1689: Add TPS1689
  hwmon: (pmbus/tps1689): Add TPS1689 support

 .../bindings/hwmon/pmbus/ti,tps25990.yaml     |   4 +-
 Documentation/hwmon/tps25990.rst              |  15 +-
 drivers/hwmon/pmbus/tps25990.c                | 185 +++++++++++++++---
 3 files changed, 171 insertions(+), 33 deletions(-)

-- 
2.34.1

