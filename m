Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859754;
	b=yDuBpJ24PIMwjO4WEJXHbo2pWZpbs2OAK8EpP2Fok2grkgsL/pcwXebVXWu4KRqEPhvF
	 1F0YLLKSjRk7cMNCZiZf56iz+03esLJwl3pFHDWnFNCnznw4N0VWJCzBI5Cr/thzT7Gm3
	 DYy6Vg5x4cEXfTl39Qbdh3XXAHgOSAcDj4PMMOB+uO/DkVkj8iFbN4utKYG6AZHqrvo4/
	 0wdDAQJZ1knmbgl+dHtbTBR8i0BUavsLiYh0LNalBZTyLfFfHuJtVE7QByLw3jlTHGbkL
	 zEZR6fW1qS/b5l5yBqxuGigF90S1RltThnvlVQCIagoXiCOVQ6Ho1PVf/8Qm9/6z7VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rIDjnnpHadC4roO6Pjzwfgg43uG+Y6jCh2hpR36q9WA=;
	b=p6EUQJyCDTsH8QExtJ3fzCdOdN8bGrU4PqujPtq4dHe/VG2PLTsbXIBfOOXQ4eGQP+cV
	 5icID+iuOCBiMl4AdfafTxIf0ShZS0z/apr7zMOoL808vLNSS/8YM5zzKZtVLp1Ef7/qq
	 nbAvVLgmW15IxQTEcHQfHQ/JodNGD+97zwdRB6ahqOZ1jea8mO7sdbA4GR7MWo79LBOgO
	 1RM+97HZBfFPDIxX6qGuOs2ibl74Lv+99K5UtTcWWpptIQqvtAWYamc1lrSe73iCoDPd4
	 BvyXjS5O3Iq6oxwBhZv5XPKof/y7idjRLpAuIKh/A5UfSKHkF1GhAEGJ98KhgSBDPNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nbZUyxTk;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5188F606A332
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 20:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5188F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nbZUyxTk
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5366ae57896so46203681cf.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 12:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794859753; x=1795464553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rIDjnnpHadC4roO6Pjzwfgg43uG+Y6jCh2hpR36q9WA=;
        b=nbZUyxTk1xDDi9/JiN9In9kNH24m3xvR3W8MPaMB063K/nb6P74sDih4ebpP83k2np
         SjqTAYuPLCHW+FRVrjLKSTbDX5aM/IVbZZxu+ASYJ/ssH0gDFbMJvSJmLcdHAAsDSEL+
         FG47SOuU8PRulqvpOebFRdp+iKyncNtYeoKxWrzhMSjcb9i+1jD4cThvDUO+7PnMd3zc
         ImV7NXhI8pI4k1LW/eM2oLltJhXP6hUveoFekGEVH6+oWgooyZkYdcVCIAs0jW9hoXxW
         5IGbSHDAmwoeFMTug5VO+bv+VKknP1f2hoIrUsvWYeNqALAO8eTePO8ZOjSwRNnR3p0b
         L2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859753; x=1795464553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rIDjnnpHadC4roO6Pjzwfgg43uG+Y6jCh2hpR36q9WA=;
        b=PzYocFhTwuL/372v3QNyQuIizqiRe4+0ZoURBDowQt/nunv00d8JIRjIXRE/vPt0Lv
         wonloch2SzvPN66sqAxPZZSw0t2EXv4qLQn+oy8UUICtiIKdPFIL17SLBHde4P3QJil6
         0GzA+QEidFlF4RKVPJGXBis/BIMsjIJIayEqQ1GwhFCy7HPt9/AFMfAILKOuHQab+5iW
         Ygo0Jgf7kIFL7PFkam6Qv8j/zAIGdxgEd9r07GCGvY37r6XQmrtyjUzDUWjMsHkXfHuE
         PRsHAtnoH52ztgx8bBvaQmYa7V7oiJEF63rov9jz/VjrPTDaYxdKOX8A5ZRKuzehY1oP
         gyNw==
