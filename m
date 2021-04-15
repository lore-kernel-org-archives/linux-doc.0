Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C414C433B4
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 12:58:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD922613B0
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 12:58:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbhDOM6Y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Apr 2021 08:58:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbhDOM6X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Apr 2021 08:58:23 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C991EC061574
        for <linux-doc@vger.kernel.org>; Thu, 15 Apr 2021 05:58:00 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id u20so7879646wmj.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Apr 2021 05:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=r9SO9imqyb1CVP7A7bROSSf70gc+rLBmkml2AZi7GU4=;
        b=lf+HGX0rX0w/Unqp0DjsyYGCV1lkhReavuzS+8F6Uwk+wavNhlvRCfjSI99oILIVdR
         q+yrf8pw1bOGwOHIQPwUoo5WcLxUKY0iFpbSk20wK2lIrRZZvBafs2ebItGe8AVct9Ea
         gDB3cF6z5SetqiRzdULuNHLoBOm3J3HXL8oj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=r9SO9imqyb1CVP7A7bROSSf70gc+rLBmkml2AZi7GU4=;
        b=uO9kM5jELFEt0uuGNNC1Ija/3GTiRPlYgZsr2t4tgxdnpLFGGWUlSPMgq5tZcrEJVd
         BxaIzjAxTJJkuGfo3OCMxnJyuTa/N+hrdMYoMPzp0wvty5Y4zurlUwJEtnFCokue/XdQ
         V6sP032HAb2rGNzinShU4EbO7b59ceX4IdX7xwHzKQdtU2YXFi3YhqkiAedxOBZvPdRh
         BO6l1NU9gck49jOAOeIxHDxJj/Kwexc5snIt9tr4dWxqP2s77qVHroBoneEs4oRTyBGq
         TQZAbOdDFHGdCNYf5Mb49UT630859gRqwoFyZuixTOcMfAdQ1DyYw2Pkq4WA5QkVOJn3
         +Kkg==
X-Gm-Message-State: AOAM5325KL1fXpVCEh7c0edp3zw3/j3CjN8RJYM6Jqxb9SxQqin62mi5
        REXiKzUq4qRVwP3ENb0v4f7YWQ==
X-Google-Smtp-Source: ABdhPJxVfEsaV7SriaiRNYIDv40oDlz6f2NtWDDFdlY0wsNNb1lD+k7kMrEchG6I6hQWHLlz+y6U8Q==
X-Received: by 2002:a1c:c246:: with SMTP id s67mr2993882wmf.86.1618491478646;
        Thu, 15 Apr 2021 05:57:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 2sm886599wmi.19.2021.04.15.05.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 05:57:57 -0700 (PDT)
Date:   Thu, 15 Apr 2021 14:57:55 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com,
        broonie@kernel.org, sam@ravnborg.org, robh@kernel.org,
        emil.l.velikov@gmail.com, geert+renesas@glider.be,
        hdegoede@redhat.com, bluescreen_avenger@verizon.net,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v2 04/10] drm/aperture: Add infrastructure for aperture
 ownership
Message-ID: <YHg4Ux7L3FTV45ST@phenom.ffwll.local>
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-5-tzimmermann@suse.de>
 <YG7RgQfj0yZHbL6L@phenom.ffwll.local>
 <a787dde9-70b0-cb38-f2bf-6e7b479525f9@suse.de>
 <YHAc3vdstgJzIAEL@phenom.ffwll.local>
 <0996ac00-9f7f-27ca-8b14-b551feff8ce4@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0996ac00-9f7f-27ca-8b14-b551feff8ce4@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 15, 2021 at 08:56:20AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 09.04.21 um 11:22 schrieb Daniel Vetter:
> > > Is it that easy? simepldrm's detach function has code to synchronize with
> > > concurrent hotplug removals. If we can use drm_dev_unplug() for everything,
> > > I'm all for it.
> > 
> > Uh, I should have looked at the code instead of just asking silly
> > questions :-)
> > 
> > Now I'm even more scared, and also more convinced that we're recreating
> a
> > bad version of some of the core driver model concepts.
> > 
> > I think the ideal option here would be if drm_aperture could unload
> > (unbind really) the platform driver for us, through the driver model. Then
> > there's only one place that keeps track whether the driver is unbound or
> > not. I'm not sure whether this can be done fully generic on a struct
> > device, or whether we need special code for each type. Since atm we only
> > have simpledrm we can just specialize on platform_device and it's good
> > enough.
> 
> I meanwhile found that calling platform_device_unregister() is the right
> thing to do. It is like a hot-unplug event. It's simple to implement and
> removes the generic device as well. Any memory ranges for the generic device
> are gone as well. Only the native driver's native device will remain. That's
> better than the existing simplefb driver.

