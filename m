Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017301;
	b=dQ9fAH0/QPMuAkjVF6sDl9iWCIESp6SQZTf6yFcL5MRujZ47gKde4Mp4z4iJyi3T59Ds
	 wKIdsgOZ24/yl073AthWXGVulQFIb7RXbBmq3dGek1yWnM5FLzMSHYlKFpQrN07nVmc8U
	 T5KJ3Zb4i170AScC+BQPueu0LW6fvXtH3FZXuvQ+lYBI6LM1ZAuByb0OaDUXEMFWYxExs
	 VZdImepI5F1t9vW3upMOiQb4E94Ani45OTTmpYpZfppEhQzPXNT1td84Dta0tAOpBLB9G
	 ajJFtVFZq6zbHzT4I+R7xBEEumkyXhfuifm2K65F6OwfDQBKXEMKqnCluLa0lMzOhSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017301;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qYegP4uULHLbb4rYN9EEt/ZV0VWypeovKGqy+rkk7so=;
	b=lB/IbJA5Np2O8qjXtZuzXhnyPwsn7H261OmzguPkIFA9lsgz+0F8EuUPB5X6gu5VaVR1
	 pI+X6+A7Jrcs5dMhS8n3/XaRWD5EXXLx3yjqRWoegHUAHKo1pZULzpy61Bf0J9XV+a/n/
	 8ms6ADqZ4WbCQJZAEa1NCu7Qn6cmov0uQ1GxdZMtbOw5pIhHMuzcQosyT/ON1Bk7ikWMB
	 6a+xMIePg7vjur6S5n2ti4S/9j9bYtBxE7OTy2SQxf0kx/eM5ubQdBMbecqn663nRKHKE
	 SNnI7nWTLFaQK2Vp5HwUPSEv15jRL2jHM0kMXzb/Vzz1ly/QJ/PLE6EQgJXwo1CFvpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XXowsTec;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C444F606A333
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 15:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C444F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XXowsTec
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c51239b0e3bso25672266b.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 07:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795017299; x=1795622099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qYegP4uULHLbb4rYN9EEt/ZV0VWypeovKGqy+rkk7so=;
        b=XXowsTecBEc1yVTP/SGAQPtMfrRnZ1p1ga3D1SZP2gtvhzZZUKZxMlkyBdRkw4YcEP
         NnWS/4tdnNQuSW7Kv9FpHMtgm2C1B+P8BakhwvKBeweq5SI0rlHgCkajgnCvmFOi35nL
         0ybtCKWg9PKlkuLqYj4Lrr5Wj7I+AJQrpXaZFSNJggUQfOQWaQaysysTRNlL9M508/0I
         KrReBVEVq4lpl7+zC9uvFLb8+X1sLILOg9GngO1R5MIQh8xnt59yBvbLQTotFlL8M5Cn
         gbQC1FDxYIZ81/nC+0N+bqfP4MXLJzxI+rkvVDFRYeSWT/zmRY9t9EfqjDSvnASIV95t
         5avA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017299; x=1795622099;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qYegP4uULHLbb4rYN9EEt/ZV0VWypeovKGqy+rkk7so=;
        b=h1VjqC83mimYRYjHUPy9l8P9P3PDFD6flHYYkNRVdRJuqCJF0tbsLyI9Gr3jdtJ9MC
         thlnr1Y1OB1cQW9KHhR1fcM22n6nYMCiyvILiDbyB0sZgGt0txp8hPwFapyCL5XWoEJv
         0HznblI94CpAyhCakGMIM7sdSxi22H40iAfplU1V+U5ha+lyEmMZjPPS3YFM8UcxgmRt
         4EA5S2JQIeIW+PfjU7dSf2zIR+AlHoSG39lQKWKRpKxzWDDfcawRyFyyYABBBmrlRxyq
         Gf/TCfVgEtbq32Z2aKDJVrlN59+EmUOaHwlCBtP91sQB7ZwyXFKd/JzFLS9DHJdmNMgm
         HW9g==