X-Forwarded-Encrypted: i=1; AL+hErGn71bgMFzEGnCu3bUGW3GwpgakpMzcf4Ig/hFHM4oCaqOwFfhirUR5786W4dG7HXa4DU3la7wxMRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oGP6zwlJdyLR3mAiC+qNPv1D9gtSmG9xWKZhJErq5O0HI77mW
	sv1o1Mw5CN2/CJ9536Iz8CGlyWgKV+WR9aKgYPf5ytpZG6DmwMI+zrwtQbTsc9nYv+Q=
X-Gm-Gg: AYBFou3yLN9z4Ynd9kBk3OkQaR5J+z5mBJTUiVoiYswZcn9aHEbiIck8v+47Phgu9tP
	vm8T+Q2/IEV+s67RgPfHdplVHIY4afUt4PxU8KKC9kHWyz1e7gwSgHDl7Aaz+a9M7IYjblV85ww
	Rz6EvujNpTc8DLR10JPTuAI3KVtN8wL/A4VL0TVHDb8sH+XoTeoP0hfPcj7PXoUHgjCJfW5BxrW
	fkwRuBJP+Fg8dkbWhUmZvmnZDoJN0nK9b6NUqWgAZ+SjvZr9JhnWFhFlUxF6AZoluXmLItQUOiI
	F66PcC3jQs/Auudg7xusFRrQki4XsdDHCs+osirofMxxfUGuzFoIw4al0AVtf9kDancfNp/2LnL
	nVriLpTMxNzvGjjTi6Nfh0HeGugKPESKJt4EoLjo2GydTSccaNZBBf4TpD6M6Yja+42sGtBXSUq
	DUJ6D+hS0UEdjRtZX+xbwcITgsNZAqGRmgdAn+QJQMMMsnom6CDGXAVOZy7HQT6R7MnxSQ6HKn1
	KsWSSBpaorVTJvR80qtLDQ/g7kvEfeqOcnF+Oc6/bn62Dv/x9VltCCRhknbrjREsz6Pg4wtqrnx
	+eq0cQ==
X-Received: by 2002:a05:622a:5144:b0:536:98da:f790 with SMTP id d75a77b69052e-55ac43909femr187873791cf.6.1794859753196;
        Mon, 16 Nov 2026 12:09:13 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d445d1sm92856046d6.8.2026.11.16.12.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:09:12 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT30p-0000000ANtb-30lh;
	Mon, 16 Nov 2026 16:09:11 -0400
Date: Mon, 16 Nov 2026 16:09:11 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kameron Carr <kameroncarr@linux.microsoft.com>
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
Subject: Re: [PATCH v2 18/19] PCI: Replace untrusted state with device trust
Message-ID: <20261116200911.GA2473219@ziepe.ca>
References: <20261109-device-trust-core-v2-0-3b12d9a9f861@nvidia.com>
 <20261109-device-trust-core-v2-18-3b12d9a9f861@nvidia.com>
 <193e4130-9c2f-4a0f-b218-f5fcf0b3d508@linux.microsoft.com>
 <20261116190417.GD2299285@ziepe.ca>
 <2965c691-82fc-49f3-abdb-383860f6e82f@linux.microsoft.com>
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
In-Reply-To: <2965c691-82fc-49f3-abdb-383860f6e82f@linux.microsoft.com>

On Mon, Nov 16, 2026 at 11:24:17AM -0800, Kameron Carr wrote:
> >> My scenario is pci-hyperv in a confidential VM with a paravisor. The
> >> paravisor is inside the guest's trust boundary and owns TDISP. It locks,
> >> attests and accepts the device, then answers a VMBus query describing
> >> which BAR ranges are private and whether the device's DMA may target
> >> private memory. Before a driver can bind pci-hyperv has to:
> > 
> > Sounds like a user in such an environment just wouldn't use the trust
> > level mechanism at all.
> > 
> > What use do you see for enabling trust level but having all the
> > devices unattestable and accepted already?
> 
> Previous iterations of device trust used the trust level to make
> decisions around DMA bounce buffering, etc. Is that no longer the
> case?

It is not, this is now just about userspace attestation really.

> I am looking for good hook candidates. I was hoping that trust levels
> would end up directing DMA behavior, etc. but maybe I am
> misunderstanding the design direction for these trust levels.

I don't know, I broadly expect some flag in the struct device to
indicate that it can access private memory, but how and when hyper-v
could get involved to set that flag I don't know.

Jason
