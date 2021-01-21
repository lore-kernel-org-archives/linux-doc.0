Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38DEC433E6
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 18:35:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A463B23A60
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 18:35:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbhAUSeC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Jan 2021 13:34:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728815AbhAUS23 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jan 2021 13:28:29 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DC2CC061756
        for <linux-doc@vger.kernel.org>; Thu, 21 Jan 2021 10:27:37 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id q205so3125354oig.13
        for <linux-doc@vger.kernel.org>; Thu, 21 Jan 2021 10:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/H0aoheHseHt1sjJzu2klJDRMVHnD4hrW5WhfCcGaHk=;
        b=lbuk4UssK7pPAYl0GKPLzyxB2YaAQmS9WYAZyDpzmzfOFSRSLZrrSwosjlJE/bnvmq
         FVc+QjyPB1fd1h0Pwzk+SvnJSeTDkgolSVGr6yjJfMZ+ffGZ2+rGevk97sGCOhZT9Tyh
         X8JkW0ilzpDbaYjo5d7VUtRmDmsQDF1maqcPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/H0aoheHseHt1sjJzu2klJDRMVHnD4hrW5WhfCcGaHk=;
        b=qPWStkfjvR+XPhrjV6ZP37aw3mvssZo2e1bnfgQvdDBK508MusJ6/5glPGKgTQIUjm
         a7Rz7ckT1p0z65q1oyZVEpOytpuf1Xvp1rw93g0uk5FGMtNkzilzlM01lYzfOqa7V8VV
         c2IsMYpTDTLJmpmP+QG1qPpSWQp9pDwCo2o+3xgWiasNpUADvLTg5quZ19d3d9yZi7UV
         HXvI1h6Bi1fltT5Th0tyz6VZVUfAoNuSuSFi02yIpO+Xx4zSoLnAItVRQ1Q8Gu2QfcA3
         Vzt5yNQoWHdQvPdTjJUYr+9qwh9omr7MGjbGVLTon1lOdIDIHgkcHnl28C5IN9KN0Vlp
         rUQg==
X-Gm-Message-State: AOAM530TUT+XjM3gGu49Y5sgctdHl0u1ORlFbtF0K/cB+b0im7Ot0Zw3
        iniDz/eEBZPmvJwDQACHldduK1/6ZF8ckhE6XcoUDg==
X-Google-Smtp-Source: ABdhPJyxZe12HyY9+PM04dG1ImqNmTiEYnWcS1P+uLp55HzlWuLXv5Bm+BIKd2BL818abya33PUOGCkFjZLucsLjBEQ=
X-Received: by 2002:aca:1906:: with SMTP id l6mr615820oii.101.1611253656345;
 Thu, 21 Jan 2021 10:27:36 -0800 (PST)
MIME-Version: 1.0
References: <20210121163537.1466118-1-maxime@cerno.tech> <20210121163537.1466118-11-maxime@cerno.tech>
In-Reply-To: <20210121163537.1466118-11-maxime@cerno.tech>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 21 Jan 2021 19:27:25 +0100
Message-ID: <CAKMK7uHEnsZty40YOc+ySDwJLkGWm0aPaTKDvecnymVX4yLjAA@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] drm/todo: Remove the drm_atomic_state todo item
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Maxime Ripard <mripard@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 21, 2021 at 5:36 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Only planes' prepare_fb and cleanup_fb, and encoders' atomic_check and
> atomic_mode_set hooks remain with an object state and not the global
> drm_atomic_state.
>
> prepare_fb and cleanup_fb operate by design on a given state and
> depending on the calling site can operate on either the old or new
> state, so it doesn't really make much sense to convert them.
>
> The encoders' atomic_check and atomic_mode_set operate on the CRTC and
> connector state connected to them since encoders don't have a state of
> their own. Without those state pointers, we would need to get the CRTC
> through the drm_connector_state crtc pointer.
>
> However, in order to get the drm_connector_state pointer, we would need
> to get the connector itself and while usually we have a single connector
> connected to the encoder, we can't really get it from the encoder at
> the moment since it could be behind any number of bridges.
>
> While this could be addressed by (for example) listing all the
> connectors and finding the one that has the encoder as its source, it
> feels like an unnecessary rework for something that is slowly getting
> replaced by bridges.
>
> Since all the users that matter have been converted, let's remove the
> TODO item.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>
> ---
>
> Changes from v1:
>   - New patch
> ---
>  Documentation/gpu/todo.rst | 46 --------------------------------------
>  1 file changed, 46 deletions(-)
>
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 009d8e6c7e3c..609794108f5a 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -440,52 +440,6 @@ Contact: Emil Velikov, respective driver maintainers
>
>  Level: Intermediate
>
> -Plumb drm_atomic_state all over
> --------------------------------
> -
> -Currently various atomic functions take just a single or a handful of
> -object states (eg. plane state). While that single object state can
> -suffice for some simple cases, we often have to dig out additional
> -object states for dealing with various dependencies between the individu=
al
> -objects or the hardware they represent. The process of digging out the
> -additional states is rather non-intuitive and error prone.
> -
> -To fix that most functions should rather take the overall
> -drm_atomic_state as one of their parameters. The other parameters
> -would generally be the object(s) we mainly want to interact with.
> -
> -For example, instead of
> -
> -.. code-block:: c
> -
> -   int (*atomic_check)(struct drm_plane *plane, struct drm_plane_state *=
state);
> -
> -we would have something like
> -
> -.. code-block:: c
> -
> -   int (*atomic_check)(struct drm_plane *plane, struct drm_atomic_state =
*state);
> -
> -The implementation can then trivially gain access to any required object
> -state(s) via drm_atomic_get_plane_state(), drm_atomic_get_new_plane_stat=
e(),
> -drm_atomic_get_old_plane_state(), and their equivalents for
> -other object types.
> -
> -Additionally many drivers currently access the object->state pointer
> -directly in their commit functions. That is not going to work if we
> -eg. want to allow deeper commit pipelines as those pointers could
> -then point to the states corresponding to a future commit instead of
> -the current commit we're trying to process. Also non-blocking commits
> -execute locklessly so there are serious concerns with dereferencing
> -the object->state pointers without holding the locks that protect them.
> -Use of drm_atomic_get_new_plane_state(), drm_atomic_get_old_plane_state(=
),
> -etc. avoids these problems as well since they relate to a specific
> -commit via the passed in drm_atomic_state.
> -
> -Contact: Ville Syrj=C3=A4l=C3=A4, Daniel Vetter
> -
> -Level: Intermediate
> -
>  Use struct dma_buf_map throughout codebase
>  ------------------------------------------
>
> --
> 2.29.2
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
