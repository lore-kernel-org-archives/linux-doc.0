Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2329212D7C
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 00:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779150441; cv=none; b=SE3tT1L3JBkgMfpbz3q4dBZXKjHUNLie7iS4GjR7SCYXgZCfAdlL4+prZuTkwrI+jHsef057h+NW2kvvqnR6SuZOSncE0B6B7XR7B6QsYazphZ1z6KfFeknqFdku3nVSGJgqQLjtdkiaICLOUbrtRaTTZzzCujUBNbqi8gYPw1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779150441; c=relaxed/simple;
	bh=5jBfMjx70K9+mHD2zp4KAHeW+IWt7gMJGSytd06NO9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G4tuAUobdoBZfJ8BEj0J6uFesdq3HvALsTOVKJ4W2O7FzHbqhzcGvgXmvOEtziC596PEtExLmpu2GblI0x0X9Orus8UqikCj4vfYOKgxq7cnFnXoKf1c7FwG+SYn9XZ1gW0LM4PwOmLSldAPq57p1GhrcCJJ5rxpvZK9ks8wAtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhXWk2pC; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhXWk2pC"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8379e010b01so1200226b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 17:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779150439; x=1779755239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5jBfMjx70K9+mHD2zp4KAHeW+IWt7gMJGSytd06NO9I=;
        b=NhXWk2pCzFN3E25BLG6IQREuZh1XsAhP/h/WykUGo/RIs2423MicHx1GO9B0IzLZv6
         ENoEZIMhk70tU/F0fnvQarSQkOaCVf1bNXBC1lW6vvGsUSq2OmjQ+2fWI4yZzB6LiYzt
         rdRhQi7GBDqTa7/eWj9zMt3W8kudczjtBWCb5eAyw5HEyUN7Zd9N8lqohxJ6D1LWPVJn
         4da9PYfgHr2SZEkBKoMZ+zACxuSJT2dfjBeBz0M9JskbfgwX+JEHew4a8cyLToLHFEeU
         qqNEodC4XcAB65vLCNIIYm8X4VOlXst0s369CyekvMyj+TtjEsDOML/aW4oQbn2ffcU9
         tfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779150439; x=1779755239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5jBfMjx70K9+mHD2zp4KAHeW+IWt7gMJGSytd06NO9I=;
        b=GsB5SqgfZcidkbfT3TMVek0qMtIrtRSLO47nhaDqzqLjDpRHrrZiWl43v1aTd5l4GM
         vBu6XS5buiDu18WfNQ0fyNi2uWPghy7whGMLzQTQQr132N2Wa/rSMoBb8aze1Pqr0xGU
         +KZufSG/nDommSrPuiet3qEzZhjbp/T03auPxjohmcxM9aiX2jBYhUpJP0L3VL2mCUz2
         vhRPU1tFQ5q1/IE23V4Lkx3wIYgnhc+BhkJ9OPjsJrvP54bu9LEQr7S7UK1fY95wPD7S
         nXnNJb7gYxFOApH096cYrfCwsfwHIKqBfWNYhpn5827rsHUGUkClfk0g6OzgaQyeU4A2
         bOtw==
X-Forwarded-Encrypted: i=1; AFNElJ+eCs/M98W8FniUCOC4TwqeyVDbsdRjCnz+oBzl+adqzYG5UtKzD5ap5eYPcWnCStEzgFXKGeIQsSs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu8qy5gg0QhY+A1zIFWVeXAgrwt4EXpNVG8yxDcfmQQY2NLz9R
	Mnz1sYRSY2nM1+RrZGsWwmVhEjcIcvUjMBouN7Wu/W2xroRmD5y4jn8f
X-Gm-Gg: Acq92OHdvAMLqyPpxgqeeI2gJR1eF2fMYDSIBGnYtJEzZgKCei5hBpBsKkr7MAMHFoI
	hIycdSdjGidf5S8UH/dxsOAbKpsjVLfncDHQcIAlwgxfW8aV5SjmJCS6m3VOt03ZBoIl6inyHz/
	ei3LWGbgIlZZ4gbBakEz7pYy1WLSeW1gwn+HOP+pV9Jr5LbRdnfXSVWmaoUdqjEJuXXoHEK0p7Q
	IIydtwsHCVZF6wlPfnhhiMyk+QgNYyb+t11eLhECXFx42mxEZIKXkF7u0RwgBGEvWdPSgbHamLS
	c909jLpVBvTfS8uL1EJzQaxTiE1kTUKUKjnsElK/coumBGY1Gy9nOhfPCXUNuSRzF5tdkC/pX4m
	tbdR3GtazhzkprOmdPsKjfzGrzqKNIobEhaNxXUIoqi1ikfQeUmIw+XSPTG4W84enm3Ks9D0GiE
	tnRr7JAm6bzmyoT4/j8EaFi7C5UCGPdYNu+v9pS+cRAIJW1YpeRIDKk+LG1AmG8r/y1SQrZyZ9u
	CVBvwnDrNei4hQOF6mgdl3wyL13S11PtSyrrxtFCH+f/n4F61msSuQzFmQ/3g4=
X-Received: by 2002:a05:6a00:3689:b0:82f:390a:69df with SMTP id d2e1a72fcca58-83f33df437bmr17739669b3a.35.1779150439256;
        Mon, 18 May 2026 17:27:19 -0700 (PDT)
Received: from ERIC039ERIC.localdomain (1-170-130-21.dynamic-ip.hinet.net. [1.170.130.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f75c0d232sm4544463b3a.17.2026.05.18.17.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 17:27:18 -0700 (PDT)
From: Chen-Shi-Hong <eric039eric@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: hwmon: ad7314: document sysfs interface
Date: Tue, 19 May 2026 08:26:45 +0800
Message-ID: <20260519002703.544-1-eric039eric@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <006d3f24-b1cd-4fad-b8b6-96ddd904c283@roeck-us.net>
References: <006d3f24-b1cd-4fad-b8b6-96ddd904c283@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Guenter,

Understood. Thank you for the feedback.

I will avoid sending this kind of low-value documentation patch in the future and will be more careful in judging whether a change is worth reviewers' time.

Thanks,
Chen-Shi-Hong
