Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33418F5B
	for <linux-doc@vger.kernel.org>; Mon, 29 Apr 2024 10:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714387509; cv=none; b=Zhzk3YKwpYN40UM9Ekfo8EstqqMBFtq1OaCzLvE9V5xmWliwRMJQzImGJHGvu/gvYuJ0GnYhJn6UYeH/v/rgwrVrac4RMVjm+jouv1kjcwwBsAjI30vN6123ygudH33l8WOnIsBuo7UHYxrz/1vRhEwSy+XoA7k/9a/j3nNwTCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714387509; c=relaxed/simple;
	bh=21RMRAHr62HOzIUOgv3ewkW9+VGicSXGvye8BW7fsFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYcQ8bpfuFyvi+rp0TwwaDU5YwIEovbQqQoyB53Hnwj0wx6/tVuefgTRrXcaIDsItSckF8K/TA/xdHSjQ7EvPNSPf0dL1tqPojlEpVgG51ODdk7J/seyQXIlCxOspdeOcHF/i3wadZdTQ172upKSbCv8ePMQD4FJ5k/BDNNwXaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ferroamp.se; spf=pass smtp.mailfrom=ferroamp.se; dkim=pass (2048-bit key) header.d=ferroamp-se.20230601.gappssmtp.com header.i=@ferroamp-se.20230601.gappssmtp.com header.b=HF/UUzj9; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ferroamp.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ferroamp.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ferroamp-se.20230601.gappssmtp.com header.i=@ferroamp-se.20230601.gappssmtp.com header.b="HF/UUzj9"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51ab4ee9df8so5289936e87.1
        for <linux-doc@vger.kernel.org>; Mon, 29 Apr 2024 03:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ferroamp-se.20230601.gappssmtp.com; s=20230601; t=1714387506; x=1714992306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sIf87VobpQBzjXayRCky+XzMmywWO3o9vJ/C9lYT1FU=;
        b=HF/UUzj9jQKszUJcR0Duu5ROyJKt8w6ns5XLn0oNpmiWN9MVNOv1ltC5hh8YT9NBtP
         rmn0TpGL1tmdj35hYby7+pD3YHZseO8RRsZBmGrYXVgb4AD3Qm4JgX3eyEcMrImsmgHC
         HgM8dBuEtu/MCGBBfTi/6TCf/XOb3pFxBLFP+t8p/NEeGYFURJDHXowrmO3/3M+dELRq
         qqRddpLk2QvrRjur/oWEWqZvLI+CHvC80kJtE7nLVdU9zyUP9OQB/yHlkPbEDStjShbl
         Cdi8hiunbd87DE1ul2wfN35uP4XuYs88ZwGCn38WyOG7+a/6HihlN4tJ0FSV9TS7BcGa
         PhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714387506; x=1714992306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIf87VobpQBzjXayRCky+XzMmywWO3o9vJ/C9lYT1FU=;
        b=hGpm77XSSScYfMN+bjycW6IE87LVu/M1Vdu7TrRLNPFJ3NlheQk2UtdajkzU/23fQx
         g0OK6tWLEPEA4lQqxhqTiZ4Xtf+AoxXYLpigNdsd25zuAbbBWgdq1iE2Jz6N4r49+Rrf
         apUXS2Gtx7kOmPEm701tU4EOoTFw0ESxbXIJXDGCtvaAAhtJOMuqrBuAf1xTn2k1Weoh
         LGZPiTSPDDq3M55YboXDmbRrP82Wnb9uONlns6x6yOEOO8et1w0IQs/MJVrEiOzA8oYm
         dJs97ilkUxSTDD+OrPubeBDUE5YEKVBMGgZcHZbUYoJaCgaH09AExW+q6MYE6dsQqgU4
         3dvA==
X-Forwarded-Encrypted: i=1; AJvYcCXasAZGXP0J2mRca4/bu8QGxV8aAZS9dppl8ErJSsDjrAY2zh+nNLa9P710xeRjPbGFKsa6OEUkFUmvBvji2sLfb5prly++H5a6
X-Gm-Message-State: AOJu0Yw4nsbCrS1Gnl6vwJJUYwBTGwP/CsQxTpjx7RegDe9aosFO1a9L
	QT+wmSST3ICApVwgW6vY2hb/q1UaCw4voiO/DFrAFAWUCOY/xpinrmQS16tnO9M=
X-Google-Smtp-Source: AGHT+IHE9ANqur2+1+XKhc4MrtY/BD5yLizVMOaJPlYSALAtWsYgzCwhL67JKEMz5AyB9A979d3WUA==
X-Received: by 2002:ac2:5dce:0:b0:516:d3ba:5602 with SMTP id x14-20020ac25dce000000b00516d3ba5602mr4811351lfq.16.1714387505986;
        Mon, 29 Apr 2024 03:45:05 -0700 (PDT)
Received: from builder (c188-149-135-220.bredband.tele2.se. [188.149.135.220])
        by smtp.gmail.com with ESMTPSA id k8-20020a05651239c800b00517746176ebsm4055614lfu.49.2024.04.29.03.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 03:45:05 -0700 (PDT)
Date: Mon, 29 Apr 2024 12:45:03 +0200
From: =?iso-8859-1?Q?Ram=F3n?= Nordin Rodriguez <ramon.nordin.rodriguez@ferroamp.se>
To: Parthiban.Veerasooran@microchip.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, saeedm@nvidia.com,
	anthony.l.nguyen@intel.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, andrew@lunn.ch, corbet@lwn.net,
	linux-doc@vger.kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, Horatiu.Vultur@microchip.com,
	ruanjinjie@huawei.com, Steen.Hegelund@microchip.com,
	vladimir.oltean@nxp.com, UNGLinuxDriver@microchip.com,
	Thorsten.Kummermehr@microchip.com, Pier.Beruto@onsemi.com,
	Selvamani.Rajagopal@onsemi.com, Nicolas.Ferre@microchip.com,
	benjamin.bigler@bernformulastudent.ch
Subject: Re: [PATCH net-next v4 09/12] net: ethernet: oa_tc6: implement
 receive path to receive rx ethernet frames
Message-ID: <Zi96L3WDCwLz-2_O@builder>
References: <20240418125648.372526-1-Parthiban.Veerasooran@microchip.com>
 <20240418125648.372526-10-Parthiban.Veerasooran@microchip.com>
 <Zi1Z5ggCqEArWNoh@builder>
 <b82a3006-05cb-43a3-bbe1-4f2f81113bab@microchip.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b82a3006-05cb-43a3-bbe1-4f2f81113bab@microchip.com>

> > To avoid an additional copy here?
> I think, this can be done later as part of optimization/improvements. 
> Let's keep it simple and optimize it later.

Sound good to me

R
