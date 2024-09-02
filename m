Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12458153837
	for <linux-doc@vger.kernel.org>; Mon,  2 Sep 2024 17:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725296643; cv=none; b=QQAr2TjNm1sF1pEdT5mp4D9rdRPacHyPtrmF3E9Z0oa05K5gr5pPmRx98K8XwkFwS4IsGAIOAiD4YuYqe40w9MGWNEkOTNqWIfzAdoLCvTN/WQ+lsbxparPaGGmJdHUNT/z6SS1JmVpc3Hu7M8MKKjEArjM9fo7YA8HDSnSyDUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725296643; c=relaxed/simple;
	bh=9wT4eK6i4oRyeo8ESmVM6UAdh0mGMkMy5q2Pm/qg14g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SztVyq9v15eGAPE7V6PQD7Vnn2Pxh5DtDZ4P/dMYr5rN5SKgfnkkstD8HqU7y4Snbe8ul4I8WVPwWoPPK3Rj9rNwlvZq4soWH6tOJWVmSFnKmNf0XyW/Mm7EGQSODrg7bbhhhzekQi1fzUNv977spKli9MVRFT2ykZvm92yhO/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=W9XMgBNt; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="W9XMgBNt"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53346132348so5495363e87.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Sep 2024 10:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1725296638; x=1725901438; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eVxlP4RyKCk0u7iRGxclgYQWGFkYbyTH0ZYWhwSGXng=;
        b=W9XMgBNta/BvjH45JJxKxV0mYQ4JbK33cKSBz4VkzaZBWNA763lZ2ye4SUSY1id3iN
         zPfd6DWrt1GWwokqQcr5jEeblcJtg8XNKmjkXxss01P76KS4mTS+I+pqcXqz1agiGlCE
         9oy/2D/Vgd/6wHFtkwaA/4vbkM8P1UYlcB6MY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725296638; x=1725901438;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eVxlP4RyKCk0u7iRGxclgYQWGFkYbyTH0ZYWhwSGXng=;
        b=gQdrG7DSzyFEbhD51erERrPG3hs+Oewezzi3vbaRkvDLkZ9dQzNRibmUPfuXXqR+c1
         G+rLOO67mKfjby1W5ECtQvEfxKAm4WRzzKy5aQHiR2Z0H74witOrSgv2FDzxgRp/2Pl/
         nqOPfVPjlbFnT03FS6wgmw1nDBSgBmJGLdSv5FQSmOYRr4VfH36+OGWAKZjtTfl1HITh
         WjJPcZOUvFzKPYJ4I7T05HH+8xewMrSwR01h2T0rB87olOoDZDNcaupg9o1DQfeiz9Cp
         +fg/hP9RQ3ALGsacQkAEMI0s22cchNr9x2JjtpnaoMaCtjUN0SKRLzXLYvaOAJgiWwmD
         qYVg==
X-Forwarded-Encrypted: i=1; AJvYcCU7HK7eMKtJDQDHB9dUq21L7lMZoHV+3P4mH0zyV9LX5ldzR/iOxQZIxt0uPXlwC++4YGtWeEvzCus=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9RkglN3Yo3qK0mjVoUbv4P6o9B2i67bCAKwMn4GgMiJjb84X0
	DUVqeRH2cYwZBWYlwSzbSNI0nBmhCwcQFxmeuto0NTJ/NgEgRM2iiqkQtxsJmII=
X-Google-Smtp-Source: AGHT+IFsIwWYLr4k9FC/e54AWYYLHAUzwqeRipuDwNOUraca5ExOev4/1PLhg++PWnCr4gnV/rpzWg==
X-Received: by 2002:a05:6512:3f03:b0:52f:c14e:2533 with SMTP id 2adb3069b0e04-53546b91c02mr7693393e87.48.1725296637468;
        Mon, 02 Sep 2024 10:03:57 -0700 (PDT)
Received: from LQ3V64L9R2.station (net-2-42-195-208.cust.vodafonedsl.it. [2.42.195.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d86b5sm587968266b.178.2024.09.02.10.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 10:03:57 -0700 (PDT)
Date: Mon, 2 Sep 2024 19:03:55 +0200
From: Joe Damato <jdamato@fastly.com>
To: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, mkarsten@uwaterloo.ca, stable@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Breno Leitao <leitao@debian.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: napi: Make napi_defer_irqs u32
Message-ID: <ZtXv-ywidT58IyNj@LQ3V64L9R2.station>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
	mkarsten@uwaterloo.ca, stable@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Breno Leitao <leitao@debian.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
References: <20240831113223.9627-1-jdamato@fastly.com>
 <CANn89iK+09DW95LTFwN1tA=_hV7xvA0mY4O4d-LwVbmNkO0y3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANn89iK+09DW95LTFwN1tA=_hV7xvA0mY4O4d-LwVbmNkO0y3w@mail.gmail.com>

On Mon, Sep 02, 2024 at 03:01:28PM +0200, Eric Dumazet wrote:
> On Sat, Aug 31, 2024 at 1:32 PM Joe Damato <jdamato@fastly.com> wrote:
> >
> > In commit 6f8b12d661d0 ("net: napi: add hard irqs deferral feature")
> > napi_defer_irqs was added to net_device and napi_defer_irqs_count was
> > added to napi_struct, both as type int.
> >
> > This value never goes below zero. Change the type for both from int to
> > u32, and add an overflow check to sysfs to limit the value to S32_MAX.
> >
> > Before this patch:
> >
> > $ sudo bash -c 'echo 2147483649 > /sys/class/net/eth4/napi_defer_hard_irqs'
> > $ cat /sys/class/net/eth4/napi_defer_hard_irqs
> > -2147483647
> >
> > After this patch:
> >
> > $ sudo bash -c 'echo 2147483649 > /sys/class/net/eth4/napi_defer_hard_irqs'
> > bash: line 0: echo: write error: Numerical result out of range
> >
> > Fixes: 6f8b12d661d0 ("net: napi: add hard irqs deferral feature")
> > Cc: stable@kernel.org
> > Cc: Eric Dumazet <edumazet@google.com>
> > Suggested-by: Jakub Kicinski <kuba@kernel.org>
> > Signed-off-by: Joe Damato <jdamato@fastly.com>
> > ---
> 
> I do not think this deserves a change to stable trees.
> 
> Signed or unsigned, what is the issue ?
> 
> Do you really need one extra bit ?
> 
> /sys/class/net/XXXXX/tx_queue_len has a similar behavior.

Sorry, Eric, I'm not following.

Are you asking me to allow u32_max for napi_defer_hard_irqs the same
way tx_queue_len does and avoid overflow that way:

include/linux/netdevice.h:      unsigned int            tx_queue_len;

dev_change_tx_queue_len(..., unsigned long new_len):

  if (new_len != (unsigned int)new_len)
          return -ERANGE;
