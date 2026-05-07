Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5E830F535
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 11:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778152090; cv=none; b=BqCHCekqo31IOhBmFqWOpubBB3oB+TBWT11ACCwOBDUy9MywiHUF70IKzJQm2lU8J6n++O5/L2q17kP+nNXnjR2qXykype2T91BzoXyiYdiout4OG5fB0g2ybDVYWf4vEFkrqF9hWGJ8Dg6LN+jYM9e2o0Sk+VsWw230SkEyRY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778152090; c=relaxed/simple;
	bh=Nsrc00XMPyX354SuXe3nqx7fE5fihqR3ZqDdgpTbxkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufCjZZtxI6lC7onmN/KNUUYZQgX+TZmsr+WmcykcA+hqHmbuhmUoap8Z0TLRDb1+LxW547pfhOwaoX84dnhwZCZHl/ZB/Wcf/HeU05hHc+a8F+aoTEJUy4Z1vJ3D8ceTcAQOSJMozzV9MogJl9jq62U7iZpFdpOj+Aqbmi4vUDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=vjhgEdP4; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="vjhgEdP4"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43fe62837baso381912f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2026 04:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1778152088; x=1778756888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kgrq7ox95689Ig8vha0xiBqXHGOC+ZuPbRsEee974HA=;
        b=vjhgEdP4XA6KSiKerw/89U6Z3XXtAo8tQ78KeMc9QWmjVF4e6YVKYWxt5tYkBJnFaU
         P2zcDqAQdZfRk/Z3MbZAi0Ypr6nkx6IzwgYMAvy7/fwPWXFSV3eRc5pT5bqYyLlofl8O
         uq8AnIAklk5MLvi6DQeEEtPXtnmIDL8dr8HADz2DAhE4QRJl7Iv3gjmHWJfwzn7QBzmx
         FSwGSsV26p+a2GVUXVjhGKFT7c7igFfu/FIn+sObWqLJw5M0GU+JqBwkWwFjd/gTCJmm
         mxT7IX3+uZKfWeN8x/7GjGrUlY3eyiJceB65Soe39Iqh0l+FPVIhauFzr/o7oL/G30lA
         GBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778152088; x=1778756888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kgrq7ox95689Ig8vha0xiBqXHGOC+ZuPbRsEee974HA=;
        b=OcxiFajXSs+wIgwkYlDP8Qn5ASpRyExUF6F0LiMNiLnJVTFpBGeJomC3j0W+93dzjP
         RvmVTDqr6RLgutRp4oow1uK5YS9TMd5qfxRzZ/6v1icr7SETLk/xHWY60IdrfrLOvq5R
         fumY30Bga+meCHVO8HQmPWnLIn/Ey6LceYtuc3NkFh/QkrSHBdTYs8tmI1BR1yPWfHG0
         KbdffgvqEYppgBGrl8YIcupanhX4Lo1lIjoIHk9T5015MeV6/G7PBhGbe3uhrBsSXFSG
         NZxZn1x21LYhZ5qMdFdWIP/j24SW+nhMQw5yVf2tJqI++HJNESMgyh34U+ZDnUWkYLX2
         BC1w==
X-Forwarded-Encrypted: i=1; AFNElJ/6MaQR3v2si7+OjK9BGpaJyWC6J3AwibQWDrRG6QyUDUnOo5A221E8PrO+CPQfVtjjSaTCrpy9iCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAA7jwf0nxb7wteLMvnulEZ55tKHb8UQx60beodqC96UbeJcD8
	Rr3xgVxTGAlf88HlVPpH6rL/Dtbpa7WsyRhO+a6iZXJ3Za+9DrcrRhC2FPBDb/hMqck=
X-Gm-Gg: AeBDievMUIRCqzoW9B2wWmr0+lYc00m1NGDVMZfAAQka46Xcwrn4ojMXxNRKaZpCEjw
	Hq4p3PFJj3PiI72xxXnt8tB3bmELlIAuvO+Moh/YUwI4msI6c2TZrvd6793VdvontU1onAWKar4
	BT+j/kL/GAR8aJUedAsQYEETMQYb7NZnMXhicms+v/n0kcBBKOESM3wCHvWxWMpMLn0FDtJlTN3
	na1QQRetdEecWuNESp1dtdyujFAPs37sDbI0+e0G1n13bZsLpqqIhNB5HIEQHf/jVaMsOxdU5O3
	Q3vn1mAugptD71ntMqnY5aN7xmmuDAFFK39WJfUTxNEDd2kSNjAIX49nvZxgkcllXav0C/AZZTE
	CRo/R7kVtHoMBq0N/gQH9uG7RIOZ5a3W2talTv12fu+PLyT+wWd7IYyJeVqwXExLD24tL/3n7S3
	1zYGjzZy6wIdrbrg/qRyR1lwUmEra65pK10ds5BISwb33sGlqRtwFMcA==
X-Received: by 2002:a05:6000:2c05:b0:44a:aa3c:5927 with SMTP id ffacd0b85a97d-4515d5c69b6mr12915400f8f.29.1778152087145;
        Thu, 07 May 2026 04:08:07 -0700 (PDT)
Received: from FV6GYCPJ69 ([2001:1ae9:6084:ab00:6064:31aa:7680:7221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b02abbsm18552017f8f.18.2026.05.07.04.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 04:08:06 -0700 (PDT)
Date: Thu, 7 May 2026 13:08:04 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, 
	Michal Schmidt <mschmidt@redhat.com>, Paolo Abeni <pabeni@redhat.com>, 
	Pasi Vaananen <pvaanane@redhat.com>, Petr Oros <poros@redhat.com>, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, 
	Tariq Toukan <tariqt@nvidia.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/2] dpll: add fractional frequency offset to
 pin-parent-device
Message-ID: <afxyKwzMcnc4AEu7@FV6GYCPJ69>
References: <20260504155340.411063-1-ivecera@redhat.com>
 <20260504155340.411063-2-ivecera@redhat.com>
 <20260506183342.767b5fbc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506183342.767b5fbc@kernel.org>

Thu, May 07, 2026 at 03:33:42AM +0200, kuba@kernel.org wrote:
>On Mon,  4 May 2026 17:53:39 +0200 Ivan Vecera wrote:
>> +          At top level this represents the RX vs TX symbol rate
>> +          offset on the media associated with the pin.
>
>Isn't this a hacky hack? I'd think that pin is in or out.
>Having a freq offset between two pins or pin and parent's
>ref lock makes sense. This new interpretation sounds like
>we are trying to shove a difference between two pins into one?

The pin is in, but it is associated with SyncE port that has RX/TX
symbol rate offset. As the doc says, the "offset on the media associated
with the pin". Why is that hack?


>
>> @@ -299,6 +299,10 @@ zl3073x_dpll_input_pin_ffo_get(const struct dpll_pin *dpll_pin, void *pin_priv,
>>  {
>>  	struct zl3073x_dpll_pin *pin = pin_priv;
>>  
>> +	/* Only rx vs tx symbol rate FFO is supported */
>> +	if (dpll)
>> +		return -ENODATA;
>> +
>>  	*ffo = pin->freq_offset;
>
>It's easy for driver authors to forget this sort of validation.
>We should fail close, so it's better to have some "capability"
>bits or something for the driver to opt into getting given format 
>of the call.
