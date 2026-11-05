Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896023;
	b=WohBG1ty7R4dYoVzVSveaobQrHppkmCdq2hr33TGDpKy+PQoJXBEw/F+nIlO7rlhboDp
	 suGQ/68+B15AeAEo04lW5lxaLiGYQUaazUE610PcnlgOUvJYQcxaH7445EoSPYM+L4G8G
	 2nPaxPjkFkMl26KEyLTNV/FvaXgH50msJMobFyPP8eQ91lw3qJc9nTlEpvZ1MDVIfavez
	 R1T1engHY2IfFC5tTklhd7OQudsx0j2atoYiHxGculH1cpy25/OO2B/zZ53pmRxntq/1W
	 jRF3/5oHNR1UVNgHgoN47cD24pwQ0D7MLzO+XpmeZklURSY3tIb7RSEo52qYSnmNC3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=auiIKhbmoRZT4mFY+NhWtro4ChWc0LCFT6CcONkj2hM=;
	b=A1GlO9ppRrIe9A87bCOvO3A6KMjkmxFn64yS2xAe3CSPaA0Zvh6uOvY0OI57xE1XXde2
	 KivJnRdtMppVtSxN++TwrDLKxZSdm/j3SvaW5wrUpLYZ7C8VylodqyGyZHZqS2jufG9Do
	 mPaFvXrdfpNUJ1XEO9NGpRRe6PBfQ5Eh4MDVyLgErGSNaCvFLpuyZu06A2SwpmoHnq4Ee
	 JW2ZIgQwoF16oSEVoEAkAh2eNP4gaUdyK7mSB9lHcPFMWMiD9/TwFDMEQrp8Dyj2Lb4D7
	 lW0hrpy0X5i+jcxr211T1gDMNtykBJud7RxxYrMk+3pLHUzCrwJZFOiW8XOAumOUuUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=TH080M2b;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD82606A32D
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 16:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DD82606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=TH080M2b
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7cc1cf48a39so727132137.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 08:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793896021; x=1794500821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=auiIKhbmoRZT4mFY+NhWtro4ChWc0LCFT6CcONkj2hM=;
        b=TH080M2b2W5GU83fC4bkAl8rc89cXnFJ2JUZ1DQM2E1G7nxV0uZ+iMHWJDX5M/hBR0
         v8Q4S1dZz9e+Wy709/pkQPJoJ382ui88GBuCa7YwB1Pwv+V08ySzbQGdCs4et9sFRxVX
         1a78LWa2r/qDmkC73yn92WJjnMydzWl2HaDmNekF7y5RHwsZB7YPGLTTr3xjjmuI4LbR
         sgpTrG1DSTm++FzIJZEq0knZSmQ9xxE9IezNyVfi/1ZtU95O+iPlQHI5LWAc3/YmXStT
         Vgy3IZE07Q/+XWoEa8k60w3BygO7yb8zhuyYBqBwOLPUaUevbalW8R2MAA5wjUpSFz6r
         zz0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896021; x=1794500821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auiIKhbmoRZT4mFY+NhWtro4ChWc0LCFT6CcONkj2hM=;
        b=gBrJMzaffVaT1I49GaRVdiLp3S+otsC6boTd5yxcFBo42I+X7aO1cz6w1LAVyNIINJ
         SSBAbb3qLcr+8SEDxjHS16ut/77ZVfE4/vohz/8QSMHxHH9jInBOSAfgRc5ktREE+9Qt
         qCxQAYRyand5hIfdOnSCsQsQyBtifXK2WWDsibmmH+P4qe0nF5nDo2sR4h/MXyYMOG/N
         H0EQxvfTThjwQOgXYkBuETBIknC2V6Ls4nsxd8hfvtVk/f/RUwb+iq09J5bAt04b43Rm
         lFR4jAoVtovVPbGI0J2lVsUemQTEpisk1B8SFkN1nbSM8uy4aUGtOdCQ8pb0PwzfK0ZZ
         3KsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCGBJqc0Lo5TStGED5yNRK2ePHyscWAwV7v1aAZ8kRBNmj8eDL7aGGX6LdjVLK6AVIKjXnk+43f48=@vger.kernel.org
