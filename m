Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8031B7D57F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Sep 2018 07:58:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbeIJMvg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Sep 2018 08:51:36 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:40595 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbeIJMvf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Sep 2018 08:51:35 -0400
Received: by mail-io1-f67.google.com with SMTP id l14-v6so6269610iob.7
        for <linux-doc@vger.kernel.org>; Mon, 10 Sep 2018 00:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=mudgGYqP8LqZ9x4Y1sGfRvAnBv4+WIk3H51rEOkU1Lo=;
        b=pmDc6lOU676xZlldcHYUG9YiZR104sNAgYTAS/rhSEbSXvL3V/sOiwCXAqaCoWXKzd
         O2lC/U8onET4ZpCppU6Ab+wBWTT/HhLOFkuul5jEmQe6RBnbBRoLTMaKBP3fibQixaQa
         LyYxw/WSPLEpZRVQh11s4M4CDSkoOrVIVX9tdd2UXjxDOv2VwJnq9JnB8DZ93P+qcq/X
         HiIazSSGnXYvueOmsUsK/P7LB/LOiUWHFiNBqjGVZLl8SuI1OUqjG8Z8bj53dRmQb+ej
         ZusMZI9ab6LwiyZ8F5lXJ2OiigjFeqHBe+fl+Xw0pCU7ns3z4louqA83Mq/ID+Nb58pj
         QjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=mudgGYqP8LqZ9x4Y1sGfRvAnBv4+WIk3H51rEOkU1Lo=;
        b=c04O5MyI62qWD0PvbCwTaQVd6fCBVXbctXWf6lrK1t2me9RAqIsULCarNeYN3at5rW
         HQe7L6UMALPs6jFj0VuzbJhBM3I/woy93YU1nXEe7/ZAy0zJ9GpmuHp9MGjP4Y3qk3iH
         +yWCOfNIU4zj/JSMPFcET2VzMSUQvrEvE/w600G2BdDTrx02lRMeibpV4bznYvn6py++
         ILtXhrggD/eH6xiyl9WKuoD4J+v8pOMoaaLi4tzuuOxyX9lJvsrSUl08CIEYU+xe7gYF
         8pmFVpK6moYpByGXG7FAC9HpVAW/kki1KIq+nMg2np+Nz1upwToPWkJ6OwXJMaJO8S8a
         VW3w==
X-Gm-Message-State: APzg51CvGPxCdMUrR86EfiSPiM8NGbz8cCRwFTyYC2oyUaDmWDRgItrH
        O7bJOaYLjypyMUY69xei1be0bV2v6pPan+oxeCWObQ==
X-Google-Smtp-Source: ANB0VdY7OCSYMec0N9d9FJc5hPjnz0pTQAc/g6Y/wR0UOZK+beKmWZETxPoorQvbCtsx+6QujgcYNjtSuz9J5NxkqDQ=
X-Received: by 2002:a6b:6401:: with SMTP id t1-v6mr16589703iog.111.1536566329774;
 Mon, 10 Sep 2018 00:58:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:1905:0:0:0:0:0 with HTTP; Mon, 10 Sep 2018 00:58:49
 -0700 (PDT)
In-Reply-To: <c0b0c411-65f6-62f9-6d6d-2884e5a17250@linaro.org>
References: <20180907100750.14564-1-brgl@bgdev.pl> <20180907100750.14564-2-brgl@bgdev.pl>
 <c0b0c411-65f6-62f9-6d6d-2884e5a17250@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 10 Sep 2018 09:58:49 +0200
Message-ID: <CAMRc=MfO01EQAfY4Uu3UwzzvhVOMF7_BpCOPVz2yVXqDgpb0AA@mail.gmail.com>
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

2018-09-10 9:32 GMT+02:00 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>:
>
>
> On 07/09/18 11:07, Bartosz Golaszewski wrote:
>>
>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> Remove all APIs dealing with nvmem_cell_info. There are no users and
>> this part of the subsystem will be reworked.
>>
>> This patch temprarily disables support for non-DT users.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> ---
>>   drivers/nvmem/core.c           | 212 ++-------------------------------
>>   include/linux/nvmem-consumer.h |  26 ----
>>   include/linux/nvmem-provider.h |  13 --
>>   3 files changed, 12 insertions(+), 239 deletions(-)
>
>
> This looks totally un-necessary, Other patches in this series adds them
> back.. Consider updating these in those respective patches.!
>

While this may not be entirely necessary, it's very useful. There's
almost nothing common between this API and the new one added later in
this series. Later patches are MUCH cleaner thanks to this removal and
I believe it makes them easier for review.

Best regards,
Bart
