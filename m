Return-Path: <SRS0=J/jn=7X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD7DC433E0
	for <linux-doc@archiver.kernel.org>; Wed, 10 Jun 2020 15:30:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39661207C3
	for <linux-doc@archiver.kernel.org>; Wed, 10 Jun 2020 15:30:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="BKXx3SOy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728640AbgFJPaN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Jun 2020 11:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbgFJPaN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Jun 2020 11:30:13 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD8DC03E96B
        for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2020 08:30:13 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id 9so2269387ilg.12
        for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2020 08:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Am24crIC+zRfq8I8n93/ZjGiDoZosDQrAqxUJdqS3ZM=;
        b=BKXx3SOyUvkDpf/X6HJW9wmsPI7C0cUoPqr1ArNq+pYFyLKoC6r21AEsN9rDscOEg3
         HoOgpgojOwP1M3ymn/O1csUpkvdvRljUcB9xEHncX5XzuSz5jShc9+WGeq7B4HPrHWi5
         RrhmVJlusLIiJMQ0g1FqxQe2KiOR7BfUMRKY1i90aY9ckpC5iVlwZaRyx3jm5+GhHUSQ
         2vjD4j2RKNQ4M21SDQloQW2dgEP8dxgG+6vHWakGdj78P3Dk8idjCbQEyAVocYqL6NP6
         8SQQrxc8hAqBgURcqAQ35/jMbcPlX3ecycMdZIqOLvm4kHTvMLbAIhRUpi+7ZGAxOJm/
         Wdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Am24crIC+zRfq8I8n93/ZjGiDoZosDQrAqxUJdqS3ZM=;
        b=k2r+XyWEtszi8eWD6Nr5WBAx4FpTZFSXuFqnAS+e3jcpC4iEDRbGkuIPUQZhTROdes
         7t4ENuGC1w3a1F+Q69PmrwNktBWY7oMCcIMu39ibPsgY2ZsaDi7jtoBi3mVBJzGyuwPb
         MrEutwj2Fjz2r4ovxSpcvKvGnEzj1rWVoLybGaiPvBLM7EH+mINw6Ud99F01coW0ktf1
         26uErYFcmdEliWPJHwIFO9UrN731hobYorprGrmNPdYm2fSc4xVzvZ4mU/kXDbxzOGNM
         ZBstOYHySydJJXvBlrNyMMhVvsRWZr/8aSM7cT0ol07SmRvc2M14Adh07LC8aSun9lg7
         kxrw==
X-Gm-Message-State: AOAM53023oIh8WEk6TdO4WKxGXzswQMF6Oi6zf4gvIIMq65vwo+E9CzP
        S/cJfR9cMlynYPCbZm+lUiN9dE8RffyUs1y99VnEy1Jda34=
X-Google-Smtp-Source: ABdhPJxp9L2HOD2Z7AYkahM2j6pxJ54dqJDz9gGr5QAUSYQgKY6NYaHg3BmnE2NOtUFXCERInPhRY3BU5HpOIELaWGo=
X-Received: by 2002:a92:8593:: with SMTP id f141mr3594946ilh.264.1591803011947;
 Wed, 10 Jun 2020 08:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <202006090859.AP8QhpSU%lkp@intel.com> <20200609154932.696-1-sean@poorly.run>
 <20200610110140.3c0da742@oasis.local.home>
In-Reply-To: <20200610110140.3c0da742@oasis.local.home>
From:   Sean Paul <sean@poorly.run>
Date:   Wed, 10 Jun 2020 11:29:36 -0400
Message-ID: <CAMavQKKqDUQgAMPX9wCvZ-GZMQNiqU3YYKnyUaGL73cd844JJQ@mail.gmail.com>
Subject: Re: [PATCH v6 13/13] drm/print: Add tracefs support to the drm
 logging helpers
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Dave Airlie <airlied@gmail.com>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sean Paul <seanpaul@chromium.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 10, 2020 at 11:01 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Tue,  9 Jun 2020 11:49:19 -0400
> Sean Paul <sean@poorly.run> wrote:
>
> > +/**
> > + * drm_trace_printf - adds an entry to the drm tracefs instance
> > + * @format: printf format of the message to add to the trace
> > + *
> > + * This function adds a new entry in the drm tracefs instance
> > + */
> > +void drm_trace_printf(const char *format, ...)
> > +{
> > +     struct va_format vaf;
> > +     va_list args;
> > +
> > +     va_start(args, format);
> > +     vaf.fmt = format;
> > +     vaf.va = &args;
> > +     trace_array_printk(trace_arr, _THIS_IP_, "%pV", &vaf);
> > +     va_end(args);
> > +}
>
> The only issue I have with this patch is the above. I really dislike
> the use of trace_array_print(), as that is made to be for debugging and
> not something that should be in a production kernel.
>
> Ideally, every instance should just pass the data it wants to record,
> and you add it to a trace event. There's already a drm trace subsystem,
> how would this be different. Perhaps create a drm_log subsystem, and
> you only need to have your instance enable it?
>
> I guess I'm still confused to why this is needed over just having trace
> events? What's special about this case?
>

Hi Steve,
In v2 I had added trace events throughout drm in this manner. See
https://lists.freedesktop.org/archives/dri-devel/2019-November/243318.html

The feedback I received was that exposing the events in such a
structured way would bind us to the trace formats and make things more
difficult moving forward.

Aside from the UAPI concerns, wearing my ChromeOS hat (with full
knowledge that most upstream folks won't care about this), this
solution also misses on making problems easier to diagnose from
logs/user feedback. It requires that driver developers add tracing
beside their logging, and makes backporting upstream code even harder
than it is right now. If we can intercept the existing and new logging
at the source, it's much easier to ensure the flight recorder is
accurate. We've been shipping this (v4) in CrOS for ~months now and
it's been invaluable. With this experience in mind, I'd be really
hesitant to change course.

Sean

> -- Steve
>
