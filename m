Return-Path: <SRS0=J/jn=7X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D71FC433DF
	for <linux-doc@archiver.kernel.org>; Wed, 10 Jun 2020 15:01:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3336C207C3
	for <linux-doc@archiver.kernel.org>; Wed, 10 Jun 2020 15:01:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbgFJPBn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Jun 2020 11:01:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:46548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726417AbgFJPBn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 10 Jun 2020 11:01:43 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C25EE2072F;
        Wed, 10 Jun 2020 15:01:41 +0000 (UTC)
Date:   Wed, 10 Jun 2020 11:01:40 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
        airlied@gmail.com, ppaalanen@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, seanpaul@chromium.org,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        robdclark@gmail.com, ville.syrjala@linux.intel.com,
        chris@chris-wilson.co.uk, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 13/13] drm/print: Add tracefs support to the drm
 logging helpers
Message-ID: <20200610110140.3c0da742@oasis.local.home>
In-Reply-To: <20200609154932.696-1-sean@poorly.run>
References: <202006090859.AP8QhpSU%lkp@intel.com>
        <20200609154932.696-1-sean@poorly.run>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue,  9 Jun 2020 11:49:19 -0400
Sean Paul <sean@poorly.run> wrote:

> +/**
> + * drm_trace_printf - adds an entry to the drm tracefs instance
> + * @format: printf format of the message to add to the trace
> + *
> + * This function adds a new entry in the drm tracefs instance
> + */
> +void drm_trace_printf(const char *format, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, format);
> +	vaf.fmt = format;
> +	vaf.va = &args;
> +	trace_array_printk(trace_arr, _THIS_IP_, "%pV", &vaf);
> +	va_end(args);
> +}

The only issue I have with this patch is the above. I really dislike
the use of trace_array_print(), as that is made to be for debugging and
not something that should be in a production kernel.

Ideally, every instance should just pass the data it wants to record,
and you add it to a trace event. There's already a drm trace subsystem,
how would this be different. Perhaps create a drm_log subsystem, and
you only need to have your instance enable it?

I guess I'm still confused to why this is needed over just having trace
events? What's special about this case?

-- Steve

