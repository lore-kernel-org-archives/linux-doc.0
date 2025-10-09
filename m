Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930C0824BD
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 06:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759989842; cv=none; b=Ch21sFhk0UhoXhzYuVvgIgVCUx7C8zhjkl9m+wr1nfzMfh7s3I2jIutE3bDX0bKyt/3o5MCYxwUSdkWb8l0+h1u6Cs+cJcy38P/5nbE3zwEU/bRkjrcpPv5T+kJxsYSzmsbHTAV3oyBXaWMh6TCxdkdy90+FGfmrFjUacF9hUAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759989842; c=relaxed/simple;
	bh=oIgR9ryeL/hgU2Ls/yixZK50PZdiBg1+IVAuWVPt7eA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=JvSKednE3U9lqx2+zN+ZvAD8LLdpMsTxaWO0FDCYOu1X4/bwxjlEAZe/DZ+LVimTELZPidwlWAA/l5T3/mlsN1+w0lGtM9nXCgzQ9D9kAEeYo7BEzFyr+d7lNYSyfu+dX8rN6x4P4TnxQZuJxyBA+r/464dld2VCP+n1IafcIwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZLsK/AW; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZLsK/AW"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b62ed9c3e79so369113a12.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 23:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759989841; x=1760594641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=sBcTUhKsBJuN6HOBlbpiv3saKcS96LDQWFTGigREUFE=;
        b=RZLsK/AW5bfgHKjgmBFWvJRkNrhAr1uRFWoWGtax0raKkHSamNtI0QxlCW8mRC9OZy
         axHFl7IeI4Hrfa+NPtgIW8+zktsiAG6NMGgMAputt2UGmAjU5l94lOkqeINX1/v6VYrL
         eQR68PRghvqS4s5slQhVU6xGmheV4lXEa3/7eJLccSpeYtLod8hRGxVkztcDx/OGUqsy
         lDql8oZXl9Gof02JLwYARi6gXv4PBT6oKFjPO5obPW6GrsXG/TxukSFD9B+CRrGDmDdH
         mQyKZcKTr3lrPihTbBYPFN8ImSz1KBnUDJNFd72JQMqPtqsiG4io4F+oK2PTJS0Mxrp/
         7C3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759989841; x=1760594641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sBcTUhKsBJuN6HOBlbpiv3saKcS96LDQWFTGigREUFE=;
        b=BL1Skyb1cyDv2xMdrhUqw93+3LEmMQQ9ejTUw2Wx5UXYXzFNT8UvsWtZ7Ce2HBrqAK
         RFU5hnC/uTr5wi9VJwX0f9cC2mcwipxkWitEFKZWzq13LV396CD4xiv7KnukSqXBiPbv
         51ClzpUAhqXzj7d+ELhOfzypa4aGvP/G79KCjbpeBj9eOIhrvNWC9B4BvQIOWILRXDpE
         +CP9ADNzSWVxTdf70QCxlNIuAtu5FOK/N7EJ9O5C8GbEnwm/edH7Z6WDDbI0vUoHmlTA
         kzIf+A1Znr+1zoDqetaRot3JqhU9/QOE6/KA4uOOasK4djuJy252OafI6ypRvPyckL1E
         L9uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZDPd4VUZrSyLgveMa7yMfmkYNizGsF6hBx3gtuf0xr1aKxKkclCtZvqz0KJKmx6vIVTzlHCBaEUI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/v0fOSqol92AykF8cF1sVTVbMr6082d1jLl5PD0OvJTwj2aUT
	j3x+UqSYfiRjU9lAV0C4f/3oc1GSaJg0QtXRMTvcYuEla7xqRT01AD8E9no1ow==
X-Gm-Gg: ASbGncuGYZzy1WarkG8Y/3vY+Qx4yfsG6KiHF7Me1Gi5e4W3AudoMcrfVvTERkFtwyB
	CwLZfVaOiNZgPVmqDJLp6NynC225/JkbhbTaQC3V9LvHcYTZDBLMVDXFFhs/b3fXc+2eaQ7zUK0
	O4wwLVlGIj9hvlhB6D++fss9KR58rORefG0H5sjRlmMqDDAUBAdC/I/SBH6HtHaAkSXOODg32Lf
	y1yGjC9Zy+5fWnkYnuw2kUW2JqgklLxAQI9rFkTTKWxMEe8W3EPwuu8zf4Q29ZVxQOmAntPGexO
	QyC64+KLgqE03EwxO30f6Kr+bedZF/7Gu4IwDO0b0/qclGF6aJigiN8ZayZsPLg8PkJYnzkgVAa
	0PobRs474HpJzG76xlF83z3tNi9KA2sco6df6k1vm8g==
X-Google-Smtp-Source: AGHT+IE4tM9PfDiOFb70h43Kpvl4/9t6W1zFjvmkTzJeIu73kO8m6cPgSu4+3UGkTE+MU1d2vLlIow==
X-Received: by 2002:a17:902:f64d:b0:26c:e270:6dad with SMTP id d9443c01a7336-2902741e4a0mr65888565ad.60.1759989840498;
        Wed, 08 Oct 2025 23:04:00 -0700 (PDT)
Received: from localhost ([46.232.121.212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e45568sm16388955ad.55.2025.10.08.23.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 23:03:59 -0700 (PDT)
From: Frank Cen <focksor@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Frank Cen <focksor@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1] docs/zh_CN: Add trace debugging Chinese translation
Date: Thu,  9 Oct 2025 14:03:17 +0800
Message-ID: <cover.1759988849.git.focksor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix RST title underline characters for proper formatting

Frank Cen (1):
  docs/zh_CN: Add trace debugging Chinese translation

 .../translations/zh_CN/trace/debugging.rst    | 133 ++++++++++++++++++
 1 file changed, 133 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/trace/debugging.rst

-- 
2.43.0

