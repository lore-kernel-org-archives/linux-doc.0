Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887594;
	b=WrvqDyVd1xhKrrM9ROQxXdS+odDhiKYBQ0Cz1R3TnyVfutJQ2QMWkAQnlVjwVD1fgoQM
	 Nmv5RI1fQ81ZzeSHKWAxBxAwR65F2w4HbWbC5e/GghF0LqWtbJacHbHjPbK8O50c57EnL
	 uq2VBx6FGLSMDQK6qZ9E1MLrLB5h+YCSOA3wkQnKW6wrc1KbZB8P+LAmoUSFjJiCy5Fbl
	 7pQKuw4S+Wn6fDsCXqR2CMd0q4DMLNI2aggxJZfPxIINd8hn4qWs7SpijPYnpiS2W+8D6
	 Ez4seyQiGqA5dopQSbSehYL/KrGv2j0Nz+FCW7NgwGaZS3nlNlkGAcYbMyLBte1rKcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+bxiPLBqzkOz0GIdUWUmBLaUitvgttuw9ZH2qvbUZkg=;
	b=srF5Gl61L19YPLEpjrQ0nv0TYv0MyxAcjrsyM65kreeZFzYCtUM6JBklCCYRKfcO/3ik
	 guAf66MV46qTbIXRMLKGfBcwuyxLEMfDM6WtRZAevW3qdKJYGFZW5ku+9U66l+2oSDWMm
	 sbCjR1HJOKPGRJ/LAcGYlSNHKhGCK0VMNx1spErCj4L+wQjYhrXTny8E8NXECJrrbel7c
	 ZcLuJDQX94JVesh6HcJn2uixrLcN5oEXvFi/LQiEa6xxMbOepWeJ/1kerUqE8lU7nvTMT
	 P2QqvTcTnPJopZSx384TYyG5YKWBEfjI45No3xBca/MNXJSvlcRqbk1FrXNHGDtqZ7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=RnR9WnLw;
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0488F606A32F
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 14:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0488F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=RnR9WnLw
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9908c849564so508165241.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 06:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793887593; x=1794492393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+bxiPLBqzkOz0GIdUWUmBLaUitvgttuw9ZH2qvbUZkg=;
        b=RnR9WnLw6ZCMoaFK9OfD+Z3SyEdhvj+uf0rMG8hHCJ508GqyJ6ANwZoUk4+aGiOUw2
         /BkiFTe3GFbXdlDhgGNTyo1p8KbFcLTeuViDrXT0G8rPqBzVVo12Ao+p4Nr1qmRZcl61
         4eaArBRyBLbC70PWW9D8DSwCjUpFcwxnrtfrVG8awSc3G2DLBl7ue9/tyD5BZlfo0PwR
         zdxT7MPa5WtJxCqrk+LMM1B4PGIKPha9YDx2d3ZgVPNqHnLfPw9K0SbdoIeozyBU6kJV
         fXJaMOJT5b2NTv+4F4NS5Cw1swAwWPhfu1r6zxddYwAc/lzTbX1ed12Z3pRWm4FFq8m7
         OBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887593; x=1794492393;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+bxiPLBqzkOz0GIdUWUmBLaUitvgttuw9ZH2qvbUZkg=;
        b=OUQKSwnOYrxiYXLo1B+eSzplqWJSufJ+F7p2u6oaf8027aY67RLrfAilY1xBq3oaso
         HpEMd9kGV3SKmC42VvwItQcSqv1jNDEtCGBTDC1p6MivHv379Zr6ENfhPWsg4QnIE/NQ
         2uH1CD0XNKyEr3GLUw+Q8f5a88yywOfJF5isEkZmn1d58NZ91jotmQ4bT6n7xpAekwG8
         qfxhEY6xPfdS/MRbSJE4jlUMU1bY43UQGwo0+rLsDwiS3PgS5FOh74jXkMec3MLlJcY3
         H57mMGa/twjAORaXy9BEZTqFASpCR9vThrPcsUPgxyj2kmF4i9Vawa/Ky33/vvcdnKQO
         mP5A==
