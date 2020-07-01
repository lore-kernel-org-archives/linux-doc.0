Return-Path: <SRS0=6tkN=AM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 974B3C433DF
	for <linux-doc@archiver.kernel.org>; Wed,  1 Jul 2020 16:40:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EEDC2085B
	for <linux-doc@archiver.kernel.org>; Wed,  1 Jul 2020 16:40:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZT7tRYjN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732340AbgGAQkw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Jul 2020 12:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732255AbgGAQkv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Jul 2020 12:40:51 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 458FAC08C5C1
        for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2020 09:40:51 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id by13so10718188edb.11
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2020 09:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P/j0fnQh7XiMD/RxWjNlaKatj3cvVJUMWLoz1xQw2GI=;
        b=ZT7tRYjNzmgiW6tSDm6N7KPTLUq3B+IgSKin9ZZUUiBRbPB2nXE0SUCxzFYbchms91
         iJWoz0yUyE7QkSJUUsBU5xMGQxYT4i1hTXaP7+ueFTaqgVTLkOFuDnnfITxFr9IqRmn6
         7NEnqIK7hYPSGvKS/tBWKa8K1sFK18UBz4+E7EP/jNydh8LJp3JBjvMnO1ugHC5l7bxR
         V1Cy+rKV2UREefRV7StxJ/iWh5ifrkFhzRBBQvy9YQOy0JqoUO7Pbx1EhhcsNfJUc6r3
         yB5s/VNcb1cQclZAAe1KXz4Rc9ycGrBkpmIv6EVb4lxFrJGKi5pV0iVLzKHwM48ZIJMx
         RJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P/j0fnQh7XiMD/RxWjNlaKatj3cvVJUMWLoz1xQw2GI=;
        b=eOYW9rOUCx5JXhP21S8se+WUYeyLBrrUqqmHvG3ggzUYuepGiXklD2QGxooxSAdFVz
         7aj7JD3wzUXlEaD84BMXmNwtmn2OZAS292s0O44XspZbUPj7MS933N63XlKq8jTNxZyf
         K8hgYVapqylEDq6N+KWvAbL3CKttzkGbyBZX1dUNQGzuzl29ijGCIZE+Q3dJ3ec++n3B
         MVUnGcGhlB/++9XWyfHgAOiOJB0Taaa2Gl1el9+uAUZVfyfQkmUlCHGK9cI6FSFkjf79
         q79SRH7mplYXquxCj0aDr4jodZNPJ6+B9MpYOoDTfLo+VuoWHKx5qrWPg3uHOENikqeI
         oSHw==
X-Gm-Message-State: AOAM531wTAQqWpn9b//D/xeyufv3anUHuwksqRFZ4tZ+a65hKVFvIVSZ
        Ysz+rroMeVjt8WSQN/r0G59dxvDLza8nge5XHogy5EfyGC4=
X-Google-Smtp-Source: ABdhPJy9qKrDRjDi/dlSDjOYJEWgovyr1QDzY7XMLeMwbA574UkGZZAW3D4dHoROy2Rqlu+k6H+u63ifkFz6MDbnHsY=
X-Received: by 2002:a05:6402:ca3:: with SMTP id cn3mr31357556edb.64.1593621649880;
 Wed, 01 Jul 2020 09:40:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200616164006.15309-1-mike.leach@linaro.org> <20200616164006.15309-5-mike.leach@linaro.org>
 <20200629174756.GA3724199@xps15>
In-Reply-To: <20200629174756.GA3724199@xps15>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Wed, 1 Jul 2020 17:40:39 +0100
Message-ID: <CAJ9a7ViHMXTiXqbNPQPBBBs87XHALvh6bW+nTiysfvK2TQGRoA@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] coresight: sysfs: Allow select default sink on
 source enable.
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Coresight ML <coresight@lists.linaro.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mathieu,

