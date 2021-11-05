Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B836C433EF
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 00:31:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 458B36124D
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 00:31:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbhKEAeh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Nov 2021 20:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbhKEAeg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Nov 2021 20:34:36 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE54C061714
        for <linux-doc@vger.kernel.org>; Thu,  4 Nov 2021 17:31:58 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id v23so17731pjr.5
        for <linux-doc@vger.kernel.org>; Thu, 04 Nov 2021 17:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BsG61L7IKjHxv8q9I3AHXY4seKqtKLeUDkmnvn0KnP8=;
        b=f2aFR1Fm8LSmJU324PxSLHMJ0vM2TsbHB+Jt0aFhdwrv4uFbXTc8tL0tTLJFkljgMX
         aepjsXWXDRTwLoWLppme8/smx82NczNW+0yIrVuHrAUNhwQhHrIS9FQTLX68f4YGvrAd
         6oX+HvJV4dZZWm0hRaMq5XoNwGnEMZXMmRgrt4Q0ozb1JALvsSkr3gAyuEQIbP0zFau+
         vfCKgkpBihG+RZdymSvrJzqnk5J5LzVBWBkGB5hniGExdwxUmzKqqK2r8L9VaRIyO7Wv
         ySEGxxIsK76syxRbpoYaOkOAp5FcoTHjG/c+z53jEET0JwjZ28ZVw7Xm3eTg1UYW0kTy
         8cCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BsG61L7IKjHxv8q9I3AHXY4seKqtKLeUDkmnvn0KnP8=;
        b=cfolDMhhoR7ZONUHGMjICQyjcbJcHaFNV2Vy8/cp2HofGJ3+ScP277IWBqrS6aD6jr
         bLCJagV183iPJu5FxLkdVYVc7MV4m6DbC4Z+Os0QDn6gD+OTeDW4Sda6n6mAKVzlQfUT
         hZRH4EPOTsam6oN8FrYdfwrOuKQHVCeaxlAVdc4yWkL8kNE0wU50Tg+jt+FXPrSCtSw0
         T/CbvhzLtQiTqStHafDGBdGhwe9GHIdgVv9X1oTHmeyfItnxzoYpynxSQVHrex6S9EdQ
         L3afdl8RLn0QLcMldEWp+GDhQ7Ouo0QErNLOZgBTgdXpQbxUeL0G8XQZsYvCUPQ4YzhZ
         cJGg==
X-Gm-Message-State: AOAM530fhIEL3kUTfAwD812bzR72FtbpXaXaxhYk5UFLXxMRoUk1JcYm
        AIVl2KcidowFJyJXZlm65tAjcoTrm3oMTEqXc1kNwQ==
X-Google-Smtp-Source: ABdhPJzdNJs/yaP7/e0Ok6RA1nQ7eSYjB01hdhGvhZElvzf3xImzKee5uyaUgzfX2cFNO/XPNkKFDEdlcXooM37lnlQ=
X-Received: by 2002:a17:90b:1e07:: with SMTP id pg7mr5702299pjb.93.1636072317543;
 Thu, 04 Nov 2021 17:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210827145819.16471-1-joao.m.martins@oracle.com> <20210827145819.16471-7-joao.m.martins@oracle.com>
In-Reply-To: <20210827145819.16471-7-joao.m.martins@oracle.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Thu, 4 Nov 2021 17:31:47 -0700
Message-ID: <CAPcyv4hPV9Vur1uvga7S4krQAmKZK5jrBrdOuK1AFHVE8Zk1DA@mail.gmail.com>
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

On Fri, Aug 27, 2021 at 7:59 AM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> Right now, only static dax regions have a valid @pgmap pointer in its
> struct dev_dax. Dynamic dax case however, do not.
>
> In preparation for device-dax compound devmap support, make sure that
> dev_dax pgmap field is set after it has been allocated and initialized.
>
> dynamic dax device have the @pgmap is allocated at probe() and it's
> managed by devm (contrast to static dax region which a pgmap is provided
> and dax core kfrees it). So in addition to ensure a valid @pgmap, clear
> the pgmap when the dynamic dax device is released to avoid the same
> pgmap ranges to be re-requested across multiple region device reconfigs.
>
> Suggested-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  drivers/dax/bus.c    | 8 ++++++++
>  drivers/dax/device.c | 2 ++
>  2 files changed, 10 insertions(+)
>
> diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
> index 6cc4da4c713d..49dbff9ba609 100644
> --- a/drivers/dax/bus.c
> +++ b/drivers/dax/bus.c
> @@ -363,6 +363,14 @@ void kill_dev_dax(struct dev_dax *dev_dax)
>
>         kill_dax(dax_dev);
>         unmap_mapping_range(inode->i_mapping, 0, 0, 1);
> +
> +       /*
> +        * Dynamic dax region have the pgmap allocated via dev_kzalloc()
> +        * and thus freed by devm. Clear the pgmap to not have stale pgmap
> +        * ranges on probe() from previous reconfigurations of region devices.
> +        */
> +       if (!is_static(dev_dax->region))
> +               dev_dax->pgmap = NULL;
>  }
>  EXPORT_SYMBOL_GPL(kill_dev_dax);
>
> diff --git a/drivers/dax/device.c b/drivers/dax/device.c
> index 0b82159b3564..6e348b5f9d45 100644
> --- a/drivers/dax/device.c
> +++ b/drivers/dax/device.c
> @@ -426,6 +426,8 @@ int dev_dax_probe(struct dev_dax *dev_dax)
>         }
>
>         pgmap->type = MEMORY_DEVICE_GENERIC;
> +       dev_dax->pgmap = pgmap;

So I think I'd rather see a bigger patch that replaces some of the
implicit dev_dax->pgmap == NULL checks with explicit is_static()
checks. Something like the following only compile and boot tested...
Note the struct_size() change probably wants to be its own cleanup,
and the EXPORT_SYMBOL_NS_GPL(..., DAX) probably wants to be its own
patch converting over the entirety of drivers/dax/. Thoughts?


diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index 6cc4da4c713d..67ab7e05b340 100644
--- a/drivers/dax/bus.c
+++ b/drivers/dax/bus.c
@@ -134,6 +134,12 @@ static bool is_static(struct dax_region *dax_region)
        return (dax_region->res.flags & IORESOURCE_DAX_STATIC) != 0;
 }

+bool static_dev_dax(struct dev_dax *dev_dax)
+{
+       return is_static(dev_dax->region);
+}
+EXPORT_SYMBOL_NS_GPL(static_dev_dax, DAX);
+
 static u64 dev_dax_size(struct dev_dax *dev_dax)
 {
        u64 size = 0;
@@ -363,6 +369,8 @@ void kill_dev_dax(struct dev_dax *dev_dax)

        kill_dax(dax_dev);
        unmap_mapping_range(inode->i_mapping, 0, 0, 1);
+       if (static_dev_dax(dev_dax))
+               dev_dax->pgmap = NULL;
 }
 EXPORT_SYMBOL_GPL(kill_dev_dax);

diff --git a/drivers/dax/bus.h b/drivers/dax/bus.h
index 1e946ad7780a..4acdfee7dd59 100644
--- a/drivers/dax/bus.h
+++ b/drivers/dax/bus.h
@@ -48,6 +48,7 @@ int __dax_driver_register(struct dax_device_driver *dax_drv,
        __dax_driver_register(driver, THIS_MODULE, KBUILD_MODNAME)
 void dax_driver_unregister(struct dax_device_driver *dax_drv);
 void kill_dev_dax(struct dev_dax *dev_dax);
+bool static_dev_dax(struct dev_dax *dev_dax);

 #if IS_ENABLED(CONFIG_DEV_DAX_PMEM_COMPAT)
 int dev_dax_probe(struct dev_dax *dev_dax);
diff --git a/drivers/dax/device.c b/drivers/dax/device.c
index dd8222a42808..87507aff2b10 100644
--- a/drivers/dax/device.c
+++ b/drivers/dax/device.c
@@ -398,31 +398,43 @@ int dev_dax_probe(struct dev_dax *dev_dax)
        void *addr;
        int rc, i;

-       pgmap = dev_dax->pgmap;
-       if (dev_WARN_ONCE(dev, pgmap && dev_dax->nr_range > 1,
-                       "static pgmap / multi-range device conflict\n"))
+       if (static_dev_dax(dev_dax) && dev_dax->nr_range > 1) {
+               dev_warn(dev, "static pgmap / multi-range device conflict\n");
                return -EINVAL;
+       }

-       if (!pgmap) {
-               pgmap = devm_kzalloc(dev, sizeof(*pgmap) + sizeof(struct range)
-                               * (dev_dax->nr_range - 1), GFP_KERNEL);
+       if (static_dev_dax(dev_dax)) {
+               pgmap = dev_dax->pgmap;
+       } else {
+               if (dev_dax->pgmap) {
+                       dev_warn(dev,
+                                "dynamic-dax with pre-populated page map!?\n");
+                       return -EINVAL;
+               }
+               pgmap = devm_kzalloc(
+                       dev, struct_size(pgmap, ranges, dev_dax->nr_range - 1),
+                       GFP_KERNEL);
                if (!pgmap)
                        return -ENOMEM;
                pgmap->nr_range = dev_dax->nr_range;
+               dev_dax->pgmap = pgmap;
+               for (i = 0; i < dev_dax->nr_range; i++) {
+                       struct range *range = &dev_dax->ranges[i].range;
+
+                       pgmap->ranges[i] = *range;
+               }
        }

        for (i = 0; i < dev_dax->nr_range; i++) {
                struct range *range = &dev_dax->ranges[i].range;

-               if (!devm_request_mem_region(dev, range->start,
-                                       range_len(range), dev_name(dev))) {
-                       dev_warn(dev, "mapping%d: %#llx-%#llx could
not reserve range\n",
-                                       i, range->start, range->end);
-                       return -EBUSY;
-               }
-               /* don't update the range for static pgmap */
-               if (!dev_dax->pgmap)
-                       pgmap->ranges[i] = *range;
+               if (devm_request_mem_region(dev, range->start, range_len(range),
+                                           dev_name(dev)))
+                       continue;
+               dev_warn(dev,
+                        "mapping%d: %#llx-%#llx could not reserve range\n", i,
+                        range->start, range->end);
+               return -EBUSY;
        }

        pgmap->type = MEMORY_DEVICE_GENERIC;
@@ -473,3 +485,4 @@ MODULE_LICENSE("GPL v2");
 module_init(dax_init);
 module_exit(dax_exit);
 MODULE_ALIAS_DAX_DEVICE(0);
+MODULE_IMPORT_NS(DAX);



> +
>         addr = devm_memremap_pages(dev, pgmap);
>         if (IS_ERR(addr))
>                 return PTR_ERR(addr);
> --
> 2.17.1
>
