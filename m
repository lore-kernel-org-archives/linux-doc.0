Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C70F1AAA0D
	for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 19:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734636830; cv=none; b=Eavc9VWh21G0TNl6oNMmu7J7TjvV3c25xuKjq2FMwas26dMnpxB8E3T5NufnbpawxSnMuXUv+B5rii8oXnQvE9E8GqIGI9ChRAKuxAS0SoBSmoV36rYk17WMcmK5ySF+oKOyIY2vtFc7pNgxH4EeqQotEqfkp4MmE9tjg5iHrVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734636830; c=relaxed/simple;
	bh=httATb1ymtCGKd91eJhIi+HaosnG+JyPL/0hhs64yqo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u0rTbRuKwl9dRFWuxZcbxIJk6oTqog+PGJMqRQovQZuhw9mvWIcbKF73AXUsh9DLW24mCGRjmTIFvm9m5cFu2fCa76Tn9RQvXrg7nM8cP0xCk6CWSrzxeOutMCffoSvqtYmOP0t8quEF4SkyPCaWTRxZK3uaDPgwua/v9v1Zqys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PuCqY/30; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PuCqY/30"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6dcdd9a3e54so12316356d6.3
        for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 11:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1734636828; x=1735241628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e8GZPnjYdvnnhutLfbIS3QURIQzQsGzxkrSp0swXEfk=;
        b=PuCqY/30H93Nxsr3gkSYuV57x7RmzTjglWsKmDIoyewehsx2C4bU2CPTcVu0hzwt4r
         Hfrv1RGFFCazO220G2S/6R7FkkXDig3ukLbIHjttgiCNlHZgO53afet+YFhHfYKEvw16
         ezjM1g0BPw+rOTWJWM30vVjfFUdpKKvZHHAQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734636828; x=1735241628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8GZPnjYdvnnhutLfbIS3QURIQzQsGzxkrSp0swXEfk=;
        b=B/hSXXM33jDrtHS2LP6TDpIWQQgu2ug6v3kaavKxywL1YKdOc9lL906EetNKSHFcaR
         3+iViag8d1S2dVrYmaqNZlJomL+u+ljcnfZp8kfREF442FLCFFbD9xC9LDo/jKHJHkCW
         eIjtwHeeW/8t6mCmCDZF+NkzOKVZNsCjotwB/yohFynt3FsMpr8yyvIhb5+69EAL4Shw
         tZ8dqK9fwGIcVpu7od9L0tGLzmOnq8AhkPEm6u8bfjLucOsvxEvSucqqTeE+/+qkjLOc
         GieJ1v+QDq27T7liVvJadYy2aKC7esAxPvOLpRlZn6ViUFxGvxD5w5TSBPX0vVqps5iZ
         6uLw==
X-Forwarded-Encrypted: i=1; AJvYcCVn5Sc6mDlhitbpwYtpobFocoYtGG9AGUQhskkz5GY+kJurseUGgK9viOQ+4DQodk2KGNplP9Supas=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoNC4tu96ZioBhzdlKFlK9gntPe36S5ZllBg8M25+98feN8yjW
	8AHTO0UV1280Cu/KfkJeT3seeQAnZrrXIaXH18dIJZWOiD7zha+Qmsc7WTn24w==
X-Gm-Gg: ASbGncsKhy3K4zQWYcrUBp1CwCqZ8JwnDvnWW81y7oUn8K5yE4U78mbnanhG+9dTOo1
	fD9owgi/Wae1+mdn9TZzZNVu5VMC/R4MclUFn/s2UIzV8jKcCjSBSTYBjna2hLFey3U2kVo4Byi
	ALFl8A1w+5+w/lbINI/671F5FWZ5S5ZOMpP+odiRq+U4W6ac2/kC7i4RKVPxgCvshb+YhF6ZORJ
	N9l5CJJoYDRQH/izEGuzu85GiBpz/fX3dhgLvtUABM8iD4KCtmWX/SO49eEp0hfKiFKv0PcdtfZ
	MQ6WNnMj0cz40IgSJMUHYzSmxSJjeLxu2QCj
X-Google-Smtp-Source: AGHT+IFDW6ICD8LaIX/NyRzO2OZiENi3yKhdbPS7WF14v5ps4aUz74owBwpuko0/HZgGL15xa7zN8w==
X-Received: by 2002:a05:6214:d48:b0:6d8:5642:d9dc with SMTP id 6a1803df08f44-6dd2334bccamr2156466d6.11.1734636827637;
        Thu, 19 Dec 2024 11:33:47 -0800 (PST)
