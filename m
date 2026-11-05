Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890796;
	b=T91SHAG4IpN0BBrGQo52AcsRTN9ETMnPK0HBUvRM2oSH1gwbaxkD1tx3S6y4WpV9azOq
	 D73BDAoqeopDJlcIcnVV2LPc4mmxkYzwEashMqwMHp1WAxsRtDGrjai+UZkx6bZMTb0ZZ
	 Bltctu0+SrirAFU2Z0hLdPdukp09M7W9/XW6UiNukKuYlRTaMhlKt1MlNbYMs9X98zQkd
	 ehUwZoEILcuK0D3e8L1oPRn4Qknfn3/23T+qfyKBWoknM2n67AXFRiOyswWfHyr6W+Pc4
	 QD+DmHpXtJLZeutPoXX/ySYFgnjygDvpTukHodSFGcNy50T2hc3vlnhB4HNwkk9te0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sv1GqJtGOVxD2bg62FKkDXwLV7ybcH0/LrV/szN48RM=;
	b=tQX+yedTKfTay7zZG3aZekHAJQn5FHd+xIbSEjId72jpkryeVPdRPgxdlIHRPgHIs6Uc
	 qpeqgLJA8j+2pHxFiRV2Nkig1gx1CZ9ZJ52SyShOuM5rnPysYWm/PoyshJx4prT6cg4B2
	 hVlL3MRfdbUMO/jDN3uQ44pcV8ZnfpZKJwt9mrskoriiNA0XM3+1PtKES4O83lt+dFRc8
	 m5g3pF55xkkFk3gsL5CmbA69s8n7qlJmiuSgvdval/FaBx/oRpHQ5GmgyOiSLAq/VuzMX
	 7LVJhDr/E2e7UE9VaSFi3OlqdgDAyO603L6RhXSoe+u9YWnJI4crBCzaegGix35gQPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bpBlGkKK;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09252606D809
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 14:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09252606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bpBlGkKK
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so745680e0c.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 06:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793890795; x=1794495595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sv1GqJtGOVxD2bg62FKkDXwLV7ybcH0/LrV/szN48RM=;
        b=bpBlGkKKYmX68RAsE9EkcMc+aPwep+Jt4D7c/OZg3kVQeHpZyfmkntRrTHho6EP8wd
         Ydil1svNY3g9CpIhj2GHYQ7d434gL/SpPpSr+DXV/upiAZMCvC9nreTgfts3zuhMwCcm
         Qskdy4s4owr7KaU/9VifToG4uoaZc2rkAAcVF19z0f6dAbM64dHUzvDPxywg/TCQt9WF
         2ooxRy05KElc/DdqHagH2RzabKyRAsKGjv0e7Kqhd2EeSxnmqf8lncs0n6nLDm8+XKat
         ++mZs0G+SfgC2WTprHf/u2SbYhDe7xP1yG7Q6zYRZWtdxX3hRx/GELgc/Kk/Jaz7fcIZ
         8CIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890795; x=1794495595;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sv1GqJtGOVxD2bg62FKkDXwLV7ybcH0/LrV/szN48RM=;
        b=zM/KvjkHc+JCf2dkmnQb/09QtCpea4ByH/RIMjLqDtVan64hmTPZsO+zQ8AsteREa1
         JRAwgvahQxUOFDyIXoXUBzLZTQXJcT/oTdOlBeb2OriTw7CtYv/fcq4GlSC3EeDm3Sa/
         94IKOMvfq6yKpTVp2bKGJCypi+JGgxukm+BAyRNV1sTH7ig2UsPjApJ7qEFIHDyN4G3f
         Abf3w71AMCFn7tThf1wSx4tYjrNCnhZGIVeikZgD/Xn7Bs+/1fuC6JZOchS3htYLcrwV
         NzckRhLtsZscJMVAY/4Ybu1OsXe8XOsjVTboMl2Y4aJv14zgkkfqFK3XELGGYML8wNUh
         jowA==
X-Forwarded-Encrypted: i=1; AKwUvBzNzA4CIrMJkeQ54+3ubsH5Qz19ntMc/7lPUuSJE4J66kkm5IfKt5zs2j/7VjTwSRGTBc49YBtB+og=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/ynVsiojCBXHM6A0ys95gYHfcSTbqhP5/PTLbvd25gUMgrkuy
	AdLOEqgZjpq/C6quzC8OUzXVyaG8HP1mS5dxgYbcahLek72f2g+2q6718KGp/9SxemE=
