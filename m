Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873921;
	b=RPdfLAaLNJA23SSfTtQeSg1fqFlzxRh/G/kHfmUJIVgX/UniQBVzIMaQUuawXj0WCWfH
	 lHe0h/njxZQGLe7/FpffUijfhpQz+dqW0+iXcFpL9p6Z8cqwff836iTiJ0hoPbzTLI+5U
	 3/wxva730RCU/SbrBK352Ct6CrgdEV0OSriQfW7TkRoK1hv99cHRdqxx4Ao2kpb1bRvcG
	 TzpKDujBs25NswARsXXgRMAezR5EZaVUbG/coA8D+rQiJ6RqBCw/aEn5OCHg9EQnTMzE1
	 tXurxhjsEmyyQH7WOL+9ffbPUaBII4wwftslp9OaGFR6hmQuZ4ArwtWwd8eBm6ISg1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eMx+CTkXv1VoOtSvi+6D1nYsmWu0vpvPd8N8huVVt6c=;
	b=hKANz3Ut8fOh9QRrgzYeOhByO4ZqbdQRecwymqu7Y3QL4H+S1k6meOGyyhRaTM4JoEXW
	 /vpzcciWHL0P2WRFZsb2C5ib+/p9s5jXkHebde6ypU5gm2j9UT+ohFCeD0+0IzfndCM+v
	 7vLVsTl1nHf0NXUEjlWH+V8VljPr3SOrCLFqsUICwQSL+6E1RvIplV/X28dRpmOJUDwi5
	 BGdb/Xvq5pcoR24FqFu3YwhkQ/eNJzoUAANPrAnLQOoW9I8/sz+B1corXpW00tU6b0HoN
	 /UQvQyERA5IFZzYs8KZn6Ywt9dP/+DTeZFCy5CoNb7yP6Kwvw22OjWY6RbeukqxRSSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=o+1molFf;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2638A606A32C
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 00:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2638A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=o+1molFf
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-94937a33cfbso433827285a.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 16:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794873920; x=1795478720; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eMx+CTkXv1VoOtSvi+6D1nYsmWu0vpvPd8N8huVVt6c=;
        b=o+1molFffc9e6T9ddIDnNeseSjzEf2bQKujHs4vpOVw4OzSSGS4YQo8BJrSN9kd667
         k9JFBOotGGRYa0PkAFx2E0FiQp1pgsnwgn6pcnUL3Eya4+1ObVIZXwVWtTnGOXsLpAKM
         Qm4w4F5jBIoZdwaJAnrycuNhvr/nMKvlaRPWeoY+KemZwqtCHlIRV3pKlOZAan8ZiPyk
         dg+rWFVtziAEodqueYjujOY8FQIiLOIqi0nCOki4SNuEx/vo4myxz/px2YhfTxnQyYx8
         5SnT2fX1BMMsw9KBqqyDMrnK6kEETUe11lAAN+nPzvpxO9VlnJiaiLVZSGU+NSdcdbag
         q8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873920; x=1795478720;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMx+CTkXv1VoOtSvi+6D1nYsmWu0vpvPd8N8huVVt6c=;
        b=Kyb7ThRxyRT1Ru5Q3m4fj1c+oapD4NCEsa+3HD1JmyclX2Q0vk7eZgXGy9BkDLiznK
         mwbO04Qjdm4uR+YHxyRVM6A464ZjvrHNpHJzhCxjJpL11A80oWg7J4fjRfoxuUHeJtD/
         +Fmdbw3DCeKY4w5Tv40cyInEtVCsG1laEmK3fNOHRWqb6u0xF/nqtg0rS41Ft2iGxVho
         J3QQt/tpHUCFmcckEsa9nf5SJvC1CcSrLSda1S4kODzhZ0RB8Cot2giywfGvHj9ahM66
         fIYL1Glz3QoaIRt+HJbozZT1WkJ6yxmgbsu35fHX7o1Jqkxctb0yOQCr3s8vvNWt/+R2
         js1A==
X-Forwarded-Encrypted: i=1; AL+hErEDDXVuXXmRB+e8GAvlGWQCcfUYvKWJ020no+heT+6PD4wUhXdjDDrDN23YnAP2JnCCYYMhY2hutwo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8K/IIEOU5mLOo1E+nsWX3LT/IRVp1UmTG+IW2MOYOrL2D653Xd
	rvYG/S2Xf5E/Adt9lg+3nCcnYS/MnjDzB6qwsAbaCkaOFjp+jkcoyjaLymQnlIBYlz4=
