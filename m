Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 475FB7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Jun 2019 14:19:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439575AbfFLOT2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Jun 2019 10:19:28 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:38615 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437249AbfFLOT2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Jun 2019 10:19:28 -0400
Received: by mail-qt1-f193.google.com with SMTP id n11so16553464qtl.5
        for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2019 07:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VBW9vmo77p3uLkUSqiglfgJ/6BFkwzlCcG5DBVSwVk4=;
        b=NIkqoQMvmm51unkBwbIgwaVH7hKHcigtxEq672vVrHrdNyAMzYxJg6TPMqR8uSeC/h
         Rh+A5o+S1FYGefXStqm4ss5tgeYr9+g0FzBFlmzop3EDlFezfwQbGzEXr9unW+nkwEyQ
         1DzZKJwbCR1nSa1CtFJn+4UyM8OJFepN3kqNWx/ZQe4qP/e2Jfv8eOxcaefLnqiBj5O4
         ho2686264YHBvvEvecVU3JChoRoyyZYIX3ZQkA+CymIS3hVlFWoSxpVBjZVPyTM5Rnz9
         Da+m8UA4qLO4Ycl08IQuJBzFXCmSXXOwnuhr23KapLTOHqffLU1Jsu8uchFU0w57l15S
         3j7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VBW9vmo77p3uLkUSqiglfgJ/6BFkwzlCcG5DBVSwVk4=;
        b=fPsTX7QQfI7rVdH+yqyK2jiU1XktjCQW4pSHvKiQSBrRAHP28o2+AJ1vZpT4xrWQvl
         /wR3azBi10eJlIs6G6FAkLSJLi+FBtrtvliLkOxpxbIQbS2wkpCHSKRsuQN7GhlI3tJ4
         L0BmXoS4Y7MXYzc9PUqpqhxm7O9xUYEoJMx77aGxGSPLxugUbgusOd2bqxjM63iU9pox
         DnncpVLAE2/di2brN9U/EeJU4/DTt6mzXfl4AEdJz18uCSLOVg5Y+O1aseHraXEnZ75J
         BhFK+FEBIwiMLrLf63y5TAbShWChnLM42qaUtAP6IDl4KD6nKx1yIoo6lN2dJDzz0RZ/
         /iHg==
X-Gm-Message-State: APjAAAVXWuoKHm86Pfh/53qXkuQah3kPLwD0egwGrahHWh6YaKgbU4FB
        ijADowUhwJUNvqYHhbvMy/opuw==
X-Google-Smtp-Source: APXvYqzmBih8YIGa/FSIbOUZP+1o9aN/lNdBOYnAZ28k9Eh/9q5pvN/EsGR+IygHVljOs9OXqA1Sjw==
X-Received: by 2002:ac8:2edc:: with SMTP id i28mr50486256qta.77.1560349167731;
        Wed, 12 Jun 2019 07:19:27 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id m21sm7594995qtp.92.2019.06.12.07.19.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 12 Jun 2019 07:19:27 -0700 (PDT)
Date:   Wed, 12 Jun 2019 10:19:26 -0400
From:   Sean Paul <sean@poorly.run>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        Zain Wang <wzz@rock-chips.com>,
        Jonathan Corbet <corbet@lwn.net>,
        David Airlie <airlied@linux.ie>, linux-doc@vger.kernel.org,
        Jose Souza <jose.souza@intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <seanpaul@chromium.org>
Subject: Re: [PATCH v5 05/11] drm: Add helpers to kick off self refresh mode
 in drivers
Message-ID: <20190612141926.GE179831@art_vandelay>
References: <20190611160844.257498-1-sean@poorly.run>
 <20190611160844.257498-6-sean@poorly.run>
 <20190611205645.GB18315@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611205645.GB18315@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 11, 2019 at 10:56:45PM +0200, Sam Ravnborg wrote:
> Hi Sean.
> 
> Small things here and there. Did not stare at this long enough to
> understand the code, but added some feedback anyway.

Thanks for the comments, Sam, I'll send a revision shortly

> 
> 	Sam
> >  

/snip

> > +static void drm_self_refresh_helper_entry_work(struct work_struct *work)
> > +{
> > +	struct drm_self_refresh_data *sr_data = container_of(
> > +				to_delayed_work(work),
> > +				struct drm_self_refresh_data, entry_work);
> > +	struct drm_crtc *crtc = sr_data->crtc;
> > +	struct drm_device *dev = crtc->dev;
> > +	struct drm_modeset_acquire_ctx ctx;
> > +	struct drm_atomic_state *state;
> > +	struct drm_connector *conn;
> > +	struct drm_connector_state *conn_state;
> > +	struct drm_crtc_state *crtc_state;
> > +	int i, ret;
> This function is called from a workqueue.
> Just wondering if this require any locking?

Yes, it does. The locks are acquired in the various drm_atomic_get_*_state()
function calls and dropped below in the out label (drm_modeset_drop_locks).

> (Maybe I missed it, browsed the code without a detailed review)
> 
> > +
> > +	drm_modeset_acquire_init(&ctx, 0);
> > +
> > +	state = drm_atomic_state_alloc(dev);
> > +	if (!state) {
> > +		ret = -ENOMEM;
> > +		goto out;
> > +	}
> > +
> > +retry:
> > +	state->acquire_ctx = &ctx;
> > +
> > +	crtc_state = drm_atomic_get_crtc_state(state, crtc);
> > +	if (IS_ERR(crtc_state)) {
> > +		ret = PTR_ERR(crtc_state);
> > +		goto out;
> > +	}
> > +
> > +	if (!crtc_state->enable)
> > +		goto out;
> > +
> > +	ret = drm_atomic_add_affected_connectors(state, crtc);
> > +	if (ret)
> > +		goto out;
> > +
> > +	for_each_new_connector_in_state(state, conn, conn_state, i) {
> > +		if (!conn_state->self_refresh_aware)
> > +			goto out;
> > +	}
> > +
> > +	crtc_state->active = false;
> > +	crtc_state->self_refresh_active = true;
> > +
> > +	ret = drm_atomic_commit(state);
> > +	if (ret)
> > +		goto out;
> > +
> > +out:
> > +	if (ret == -EDEADLK) {
> > +		drm_atomic_state_clear(state);
> > +		ret = drm_modeset_backoff(&ctx);
> > +		if (!ret)
> > +			goto retry;
> > +	}
> > +
> > +	drm_atomic_state_put(state);
> > +	drm_modeset_drop_locks(&ctx);
> > +	drm_modeset_acquire_fini(&ctx);
> > +}
> > +

/snip

-- 
Sean Paul, Software Engineer, Google / Chromium OS
