Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902C22135CE
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 14:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763650361; cv=none; b=pSomTSC8D9sN9/xsuYTe63ZgmzTe0BJeqqZVoz4i70aCjyRn/pRXoEgoymYS/E9VF3VFit9vNNaZf3k0iXAlfnQNnJcU0mQC3NRkfaww47QhdNO+ntZ5USw8sQ7SVeHvL6HfzRsctGHcOUsW+ZZjlX4jnEFd6CkeCZ0nyOJpqfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763650361; c=relaxed/simple;
	bh=qlVoOV1b0m1EsqTqevKebTa5adC2s2q0Xm1TYQIEY5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OXFdBvsLadDgc8e0KqlARcwpTj7dcRV2emPewBvppTCK7rWJY8NZ+QsdXWaoFoGni7ASRFAT3uUqpbcEAhExJ2yxgcaw5Ot5PwvqPYi2kL8oCQv40cTBLVYTiWhGRsdq8A2yTmP4gPgJ2kHgyLz5CWeGnAYlNEaSNq1NEVmRLto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=1KgjbmiQ; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="1KgjbmiQ"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7277324054so153971266b.0
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 06:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1763650358; x=1764255158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qlVoOV1b0m1EsqTqevKebTa5adC2s2q0Xm1TYQIEY5c=;
        b=1KgjbmiQcA2RVz54IvXXlSdGGsuG++U7UX4hfHSFB4tLAKJpux6kPxygEldzuHAZkq
         wdoXebLApjfbrZ+2yY2brZByqzAdbURTMN5OaBc6uVa9cnhwXNHvXB/6mvg4585jXWdo
         68uGnDjlfRdY2UK8IguwYer+G2pbFtwRfye2PlZ1YIAqq6xWLlt16XlrSBvRrnLMZpNR
         x9tHhhmEBnj8LPysGf/Ct+Hxxl3JThedC7OTgE2wLqEnKL2vLxLEMUi1aOtGqRoNqVS8
         gU8ZAR33ebFCTMg+LTGgZTi1D1aV+l7Knc4MDkGddR8GQ3RuRiPAoRbBd2R1CVEAFBx0
         yNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763650358; x=1764255158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlVoOV1b0m1EsqTqevKebTa5adC2s2q0Xm1TYQIEY5c=;
        b=njhi+bECaWka/C10kT1FZMYPcES4g3cNgxLDKb/4VwUMXsi+MCW4+4V/3LlZePnIt2
         h5No3SfsUXn+a2VpDUbpOIBPjwvtDxDNqH29N/SaPBrDkaTZGFpA/fEt00GgO9dc5Hml
         0c/c8u5LX53CTcVwWxKXzgXDo0EBwvVC9N8iFX+WzNwfb4Z7Yl1mPFoa2SJCIZMna3wY
         AZe64xHmsmespv6S6b/g9/7xvNZuefvQ/DWzhUJQgfOge9EGsjGUMH0i1IXehV4ncAFv
         mfBPgTpkLacLjiJAmBLUjYmR/s0SejZ+45SMekuFHq4eFxmGgGghF3HkdbZX3ZQQBJVU
         IESA==
X-Forwarded-Encrypted: i=1; AJvYcCVsmyCVHK9CTplCaHBZdUjE/iQFT0CC6tOOE051+MqbsGKCSzP4jDTvdEH1iPvJtar/SJJUjSrG838=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGUMP/RPH5xzvNPVgTbaLHF3gN+XOQ/vhNKq79j4b5MCVXU6sP
	bIm8nuClbRN5hBMNxhpB6MfXZxBp3tY+xDe5TTOAc3qi+fBP7F5MhVGzMnrUhWHqXlU=
X-Gm-Gg: ASbGncu7xTG7isxgnMoGqA4cpV0BlEyB1ITtziVWPoBrlKbmRXpQ2DOr9cFe1fVQMb5
	cYT20f0kNDvUtvMpONAyndDGhdHSOoGi6JIMEg4+9SaVaWZ9hawf+rgyxcncskCliybSYoHg/RN
	zbGdqCVO5fqppTk80X5jmcNp4p1qv0dVhnxLGgQoxqITzzRAm/0hClWdS2faiMvqLcbXSseoONa
	ZMMXbj7DJa7ntb4Q6X4eFM2CjBbybuJs6L7kY2MBS71AXIW2uGUdSFVDy6hEnpAkuwRxtaE9Qqa
	zoY6U3aCjjD+Z1+1wOcXZGSfjuH95oLf6NVXBKXn1gDsVQHfKddwRop//XydSw2UlERwi/3fxgs
	hJhQnC81R8/qGMY2H6e/AXrcqJhteJkTU/63l2+U7r8GYfnuF0d5mG41Q5g2tyrdfQyAzAs+xqx
	rIGiouEoLgsNjD66Sb0EI=
X-Google-Smtp-Source: AGHT+IHij78wIttXL5qrzeJ5Fr4uMDiSvsvUdH/MMYd2AuxlJUx0L+zs8iuv/NdnITfidNIJsVOY8Q==
X-Received: by 2002:a17:906:478b:b0:b6c:38d9:6935 with SMTP id a640c23a62f3a-b76552b9f32mr307984766b.24.1763650357685;
        Thu, 20 Nov 2025 06:52:37 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-645363c56a4sm2255897a12.15.2025.11.20.06.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 06:52:37 -0800 (PST)
Date: Thu, 20 Nov 2025 15:52:33 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org, 
	Gal Pressman <gal@nvidia.com>, Moshe Shemesh <moshe@nvidia.com>, 
	Carolina Jubran <cjubran@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>, Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH net-next 03/14] devlink: Add helpers to lock nested-in
 instances
Message-ID: <hj37vfeodmmjpfrfa6vnwm3rwp7an4fzt7bvi4fwyusjzgbtrm@fc6j4szuodq6>
References: <1763644166-1250608-1-git-send-email-tariqt@nvidia.com>
 <1763644166-1250608-4-git-send-email-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1763644166-1250608-4-git-send-email-tariqt@nvidia.com>

Thu, Nov 20, 2025 at 02:09:15PM +0100, tariqt@nvidia.com wrote:
>From: Cosmin Ratiu <cratiu@nvidia.com>
>
>Upcoming code will need to obtain a reference to locked nested-in
>devlink instances. Add helpers to lock, obtain an already locked
>reference and unlock/unref the nested-in instance.
>
>Signed-off-by: Cosmin Ratiu <cratiu@nvidia.com>
>Reviewed-by: Carolina Jubran <cjubran@nvidia.com>
>Signed-off-by: Tariq Toukan <tariqt@nvidia.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