X-Gm-Gg: AYBFou1DnJ9F0Ulc6Qi7uQcu0NNEnPo7ZxPiFQ7lqYQ3hdHar1n4fMP1wtFfb7NCnHL
	3gXFxv9dOPnGEXatmeNnCIXnp2O3j826BlToVwA+CjAPCuuToQ97IVUOKUc4GlUnfMcT/IbTmdW
	Z5CSbiFcXPlw9oWeqmd+XdxwUbgfTo52sc7y4oUo3gw/MXYbI09JglWRo6+BiR+RB3nRPEfTpYT
	BanjO1p+pddJMDVXo/GADB2RlsdWH2mv0BqIIZTjIoGqFKegXLsnMtoXrbxP8uW/z+9g7oXJpiY
	Q5MikhfkvqQqIU8bzuex+RlCW7K3KlBEQaYzTNyZPTTVdRzpX4s4gQfNAvqW8MCwXbZSuSIIS86
	+VVRKsClAYxxWlPD8EUnNX4m2j4QXeksv//AHL3M1oyKnFLZU7r3ldcRCxpELYPUrNmB3Qe8B4Q
	toThEqAAbwwdNQDLxcEA/gtapCs3tKw+pH7Mh4rgwXjnT+WzNLhBsu2YAoiifSAJp7LwggSTNmN
	ltduxEHNp3Jv9VUcJ3ZvQvjaA71kaOwEk5dgWGoo2L6k8cI8u61s9/MiOngnu1uDBZ2os1+w2Xd
	wk3iiQ==
X-Received: by 2002:a05:620a:aa0b:b0:949:7473:b1a5 with SMTP id af79cd13be357-9497473c077mr807892285a.55.1794873920005;
        Mon, 16 Nov 2026 16:05:20 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8b889csm969866585a.32.2026.11.16.16.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:05:10 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT6h7-0000000Apgy-1pGN;
	Mon, 16 Nov 2026 20:05:05 -0400
Date: Mon, 16 Nov 2026 20:05:05 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH v2 18/19] PCI: Replace untrusted state with device trust
Message-ID: <20261117000505.GA2488304@ziepe.ca>
References: <20261109-device-trust-core-v2-0-3b12d9a9f861@nvidia.com>
 <20261109-device-trust-core-v2-18-3b12d9a9f861@nvidia.com>
 <d0999161-3b27-4c3b-9d66-1d117c4836fd@arm.com>
 <20261110122237.GG8635@unreal>
 <b4c2538f-8021-4abc-be2e-fcd1596f84ca@arm.com>
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
In-Reply-To: <b4c2538f-8021-4abc-be2e-fcd1596f84ca@arm.com>

On Mon, Nov 16, 2026 at 05:13:59PM +0000, Robin Murphy wrote:
> Even with the slightly dubious argument that this series only intends to
> shuffle the existing PCI code around rather than fully introduce the generic
> abstraction that it claims to, if the PCI behaviour is still just based on
> propagating the internal "untrusted" flag plus the new global override, both
> of which *are* known at add_device time into the common trust state, then
> there seems little excuse for not doing that up-front so that the new API
> *can* just work as expected.

The desired iommu flow is to start out as blocking and create the
default domain only right before driver binding when we have the
correct trust level.

If we try to do that without this series then we have to do it all the
time, which I'm really scared will break some embedded thing that
expects scanout to work or something like that. My hope was this
becomes opt-in based on the new command line stuff in this series.

On the other hand this series works properly on systems without an
iommu, which is pretty much all CC VMs today.

There are probably around 15 series to complete all of this PCI device
attestation. Without everything it isn't really usable, IMHO. I'm not
that worried about the series ordering.
> > We have two levels: policy - that describes the default of all devices
> > for that bus. level - actual decision on how that device is going to be
> > operated.
> > 
> > "Disabled" prevents driver probing until the device is authorized,
> > "Adversary" permits probing and requests the available protections
> > for operating an untrusted device.
> > 
> > Both need conservative initial IOMMU setup: a disabled device may later
> > be authorized as adversary, and authorization does not rebuild its IOMMU
> > domain.
> 
> Urgh, I can be absolutely certain I'm not the only one who is going to be
> confused this way... I see "disabled" and instinctively take it to mean
> disabling the device_trust *mechanism*, as the logical thing that people
> will reach for in terms of "I don't care what this new thing is, just get it
> out of my way and let my drivers work like they always used to; I want to
> disable the new thing."

Maybe "isolated" is a better word?

Jason
