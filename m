Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A12F47D57F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Sep 2018 08:17:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727508AbeIJNKj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Sep 2018 09:10:39 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:43562 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727535AbeIJNKj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Sep 2018 09:10:39 -0400
Received: by mail-io1-f65.google.com with SMTP id y10-v6so6308672ioa.10
        for <linux-doc@vger.kernel.org>; Mon, 10 Sep 2018 01:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=uWzVMMIO93NuAdQGiXGatsFz/VIYrQynIseni8Cl9E4=;
        b=U9IDgDAue1xJIoIdwZ0V7jWZ1sDddI8TQk85V29hC4wDyfW5Atn+DrfSquuidgYshe
         kJzorRowSK7YCUGRf+I+tByF8PtRz99D3N5c2VxNMUHcZUKFjtJiKy7up+SX5ASCplM5
         9cgNd6T7u/H7BtxUs3l0vKDw/QJPWBrAeRxtXyJRVU7oDcOv/kTAFSvTyyJ/mbKiQBgW
         2Eznt2yrWiKO23hn8M1X2IAeoXngUJT3z55S5UmIe3G1hBHGGF5uDvqYf09kcabCaBL0
         gXO5a3Pf4H+mb8i5wsgLjeDINLffyCoFNd6Yy+nPO7JzHIBpyXVS+gjKNOt82ueGIYfP
         qwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=uWzVMMIO93NuAdQGiXGatsFz/VIYrQynIseni8Cl9E4=;
        b=cEeJYhnoXdo9p2LfY7QbRhdDmnfYD//SUqHVTNPPjzERYL3eczz2CvOQMUbwMJpFg2
         61ht71L4e2/NkhBZpTayfzQTCiIrhUrw2oaHpPjsulihaI++i1T9wl57InLC0Pi+CbBp
         r9N3iQRz8pNIADFiQpppfABhgDVdf8pebsdaWSYWdwfeqJvdQGikhdpL1K/FWQJhfKsv
         bwKMOuppiUkjs8uBU9JW7lSDDPJsaLHxmCAmogFHbtR9Z5jjkIGFuOAnLvAR3GN0ccmP
         bjMOfdfh/xQMgfqsrjqzWuc45jU0vdfjvOlBawJbnUxxn1gU90tNP+yF/geOV/2M0Y+V
         GmaA==
X-Gm-Message-State: APzg51CwMEfxodfIt+eADaDhc/xkJlTGWTPAZKaqWS2vhqAPfF3AtcjT
        A/+jyrBNLLmIokh8SxtN3OrwL/bChi9/zQUt8WDxlA==
X-Google-Smtp-Source: ANB0VdaQKNGhFOLvj+Yi6uNRW1HJpmzwKmbLoPMkqVk4urblcmI9Y/X5h39p2jPTPqg6NqywDDcU1+k/Ggbni5wE0qk=
X-Received: by 2002:a6b:6401:: with SMTP id t1-v6mr16648388iog.111.1536567468551;
 Mon, 10 Sep 2018 01:17:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:1905:0:0:0:0:0 with HTTP; Mon, 10 Sep 2018 01:17:48
 -0700 (PDT)
In-Reply-To: <484b6ec5-cd8e-e5c5-0c5c-2f11c504ea1c@linaro.org>
References: <20180907100750.14564-1-brgl@bgdev.pl> <20180907100750.14564-14-brgl@bgdev.pl>
 <484b6ec5-cd8e-e5c5-0c5c-2f11c504ea1c@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 10 Sep 2018 10:17:48 +0200
