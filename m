Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40B4C4338F
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jul 2021 20:25:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E58E6023E
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jul 2021 20:25:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbhG2UZT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Jul 2021 16:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbhG2UZS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Jul 2021 16:25:18 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B162C061765
        for <linux-doc@vger.kernel.org>; Thu, 29 Jul 2021 13:25:15 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id o12so4231704vst.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Jul 2021 13:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lBdn7VN2Nno1m5VvrO3GvYTE3nugjPKskWU7Pju/ERw=;
        b=r9vV7JMBnPO62EL2VUICbAFx8C2tGlsIQO/fcJJaJl87M75tJV+Y/QhqvcDgOGa0Su
         0Wb8H//QBNKoMxkDQOJI3fQDMTv3z8fr9cEijD6ZDFkPHQc5OAcFtbt8FgocVrbWPgUD
         yq8lrx9m8N9GudzISoo0qe7vbl1ZFdYEhURGlhCGttFeMRF4rOUa84pNsRn8+CQ8Rn8w
         mmwSJpKyTskDPvsoltX+4P4Lxz5Xpynut9VMF08mP7rXbgZrr8wVjeThWMREHv2SEmdw
         9hGVt1cO33iIzs2UoBQNRs+Bse4UJwIXKMUVsU1s1Bb4EKAKWan5OhvfM5bo1KDHj83E
         Tt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lBdn7VN2Nno1m5VvrO3GvYTE3nugjPKskWU7Pju/ERw=;
        b=CyuDX0qpeoED1WiMYB3BBWVbVU6MYmZVUJRQgvLoRvyEI3rWIMSOm6lfc2F1PO9YYy
         k88Ppi2KpA+Xz8zC/rNbWeD5cH4EfS7cxSyqlEhUMiFgDKOil6YstWbpoAmkrEYmn6ve
         hbG6EiKSMATJtHmjeLJyUbFWLMtl2AMfPHGkp7zwLN3nFiSNrk3ocp0KrPQ3Wq/a6CBd
         XCvYnJ8TfDLk+RIGGJdbXSHCt/YF7svuRb3ecBz1CxKX90N59niNLbyyZFncIjL58jzN
         olS9Eu41Zgbcpx8U1J+Npr/Z5MTXi7E9zMCKPHCgsOcLtow50+8XcdNs57tXyTf2/3mF
         AWqw==
X-Gm-Message-State: AOAM5324FIecBcPfIKM18tRYRwIonluWIXG1eSpxu/wyowigC+gVyHSx
        MMnq/WiF4+5MXBV+6M5O3Voi9+5cQQtnEnuB8z4=
X-Google-Smtp-Source: ABdhPJwvegtLMIJa3KxAedmoLYxHB/3ZlALI/vMckhb4T9koneIOzB7rW4C88Np7ShZ2CS4RkKi/yQKtA+Ngy2MIp0E=
X-Received: by 2002:a05:6102:c48:: with SMTP id y8mr6247230vss.14.1627590314443;
 Thu, 29 Jul 2021 13:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210721175526.22020-1-sean@poorly.run> <20210721175526.22020-15-sean@poorly.run>
In-Reply-To: <20210721175526.22020-15-sean@poorly.run>
From:   jim.cromie@gmail.com
Date:   Thu, 29 Jul 2021 14:24:48 -0600
Message-ID: <CAJfuBxzgHodZ-=dKxpus58SK8=fgvMPEzYS1Sh-5NZkxk+vL9g@mail.gmail.com>
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

On Wed, Jul 21, 2021 at 11:56 AM Sean Paul <sean@poorly.run> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> This patch adds a new module parameter called drm.trace which accepts
> the same mask as drm.debug. When a debug category is enabled, log
> messages will be put in a new tracefs instance called drm for
> consumption.
>
> Using the new tracefs instance will allow distros to enable drm logging
> in production without impacting performance or spamming the system
> logs.

hi Paul,

I should have started reading here, not at patch-1
While I still think some of the _syslog name changes are extra,
drm_debug_enabled() needs it - rename goes with narrower purpose.

a couple comments below, trimming heavily.


> +#define DEBUG_PARM_DESC(dst) \
> +"Enable debug output to " dst ", where each bit enables a debug category.\n" \

I will be borrowing that idea.

> +
> +MODULE_PARM_DESC(debug, DEBUG_PARM_DESC("syslog"));
>  module_param_named(debug, __drm_debug_syslog, int, 0600);
>


> +void __drm_printfn_debug_syslog_and_trace(struct drm_printer *p,
> +                                          struct va_format *vaf)
> +{
> +       pr_debug("%s %pV", p->prefix, vaf);

Im not sure about prefixing this way.
dyndbg query needs to see the prefix in the format string at compile-time.

My RFC patch does the prefixing in the macro layer, when enabled.
when disabled, prefixing at runtime is fine.
This looks easy to shake out..
















> +       drm_trace_printf("%s %pV", p->prefix, vaf);
> +}
> +EXPORT_SYMBOL(__drm_printfn_debug_syslog_and_trace);
> +
>  void __drm_printfn_err(struct drm_printer *p, struct va_format *vaf)
>  {
>         pr_err("*ERROR* %s %pV", p->prefix, vaf);
> @@ -246,6 +278,14 @@ void drm_dev_printk(const struct device *dev, const char *level,
>         struct va_format vaf;
>         va_list args;
>
> +       va_start(args, format);
> +       vaf.fmt = format;
> +       vaf.va = &args;
> +       drm_trace_printf("%s%s[" DRM_NAME ":%ps] %pV",
> +                        dev ? dev_name(dev) : "",dev ? " " : "",
> +                        __builtin_return_address(0), &vaf);
> +       va_end(args);
> +
>         va_start(args, format);
>         vaf.fmt = format;
>         vaf.va = &args;

here and below, you re-prepare vaf.
can you just prepare once, and print 2x to different printers ?
or is that not allowed for some reason?

maybe macros to reduce linecount ?

 thanks
Jim
