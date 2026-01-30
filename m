Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA32A25EFBE
	for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 19:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769801715; cv=none; b=Xt1O74CRUqoe0QaEhrMZRuSxvQJwGPX16IAZPeV+ynkowfcpBqR2YgKqQ1jWaEgaZwkOnqM/sc0sOBp+0zo1B+XWalwy3vgNj70NrI9lYywMkCVHyKO4aAz6UucM8vuysujFNvNnAW/e5tQZfUa4Ok28Lg4MZ47k9tX/JOIVo6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769801715; c=relaxed/simple;
	bh=YtPdTuWX7+Eu4QBGhtaUia2wJN2UIOd1S5Vv2sfiY7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VznvGGcqufHCkZFWtz7EWLNeU795bGO9GRs+jR0KHpaa7Xm4KTpQj1uJzdcxA7Roz9WQ8n6CdQ8b2BD2SuRXQ3nfT1Ck/Md27Zr9bjg0LxlrGehA4Qw8hWmmNq5DUcCJxLw7052LIDXDSF+yZ79osHelqwOUPNnvQzoFs/86t74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SYkIMnRZ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SYkIMnRZ"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4359249bbacso2238573f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 11:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769801712; x=1770406512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtPdTuWX7+Eu4QBGhtaUia2wJN2UIOd1S5Vv2sfiY7o=;
        b=SYkIMnRZU41qkdY5TPm6K7gH2Bib9R+99H4ORYhIlq/P92WnaERWNBnJB8164hzitO
         wA93u4FW7Z4kiwum21EE+sKo59zx17nINKn3PGtflBwdFNqSoKIBT9eN+CJOtGB1TYDE
         fU/Xmgt6fVTo7Bn+TJqWHzQKExn2wU5WTWrNhIy9DyTTsXv4GeF3A9p164zYL6L/mTX+
         Fo6bw0dhyY0nIYLUDeMXdvf2QSsoFYkzJTv/zAHgKf88iBtmsQU/bMw5BoijJcSc07Jt
         ujVaYDZnNsKPN40isYi4AxPaLisUd+8pc8pxlCd9EsyvcpYAyQmfBGT6B5ZZYvy00vOc
         lZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769801712; x=1770406512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YtPdTuWX7+Eu4QBGhtaUia2wJN2UIOd1S5Vv2sfiY7o=;
        b=HgRp8O0QDdV7oWKji2HnaVcBdNAqtiFP1HwwLoP782JdG5nIKPnsQaZMVk5qjOuSm8
         4Xct3OOITo952iKv/CP6uvs0zsSXEcmw1ciyusGOeYog/ljybEoiqw9lkj3odS7YvxSh
         eMkWe1CEPFaNA5QgmPxS6Dx/9i5EFNDN+oL1eRD4cswK3PtYDneeUpQImNHbOjLzhCVL
         vQxp6P2De4I7TdlaPu7Ux9TLwRHWQsMP3QbIlyrmkaeyFZjYskmJjSq2r5/4ls9CL67f
         1iyrEEO2K6hFPOzYzMednKrCZpT9uImxlhENzBx5i0Z3cvyqVVqGgqaafYIAZGf2xiFv
         XFJg==
X-Forwarded-Encrypted: i=1; AJvYcCXCCXfxyTda+ERyVS7Y0Jy2iYLGwt/tEtfVhFrigqMJQvuvFZcYh8EPAUm2LpAFSWK7nF3pZbfCj4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywro0ZLxGwLBQCfMiDBx/JqS1FO5i6SEDspoQHluY+Au2/BLpmQ
	Wke1k70FkOA2/kJ2rrNgUk4rYlvIHt8n2ussDb8tQOClR83koily5OCx
X-Gm-Gg: AZuq6aKFg+yyz75wjaLABOSESYKEulAb9oI97m+cc/CS0mx/MQ6FXak6dpIy32/VL/M
	jaWaUSIbUDNGiAxJyiQIOmnwbKbX1DACJOTaWA+k2Deehjrd0q70x+7UIFkddPvNZmy0o6NP8Vj
	lwSBiv1jvAFGg5gZYZ6zPmFiNFM4Sr701HPILikLnuhGny/VxN2txviFogTX6ZaiXQZQjD7eYmF
	LWxpHtQ1ZqT5Vg5GwrNqbZBpY+kOaQWec2fCR57/Zt0GoMHPgvFD0BStpOt48xJOLcXsA4MMYt1
	ECocR8eYlsOsPwmalyi2msAarWHC5tx1JUg8jMuQqv8C7XnlvUKy6QBjv3b6WGmFQKSBjyLj7GW
	CFB+qPFnkA87buZS/ZI63D08DIPh+Ag8Jn2qpJ+/+iS88Hop78/zUCqsHZGfjFRzN5PpnSsM4HB
	4dx3xF6pq/ZXU/WgVVXzuBhTuqlPrgl8s5D+21za4I1K409h8RHeUd3jvsGU62
X-Received: by 2002:a5d:5d07:0:b0:432:84f0:9683 with SMTP id ffacd0b85a97d-435ea210379mr10922542f8f.24.1769801712112;
        Fri, 30 Jan 2026 11:35:12 -0800 (PST)
Received: from DB-VM.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1323034sm24631728f8f.35.2026.01.30.11.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 11:35:11 -0800 (PST)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: jic23@kernel.org
Cc: 0rayn.dev@gmail.com,
	andy@kernel.org,
	corbet@lwn.net,
	dlechner@baylibre.com,
	linux-doc@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel-mentees-archive@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	me@brighamcampbell.com,
	nuno.sa@analog.com,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] docs: iio: adxl345: Fix typos, units, and grammatical errors
Date: Fri, 30 Jan 2026 14:35:09 -0500
Message-ID: <20260130193509.5570-1-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260129173337.7fc2a4ad@jic23-huawei>
References: <20260129173337.7fc2a4ad@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jonathan,

An audit of adxl345_core.c confirms the documentation scale factor of 0.478899
is incorrect. The driver's { 0, 4789 } correctly represents 0.004789 m/s^2
per LSB for the 2g range.

I'll prepare a v2 series to reconcile the driver and documentation
with the IIO ABI. This will include implementing in_accel_scale for events
to resolve the threshold unit inconsistencies.

I will send the update once I have implemented
and compile-tested the changes.

Best regards, Taha
