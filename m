Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938768F77
	for <linux-doc@vger.kernel.org>; Sat, 27 Apr 2024 21:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714252179; cv=none; b=CxJtcRTcgv7EYAAGhInB8I0bQAjVdBL/VRtqvSo41+CUoV4N+Q1tJYUXDcH4fHduYn3/X+MIxl7HurYzXZzxFYQH08YskKATkaoFjX/dvKNUpGPfU59FEslnqUiFUmsADiO8mFyvNRBlDeFyumDXUzL+3z9gGGiZp8k9kPQRBVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714252179; c=relaxed/simple;
	bh=yM5PWgZeiUSTVvfdIQdobAEEnf+XmPghsPqHz0QFhJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTkopWTrD5lPUMJb2ACIEeCqy7Kmn243Ry0fefh9TdIgQnRHCSlj9CA1CyEjuetLi/8sCMjYeFg2lWcMJ1+lOIfuhDhKgw8tjrsFrWbxyPSHV8XKAduZnrLnnYB4jqKqE9KxZAA/yXzeohh74l6IlGnoX+MmUMKNgjMLQltJGUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ferroamp.se; spf=pass smtp.mailfrom=ferroamp.se; dkim=pass (2048-bit key) header.d=ferroamp-se.20230601.gappssmtp.com header.i=@ferroamp-se.20230601.gappssmtp.com header.b=3aAgJYC8; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ferroamp.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ferroamp.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ferroamp-se.20230601.gappssmtp.com header.i=@ferroamp-se.20230601.gappssmtp.com header.b="3aAgJYC8"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d8b2389e73so39019391fa.3
        for <linux-doc@vger.kernel.org>; Sat, 27 Apr 2024 14:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ferroamp-se.20230601.gappssmtp.com; s=20230601; t=1714252177; x=1714856977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c2zTIoadr8RExdz4xMeAhQeS4RkPDjUKmRxEp7ueNe4=;
        b=3aAgJYC81418Hx2lRVt6IfnEeWBAm9hX6JcTfOTNnrx9SpCM+Z/SkHXEdz/bseDMbZ
         l8sGzCA6nYB5137zUPXINbZCZ0X+EoxkqxRcuF0YAQBNnXZX1+YXEGju6z75AQNf7o7E
         q0Ehl89f8dlVy527VquR0WWBBSiKfCJUpB1jwrUFjQdDJscwSUdSEvvPBSV9FtzRrsFo
         4CyCFyBvMrRlV5xgjNrRALX4NfKEb3gdQBriNh+w/nPylMz2zZcFipKxv2uTZaeFgO7h
         1qn1sgsV7CEORYdGxze+ScNYq0nDC7Y+eThLttg6y6ZxawR/rKmKObURyATlJq59kklu
         GeMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714252177; x=1714856977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2zTIoadr8RExdz4xMeAhQeS4RkPDjUKmRxEp7ueNe4=;
        b=c+0C9EpI6l/KoD9IoMt3NO6wtrD3uI57Yl6EXjtlF+hxLHbiX+miA8Y0nDndM/MJhD
         Rn5q3PQkXZm2UCzHzr+EL97HBWQDxTFrD8HPkkMJuONsTPLq061qdTODLhVqLXMsJZQO
         7ZSN0ZJgQMKx2a9nfuhLn4wHW6+FNkpf8Dwq14zypHjMO2pYuMDXCxqDPepyxsyb9CpV
         dmUz5Hjvl0xqLF4cFq2VxYAUx3wmf5RN+KNswd4AcuQRWZHL6XH4hUEBDK2Tycnsrlc4
         U5vIBBl1F8sZGjlkwClj8qD5/1HscwouJgk/3psQz1Rqo5ZZ8ZiOVn/WwnhOawLOQJRS
         9EcA==
X-Forwarded-Encrypted: i=1; AJvYcCU28eu7sFvhaQaOczRfsa6bBIBglsN3JzR6dbEaflJD6ns8OAFOahb/zXLIO3OmCOjSUZuTMpGmKJPQMyynM+KqmUdMf00UEmKt
X-Gm-Message-State: AOJu0YyXZqw1VqZAHXFgktHe2QE+JxSg4ZKOjr+hBXjlqLKJ/cmDVlPE
	67w0THHGIcTfDHFVvsL+NOsJnr0pPqRX+TSOHwWYEHJI2wB1ju6A8iTAYqmi7mY=
X-Google-Smtp-Source: AGHT+IGDtQZoTkTFz5qjYB1+ezyxCNNT2QBqmEwUhpivw7iry0dGY3XBbfNI0/XF2v1BbI18pjRlrQ==
X-Received: by 2002:ac2:5e21:0:b0:517:87ba:aff3 with SMTP id o1-20020ac25e21000000b0051787baaff3mr3459847lfg.43.1714252176841;
        Sat, 27 Apr 2024 14:09:36 -0700 (PDT)
Received: from builder (c188-149-135-220.bredband.tele2.se. [188.149.135.220])
        by smtp.gmail.com with ESMTPSA id w23-20020a0565120b1700b0051d22e9dfcfsm277139lfu.21.2024.04.27.14.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 14:09:36 -0700 (PDT)
Date: Sat, 27 Apr 2024 23:09:35 +0200
From: =?iso-8859-1?Q?Ram=F3n?= Nordin Rodriguez <ramon.nordin.rodriguez@ferroamp.se>
To: Conor Dooley <conor@kernel.org>
Cc: Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, saeedm@nvidia.com,
	anthony.l.nguyen@intel.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, andrew@lunn.ch, corbet@lwn.net,
	linux-doc@vger.kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, horatiu.vultur@microchip.com,
	ruanjinjie@huawei.com, steen.hegelund@microchip.com,
	vladimir.oltean@nxp.com, UNGLinuxDriver@microchip.com,
	Thorsten.Kummermehr@microchip.com, Pier.Beruto@onsemi.com,
	Selvamani.Rajagopal@onsemi.com, Nicolas.Ferre@microchip.com,
	benjamin.bigler@bernformulastudent.ch
Subject: Re: [PATCH net-next v4 11/12] microchip: lan865x: add driver support
 for Microchip's LAN865X MAC-PHY
Message-ID: <Zi1pj28Eb57bByef@builder>
References: <20240418125648.372526-1-Parthiban.Veerasooran@microchip.com>
 <20240418125648.372526-12-Parthiban.Veerasooran@microchip.com>
 <Zi1PxgANUWh1S0sO@builder>
 <20240427-vaporizer-pencil-be6a25030f08@spud>
 <Zi1cbScrKzFN3PNT@builder>
 <20240427-attention-negate-a3b6ede708d7@spud>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240427-attention-negate-a3b6ede708d7@spud>

> I think the error pretty much is what it says it is, the driver doesn't
> appear to have a spi_device_id table containing lan8650. The name of
> the driver is lan685x which is used in the fallback clause in
> __spi_register_driver(), so it complains as it does not find lan8650 in
> either. If my understanding is correct, either a spi_device_id table is
> required or the driver needs a rename with s/x/0/.
> 

Right you are, no gdb necessary. With the caveat that I only get it
working when setting DRV_NAME to "lan8651", setting it to "lan8650"
still produces the log

R
