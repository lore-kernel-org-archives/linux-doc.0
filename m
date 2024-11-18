Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBB1158DAC
	for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2024 22:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731969533; cv=none; b=fXBNVQLThzbIOoLw9HiC/zkSlKCi31ZkREdwTlCM+EHBr8Vp1XbPLlOjFw5EPy4Zzhacnxx0Ca5k2x71sMLl9T8BebMbLZehTf/OzZT97X8akTfPJy+4HSZyT3WwZDsnRSFJp0zdSgUiR8mY/Z0hgB1l6oL36O+q7ctzTZXcHgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731969533; c=relaxed/simple;
	bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=E5TiO3L0N/RoEhgylQ8t81XV4xXmhvApOMFsMBm8hpCeUB3S7xPTduJaEFMj7LWq+kZ+EDnOXjM1vh+slLOi5/gZoYPtcYKyO3ckzggSJqivKim2EX/lNc41MtRQa7wCaU83aRQyKatdvJHZUCoDGO6V0Ok1xG2hBiYqHx/M1VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAHQhpGU; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAHQhpGU"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-431688d5127so2003085e9.0
        for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2024 14:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731969530; x=1732574330; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
        b=PAHQhpGUxywnT0yfYdAgY+xZCyuTiM7t0poGxn/PtQRPPwKTQQaXJAxTLAizR7YVHp
         w06dSwZVwZSs57mSqFx47XtiFxwHRN9+j2ORQoNx9PwPD32D+Jz3Rtjl+NK8tyyITXvN
         3X3ga189a/VxU3OQyM0S/9Z8a4wCYQQ1dKt966OGjKyH7zRrRQi3gYM5q82T1tHCS5xr
         pnDSr6LPLFZHPt3RVSoZ9ozSX8ItHH0Vaz/Ub3ds2Mx8SWbzC2gJOKSEA7FBtzYTEaKL
         uOhOCjmrZYRonHEa0j/j8QGZzylCzpByvmE//8MAV+nKtIw/9C/qEuw7vAuNk0ACFRSA
         1GfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731969530; x=1732574330;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqk98GP19dZ+Ay7HEP68kLZER2bT/NkIqYTu8jMJ4BE=;
        b=Q1qHTJFRFUNwSxprY89UMy3fOfCO9nU8OiB4hdkZb++dgYsRie3keLP9VXi8iNe6QW
         p5cmSMEaYefHEEByZN4MWjB9/d4eJz2fUTjoz4iwLsmGI+UKRtJhJP5nlaV/Xj88dQ74
         ioI4MOARQbUzwQiUlOA38YXf76y9mN/dO4Do0KNwMGNGZ2QMequ6ah4RZKBjkulXG9V/
         S4apl8tYmaKMvSGCYYukH5FCrtU4pxpg9XSSAOMzaDPALgZx8Uac+4EZsytEdnmH1BMp
         9RDFwrppgEM/rsahV+7c0FBF6W/KBm/fCLlPLl2lPXgKAer6tUfDfJQx2PWwB/f3IZTu
         M/fQ==
X-Gm-Message-State: AOJu0Yx6WyITi1C5fJo1ItHzlis9aThh1wKW23Bllc0mmT7IuxlbtTc1
	yT7XAKPN5YvkoUSMWtp1xX47tApQzUce7+j3/ihi6TKxnbk2ZfXbIG5fHw==
X-Google-Smtp-Source: AGHT+IH4hj+MbEb5LGevnJHhY2oJ/mHzd6ewTzwjk6jYZk7bV6+XlRG5Zmas+zKhCmpX1NpEFEAlrg==
X-Received: by 2002:a5d:47ab:0:b0:382:383e:84d9 with SMTP id ffacd0b85a97d-382383e86a0mr6635421f8f.48.1731969530225;
        Mon, 18 Nov 2024 14:38:50 -0800 (PST)
Received: from [87.120.84.56] ([87.120.84.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38249b67709sm3348157f8f.76.2024.11.18.14.38.49
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Nov 2024 14:38:49 -0800 (PST)
From: William Cheung <sayichrist1994@gmail.com>
X-Google-Original-From: William Cheung <info@gmail.com>
Message-ID: <55ad7cb76857b27fe81524f5e262a247e13e5a45ef978b31866cf7023c8337e7@mx.google.com>
Reply-To: willchg@hotmail.com
To: linux-doc@vger.kernel.org
Subject: A Proposal
Date: Mon, 18 Nov 2024 14:38:38 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

I have a lucratuve proposal for you, reply for more info.
