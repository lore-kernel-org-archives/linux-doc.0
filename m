Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0172ECD2A
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 18:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767895705; cv=none; b=cNhH3FxO9Ngo0GVk1r1GkURsong+Yv7OxA0HP70ZheM0zXvphpvtbehUyPyP/eszPG6O3+8mmnxUiAi0g6/nBwAwFtpMtV3AK1MO3Dtw+JQ24oWfY3W1BJg8D6J5BWCBx80MNtUOG5Sae+XGAbPTDXHYDwv+O0Vg2v3tshUiyZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767895705; c=relaxed/simple;
	bh=MmK1SujRNf2S2W33zhGcNZEf7Eh4KS8jaIg2kKAyUI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BwgJX0r0t6W2HvZK03rYCInNMaSQsCJS6onXWHWjxUH7PojQt9wZuq8QL0rVuiBdOThKtMLeanbaQfJMH95ab51WOPUHFqJ89zqVqVtHc49hiVkL1vopGit0NCO9vdep90dO4LVVkBNH0XYbcfM+IuqU5uK+BB595Zdpx/rVeN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvpTh8Ti; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvpTh8Ti"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6598413b604so2118706eaf.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 10:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767895700; x=1768500500; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XI9IhUnsXzT6Xe36mfNiAku0AsRQgr8M/6vd/MAZgJw=;
        b=AvpTh8Ti9eTwnx/8Z7Id+GQcFPi2XUIdivPHJbCeq7er85RceJINDqeT6xiLokNPZN
         XfeI5gGu7G/SiDEu441xXgUyQETyV3NfMHWrbeKU7msbE6y11QiKV0tIj/JIjcLbjQHY
         OYMMPUl753CqH3QbOnAHq9YGnL97Yj4VFXGT6qMd3J3OHcSvC4mpWZo63svSWmqzzrnB
         8LpxitVdgcubTzuXtnEcTTwFlUJhdlfh8mhOFiSZzcriy4/U1HbgyLvBkYFz/OEGiLvY
         QRb6neF2zOcWgTxaR3dBwDBfaqStk+7jxJwmvS/bi4zRzG+CINC0KjfrvnIvwD9vt3a9
         8HBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767895700; x=1768500500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XI9IhUnsXzT6Xe36mfNiAku0AsRQgr8M/6vd/MAZgJw=;
        b=qT0yw8Ll3aRrm8T79st7b8tvSmB/kqsqiZfpVdQ+iNrg2hGN4OwuRDBB6LbHGr9klt
         V7JSNDBm4vvsnjec+HhhaP/ol7i2ePhSGkmADtDdeG80xnAK420HYnqTxBOCZfG0o3xd
         WtgVHiUkXq2Alnv0ftFmHyBA8gEcXLprJ8I3BeeFiAQtb+hzaQNFQEtiYBs8FAibf/D6
         MuTtZlyFpjQfSUgUUiGpRA8n1fOfmhk2zOz0F/xp7WNAwJlX1SI74/ZbZUAPV8zVCUIx
         BKrrTAHBa2TIjmxVu8HG3MhJdy6VhMFOu86244Ql+PTE+/48ExMWRlJBkDAqQXq1C5ZB
         X/+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjNInFFy7vka8zghPQcum0thDOtbZunO1CvXnZIu2xmoT0i89V6Y69I9swUACLHNS1sLRp15TgDZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFBKh0BC4lluc6FAdOBHY3lq3IKrLCsCp01Pt/twaLtfJ0+iST
	FHNgAb2huu4m37k5RUQvKYoJW399QTyIoFyIpDctv48GoD6bgHL4IkfXFJH24A==
X-Gm-Gg: AY/fxX5AhML3Y0yzEs5qcRUlT8du9CB1pSRLoqebla75IfJIgF7w+/5N8cxtgTBKqQl
	eTh0T3Q78+4pE2G8UuTUOqrvCJzGzBjlVTc4TaY5BiFg9PKqBbfe2HII70Xqb2qHK+nmhOWHOOo
	ggT8bY1CX+dOTzc9XtMQ9UIW61K1MFFXl8cjAr9+ecNwz5OfXXxUDLLabl+8PwKWqme0am2Zk5p
	tssIXB1xO9iV/A1T5/epj21r4YEtJAfzuEvSsP3Zqk3C3baPZqI7glqKdrALQLfoNRartLAaiKn
	AL9s/biDE6yBfpfVdf9siJAd8dlyYdd1aXDNIuFDgONQ6Nh/RyqqoGJPKnJujGNW71UC6MBj/nB
	z1kDcY0CRS1IXCiotg3eFOJIGKIeWmworEyRs1aF9TfKabU3w0kXhNZrOBxT2l7ADM20J+nkXML
	NO2kxChl4avqPnIPP2zaIyMCrgANb6Qw==
X-Google-Smtp-Source: AGHT+IEjWT5M9/INgbL6wkWLwsvPXOhe1gZQdudmQFnLtNyCh1dUGd0KiFZ98Jj/kb2bsPwekn22xQ==
X-Received: by 2002:a05:6820:7511:b0:65f:5418:5844 with SMTP id 006d021491bc7-65f54eda3d7mr2172010eaf.20.1767895700283;
        Thu, 08 Jan 2026 10:08:20 -0800 (PST)
