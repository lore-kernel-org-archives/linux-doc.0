Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795566258;
	b=mVBd63m5/0x2zynd7boopfW2fkD+OIbB/wQqtnHJ6bksfcR2+iGYXGR0Rvo80/rfrP2H
	 bjWLpZoCnWqKJ81/EaQUWahZjhwnlzyEAOAsZBwc7iDs63/LggsVPNQGhiykLzDXOHyYq
	 zO61tr7EhXdfqII7zZ1XOfJzYjDl4OFC7B2DnWF+sQfB50jcHg1V+8UR4KkIsUxpv7zrO
	 hnQ7tH009Sb254hKPCXe05C7nFQvpcXoqAvH/wdgQeiqzY/Sm2+fFGuZJ8Oms1F+OL+uG
	 OA5WTgzz4uHIAF/O+1CRzI9W8EtJtGwKkcKSmpX1mR/IEg6CyUbEIT8n3ZhAJoX9SOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YMO/Q4LHoS6IxvSYVAkwFpWA6bWqlpOH+BNCvhBFP1g=;
	b=atKOd9bqgFRluLzMMJeIQ5mKtb/3hNZPUM98Ex3J16xJYt6j3rDqtSu0VBTTdghlWQvB
	 sUdv9FIuN/tfbRLwujpI+x3ZlVJ7gDQNSds8p+Rm6+CxL9MXTzILWYmsmmumurF8qKDo/
	 4aH1MsuB7/RgvQBrTlYjUJmd539er0JG3RuR4wRkuMDbuAolJt5kXbNBcmKMNQuVG8OxX
	 95PHnnNzJ7+HbjcAML713Vy4XxUIaDjPgByixr+KXg08pLeaZqnOUImynEMZWMIRIz8lX
	 LHX2wPGw3/RRmN/m7ZEFWIpTjYcm5/bbC/SI9e71JpZJYfLe93RRF4Vx1I8Vy8KcJWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nvA4xsJY;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40827606A31E
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 00:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40827606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nvA4xsJY
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f048bc09d7so242565ad.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 16:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795566258; x=1796171058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YMO/Q4LHoS6IxvSYVAkwFpWA6bWqlpOH+BNCvhBFP1g=;
        b=nvA4xsJYbyjlVUxR+uk4yXS/M0iXumDNQvEFcjik+fzfX0hxCUG8igTP+aEBUQKhWU
         01rPlsYZxijr1nIFh0HnhmIqvQDte+9GB9vgwkcgoDmEZlgpGqs5n719qFTdxZxpqmHD
         smlvTgzd2MsCxkh4iC3Pj3xgW0A8Vxl/d+etRiBo7TyLfUmGaEDmFSkc1zKYBT1NH1su
         QsnQAeJzEmHi0cQJ30I2MOkUNe8XLlufgoLeZ9DETN2Ob5Y/qQNwZctS+bf7T52hpQPK
         WciL243GxjFlJ67fODnf4z60/dH9j68n9GubZQYbMlxniUpHCzE0u2iUedJtX7wAGNLR
         a8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795566258; x=1796171058;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YMO/Q4LHoS6IxvSYVAkwFpWA6bWqlpOH+BNCvhBFP1g=;
        b=Dgka8r9SIZuAAcqW5BpREsLBRpZI8SBmrJ9McdGCUesY7BcBV0gXnjo4yGaTWF7oKi
         5G3vLEk8KOZlQy0oWizBN03q1kBdjtXVn1vcy6b+PT2dIlc/TdJdkVlfSixlpm2FDXhh
         DvjmsMvF/f2SpA1bDWxdGHTSutWIjj6A9JeWO++Uzh46yChiN3olMDkENuJLcV2O6MMz
         e0TxcHrNsto0ospU3FLUOX0wYtvEYmh3fMmS+9pPFpLnQk2c/1MOcR47ChgGPhMde8w1
         XuUfL7vTk3C1aOJ6AqbjFOUK+zc7JCQqj0MmCDOnWPnVuOu83QJDqbYXGPJ9NIgHw6gP
         T6iA==
X-Forwarded-Encrypted: i=1; AL+hErHt6mTHYBPyS4teXSywRiqyjygPONpi2zSOU9iwvP1V5+Th5sIVX9HIz3TnjnLasEmCbn2pWwL7Ays=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rkvkzwlYGslHGtfgKGERYv0kUg25tpHLRJtt3Rizzlvl/NhFW
	P6Ni1379Sqd+gSmCerasuJeDC42MYbT89G+DPgq5qkqnTCDgvnp6Vm2TzGozyamOYw==
