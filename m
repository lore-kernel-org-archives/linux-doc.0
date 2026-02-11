Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968AC2DB7BF
	for <linux-doc@vger.kernel.org>; Wed, 11 Feb 2026 15:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770824926; cv=none; b=gL6V08y2La+CNxk+dPhxhEiiqqDCMhU7EqYg4nx0GPBYbjFcj6gQPTtQAGw48YXSg2qSbwPqYhp+oshgPh//iaU+vdkaYspW8IdklesrVF/10WXFwGqBXiG2TG7HGWEW/Oa9tEALju0HydzxXfZDxaKdcaH+R2iwfWEAyx5jSGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770824926; c=relaxed/simple;
	bh=JuUdPkH25cCxwPFA1XouZJFR/geXAtZmuNACigwymFM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akKYLZqLP6u9SxqPfG2vElZBPJcirfhIQLqIrTtNF7MOmdSgiPiAsyfJD2h46ZJ1YnJD3E7DYr/i4ATptYCOkpv1TRXntv8HCpZq4RDmaNTgAEpVdh6Q9WloiZY21Kv8D88HPjELywYi1prtn0g5rdaM+n7j3JxhoSXzk3lvzs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZ8zF+dp; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZ8zF+dp"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4830f029407so10089095e9.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Feb 2026 07:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770824923; x=1771429723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kUog19f3UA9QhTl6kEgUYlRzsmDFYZZB3pA0WGtflsQ=;
        b=CZ8zF+dpNZKl6+9korVuEHUtjQcyKph5/xuVnhQ/zHKDD4GHw5oC9outveW2qMyR84
         FlQYaqG+L+A7ZbVtwu6dNIuBC6/3HCTn8GkkL4nouo5Z8dqMMHL5HuE/S4LDwfZS+wxS
         H2uaomOuoc1wQsetz4MgeYj0kTzWUOdkbZXLYGXfkdm/OFykNXK1uBNAlHdDTdWW+Nn4
         mKRqCMq2gDv5xd0MXPAyBE/DZNiDjNq9kS32hs0OmrJbTErx49shurLbL50caoY8LmAC
         gLVTAaAI86nhaTiCx9J92JdImssWpQbgMvmDMb7YoGcYj5aa3UeIkeNEW0zf4ZZBjdf6
         sE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770824923; x=1771429723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kUog19f3UA9QhTl6kEgUYlRzsmDFYZZB3pA0WGtflsQ=;
        b=aWKNukaR4zJTwTvas/8ykwgxlXRNp3GndCedTX8N8iYvmArLN/qFTnBMFfqtJ3ABWb
         6XjRGZgtsr/9USLfWDZwDxxk3QkHa6gSlknU5bou9EH2C6CluL5EKcDMwCLwtlcbS1Ct
         tXoI1DUDTNHX7nOeB2PQOemS7q8qrC3Te13J4B1J7WE6pVblkCrHYtGEHi0J0pAQEge1
         QWcOVFtOJ694A8YQns3dYi/yhg9reXYpgXF0kQIBelM1sqjLKbRYIQsRKgOtg3AbROLG
         QFLeNI48PCPCfls3MHT4L3SUqoMEVwUa4CqKgJeb0iw/5tJQTSnW2JXjCL0hHt39U6Yn
         kx7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKAPBkBxnGWS1f8fZziYGd3SsYpBLpn6ygjk30zw/aJjxsFLu6YQb8lgRQYKHmFhpfeo7ikJq+dgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxFWQIJuvyZtiB6B52WK0H/70kMx7Obx1PzzQEKawifuVoEU29
	kX9CR84g/ESsbhRX6nY6V8vqTu6l6VQyT16a+Q5nMzUU8GdtioTeGvJ7
X-Gm-Gg: AZuq6aItAHcCk8db0XRUwpLaSntnnem2M+er74WaydROtGdUusvYT8avliMTw3y6Yem
	jCtj++OKChMnVYzfF0inFEOvFx3nr05FGPVdsRrVOXHnlxzLfzPARP9zeWE9tsEopkf8ULeV2X6
	Pr+cGDcFk16Hy2eb/iST3FT62C9hi5xwa7XX0t+F8GnAbmsA1gB2lYVQWQNZ9/Hh+r6ZcL/81im
	1m4TNrdqmMEeMNC+/gD2646wkuJbYhDfetG9Y7/UUqLdod5/SyZCzowOy1qYv8jTmZsJ0x3nvOE
	vxFw+TjjaJaklGApa+l9oKZltEiScNoEozkwa9rXwz4whRlYt1gd5g/E3v2VRRUgwEzFHWZLPZD
	/8mj02y/k76+uieImCc7P0JDsZ1O+0bqsK7hg4ENVUZzYP00q7zd8RMDXb+TOz73jrr8BnX0+fC
	K2QijmoEeSa/o4LMKAURVhsgY=