X-Forwarded-Encrypted: i=1; AL+hErHEtGhvpxvk1C9bSOrLE8bJxjGKP32M7PdQVvedu2HZ7LvI8IemBDsE17+9B4BWwh4hwhNMpLPMY5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CAMxFzEGAVXK8UOkTBslnD+cNkPoyTd9GnoETxM6ZBW6z24c5
	z8RiiKjKabnQzue/DhoEbdJ2cwC7TZ7EhfPtf1kLzt60zJ59TxPRboJBMgy9fcSg4o8=
X-Gm-Gg: AYBFou0CNW8j0LivY4GlW/Mkp6gxGYCJGWt7MaHZUx5SDN++OmyMIMf8/vNVFTN8iX+
	k0zJx5WU0OsAPf2oaZXzeXgdicXkAOpnGkBGyzJOd5Rt2FJqnMdVRehgX4dHGCHbsSE5xq4aTxz
	k1uOcIIOoeE9JKP9pn+PanheP2w4bn273+vXs40Yii+vSQjtg5HxVrF9760ch6+kufzYJ3c39Uy
	fE+m/yyckzDUhWCPppR5/MQrmtop3A5s8Dzx9gFjfz/b2d463PSTrHaCs6pf532mdaxoP2KYauY
	NONSYP64G0cIVKCe/Ys4ZShxbxpqoIl4+HXP1njLhz+ReXFZqkngFK5THD4te75cQeavjDgdyXc
	kCz0sEHudGm8q6J6G4gDg69SF8bzX5Kl+W0s5IaLwXjx7bRgvgrUxtbCfZYNNTikFu1A1HycB07
	W9igD3Wh0BwCobGV9ogevcHnYQscxLwjOCsc80qRwFsHg1v86PyR4nWaOtbdYnHHoUASf27ZL3q
	VOfguAncYb5PUqh60nddIB30nm1M8rxqX/93lSKmiy4ICzn2dxxPeKq2z2t2uC6txve+f7RuNBL
	jbvfGfZoBIMW8jFW0E42ohkHrqxC52lw
X-Received: by 2002:a17:906:c14e:b0:c50:a7ff:f880 with SMTP id a640c23a62f3a-c510e28dfcamr310805266b.34.1795017299066;
        Wed, 18 Nov 2026 07:54:59 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9f37:bd39:7f19:3b3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51231bc1a2sm20902066b.5.2026.11.18.07.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:54:58 -0800 (PST)
Date: Wed, 18 Nov 2026 09:54:49 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v2 07/11] remoteproc: assign fwnode during vdev
 registration
Message-ID: <av3KSXqeGyazaMR9@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-7-26b300e01c62@valla.it>
 <avyAtmxdbfEBbZ87@p14s>
 <avzS1DiNGmL1Pqmn@bywater>
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
In-Reply-To: <avzS1DiNGmL1Pqmn@bywater>

