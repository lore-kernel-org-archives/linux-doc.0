Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC91196C7C
	for <linux-doc@vger.kernel.org>; Tue, 26 Aug 2025 13:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756214854; cv=none; b=urFd63LvujdvfJP3InzoKma9NhbRhsE/d0JOF36HscR/5yho3sr0y/cru3Asg1w1ckkNaFoeMfyaNMpEA9MVSBRr8qaEdguovKNEGkt2dSNitK3Zynbkc7s/0vdAfZdKOgp/JyzJGVVK49X4XhEsqJZu6H7/0nKeWlMoJ0WeiU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756214854; c=relaxed/simple;
	bh=m6EtPj0+uVtOuoBi+kY7iqJCwfqPxHH3Tv3BeRWW1Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E4+1i1Msbq2fUkfkjCvICNaZCxAmLEcFEOEAqgxw/7u6R+pVchVOT7L+8LMv5SbVdN5DdXy59+IuzfxFdO1U457EHlZlJ8GkZdzKirFdR/S9yxzklZJcqBGR27v1LySyYtWW2Wwb2kPWLfX9WjkRWE+ribUh1MRMNyBD2c3EPqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xg3UcQFe; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xg3UcQFe"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso4645616f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 26 Aug 2025 06:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756214850; x=1756819650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6mCp+F+gxJpSoi77Mk8DTDXwuJqpWFSqV1XbI8Gr38=;
        b=xg3UcQFeXrYGkLEw3nvaLClVq0TphRDVK5N96G8vGDcome2N8Hq8wkZ6vwHv0iFLVs
         cGWc6MKgRyVnImgE2tCb4aED30bwnPJH9rIsqrBMkN4Rt44QCWCOytZFYVXMkdewT2pH
         fD3E2cO8vG7MZVN59fDFEZoD9RYqe+ePoi2u4lg5meANts16N+7M+QN5357RC2n5Op43
         bBYF8R4Rm7n0WQyaC8++vSu95+Y7br1Z/DFab5dEiMz/TPUTJq+hu7D8D9wBz3G5OEIp
         cph3G0pcfjTtUa+UfZtigFnxbQ33EiOBNXAqtg7GuKDd8aGkNRQxd4fL7lilZh0dGkEZ
         CIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756214850; x=1756819650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6mCp+F+gxJpSoi77Mk8DTDXwuJqpWFSqV1XbI8Gr38=;
        b=LBtRD1zGt87CjMGmtKGID2zWUmUfzYzJXRtR21tgwMN10jA2a0XWofc/FossV382Qh
         KPj8XkCcl1DWI0sXdybE8NdDWs2up2WBnjbNaMhFyRspT7Q2G95R7kMGTWRNLRTjC2jC
         YBz/n3wMictiB4U0MqmUqgoA0QwXqdLHyYk2BiXjY/oAjS5D/VGJT6gTFr0S8tVBPRp7
         uN0ydNgqnEa5J5BVCtb65MeR87l/RnolpRvc1+vgUIqV8KGKEMF2ZBFPlXhQC5Y09zWX
         FXU8C+nY7ZcfU1uEiq7iJp50ZArfiNmHu4/Z2qgFeE2H+4xUsi14rkqVRXJjZFeAXrws
         su+g==
X-Forwarded-Encrypted: i=1; AJvYcCVxRy7JPAdd1R7nR2qO2vHSnoXlwLyk4FjRauKqOofagxCMNQ0m5B0kYHy2ZwfONiXCwTd9NbCq/Ow=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/C7ImSXSAj19pOHpbEYdVeXjYrhEAp+t+qzirCMMlZ4HMCUY2
	rIK5oSb/1DU387lQvtfiI1gV5bpvc5YdbTijTmiF6WWAfq5ui+ZGnySwh2vM8CmFmGY=
X-Gm-Gg: ASbGncsEGW7L/yNrC++/GfrHKArso/jtrKjz3u62Um1P/XERBjk5yx2BHsSS/TEZoab
	vtsaAkq6QzamJJ1qKFgzP+wTXEvfOdSYEXRxeDM6rYzCCCe7ox6k/gTrMjYeRenOW2mK0t24lTg
	puqiRFsaLYkjke07FWbXVBos8ltz3I1MnXFlphwFHTeCSXpvxDgGCQVvNPIlDTgN7zqbc4jkqRm
	qjxEKH6UuXwIzBYBvTeOfeNSJ+cc3s5MWn+QIo/Yq+ye71ywC3SYPpDMUlPG7QJTCfo8fCsRgtk
	Mk/upiKv3TuKNcu6lJxZWQpzMXj/a3Bz/Mj27nX0XaoyS7jfs7uMoT55GeRAdodp4bJLNgctOmY
	VOrL70qOFlojcTA0GKw127wlc
X-Google-Smtp-Source: AGHT+IEtIkJUDKq6YfUH3OIVgwuCFgy5UnEG3BCV3U9Lc+PLLOQkSw1irNa69/oxZWuy1ZkYx0BZwg==
X-Received: by 2002:a05:6000:288d:b0:3c7:36f3:c352 with SMTP id ffacd0b85a97d-3c736f3c4c0mr10077934f8f.59.1756214849721;
        Tue, 26 Aug 2025 06:27:29 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c712178161sm16133692f8f.67.2025.08.26.06.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:27:29 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Documentation: gpio: add documentation about using software nodes
Date: Tue, 26 Aug 2025 15:27:28 +0200
Message-ID: <175621484579.32185.5463919382812315938.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <tnaaz2qlk5jpbonfle7uy7pb54qx6ixwuczfbkwtxxwpj7hwas@y7a2rwko3k6c>
References: <tnaaz2qlk5jpbonfle7uy7pb54qx6ixwuczfbkwtxxwpj7hwas@y7a2rwko3k6c>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sun, 17 Aug 2025 14:30:20 -0700, Dmitry Torokhov wrote:
> Introduce documentation regarding use of software nodes to describe
> GPIOs on legacy boards that have not been converted to device tree.
> 
> 

Applied, thanks!

[1/1] Documentation: gpio: add documentation about using software nodes
      https://git.kernel.org/brgl/linux/c/8003235b10e54c1be57374c6224751b39750f16c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
