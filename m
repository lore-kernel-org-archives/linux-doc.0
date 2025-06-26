Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995FB2EBDC6
	for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 14:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750949500; cv=none; b=AjjjQOg7/jRnWAayw7q6APqXtPHYrx3luzc58Tj9RiUPNhlYAmhk7/DRQ+prmJl9cuidzuzu3ENuNyXmMbmXHEWOjh5UmsVIbZa80ZLUBuBoeR4FYvEkMnO5aF9DBsEg85/8LYB45iIQKadKaF2Q2IKWenqO0jW1jvvTdpnx84c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750949500; c=relaxed/simple;
	bh=JF07pNpobx+eiQCknDKHloi8lwhYrfONSzZq4yCierc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k5cGexFaRcTH+p2aD77Z5a3sqBcofPcd9jRAjX9Fc80I4Yf2Uv+/o899IujaK7hJi22H6+59+xo/Z6tfRVR7HZ9s8hehBaU0HWGT7cOmcl30NaPPVcO9Y6sHMOEJx8gwKI9j9SflG7rpBAMFVAvOlRqT09qowc6E9s29uGBW4sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=NGjfB4kl; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="NGjfB4kl"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45360a81885so524975e9.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 07:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1750949497; x=1751554297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XCxrgMw5dH3wwRotvabG0epD5GWPSRw6BRqG3JMXTG4=;
        b=NGjfB4kl6jpcIAsJ0/Bx8XDQVMQtaf1iE+IrAQFcwiPuf+kIQawMK8UC/OvscE50dd
         x1KvUf9TBYXTdNTSkNk0IgtUKOPPLu1wY+xAl0fWp6TkwnShx7xasxBmlKJwheLeiLy6
         /q+AcF+T5UwqtvadYHVhwf5bflNvAL8/EVwoXB2rDM3jpbWA7jYBxoP++N2I+LcL5zdc
         RGFgLsNQtllkWY6DxyVrmudyWkek35dbWO7+ofsHKdiR0wc7szN45q1vflEYlOBBRLYh
         jbBmFQFH81eFPZNdEZZPNJtcA9efIK1JVJLIYvvnHn9b2FrgqzuTuUQ3hCCgJtryxUsQ
         L2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750949497; x=1751554297;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XCxrgMw5dH3wwRotvabG0epD5GWPSRw6BRqG3JMXTG4=;
        b=xQsLznTfbUu+hyDOryY1Nt8m2bEl6gbui0t8kbuZh0DD7F8kOpXcmLch2MEixq1qUj
         8epNVx6L2q44DXqYBPVm8mJd5tBs77HfRrwc4Slp6VIkzr5fwn1zkekmd8jSvInMYX+R
         avNQZX9ASABkxp+eMBXJC/0If0qjR4Y6j3p+jl+IFwmOjEctWHslE1g9skvQT6FJ3nsm
         l5WaGnW0ty+LaLtAZvsg53mHtxRl0SXoXbPxtiV84OPBOLh0vaVbCO65mNke1hn2aGLg
         mcZR6JRN1SJb5riYGj4YLCYk7B0LqyYzEW/RaDYvVzyd+H5lalrXHoOf/mkS4bF8ai/N
         6Jew==
X-Forwarded-Encrypted: i=1; AJvYcCUkR1rWy+IepDVuv4N5eMDPZ15uv2hDF2Jce4rVWDJZ5ceK5XEKUbRI9ET1YHbBBvYNhkeO2Aie3ZU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYf5IyBdIR+VrFDkoHRUQUsHOmBwt5nmvfXC958vWa0B3Uufiy
	qVfghwVs4/htGag4xuRvD1P8sTfB/kJNsB+TRAHrl/aNiHCbsO/m/jR6sTesofLqOjw=
X-Gm-Gg: ASbGncuSTfTqCUz/eC24R1n1r7ng4QYhQcsaTRLFpbN3CeRMJNEbS2d6nYUIxoXfSRb
	5xkKoVoNCESNU1SShaOmd5zP5xT4jPQ5iP25auiXAxl4gAOPbdk3LN8OrqhsNjvOzpxFXzNW7ab
	rUmO00h5Pemt4M/Al2OzmvyfAUCceS4/vy8QciOXsZPeRmHKnOgeB4ka+8fUQHAL9DkZa9L64Dx
	7e/LolebNiq845da1sPxA8s7iPcc/AsPqI9Z4DnQgLmdzA3kRjKEghRsuZi5JV5lW1iRjbOyGyi
	/O7/co7Hn1sIYJunk6nNc1WkGV3QdJfn2/cHvmdUaUJsDXxYisBQ9aSRT+z9JOzbcq77E981MuT
	udZ9TQGwu+d/jLh7F5QGcnrr/I9SrQTmWw3flFp8=
X-Google-Smtp-Source: AGHT+IGEqw+vHiOtazisTlthFJURpuJo0I3wC2xWaJSrVLuPouGSp44NESRPywzoYZsbj5JBnRucLA==
X-Received: by 2002:a05:600c:1f0e:b0:439:9a40:aa27 with SMTP id 5b1f17b1804b1-45381b0e6d6mr27342225e9.5.1750949496818;
        Thu, 26 Jun 2025 07:51:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:fc93:9188:755b:45d1? ([2a01:e0a:b41:c160:fc93:9188:755b:45d1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad0fesm54189615e9.25.2025.06.26.07.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:51:35 -0700 (PDT)
Message-ID: <f674f8ac-8c4a-4c1c-9704-31a3116b56d6@6wind.com>
Date: Thu, 26 Jun 2025 16:51:35 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH] ipv6: add `do_forwarding` sysctl to enable per-interface
 forwarding
To: Gabriel Goller <g.goller@proxmox.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 David Ahern <dsahern@kernel.org>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250625142607.828873-1-g.goller@proxmox.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20250625142607.828873-1-g.goller@proxmox.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Le 25/06/2025 à 16:26, Gabriel Goller a écrit :
> It is currently impossible to enable ipv6 forwarding on a per-interface
> basis like in ipv4. To enable forwarding on an ipv6 interface we need to
> enable it on all interfaces and disable it on the other interfaces using
> a netfilter rule. This is especially cumbersome if you have lots of
> interface and only want to enable forwarding on a few. According to the
> sysctl docs [0] the `net.ipv6.conf.all.forwarding` enables forwarding
> for all interfaces, while the interface-specific
> `net.ipv6.conf.<interface>.forwarding` configures the interface
> Host/Router configuration.
> 
> Introduce a new sysctl flag `do_forwarding`, which can be set on every
> interface. The ip6_forwarding function will then check if the global
> forwarding flag OR the do_forwarding flag is active and forward the
> packet. To preserver backwards-compatibility also reset the flag on all
> interfaces when setting the global forwarding flag to 0.
> 
> [0]: https://www.kernel.org/doc/Documentation/networking/ip-sysctl.txt
> 
> Signed-off-by: Gabriel Goller <g.goller@proxmox.com>
Please, export this sysctl via a NETCONFA_DO_FORWARDING attribute also.

> ---
> 
> * I don't have any hard feelings about the naming, Nicolas Dichtel
>   proposed `fwd_per_iface` but I think `do_forwarding` is a better fit.
What about force_forwarding?

> * I'm also not sure about the reset when setting the global forwarding
>   flag; don't know if I did that right. Feedback is welcome!
It seems correct to me.

> * Thanks for the help!
Maybe you could align ipv6.all.do_forwarding on ipv4.all.forwarding, ie setting
all existing ipv6.*.do_forwarding.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/ipv4/devinet.c#n2423

Regards,
Nicolas