X-Forwarded-Encrypted: i=1; AKwUvBweSaUHQPtBEvpcnimUEtOmJTXB5zJQkOT2huaHniUZMiAvl74bpm7SOfJtmIpTkcx9wl/hiRyedQU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Whw8j16GbhCHIxk6kiLJPZzaF9Ve2r5W10UGBpmkjl9Cc63WF
	NO9DcZlI8yI/mKzue17IuGgoW4HyiMKxIcu5R8E6Ji5sbjgKrn/KWnutL50VTbV+b+0=
X-Gm-Gg: AYBFou0FhcKqmytmxBUsva4SMDVxaKCjNyT8CWZzWJGph79sIKap0Y+Y1zavn+AJ4h6
	CU3mAHnYOCkS5esUIZ1SJMJZUxyqgt316k5VBc9kyOPamZo7LkkmRb/9ZuszAWiJsJf62Od+6cr
	akX7gB/1AOibpG58HjQiAc5WbUPUJ62/l6JZ+HfLLrZrhTedN5lmU4ZGCgNZPMKZOXK7aqytHa0
	KNo9NjlG0R44TndB9N486rzAiFHr+YJ1spwCxpeo7L6M6F+vrp6bzAXee55+uLn7ZxfH7vKRz+h
	eXmdqfFO3xm0dBnGLrdubQ8VrrW8IDFAig63kIc2CfpvtgmEaAb711mv+14STFVF20o2/HZp2DS
	G4WvdQv1Nvc67cPdvIhDUHNfIMs36srIkSFucyrUDdqcyH6btpigT5S0gbXSC891LQ/nSWOe+ij
	/RveMT14tfS+7fotobd5sPtZBFytMEZvj00PMJnb0BQTxgurOLVjVI8Oga52JYj+OTHqNOn19PG
	03LNrNL+kJq4GhdLu7JSTtmz06cKepSjQi17EYqeDG5eC6w124WfZOh2AJtD7RH+sDFmmx+LQIK
	w0zKQ0dkpcgXN6JevtyZzZ5ALKEXuT/c6LglYEsrT7+0kj1847VwDkUCQ9OttiyrGeRSPFADrX0
	VgUG+iGBTTA==
X-Received: by 2002:a05:6122:4f9f:b0:5ea:389c:51fe with SMTP id 71dfb90a1353d-5ec68949c50mr9274698e0c.17.1793887592873;
        Thu, 05 Nov 2026 06:06:32 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d9d62bsm4161881e0c.8.2026.11.05.06.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:06:32 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOy6p-00000002ezu-00ao;
	Thu, 05 Nov 2026 10:06:31 -0400
Date: Thu, 5 Nov 2026 10:06:30 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leon Romanovsky <leon@kernel.org>,
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
Subject: Re: [PATCH 10/17] driver core: Expose device trust authorization
 through sysfs
Message-ID: <20261105140630.GG3889730@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-10-1e536825b4eb@nvidia.com>
 <2026110514-bunkhouse-handset-6a3a@gregkh>
 <20261105132729.GB8298@unreal>
 <2026110535-engulf-precut-cf10@gregkh>
 <9d896ebb-6892-4cac-a7c5-41def47f0be0@arm.com>
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
In-Reply-To: <9d896ebb-6892-4cac-a7c5-41def47f0be0@arm.com>

On Thu, Nov 05, 2026 at 01:59:20PM +0000, Robin Murphy wrote:
> Yup, and that's true even in the PCI TDISP case - there's a major amount of
> "communication" and "configuration" involved in that. The principle which
> should (hopefully) generalise is that a bus/host controller driver can
> always interrogate its child device to perform whatever attestation and
> general configuration is appropriate, but we won't hand off any _control_ of
> that device to a specific device driver (nor enable potentially-impactful
> bus-level features like DMA, interrupts, etc. if relevant) without the
> requisite agreement between the bus code and the user.

+1, I think that captures the idea very well.

Jason