X-Received: by 2002:a05:600c:8214:b0:475:d7b8:8505 with SMTP id 5b1f17b1804b1-4835e2dca60mr23446085e9.7.1770824922660;
        Wed, 11 Feb 2026 07:48:42 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:d8ac:c964:9b43:1b13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d82a4c4sm246760765e9.10.2026.02.11.07.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 07:48:42 -0800 (PST)
From: Vladimir Oltean <olteanv@gmail.com>
X-Google-Original-From: Vladimir Oltean <vladimir.oltean@nxp.com>
Date: Wed, 11 Feb 2026 17:48:39 +0200
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH net-next] doc: generic phy: update generic PHY
 documentation
Message-ID: <20260211154839.lbh4uovxr5b5s4nv@skbuf>
References: <E1vo0mF-00000007kbg-1OeA@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vo0mF-00000007kbg-1OeA@rmk-PC.armlinux.org.uk>

On Thu, Feb 05, 2026 at 02:56:15PM +0000, Russell King (Oracle) wrote:
> Update the generic PHY documentation as a result of the discussion for
> the s32g submission.
> 
> Link: https://lore.kernel.org/r/aXtvDn_-pCuKPrnf@vaman
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> I didn't get any replies to my follow-up question to Vinod:
> 
>   Please also indicate in the documentation whether changing the submode
>   of the serdes (particularly for ethernet) is permitted without doing a
>   phy_power_down()..phy_power_up() dance around the phy_set_mode_ext()
>   call.

There's certainly nothing *not* permitting that call sequence.

> I also didn't get any response to:
> 
>   For drivers such as stmmac, it will be important that details such as
>   whether phy_est_mode*() can be called with the PHY powered on are
>   riveted down and not left up to the generic PHY driver author - without
>   that, generic PHYs basically aren't usable from SoC/platform
>   independent code, and stmmac has bazillions of platform specific glue
>   already because of (a) bad code structuring and (b) lack of
>   generalisation through standardised interfaces that abstract platform
>   differences.
> 
>   I want to be able for core stmmac code, or even phylink code (which
>   is even more platform generic) to be able to make use of generic PHY
>   stuff, but if the calls that can be made into generic PHY are platform
>   dependent, that is a blocking issue against that, and makes me question
>   why we have the generic PHY subsystem... it's not very generic if it
>   exposes the differences of each implementation to users of its
>   interfaces.

It may well be that the "one consumer, multiple PHY providers, requiring
unified behaviour" situation you bring up is sufficiently unique here,
with stmmac/phylink, that local conventions are not sufficient.

I'm not sure that precise answers exist for your questions. Rather,
it's best if you could lay out common sense requirements, and generic
PHY reviewers will make sure they are followed.

As far as the framework is concerned, power and mode are fundamentally
decoupled, so I think the documentation is actually muddying the waters,
more than anything, by talking about a preferred calling order.
If there's any connection between power and mode, it should be handled
internally by the PHY provider driver.

>  Documentation/driver-api/phy/phy.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/phy/phy.rst b/Documentation/driver-api/phy/phy.rst
> index 719a2b3fd2ab..cf73e4fb0951 100644
> --- a/Documentation/driver-api/phy/phy.rst
> +++ b/Documentation/driver-api/phy/phy.rst
> @@ -142,6 +142,7 @@ Order of API calls
>  
>      [devm_][of_]phy_get()
>      phy_init()
> +    [phy_set_mode[_ext]()]
>      phy_power_on()
>      [phy_set_mode[_ext]()]
>      ...
> @@ -154,7 +155,7 @@ but controllers should always call these functions to be compatible with other
>  PHYs. Some PHYs may require :c:func:`phy_set_mode <phy_set_mode_ext>`, while
>  others may use a default mode (typically configured via devicetree or other
>  firmware). For compatibility, you should always call this function if you know
> -what mode you will be using. Generally, this function should be called after
> +what mode you will be using. Generally, this function should be called before
>  :c:func:`phy_power_on`, although some PHY drivers may allow it at any time.

My 2 cents: I would actually remove any reference to any sort of preferred
call order. There's nothing in the framework to back up such a concept.
Just say that it is recommended for PHY provider drivers to not rely on
a particular calling order, such that PHY consumers have the freedom to
choose depending on what suits them best.

>  
>  Releasing a reference to the PHY
> -- 
> 2.47.3
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy
