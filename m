Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D32C433F5
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 16:46:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7311C610A8
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 16:46:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233353AbhKEQsy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 Nov 2021 12:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232930AbhKEQsy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Nov 2021 12:48:54 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F41C061714
        for <linux-doc@vger.kernel.org>; Fri,  5 Nov 2021 09:46:14 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id e65so8843139pgc.5
        for <linux-doc@vger.kernel.org>; Fri, 05 Nov 2021 09:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lXU1evVAtDIYyxpbCVG0DKdvWGgW3AUmmshhDnEptSc=;
        b=LsB4X3FHyFmj4FScAj3ADT6Cv3U/YQ+CYnlGk/TRdD0Wo4eaAe/NQJ5eAqUQtQgcNP
         F5RS81yLntbRtk8bO3pTr1RG/zTzjk21q2M7ulejuN4g0IhN5yAI/7dl+nSLzE1vGqNZ
         oNA7uFJP+z4ZvrsW+XQe0C8JdZ/DoAESnyPDy/M2bWkV+kIDXafExBtXsCTx0KWO5kyn
         cVDItLClvTf/xy2/pmGJP/TG5jpxzz1q6QCQaFtblHBglmHQzmeq0EFWeUtVX8FhYmXQ
         6LDczPvQBm83iiy6zp4YG6P9k7K6bKcCiCDSZsliZVQmMIcj16qbuYnsquQk7lCLrO5l
         hgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lXU1evVAtDIYyxpbCVG0DKdvWGgW3AUmmshhDnEptSc=;
        b=p6nrxiJdovF+nL1tKLPjnkEJfEZcFvawoDVFwRFyptYktGbGlWgQ6Xv5DV23LP2K6r
         dOtm7DMD6JA+dK9qiPvQt1lk4rnqB9gbgT9fGUzl4yq6O1EkV9x9fgjIcbRY9N3JfbgH
         92hrIwrTkinADZqZ42oXzUf3Nnr8D+5VCYZQoCEqUgvwiF2cS/GHiza7JMCR8tIGOXtq
         obaI/F1iFLHZKHcyHe79+lAq+jtGMMhJfkA+RkVxG3QBK0CiJHz2TJqDNZLsM7Ali3ab
         d38fragSRS+jOsWdPEfSOg+vqU0nCwppR80atxpoPo5X/B9UYdj6ajGgG415vPQoE6Oc
         ZTxQ==
X-Gm-Message-State: AOAM530o1NbNwciIaMfyCRITUu2TY+vWa85rgLGfepMWMGpcNNvbAOxY
        gCZfioUKy20ccQ17imsE8p/uavR6NyUzOclI+Js5MQ==
X-Google-Smtp-Source: ABdhPJyP+Tlavfs5UgcKqdZzIi2pYsL42ZA8z+xuldwRIwTUXlZ2TpvryXxER7FVnULaBckuqqFV+WEiNd/HzsnFwh4=
X-Received: by 2002:aa7:8019:0:b0:44d:d761:6f79 with SMTP id
 j25-20020aa78019000000b0044dd7616f79mr61073475pfi.3.1636130773706; Fri, 05
 Nov 2021 09:46:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210827145819.16471-1-joao.m.martins@oracle.com>
 <20210827145819.16471-7-joao.m.martins@oracle.com> <CAPcyv4hPV9Vur1uvga7S4krQAmKZK5jrBrdOuK1AFHVE8Zk1DA@mail.gmail.com>
 <f33c2037-4bee-3564-75c0-c87f99325c02@oracle.com>
In-Reply-To: <f33c2037-4bee-3564-75c0-c87f99325c02@oracle.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Fri, 5 Nov 2021 09:46:04 -0700
Message-ID: <CAPcyv4hE86SXyamXWhZEDHnhAZ_wty-DqD6t4cmkEdKdDwhpMw@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] device-dax: ensure dev_dax->pgmap is valid for
 dynamic devices
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Jane Chu <jane.chu@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Christoph Hellwig <hch@lst.de>,
        Linux NVDIMM <nvdimm@lists.linux.dev>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 5, 2021 at 5:10 AM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> On 11/5/21 00:31, Dan Williams wrote:
> > On Fri, Aug 27, 2021 at 7:59 AM Joao Martins <joao.m.martins@oracle.com> wrote:
> >>
> >> Right now, only static dax regions have a valid @pgmap pointer in its
> >> struct dev_dax. Dynamic dax case however, do not.
> >>
> >> In preparation for device-dax compound devmap support, make sure that
> >> dev_dax pgmap field is set after it has been allocated and initialized.
> >>
> >> dynamic dax device have the @pgmap is allocated at probe() and it's
> >> managed by devm (contrast to static dax region which a pgmap is provided
> >> and dax core kfrees it). So in addition to ensure a valid @pgmap, clear
> >> the pgmap when the dynamic dax device is released to avoid the same
> >> pgmap ranges to be re-requested across multiple region device reconfigs.
> >>
> >> Suggested-by: Dan Williams <dan.j.williams@intel.com>
> >> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> >> ---
> >>  drivers/dax/bus.c    | 8 ++++++++
> >>  drivers/dax/device.c | 2 ++
> >>  2 files changed, 10 insertions(+)
> >>
> >> diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
> >> index 6cc4da4c713d..49dbff9ba609 100644
> >> --- a/drivers/dax/bus.c
> >> +++ b/drivers/dax/bus.c
> >> @@ -363,6 +363,14 @@ void kill_dev_dax(struct dev_dax *dev_dax)
> >>
> >>         kill_dax(dax_dev);
> >>         unmap_mapping_range(inode->i_mapping, 0, 0, 1);
> >> +
> >> +       /*
> >> +        * Dynamic dax region have the pgmap allocated via dev_kzalloc()
> >> +        * and thus freed by devm. Clear the pgmap to not have stale pgmap
> >> +        * ranges on probe() from previous reconfigurations of region devices.
> >> +        */
> >> +       if (!is_static(dev_dax->region))
> >> +               dev_dax->pgmap = NULL;
> >>  }
> >>  EXPORT_SYMBOL_GPL(kill_dev_dax);
> >>
> >> diff --git a/drivers/dax/device.c b/drivers/dax/device.c
> >> index 0b82159b3564..6e348b5f9d45 100644
> >> --- a/drivers/dax/device.c
> >> +++ b/drivers/dax/device.c
> >> @@ -426,6 +426,8 @@ int dev_dax_probe(struct dev_dax *dev_dax)
> >>         }
> >>
> >>         pgmap->type = MEMORY_DEVICE_GENERIC;
> >> +       dev_dax->pgmap = pgmap;
> >
> > So I think I'd rather see a bigger patch that replaces some of the
> > implicit dev_dax->pgmap == NULL checks with explicit is_static()
> > checks. Something like the following only compile and boot tested...
> > Note the struct_size() change probably wants to be its own cleanup,
> > and the EXPORT_SYMBOL_NS_GPL(..., DAX) probably wants to be its own
> > patch converting over the entirety of drivers/dax/. Thoughts?
> >
> It's a good idea. Certainly the implicit pgmap == NULL made it harder
> than the necessary to find where the problem was. So turning those checks
> into explicit checks that differentiate static vs dynamic dax will help
>
> With respect to this series converting those pgmap == NULL is going to need
> to made me export the symbol (provided dax core and dax device can be built
> as modules). So I don't know how this can be a patch converting entirety of
> dax. Perhaps you mean that I would just EXPORT_SYMBOL() and then a bigger
> patch introduces the MODULE_NS_IMPORT() And EXPORT_SYMBOL_NS*() separately.

Yeah, either a lead-in patch to do the conversion, or a follow on to
convert everything after the fact. Either way works for me, but I have
a small preference for the lead-in patch.

>
> The struct_size, yeah, should be a separate patch much like commit 7d18dd75a8af
> ("device-dax/kmem: use struct_size()").

Yeah.

>
> minor comment below on your snippet.
>
> >
> > diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
> > index 6cc4da4c713d..67ab7e05b340 100644
> > --- a/drivers/dax/bus.c
> > +++ b/drivers/dax/bus.c
> > @@ -134,6 +134,12 @@ static bool is_static(struct dax_region *dax_region)
> >         return (dax_region->res.flags & IORESOURCE_DAX_STATIC) != 0;
> >  }
> >
> > +bool static_dev_dax(struct dev_dax *dev_dax)
> > +{
> > +       return is_static(dev_dax->region);
> > +}
> > +EXPORT_SYMBOL_NS_GPL(static_dev_dax, DAX);
> > +
> >  static u64 dev_dax_size(struct dev_dax *dev_dax)
> >  {
> >         u64 size = 0;
> > @@ -363,6 +369,8 @@ void kill_dev_dax(struct dev_dax *dev_dax)
> >
> >         kill_dax(dax_dev);
> >         unmap_mapping_range(inode->i_mapping, 0, 0, 1);
> > +       if (static_dev_dax(dev_dax))
> > +               dev_dax->pgmap = NULL;
> >  }
>
> Here you probably meant !static_dev_dax() per my patch.

Oops, yes.

>
> >  EXPORT_SYMBOL_GPL(kill_dev_dax);
> >
> > diff --git a/drivers/dax/bus.h b/drivers/dax/bus.h
> > index 1e946ad7780a..4acdfee7dd59 100644
> > --- a/drivers/dax/bus.h
> > +++ b/drivers/dax/bus.h
> > @@ -48,6 +48,7 @@ int __dax_driver_register(struct dax_device_driver *dax_drv,
> >         __dax_driver_register(driver, THIS_MODULE, KBUILD_MODNAME)
> >  void dax_driver_unregister(struct dax_device_driver *dax_drv);
> >  void kill_dev_dax(struct dev_dax *dev_dax);
> > +bool static_dev_dax(struct dev_dax *dev_dax);
> >
> >  #if IS_ENABLED(CONFIG_DEV_DAX_PMEM_COMPAT)
> >  int dev_dax_probe(struct dev_dax *dev_dax);
> > diff --git a/drivers/dax/device.c b/drivers/dax/device.c
> > index dd8222a42808..87507aff2b10 100644
> > --- a/drivers/dax/device.c
> > +++ b/drivers/dax/device.c
> > @@ -398,31 +398,43 @@ int dev_dax_probe(struct dev_dax *dev_dax)
> >         void *addr;
> >         int rc, i;
> >
> > -       pgmap = dev_dax->pgmap;
> > -       if (dev_WARN_ONCE(dev, pgmap && dev_dax->nr_range > 1,
> > -                       "static pgmap / multi-range device conflict\n"))
> > +       if (static_dev_dax(dev_dax) && dev_dax->nr_range > 1) {
> > +               dev_warn(dev, "static pgmap / multi-range device conflict\n");
> >                 return -EINVAL;
> > +       }
> >
> > -       if (!pgmap) {
> > -               pgmap = devm_kzalloc(dev, sizeof(*pgmap) + sizeof(struct range)
> > -                               * (dev_dax->nr_range - 1), GFP_KERNEL);
> > +       if (static_dev_dax(dev_dax)) {
> > +               pgmap = dev_dax->pgmap;
> > +       } else {
> > +               if (dev_dax->pgmap) {
> > +                       dev_warn(dev,
> > +                                "dynamic-dax with pre-populated page map!?\n");
> > +                       return -EINVAL;
> > +               }
> > +               pgmap = devm_kzalloc(
> > +                       dev, struct_size(pgmap, ranges, dev_dax->nr_range - 1),
> > +                       GFP_KERNEL);
> >                 if (!pgmap)
> >                         return -ENOMEM;
> >                 pgmap->nr_range = dev_dax->nr_range;
> > +               dev_dax->pgmap = pgmap;
> > +               for (i = 0; i < dev_dax->nr_range; i++) {
> > +                       struct range *range = &dev_dax->ranges[i].range;
> > +
> > +                       pgmap->ranges[i] = *range;
> > +               }
> >         }
> >
> This code move is probably not needed unless your point is to have a more clear
> separation on what's initialization versus the mem region request (that's
> applicable to both dynamic and static).

It was more of an RFC cleanup idea and yes, should be its own patch if
you think it helps make the init path clearer.
