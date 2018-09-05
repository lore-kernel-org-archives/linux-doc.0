Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2A80E7D57F
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Sep 2018 14:48:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727577AbeIETSa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Sep 2018 15:18:30 -0400
Received: from mail-it0-f66.google.com ([209.85.214.66]:40234 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbeIETSa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Sep 2018 15:18:30 -0400
Received: by mail-it0-f66.google.com with SMTP id h23-v6so9771170ita.5
        for <linux-doc@vger.kernel.org>; Wed, 05 Sep 2018 07:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=l9pDxMXzKswdZPFz08WyTfA+3C3O2/jU1c8Et0lpuxo=;
        b=ee4Lth/IEAm8qgztzBcw32ktio8HF0H9eToPDQDwxv83JmMJ6Od3fjCihTgjKqJAWz
         lHZq3ssWoJqYPuyvKfhBJrJ00bCrkzQVCKAgOUpyOCcNrMz9kZe/TpQkbDcVkpdIqIAo
         Hg2oNcZk6gKqhAYTZsK7ctxBOxC153lM1P8Tuq2+wRtev8FcicKPoy2gHFn1zXZFcXjm
         8LCTMceHQfs8wsaiAsHpabUguh2VieGOFaurDcKi7mqQCk9YQAwYozli7rEjU/iy32he
         53QoqCy+AMgVDU77XE2T6d4vmAgh640oM9XBL3j822R+4XF8d0NTs35/ChIQBdbxuKl2
         AFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=l9pDxMXzKswdZPFz08WyTfA+3C3O2/jU1c8Et0lpuxo=;
        b=rCLKa01ZcKIU0L+D16GyXInnRLccYK1SaFfhV2q9QaNDTlExk2aBgnozUu0DxF7NXU
         uyzgjmG8io0s6/WnduHShE8OHOviYKBGqMD/1qEKpAUdoXJLxL0eaqRB0WjsuVSJPOY8
         Z00kndG9NkjQdtQVsCwd0qQ0Tz6wwhHDu5MZUabdKHTxSc9256zEVVd5MpdGaXocd5Zz
         6m13xoRFwPcdkfiHsqdHbwaH0RSYJZNAGB/ekCwtjWc1gWi5aPoosKW9/6QPhUfqUz0u
         j072CXkRnYb0RZ5mD5rq0Lzz7eFsRk4o20KocSYWum9JsEzVRauC8xgoNS0TbUCRf10L
         gyiw==
X-Gm-Message-State: APzg51AE3rVOI0/6CckV1PIremcqPHxH1WHqh9Z39rACJY6wJ3wr6z9u
        bkxDOgKC3/ddLaimqOl/IzH/wbXmLJEiTT+CDXLZGg==
X-Google-Smtp-Source: ANB0VdYaus4C52A6+sI/e7R4vrZfHXiqYdzM7ob/mWuG0q3aeqRrGXap+eJSMYihTOcpHc2ATEZ65j4UJP6iDpJYVvU=
X-Received: by 2002:a24:41cd:: with SMTP id b74-v6mr631100itd.85.1536158878403;
 Wed, 05 Sep 2018 07:47:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:238d:0:0:0:0:0 with HTTP; Wed, 5 Sep 2018 07:47:57 -0700 (PDT)
In-Reply-To: <20180905162135.700d2145@bbrezillon>
References: <20180905095738.26406-1-brgl@bgdev.pl> <20180905095738.26406-12-brgl@bgdev.pl>
 <20180905155741.22b7d0ef@bbrezillon> <CAMRc=Mco7Tbk5P_mgv49f+3j9DKYk5AL6EjPhwF7M=Hb7o5-Mw@mail.gmail.com>
 <20180905162135.700d2145@bbrezillon>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 5 Sep 2018 16:47:57 +0200
Message-ID: <CAMRc=MfbiwRPP9=0e4P-8zYOPhXvT7kL8=W8C2E27HXuCE2Aew@mail.gmail.com>
Subject: Re: [PATCH 11/13] nvmem: add support for cell lookups from machine code
To:     Boris Brezillon <boris.brezillon@bootlin.com>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Joachim Eastwood <manabian@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        David Lechner <david@lechnology.com>,
        Andrew Lunn <andrew@lunn.ch>, Alban Bedel <albeu@free.fr>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-09-05 16:21 GMT+02:00 Boris Brezillon <boris.brezillon@bootlin.com>:
> On Wed, 5 Sep 2018 16:00:36 +0200
> Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
>> 2018-09-05 15:57 GMT+02:00 Boris Brezillon <boris.brezillon@bootlin.com>:
>> > On Wed,  5 Sep 2018 11:57:36 +0200
>> > Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> >
>> >>
>> >> +struct nvmem_cell_lookup {
>> >> +     const char              *nvmem_name;
>> >> +     const char              *dev_id;
>> >
>> > Shouldn't we have a con_id here?
>> >
>> >> +     const char              *cell_id;
>> >> +     struct list_head        node;
>> >> +};
>>
>> I wanted to stay in line with the current API - nvmem_cell_get() takes
>> as argument a string called cell_id. I wanted to reflect that here.
>
> Actually, you need both. con_id is the name you would have in your DT
> in the nvmem-cell-names property, cell_id is the name of the cell
> you'd find under the nvmem device node.
>
> Let's take an example:
>
>         mydev {
>                 #nvmem-cell-names = "mac-address", "revision";
>                 #nvmem-cells = <&cell1>, <&cell2>;
>         };
>
>         mynvmemdev {
>                 #size-cells = <1>;
>                 #address-cells = <1>;
>
>                 cell1: foo@0 {
>                         reg = <0x0 0x6>;
>                 };
>
>                 cell2: bar@6 {
>                         reg = <0x6 0x10>;
>                 };
>         };
>
> this can be described the same way using a consumer lookup table:
>
> struct nvmem_cell_lookup_entry {
>         const char *con_id;
>         const char *nvmem_name;
>         const char *cell_name;
> };
>
> struct nvmem_cell_lookup_table {
>         struct list_head node;
>         const char *dev_id;
>         unsigned int nentries;
>         const struct nvmem_cell_lookup_entry *entries;
> }
>
> static const struct nvmem_cell_lookup_entry mydev_nvmem_cells[] = {
>         {
>                 .con_id = "mac-address",
>                 .nvmem_name = "mynvmemdev",
>                 .cell_name = "foo",
>         },
>         {
>                 .con_id = "revision",
>                 .nvmem_name = "mynvmemdev",
>                 .cell_name = "bar",
>         },
> }
>
> static const struct nvmem_cell_lookup_table mydev_nvmem_lookup = {
>         .dev_id = "mydev.0",
>         .nentries = ARRAY_SIZE(mydev_nvmem_cells),
>         .entries = mydev_nvmem_cells,
> };
>
>
> ...
>
>         nvmem_add_cell_lookups(&mydev_nvmem_lookup);

Ok I get it. Shouldn't we change the argument name of nvmem_cell_get()
and friends from 'name' to 'con_id' or simply 'id' similarly to what
other frameworks do to avoid such confusion?

I also don't see a need for splitting the lookup into two structures
here. Something like:

struct nvmem_cell_lookup {
        const char *nvmem_name;
        const char *cell_name;
        const char *dev_id;
        const char *con_id;
};

Would be perfectly fine and would allow to register all lookups for
given machine with a single call. How often does it happen that a
single device needs multiple nvmem cells anyway?

Bart