Message-ID: <CAMRc=MdnSHY1ah4X3Bu55HvZcOQHxPHaFudidDA4mEOW9ZzeEg@mail.gmail.com>
Subject: Re: [PATCH v2 13/16] nvmem: add support for cell lookups from machine code
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        David Lechner <david@lechnology.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>, Alban Bedel <albeu@free.fr>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-09-10 9:32 GMT+02:00 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>:
>
>
> On 07/09/18 11:07, Bartosz Golaszewski wrote:
>>
>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> Add a way for machine code users to associate devices with nvmem cells.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> ---
>>   drivers/nvmem/core.c          | 143 +++++++++++++++++++++++++++-------
>>   include/linux/nvmem-machine.h |  16 ++++
>>   2 files changed, 132 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
>> index da7a9d5beb33..9e2f9c993a07 100644
>> --- a/drivers/nvmem/core.c
>> +++ b/drivers/nvmem/core.c
>> @@ -62,6 +62,9 @@ static DEFINE_IDA(nvmem_ida);
>>   static DEFINE_MUTEX(nvmem_cell_mutex);
>>   static LIST_HEAD(nvmem_cell_tables);
>>   +static DEFINE_MUTEX(nvmem_lookup_mutex);
>> +static LIST_HEAD(nvmem_lookup_list);
>> +
>>   static BLOCKING_NOTIFIER_HEAD(nvmem_notifier);
>>     #ifdef CONFIG_DEBUG_LOCK_ALLOC
>> @@ -285,6 +288,18 @@ static struct nvmem_device *of_nvmem_find(struct
>> device_node *nvmem_np)
>>         return to_nvmem_device(d);
>>   }
>>   +static struct nvmem_device *nvmem_find(const char *name)
>> +{
>> +       struct device *d;
>> +
>> +       d = bus_find_device_by_name(&nvmem_bus_type, NULL, name);
>> +
>> +       if (!d)
>> +               return NULL;
>> +
>> +       return to_nvmem_device(d);
>> +}
>> +
>
> This is removed and added back in same patch, you should consider
> positioning the caller if possible to avoid any un-necessary changes.
>
>>   static void nvmem_cell_drop(struct nvmem_cell *cell)
>>   {
>>         mutex_lock(&nvmem_mutex);
>> @@ -421,6 +436,21 @@ nvmem_find_cell_by_index(struct nvmem_device *nvmem,
>> int index)
>>         return cell;
>>   }
>>   +static struct nvmem_cell *
>> +nvmem_cell_get_from_lookup(struct device *dev, const char *con_id)
>> +{
>> +       struct nvmem_cell *cell = ERR_PTR(-ENOENT);
>> +       struct nvmem_cell_lookup *lookup;
>> +       struct nvmem_device *nvmem;
>> +       const char *dev_id;
>> +
>> +       if (!dev)
>> +               return ERR_PTR(-EINVAL);
>> +
>> +       dev_id = dev_name(dev);
>> +
>> +       mutex_lock(&nvmem_lookup_mutex);
>> +
>> +       list_for_each_entry(lookup, &nvmem_lookup_list, node) {
>> +               if ((strcmp(lookup->dev_id, dev_id) == 0) &&
>> +                   (strcmp(lookup->con_id, con_id) == 0)) {
>> +                       /* This is the right entry. */
>> +                       nvmem = __nvmem_device_get(NULL,
>> lookup->nvmem_name);
>> +                       if (!nvmem) {
>> +                               /* Provider may not be registered yet. */
>> +                               cell = ERR_PTR(-EPROBE_DEFER);
>> +                               goto out;
>> +                       }
>> +
>> +                       cell = nvmem_find_cell_by_name(nvmem,
>> +                                                      lookup->cell_name);
>> +                       if (!cell)
>> +                               goto out;
>
> Here nvmem refcount has already increased, you should probably fix this!

Indeed.

>>
>> +               }
>> +       }
>> +
>> +out:
>> +       mutex_unlock(&nvmem_lookup_mutex);
>> +       return cell;
>> +}
>
>
> ...
>
>> diff --git a/include/linux/nvmem-machine.h b/include/linux/nvmem-machine.h
>
>
> Should be part of nvmem-consumer.h.
>

If anything, this should probably go to nvmem-provider.h. But I like
the gpiolib way of putting machine-specific code into a separate
header. Most systems are not interested in these definitions anyway.
IMO this is a valid use case where creating a new header makes sense.

Bart

>> index 1e199dfaacab..7859c08934d5 100644
>> --- a/include/linux/nvmem-machine.h
>> +++ b/include/linux/nvmem-machine.h
>> @@ -26,16 +26,32 @@ struct nvmem_cell_table {
>>         struct list_head        node;
>>   };
>>   +struct nvmem_cell_lookup {
>> +       const char              *nvmem_name;
>> +       const char              *cell_name;
>> +       const char              *dev_id;
>> +       const char              *con_id;
>> +       struct list_head        node;
>> +};
>
>
> Consider adding kerneldoc to this structure.
>
>
>> +
>>   #if IS_ENABLED(CONFIG_NVMEM)
>>     void nvmem_add_cell_table(struct nvmem_cell_table *table);
>>   void nvmem_del_cell_table(struct nvmem_cell_table *table);
>>   +void nvmem_add_cell_lookups(struct nvmem_cell_lookup *entries, size_t
>> nentries);
>> +void nvmem_del_cell_lookups(struct nvmem_cell_lookup *entries, size_t
>> nentries);
>> +
>>   #else /* CONFIG_NVMEM */
>>     static inline void nvmem_add_cell_table(struct nvmem_cell_table
>> *table) {}
>>   static inline void nvmem_del_cell_table(struct nvmem_cell_table *table)
>> {}
>>   +static inline void
>> +nvmem_add_cell_lookups(struct nvmem_cell_lookup *entries, size_t
>> nentries) {}
>> +static inline void
>> +nvmem_del_cell_lookups(struct nvmem_cell_lookup *entries, size_t
>> nentries) {}
>> +
>>   #endif /* CONFIG_NVMEM */
>>     #endif  /* ifndef _LINUX_NVMEM_MACHINE_H */
>>
>