Received: from JRM7P7Q02P.dhcp.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd181bb530sm9392336d6.76.2024.12.19.11.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 11:33:47 -0800 (PST)
From: Andy Gospodarek <andrew.gospodarek@broadcom.com>
X-Google-Original-From: Andy Gospodarek <gospo@broadcom.com>
Date: Thu, 19 Dec 2024 14:33:44 -0500
To: Jakub Kicinski <kuba@kernel.org>
Cc: Taehee Yoo <ap420073@gmail.com>, davem@davemloft.net, pabeni@redhat.com,
	edumazet@google.com, almasrymina@google.com,
	donald.hunter@gmail.com, corbet@lwn.net, michael.chan@broadcom.com,
	andrew+netdev@lunn.ch, hawk@kernel.org, ilias.apalodimas@linaro.org,
	ast@kernel.org, daniel@iogearbox.net, john.fastabend@gmail.com,
	dw@davidwei.uk, sdf@fomichev.me, asml.silence@gmail.com,
	brett.creeley@amd.com, linux-doc@vger.kernel.org,
	netdev@vger.kernel.org, kory.maincent@bootlin.com,
	maxime.chevallier@bootlin.com, danieller@nvidia.com,
	hengqi@linux.alibaba.com, ecree.xilinx@gmail.com,
	przemyslaw.kitszel@intel.com, hkallweit1@gmail.com,
	ahmed.zaki@intel.com, rrameshbabu@nvidia.com, idosch@nvidia.com,
	jiri@resnulli.us, bigeasy@linutronix.de, lorenzo@kernel.org,
	jdamato@fastly.com, aleksander.lobakin@intel.com,
	kaiyuanz@google.com, willemb@google.com, daniel.zahka@gmail.com
Subject: Re: [PATCH net-next v6 3/9] bnxt_en: add support for tcp-data-split
 ethtool command
Message-ID: <Z2R1GFOg1hapdfl-@JRM7P7Q02P.dhcp.broadcom.net>
References: <20241218144530.2963326-1-ap420073@gmail.com>
 <20241218144530.2963326-4-ap420073@gmail.com>
 <20241218182547.177d83f8@kernel.org>
 <CAMArcTXAm9_zMN0g_2pECbz3855xN48wvkwrO0gnPovy92nt8g@mail.gmail.com>
 <20241219062942.0d84d992@kernel.org>
 <CAMArcTUToUPUceEFd0Xh_JL8kVZOX=rTarpy1iOAD5KvRWP5Fg@mail.gmail.com>
 <20241219072519.4f35de6e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219072519.4f35de6e@kernel.org>

On Thu, Dec 19, 2024 at 07:25:19AM -0800, Jakub Kicinski wrote:
> On Fri, 20 Dec 2024 00:14:01 +0900 Taehee Yoo wrote:
> > > > The bnxt_en disallows setting up both single and multi buffer XDP, but core
> > > > checks only single buffer XDP. So, if multi buffer XDP is attaching to
> > > > the bnxt_en driver when HDS is enabled, the core can't filter it.  
> > >
> > > Hm. Did you find this in the code, or did Broadcom folks suggest it?
> > > AFAICT bnxt supports multi-buf XDP. Is there something in the code
> > > that special-cases aggregation but doesn't work for pure HDS?  
> > 
> > There were some comments about HDS with XDP in the following thread.
> > https://lore.kernel.org/netdev/20241022162359.2713094-1-ap420073@gmail.com/T/
> > I may misunderstand reviews from Broadcom folks.
> 
> I see it now in bnxt_set_rx_skb_mode. I guess with high MTU
> the device splits in some "dumb" way, at a fixed offset..
> You're right, we have to keep the check in the driver, 
> at least for now.

The mutlti-buffer implementation followed what was done at the time in
other drivers.  Is the 'dumb way' you mention this check?

 4717                 if (dev->mtu > BNXT_MAX_PAGE_MODE_MTU) {
 4718                         bp->flags |= BNXT_FLAG_JUMBO;
 4719                         bp->rx_skb_func = bnxt_rx_multi_page_skb;
 4720                 } else {
 4721                         bp->flags |= BNXT_FLAG_NO_AGG_RINGS;
 4722                         bp->rx_skb_func = bnxt_rx_page_skb;
 4723                 }