X-Gm-Gg: AYBFou2v32QbsonDY8ZdOnCG+Rge5zhy6k9T7cJWV2HLR4Mvneqm70HN7IYf4BphBKd
	UH7duZaKanYgs3X7liiRU9OyJVjNWMs/s3OJSw96EHmkHtFzsMdlfsT8t5MlbOjpNZyP1OoBb1y
	AxJAjJlTXSeSe7VQV3d3cwSLcnxmJXJka66ZnSBwGZDZcIkNlDnBVd09Vr9Pvf3FGRbvHP7DjJQ
	oLnckw9oN6PEzY+pBK1JVQf4YVbEO0ui4TkBZ4XbgHVPPp9MEN18fU8tWb1etVogAWe2D9ycvIl
	973Bxoczq6F12jJDfIR1nLlkz7q8mSN7yc9zIjJW+F7MGPdctxmBw9EDXr+FP8ge102JK0aFtpW
	zBdDz/ALIIyPZMRtU6GInMeIHmE9+hgJF9F3q/DDZCpJH+E+mNsoP9j4PLLX9POfefjO3/Otf9i
	GwYvdbTRAmacWW2yunCRRDN1qJPzkvoWVxYXoCJw8PjdyvXS5J+6Kfo/j+7widK95fTJygTTELz
	VeTDFwbLeRDsYZuhc6n7iYU4fJFtONPjzQJXPbVrenUoPcn9+iPU65Ej6CDLaQE/ITLHfFX4tXC
	ouGihNJrW5ikXTePr0g0uaJm4WVyEtPWNRplundGwf7vvfHDWgrMpSvJ4LZnXp+TslFVH38h1Bq
	fiErPBIyW3F0=
X-Received: by 2002:a05:6122:6c0a:b0:5d9:302a:8243 with SMTP id 71dfb90a1353d-5ecb429571cmr1423011e0c.12.1793890794801;
        Thu, 05 Nov 2026 06:59:54 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8df2a38sm4234612e0c.16.2026.11.05.06.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:59:53 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOywS-00000002o7b-2oaN;
	Thu, 05 Nov 2026 10:59:52 -0400
Date: Thu, 5 Nov 2026 10:59:52 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
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
Subject: Re: [PATCH 10/17] driver core: Expose device trust authorization
 through sysfs
Message-ID: <20261105145952.GA663069@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-10-1e536825b4eb@nvidia.com>
 <2026110514-bunkhouse-handset-6a3a@gregkh>
 <20261105132729.GB8298@unreal>
 <2026110535-engulf-precut-cf10@gregkh>
 <9d896ebb-6892-4cac-a7c5-41def47f0be0@arm.com>
 <54c9476c-9f76-4ea1-a73a-c9937d6b463c@lunn.ch>
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
In-Reply-To: <54c9476c-9f76-4ea1-a73a-c9937d6b463c@lunn.ch>

On Thu, Nov 05, 2026 at 03:43:53PM +0100, Andrew Lunn wrote:
> > Yup, and that's true even in the PCI TDISP case - there's a major amount of
> > "communication" and "configuration" involved in that. The principle which
> > should (hopefully) generalise is that a bus/host controller driver can
> > always interrogate its child device to perform whatever attestation and
> > general configuration is appropriate, but we won't hand off any _control_ of
> > that device to a specific device driver (nor enable potentially-impactful
> > bus-level features like DMA, interrupts, etc. if relevant) without the
> > requisite agreement between the bus code and the user.
> 
> Maybe it would be good to list subsystems which the bus driver can
> use, and cannot use.
> 
> You list interrupts as potentially being dangerous. What about reset
> controllers, GPIOs, regulators? At least in the embedded world, the
> bus driver might need to enable power, set a clock ticking, and take
> the device out of reset via a GPIO, before the device pops into
> existence and will enumerate on the bus.
>
> I don't see why interrupts are dangerous, which makes it hard for me
> to determine if GPIOs and clocks, and regulators are also dangerous?

IMHO we shouldn't try to over think this.

The overall point is to give the userspace a place to inject policy.

Bus drivers should try as hard as they can to contain their child
devices. Like PCIE should activate the iommu, disable ATS. USB should
limit the messages it exchanges, and so on.

When userspace accepts the bus driver it also accepts its containment
capability. So if it accepts one that uses gpio, etc then that's fine.

We are not the point of trying to describe what threat models various
kernel drivers can support. Userspace has to figure that out on their
own.

Jason
