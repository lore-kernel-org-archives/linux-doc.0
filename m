Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910900;
	b=VhV3rvcS9Fw/cMb8C2s3XzAz5zkR8u8wMsvb/sdDSZFXlXMXBsS1cqZNuLjtXD9jfkW5
	 T7e0AREOj0XYMoxWIVBpvDi10fYX3py4HfmBF4J3syfduIsqtWavYj6BGM+kuu+up2RGR
	 ELJGrazWZTxdg93NcOzezWTvPJe3aGTMAb0JWaM3HH23/LtjTZfxVAnJGZP3oPABaHhTk
	 Ny0/UjuUiGWWL4hhjEIw6fRKbsmNwO4q5IgsWYSxUb1YGrac9Sb8TuPvET0Rw4zlfaUnc
	 ZMuTGUxDoxqWoRP90LSg2BoWCoy4yoyYEHFdqOEqB6R3hgZkfXziOYl5sZU8cWQfcJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=aFjl/l4WKV+VfugNVUlnSUSxj2ZFcfM53muFdv6vcfQ=;
	b=5F0rXm1AjQjxu64ZVju/fjIq+QvSMoPeKO3/aSywduS6zeUnEAJq/4DX0WtKTVtIvGn7
	 gNpSziB1PkmItpqnc4+tNMxmfBELGVXn4+NWKtx5IBPAjUBFpuaTMKa7YB9WygFukObBt
	 zNzAVszgZB8pXGtJfRwkRbjVhsePDSLH3FQcEbBIEInnhmedD7GZ4mCVabAz0g/NTu4u4
	 db25Ug4tD99LANxCIG1PneVhBmcx3nyCJy4JtxOXcV/BPH1UmfXmg+cbC56QJ5p9nrAC+
	 gwolKTa4uLscWTCvuF/s54JQJlwlVIDDC+uN8f0+gKBRgH5Ru1cwdKgZXQYCWsX0O/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfDV8RqH;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7141606A328
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 20:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7141606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfDV8RqH
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so4357295eec.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 12:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793910899; x=1794515699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aFjl/l4WKV+VfugNVUlnSUSxj2ZFcfM53muFdv6vcfQ=;
        b=tfDV8RqHdxq2Tir67Fgi3R8YmRMnkFni198pbJyN+2f/wlgyg1u3H/zAskp5NHkOv7
         tIdkAuAZ8WUJ1kMmFVB+y6fHOz8B/caj8wD6aThvegmX02BzNu06iJykZNQp0y6aCkds
         RlikDnWVU951ugzrT3mYdlzvFKlHh7U4jsRYSXIG1h4+jf8Ji6Bx4VcBvQSsJCCbdeY9
         mB7Z2NGEfuJN8Celqb7oNC5peWi2IHdFiN3NSUJbZlwldHAE4GnOhIkhY+aC2WxclROa
         S4gSdge+AsM35XlqkfzkRHJ1/+Vy2cjQlMpoMljhOELSER57fCOwoNKU+WxKYNt0B3OE
         B7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910899; x=1794515699;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFjl/l4WKV+VfugNVUlnSUSxj2ZFcfM53muFdv6vcfQ=;
        b=fQEsp+Cl31d0ElfQdeCFcHdaDDYIXliKrxCwSOLjYZSL+SHyV4GMkYLubIVNlBEU6Q
         CfkwHBP2xRhLtig/0X9xVDIEQ8LImUoQAEhmTxMQH14BMthEj9AizPK8iWNZ2aSFlcRS
         /9kTd6aQIBCp69/SZ75BsyL/CDhecoqx4K6WpEKio/vdJCelu/U5CwK0AJgs70ZQjEia
         9nne8ioS0xrJYVX/K6xecme/s+N6lOKzeP01W61lvQ07D9ugRzxF+hVCGcBhTCv7WWgq
         l+x9oUCZSObenWDYwL8zdUWhq8UzbQa7aCOrVx5Dxxfuls6CQcWOP6CJJzGZPETH3v1w
         442w==
X-Forwarded-Encrypted: i=1; AKwUvBxTbjO/ldgFvtCrGSDKCmiamkhENFmJRGUtk+ha8fqKz6fqOYT6U7ZAvw+ikkL2+hE+UfiVMivWQ/4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wdLPWsc+EF6WkWaC3Wbt3fNHt8xGtdaHF+7MU3WJDo9otJu+E
	FMB2SHPXrSStjzcacNCB5inDlY7wE/9ig/2TtAnzh/2u4GGc9hXJJAth