X-Gm-Gg: AZFdTZdhaJSSYZYAICF7aLHnnrc3gA0xXfYryrDhtvFPMuhkCrBMpH3UEpLzypmBZkY
	iw6jkDkkYYfqwvX5HPLoqkMjoj/yEW2rBErCELJIMrT7Wi+L4L32l4BODfGP1aBUHhYJSKH3vLL
	85mBjowMKHS5y6j3RQtCC60TxZW87R2+tAg0WM2Y7gSxMkKOtkVIOaHUUIKlJvHSU+izov7IKjl
	8MbAnC7uyHKz2WshekzcGMMkwQlHPcvFH2iYShIewykoztO2tCpB95TdKc7+e0XmhmOWrBMw6Yh
	fSDuzvUcRLr2ky9YhWFJOvvhve7Wb8IUU2vy/K1/h1Pko/x+6gDdqajQISBqfYDrr/BNq3V5yga
	Z1KQat6xdrwpocGR4io5EZeSaS0ul/7lNleB9eM3XyGXC3gOHU93l3ch+JWQ5ghgLxT3K+GcH4z
	Xy7zGBUgxnj4RpahA9QMxTlAeJZKktgQ0T0fxQTWTDWDQ9OOaPurS+bfPH81VKK7KLAWG8hCsoT
	X0rWBCTvGiJ7i7vhmMy5SGYF6Aoao194dpngyFv0+ho2GvI2gVL+CXRR4p4RLATbwecPUUBaHaU
	04clhshW91hweGjWKX1+d7MLQYwsZPWMnPBYqq7dax4Q7n+nyIJHGTW3lsFl8MDgzzY9INmlEF3
	Fx8Dx0tyy5PPx
X-Received: by 2002:a17:902:e950:b0:2d5:c090:3810 with SMTP id d9443c01a7336-2f06242bd42mr16475105ad.2.1795566257244;
        Tue, 24 Nov 2026 16:24:17 -0800 (PST)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cff4c1asm7632022a12.15.2026.11.24.16.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 16:24:16 -0800 (PST)
Date: Tue, 24 Nov 2026 16:24:12 -0800
From: Vipin Sharma <vipinsh@google.com>
To: David Matlack <dmatlack@google.com>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org, ajayachandra@nvidia.com, 
	alex@shazbot.org, amastro@fb.com, ankita@nvidia.com, apopple@nvidia.com, 
	bhelgaas@google.com, chrisl@kernel.org, christian.koenig@amd.com, corbet@lwn.net, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, kevin.tian@intel.com, 
	leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, mattev@meta.com, 
	michal.winiarski@intel.com, parav@nvidia.com, pasha.tatashin@soleen.com, praan@google.com, 
	pratyush@kernel.org, rananta@google.com, rdunlap@infradead.org, rientjes@google.com, 
	rodrigo.vivi@intel.com, rppt@kernel.org, saeedm@nvidia.com, schnelle@linux.ibm.com, 
	skhan@linuxfoundation.org, skhawaja@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yanjun.zhu@linux.dev, yi.l.liu@intel.com
Subject: Re: [PATCH v6 12/27] vfio: Enforce preserved devices are retrieved
 via LIVEUPDATE_SESSION_RETRIEVE_FD
Message-ID: <20261125002302.GC3545683.vipinsh@google.com>
References: <20261102153656.1431701-1-vipinsh@google.com>
 <20261102153656.1431701-13-vipinsh@google.com>
 <DMZLVV5YW6GW.1HMW8L8NIQ1XR@google.com>
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
In-Reply-To: <DMZLVV5YW6GW.1HMW8L8NIQ1XR@google.com>

On Thu, Nov 19, 2026 at 04:19:34PM -0800, David Matlack wrote:
> On Mon Nov 2, 2026 at 7:36 AM PST, Vipin Sharma wrote:
> > diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> > index 12557d45dfee..e6ca4c3fda06 100644
> > --- a/drivers/vfio/vfio.h
> > +++ b/drivers/vfio/vfio.h
> > @@ -11,6 +11,7 @@
> >  #include <linux/cdev.h>
> >  #include <linux/module.h>
> >  #include <linux/vfio.h>
> > +#include <linux/pci.h>
> >  
> >  struct iommufd_ctx;
> >  struct iommu_group;
> > @@ -446,4 +447,21 @@ static inline void vfio_device_debugfs_init(struct vfio_device *vdev) { }
> >  static inline void vfio_device_debugfs_exit(struct vfio_device *vdev) { }
> >  #endif /* CONFIG_VFIO_DEBUGFS */
> >  
> > +#ifdef CONFIG_VFIO_PCI_LIVEUPDATE
> > +static inline bool vfio_liveupdate_incoming_is_preserved(struct vfio_device *device)
> > +{
> > +	struct device *d = device->dev;
> > +
> > +	if (dev_is_pci(d))
> > +		return pci_liveupdate_is_incoming(to_pci_dev(d));
> > +
> > +	return false;
> > +}
> > +#else
> > +static inline bool vfio_liveupdate_incoming_is_preserved(struct vfio_device *device)
> > +{
> > +	return false;
> > +}
> > +#endif /* CONFIG_VFIO_PCI_LIVEUPDATE */
> 
> No need for the ifdef here and 2 definitions here. If
> CONFIG_PCI_LIVEUPDATE is not enabled then the compiler should be able to
> optimize vfio_liveupdate_incoming_is_preserved() to false.

Okay, I will remove it.
