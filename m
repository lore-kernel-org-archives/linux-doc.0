Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AB428750A
	for <linux-doc@vger.kernel.org>; Sun, 15 Feb 2026 17:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771175483; cv=none; b=eZyc5ojffArUwik+yUtRV9vPWP61vdcc7C5wTACn+7i1vG3r+EIjoVQw/7abMPBljcdYakrcrwpavIFsDxZiUcSxuwLfxJxI8v9FTkijn2tnFEcE98rbeJxPn/UB5XrvjRAVANbP+SBaVsuQSHv2QbK4BNs22m+3FdJnMMx/zd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771175483; c=relaxed/simple;
	bh=OBDnP5x+5i6mTexdQ98mVTySg40rK+h2+jdvh89A+Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VLjS0jvIKBvWsZmAYsHaraJ389UNWC+AHwgKh7r7wsmdLqGE+85sMnChct3WtCLqnZy8LopQ0AwACiYlHKW0LsHdg5v/qBB6fSsHSaYoUjOYSzTqbzgn+ljJz232HHTIgX5+zIQp02eMC3M9SY7pJAm502HOdn4ULTBRhoIj+zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aG7FJzcw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aG7FJzcw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48371bb515eso26300095e9.1
        for <linux-doc@vger.kernel.org>; Sun, 15 Feb 2026 09:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771175480; x=1771780280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBDnP5x+5i6mTexdQ98mVTySg40rK+h2+jdvh89A+Xw=;
        b=aG7FJzcwXN5Uz5gg1hSQ4NA9XPSQOnwCpFbdCqXbGH5o/I/pC0915l0FKOdQ4LmnT8
         /pu/ERLgMjCVgYQtnvOw+FovBPrCQsifblVPVmgalOtowEhNpYYg+ED74EidHPp3WSMY
         gvAAcLJDHMue6yXlcf9cnzj4VcE2QzlFIVjLD+nGWa5Nrl4+ws8TOcpFmRUylv7Takm4
         YBns+90tIbaKfxnvCk9z/1f/n6NeeTvpw1nHBLjxm1l3iPMIiCD+xYirs7vfKGhvW6n1
         QqKIgMmoTzK48yDsjuQX30bASy/tC6nIlkaKa48xri2ZB4/RxoAh23edu/1kpMX53SiK
         gELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771175480; x=1771780280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OBDnP5x+5i6mTexdQ98mVTySg40rK+h2+jdvh89A+Xw=;
        b=LKoiMycxA8AQGmxYxFxlzwsFCN+ITDETW84WJhxJffQegIm7JDKiiCnjzLmjci7H5l
         GpuSiX8uQezHIJDbuCj9NpWjz86KgzTl7Oeb/wACjmys5u01se+YMgykcvic+m+qmaaa
         7qBHdRhW9gCSaDoy9FjvE2DkBUgGiD6P3NREkj/TUTnZWcn4VbaJVae4UW58UgnywZwW
         RWY8Zz7AdYyaDkKUiAsvSauB84gAVA8RfPTqHNM+1tNF4dtVsAod3NpDERYckZZXLb/F
         M+jba4MD6pc1ktC3rn/vQDHt+1XWE3wuGsfTRscSRLY4pq5sCysk/NDly394UrEyXZyj
         L8lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw6KTnxO28I+9uIR1v+Xg2j8brT+GiDYceI+qA1UFkowOBiv1zTCb7N1kXwn8dJQCpAoPfCQfPrec=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxICtPHCWh4SnPBmwpQQKDBqulbs/Eu7BGaEvGXU3EEWoH9FkF
	Tl9i8lzvptY8c2f/lJXWgCrklE7OyiOkhjwRksvH+vMH1mzraG3ucPIC
X-Gm-Gg: AZuq6aIaLFOJ2a0z6dM0zSS+5kA2XVEcHp5Ql/0HYn1h18RQh5MPKPii88xVzyHqvt/
	E0GF9kcbzG2j54GZb8YKWR2ZtbBkAyXnja8rJg59sFPmFu37qa8LavbDsL8OvuE2ps1yKHI6yQA
	gOXN+QAr2+vRsQPn+kzVN19ELl3Z7byg63LqD7SfuUtsTGiHMfo+H5zjn0r1kSDqPvjtnZh+4TJ
	nfn0OpIKrhLzfXG3X7LzP5mEb7kVufmihyQyS6f8FMRWgIR+r9meFpb6CWdZ2nBjvy+o580KMqr
	SVMT1fBwS4gg2BUHczf1ZA6dZMB1pnQlwaC6jku7VivsJ+bdao0pYkG8+mPj+8zkN13YildKPN/
	CTDhWbMvbvsHWWzA3/lpkSlrIYSjXQ/IXvo9Im46QDCuk36xFtCz9ER+SH4dwZfD4Nx8XEJT6az
	zKjLEs+fzZEXSKtIokTn/WOMBgpQQlc0HtHh4+/cDRGewScK/B//cSMBPwdSD++MXXxJekuJD7
X-Received: by 2002:a05:600c:4e49:b0:477:54cd:200e with SMTP id 5b1f17b1804b1-48373a08300mr129342135e9.1.1771175479939;
        Sun, 15 Feb 2026 09:11:19 -0800 (PST)
Received: from localhost.localdomain ([196.200.180.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d482480sm429211335e9.0.2026.02.15.09.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 09:11:19 -0800 (PST)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: jic23@kernel.org
Cc: 0rayn.dev@gmail.com,
	Michael.Hennerich@analog.com,
	andy@kernel.org,
	corbet@lwn.net,
	dlechner@baylibre.com,
	lars@metafoo.de,
	linux-doc@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel-mentees-archive@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	nuno.sa@analog.com,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v3 0/4] iio: accel: adxl345: Add event scaling and doc fixes
Date: Sun, 15 Feb 2026 17:11:15 +0000
Message-ID: <20260215171115.10273-1-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260215155720.361c797b@jic23-huawei>
References: <20260215155720.361c797b@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 15 Feb 2026 15:57:00 +0000, Jonathan Cameron wrote:
> Ah. Raced with other feedback. Dropped again for now.

Understood. I will prepare a v4 addressing the feedback from David,
Andy, and Randy regarding attribute ordering, whitespace consistency,
and the missing documentation entry.

Thank you all for your time and guidance.

Best regards,
Taha
