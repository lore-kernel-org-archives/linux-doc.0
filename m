Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 259C2C4338F
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jul 2021 20:34:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0677960F46
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jul 2021 20:34:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232932AbhG2UeT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Jul 2021 16:34:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233086AbhG2UeP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Jul 2021 16:34:15 -0400
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 485B6C0613C1
        for <linux-doc@vger.kernel.org>; Thu, 29 Jul 2021 13:34:10 -0700 (PDT)
Received: by mail-ua1-x933.google.com with SMTP id t25so1209591uar.13
        for <linux-doc@vger.kernel.org>; Thu, 29 Jul 2021 13:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o4Y7XGlLfPOfyDeTYT9js92suK0o7Zs6bPcUlyBP3+8=;
        b=IZg2BgjV3k6UNdOrECEVLTrx80Xoau0iUyi9ZxmimDHAYIW21N3KoXYwi8FBiEpblj
         eRSZJhGoCHJmZv3Wu7pLbI0bjJsUL/bAkqL2QwJaU0UAO4YrWBOERgJ08fyY50TRt9mT
         liX0skd7CKeJ+yR9uVui4D5jH8THlaMJhb5+MAbCCxUK0UsBgbTYkMbYjOrIXEZBLgV+
         Z958u0DBwE23Qr17SSOe6IfGc1iMuDdlYQCarpSHG8E4ZPsphzrGQErIxl63+ASUHcYz
         M+HuwxHve+21AJ76PGcnIU4yka+n96EvYlEIZ56IVHdS+GImmoIxExAURGNHTEzWx9yM
         lBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o4Y7XGlLfPOfyDeTYT9js92suK0o7Zs6bPcUlyBP3+8=;
        b=LcP6FoBA62y8UTTZyR2R5YgPlox80kT9idHaR2FBqZugud1UWsny+/GV2Z6D4pA9mo
         M8kowwNmIGwSvgohWN/kKQgut+dhAWWCVEl1s5kw3JkfSgPHtQkvzVLWRN1tyWtLOboT
         W8iWRhkekkwqFynoHWBcFjqsJak1OyBNxy2tNQ4Wfaz6ITwN8UuHO8QXbgwnkLcVIU7R
         4KutvBaorFjhA7V+5HXbnW8SSnJw34BN0vWQbVc5u583ivVuELlAcPi1jVAGBqUTdyhX
         Dz5qpYj+8wr0d5s173Iey+zy0s9I7eCrSYjv0I8ICUsXCO9xbZTjs8pmsMw85G6VaDaI
         kWww==
X-Gm-Message-State: AOAM532VkicwRVIKMAMD4zTMFQEmLKzY6uCGHavFnFnd7LSsh9I7Wqsu
        rbx3fxk0cEv3+wIcQWIkYTcrGIGUoALYUIzvyBs=
X-Google-Smtp-Source: ABdhPJxkqdKZiWg0LxV975QQeBwMk7lrI0uKvhgLou0ttFFR9VfQ+CR/YUyA2QxHg9SZ3sS1Fq6fCFQWqgjUtMBsBg4=
X-Received: by 2002:ab0:25c5:: with SMTP id y5mr6789324uan.142.1627590849359;
 Thu, 29 Jul 2021 13:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210721175526.22020-1-sean@poorly.run> <20210721175526.22020-15-sean@poorly.run>
 <CAJfuBxzgHodZ-=dKxpus58SK8=fgvMPEzYS1Sh-5NZkxk+vL9g@mail.gmail.com>
In-Reply-To: <CAJfuBxzgHodZ-=dKxpus58SK8=fgvMPEzYS1Sh-5NZkxk+vL9g@mail.gmail.com>
From:   jim.cromie@gmail.com
Date:   Thu, 29 Jul 2021 14:33:43 -0600
Message-ID: <CAJfuBxxvNQsL-EvhFkZpU=4vaAzUMjfHF=4kfAULOoR-4z614w@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 14/14] drm/print: Add tracefs support to the drm
 logging helpers
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>, ppaalanen@gmail.com,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        kernel test robot <lkp@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 29, 2021 at 2:24 PM <jim.cromie@gmail.com> wrote:
>
> On Wed, Jul 21, 2021 at 11:56 AM Sean Paul <sean@poorly.run> wrote:
> >
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > This patch adds a new module parameter called drm.trace which accepts
> > the same mask as drm.debug. When a debug category is enabled, log
> > messages will be put in a new tracefs instance called drm for
> > consumption.
> >
> > Using the new tracefs instance will allow distros to enable drm logging
> > in production without impacting performance or spamming the system
> > logs.
>
> hi Paul,
>
> I should have started reading here, not at patch-1
> While I still think some of the _syslog name changes are extra,
> drm_debug_enabled() needs it - rename goes with narrower purpose.
>
> a couple comments below, trimming heavily.
>
>
> > +#define DEBUG_PARM_DESC(dst) \
> > +"Enable debug output to " dst ", where each bit enables a debug category.\n" \
>
> I will be borrowing that idea.
>
> > +
> > +MODULE_PARM_DESC(debug, DEBUG_PARM_DESC("syslog"));
> >  module_param_named(debug, __drm_debug_syslog, int, 0600);
> >
>
>
> > +void __drm_printfn_debug_syslog_and_trace(struct drm_printer *p,
> > +                                          struct va_format *vaf)
> > +{
> > +       pr_debug("%s %pV", p->prefix, vaf);
>
> Im not sure about prefixing this way.
> dyndbg query needs to see the prefix in the format string at compile-time.
>
> My RFC patch does the prefixing in the macro layer, when enabled.
> when disabled, prefixing at runtime is fine.
> This looks easy to shake out..
>

Actually, this is more problematic than that.
this pr_debug has just a single point of >control,
whereas all those in macro expansions get individual lines in control file.

I had this problem in an earlier version of RFC patch
where I called pr_debug from within drm_dev_dbg etc.
