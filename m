Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794157159;
	b=wd5o8INYnHInzWJNyVO5FVbGuofCBGSVPX9jDAMDrcWwtBKpL/9/8Vxtq1tIsvKyd4rB
	 44lc49Te3JE1B99OoiwCVgbOMzwev1DlfFI2xQSv9wif4mFIP2OIi38ljwdIfoLFXeTEA
	 lL6bD6IwZqYYE2zvsbFYdPxZSzNsol+3YWb5ZMubogShQh5pYc+8bSK25ByyCs5mi4FkA
	 0DbhQI6JZJiY3CbIrTKVa3f+4Rl1wTsMIFW+KQeMplrsfmxJQ0RmV9wR2srDKY2d6wM6c
	 ABe8fBR3HnLr0UpUOkTruMRVag2xT/ISoK/GRRmmxDRp3SErCH28+gE0Jf/X5NBPXoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794157159;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lmwJQdwiPgvUanu0gwsKytij+Ict3+h8IPwu4vyFkUU=;
	b=sebQbFk+wYFAEeyLtGvnr/SCPoXL0gWKYIi5Oq2oYIuJu+23eBWWTx7SMnXAwhCB7FCb
	 ZjXyfZ2VIsHBr0tYG4mO3DGglWc8GUS1H58739iQSKdj6NGGZjfygmpHpABLjrdbP5pHv
	 ebbwMo6CXG9OjnUN0r5mfyfB5UHOMDkhQ2VnRYGc8mFh43Cj6oNucvhiStA6a6YPDjmEo
	 glj1/ecp9JJTiLzcMyFVY7w7dwDZST56eQjgeYQU6n0SvY9zw56EQ/8pjh4AkVArVXsK4
	 YKEjq/7nnoI4Aj2b3kOMaMQmhwForGDV5veIWqDqJaurGF/Su22JgagqNE/McHw1O8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0840E606A332
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 16:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0840E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91ebf4cd218so2050836d6.3
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 08:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794157158; x=1794761958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lmwJQdwiPgvUanu0gwsKytij+Ict3+h8IPwu4vyFkUU=;
        b=vVWQLNs+Rnn6NOsMpjKSpUM9H3gRT4E/HZTt53PMAZ2SXIz+Low080hQm0r2oKAsG+
         HZ5TLknOMUGXKR3KUCz20FyQXU1Y7n4k67s/O97MTY2HciAv7W5/XWWVJI3wnxiYTpJN
         gDPuohXn6LbvsrECp0/Ji6cvN5My5wm8EgfEsTmjv66hd/4pZ3HhjPBADrWO+gshRLZX
         1w4cJtE0RQlZSB1u8qCDumnVcL5w0oR/W9xf8l09re306PAWvYklsReVbujjFSq7ckfb
         ysHxLPgUuyjzLYLRPYb0BIszOUV4j3JsJcseKz7sg4xVYz+KH4V8tOVQekOfo5kBRIRc
         SzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794157158; x=1794761958;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmwJQdwiPgvUanu0gwsKytij+Ict3+h8IPwu4vyFkUU=;
        b=B1HrfBoHPaS2E1Xy6BdXD24GwJLo06oHVFPoUPryS1od5IyNl0jisktIlfsc9MH1xT
         TEgCsObx6a1LqRnkxTbUY4j9MWtZQcxLCwYif6F9ytK0+et/fSFYBkroyorOnzFT8EO7
         2TPULmWvgr+BRU2jLIywfqglTIS17BtktQ0AgwrCfn/cmvtes5PyMY58yDngz9M8Pum0
         NheJAfk9Gy1wC/0GuBrXiP+RwapCf2iiOBbLLCs+npkWCaR5Xwr1Au+Ugyb5b7m8/sUK
         nT577/tuyLWr7BMHiQJcSOdFEozsTbT5AyLwb3rVNMlaGkLuKNAwLRpp18Of5XFvIUUg
         bZJg==
X-Forwarded-Encrypted: i=1; AL+hErFvoll6oQfK2uMPt3sfaa/oLDBbKXrYKcZRV8xrplJ0nA2yREg1J6DQ27ZQ2Xiistc42lS2mpkTOSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TYeXGbAEGIuLQZu62SBPX3bV/ZiXEYAX6s1fvWMZPtrNHBqWH
	wWM4QzzxZGEpN+LMhxV5NiMI52MWwz+qMHrofInakzZWqgzUIimZaeRFzBftBhh6Uw==
X-Gm-Gg: AYBFou10JN3bsYRosP5Mhm7US/2AmN5qrfXCiwI6EKvPjefR569i/IK8+u+GDnpasEw
	5NuuEOl9YlWrgonDbnHRwf91Hc2R9auIDGAElTNS04qZXKX/n9gXrYwYXxalMzH0JVMcWMGWoc+
	09J35xhtGVq+q5v2F8f5DBT55IoBcwjGH/amslz3Llyb5mudP8duUY39tMAwhXXbUTfxwpA/PP8
	s0lSCRS4eI0yyUlq1e7oR2LB6DKR3oUdI5qz71iqpmF0OlG505kjvTfcUsD4C+FN+kj44/l9C+h
	1WalwB4RmEbn3E/rwp8tUE3FKCzEcBhhbZ49NBof1uEklz3UQQAZ9LQQE9WKoZxjgOdrd86TBk6
	yFIkWxbnMXMirkh9AoAMbQPMh1dP2RLWbKPRgm1BtgzpEDIlJieCWwxxA3RAc+HVkRa/DYYLK8A
	HvGMriw/AECoyPyHgu6ZrUrkcKAMEGkoxsXZD8tcdj2HibpdrI2OiGUolunUs6KyI1T4RS/J55C
	V5MRy9ksv1rUmBNPog8wKGsFeJGr0x4PBxcNWGL6zraR5vqd71pqL448PneJ4IFlkR3s9MhCPFh
	lVnhK3ogm1GaEx/XoEURjg7zMb+S
X-Received: by 2002:ad4:5d62:0:b0:91e:9d64:3294 with SMTP id 6a1803df08f44-91ed240d34dmr24616736d6.30.1794157157397;
        Sun, 08 Nov 2026 08:59:17 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ecedbefb2sm22431036d6.17.2026.11.08.08.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 08:59:16 -0800 (PST)
Date: Sun, 8 Nov 2026 11:59:11 -0500
From: Alan Stern <stern@rowland.harvard.edu>
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
	iommu@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 05/17] USB: Lock registered interfaces during manual
 driver binding
Message-ID: <647f3199-909d-425f-b485-b598a18844d1@rowland.harvard.edu>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-5-1e536825b4eb@nvidia.com>
 <bb83fe3c-cebb-4bc8-bfc9-24df1cf72b0b@rowland.harvard.edu>
 <20261105184442.GF8298@unreal>
 <bf756e50-c77e-40f2-916d-e88887426806@rowland.harvard.edu>
 <20261108110909.GA8635@unreal>
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
In-Reply-To: <20261108110909.GA8635@unreal>

On Sun, Nov 08, 2026 at 01:09:09PM +0200, Leon Romanovsky wrote:
> On Thu, Nov 05, 2026 at 03:04:18PM -0500, Alan Stern wrote:
> > >  it ensures that the lock is
> > > acquired when the driver is bound.
> > 
> > That may have been your intention when the patch was created, but if you 
> > read the patch you'll see that it includes a whole bunch of material 
> > not related to locking during binding.  Namely, this part:
> 
> Once I added `device_lock()` to `bind`, I had to add it to `unbind` as well.

Obviously I'm not making my points clear.  Let me try again.

The entire patch description, as you wrote it, is this:

> Interface claims hold the USB device lock, but device_bind_driver()
> requires the target interface lock. Without it, trust-policy writes  can
> race admission.

This says nothing about holding the interface lock during unbinding.  In 
other words, it isn't a complete description of the patch.  It implies 
that the patch changes nothing outside the device_bind_driver() 
function, which isn't true.

Furthermore, the patch does not change any of the code in 
usb_driver_release_interface(), which is where unbinding takes place, 
because that routine already takes the interface lock.  So to say that 
you had to add device_lock() to `unbind` is not accurate.

Instead the patch adds a new usb_driver_release_refused_claim() routine, 
plus code in usb_set_configuration() to call the new routine.  The patch 
description says nothing about either of these things.  Not to mention 
the fact that your other changes make it now possible for the driver 
core to delete an interface claim when the interface is registered, 
something which was not possible before.  This is another inadequacy in 
the patch description.

I'm not saying that any of the code is wrong.  But the description does 
a very bad job of explaining the new code.

Alan Stern
