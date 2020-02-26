Return-Path: <SRS0=oITL=4O=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C78C4BA21
	for <linux-doc@archiver.kernel.org>; Wed, 26 Feb 2020 21:20:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F06CF24670
	for <linux-doc@archiver.kernel.org>; Wed, 26 Feb 2020 21:20:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KMgLrDGO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727580AbgBZVUh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Feb 2020 16:20:37 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:39777 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727486AbgBZVUg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Feb 2020 16:20:36 -0500
Received: by mail-pj1-f68.google.com with SMTP id e9so187537pjr.4
        for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2020 13:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9CiQT/kMWRksr1hp63TAHSJ3ufcI1s7CqCu0d0GyycE=;
        b=KMgLrDGOqPhlWy8vN1SiYK34JngSlLxfmRkvpdP4YzZIN1/C2V8KvjjmYG8rfLZUH2
         7/qMu72zpkd8084wIfLIAHfBTFgzJARt1WlkqBsSINx0LgKq2cPHamx6C50gtHb4VTU3
         kr0v2Fk7mTNQLqmhHAcdMhOuJ35NmAv6mLlBqR8VoaH375kXqWsMtrCOOp03EC0Lizkh
         28Jb9tZEwp5kwQO+SHBd0u0XVNczTAZj/6wY4deoV1KaKJ9uES7F/6YqxVSGCndYmTTk
         cBT6eL3yDtQtuwJ/feNVXnEOukvVapc3LjWedtoz8jzmqhqv/TymkH2ieN6BU7WUhYp9
         CYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9CiQT/kMWRksr1hp63TAHSJ3ufcI1s7CqCu0d0GyycE=;
        b=tkcnHtvaJIDUE2bKMChMfuWonvnSEF18GuqHJCTUl5PFIpgK68Og7N3mYSUvMFdSgf
         gL/sz03WuQePY00o4jb6T9/CBiOsCHauzNb9lMDq3nqp7dgp5AjZWG0OxTNZ7wcZfwSb
         KP3mUnsC4+t79Ra/mO+yMb+z/Sp6Vytr0UqhlI9FhVkMl6rjYVylJQvmyEKgq8q/KXdD
         MYUUFN/LJUYv4qbXyEDUbFgr8vB+C2NKWVJRTIqUPS5Q7lgfmlPDIceeWrGYGykNiUW0
         gSXCIQ95rq/r0cu3uWDx8qK9bNUgw8tfrZPmoFmshFytdatweup3c1xzYcz9108gTxlx
         ysZw==
X-Gm-Message-State: APjAAAVXVjc+gl+3hcMzmatN/BMOfMezYp3gVrCB3pa0CykbNqhK2PSb
        0Qo+5aQamV9BYtOoHEfP0iCZYcU72U4=
X-Google-Smtp-Source: APXvYqyeYsTqqUfBfSLT0KIkP0VpNMu2Qxg2PbwfXNSAx7Q2x0VcvWwMpOzy39BLAC8BKsBSbxHG2A==
X-Received: by 2002:a17:902:8ec6:: with SMTP id x6mr1160415plo.247.1582752035365;
        Wed, 26 Feb 2020 13:20:35 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id q66sm4375210pfq.27.2020.02.26.13.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2020 13:20:34 -0800 (PST)
Date:   Wed, 26 Feb 2020 14:20:32 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Coresight ML <coresight@lists.linaro.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Subject: Re: [PATCH v4 5/6] coresight: cti: Add in sysfs links to other
 coresight devices.
Message-ID: <20200226212032.GB30754@xps15>
References: <20200211105808.27884-1-mike.leach@linaro.org>
 <20200211105808.27884-6-mike.leach@linaro.org>
 <20200214225839.GB20024@xps15>
 <CAJ9a7VjLxTjH7OhRCoPSfiv28kSJ8=LEKSMRfwu41Du+HCh9pA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VjLxTjH7OhRCoPSfiv28kSJ8=LEKSMRfwu41Du+HCh9pA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 26, 2020 at 01:37:17PM +0000, Mike Leach wrote:
> Hi Mathieu,
> 
> On Fri, 14 Feb 2020 at 22:58, Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > On Tue, Feb 11, 2020 at 10:58:07AM +0000, Mike Leach wrote:
> > > Adds in sysfs links for connections where the connected device is another
> > > coresight device. This allows examination of the coresight topology.
> > >
> > > Non-coresight connections remain just as a reference name.
> > >
> > > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > > ---
> > >  drivers/hwtracing/coresight/coresight-cti.c | 41 ++++++++++++++++++++-
> > >  1 file changed, 40 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/hwtracing/coresight/coresight-cti.c b/drivers/hwtracing/coresight/coresight-cti.c
> > > index 9e18e176831c..f620e9460e7d 100644
> > > --- a/drivers/hwtracing/coresight/coresight-cti.c
> > > +++ b/drivers/hwtracing/coresight/coresight-cti.c
> > > @@ -441,6 +441,37 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
> > >       return err;
> > >  }
> > >
> > > +static void cti_add_sysfs_link(struct cti_drvdata *drvdata,
> > > +                            struct cti_trig_con *tc)
> > > +{
> > > +     struct coresight_sysfs_link link_info;
> > > +
> > > +     link_info.orig = drvdata->csdev;
> > > +     link_info.orig_name = tc->con_dev_name;
> > > +     link_info.target = tc->con_dev;
> > > +     link_info.target_name = dev_name(&drvdata->csdev->dev);
> > > +     coresight_add_sysfs_link(&link_info);
> >
> > I understand there isn't much to do if a problem occurs so just catch the error
> > and add a comment to assert you're doing this on purpose.
> >
> 
> When I revisited this code I saw an imbalance between the case where
> the CTI is created first and the associated CSdev is created first.
> The result could be shutdown path where the CTI removes sysfs links
> after the csdev has been removed - which really shouldn't happen.
> Also we could try to remove a sysfs link that we failed to set in the
> first place - again not ideal
> 
> I've reworked this code to fix this, and now if the sysfs link fails
> to be set, then we do not set the association between CTI and csdev
> components.

Ok

> This is not sufficient to fail either component from registering, as
> we may have successfully registered previous associations with the
> same CTI.
>

That is also my opinion.
 
> It seems unlikely that the sysfs link could fail, but if it does, is
> it worth using a dev_warn() to at least log the failure?
>

Yes, that would surely be helpful. 
 
> Regards
> 
> Mike
> 
> 
> > > +}
> > > +
> > > +static void cti_remove_all_sysfs_links(struct cti_drvdata *drvdata)
> > > +{
> > > +     struct cti_trig_con *tc;
> > > +     struct cti_device *ctidev = &drvdata->ctidev;
> > > +     struct coresight_sysfs_link link_info;
> > > +
> > > +     /* origin device and target link name constant for this cti */
> > > +     link_info.orig = drvdata->csdev;
> > > +     link_info.target_name = dev_name(&drvdata->csdev->dev);
> > > +
> > > +     list_for_each_entry(tc, &ctidev->trig_cons, node) {
> > > +             if (tc->con_dev) {
> > > +                     link_info.target = tc->con_dev;
> > > +                     link_info.orig_name = tc->con_dev_name;
> > > +                     coresight_remove_sysfs_link(&link_info);
> > > +             }
> > > +     }
> > > +}
> > > +
> > >  /*
> > >   * Look for a matching connection device name in the list of connections.
> > >   * If found then swap in the csdev name, set trig con association pointer
> > > @@ -452,6 +483,8 @@ cti_match_fixup_csdev(struct cti_device *ctidev, const char *node_name,
> > >  {
> > >       struct cti_trig_con *tc;
> > >       const char *csdev_name;
> > > +     struct cti_drvdata *drvdata = container_of(ctidev, struct cti_drvdata,
> > > +                                                ctidev);
> > >
> > >       list_for_each_entry(tc, &ctidev->trig_cons, node) {
> > >               if (tc->con_dev_name) {
> > > @@ -462,6 +495,7 @@ cti_match_fixup_csdev(struct cti_device *ctidev, const char *node_name,
> > >                                       devm_kstrdup(&csdev->dev, csdev_name,
> > >                                                    GFP_KERNEL);
> > >                               tc->con_dev = csdev;
> > > +                             cti_add_sysfs_link(drvdata, tc);
> > >                               return true;
> > >                       }
> > >               }
> > > @@ -546,10 +580,12 @@ static void cti_update_conn_xrefs(struct cti_drvdata *drvdata)
> > >       struct cti_device *ctidev = &drvdata->ctidev;
> > >
> > >       list_for_each_entry(tc, &ctidev->trig_cons, node) {
> > > -             if (tc->con_dev)
> > > +             if (tc->con_dev) {
> > >                       /* set tc->con_dev->ect_dev */
> > >                       coresight_set_assoc_ectdev_mutex(tc->con_dev,
> > >                                                        drvdata->csdev);
> > > +                     cti_add_sysfs_link(drvdata, tc);
> > > +             }
> > >       }
> > >  }
> > >
> > > @@ -602,6 +638,9 @@ static void cti_device_release(struct device *dev)
> > >       mutex_lock(&ect_mutex);
> > >       cti_remove_conn_xrefs(drvdata);
> > >
> > > +     /* clear the dynamic sysfs associate with connections */
> >
> > s/associate/associated
> >
> > > +     cti_remove_all_sysfs_links(drvdata);
> > > +
> > >       /* remove from the list */
> > >       list_for_each_entry_safe(ect_item, ect_tmp, &ect_net, node) {
> > >               if (ect_item == drvdata) {
> >
> > With the above:
> >
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> >
> > > --
> > > 2.17.1
> > >
> 
> 
> 
> -- 
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK
