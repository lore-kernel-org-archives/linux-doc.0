Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840359;
	b=Sn9SG2io06Fz6rny0PPawJ7YndpO5VSaGYqN5sOXqbK/jezuYjVt5TJ60Hinx42JjHIE
	 c3qdw51sCFGwv7WSu+m2eVENfUa3VunyJuBPdkWjL1BK9ZgElkSujaNhVKjNVIxcLt7+w
	 /srOqBHxHZzi2UcaVZVzjZ9dWjQmQo8xXsKrjSzUTeN+0PUsU6xqIqsZ5mwACmUldkQTP
	 cN3Hi77PePBwVcmnSV3GAfBakx8dwa0DRJHBMY1OjOEP4MJx0dXAwiClX+csGUR1E54FO
	 Am8ydYzehMtsYArwdWYOZ2rmFC7xK9LoKIc28fEkLzalPCKMUhZspzhBU+j+pQI22vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9cuLg5FPbuoxv94oaCvgpjnZpkxbSwN3Cw2dU0btsKg=;
	b=moVbNF18q1EiCZyrM0rO0a8ML8KUPVqr0rOgHAj3tdNV1WEeY4fInuelRMg2/LaN8lG2
	 SePhnE8EvYrbyfN8FOWUS18htpEJ8wOR07nCjazCBQwPpn03ETDtU3Cmqo70zdv7tThku
	 ciJ+g8kw28vfdzSX27JlmiUJibfaeFsueqCfXZEBVtN9nWN9rwpimQf5eE/rGJkwusBcc
	 qEaxSOrpKgykFsX/OdL+cw4m/6XMlE1iA/EgjQZPqBxB7/3avtDuxYhgoV7pvf5BREPwt
	 txB+yOPvj+JqtvUlaX3Zno3DDDubD55CrYA1bCDPq8oH8RCM851PKmSqd3Zqdr/laVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=dLdJyonb;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EAF606A338
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 14:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94EAF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=dLdJyonb
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-949589c1495so290257285a.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 06:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794840358; x=1795445158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9cuLg5FPbuoxv94oaCvgpjnZpkxbSwN3Cw2dU0btsKg=;
        b=dLdJyonbx/GT9GciisxRrbnKJNPmXRO37SMr0DcL0fOWPt4npP7q6oSEFPRBxyhYBG
         VwQv88je59xwJGF1tzvO02VHIK2UoI2gFnHM+RoqxVUasg9DyQA32ToeKqV0tOS8H2/F
         utZ+RQHXMciPdHoqR96pmDBV9oFbAflIPtcSFhX2+r9dDE0rLhaGZCPsZ1j517doL9zB
         RpfAbapy98a71EK1akS809jjM1beUX7TmDUaCrtYNcz/JJbJ2sGjj2UfCKl0NoQ68uWW
         NnufbW7FWZvXAJBZh4GXQ7J60xB7eIn/T76+zn9Pq4vvTPBJTSoxoiKRgL0R3QgrjVbx
         3mVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840358; x=1795445158;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cuLg5FPbuoxv94oaCvgpjnZpkxbSwN3Cw2dU0btsKg=;
        b=boo4pp5/KwJ3NV20IfUW6XAxOZ+Pa+XPIxzoLPvBP4FvV+wmSeckh45BNFovGa6Fzj
         jZmJJuuIUKFa9UC8a3jAD2qqLZcqHIyQWINefSNseWM83ZSLwUwx8j8Z+5bd2B7VNvlb
         pQrkqlr1hkVxzyCOBDeJiI1x/MCvL7Pmd/weMaZ8o9ninPwddgTAdRRD/YbZGYA3uJGy
         WsBziLCh22MkMie23thhcQXSA9QM8eHEZrLOc50Ir2GveNb3SmFqM/ypKAbXjPK8F0U2
         4DKVOfGH1kdjoxNLZXMVuS0AMzTrzgQdcf3eF4lhEkwgDCphn+OerjhJebKQJKvcXuj0
         fHcA==
X-Forwarded-Encrypted: i=1; AL+hErEgGVMYrV4LwT2yVHVolOWSykUfdzoQ3+IVSI0HVth7Hv24/0Jlvq7di0dv2tnQ+Aja/JiUHhKaGag=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oEqqzW0bAaSsN/IM6FaoBmtI2jRC4ofuOnR24dPZukZA+LnUh
	MPTe8v0/AuNmWRkt2AGSyT0HaInqI9pJSnRjcbYqGsW5HeSSw4L7ei9F9pHOKhp3sUE=
X-Gm-Gg: AYBFou2xMkcrb/xfgRWCMOqpTo4uvAhkVMEyiKqF1d/YT99lNqGAkvmE4KnE1RTI7cX
	cI1XzNKugy3DpwU93+BLuIBG8RUaduH1zlu8xQBYHb2MevXm4ZYJTQdiTWemJMDwpxzt6i/3FKo
	tm3hFKU0ATRAF4Tq3rO/6u7g1ZKNVdmuLl9kP3OjvGDrb9vb6L6nlqipL1CpJnlGhxW3CwF+mMJ
	/P9Jd94W4CB3QMt/SeCiPZxy9/Tf1Qt4ZcStjU1ha3OODx4sf2uoFCMMYdsVvkLLtb4Dk4FkQZs
	KhPxX48rjGSgjwTtvOcu6eQEJ6ZhaOPuljzhiEwgjmEj20a6zk7mLqdjQi6YaFaQmLXg+pofPgT
	ZN/SYOK3XqJWUdHtb05iivGeHkESh5Nq1EktScQ7ZgZzStOb4cPLguJHLuWmBhlu9sY62gGOmJY
	xP3jPyLHZdJlPiJjZ3o7kFBkCBIsDUJ7OlI+dKkrmIpbClGOByeNKcP7NHT1ft2eM/k2NBDx+md
	sjRARzgz0tq6U2uPOxo5PV4yWeHipOS5pJlweed7Mktc26ODS/9FUiO04ALrQdTZvi09aSLCMt6
	IX7/NQ==
X-Received: by 2002:a05:620a:a41a:20b0:949:5872:be1b with SMTP id af79cd13be357-9495872d3c0mr1015844485a.39.1794840357475;
        Mon, 16 Nov 2026 06:45:57 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c836079sm858473985a.18.2026.11.16.06.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:45:56 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xSxxz-00000009V73-1sJy;
	Mon, 16 Nov 2026 10:45:55 -0400
Date: Mon, 16 Nov 2026 10:45:55 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
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
Message-ID: <20261116144555.GM2532299@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-17-1e536825b4eb@nvidia.com>
 <yq5amrr8yldi.fsf@kernel.org>
 <20261116132046.GI2532299@ziepe.ca>
 <20261116144103.GU11319@unreal>
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
In-Reply-To: <20261116144103.GU11319@unreal>

On Mon, Nov 16, 2026 at 04:41:03PM +0200, Leon Romanovsky wrote:
> > I think it should only be for the duration of a bound driver?
> 
> For now, I decided to disallow state changes because the IOMMU may outlive the
> bound device. Unbinding does not fully reset the device, so we must quiesce it
> to ensure complete security.

When we refine the lifecycle for the iommu this issue should go away
too

Jason
