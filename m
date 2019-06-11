Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7EC287D913
	for <lwn-linux-doc@archive.lwn.net>; Tue, 11 Jun 2019 20:56:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406688AbfFKU4w (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 11 Jun 2019 16:56:52 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:55809 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406036AbfFKU4w (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Jun 2019 16:56:52 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 9DCDE2003C;
        Tue, 11 Jun 2019 22:56:46 +0200 (CEST)
Date:   Tue, 11 Jun 2019 22:56:45 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, Zain Wang <wzz@rock-chips.com>,
        Jonathan Corbet <corbet@lwn.net>,
        David Airlie <airlied@linux.ie>, linux-doc@vger.kernel.org,
        Jose Souza <jose.souza@intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH v5 05/11] drm: Add helpers to kick off self refresh mode
 in drivers
Message-ID: <20190611205645.GB18315@ravnborg.org>
References: <20190611160844.257498-1-sean@poorly.run>
 <20190611160844.257498-6-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611160844.257498-6-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=cm27Pg_UAAAA:8
        a=e5mUnYsNAAAA:8 a=XvEOI8gEYBJ6QEm4CnUA:9 a=CjuIK1q_8ugA:10
        a=xmb-EsYY8bH0VWELuYED:22 a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Sean.

Small things here and there. Did not stare at this long enough to
understand the code, but added some feedback anyway.

	Sam
>  
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index d36feb4a62330..9d630a28a7880 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -43,7 +43,7 @@ drm_kms_helper-y := drm_crtc_helper.o drm_dp_helper.o drm_dsc.o drm_probe_helper
>  		drm_simple_kms_helper.o drm_modeset_helper.o \
>  		drm_scdc_helper.o drm_gem_framebuffer_helper.o \
>  		drm_atomic_state_helper.o drm_damage_helper.o \
> -		drm_format_helper.o
> +		drm_format_helper.o drm_self_refresh_helper.o

We really should have only one .o file per line and sort them.
The current way to do things is asking for conflicts.
Anyway, that battle is for another day.

> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index e58be69960692..bc43cc08cdc11 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -33,6 +33,7 @@
>  #include <drm/drm_damage_helper.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_plane_helper.h>
> +#include <drm/drm_self_refresh_helper.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/drm_writeback.h>
Please add header file in alphabetic order.
It goes below drm_print.h

> --- /dev/null
> +++ b/drivers/gpu/drm/drm_self_refresh_helper.c
> @@ -0,0 +1,213 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright (C) 2019 Google, Inc.
> + *
> + * Authors:
> + * Sean Paul <seanpaul@chromium.org>
> + */
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_connector.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_mode_config.h>
> +#include <drm/drm_modeset_lock.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_self_refresh_helper.h>
> +#include <linux/bitops.h>
> +#include <linux/slab.h>
> +#include <linux/workqueue.h>

Nit:
Typical include order is:

#include <linux/*>

#include <drm/*>

#include "*"

With an empty lines between the blocks.
And sorted within the block.

> +
> +/**
> + * DOC: overview
> + *
> + * This helper library provides an easy way for drivers to leverage the atomic
> + * framework to implement panel self refresh (SR) support. Drivers are
> + * responsible for initializing and cleaning up the SR helpers on load/unload
> + * (see &drm_self_refresh_helper_init/&drm_self_refresh_helper_cleanup).
> + * The connector is responsible for setting
> + * &drm_connector_state.self_refresh_aware to true at runtime if it is SR-aware
> + * (meaning it knows how to initiate self refresh on the panel).
> + *
> + * Once a crtc has enabled SR using &drm_self_refresh_helper_init, the
> + * helpers will monitor activity and call back into the driver to enable/disable
> + * SR as appropriate. The best way to think about this is that it's a DPMS
> + * on/off request with &drm_crtc_state.self_refresh_active set in crtc state
> + * that tells you to disable/enable SR on the panel instead of power-cycling it.
> + *
> + * During SR, drivers may choose to fully disable their crtc/encoder/bridge
> + * hardware (in which case no driver changes are necessary), or they can inspect
> + * &drm_crtc_state.self_refresh_active if they want to enter low power mode
> + * without full disable (in case full disable/enable is too slow).
> + *
> + * SR will be deactivated if there are any atomic updates affecting the
> + * pipe that is in SR mode. If a crtc is driving multiple connectors, all
> + * connectors must be SR aware and all will enter/exit SR mode at the same time.
> + *
> + * If the crtc and connector are SR aware, but the panel connected does not
> + * support it (or is otherwise unable to enter SR), the driver should fail
> + * atomic_check when &drm_crtc_state.self_refresh_active is true.
> + */
> +
> +struct drm_self_refresh_data {
> +	struct drm_crtc *crtc;
> +	struct delayed_work entry_work;
> +	struct drm_atomic_state *save_state;
> +	unsigned int entry_delay_ms;
> +};
> +
> +static void drm_self_refresh_helper_entry_work(struct work_struct *work)
> +{
> +	struct drm_self_refresh_data *sr_data = container_of(
> +				to_delayed_work(work),
> +				struct drm_self_refresh_data, entry_work);
> +	struct drm_crtc *crtc = sr_data->crtc;
> +	struct drm_device *dev = crtc->dev;
> +	struct drm_modeset_acquire_ctx ctx;
> +	struct drm_atomic_state *state;
> +	struct drm_connector *conn;
> +	struct drm_connector_state *conn_state;
> +	struct drm_crtc_state *crtc_state;
> +	int i, ret;
This function is called from a workqueue.
Just wondering if this require any locking?
(Maybe I missed it, browsed the code without a detailed review)

> +
> +	drm_modeset_acquire_init(&ctx, 0);
> +
> +	state = drm_atomic_state_alloc(dev);
> +	if (!state) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +retry:
> +	state->acquire_ctx = &ctx;
> +
> +	crtc_state = drm_atomic_get_crtc_state(state, crtc);
> +	if (IS_ERR(crtc_state)) {
> +		ret = PTR_ERR(crtc_state);
> +		goto out;
> +	}
> +
> +	if (!crtc_state->enable)
> +		goto out;
> +
> +	ret = drm_atomic_add_affected_connectors(state, crtc);
> +	if (ret)
> +		goto out;
> +
> +	for_each_new_connector_in_state(state, conn, conn_state, i) {
> +		if (!conn_state->self_refresh_aware)
> +			goto out;
> +	}
> +
> +	crtc_state->active = false;
> +	crtc_state->self_refresh_active = true;
> +
> +	ret = drm_atomic_commit(state);
> +	if (ret)
> +		goto out;
> +
> +out:
> +	if (ret == -EDEADLK) {
> +		drm_atomic_state_clear(state);
> +		ret = drm_modeset_backoff(&ctx);
> +		if (!ret)
> +			goto retry;
> +	}
> +
> +	drm_atomic_state_put(state);
> +	drm_modeset_drop_locks(&ctx);
> +	drm_modeset_acquire_fini(&ctx);
> +}
> +

> +
> +/**
> + * drm_self_refresh_helper_init - Initializes self refresh helpers for a crtc
> + * @crtc: the crtc which supports self refresh supported displays
> + * @entry_delay_ms: amount of inactivity to wait before entering self refresh
> + */
> +int drm_self_refresh_helper_init(struct drm_crtc *crtc,
> +				 unsigned int entry_delay_ms)

Missing documentation of return code.

> +{
> +	struct drm_self_refresh_data *sr_data = crtc->self_refresh_data;
> +
> +	/* Helper is already initialized */
> +	if (WARN_ON(sr_data))
> +		return -EINVAL;
> +
> +	sr_data = kzalloc(sizeof(*sr_data), GFP_KERNEL);
> +	if (!sr_data)
> +		return -ENOMEM;
> +
> +	INIT_DELAYED_WORK(&sr_data->entry_work,
> +			  drm_self_refresh_helper_entry_work);
> +	sr_data->entry_delay_ms = entry_delay_ms;
> +	sr_data->crtc = crtc;
> +
> +	crtc->self_refresh_data = sr_data;
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_self_refresh_helper_init);
> +
>  
>  /**
> diff --git a/include/drm/drm_self_refresh_helper.h b/include/drm/drm_self_refresh_helper.h
> new file mode 100644
> index 0000000000000..405e86fb8461e
> --- /dev/null
> +++ b/include/drm/drm_self_refresh_helper.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright (C) 2019 Google, Inc.
> + *
> + * Authors:
> + * Sean Paul <seanpaul@chromium.org>
> + */
> +#ifndef DRM_SELF_REFRESH_HELPER_H_
> +#define DRM_SELF_REFRESH_HELPER_H_
> +
> +struct drm_atomic_state;
OK

> +struct drm_connector;
> +struct drm_device;
> +struct drm_modeset_acquire_ctx;
The three above are not needed.

struct drm_crtc;
Missing

> +
> +void drm_self_refresh_helper_alter_state(struct drm_atomic_state *state);
> +
> +int drm_self_refresh_helper_init(struct drm_crtc *crtc,
> +				     unsigned int entry_delay_ms);
> +
> +void drm_self_refresh_helper_cleanup(struct drm_crtc *crtc);
> +#endif
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
