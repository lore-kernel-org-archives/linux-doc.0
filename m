Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 68C987D57F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Sep 2018 08:43:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728050AbeIJNgy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Sep 2018 09:36:54 -0400
Received: from mail-it0-f68.google.com ([209.85.214.68]:37292 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728049AbeIJNgy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Sep 2018 09:36:54 -0400
Received: by mail-it0-f68.google.com with SMTP id h20-v6so27631803itf.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Sep 2018 01:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=vgB6GTrm+iJTbabFaj/clF7dRpCQRZyv/XEfU3sVYxQ=;
        b=VjZ04faaAKpdMGrls6vDC/9Q9Oq2MxWbpMU/M9xL08k2Ly1l3bBguc1sg7mOoqijF6
         wtLlZHj4vZhD5NE3w/Xtd8yj7hG60YixFatVR65KNhWPzOGZ3/2dkPi3yI1Y2+8v4ffC
         Bt6CX4lRqSJgLveavvbHMi6R5cIXePDwRh4/qzC631FGvfKzHP+e0aE5ZLf7Atg4UZhB
         RksDdFvPOoy/SbR5KME/hqdanIaf6rat5moQJFkLVBs+6ZtHBX+MJKxDQKi+iX6SHRaY
         ODpbfs6bTE+m7ReoiiEDHzWVOYNtf+XWOFEd93hXYRxBwZOjK6wNqh5H9cdyp/WQNIv3
         u6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=vgB6GTrm+iJTbabFaj/clF7dRpCQRZyv/XEfU3sVYxQ=;
        b=HGuYK1ZLZhpZkn68eHhoS9ibDDeA8NjEGXKG4bzg+kM2ZDzrd6fq3PV7N9kXaW4B+B
         Dyg5TgOjiEiNL2WIMGNL59oKSVJodsc4oIYx8bTuFVgtwUpEC6kwGT3zePQxJHc7XTL3
         xLvPdrjbEVnMkRb6yP7xx89E9R3yOkUMln/ZIHYdFW5vpF7ojTTRUkXOfJZ2lkzIU7Z0
         mGlMOSyKxKOok+VsWSguKop14CHjfJimjv8sLGW+4KMoiJeSL6lYp0oDJSJRX1ArjWbZ
         OAEiAhbcWlcIk7zXw+SkDPgP2hBFf3Vu2ufcYHAWlj4BM/QAS15f7NK4UR25XBOiZwSz
         6rsg==
X-Gm-Message-State: APzg51B+QLjNUDO6MC8W7YruRA4201nWJhLhFdKflbACOIPFhPuDcE//
        C+2yt2G7ipx4vdgClKwnZ1uL0WKclE9UcZQnsl8GQkwxZwo=
X-Google-Smtp-Source: ANB0VdZXBHu+oRNFpUHom0fMedX1d/RubF6fgjV7MREL5S9z1piAV0NT7fZ2fhh6MHmsY3HZXxKPfA5Okqi0wZS7+XQ=
X-Received: by 2002:a02:5f44:: with SMTP id r65-v6mr17662391jab.34.1536569036758;
 Mon, 10 Sep 2018 01:43:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:1905:0:0:0:0:0 with HTTP; Mon, 10 Sep 2018 01:43:56
 -0700 (PDT)
In-Reply-To: <7e138142-8161-3646-4daf-619995baf395@linaro.org>
References: <20180907100750.14564-1-brgl@bgdev.pl> <20180907100750.14564-2-brgl@bgdev.pl>
 <c0b0c411-65f6-62f9-6d6d-2884e5a17250@linaro.org> <CAMRc=MfO01EQAfY4Uu3UwzzvhVOMF7_BpCOPVz2yVXqDgpb0AA@mail.gmail.com>
 <7e138142-8161-3646-4daf-619995baf395@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 10 Sep 2018 10:43:56 +0200
Message-ID: <CAMRc=Mduu4CmLX5DFtJd8NSbzs5g65U9AmM=rbscit0JyQKVAQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] nvmem: remove unused APIs
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

2018-09-10 10:09 GMT+02:00 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>:
>
>
> On 10/09/18 08:58, Bartosz Golaszewski wrote:
>>
>> 2018-09-10 9:32 GMT+02:00 Srinivas Kandagatla
>> <srinivas.kandagatla@linaro.org>:
>>>
>>>
>>>
>>> On 07/09/18 11:07, Bartosz Golaszewski wrote:
>>>>
>>>>
>>>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>>
>>>> Remove all APIs dealing with nvmem_cell_info. There are no users and
>>>> this part of the subsystem will be reworked.
>>>>
>>>> This patch temprarily disables support for non-DT users.
>>>>
>>>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>>> ---
>>>>    drivers/nvmem/core.c           | 212
>>>> ++-------------------------------
>>>>    include/linux/nvmem-consumer.h |  26 ----
>>>>    include/linux/nvmem-provider.h |  13 --
>>>>    3 files changed, 12 insertions(+), 239 deletions(-)
>>>
>>>
>>>
>>> This looks totally un-necessary, Other patches in this series adds them
>>> back.. Consider updating these in those respective patches.!
>>>
>>
>> While this may not be entirely necessary, it's very useful. There's
>
> Yes, thats exactly what am saying if it not necessary please do not do it.
>
>> almost nothing common between this API and the new one added later in
>
> There is more than 60%-70% of the code reused in new patches, which is
> unnecessary churn to me!
>

Pretty much the only thing that is reused are the contents of
nvmem_cell_info_to_nvmem_cell() and even they are placed in a
different function. Also: this change allows us to add new APIs
without having to update users at each step only to change them
afterwards with one of subsequent patches. I would really prefer that
this stay this way. If there are no users, then there's no breakage
that would make your point valid.

>> this series. Later patches are MUCH cleaner thanks to this removal and
>> I believe it makes them easier for review.
>
> Am not sure about that, it definitely did not help me!
>

Why exactly? Aren't clean patches resulting from this removal easier
to read then if they'd also have to take into account the burden of
existing code that will be changes anyway later? I really don't see
why you insist on removing this.

Best regards,
Bart

> --srini
>>
>>
>> Best regards,
>> Bart
>>
>