Received: from groves.net ([2603:8080:1500:3d89:902b:954a:a912:b0f5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65f48cb03d4sm3649518eaf.12.2026.01.08.10.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 10:08:19 -0800 (PST)
Sender: John Groves <grovesaustin@gmail.com>
Date: Thu, 8 Jan 2026 12:08:16 -0600
From: John Groves <John@groves.net>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, 
	Dan Williams <dan.j.williams@intel.com>, Bernd Schubert <bschubert@ddn.com>, 
	Alison Schofield <alison.schofield@intel.com>, John Groves <jgroves@micron.com>, 
	Jonathan Corbet <corbet@lwn.net>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jeff Layton <jlayton@kernel.org>, 
	Amir Goldstein <amir73il@gmail.com>, Stefan Hajnoczi <shajnocz@redhat.com>, 
	Joanne Koong <joannelkoong@gmail.com>, Josef Bacik <josef@toxicpanda.com>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Chen Linxuan <chenlinxuan@uniontech.com>, 
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, Gregory Price <gourry@gourry.net>, 
	Aravind Ramesh <arramesh@micron.com>, Ajay Joshi <ajayjoshi@micron.com>, venkataravis@micron.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH V3 07/21] dax: prevent driver unbind while filesystem
 holds device
Message-ID: <q5ucezwbtvslsbbudo4sfwsnrh2b7jdul56wwg5vubbq7ekwzs@iqdm3ovre5bf>
References: <20260107153244.64703-1-john@groves.net>
 <20260107153332.64727-1-john@groves.net>
 <20260107153332.64727-8-john@groves.net>
 <20260108123450.00004eac@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108123450.00004eac@huawei.com>

On 26/01/08 12:34PM, Jonathan Cameron wrote:
> On Wed,  7 Jan 2026 09:33:16 -0600
> John Groves <John@Groves.net> wrote:
> 
> > From: John Groves <John@Groves.net>
> > 
> > Add custom bind/unbind sysfs attributes for the dax bus that check
> > whether a filesystem has registered as a holder (via fs_dax_get())
> > before allowing driver unbind.
> > 
> > When a filesystem like famfs mounts on a dax device, it registers
> > itself as the holder via dax_holder_ops. Previously, there was no
> > mechanism to prevent driver unbind while the filesystem was mounted,
> > which could cause some havoc.
> > 
> > The new unbind_store() checks dax_holder() and returns -EBUSY if
> > a holder is registered, giving userspace proper feedback that the
> > device is in use.
> > 
> > To use our custom bind/unbind handlers instead of the default ones,
> > set suppress_bind_attrs=true on all dax drivers during registration.
> 
> Whilst I appreciate that it is painful, so are many other driver unbinds
> where services are provided to another driver.  Is there any precedence
> for doing something like this? If not, I'd like to see a review on this
> from one of the driver core folk. Maybe Greg KH.
> 
> Might just be a case of calling it something else to avoid userspace
> tooling getting a surprise.

I'll do more digging to see if there are other patterns; feedback/ideas
requested...

> 
> > 
> > Signed-off-by: John Groves <john@groves.net>
> > ---
> >  drivers/dax/bus.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 53 insertions(+)
> > 
> > diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
> > index 6e0e28116edc..ed453442739d 100644
> > --- a/drivers/dax/bus.c
> > +++ b/drivers/dax/bus.c
> > @@ -151,9 +151,61 @@ static ssize_t remove_id_store(struct device_driver *drv, const char *buf,
> >  }
> >  static DRIVER_ATTR_WO(remove_id);
> >  
> > +static const struct bus_type dax_bus_type;
> > +
> > +/*
> > + * Custom bind/unbind handlers for dax bus.
> > + * The unbind handler checks if a filesystem holds the dax device and
> > + * returns -EBUSY if so, preventing driver unbind while in use.
> > + */
> > +static ssize_t unbind_store(struct device_driver *drv, const char *buf,
> > +		size_t count)
> > +{
> > +	struct device *dev;
> > +	int rc = -ENODEV;
> > +
> > +	dev = bus_find_device_by_name(&dax_bus_type, NULL, buf);
> 
> 	struct device *dev __free(put_device) = bus_find_device_by_name()...
> 
> and you can just return on error.
> 
> > +	if (dev && dev->driver == drv) {
> With the __free I'd flip this
> 	if (!dev || !dev->driver == drv)
> 		return -ENODEV;
> 
> 	...
> 

I like it; done.

> > +		struct dev_dax *dev_dax = to_dev_dax(dev);
> > +
> > +		if (dax_holder(dev_dax->dax_dev)) {
> > +			dev_dbg(dev,
> > +				"%s: blocking unbind due to active holder\n",
> > +				__func__);
> > +			rc = -EBUSY;
> > +			goto out;
> > +		}
> > +		device_release_driver(dev);
> > +		rc = count;
> > +	}
> > +out:
> > +	put_device(dev);
> > +	return rc;
> > +}
> > +static DRIVER_ATTR_WO(unbind);
> > +
> > +static ssize_t bind_store(struct device_driver *drv, const char *buf,
> > +		size_t count)
> > +{
> > +	struct device *dev;
> > +	int rc = -ENODEV;
> > +
> > +	dev = bus_find_device_by_name(&dax_bus_type, NULL, buf);
> Use __free magic here as well..
> > +	if (dev) {
> > +		rc = device_driver_attach(drv, dev);
> > +		if (!rc)
> > +			rc = count;
> then this can be
> 		if (rc)
> 			return rc;
> 		return count;
> 

Done

Thanks!
John

