Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC453C3422
	for <linux-doc@vger.kernel.org>; Mon,  4 May 2026 12:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777897604; cv=none; b=rfo0eqfuHkumZZqUf9Yap+nrPKA+GxR6iaT7Hi0hOdVbed1C26E/PD1SxV0vakhqhuJypWt8FWQKN0dV2/kbSrsQvGktzeObuDnYpvG3uHchUDjZRnM9deO8qV9ibguO3w01/znB05QwwZii9hQETTdq+gZp+YTps9cubTlv6IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777897604; c=relaxed/simple;
	bh=GuKduAnAifjM+KgXSrO9TSTQq1fQjT1dMuJSNnmK2KU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtLDdSHgArITnr84YQ33WN+mQAki15PT+RGpUzuMRC7HmYSva5vLEEn64326rEzoJ1igX3H1kAALcFMIVlopNnyblgoDxOQt5CAtaoC+ZlTkNB1KNbstLemz2YhfMHCRyofRdsBImKiq9OPAe+JEJmVBYsX/CpSgjZ1IhzW26do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=FxZRCPzF; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="FxZRCPzF"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so38203575e9.2
        for <linux-doc@vger.kernel.org>; Mon, 04 May 2026 05:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1777897599; x=1778502399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=djsbXCX96LzcDVFKY3N8T8f6fULjj9Xl7NUY8EOdjGw=;
        b=FxZRCPzFYRv2+F+2okSUuhTlDvhfok8708y2yAhiSK/6qikCv2BPPK2beb7Du2qKfm
         0Qri/7wtazK0S6qU4WpOGBqsSgG0nmkcTf8piFxbopGdzFSXuNC4N/n6VCttw8MWA2t2
         5oJ7vY9EtKgehzdQRnhHWFwoa0pEDqxgPyMTbWydWhe4d5Va587TWR6kkZQsy5zsZKv1
         3rnmsfMf69aqP0m+4z6h9NwQ5RoOBg0++bxncSL3SmdPrkpk1zkVk1bREXtm8+jYHev1
         Aq0MZEoJFUSB304hWU4KZsRjNIa+AWbkJr/nc1Gq0XOocorpsfYyC1No5vc4P3lQfkgb
         Mxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777897599; x=1778502399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djsbXCX96LzcDVFKY3N8T8f6fULjj9Xl7NUY8EOdjGw=;
        b=Cm155KhfLL7k21CPi1L5qEFrsV2JSLbnC0iyD3wc/PV8zsAyIztnc9e9TTdv/asA22
         5lF13IrtvBAAGZboD9BTgAFmg3VTGy1a647KG7H+5SBrg00Wu9WhZGY35zZPTPQ3asee
         qWXJhl5K2kO50d7bYg7oRrQIazOdLG3h7e/qFXm6gW0tnw4kOQeONsMvtoRbc/OEOR1p
         ZYa+HZRpAZS8IpXNVcII80kgExg8/wg5uHDhIBtaPKAk/1fI4vsNwbZEqbfIdzUyp2wS
         Deu1JwnlWI5RXbdzl9t8vHnUhSDw33+XCPO/U6Q0QqUUwQGoDa3/nIvjo4QUKCGzX5ZO
         SNVg==
X-Forwarded-Encrypted: i=1; AFNElJ+fmn9tqbFHw3At3yosjiTGKxLOztU+CXq+xd2jVb6mNJNkHjvsUV3jIs+VY9Ye2Bu2jwxKOo2GhqU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6F2BRf9ad87O00C+6bc8/FRDOM1om7O0awCdm6McBUm55OwOm
	/4VFMsAcknE3UxYum2TcmbeUmvQJY51oh/dOG6M1i+DlAxTcsLnWvVwxctVf7eGpnMA=
X-Gm-Gg: AeBDietm42Wlfu7/S3E4ueCMvd6X/GRlIT1isCjtDd+2gBGPDschXUV4Lsz8vsR3NRW
	oC8BGGjQBgHURi6RL/wvUNBj6/5lsSmqa4xgTSyVEg16CkeVrIHWza+Z5gCZXmsHEUe5ToPMg5z
	RoVgzRzs553iDIP8H/FOfDYNn3rvUgVXYGSk7RXz1wRbSwLXJSsM+guWWc8EOQt3+o7jvpLIoO/
	S+HINlFV5A/F7xJwiMpmvLfvKeXJDwcWZ680GavYCo0Lb/JshxLTLWtHSQGzJ4PQwfLG5nqEw9w
	uVjncwbquyRBK/WDWAn6VfJTXeCU3IUY9h0Td3zOmAj9RdY50T2Uq6GJ/vv5XBhSSn6V0OYGHat
	jn2Y3v5CDfUuB/lcVOtpWzdykgy9r7GHMBrhdRBhIsq/OYRx3oPmvqikw8YDbDutacLvtFLlGeA
	+VJ9SDC0xcmz4ibKUJIl+XoXQxvHQW4pImZZSMbIDrokRQEA==
X-Received: by 2002:a05:600c:c058:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-48a98874de2mr121990565e9.8.1777897598760;
        Mon, 04 May 2026 05:26:38 -0700 (PDT)
Received: from FV6GYCPJ69 ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f7csm334623445e9.12.2026.05.04.05.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 05:26:38 -0700 (PDT)
Date: Mon, 4 May 2026 14:26:34 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, 
	Michal Schmidt <mschmidt@redhat.com>, Paolo Abeni <pabeni@redhat.com>, 
	Pasi Vaananen <pvaanane@redhat.com>, Petr Oros <poros@redhat.com>, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, 
	Tariq Toukan <tariqt@nvidia.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] dpll: move
 fractional-frequency-offset-ppt under pin-parent-device
Message-ID: <afiQTPaMyAApbLRk@FV6GYCPJ69>
References: <20260430173611.3312596-1-ivecera@redhat.com>
 <20260430173611.3312596-2-ivecera@redhat.com>
 <afhdCnT0ns-PgZD8@FV6GYCPJ69>
 <290673a1-fb5b-4586-b44a-e109cc1a4629@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <290673a1-fb5b-4586-b44a-e109cc1a4629@redhat.com>

Mon, May 04, 2026 at 11:36:19AM +0200, ivecera@redhat.com wrote:
>Hi Jiri,
>
>On 5/4/26 10:48 AM, Jiri Pirko wrote:
>> Thu, Apr 30, 2026 at 07:36:10PM +0200, ivecera@redhat.com wrote:
>> > Move the fractional-frequency-offset-ppt attribute from the top-level
>> > pin attributes into the pin-parent-device nested attribute set. This
>> > makes it consistent with phase-offset which is already per-parent and
>> > clarifies that FFO PPT represents the frequency difference between
>> > a pin and its parent DPLL device.
>> > 
>> > The top-level fractional-frequency-offset attribute (in PPM) remains
>> > unchanged for backward compatibility.
>> 
>> That is odd. The ppt one was added just for higher precision but was
>> semantically the same. Now you change it. Could you still treat both the
>> same?
>> 
>WDYM?
>
>Keep fractional-frequency-offset-ppt at the top-level and add both
>fractional-frequency-offset and fractional-frequency-offset-ppt into
>pin-parent-device nested attribute set?

Since both are the same, only different unit, it would make sense to
treat them both the same. That prevents from user confusion, hopefully.

>
>Thanks,
>Ivan
>