On Tue, Nov 17, 2026 at 11:29:01PM +0100, Francesco Valla wrote:
> On Tue, Nov 17, 2026 at 10:28:38AM -0600, Mathieu Poirier wrote:
> > On Mon, Nov 02, 2026 at 12:26:44AM +0100, Francesco Valla wrote:
> > > The virtio subsystem already supports a fwnode describing a vdev; search
> > > for a specific node during vdev registration and supply it to the
> > > rproc-virtio platform device that is being registered.
> > > 
> > > A memory-region specified inside that node is also used for the virtio
> > > device if a carveout was not supplied for it through the parent device's
> > > node.
> > > 
> > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > ---
> > >  drivers/remoteproc/remoteproc_core.c   | 48 +++++++++++++++++++++++++++++++---
> > >  drivers/remoteproc/remoteproc_virtio.c | 41 +++++++++++++++++++++++++++++
> > >  2 files changed, 85 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > > index c946ecd980a5..e833853ae7f6 100644
> > > --- a/drivers/remoteproc/remoteproc_core.c
> > > +++ b/drivers/remoteproc/remoteproc_core.c
> > > @@ -440,6 +440,33 @@ void rproc_remove_rvdev(struct rproc_vdev *rvdev)
> > >  	if (rvdev)
> > >  		list_del(&rvdev->node);
> > >  }
> > > +
> > > +static struct fwnode_handle *rproc_get_vdev_fwnode(struct device *dev, u32 idx)
> > > +{
> > > +	struct fwnode_handle *group, *child;
> > > +	u32 reg;
> > > +	int ret;
> > > +
> > > +	group = device_get_named_child_node(dev, "virtio");
> > > +	if (!fwnode_device_is_available(group)) {
> > > +		fwnode_handle_put(group);
> > > +		return NULL;
> > > +	}
> > > +
> > > +	fwnode_for_each_available_child_node(group, child) {
> > > +		ret = fwnode_property_read_u32(child, "reg", &reg);
> > > +		if (ret)
> > > +			continue;
> > > +
> > > +		if (idx == reg)
> > > +			break;
> > > +	}
> > > +
> > > +	fwnode_handle_put(group);
> > > +
> > > +	return child;
> > > +}
> > > +
> > >  /**
> > >   * rproc_handle_vdev() - handle a vdev fw resource
> > >   * @rproc: the remote processor
> > > @@ -475,7 +502,16 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > >  	struct device *dev = &rproc->dev;
> > >  	size_t rsc_size;
> > >  	struct rproc_vdev_data rvdev_data;
> > > +	struct platform_device_info pdev_info = {
> > > +		.parent = dev,
> > > +		.name = "rproc-virtio",
> > > +		.id = PLATFORM_DEVID_AUTO,
> > > +		.data = &rvdev_data,
> > > +		.size_data = sizeof(rvdev_data),
> > > +	};
> > >  	struct platform_device *pdev;
> > > +	struct fwnode_handle *fwnode;
> > > +	int ret = 0;
> > >  
> > >  	/* make sure resource isn't truncated */
> > >  	rsc_size = struct_size(rsc, vring, rsc->num_of_vrings);
> > > @@ -498,20 +534,24 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> > >  	rvdev_data.rsc_offset = offset;
> > >  	rvdev_data.rsc = rsc;
> > >  
> > > +	fwnode = rproc_get_vdev_fwnode(dev->parent, rvdev_data.index);
> > > +	pdev_info.fwnode = fwnode;
> > > +
> > >  	/*
> > >  	 * When there is more than one remote processor, rproc->nb_vdev number is
> > >  	 * same for each separate instances of "rproc". If rvdev_data.index is used
> > >  	 * as device id, then we get duplication in sysfs, so need to use
> > >  	 * PLATFORM_DEVID_AUTO to auto select device id.
> > >  	 */
> > > -	pdev = platform_device_register_data(dev, "rproc-virtio", PLATFORM_DEVID_AUTO, &rvdev_data,
> > > -					     sizeof(rvdev_data));
> > > +	pdev = platform_device_register_full(&pdev_info);
> > >  	if (IS_ERR(pdev)) {
> > >  		dev_err(dev, "failed to create rproc-virtio device\n");
> > > -		return PTR_ERR(pdev);
> > > +		ret = PTR_ERR(pdev);
> > >  	}
> > >  
> > > -	return 0;
> > > +	fwnode_handle_put(fwnode);
> > > +
> > > +	return ret;
> > >  }
> > >
> > >  /**
> > > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > > index 1496659ddff9..950d65480be5 100644
> > > --- a/drivers/remoteproc/remoteproc_virtio.c
> > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > > @@ -13,10 +13,12 @@
> > >  #include <linux/dma-map-ops.h>
> > >  #include <linux/dma-mapping.h>
> > >  #include <linux/export.h>
> > > +#include <linux/of.h>
> > >  #include <linux/of_reserved_mem.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/remoteproc.h>
> > >  #include <linux/rsc_table.h>
> > > +#include <linux/swiotlb.h>
> > >  #include <linux/virtio.h>
> > >  #include <linux/virtio_config.h>
> > >  #include <linux/virtio_ids.h>
> > > @@ -394,6 +396,23 @@ static void rproc_virtio_dev_release(struct device *dev)
> > >  	put_device(&rvdev->pdev->dev);
> > >  }
> > >  
> > > +/*
> > > + * Attach the memory region declared inside the vdev's own devicetree node.
> > > + *
> > > + * A restricted-dma-pool region is attached by of_dma_configure() when the
> > > + * platform device is probed, but it is released together with the virtio
> > > + * device (see rproc_virtio_dev_release()); attach it again if needed, e.g.
> > > + * when the remote processor is restarted during a crash recovery.
> > > + * Any other kind of region (e.g., shared-dma-pool) is attached only here.
> > > + */
> > > +static int rproc_virtio_init_vdev_mem(struct device *dev)
> > > +{
> > > +	if (is_swiotlb_for_alloc(dev))
> > > +		return 0;
> > > +
> > > +	return of_reserved_mem_device_init_by_idx(dev, dev->of_node, 0);
> > > +}
> > > +
> > >  /**
> > >   * rproc_add_virtio_dev() - register an rproc-induced virtio device
> > >   * @rvdev: the remote vdev
> > > @@ -410,6 +429,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> > >  	struct device *dev = &rvdev->pdev->dev;
> > >  	struct virtio_device *vdev;
> > >  	struct rproc_mem_entry *mem;
> > > +	bool has_mem_region;
> > >  	int ret;
> > >  
> > >  	if (rproc->ops->kick == NULL) {
> > > @@ -417,11 +437,24 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> > >  		return -EINVAL;
> > >  	}
> > >  
> > > +	has_mem_region = of_property_present(dev->of_node, "memory-region");
> > > +
> > >  	/* Try to find dedicated vdev buffer carveout */
> > >  	mem = rproc_find_carveout_by_name(rproc, "vdev%dbuffer", rvdev->index);
> > >  	if (mem) {
> > >  		phys_addr_t pa;
> > >  
> > > +		if (has_mem_region) {
> > > +			/*
> > > +			 * The carveout takes precedence: drop the region that
> > > +			 * of_dma_configure() might have attached at probe time.
> > 
> > I don't understand this part - why would someone configure vdevXbuffer with the
> > same name at the rproc and rproc-virtio level?  This should be an error.
> >
> 
> The carveout might come from the remote processor's resource table. I
> was unsure on how to treat it (warning or error) - if you advise for
> the second I'll go that route.
> 

Ok, so this is also related to my for patch [5/11], i.e handling of authentic
rproc-virtio device should follow modern practices.   

> > > +			 */
> > > +			dev_warn(dev,
> > > +				 "vdev%dbuffer carveout found, ignoring memory-region\n",
> > > +				 rvdev->index);
> > > +			of_reserved_mem_device_release(dev);
> > 
> > Who would have called of_reserved_mem_device_init_by_XYZ()?  The remoteproc core
> > or virtio core?  
> > 
> The of_dma_configure() call that is part of the platform DMA
> configuration automatically associates to the device the first
> restricted-dma-pool node referenced by memory-region; see [1].
> 
> This is actually beneficial to the proposed solution, but current
> implementation requires this step to avoid leaking the association (this
> will be required also in case of error, because of_dma_configure() is
> called during the probe).
> 

Ok

> > > +		}
> > > +
> > >  		if (mem->of_resm_idx != -1) {
> > >  			struct device_node *np = rproc->dev.parent->of_node;
> > >  
> > > @@ -451,6 +484,14 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> > >  				return ret;
> > >  			}
> > >  		}
> > > +	} else if (has_mem_region) {
> > > +		/* Use the memory region declared in the vdev's own node */
> > > +		ret = rproc_virtio_init_vdev_mem(dev);
> > > +		if (ret) {
> > > +			dev_err(dev, "Can't associate vdev memory-region: %d\n",
> > > +				ret);
> > > +			return ret;
> > > +		}
> > 
> > Mixing the initialisation of the legacy rproc-virtio and authentic rproc-virtio
> > devices is very confusing.  I think there is value in splitting them, even if it
> > entails some code duplication.
> > 
> 
> Ok, I'll split them for V3.
> 

Please move forward on that.  Since it will introduce a fair amount of churn, I
will simply stop reviewing the current set and wait for V3.  You can remove the
"RFC" tag, we are well past that now.


> > Thanks,
> > Mathieu
> > 
> > >  	} else {
> > >  		struct device_node *np = rproc->dev.parent->of_node;
> > >  
> > > 
> > > -- 
> > > 2.56.0
> > > 
> >
> 
> Thank you!
> 
> Regards,
> Francesco
> 
> 
> [1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/of/device.c#L35
> 