X-Gm-Gg: AYBFou3WvgZa7rJYPomEuE0FO/Gjbf5+VUyaDqzeDO36/nSCO7/9cSaxZlIH9GOqXHA
	c1RrgNuAqiHvPBbdET3wtcEyWCoEEVsT0u0qS5ydbx0ebse0zQDp8dCmm7yvuTO5buN+xEqjOtT
	gD5sdJJMz/xConjAlzXvGKZ6Nj5Cj5XY5dGUpHRBpvJAsS9uM80rFCEGaE4/ZbT4pTYk/VFFMk2
	k0jcKVxWNjv/rY38hKmBASz9kCvKbLyOeGtggJKSESI0VB96+2ZQKkVXiBHzcGTZeUkhLFIuEN5
	jZ7tTkGDCRSqIyj/PpT6cttIyCTwSErh2pLwSKPqWu3GroLFQ3Wgx5LKTKr4jgC11V5V51gqn/q
	yLIl+3xwS7T1dEhV0BE871qoWgTEgozPe3WK7KzR1c18F9hzCtoiXRi1zurrXd9w3WUlMSv0vaB
	/UF/bYZajB0WaYNti5vonveiOzpN4UvdjK8LRfzVeWeEYqZMDnXQ5LsS1HrfbYv6M2DbuL+qwfi
	kUaLTPWeAuaPoQiWf1HGg2QYYovhADJW+j5EEv5TU+DpB8L6Uhhcr8+DBWWn4ZtqtGPV83Eqtli
	rB6rMPYX8g5ebhYTK26Es3vqmhtD0wfmVdhEsDfDNgTsF9vGNcU0U0BRNyj5j6z4KMP3l/E=
X-Received: by 2002:a05:701b:2050:20b0:166:5552:780a with SMTP id a92af1059eb24-1b25d31e5a2mr163714c88.8.1793910898553;
        Thu, 05 Nov 2026 12:34:58 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f722ed274sm649631eec.18.2026.11.05.12.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:34:57 -0800 (PST)
Date: Thu, 5 Nov 2026 12:34:53 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Johan Hovold <johan@kernel.org>, 
	Eric Dumazet <edumazet@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Nipun Gupta <nipun.gupta@amd.com>, 
	Nikhil Agarwal <nikhil.agarwal@amd.com>, Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, linux-input@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-pci@vger.kernel.org, iommu@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 02/17] Input: serio - attach manual drivers through the
 driver core
Message-ID: <auzno3uoL5Pfojfl@google.com>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-2-1e536825b4eb@nvidia.com>
 <auy2plYVi723Qt42@google.com>
 <20261105191940.GI8298@unreal>
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
In-Reply-To: <20261105191940.GI8298@unreal>

On Thu, Nov 05, 2026 at 09:19:40PM +0200, Leon Romanovsky wrote:
> On Thu, Nov 05, 2026 at 09:05:29AM -0800, Dmitry Torokhov wrote:
> > On Thu, Nov 05, 2026 at 01:42:15PM +0200, Leon Romanovsky wrote:
> > > From: Leon Romanovsky <leonro@nvidia.com>
> > > 
> > > Manual serio binding connects a driver before driver core can admit the
> > > device. A rejected binding therefore arrives after functional setup.
> > > 
> > > Keep the port ID check and use device_driver_attach() for the existing bus
> > > probe path. Driver core then serializes admission and handles probe failure
> > > before publishing the binding.
> > > 
> > > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > > ---
> > >  drivers/input/serio/serio.c | 24 +++---------------------
> > >  1 file changed, 3 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/drivers/input/serio/serio.c b/drivers/input/serio/serio.c
> > > index 54dd26249b027..604440244c1ca 100644
> > > --- a/drivers/input/serio/serio.c
> > > +++ b/drivers/input/serio/serio.c
> > > @@ -81,28 +81,10 @@ static int serio_match_port(const struct serio_device_id *ids, struct serio *ser
> > >  
> > >  static int serio_bind_driver(struct serio *serio, struct serio_driver *drv)
> > >  {
> > > -	int error;
> > > -
> > > -	if (serio_match_port(drv->id_table, serio)) {
> > > -
> > > -		serio->dev.driver = &drv->driver;
> > > -		if (serio_connect_driver(serio, drv)) {
> > > -			serio->dev.driver = NULL;
> > > -			return -ENODEV;
> > > -		}
> > > +	if (!serio_match_port(drv->id_table, serio))
> > > +		return 0;
> > >  
> > > -		error = device_bind_driver(&serio->dev);
> > > -		if (error) {
> > > -			dev_warn(&serio->dev,
> > > -				 "device_bind_driver() failed for %s (%s) and %s, error: %d\n",
> > > -				 serio->phys, serio->name,
> > > -				 drv->description, error);
> > > -			serio_disconnect_driver(serio);
> > > -			serio->dev.driver = NULL;
> > > -			return error;
> > > -		}
> > > -	}
> > > -	return 0;
> > > +	return device_driver_attach(&drv->driver, &serio->dev);
> > 
> > I am not sure how safe it is, serio (and gameport) have pretty elaborate
> > structure and locking rules because they can recurse into themselves (to
> > support case of Synaptics touch-pads with pass-through PS/2 ports).
> > 
> > But this call is for user-initiated probing anyways, I am not sure if it
> > even needs "trust" handling.
> 
> This patch does not change the locking; the lock was already held on paths such
> as the rescan path. This change makes that explicit.

Does this enforce synchronous probing?

Anyway, I would like to get rid of this special probing in serio core.
Given that the code path is only triggered by explicit user request I do
not believe we need to worry about supporting trust notion here, so
please drop it from the series.

Thanks.

-- 
Dmitry
