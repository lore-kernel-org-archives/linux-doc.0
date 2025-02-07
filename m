Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114F9193409
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 02:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738894866; cv=none; b=UmJ3pcMPMoRJaYLkV04gGnXgjF3fOK4/fEC2AWOUE2oXg6WJQkHZbv0ysni35mSP6kgyv+vNpTOdfWROtzlIQqETNOFqZYEFTiMHBdofui9LllIR04Bs5FtceSgdQ4X0vAjAVlpMx22XX9lwgRWsvUZkBcfXAMvzeml+NvsUIDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738894866; c=relaxed/simple;
	bh=lQaV34lurimnaPJ9vgfTHAK/26+j4AVXi7l/BHGkvic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0sttc/dRztS+OSo5+9Wu/HTEg4Oe5aBhpuncgFOMZDn3lMFlOqJOoW90NXAa4Pkc2CMzDRrAE6oQj3KSQYigdDVDQIngtmG/D1UyXsXPq6EROw2bahHaubTk+WbCdgqM6R51wcXcAJRGnsJAt4rmcRuFjlsE5oHkN7+QRERU9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MZbX5Y06; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MZbX5Y06"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30613802a04so17227551fa.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Feb 2025 18:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738894863; x=1739499663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ihgnc3taSXbrknD0hSr+bBzd9N3zZ9ifJfj9N5E5nmY=;
        b=MZbX5Y06nGBOcPlOPzBF/mufImJFsR5/iJ9xyq2oZIl7LtRAxUpFtHFuKf8T5SRk29
         wj+qrZIGEJgZLBZV7Hr2N25M8ailDKEbwWOxfyFdOWUKFxpo4BY4EpEHW+DnP9rSsjb/
         6BkEhM4bpBpBdzLH1Qntc3Bht42IV70PGtZLsnGxPh9QYVXjRATcLmN4f80Tl5OziIV4
         JjnCNjEMAt4Y7/Q+OY6QzRaH7o7nI5IhJVBkZ2eSfLH8WcUQvU5SVVlUdoNqYdokls4+
         L8pVgLH+D7yzchOkuSmnLZGYJt7ngxcQXeUf9zraD1djJmTnYewaa3jG5w7m3l9X6ef7
         2Lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738894863; x=1739499663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ihgnc3taSXbrknD0hSr+bBzd9N3zZ9ifJfj9N5E5nmY=;
        b=YxbUc+bCuxK4iCsTRBYnZkSSHJZvZjT562LSke93oay1lYMONkMMqAf1vF1PKHsjVp
         vq+bvpwOoel1h2s1DFIYzQiSOdbccO+L+yxWyckK6BZrt8yf0lWO+fEMZgFRYSkvCuXF
         qbNAPBINKspm51MvSxbRMV1mmJQYKRtYBa7+if/jVuTk0ui+Tv4oCE4i15sXAUiuZaO4
         DcOH7utcoFU117uJe/4TaT6p99S0FN7Dyzap6CE+obvTGefOdaAUiiCj/XoP24ADliXi
         jfGTwMVsIoMI6LuzOeJgJ2fAATnTFI0VrPnP2QjKa1NT0TbNP3cpRhEt2zvX4pckzebw
         MxrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk/zcC+fLkfd9WZzOumRS9AUdKeB8aa0kyeOT74d1sfK1Wyy0eNwnjvsje1EEHrBwJoYvvdQXgfJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtZWRB0RvQvB5kxGyqDhjb9WD3uGd90Jnsuqx5qEu1hbpuhXDy
	MfFAZSnqha1rHDu8pMdelhC/s01v6A4ngg045G+c/XsDIqEAPszUCiX802y+YQY=
X-Gm-Gg: ASbGncvdtUfC1LsLUTUzfiP62MMVG8V6l8vvPOZZ/4iyqo13z+C8lipAgp+bC5LWr0b
	le1GFi32Qm5/EDJyzTCT8aWTJ/HBjcfggwT1nnRKFLQzeqKQygtqDWWagLdC1U40ZNuQz31V7DP
	I2a4etUM+VGYFoEiDSAm3Y+QtVJTXpcyX4oZMVGvpCetnmxJYbBddO6k7jz/vUBoZ4vXIm6bwqM
	XgCVF4UelujsWvJD/ye7N99w+C/P86K1hTwO2sY+WZWOKeEfGX7y0FjUEuRDPt4WXZDEom5g6iI
	XikC8w8x50oX2soe3nGfUyli/3ym3JHuybzKRbdeMPKmA4ctQ56ohpN1s7YOlSDH/yWCwOo=
X-Google-Smtp-Source: AGHT+IHRDTBhlu8pAlsQ3oP0N0FtT5qdWC2jNVUTMMclmHpLd2GBk+UOaDGiKoBFjKCmUJyp2r/OWA==
X-Received: by 2002:a2e:a913:0:b0:300:3a15:8f22 with SMTP id 38308e7fff4ca-307e581b0bdmr3526211fa.21.1738894862959;
        Thu, 06 Feb 2025 18:21:02 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de177d22sm2841571fa.2.2025.02.06.18.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:21:01 -0800 (PST)
Date: Fri, 7 Feb 2025 04:20:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	=?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 02/26] drm: of: drm_of_find_panel_or_bridge: move
 misplaced comment
Message-ID: <w4iufoohajidadw6s6qwaa6uo4qna2yepieb4qe3thkk5terwe@m2b6wogduiiz>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-2-9d6f2c9c3058@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-2-9d6f2c9c3058@bootlin.com>

On Thu, Feb 06, 2025 at 07:14:17PM +0100, Luca Ceresoli wrote:
> This comment is misleading as it refers to one of the inner if() branches
> only, not the whole outer if(). Move it to the branch it refers to.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