That sounds great.

> Which unregister function to call still driver-specific, so I kept the
> callback.

Could we have the callback in core code, and you do something like
drm_aperture_acquire_platform (and later on drm_aperture_acquire_pci or
whatever, although tbh I'm not sure we ever get anything else than
platform). That function can do a runtime check that drm_device->dev is
actually a platform dev.

Another idea: Do the runtime casting in the core without anything? Atm we
have platform that needs support, maybe pci device, so we could easily
extend this and just let it do the right thing. Then no callback is
needed. I.e.

	if (is_platform_dev(drm_device->dev))
		platform_device_unregister(drm_device->dev);
	else
		WARN(1, "not yet implemented\n");

or something like that.

I just find the callback to essentially unregister a device a bit
redundant.
-Daniel

> 
> Best regards
> Thomas
> 
> > 
> > I think best here would be to Cc: gregkh on this patch and the simpledrm
> > ->detach implementatation, and ask for his feedback as driver model
> > maintainer. Maybe if you could hack together the platform_device unbind
> > path as proof of concept would be even better.
> > 
> > Either way, this is really tricky.
> > -Daniel
> > 
> > > 
> > > Best regards
> > > Thomas
> > > 
> > > > 
> > > > Or maybe we should tie this more into the struct device mode and force an
> > > > unload that way? That way devm cleanup would work as one expects, and
> > > > avoid the need for anything specific (hopefully) in this detach callback.
> > > > 
> > > > Just feels a bit like we're reinventing half of the driver model here,
> > > > badly.
> > > > 
> > > > > + *	};
> > > > > + *
> > > > > + *	static int acquire_framebuffers(struct drm_device *dev, struct pci_dev *pdev)
> > > > > + *	{
> > > > > + *		resource_size_t start, len;
> > > > > + *		struct drm_aperture *ap;
> > > > > + *
> > > > > + *		base = pci_resource_start(pdev, 0);
> > > > > + *		size = pci_resource_len(pdev, 0);
> > > > > + *
> > > > > + *		ap = devm_acquire_aperture(dev, base, size, &ap_funcs);
> > > > > + *		if (IS_ERR(ap))
> > > > > + *			return PTR_ERR(ap);
> > > > > + *
> > > > > + *		return 0;
> > > > > + *	}
> > > > > + *
> > > > > + *	static int probe(struct pci_dev *pdev)
> > > > > + *	{
> > > > > + *		struct drm_device *dev;
> > > > > + *		int ret;
> > > > > + *
> > > > > + *		// ... Initialize the device...
> > > > > + *		dev = devm_drm_dev_alloc();
> > > > > + *		...
> > > > > + *
> > > > > + *		// ... and acquire ownership of the framebuffer.
> > > > > + *		ret = acquire_framebuffers(dev, pdev);
> > > > > + *		if (ret)
> > > > > + *			return ret;
> > > > > + *
> > > > > + *		drm_dev_register();
> > > > > + *
> > > > > + *		return 0;
> > > > > + *	}
> > > > > + *
> > > > > + * The generic driver is now subject to forced removal by other drivers. This
> > > > > + * is when the detach function in struct &drm_aperture_funcs comes into play.
> > > > > + * When a driver calls drm_fb_helper_remove_conflicting_framebuffers() et al
> > > > > + * for the registered framebuffer range, the DRM core calls struct
> > > > > + * &drm_aperture_funcs.detach and the generic driver has to onload itself. It
> > > > > + * may not access the device's registers, framebuffer memory, ROM, etc after
> > > > > + * detach returned. If the driver supports hotplugging, detach can be treated
> > > > > + * like an unplug event.
> > > > > + *
> > > > > + * .. code-block:: c
> > > > > + *
> > > > > + *	static void detach_from_device(struct drm_device *dev,
> > > > > + *				       resource_size_t base,
> > > > > + *				       resource_size_t size)
> > > > > + *	{
> > > > > + *		// Signal unplug
> > > > > + *		drm_dev_unplug(dev);
> > > > > + *
> > > > > + *		// Maybe do other clean-up operations
> > > > > + *		...
> > > > > + *	}
> > > > > + *
> > > > > + *	static struct drm_aperture_funcs ap_funcs = {
> > > > > + *		.detach = detach_from_device,
> > > > > + *	};
> > > > > + */
> > > > > +
> > > > > +/**
> > > > > + * struct drm_aperture - Represents a DRM framebuffer aperture
> > > > > + *
> > > > > + * This structure has no public fields.
> > > > > + */
> > > > > +struct drm_aperture {
> > > > > +	struct drm_device *dev;
> > > > > +	resource_size_t base;
> > > > > +	resource_size_t size;
> > > > > +
> > > > > +	const struct drm_aperture_funcs *funcs;
> > > > > +
> > > > > +	struct list_head lh;
> > > > > +};
> > > > > +
> > > > > +static LIST_HEAD(drm_apertures);
> > > > > +
> > > > > +static DEFINE_MUTEX(drm_apertures_lock);
> > > > > +
> > > > > +static bool overlap(resource_size_t base1, resource_size_t end1,
> > > > > +		    resource_size_t base2, resource_size_t end2)
> > > > > +{
> > > > > +	return (base1 < end2) && (end1 > base2);
> > > > > +}
> > > > > +
> > > > > +static void devm_aperture_acquire_release(void *data)
> > > > > +{
> > > > > +	struct drm_aperture *ap = data;
> > > > > +	bool detached = !ap->dev;
> > > > > +
> > > > > +	if (!detached)
> > > > 
> > > > Uh this needs a comment that if ap->dev is NULL then we're called from
> > > > drm_aperture_detach_drivers() and hence the lock is already held.
> > > > 
> > > > > +		mutex_lock(&drm_apertures_lock);
> > > > 
> > > > and an
> > > > 
> > > > 	else
> > > > 		locdep_assert_held(&drm_apertures_lock);
> > > > 
> > > > here to check that. I was scratching my head first quite a bit how you'd
> > > > solve the deadlock, this is a neat solution (much simpler than anything I
> > > > came up with in my head). But needs comments.
> > > > 
> > > > > +
> > > > > +	list_del(&ap->lh);
> > > > > +
> > > > > +	if (!detached)
> > > > > +		mutex_unlock(&drm_apertures_lock);
> > > > > +}
> > > > > +
> > > > > +/**
> > > > > + * devm_aperture_acquire - Acquires ownership of a framebuffer on behalf of a DRM driver.
> > > > > + * @dev:	the DRM device to own the framebuffer memory
> > > > > + * @base:	the framebuffer's byte offset in physical memory
> > > > > + * @size:	the framebuffer size in bytes
> > > > > + * @funcs:	callback functions
> > > > > + *
> > > > > + * Installs the given device as the new owner. The function fails if the
> > > > > + * framebuffer range, or parts of it, is currently owned by
> > > > > another
> driver.
> > > > > + * To evict current owners, callers should use
> > > > > + * drm_fb_helper_remove_conflicting_framebuffers() et al. before calling this
> > > > > + * function. Acquired apertures are released automatically if the underlying
> > > > > + * device goes away.
> > > > > + *
> > > > > + * Returns:
> > > > > + * An instance of struct &drm_aperture on success, or a pointer-encoded
> > > > > + * errno value otherwise.
> > > > > + */
> > > > > +struct drm_aperture *
> > > > > +devm_aperture_acquire(struct drm_device *dev,
> > > > > +		      resource_size_t base, resource_size_t size,
> > > > > +		      const struct drm_aperture_funcs *funcs)
> > > > > +{
> > > > > +	size_t end = base + size;
> > > > > +	struct list_head *pos;
> > > > > +	struct drm_aperture *ap;
> > > > > +	int ret;
> > > > > +
> > > > > +	mutex_lock(&drm_apertures_lock);
> > > > > +
> > > > > +	list_for_each(pos, &drm_apertures) {
> > > > > +		ap = container_of(pos, struct drm_aperture, lh);
> > > > > +		if (overlap(base, end, ap->base, ap->base + ap->size))
> > > > > +			return ERR_PTR(-EBUSY);
> > > > > +	}
> > > > > +
> > > > > +	ap = devm_kzalloc(dev->dev, sizeof(*ap), GFP_KERNEL);
> > > > > +	if (!ap)
> > > > > +		return ERR_PTR(-ENOMEM);
> > > > > +
> > > > > +	ap->dev = dev;
> > > > > +	ap->base = base;
> > > > > +	ap->size = size;
> > > > > +	ap->funcs = funcs;
> > > > > +	INIT_LIST_HEAD(&ap->lh);
> > > > > +
> > > > > +	list_add(&ap->lh, &drm_apertures);
> > > > > +
> > > > > +	mutex_unlock(&drm_apertures_lock);
> > > > > +
> > > > > +	ret = devm_add_action_or_reset(dev->dev, devm_aperture_acquire_release, ap);
> > > > > +	if (ret)
> > > > > +		return ERR_PTR(ret);
> > > > > +
> > > > > +	return ap;
> > > > > +}
> > > > > +EXPORT_SYMBOL(devm_aperture_acquire);
> > > > > +
> > > > > +void drm_aperture_detach_drivers(resource_size_t base, resource_size_t size)
> > > > > +{
> > > > > +	resource_size_t end = base + size;
> > > > > +	struct list_head *pos, *n;
> > > > > +
> > > > > +	mutex_lock(&drm_apertures_lock);
> > > > > +
> > > > > +	list_for_each_safe(pos, n, &drm_apertures) {
> > > > > +		struct drm_aperture *ap =
> > > > > +			container_of(pos, struct drm_aperture, lh);
> > > > > +		struct drm_device *dev = ap->dev;
> > > > > +
> > > > > +		if (!overlap(base, end, ap->base, ap->base + ap->size))
> > > > > +			continue;
> > > > > +
> > > > > +		ap->dev = NULL; /* detach from device */
> > > > > +		if (drm_WARN_ON(dev, !ap->funcs->detach))
> > > > > +			continue;
> > > > > +		ap->funcs->detach(dev, ap->base, ap->size);
> > > > > +	}
> > > > > +
> > > > > +	mutex_unlock(&drm_apertures_lock);
> > > > > +}
> > > > > +EXPORT_SYMBOL(drm_aperture_detach_drivers);
> > > > 
> > > > Is this just exported because of the inline functions in the
> > > > headers?
> Imo
> > > > better to make them proper functions (they're big after your patch&not
> > > > perf critical, so not good candidates for inlining anyway).
> > > > 
> > > > > diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h
> > > > > index 13766efe9517..696cec75ef78 100644
> > > > > --- a/include/drm/drm_aperture.h
> > > > > +++ b/include/drm/drm_aperture.h
> > > > > @@ -4,8 +4,30 @@
> > > > >    #define _DRM_APERTURE_H_
> > > > >    #include <linux/fb.h>
> > > > > +#include <linux/pci.h>
> > > > >    #include <linux/vgaarb.h>
> > > > > +struct drm_aperture;
> > > > > +struct drm_device;
> > > > > +
> > > > > +struct drm_aperture_funcs {
> > > > > +	void (*detach)(struct drm_device *dev, resource_size_t base, resource_size_t size);
> > > > > +};
> > > > > +
> > > > > +struct drm_aperture *
> > > > > +devm_aperture_acquire(struct drm_device *dev,
> > > > > +		      resource_size_t base, resource_size_t size,
> > > > > +		      const struct drm_aperture_funcs *funcs);
> > > > > +
> > > > > +#if defined(CONFIG_DRM_APERTURE)
> > > > > +void drm_aperture_detach_drivers(resource_size_t base, resource_size_t size);
> > > > > +#else
> > > > > +static inline void
> > > > > +drm_aperture_detach_drivers(resource_size_t base, resource_size_t size)
> > > > > +{
> > > > > +}
> > > > > +#endif
> > > > > +
> > > > >    /**
> > > > >     * drm_fb_helper_remove_conflicting_framebuffers - remove firmware-configured framebuffers
> > > > >     * @a: memory range, users of which are to be removed
> > > > > @@ -20,6 +42,11 @@ static inline int
> > > > >    drm_fb_helper_remove_conflicting_framebuffers(struct apertures_struct *a,
> > > > >    					      const char *name, bool primary)
> > > > >    {
> > > > > +	int i;
> > > > > +
> > > > > +	for (i = 0; i < a->count; ++i)
> > > > > +		drm_aperture_detach_drivers(a->ranges[i].base, a->ranges[i].size);
> > > > > +
> > > > >    #if IS_REACHABLE(CONFIG_FB)
> > > > >    	return remove_conflicting_framebuffers(a, name, primary);
> > > > >    #else
> > > > > @@ -43,7 +70,16 @@ static inline int
> > > > >    drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
> > > > >    						  const char *name)
> > > > >    {
> > > > > -	int ret = 0;
> > > > > +	resource_size_t base, size;
> > > > > +	int bar, ret = 0;
> > > > > +
> > > > > +	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
> > > > > +		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
> > > > > +			continue;
> > > > > +		base = pci_resource_start(pdev, bar);
> > > > > +		size = pci_resource_len(pdev, bar);
> > > > > +		drm_aperture_detach_drivers(base, size);
> > > > > +	}
> > > > >    	/*
> > > > >    	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
> > > > > -- 
> > > > > 2.30.1
> > > > > 
> > > > 
> > > 
> > > -- 
> > > Thomas Zimmermann
> > > Graphics Driver Developer
> > > SUSE Software Solutions Germany GmbH
> > > Maxfeldstr. 5, 90409 Nürnberg, Germany
> > > (HRB 36809, AG Nürnberg)
> > > Geschäftsführer: Felix Imendörffer
> > > 
> > 
> > 
> > 
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer
> 




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
