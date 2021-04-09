Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7295FC433B4
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 09:22:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3182D611C9
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 09:22:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbhDIJW5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Apr 2021 05:22:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230181AbhDIJW4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Apr 2021 05:22:56 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03818C061760
        for <linux-doc@vger.kernel.org>; Fri,  9 Apr 2021 02:22:43 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id f12so4962457wro.0
        for <linux-doc@vger.kernel.org>; Fri, 09 Apr 2021 02:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=vLvBXXNW9anasakQAr8qQLcWcSFiTRvgGWu5WLKs3rk=;
        b=OgsIEelzOm3+bjqC2BAMMEbU3mdKUY4rN//VNlYBl++Lq46Ke2tfQCeeIl6D5liv0A
         syEdFvS+Ov4v6hjl2EdRV4K2tkYI+yZzuHbsNfTmF8ysUsS+23QtCEac2xoGJKp6eqSc
         7KLxMwOc+EoWb6RAPAZhbjPk+OMKcSAIPnAsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vLvBXXNW9anasakQAr8qQLcWcSFiTRvgGWu5WLKs3rk=;
        b=Dst+yZL45e0PoH3oUs2ChdrSfzmqi8+0zFd8fA5s2fYdKd5Vcafx+IMlNq4D5G13mS
         mN15bAxRLAoj5hBxSSvPykEgLi55n2oBPe9I8ngqPoDkaRvGcMbf+4MubC+wVmxwEZQ+
         lkwd5YKb2XudWualq2395reNPSO7x4Rz0tSzNaIy+MK89h/yIa9u0iMulaiHBST14lOX
         YQfVBxhQP7ToMV0NcAtDJbv4NTryE+zYTSzUk6Hicism8pLVDqAXxkYKWVfDbaxeY/pQ
         SmmcKb3l0+K/gsWh3bAPykjTUQipUoJEPNjCHlN62NLlhj96/SQvug7+2FQhJwj9CPRt
         86cg==
X-Gm-Message-State: AOAM533xet9xub94u6NBAeUmLfMJgfIKtvLEDDJHqoutEwf5FEkTjVY9
        mlRGgnbMEsjG1l2s612J0tVhFw==
X-Google-Smtp-Source: ABdhPJzf/ThGjTEWF4IYBosfUTP08Trlj6uVf2xa8DV5u1irOInL3zHkM19FAMZ7rfBdfElplD7GEg==
X-Received: by 2002:a5d:4884:: with SMTP id g4mr16594801wrq.191.1617960161670;
        Fri, 09 Apr 2021 02:22:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id f9sm2981589wmj.38.2021.04.09.02.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 02:22:40 -0700 (PDT)
Date:   Fri, 9 Apr 2021 11:22:38 +0200
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
Message-ID: <YHAc3vdstgJzIAEL@phenom.ffwll.local>
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-5-tzimmermann@suse.de>
 <YG7RgQfj0yZHbL6L@phenom.ffwll.local>
 <a787dde9-70b0-cb38-f2bf-6e7b479525f9@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a787dde9-70b0-cb38-f2bf-6e7b479525f9@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 09, 2021 at 09:06:56AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 08.04.21 um 11:48 schrieb Daniel Vetter:
> > 
> > Maybe just me, but to avoid overstretching the attention spawn of doc
> > readers I'd avoid this example here. And maybe make the recommendation
> > stronger, e.g. "PCI device drivers can avoid open-coding
> > remove_conflicting_framebuffers() by calling
> > drm_fb_helper_remove_conflicting_pci_framebuffers()."
> 
> It's a tutorial. In my expectation, everyone just copies the tutorial code
> and fills the gaps.

Sure, but we also have default functions for most common cases, so most
people just end up copypasting the single function call. Feels like
overkill to have a tutorial for that.

Imo tutorial/pseudo-code are good if there's more involved code flow that
many places need to copypaste and customize. Or to show how different
functions work together collectively. This doesn't quite feel like it's
clearing that bar.

And please don't get me wrong, solid docs is great. It's just that I think
we need to have reader's attention span in mind too (and mine personally
might be on the extremely short side here) to make sure our docs are
effective at conveying information.

> > > + *
> > > + * .. code-block:: c
> > > + *
> > > + *	static int probe(struct pci_dev *pdev)
> > > + *	{
> > > + *		int ret;
> > > + *
> > > + *		// Remove any generic drivers...
> > > + *		ret = drm_fb_helper_remove_conflicting_pci_framebuffers(pdev, "example driver");
> > > + *		if (ret)
> > > + *			return ret;
> > > + *
> > > + *		// ... and initialize the hardware.
> > > + *		...
> > > + *
> > > + *		drm_dev_register();
> > > + *
> > > + *		return 0;
> > > + *	}
> > > + *
> > > + * Drivers that are susceptible to being removed be other drivers, such as
> > > + * generic EFI or VESA drivers, have to register themselves as owners of their
> > > + * given framebuffer memory. Ownership of the framebuffer memory is achived
> > > + * by calling devm_aperture_acquire(). On success, the driver is the owner
> > > + * of the framebuffer range. The function fails if the framebuffer is already
> > > + * by another driver. See below for an example.
> > > + *
> > > + * .. code-block:: c
> > > + *
> > > + *	static struct drm_aperture_funcs ap_funcs = {
> > > + *		.detach = ...
> > 
> > Is there really value in allowing/forcing drivers to set up their own
> > detach ops? You already make this specific to struct drm_device, an
> > implementation that just calls drm_dev_unplug feels like the right thing
> > to do?
> 
> Is it that easy? simepldrm's detach function has code to synchronize with
> concurrent hotplug removals. If we can use drm_dev_unplug() for everything,
> I'm all for it.

Uh, I should have looked at the code instead of just asking silly
questions :-)

Now I'm even more scared, and also more convinced that we're recreating a
bad version of some of the core driver model concepts.

I think the ideal option here would be if drm_aperture could unload
(unbind really) the platform driver for us, through the driver model. Then
there's only one place that keeps track whether the driver is unbound or
not. I'm not sure whether this can be done fully generic on a struct
device, or whether we need special code for each type. Since atm we only
have simpledrm we can just specialize on platform_device and it's good
enough.

I think best here would be to Cc: gregkh on this patch and the simpledrm
->detach implementatation, and ask for his feedback as driver model
maintainer. Maybe if you could hack together the platform_device unbind
path as proof of concept would be even better.

Either way, this is really tricky.
-Daniel

