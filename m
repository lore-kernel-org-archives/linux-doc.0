Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4DF33A03A
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 03:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780888161; cv=none; b=NC9CvbY9CzJxXdq/4UTOCyt6f/EN0yxTvD7VaToZfAaymLg53VQ6eRDPyQ6w1XKVQvI0tGGd3dPujRqaa1z2C9+CjHXjyLH59AkjYXk80Bx8/7eO6d+UybN05sIg/tIo7upV2ni+8R04NBlHY8LIKUEHSzbpLxD6Pk05qBgRXEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780888161; c=relaxed/simple;
	bh=kGkWt6C5ycyjEXTsn2oV6cHKOg6pKviV0NC46vzMPWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPwH72dvbSR7+anpZ4Yf7s/eQICucsaoK9h/HjqMXMcn28Hc+DvWFNuecFKhVqkCkleMsAmabzOUqHgv6gjwtnk1DSCzXPy9T/gNagKsLLYir5DSRpFQpEc9vDnyY0mJdiWvwe7/t0P/IZo8OARvNXT64U4gEQzecpl/oPgFkQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=er46dHqc; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="er46dHqc"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36bcbd7821fso1458081a91.2
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 20:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780888160; x=1781492960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bnSxX6NnlVP9TffY8s3zLGx9ESRaKOyzgVhLAZp1f+8=;
        b=er46dHqcA0duUz4iMNw27XOsxjmWyA1B5pSMoaAIzmvFtDmVBXF9QpdoPvpeSCHAcB
         7/9oj/EC6m0KKL6e0DULafXDERbrsxenFnBb7dApXgG/R11ceeVEZKzh54brJXicCFSC
         5YWQEUKIWIBwq8Hn+lgcFx67Aac5Lzsqpn2kTpyDTafzl02OusDIQFr9A6slLFjba1u5
         Akq6E1H0DliXhpU+GgrTKSOaIl3mx4YBti7DQatVYRh7DMeInjj31TAE8gqlOIj1v3b9
         YmjlijND3HKw1ysYGvAaNFIkc4vgdV64X50RJRegdg7Z6Km/LKa8ZN9Tm736lreA+ugC
         BjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780888160; x=1781492960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bnSxX6NnlVP9TffY8s3zLGx9ESRaKOyzgVhLAZp1f+8=;
        b=rZWeqSLriSTXtvQgKf6wSbaJHXbcT2iReScELJvNWBajp1fw7vmjNUY7+GGn8KIw47
         fj85oIwEQAjH2YqUNSVz8QImcB+XtIfnMvJ5hQGIrIQ+JCpFtEOKnsmbitutdxhs8g+I
         3QH3YlWINjsQKkFnyhtDkesABn6teeJnlVEE6N6pOa8WPsMJPVitnHeBxTtnpFTSigq0
         yYoF6l5Q9Mbs1TT+W6wd676TcHzez4loo35+JgemYcfNsumD1DnuICgzQDvTLLkkxhCn
         8743yDFJbSvt9SUawGHHe3nls7jUJJVGZ7VMwlUQP5IwYshFvKPAemIbhX1nQ/m3h2PJ
         yChA==
X-Forwarded-Encrypted: i=1; AFNElJ9LJ7NST/ZOukmP7GQQo5bVzP73uQhtoI9dMISPtVVgkuHSw+XCBFxtT5lhc+dLO7Hq+iJh3hopDLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOJcYvwYFf0E2izv/CF2LO2bB8RNAefnvi5E+EhUElodJ+qta6
	SMeJgBWHiqr1MLIkutYZmotKUfZUern50s5LlXnV9xg11q7lZJDi16++
X-Gm-Gg: Acq92OEMlJxSFI75TtA7wdNQwfnqYKxmGQGsJhfDWvtS+oBJFyIonqtdmI4T8tCufJm
	y9R6qydSdq78eA6h1JLce12WS1MADi0YZPCRuZmNI4WGS7NmWVKvHo1oCeXUqiHbv868r4jSWzC
	1+431HknvlhLIc77dxK7yGYjC1SBZ+pXQdoNrGFyLFO7f+YO3857O2pXtvXTuAssX1V4sPoKXqY
	hW1Qyk9ahGdaUmF2+kQgCTa/S0bHTmoeomuIHI+9nswFX+FotwuSpD7ozc2rM3wwANMD65F30z5
	Y0uYBnNqS+acJc6z9IMkXV8SmkpaMrrWr+XXRfvwtAgyHUICtRWzGKhSll0yu5rxk5NH9ULAjYs
	O1scCpkoywJepwS64Y60y3guMVBy9kqOxoQuC6ku/2LlMXfv99R2vTj294fDyHsd+H5hZfVHS9F
	r9FqO7YsOEtziYb+7xeacT/15Nfs6P/wqF5z1n6dxoeuLd7p0=
X-Received: by 2002:a17:90b:57c4:b0:35f:b647:d98a with SMTP id 98e67ed59e1d1-370ee64373dmr14132310a91.5.1780888159963;
        Sun, 07 Jun 2026 20:09:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a29cd6sm13867998a91.11.2026.06.07.20.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 20:09:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 7 Jun 2026 20:09:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"noname.nuno@gmail.com" <noname.nuno@gmail.com>,
	"Syed, Arif" <arif.syed@hpe.com>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v4 2/2] hwmon: (pmbus/max20860a) Add driver for Analog
 Devices MAX20860A
Message-ID: <8559cc71-ad0d-4b76-b562-67dd3d7a4ca8@roeck-us.net>
References: <20260601184516.919488-1-sanman.pradhan@hpe.com>
 <20260601184516.919488-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601184516.919488-3-sanman.pradhan@hpe.com>

On Mon, Jun 01, 2026 at 06:45:36PM +0000, Pradhan, Sanman wrote:
> From: Syed Arif <arif.syed@hpe.com>
> 
> Add a PMBus driver for the Analog Devices MAX20860A step-down DC-DC
> switching regulator. The MAX20860A provides monitoring of input/output
> voltage, output current, and temperature via the PMBus interface using
> linear data format. Optional regulator support is available via
> CONFIG_SENSORS_MAX20860A_REGULATOR.
> 
> Signed-off-by: Syed Arif <arif.syed@hpe.com>
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
