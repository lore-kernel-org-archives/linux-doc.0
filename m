Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898126;
	b=DdEL3pSxuaJ+ktk+ly7YipXV6h9lbmX1oQnFV6zrYzj5ZeVTr6rmqDJOWAHxgEuCrzBl
	 wjOik8RjE+rxeqkGmwU2ViMkGzS3DFuN6gNViw+Y6io91aH0I18lTtRgoMuyMUJ0pAiOL
	 VvLTeSeZrYAA8wf/CWB0eQ8uOh2jF1SYoQkHB9qlzR2kAyMlRt6FEw1tPpM02beSUsOhW
	 3hFw3aAcLWOUGxzLscBrR1or5mQ0IaU2Kg4akXM2GNOJWaJYGwzUd5h8FDfGaffNlHHBR
	 QrKUzjeKJzQm7gSDQAaYWkKQheTFr4UKsHWhlTYk+vn94YdKWr2y2wokwOz5C35Yhsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=E1zVtHMFtNJFSrWULrvIbtVVqDsU9/hCEAvj/Fm4m+Y=;
	b=K///6haVTn5uoFK2DN2zdNJCPkyeeoMmfFB3VV+zG4nx+okuM163V+RGO2oqHsdZgnpy
	 29TgL0N077PP3/XZtqsqihfjPGVr0OXWf5zYEAL88ROWrYdqTl72j7WB8jyV1iIdATIAe
	 5XzdvmaITTbppcQJ2EGc1gk28uEowP7eGbqeXG8fwRHLLNWIQFdy88IzvaCI74o4t+Gf9
	 G4liwMAk9HCg4LCX+dj5xd+bYFzSzw7X0wRCUvhujIm0ti+zN5emxvotsiPCnc5MWRCnt
	 E6v4NHDgtQaaf5jGc87qarVplL7LGslea9l1qIHALZ6+JNPiHdb2SPsN9/3Qw81/UKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="UT/D8aSt";
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EC3606A332
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 17:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11EC3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=UT/D8aSt
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7a6e560f580so1443724137.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 09:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793898125; x=1794502925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E1zVtHMFtNJFSrWULrvIbtVVqDsU9/hCEAvj/Fm4m+Y=;
        b=UT/D8aStYb7dPEp/Z1PTR1znD76pBm0Z1nPlORuFlgDbzwSX/aHEaMIKgxREgduhMs
         7b184i+9WuyWU3kP4ECdvxL5tqJCBp+sE58xftFr07RVMuYSe2D0AHX1L8wkHJuC4lcP
         6d7IEtulMVc64pTkfBc/dFTnsuyCXdHVpF//V/K2Xgp9mPmSNI4/p7tLi2H5V42yljeY
         GtO1ChQ2JjqDeaKC4B9biWxL+z3aUuPX/f+FWBrD4U/FW4Q80YjAWhMK/Up13oskn2O3
         3V6ObKXKjzYpPS1tL8mHYVexmV3sD/kfJUj7ToJWfvaytzTBimAL6fO0bssiuf+AQf9l
         4B+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898125; x=1794502925;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1zVtHMFtNJFSrWULrvIbtVVqDsU9/hCEAvj/Fm4m+Y=;
        b=I21EJgoxj48SfiuyT/ZbqHLNmagKHWfc7bKOEzkXgldUScHZ3DeRpKYYVkLs+3VRjJ
         +QybDhCJaFnntybiBmeAxR3c+GBT6wfWUpD39ifvnsPMBPRAisb/pBqrW0NTJq2evxQS
         mzbLkx5qk+Nc2+qESp0/yEhVkNNS0yan7ClddtPEAUMEaffb5GMKUUopJKTuYmhlFfBy
         bR9shUWY7Gan9LcO3JVxWHrkB8j1HP/uPIvj8w10LyLSy3oXaa0s0RdhSmDISNaAJbZ0
         kFOp2N1S4C4KKdqg3RuxR+OjXiUoqmTSme2wwRX96mBvWamiRLTSF+bqBAH4VSsarbTF
         /V2g==
X-Forwarded-Encrypted: i=1; AKwUvByi0UIJ8upwc5pRLNo7PLCGmCBwleTFIb5Ccup99crf5TBjr3oKiPCl+RX+eGLJ5hBy+yIRlbWdcQQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bl8F5iMrUqvkZde2EhSCpRcVngzFQjI+OGgEV0jtMdbdy8SJt
	9aoP0SYXP+RB0ux3ScTSOdI1++N3Z3/zz6zbO9ty1jrnC2bn7LuxgIn/3jwxHyZl2Rk=
X-Gm-Gg: AYBFou3kVv9wqveY9x9mMiPEWAlaRBTJYbKe2w02l1tvWUtH5p0yh4Ea6sS/53ddy9Q
	TrHB4RKjToHmHaZs/HbOIQBIhCtUVPHqqKlGbgy3s2yoLaNZ3PzD9+KsRAh2vNWfPrTIHwMkrVb
	hSZ4YHHopa6suXRLN7+F4JioorrvnTzOC9GfWEAs5NSUNdWD7dZ2uDlWi8qWLLTiAM3NgVpw8oC
	Hh7wmfpipeA+GmWLS7je0lxZW0pwxL6aIcTwus1U6pp3688NdTGXpkWz4CH7Z+VOb6SSGT1X3AR
	nbSREq8kjcLrEQMVivj+PfFESHD+1/YRAhXGPf0p1zlvqvzXtNhoqJbOCdr0B3uIh9TFmhtF+Uu
	xnqcTQlegBOK2veFXrwXjFQPXSJNrD5v47ZtPedaDoPrgVjt4aPfKiuVRIaQoPm8w6NTQzkwhuh
	8SJ1KjD+o8nBIT7DLAElGTxstW8k4NuIrGmucN4/+JztjC8TfcSwHOGf4EvbPKly8iE9Giwa953
	IcDnVcoYdRwm17f+5GabGNR1OgSE8Lu/KgxNEOyJC3Ue2auzogBsODfP5/XEA/U+yzP/TK4KsKn
	3q8N0mIEhTzNn+utUKNw2pxuVItg2aJyNs7PtJRGxePTjiyw47/ndqRw4gc7WOQLTZODDmH+S54
	isSFTg8XMw5s35hbM4AudEpEJ6hLw05M=
X-Received: by 2002:a05:6102:2c1b:b0:7cc:2bb7:1335 with SMTP id ada2fe7eead31-7d2a16c7f35mr120203137.33.1793898124846;
        Thu, 05 Nov 2026 09:02:04 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fd3e101sm4619225137.3.2026.11.05.09.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:02:04 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xP0qh-0000000388I-28Zd;
	Thu, 05 Nov 2026 13:02:03 -0400
Date: Thu, 5 Nov 2026 13:02:03 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH 10/17] driver core: Expose device trust authorization
 through sysfs
Message-ID: <20261105170203.GC663069@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-10-1e536825b4eb@nvidia.com>
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
In-Reply-To: <20261105-device-trust-core-v1-10-1e536825b4eb@nvidia.com>

On Thu, Nov 05, 2026 at 01:42:23PM +0200, Leon Romanovsky wrote:
> +		(RW) The requested trust policy for the device. The initial
> +		value may be selected by the bus before the device is
> +		registered; otherwise it is "default". The policy is resolved
> +		to an active trust level before the device is probed.
> +
> +		The values are "default", "disabled", "adversary", and
> +		"full". "default" lets the bus select the active trust level.
> +		"disabled" prevents a functional driver from binding.

For making this more general:

"disabled" prevents a driver from binding and informs the kernel to
provide containment of the device. For example a PCIe device should be
unable to DMA to memory.

> +		"adversary" requests operation with the restrictions that the
> +		bus and DMA layers can enforce for a potentially malicious
> +		device; it does not isolate DMA by itself. "full" requests
> +		normal operation.


"adversary" informs the kernel that the userspace wants to opt into
any security defenses the kernel may have to restrict and further
validate interactions with the device. This may have a performance or
functional cost compared to "full". As an example the DMA API and
IOMMU layers will avoid exposing unrelated nearby memory to the device
during DMA.

> +		Successful resolution to an allowed level commits policy
> +		and operating level before driver or DMA setup. Both remain

"before driver startup"

> +		fixed for the device object's lifetime, including through
> +		failed or deferred probes, unbind, reset, and driver reload.
> +		Later binds must resolve to the same level, including when
> +		the policy is "default". A resolver error or disabled result
> +		before commitment leaves the policy's writability unchanged.

Not sure what "resolver error" is.

Jason