On Mon, 29 Jun 2020 at 18:47, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Hi Mike,
>
> I have applied patches 1 to 3 of this set.  Please see below for comments on
> this patch.
>
> On Tue, Jun 16, 2020 at 05:40:05PM +0100, Mike Leach wrote:
> > When enabling a trace source using sysfs, allow the CoreSight system to
> > auto-select a default sink if none has been enabled by the user.
> >
> > Uses the sink select algorithm that uses the default select priorities
> > set when sinks are registered with the system. At present this will
> > prefer ETR over ETB / ETF.
> >
> > Adds a new attribute 'last_sink' to source CoreSight devices. This is set
> > when a source is enabled using sysfs, to the sink that the device will
> > trace into. This applies for both user enabled and default enabled sinks.
> >
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > ---
> >  drivers/hwtracing/coresight/coresight.c | 39 +++++++++++++++++++++++--
> >  include/linux/coresight.h               |  3 ++
> >  2 files changed, 40 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight.c b/drivers/hwtracing/coresight/coresight.c
> > index e9c90f2de34a..db39e0b56994 100644
> > --- a/drivers/hwtracing/coresight/coresight.c
> > +++ b/drivers/hwtracing/coresight/coresight.c
> > @@ -934,6 +934,16 @@ static void coresight_clear_default_sink(struct coresight_device *csdev)
> >       }
> >  }
> >
> > +static void coresight_set_last_sink_name(struct coresight_device *source,
> > +                                      struct coresight_device *sink)
> > +{
> > +     /* remove current value and set new one if *sink not NULL */
> > +     kfree(source->last_sink);
> > +     source->last_sink = NULL;
> > +     if (sink)
> > +             source->last_sink = kstrdup(dev_name(&sink->dev), GFP_KERNEL);
> > +}
> > +
> >  /** coresight_validate_source - make sure a source has the right credentials
> >   *  @csdev:  the device structure for a source.
> >   *  @function:       the function this was called from.
> > @@ -994,8 +1004,15 @@ int coresight_enable(struct coresight_device *csdev)
> >        */
> >       sink = coresight_get_enabled_sink(false);
> >       if (!sink) {
> > -             ret = -EINVAL;
> > -             goto out;
> > +             /* look for a default sink if nothing enabled */
> > +             sink = coresight_find_default_sink(csdev);
> > +             if (!sink) {
> > +                     ret = -EINVAL;
> > +                     goto out;
> > +             }
> > +             /* mark the default as enabled */
> > +             sink->activated = true;
> > +             dev_info(&sink->dev, "Enabled default sink.");
>
> I'm very ambivalent about extending the automatic sink selection to the sysfs
> interface, mainly because of the new sysfs entry it requires.

That's interesting - this was added to overcome Suzuki's objection
that it wasn't possible to determine which sink was in use!

However, I think it is important to allow this as once we see systems
with many cores + many sinks, determining the correct sink to enable
becomes much more difficult.

You said yourself, albeit in relation to perf, that for 1:1 systems,
sink selection should be implicit. This is something I completely
agree with, and hence the automatic selection algorithm that was
chosen to ensure that this is the case.
Is there any reason not to make the same assertion for sysfs?

Further, this allows sysfs users to write board agnostic tests
(similar to the one Leo wrote for perf) - effectively all we need to
do to test the coresight function on a board is iterate through the
cpus / etms without worrying about the sink in use, then name of which
can be read from the etm and then data read out.

As an aside - last_sink also shows which sink was used should you
happen to explicitly enable two sinks in the etm path (e.g. etf &
etr).

>  I find it
> clunky that users don't have to specify the sink to use but have to explicitly
> disable it after the trace session.

Sure - but is it not just as clunky to have to figure out which sink
attaches to your etm in the first place? (yes there are topolgy links
now but this is not the most straighforward thing to use)
Ultimately, if you are only using sysfs, you never actually need to
disable the sink to read back data if you don't want to. I am not sure
there are many people who use both syfs and perf in the same session
to collect trace - and these are the ones who would need to be careful
about disabling the sink.

From a debug tools perspective, anything we can do to make things
easier for users - especially at so little extra cost, can only be a
good thing.

> We could automatically disable the sink
> after a trace session but that would break with the current sysfs heuristic
> where sinks have to be explicitly enabled and disabled.
>

Or possibly only auto-disable if the sink was selected by default in
the first place. Another short cut would be to allow writing 0 to the
last_sink attribute to disable the named sink.


Regards

Mike




> Thanks,
> Mathieu
>
> >       }
> >
> >       path = coresight_build_path(csdev, sink);
> > @@ -1033,6 +1050,9 @@ int coresight_enable(struct coresight_device *csdev)
> >               break;
> >       }
> >
> > +     /* record name of sink used for this session */
> > +     coresight_set_last_sink_name(csdev, sink);
> > +
> >  out:
> >       mutex_unlock(&coresight_mutex);
> >       return ret;
> > @@ -1145,6 +1165,19 @@ static ssize_t enable_source_store(struct device *dev,
> >  }
> >  static DEVICE_ATTR_RW(enable_source);
> >
> > +static ssize_t last_sink_show(struct device *dev,
> > +                           struct device_attribute *attr, char *buf)
> > +{
> > +     struct coresight_device *csdev = to_coresight_device(dev);
> > +     ssize_t size = 0;
> > +
> > +     if (csdev->last_sink)
> > +             size = scnprintf(buf, PAGE_SIZE, "%s\n", csdev->last_sink);
> > +     return size;
> > +}
> > +static DEVICE_ATTR_RO(last_sink);
> > +
> > +
> >  static struct attribute *coresight_sink_attrs[] = {
> >       &dev_attr_enable_sink.attr,
> >       NULL,
> > @@ -1153,6 +1186,7 @@ ATTRIBUTE_GROUPS(coresight_sink);
> >
> >  static struct attribute *coresight_source_attrs[] = {
> >       &dev_attr_enable_source.attr,
> > +     &dev_attr_last_sink.attr,
> >       NULL,
> >  };
> >  ATTRIBUTE_GROUPS(coresight_source);
> > @@ -1524,6 +1558,7 @@ void coresight_unregister(struct coresight_device *csdev)
> >       /* Remove references of that device in the topology */
> >       coresight_remove_conns(csdev);
> >       coresight_clear_default_sink(csdev);
> > +     coresight_set_last_sink_name(csdev, NULL);
> >       coresight_release_platform_data(csdev, csdev->pdata);
> >       device_unregister(&csdev->dev);
> >  }
> > diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> > index 58fffdecdbfd..fc320dd2cedc 100644
> > --- a/include/linux/coresight.h
> > +++ b/include/linux/coresight.h
> > @@ -184,6 +184,8 @@ struct coresight_sysfs_link {
> >   *           from source to that sink.
> >   * @ea:              Device attribute for sink representation under PMU directory.
> >   * @def_sink:        cached reference to default sink found for this device.
> > + * @last_sink:       Name of last sink used for this source to trace into. Set when
> > + *           enabling a source using sysfs - only set on a source device.
> >   * @ect_dev: Associated cross trigger device. Not part of the trace data
> >   *           path or connections.
> >   * @nr_links:   number of sysfs links created to other components from this
> > @@ -203,6 +205,7 @@ struct coresight_device {
> >       bool activated; /* true only if a sink is part of a path */
> >       struct dev_ext_attribute *ea;
> >       struct coresight_device *def_sink;
> > +     const char *last_sink;
> >       /* cross trigger handling */
> >       struct coresight_device *ect_dev;
> >       /* sysfs links between components */
> > --
> > 2.17.1
> >



--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