X-Gm-Message-State: APuU4Z/djv8dOaRIG842lDKTCa98dMQEAz2EV8GI5sbFQC26YgBhl7O3
	iq3IiCRwtSaHsRm7JQ5pWnAxVgYLhThaJt/PFMl3hThIsPeW4fpsJcWEdLoqpPRlJak=
X-Gm-Gg: AYBFou2SXvHCHZdo/PwN6MqG6vUQGg1pmzoBsw1SzBNaUqhUjwpADTQeBXJzHezKyZG
	vhclV5uAgfcPMQ7U2lUbDBeZ8w8D/PaBNeSZcwwV8znnPqBQ9IJdhA0THua88hT2Mb6JSk0K6MR
	j07xWRHR8gEf8ARNtMsxLff46Uprf3c9OOoGHmprQCHr7s4/ntoVOlqv7FzzVTa934n+v8gzOKb
	DKdYMAl6pd6j1jKcDAOEZhysLTvofjxUh3uglCv59ZWcmSTTdh1r2w0KIBUhRBbenAYotZ135cv
	ZBpUCpZFtzPwMGOOKqHbaXPT275x1TGcIpy3/2IwlHULd+UvREogFmjJsOc8e7knlRvbKXqMYvt
	MNJXFgJWF4aZYT7ggEsZkGNHZP08ZRPB3+r4+GV8v1c8e5oMxTzcdWY7k8xsKnIW/niRguXcsWC
	bI/01fvv/aJ7D+xl4Vx8fOo7YKoaQK02FEZwj13YGMiZQaWWiNnh6anqyn2/weJXUoIOt4BtVHF
	I5kx2ASS6lY23rrnZh+vB+uBIh3XlhH85UPZ4/GHMW03OyiQ1M/SXX1+tNBAeGyz/+vu0o6Djq7
	dtOe01KBI0moKASYrlT6ooH65ldV0HvxwAdBbWpGPkG3xr+ZM0fZ2Kgf3pLFYSw+wbe/zx61kA7
	xQcnTwGqRBqtR50fWUkMXp33shgWRq3c=
X-Received: by 2002:a05:6102:3f9f:b0:7cc:174b:f7bc with SMTP id ada2fe7eead31-7d2a15715c3mr29296137.15.1793896021174;
        Thu, 05 Nov 2026 08:27:01 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fef4ed3sm4667110137.11.2026.11.05.08.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:27:00 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xP0Il-000000032XP-37xT;
	Thu, 05 Nov 2026 12:26:59 -0400
Date: Thu, 5 Nov 2026 12:26:59 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Johan Hovold <johan@kernel.org>, Eric Dumazet <edumazet@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	linux-input@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH 17/17] PCI: Replace untrusted state with device trust
Message-ID: <20261105162659.GB663069@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-17-1e536825b4eb@nvidia.com>
 <2026110526-aerobics-correct-4c06@gregkh>
 <20261105131856.GA8298@unreal>
 <20261105140352.GF3889730@ziepe.ca>
 <2026110558-tartar-juicy-036a@gregkh>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026110558-tartar-juicy-036a@gregkh>

On Thu, Nov 05, 2026 at 10:43:00AM -0500, Greg Kroah-Hartman wrote:

> > But I supposed Greg is asking about /sys/bus/usb/devices/DEVICE/authorized ..
> 
> Yes, that is exactly what I am asking about.

It looks like that does the same basic idea of delaying driver binding
that this series does. Hopefully Leon can harmonize it to use the
shared trust level flag instead of a usb specific flag and retain all
the uABI around it.

But, even with this v1 the user can choose to use the generic trust
level and ignore the USB specific authorized and get the same
functional outcome.

> And I know there are other types of devices that will want to use this
> type of thing (i.e. SPDM seems to be spreading to other new bus types),
> so it's good to have and get right.

Yes, we are investing alot of time right now in trying to get SPDM
uAPI right when we bring the general framework into the
kernel. Everyone needing SPDM should be able to re-use it.

Jason
