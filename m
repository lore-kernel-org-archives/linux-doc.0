Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF112D73B1
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 11:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550485; cv=none; b=ZJOHQ7I5ZnpYTfD5V1V4rVZFT1jHfRrCI7O4yLkKmbUu2J50jY98AcvoxPp3Ib77Zdbt6UsQ9uMecbTa4SngnufY2cLrf2jIwjIKtEB0JzJazKXicfT59rVKrd9h8WI1IpbO1Hmu1uViW+2zfedgkwshXMVrkCjzAcuEWpG7xPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550485; c=relaxed/simple;
	bh=oIVxbrisoLo5iDMUDa+xjmzIhUzB8la4EWGOC+bo1qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TMBHwA+mVkDubioNT5J177D8A4IyRxfTpn3idaMHDPGCWbBjdEj5TGNmxx9VxBPgSwR7EEk8g11Y0y4PoFPOtnkcLIy8gJbl0o+Oyk32GG5K9W2m8A6aBXshUfg4gFL0U/eYwwhgsehTspASKbDddrNA0S/lkwaZe9/Gx07XuBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DMluhrfp; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DMluhrfp"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso34453165e9.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 03:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1763550482; x=1764155282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nsm74sKvrsBWwA3IByPnPXltGNe2AsVyeAvijDWzmQ=;
        b=DMluhrfp92tf87GIXsGXiGJGTojFKBKQfpPXSDKwDhPeFabO0oneRX7Jdzte8jlddY
         Cow148zCZdSCOsRsLSSRYA6VfyBdWQtgHXRsDGqZAUnqItuiMrKntoLRIuL4oB44FgIS
         hoEfBouL+Iq6Un9UXRM7NrIi7GXMCMp/UMNkM4TOTMNbgCt6NK9WkkK8HdcNVXID9ElR
         iWtDM9JuFrzDRFdstrUH6MtVf5V4iYawg3xBvM+pxh22/2VYfN2R8wceNAEoxFsNg+Eb
         2s7xG19jJdGnOzPEk7bv7xO0MNg99HBCkvZ2goosGIaxzAskDrnOk7AXM7jSvCq9dlSi
         oKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763550482; x=1764155282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9nsm74sKvrsBWwA3IByPnPXltGNe2AsVyeAvijDWzmQ=;
        b=C4GsSvdMOcE5+ZrhgLEoWp8jwNoUTGrcGPQNfaqMO94o79w6IQABaz622Ra6lybCrt
         9gzz/p5S1PEWuZb69gPD+Qs6rzSPEInzFyQ/c/4wi655KJMlKWcwYo0Hb3NgmWKUz6il
         K+FTN/LHIH6xBzqwXK50u6O7rSef2iXf6xnL8dJnBHoKK9n74S0Fk+8MRk9XVCDxF1eo
         /qnkAZcNdk1xTzBhd8WT3JkAXpypimlLURFtigy6Dfl8nN5JIApxvYhC6KuUgUwGgzvf
         CbGxN3ERfco1dNf8YHRBoMc0+N+ffOfO6TEdNCTxRR47pC8K142SY24XK1FSUHNgPAKK
         9aWw==
X-Forwarded-Encrypted: i=1; AJvYcCVEq7OfvjahI1QEAMW1MRIZLoLilDAvVWCcj3IuM8G3gl8RSr+t/Gxr8w7Og0ygZJIKa4FdnXMvt5g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4YlsbSKg5yX4xKh2mJeUA0dprYx6FhIkn4IRjf9AhddLxIexW
	UzCYeBnX7nKEEK1/OIGLcL4p23qeAsGAQN16nOuj9oN/qUQqUp7pI+9koD9SHXFkpyw=
X-Gm-Gg: ASbGncvbtRtWMWsvCJtaaWELP+POUmPKcjodtAv83TQxYHNOgWRfXdT9rb8mYafg86W
	feUp7cK/fTWmMX67//x5Dm66MSbBZGH1tD3cDMCeESnGjWF3vtJRLJuEby3rkkoKIZbFCOfGX24
	eVMMyDUYYkz/d60KLnmjoHN1P5QK6G2KQPcbMJMp6i9YQYhXIAUiFYAnAG/vpBN8Zp7GnNmp3e1
	st7rdj2JXMeKbeZBLAL4VHo00k6IoJLNpXtJ3scEEEHUzprDq8/rbe/PXDJy1llAybcUuhch4f9
	FqLnfnjGmVapGpYskLBNLmVjDfJVlk9j665cklV5mhvKo9B63ihjJ5RrMM60NU8CgPmg6vJC8sX
	vtiC1DMx6KKi/ppftgzByYQMDBXrJuo2YxwtjcRs/wKL7fvfw+h7+g2BQlSr20TZPB84ZbcApfa
	xalb4f4rfIzWyjsi2cVOnlDwYe0pw=
X-Google-Smtp-Source: AGHT+IG8Wojb2HHUAV2dMdUaxEd77B7e9eazR3QULfNiB1mXqErl2PdZSu8eRBd2Qr8FuXPpA2rKfg==
X-Received: by 2002:a05:600c:524b:b0:477:af07:dd21 with SMTP id 5b1f17b1804b1-477af07dec3mr43024145e9.25.1763550482482;
        Wed, 19 Nov 2025 03:08:02 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:c10a:203f:120a:d2f9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b1035c78sm41765265e9.11.2025.11.19.03.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 03:08:01 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: =?UTF-8?q?Levente=20R=C3=A9v=C3=A9sz?= <levente.revesz@eilabs.com>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v1 1/1] Documentation: gpio: Add a compatibility and feature list for PCA953x
Date: Wed, 19 Nov 2025 12:08:00 +0100
Message-ID: <176355047774.64410.17146570177495488850.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251112224924.2091880-1-andriy.shevchenko@linux.intel.com>
References: <20251112224924.2091880-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 12 Nov 2025 23:48:20 +0100, Andy Shevchenko wrote:
> I went through all the datasheets and created this note listing
> chip functions and register layouts.
> 
> 

Applied, thanks!

[1/1] Documentation: gpio: Add a compatibility and feature list for PCA953x
      https://git.kernel.org/brgl/linux/c/5ef5f3c2245e13c62adf4cb0980cdd7bd72c59d0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
