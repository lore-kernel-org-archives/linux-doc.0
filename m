Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2DDC43460
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 10:45:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 051C061991
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 10:45:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232420AbhEJKqR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 May 2021 06:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232877AbhEJKop (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 May 2021 06:44:45 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FD21C061344
        for <linux-doc@vger.kernel.org>; Mon, 10 May 2021 03:34:16 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id s22so12966923pgk.6
        for <linux-doc@vger.kernel.org>; Mon, 10 May 2021 03:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GbEg5B1XI9iNST/E/f70TSfKy/dyLBSsJanb6FiDxic=;
        b=f59ner0D/1qo5HyqTZPlnjeQGdv7ehb8TdlVTo883tA/MXBcSAIscvH2kflRetliLC
         2ldbA4AOnMUr/99l1qryK6AOVgMBHunKzEHL/8Dh1NDK9SueoJw/qeG8RdHl2Op/gzox
         L5wdoQkSdijVZGPr49AJgJ7z3J1DewJWUEkdLff0xSkZZwvITSznBNxdWJFuwOygvU5Y
         J2dLOxY4NbqekqowGzzndqj7IrRuz4/t+O3heK9u1Xzeb2rJBWbSG9sTkueoQ+GzrKWl
         dN7rmghZQrBAgGrUeDTAIEJ1MJjXNtmUAmttQKTKQH1rrqCmJdnTbJGYurasAK/zkqwo
         ykIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GbEg5B1XI9iNST/E/f70TSfKy/dyLBSsJanb6FiDxic=;
        b=LZ8FGcx1uFw+znacmS+ouH3oIXb7dWeY7hDGaDKrY+IdY2oiezDSKVaZsdp8ZN7/vl
         H85oszrtPLsdNfvmVOEqG3Ht7bl1N+N+4+z9K8pfo6AvYc8xIBjdNRL1nd4dgmzVU6Bm
         uAFfMJt8ibm/A49OSyA4stmbEMPUZV4jSEU3wy6fay7+6JIAgFm/uAdZV4yhIfueRoQW
         3mxWlG8xmyYiFEwlAEvQz4w4XzkAshxpj+20C0dq6Vyx+953quRO7LfE1vK/HBgTRKZO
         2cwIkefxD3fE2DU12NcjWMEkJTGp26cZOTa+hztmhW9PW6DVAybqh5dzf/AK4w7LCkK/
         11Zg==
X-Gm-Message-State: AOAM532s60TeIQkHYkd7OPMljCz1bJlXJkiKmQAdqtVRGqRN/YwXsgM6
        NN+CT0fd9wl8cLpyHR2ADJxiWBsyPO9UGDzbaaPbRg==
X-Google-Smtp-Source: ABdhPJyHUEien5qCpH7v1ah8orxYfkawudbsyoFQsZ5IuBkIgJ3pV0ZZhlDNcBUrx9QSpxHHGhQ+bS4LMxBGt3jpl1s=
X-Received: by 2002:a63:b206:: with SMTP id x6mr11623323pge.341.1620642855648;
 Mon, 10 May 2021 03:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210510030027.56044-1-songmuchun@bytedance.com>
 <20210510030027.56044-9-songmuchun@bytedance.com> <20210510100809.GA22664@linux>
In-Reply-To: <20210510100809.GA22664@linux>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Mon, 10 May 2021 18:33:38 +0800
Message-ID: <CAMZfGtVzwA+35az8ARxzVmTnt=pGObJvG=a23_2_7TVptmzN1g@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v23 8/9] mm: memory_hotplug: disable
 memmap_on_memory when hugetlb_free_vmemmap enabled
To:     Oscar Salvador <osalvador@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, bp@alien8.de,
        X86 ML <x86@kernel.org>, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>, paulmck@kernel.org,
        pawan.kumar.gupta@linux.intel.com,
        Randy Dunlap <rdunlap@infradead.org>, oneukum@suse.com,
        anshuman.khandual@arm.com, jroedel@suse.de,
        Mina Almasry <almasrymina@google.com>,
        David Rientjes <rientjes@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        =?UTF-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPoyDnm7TkuZ8p?= 
        <naoya.horiguchi@nec.com>,
        Joao Martins <joao.m.martins@oracle.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        fam.zheng@bytedance.com, zhengqi.arch@bytedance.com,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 10, 2021 at 6:08 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Mon, May 10, 2021 at 11:00:26AM +0800, Muchun Song wrote:
> > diff --git a/drivers/acpi/acpi_memhotplug.c b/drivers/acpi/acpi_memhotplug.c
> > index 8cc195c4c861..0d7f595ee441 100644
> > --- a/drivers/acpi/acpi_memhotplug.c
> > +++ b/drivers/acpi/acpi_memhotplug.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/acpi.h>
> >  #include <linux/memory.h>
> >  #include <linux/memory_hotplug.h>
> > +#include <linux/hugetlb.h>
> >
> >  #include "internal.h"
>
> Uhm, I am confused.
> Why do we need this here? AFAICS, we do not.
>
> The function is in memory_hotplug.c, and that alrady has that include.
> What am I missing?

You are right. That include is redundant. I will remove it
from acpi_memhotplug.c. Thanks Oscar.

>
>
> --
> Oscar Salvador
> SUSE L3
