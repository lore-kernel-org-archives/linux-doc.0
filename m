Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACF11DB958
	for <linux-doc@vger.kernel.org>; Mon, 16 Jun 2025 15:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087096; cv=none; b=kJ63cw7bnoLPTkDlV9VDqybEhzvfwxL8xkOWSX5WocopZrC3KBhU8jTvT5If3wwQC14gkBGbGaOa2oGp7e94DomE/QXXnJpWY3w8OoxwXzgFK51GvQtmpnDKj1QrqPYZKn2tI1kiBzBMWm4c/XZdlZUlQ+fvE0K2X7sqMgDs7yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087096; c=relaxed/simple;
	bh=0Uwi5HcvGSgIv33Xf6N3b39LRxabNPsVu39qZpDYCnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8K4NFRKHdpq+2abvL3prlVfgluMhrkucxzfG2iMraUywVYi6U2DPxVN2RnF6fCrSAa07lJKSwLOpifJrvEbsEG7axLTu31hIJo926qPtXQ5TK7EIl+t7k3Ah3cy480kP75L7bYH2vlYpfE3yzy4LMXmesDxuwLQJBV1f0z9/Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=t0E3nMNi; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="t0E3nMNi"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so3696226f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Jun 2025 08:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1750087093; x=1750691893; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWtX9vXAE4ylrzNWM+gtRkVXqnOFx0L8cYcLFK9zXB4=;
        b=t0E3nMNi2s7g6juabHyfHWlSvMdnK5BXsQ26jgq4NtPZvXM0X6FPKzrdL+mzSAZFWi
         ohwhGAx3l3hyEWjRC5h3zFfBisZWS1lgM4EorW9OYf7BlUiABwrN19/Q6tYUA1x49yQr
         D6xfaDgObiAnRk1mYl6xj+jEr2rwGXpp7cokcyknSrz4kHa3N5avxoFqVjzYRGVGwUgC
         QUj//5/q/GsEUWjIGqy/GChA3FCf5HnQRZko9pP0WGJzNIn1W1e3AqgNGTNoi7u4LKuh
         ffIUp7eJe4A673VqE7usfg00TXC4br3/X8MvW4rBqV9W1WO2/MC7z3Xd/IvtG+/IY71O
         VojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087093; x=1750691893;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sWtX9vXAE4ylrzNWM+gtRkVXqnOFx0L8cYcLFK9zXB4=;
        b=TBPYdicQhuTNgrmcf4THM9rYvcA2pJLEk9u9MkpYGHBmdyRuX7duXAGEUJ4fcK7ogd
         ty/XjST734WWd9ia1ObMAg8XYZzWzXxTmaRQ/76h+GhiuwKbeoutjN1Y5HGFTINiwnPE
         78iyue/oKQWYr+EaZzlOpj5lllZyryPXd3bJuj7gpcZFt0jXxxdKqMx8vbGZ0ArFIBCp
         6II7OrJO5lw4wNN/Lb7BF6rO6zfrCyYC0LCiGDDTH3IliLEsuyG0lgroHapjJWXxS/2k
         QqJfd3v4g1AtLnwUIj+171+qSh+2TQJJpioVNg+OqVJf9ujVWMUOqHetxKZ8ObkCn8Nh
         etlw==
X-Forwarded-Encrypted: i=1; AJvYcCWE2p1jr3byFdkpod6Z1hfNtRExIsoLZRxAiC8RkYV2fZkzPF2Oq15sIOEMKzxfkOHeNQRe0Pc2dyc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzou8BLD+cvmVA7XrwM2/8NaNLAUMkBgp4oiZBcaPmBWadvzpZE
	8R29gC/8SJVFHIBQ9ji0RhF0lEkySsbu4lkh7cfQFg1TF+DtqjsYMoqTeBlr6sFWplM=
X-Gm-Gg: ASbGncueoBgPlWRab6OiGW8GQksm0vZDxHW6iwVsHgHkgrzwlP5P4c9de2qijj4TOn0
	GPLjpQr8MiEU+SmKA2124jrChBzOS9+OLlFGJ9s2WfuTyJpkyd8onBz1XjPEnziw8kFvtINb7qz
	wtiFL3hANraq/TE1Dbls5tTKBQ7iOP+II68aYgW1UrgxCuG5rvemwLKQSCWN1XCJywWE5Ra3t5E
	M3OsTlzlY+usww19o6S4iEmD12Me0HwTCU9iLKrHabxHkRv3KFQH+MhjhpmtEY+ODth4mzbsbfW
	GkNxRLwwkUYx2+67+jQkxfklyNEN4d31vy1d1XyEPULW3+uUPCStOTfE6aHqKFEjSeuQd2TVvwP
	aNw==
X-Google-Smtp-Source: AGHT+IG2wziWgDzPPtUiGHhkgZrnXbFFCxJ48YmTR61+iBYCNtEv6FH/PDzXC8sc2DbQNu0Loh/3kQ==
X-Received: by 2002:a05:6000:26c4:b0:3a5:2fae:1348 with SMTP id ffacd0b85a97d-3a572e99553mr7820909f8f.51.1750087092712;
        Mon, 16 Jun 2025 08:18:12 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e232b68sm145949525e9.10.2025.06.16.08.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:18:12 -0700 (PDT)
Date: Mon, 16 Jun 2025 18:18:09 +0300
From: Joe Damato <joe@dama.to>
To: Dave Marquardt <davemarq@linux.ibm.com>
Cc: Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net v2] Fixed typo in netdevsim documentation
Message-ID: <aFA1seeltkOQROVn@MacBook-Air.local>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Dave Marquardt <davemarq@linux.ibm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250613-netdevsim-typo-fix-v2-1-d4e90aff3f2f@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613-netdevsim-typo-fix-v2-1-d4e90aff3f2f@linux.ibm.com>

On Fri, Jun 13, 2025 at 11:02:23AM -0500, Dave Marquardt wrote:
> Fixed a typographical error in "Rate objects" section
> 
> Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
> ---
> - Fixed typographical error in "Rate objects" section
> - Spell checked netdevsim.rst and found no additional errors
> -
> ---
>  Documentation/networking/devlink/netdevsim.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

For future reference, since Breno gave a Reviewed-by for the last patch [1],
you could have included his tag since there were no substantive changes.

In any case:

Reviewed-by: Joe Damato <joe@dama.to>
