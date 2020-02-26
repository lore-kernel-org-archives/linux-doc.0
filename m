Return-Path: <SRS0=oITL=4O=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A654DC4BA10
	for <linux-doc@archiver.kernel.org>; Wed, 26 Feb 2020 13:37:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 722DC2467B
	for <linux-doc@archiver.kernel.org>; Wed, 26 Feb 2020 13:37:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cqpm8dU3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgBZNhb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Feb 2020 08:37:31 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:35686 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgBZNha (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Feb 2020 08:37:30 -0500
Received: by mail-qk1-f195.google.com with SMTP id 145so2630473qkl.2
        for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2020 05:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GsQK/vIG2kF92nK07UxeDPcP0KSCRVmn7vbOEP4WBmA=;
        b=cqpm8dU3kFazCvW3j+ZtskRlarAtpGIczuYm67WeaAxLuH9gHkHENaM+hjgZ+6Imfe
         Pa7SvFk0BTeSqZeTeqoc9jmP/wT+lN+PCHh7BQN4SLupxMUrGWJb0+tC/1cAQQiI5Ryl
         zczvrYoeHPmwdvcVv7nX1j02L5LWya+11GW+0nsdEAiZxms9nHgHCNd60Ro4BGdkCE1J
         BqtozdJm7tU5//exqww3w28peqFHmwYrckf/RryAVTO9100pnE4FQ0Z1FvSZD76m1zly
         JgzKpQwV6QK1usRfMWCv7WA6Ie46mSSjjy5wDyp4WB62IqVB+6Bpoqi+4wocxAXGkYPT
         cl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GsQK/vIG2kF92nK07UxeDPcP0KSCRVmn7vbOEP4WBmA=;
        b=MAc0gBro2/xS2OpLs0vqL9+DhFjdWR3oiW7iCgVvG64J7Zv/DQay1m3NMjcZxh0Dqq
         wnIre/ek6/7vgXTP7XvUH+CarkDEOFNE8kBU437kUGoLu8V6jBrctG5YlFNOBI7WSsMC
         YjGIM10+hXFjnAwJ2i/yOGPrDxCUceI74HcFF9Rd+B5b+juoyBTsbqE2G6SO6YIDpxb5
         uxXI+ii3gE8wk0zli1SHqUQRYQtD/sMyZITU6qUqnREBtTJTOl3dKrXmqMAvntHDU2cS
         yXNAu4v2aCdZXfkLHx+vwIhSP8RGKnKObVSuvpS003STyaF/hiz9+pCN7b9FDEZWqUbw
         iZqQ==
X-Gm-Message-State: APjAAAUsPTNRti8SrAQBCTHqNZa+B7BJZLgEuanj2meN0+IXHXefpGyb
        ZNV20qEhT4Lz0mmqtkf94fEI4sEp0FySk4O+ARqI3A==
X-Google-Smtp-Source: APXvYqymL/6lUw1Gd0WFP9N8PmYcRwJNUBM059J+WSuwgxca4WI22oCN6FNN95bAhXXT/XTyxCHW97xXUMMb63sY1RI=
X-Received: by 2002:a05:620a:47:: with SMTP id t7mr5150375qkt.432.1582724249447;
 Wed, 26 Feb 2020 05:37:29 -0800 (PST)
MIME-Version: 1.0
References: <20200211105808.27884-1-mike.leach@linaro.org> <20200211105808.27884-6-mike.leach@linaro.org>
 <20200214225839.GB20024@xps15>
In-Reply-To: <20200214225839.GB20024@xps15>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Wed, 26 Feb 2020 13:37:17 +0000
Message-ID: <CAJ9a7VjLxTjH7OhRCoPSfiv28kSJ8=LEKSMRfwu41Du+HCh9pA@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] coresight: cti: Add in sysfs links to other
 coresight devices.
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Coresight ML <coresight@lists.linaro.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mathieu,

