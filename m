Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844785;
	b=aTE3ufaFls8kBXVpuCgGWxC4eIq/uMuMcltlPduhoLkO50ebeWKoUrQjvoK+2M3gygSo
	 5f8Yw+bYTVOjtyE82QPZ4oTBGez1WjbsaJ3ZvnQdwhFwer2KxGVG1iBTWvvE7yQrtqGuW
	 kyAQWzU/YgoTny1o8qovEWzKVRnrOc+QXGpXL2B2EMPAR65OaBpaWHVcPugDZBerHOTRu
	 jU7cBqvk7JNsOYn3Rm0ZUFTiICQY+g1cQhgPAZF+kuEoQzBwex8x/ttPWYbEHeV7WVBJ6
	 Sg94ANRUtkvv7+WUN27Ir4CC6VvqVZ1lodvfCUuBRZNef1lmKzMd+vsPUK7w5rIIAdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8zt6BKnr5OMQnoN+jLF5J5ZxUIjEZ6DGHzLguvsf5vs=;
	b=ORBC4Nz6w/okyCVGb3aqtUJjB8H2vv6psraqZvBHauP5/U0udlsjRCYmfebWM0ZCXxEx
	 KzU5EWRRTDlp2kK5k84ZFn/Avfq9sCaYE8DjW4CeUWvxpvGh0vJMrpR26i2DDqAKPNKE2
	 y+v+cyj26ieaBlp8DcsR+9qn8c5kcieNIYHXMm9tYEuCD1iNWhUzLu2QdiHPflHFNY3hU
	 BbEKnCnHyZC7WPSQ5ZJi4XPdnchEtgC/1qsGOQI09+EsbLCFIFyGWwWKCYj4C8SFYXYMz
	 WM4dSxDl0IKt0cQ6F5i5wS1t7TDkZDeZfONxPrRgiTTf1xqDW7n7AbdMl+tmjObG73g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="T4EaFVj/";
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0538D606A32C
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 15:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0538D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=T4EaFVj/
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91ea16d8072so36765166d6.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 07:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794844784; x=1795449584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8zt6BKnr5OMQnoN+jLF5J5ZxUIjEZ6DGHzLguvsf5vs=;
        b=T4EaFVj/Db2Oh0QQIN6fEsneaLWasSmYdaomNevHcWQV9XfC0eku9uiWRA8yiTc/gq
         beN2zhlEBUDpPwvlJXNnJXYG7SLeGP2RUl/CIxz8vHb+CRPGvwOGP84P37zc/ASqwdCv
         a2ZImH/j9PEIljcRTrH9YjQx1m9XzvHX9w4v1GGAYhpr16oDLUf0JwGEJPe+tOCosZjE
         d53ULE5uBklWCIuWvycUfx9hIvJ8w6anXEcNacgC3MbLl4k/Apkhq6kLpk0rmKpAkcTv
         Trqjo9GQ8ASe6EH/m27mrq6sK/GeD3Uc4wVkpatMXBaBSojYeEkRpq+DgrGx3awVmJv/
         hg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844784; x=1795449584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8zt6BKnr5OMQnoN+jLF5J5ZxUIjEZ6DGHzLguvsf5vs=;
        b=2qZvrEdcYd9Owgvhfauq3YEfr1MB4oaIiTAyOiYwqJsjeFeKd3zP7fiAX6Qa+5iV6F
         pBEHSiQYiORVAnd7+XC6gUuEkrOUlLeq75dvWx/RXBYrjMgO/gv8b2nq3SwBFmAlqYMt
         M0hhc5WD8qBAP8+V+1fOmM+bbgkEOBoUAZAOB4yl1IrzB5k7dwRaQsmqlg05g+BGPzbK
         voL7C0oUTpvW8woul2oi3cPNrHOok7d7DHw8rIPOku7RAU3vioV2uFMSNupqgQnFR2Ye
         HDfaokzoBtzqQ45InYaP4WDffENPzrGEuvebBlIAFO6sPDVPpkbkmjvEhLqT6yFNs5Qu
         +PLg==
X-Forwarded-Encrypted: i=1; AL+hErE8UJI7u0ERxuI2V8HXXa6gnvjfcFlAwF61bFloOtCRBTfAkEhxWSkJUSEpBsXUuRi7BDl+EUXA9yY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+K3rNU3Zvw86aYzqNHcj2dMdo5PKgVIBbS4W1AWnjNeli6mvak
	RVPo866nYimOP7BRDLDnHZKN1NI3gT1pgZVkUlozEemTZ9T9wIfKv/4mfbEz9sUHQAM=
X-Gm-Gg: AZFdTZconsgZ1Sj5S6JYR+5s5RBVMGY8lzQfwDv7BjBBMj12epE/Or0Z+eLRv2LQWqx
	usCWX1VfRBKZzBmexvzCs2n0ybICRP39yjqDrOjfOjyJmfcb0DVFeGSAzbeYNv3isEVu8gLesY8
	4Hppa4lGzIBj9GNcvFJOIXqxeT/D3IK9gIUN0IO2tIFQ5rUgm+kvljRJx2C1+YBiY39gAkQ7NZI
	cIqYJLPbIc/+VdScJQh4bX9g93niav5KAUEPSXBgdPz4XZ2nPBChST1vRjzxXsIu7cwzyb6u5B7
	z4ogevfGAU3AVEfzWU2oBnEVcejLgGk+sSYt7eu2evze60SnLS+IIayiVZUPgX3YYG79e4UlWWH
	Eudy9S+xlnp0nHkLsP2wi1qzF133LUriEhj1hz73A7prAQYo+sErSto5f0X+UrFF9pSFhMAx8Vn
	2JlGynygh/kSttRV8MTWx+Nspkf040rRKpj+9BkEfAqa52Lk3JJ/+9eqnPlHYInEkQnjl8zre3y
	GfAq+dTy5WPHRTMBgXEtY7MWhw7LOxtasdEn8nxBRxvUsThKsBm82Etyl4JHgZnwLWSAvtHeBDA
	430w9Q==
X-Received: by 2002:a05:6214:2467:b0:91c:7f1f:2c9e with SMTP id 6a1803df08f44-91f24209db6mr171122396d6.55.1794844783992;
        Mon, 16 Nov 2026 07:59:43 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d93f10sm87735096d6.30.2026.11.16.07.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:59:43 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xSz7O-00000009eOI-3Mx3;
	Mon, 16 Nov 2026 11:59:42 -0400
Date: Mon, 16 Nov 2026 11:59:42 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
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
Message-ID: <20261116155942.GA2299285@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-17-1e536825b4eb@nvidia.com>
 <yq5amrr8yldi.fsf@kernel.org>
 <20261116132046.GI2532299@ziepe.ca>
 <yq5aa4n8ydsk.fsf@kernel.org>
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
In-Reply-To: <yq5aa4n8ydsk.fsf@kernel.org>

On Mon, Nov 16, 2026 at 09:22:11PM +0530, Aneesh Kumar K.V wrote:
> > Once you turn on TDISP you effectively activate DMA, just like turning
> > on the IOMMU.
> 
> We considered two options for doing this:
> 
> 1. Via the ->accept() callback in pci_tsm_ops.
> 2. Via pci_dma_configure(), based on a combination of device trust and device acceptance.
> 
> If I understand correctly, you are suggesting that we stick with the
> former?

It should still be done in #2, just with nothing to do with device
trust.

You can't run a TDISP run device at all if DMA_ENABLE is not done,
there is no half step here so it has nothing to do with device trust.

Jason