> 
> Best regards
> Thomas
> 
> > 
> > Or maybe we should tie this more into the struct device mode and force an
> > unload that way? That way devm cleanup would work as one expects, and
> > avoid the need for anything specific (hopefully) in this detach callback.
> > 
> > Just feels a bit like we're reinventing half of the driver model here,
> > badly.
> > 
> > > + *	};
> > > + *
> > > + *	static int acquire_framebuffers(struct drm_device *dev, struct pci_dev *pdev)
> > > + *	{
> > > + *		resource_size_t start, len;
> > > + *		struct drm_aperture *ap;
> > > + *
> > > + *		base = pci_resource_start(pdev, 0);
> > > + *		size = pci_resource_len(pdev, 0);
> > > + *
> > > + *		ap = devm_acquire_aperture(dev, base, size, &ap_funcs);
> > > + *		if (IS_ERR(ap))
> > > + *			return PTR_ERR(ap);
> > > + *
> > > + *		return 0;
> > > + *	}
> > > + *
> > > + *	static int probe(struct pci_dev *pdev)
> > > + *	{
> > > + *		struct drm_device *dev;
> > > + *		int ret;
> > > + *
> > > + *		// ... Initialize the device...
> > > + *		dev = devm_drm_dev_alloc();
> > > + *		...
> > > + *
> > > + *		// ... and acquire ownership of the framebuffer.
> > > + *		ret = acquire_framebuffers(dev, pdev);
> > > + *		if (ret)
> > > + *			return ret;
> > > + *
> > > + *		drm_dev_register();
> > > + *
> > > + *		return 0;
> > > + *	}
> > > + *
> > > + * The generic driver is now subject to forced removal by other drivers. This
> > > + * is when the detach function in struct &drm_aperture_funcs comes into play.
> > > + * When a driver calls drm_fb_helper_remove_conflicting_framebuffers() et al
> > > + * for the registered framebuffer range, the DRM core calls struct
> > > + * &drm_aperture_funcs.detach and the generic driver has to onload itself. It
> > > + * may not access the device's registers, framebuffer memory, ROM, etc after
> > > + * detach returned. If the driver supports hotplugging, detach can be treated
> > > + * like an unplug event.
> > > + *
> > > + * .. code-block:: c
> > > + *
> > > + *	static void detach_from_device(struct drm_device *dev,
> > > + *				       resource_size_t base,
> > > + *				       resource_size_t size)
> > > + *	{
> > > + *		// Signal unplug
> > > + *		drm_dev_unplug(dev);
> > > + *
> > > + *		// Maybe do other clean-up operations
> > > + *		...
> > > + *	}
> > > + *
> > > + *	static struct drm_aperture_funcs ap_funcs = {
> > > + *		.detach = detach_from_device,
> > > + *	};
> > > + */
> > > +
> > > +/**
> > > + * struct drm_aperture - Represents a DRM framebuffer aperture
> > > + *
> > > + * This structure has no public fields.
> > > + */
> > > +struct drm_aperture {
> > > +	struct drm_device *dev;
> > > +	resource_size_t base;
> > > +	resource_size_t size;
> > > +
> > > +	const struct drm_aperture_funcs *funcs;
> > > +
> > > +	struct list_head lh;
> > > +};
> > > +
> > > +static LIST_HEAD(drm_apertures);
> > > +
> > > +static DEFINE_MUTEX(drm_apertures_lock);
> > > +
> > > +static bool overlap(resource_size_t base1, resource_size_t end1,
> > > +		    resource_size_t base2, resource_size_t end2)
> > > +{
> > > +	return (base1 < end2) && (end1 > base2);
> > > +}
> > > +
> > > +static void devm_aperture_acquire_release(void *data)
> > > +{
> > > +	struct drm_aperture *ap = data;
> > > +	bool detached = !ap->dev;
> > > +
> > > +	if (!detached)
> > 
> > Uh this needs a comment that if ap->dev is NULL then we're called from
> > drm_aperture_detach_drivers() and hence the lock is already held.
> > 
> > > +		mutex_lock(&drm_apertures_lock);
> > 
> > and an
> > 
> > 	else
> > 		locdep_assert_held(&drm_apertures_lock);
> > 
> > here to check that. I was scratching my head first quite a bit how you'd
> > solve the deadlock, this is a neat solution (much simpler than anything I
> > came up with in my head). But needs comments.
> > 
> > > +
> > > +	list_del(&ap->lh);
> > > +
> > > +	if (!detached)
> > > +		mutex_unlock(&drm_apertures_lock);
> > > +}
> > > +
> > > +/**
> > > + * devm_aperture_acquire - Acquires ownership of a framebuffer on behalf of a DRM driver.
> > > + * @dev:	the DRM device to own the framebuffer memory
> > > + * @base:	the framebuffer's byte offset in physical memory
> > > + * @size:	the framebuffer size in bytes
> > > + * @funcs:	callback functions
> > > + *
> > > + * Installs the given device as the new owner. The function fails if the
> > > + * framebuffer range, or parts of it, is currently owned by another driver.
> > > + * To evict current owners, callers should use
> > > + * drm_fb_helper_remove_conflicting_framebuffers() et al. before calling this
> > > + * function. Acquired apertures are released automatically if the underlying
> > > + * device goes away.
> > > + *
> > > + * Returns:
> > > + * An instance of struct &drm_aperture on success, or a pointer-encoded
> > > + * errno value otherwise.
> > > + */
> > > +struct drm_aperture *
> > > +devm_aperture_acquire(struct drm_device *dev,
> > > +		      resource_size_t base, resource_size_t size,
> > > +		      const struct drm_aperture_funcs *funcs)
> > > +{
> > > +	size_t end = base + size;
> > > +	struct list_head *pos;
> > > +	struct drm_aperture *ap;
> > > +	int ret;
> > > +
> > > +	mutex_lock(&drm_apertures_lock);
> > > +
> > > +	list_for_each(pos, &drm_apertures) {
> > > +		ap = container_of(pos, struct drm_aperture, lh);
> > > +		if (overlap(base, end, ap->base, ap->base + ap->size))
> > > +			return ERR_PTR(-EBUSY);
> > > +	}
> > > +
> > > +	ap = devm_kzalloc(dev->dev, sizeof(*ap), GFP_KERNEL);
> > > +	if (!ap)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	ap->dev = dev;
> > > +	ap->base = base;
> > > +	ap->size = size;
> > > +	ap->funcs = funcs;
> > > +	INIT_LIST_HEAD(&ap->lh);
> > > +
> > > +	list_add(&ap->lh, &drm_apertures);
> > > +
> > > +	mutex_unlock(&drm_apertures_lock);
> > > +
> > > +	ret = devm_add_action_or_reset(dev->dev, devm_aperture_acquire_release, ap);
> > > +	if (ret)
> > > +		return ERR_PTR(ret);
> > > +
> > > +	return ap;
> > > +}
> > > +EXPORT_SYMBOL(devm_aperture_acquire);
> > > +
> > > +void drm_aperture_detach_drivers(resource_size_t base, resource_size_t size)
> > > +{
> > > +	resource_size_t end = base + size;
> > > +	struct list_head *pos, *n;
> > > +
> > > +	mutex_lock(&drm_apertures_lock);
> > > +
> > > +	list_for_each_safe(pos, n, &drm_apertures) {
> > > +		struct drm_aperture *ap =
> > > +			container_of(pos, struct drm_aperture, lh);
> > > +		struct drm_device *dev = ap->dev;
> > > +
> > > +		if (!overlap(base, end, ap->base, ap->base + ap->size))
> > > +			continue;
> > > +
> > > +		ap->dev = NULL; /* detach from device */
> > > +		if (drm_WARN_ON(dev, !ap->funcs->detach))
> > > +			continue;
> > > +		ap->funcs->detach(dev, ap->base, ap->size);
> > > +	}
> > > +
> > > +	mutex_unlock(&drm_apertures_lock);
> > > +}
> > > +EXPORT_SYMBOL(drm_aperture_detach_drivers);
> > 
> > Is this just exported because of the inline functions in the headers? Imo
> > better to make them proper functions (they're big after your patch&not
> > perf critical, so not good candidates for inlining anyway).
> > 
> > > diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h
> > > index 13766efe9517..696cec75ef78 100644
> > > --- a/include/drm/drm_aperture.h
> > > +++ b/include/drm/drm_aperture.h
> > > @@ -4,8 +4,30 @@
> > >   #define _DRM_APERTURE_H_
> > >   #include <linux/fb.h>
> > > +#include <linux/pci.h>
> > >   #include <linux/vgaarb.h>
> > > +struct drm_aperture;
> > > +struct drm_device;
> > > +
> > > +struct drm_aperture_funcs {
> > > +	void (*detach)(struct drm_device *dev, resource_size_t base, resource_size_t size);
> > > +};
> > > +
> > > +struct drm_aperture *
> > > +devm_aperture_acquire(struct drm_device *dev,
> > > +		      resource_size_t base, resource_size_t size,
> > > +		      const struct drm_aperture_funcs *funcs);
> > > +
> > > +#if defined(CONFIG_DRM_APERTURE)
> > > +void drm_aperture_detach_drivers(resource_size_t base, resource_size_t size);
> > > +#else
> > > +static inline void
> > > +drm_aperture_detach_drivers(resource_size_t base, resource_size_t size)
> > > +{
> > > +}
> > > +#endif
> > > +
> > >   /**
> > >    * drm_fb_helper_remove_conflicting_framebuffers - remove firmware-configured framebuffers
> > >    * @a: memory range, users of which are to be removed
> > > @@ -20,6 +42,11 @@ static inline int
> > >   drm_fb_helper_remove_conflicting_framebuffers(struct apertures_struct *a,
> > >   					      const char *name, bool primary)
> > >   {
> > > +	int i;
> > > +
> > > +	for (i = 0; i < a->count; ++i)
> > > +		drm_aperture_detach_drivers(a->ranges[i].base, a->ranges[i].size);
> > > +
> > >   #if IS_REACHABLE(CONFIG_FB)
> > >   	return remove_conflicting_framebuffers(a, name, primary);
> > >   #else
> > > @@ -43,7 +70,16 @@ static inline int
> > >   drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
> > >   						  const char *name)
> > >   {
> > > -	int ret = 0;
> > > +	resource_size_t base, size;
> > > +	int bar, ret = 0;
> > > +
> > > +	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
> > > +		if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))
> > > +			continue;
> > > +		base = pci_resource_start(pdev, bar);
> > > +		size = pci_resource_len(pdev, bar);
> > > +		drm_aperture_detach_drivers(base, size);
> > > +	}
> > >   	/*
> > >   	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
> > > -- 
> > > 2.30.1
> > > 
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