On Fri, 14 Feb 2020 at 22:58, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Tue, Feb 11, 2020 at 10:58:07AM +0000, Mike Leach wrote:
> > Adds in sysfs links for connections where the connected device is another
> > coresight device. This allows examination of the coresight topology.
> >
> > Non-coresight connections remain just as a reference name.
> >
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > ---
> >  drivers/hwtracing/coresight/coresight-cti.c | 41 ++++++++++++++++++++-
> >  1 file changed, 40 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-cti.c b/drivers/hwtracing/coresight/coresight-cti.c
> > index 9e18e176831c..f620e9460e7d 100644
> > --- a/drivers/hwtracing/coresight/coresight-cti.c
> > +++ b/drivers/hwtracing/coresight/coresight-cti.c
> > @@ -441,6 +441,37 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
> >       return err;
> >  }
> >
> > +static void cti_add_sysfs_link(struct cti_drvdata *drvdata,
> > +                            struct cti_trig_con *tc)
> > +{
> > +     struct coresight_sysfs_link link_info;
> > +
> > +     link_info.orig = drvdata->csdev;
> > +     link_info.orig_name = tc->con_dev_name;
> > +     link_info.target = tc->con_dev;
> > +     link_info.target_name = dev_name(&drvdata->csdev->dev);
> > +     coresight_add_sysfs_link(&link_info);
>
> I understand there isn't much to do if a problem occurs so just catch the error
> and add a comment to assert you're doing this on purpose.
>

When I revisited this code I saw an imbalance between the case where
the CTI is created first and the associated CSdev is created first.
The result could be shutdown path where the CTI removes sysfs links
after the csdev has been removed - which really shouldn't happen.
Also we could try to remove a sysfs link that we failed to set in the
first place - again not ideal

I've reworked this code to fix this, and now if the sysfs link fails
to be set, then we do not set the association between CTI and csdev
components.
This is not sufficient to fail either component from registering, as
we may have successfully registered previous associations with the
same CTI.

It seems unlikely that the sysfs link could fail, but if it does, is
it worth using a dev_warn() to at least log the failure?

Regards

Mike


> > +}
> > +
> > +static void cti_remove_all_sysfs_links(struct cti_drvdata *drvdata)
> > +{
> > +     struct cti_trig_con *tc;
> > +     struct cti_device *ctidev = &drvdata->ctidev;
> > +     struct coresight_sysfs_link link_info;
> > +
> > +     /* origin device and target link name constant for this cti */
> > +     link_info.orig = drvdata->csdev;
> > +     link_info.target_name = dev_name(&drvdata->csdev->dev);
> > +
> > +     list_for_each_entry(tc, &ctidev->trig_cons, node) {
> > +             if (tc->con_dev) {
> > +                     link_info.target = tc->con_dev;
> > +                     link_info.orig_name = tc->con_dev_name;
> > +                     coresight_remove_sysfs_link(&link_info);
> > +             }
> > +     }
> > +}
> > +
> >  /*
> >   * Look for a matching connection device name in the list of connections.
> >   * If found then swap in the csdev name, set trig con association pointer
> > @@ -452,6 +483,8 @@ cti_match_fixup_csdev(struct cti_device *ctidev, const char *node_name,
> >  {
> >       struct cti_trig_con *tc;
> >       const char *csdev_name;
> > +     struct cti_drvdata *drvdata = container_of(ctidev, struct cti_drvdata,
> > +                                                ctidev);
> >
> >       list_for_each_entry(tc, &ctidev->trig_cons, node) {
> >               if (tc->con_dev_name) {
> > @@ -462,6 +495,7 @@ cti_match_fixup_csdev(struct cti_device *ctidev, const char *node_name,
> >                                       devm_kstrdup(&csdev->dev, csdev_name,
> >                                                    GFP_KERNEL);
> >                               tc->con_dev = csdev;
> > +                             cti_add_sysfs_link(drvdata, tc);
> >                               return true;
> >                       }
> >               }
> > @@ -546,10 +580,12 @@ static void cti_update_conn_xrefs(struct cti_drvdata *drvdata)
> >       struct cti_device *ctidev = &drvdata->ctidev;
> >
> >       list_for_each_entry(tc, &ctidev->trig_cons, node) {
> > -             if (tc->con_dev)
> > +             if (tc->con_dev) {
> >                       /* set tc->con_dev->ect_dev */
> >                       coresight_set_assoc_ectdev_mutex(tc->con_dev,
> >                                                        drvdata->csdev);
> > +                     cti_add_sysfs_link(drvdata, tc);
> > +             }
> >       }
> >  }
> >
> > @@ -602,6 +638,9 @@ static void cti_device_release(struct device *dev)
> >       mutex_lock(&ect_mutex);
> >       cti_remove_conn_xrefs(drvdata);
> >
> > +     /* clear the dynamic sysfs associate with connections */
>
> s/associate/associated
>
> > +     cti_remove_all_sysfs_links(drvdata);
> > +
> >       /* remove from the list */
> >       list_for_each_entry_safe(ect_item, ect_tmp, &ect_net, node) {
> >               if (ect_item == drvdata) {
>
> With the above:
>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>
> > --
> > 2.17.1
> >



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
