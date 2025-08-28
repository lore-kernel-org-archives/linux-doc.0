Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD9721579F
	for <linux-doc@vger.kernel.org>; Thu, 28 Aug 2025 18:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756405848; cv=none; b=fPJ86kglzyV9cSD8t5FIxQ9w5lhpJU1Z0q+wrWVv8G9xR+bd5uq7a9z7XUfydfHxcSdgEmqfWTL/UfWdTlZ/Qd+CoAlEVhiYdaIVfAu23NUxaHsI76N6s1yazcFmKH8PVspmE97EVaHjkdvKHSkGwvKCVfP2xL70ZW9PWOQ/EPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756405848; c=relaxed/simple;
	bh=+cJ/42k0VYV0M2aXW9zlZKPdMXAl4MnJ7P2jUvIq4L4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SCHZBwMTiNd4auCdR9I6nBwo2B1fG4om1btPCDAA2BhZW3YjOyBIgPBaoR/8uTBm2iuBToIGWqqmnAlvVAYUdY7rrJ87a3yv3FeLHbNjrGiKm582a1nPC8kFuKO7tjcwhafHLyc9vK0Pnbkoh6Y/S3hlF6PZIpa+HoVlpKC6fcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BNeBrZ+E; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BNeBrZ+E"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55f3dcb2b9fso2263074e87.1
        for <linux-doc@vger.kernel.org>; Thu, 28 Aug 2025 11:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756405845; x=1757010645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuEqj8/T+xiUJS7ax+9xjCXIR39EG8IKnjSfY7eLrqE=;
        b=BNeBrZ+E38BjyjvupSb2gQHpE1SplDzA9594rrZVAFinmH6jndpyrOES7ZCYjEawX7
         Zu0Q+VE+9IdXeHMVLPrzvkbDzItx9IfMnAyP2IPlsOLU7HMiawzKS36nYt6dXjtbRZNo
         7xjwH7XnljcnSyxmb+MSrj4wJegCell3tik0YXHc+v2KiffxqsVvM1lSEye06j4wS6vy
         bDOdXZEF5uKfzfsC2q1hTZ46afGd+A25JzBmdbv+dl8D6dR+/5+k5c3e3lNdBrn5WOBb
         RLCjpTxvYXpM23xRSqmyhs0S8A2MVZyr1ZrA2S2bDx/aWlch9M3VRKTjNMchJcnIpS5T
         avQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756405845; x=1757010645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XuEqj8/T+xiUJS7ax+9xjCXIR39EG8IKnjSfY7eLrqE=;
        b=VU7V5r7ac3dRwISlSxHVpbtbr+WhXv4a7Ema8S5tQNeybn5U723Z06JVl0jA7ughxw
         /jFoEDbLmmN3aL9TSJLG5eMUea4rPuCvwHvjUQ6c6avQI+kkprxKeWPbCOqEtG8B5uNI
         whz9CLdkul5nm4HiupOutmXWE16SekVqkjidDOZC1jdlEHrYTmQzK1104D0P8X0cvmi2
         h68/fh1THzpK6jfuGZHSw+n5NKHw8YqoBZkQl9MOl/BJSjD+fkNLdUBP0+U/rqOGzauz
         c9sDC3p08lGw56o0RDUeuyZBfg9pCKpiA1mp1B7/x2dJJk8qB8dNszGZeiZ6CpCivhRa
         wgeg==
X-Forwarded-Encrypted: i=1; AJvYcCUVZI7cYDm2sxQesxbAbvBu89N0rBF7xeb3mnhWpqRnZASVgO0oUSTmRzWRYHafqxraZvMeqeL/+eE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyO6entlKGSNlmoswNB4XRBUv/vSJntYG7JcdVFIgE6nzBdwUR
	AC1TDAL0bs+Dj5nEdWmvv1xW4SZYhcPDjuT1sxuILMvhstNoIk+MsyQec6toHtfHQNpobzXvwjc
	Zs3dh6T8RKLRW0BSLVRKeztMJjmcFgBWg6fqkcdDLCw==
X-Gm-Gg: ASbGncsTegALPVxtViyMjCbSqlDq2bT0l16cNgJ3QquO2TFwxdmJOrJuFLlkTcFpSF2
	mox1baCfYQKXY4PNIKLdbieq7RWt4q5cmxNgo46kdr1tjVK8SDZUCbfCVAEGGOvsvtOwMwTIgoQ
	YkbsK2JNz4DtVhz9yXp/zQRYK3RT0A3yvvAIRukltMeC35tYVfv0xC73J04JMT12aUzeAwnSh2j
	4C+dyCGntnUAbQyXQ==
X-Google-Smtp-Source: AGHT+IH/8kZJERm22+qgVkI/2abRlg7jFqSaoz19NfilAs8gqvm1/HMq3/qWcpNYFOG6zrPS0q3FvE7sFdLPB8sog2w=
X-Received: by 2002:a05:6512:2c0f:b0:55f:3f0c:e267 with SMTP id
 2adb3069b0e04-55f4f4c66f2mr2837563e87.17.1756405844595; Thu, 28 Aug 2025
 11:30:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250827074525.685863-1-alex.t.tran@gmail.com>
In-Reply-To: <20250827074525.685863-1-alex.t.tran@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 20:30:33 +0200
X-Gm-Features: Ac12FXzu3BqzQAEjjUx4V_NHl1QbSsY2Iqe-wW7HgjaVEzgtXC011QXplgETcSQ
Message-ID: <CACRpkdbct3o-=-hy97OMg1O+E_Tw8cNzRTa_kh0WB2LxJrHwJw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: driver-api pinctrl cleanup
To: Alex Tran <alex.t.tran@gmail.com>
Cc: corbet@lwn.net, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 9:45=E2=80=AFAM Alex Tran <alex.t.tran@gmail.com> w=
rote:

> changelog:
> v2

I think Jonathan will trim these two lines when applying...

> Replace FIXME comments in the pinctrl documentation example with
> proper cleanup code:
> - Add devm_pinctrl_put() calls in error paths
>   (pinctrl_lookup_state, pinctrl_select_state)
>   after successful devm_pinctrl_get()
> - Set foo->p to NULL when devm_pinctrl_get() fails
> - Add ret variable for cleaner error handling
> - provides proper example of pinctrl resource management on failure
>
> Signed-off-by: Alex Tran <alex.t.tran@gmail.com>

... but it looks good otherwise!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
