Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4A2E77DE6F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Sep 2018 14:58:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728127AbeIJTwn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Sep 2018 15:52:43 -0400
Received: from mail-it0-f67.google.com ([209.85.214.67]:39473 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728678AbeIJTwn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Sep 2018 15:52:43 -0400
Received: by mail-it0-f67.google.com with SMTP id h1-v6so29042612itj.4
        for <linux-doc@vger.kernel.org>; Mon, 10 Sep 2018 07:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=1Pruq3Tz5s49VO2Apt6/tfAnK0T76s/IR8tNE2SBqGY=;
        b=LGGKtxC9yWVqNEaZxFmDK5H5sK8IPjAjNa7I4jHxTKxoESMm+gGhWynVMgFgj4gxUy
         9gOwssPHhebXHGVl8IQF7COpMlS63xYMiD8BRdU/cA8V+Y1JrMrmAugJ+rvj9UN4EfRQ
         uVS2E1v2Hd0gtOmUs1xdzci+gDenEBGb5+TdrefqNBLG4ueKTSCJpsFlUF/c47iPqYp2
         aC6YdLNuQNoUvz3Z0EjYHb3m4tzAhXiQvIDfdHE5rUTYkyYhkCoGDkkEnc9zIPauNFwB
         zcgxWe/GXLJh1Si6I8LWxvJzZ9b0PQG+ffvLTvatTLI00IWsEqdqBYC7FlEtFvTrOkg2
         7x+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=1Pruq3Tz5s49VO2Apt6/tfAnK0T76s/IR8tNE2SBqGY=;
        b=gS3psrOSzYvsLLZ0uE0WBJFg2OVIhFtBWF9IvstMe+jBiakhJVFm4m46w9SDmqsqOV
         uLxZy/w1Mkobf+QkegVYXQ25I1fJ8msv1nWSD7MmicbemM1Qxe6+3WWC5NF78Wb88PsX
         OTtskdbK+yKbANy0dD4BcGx7dT3pwVELqUiGFWUL1JjqpFcLqYnooePHFzWChnGcG7Ap
         xOw0gAC1ukz3VZnkg/wTAzB0RfU9GV7krqsBerlxIsWZP3cGSXyf8oZ869Unm/ceDNX5
         MN2SU6uZsWCFfUWzwoje3/JAWrvk86yAwNzDmwmTS+x9jawWNtuETwcUEOlQ7+tjg4j6
         C4dg==
X-Gm-Message-State: APzg51Ca/7AUusHyeAJl32vp5IgQl+nXFEYE402mSfzvtAxAdSeXk5l2
        PjAe3plD3Sul2J04Z6jas3j+WvzHiL8PLnoufF8/7w==
X-Google-Smtp-Source: ANB0VdaDQ0g6G4tsJAKC770YtCnMYCXARX0Tj5PbH/fz0fT97muwuAdmyJLnI7eteWwVbrlejdb6mRqQ3GBvwz5dHaw=
X-Received: by 2002:a24:41cd:: with SMTP id b74-v6mr17563120itd.85.1536591494286;
 Mon, 10 Sep 2018 07:58:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:1905:0:0:0:0:0 with HTTP; Mon, 10 Sep 2018 07:58:13
 -0700 (PDT)
In-Reply-To: <dec727cf-486f-8126-34f8-1b1099cec3a1@linaro.org>
References: <20180907100750.14564-1-brgl@bgdev.pl> <da9556fd-0022-8e6a-12b4-cc3babbae5b0@linaro.org>
 <CAMRc=MeT7UP57x+Q-a1ODRCvcGKKj_NSfkBLVQ9O5dhTC1DAYg@mail.gmail.com> <dec727cf-486f-8126-34f8-1b1099cec3a1@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 10 Sep 2018 16:58:13 +0200
Message-ID: <CAMRc=Mdmi91=2zn-T0B8C2rxVhsXL9cHh7mx8RamYfBpfDjC=Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/16] nvmem: rework of the subsystem for non-DT users
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

2018-09-10 12:02 GMT+02:00 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>:
>
>
> On 10/09/18 09:24, Bartosz Golaszewski wrote:
>>
>> The API changes change so many things, that these series would be
>> incompatible. I can send the series separately but they would be
>> co-dependent anyway. Does it sound good?
>
>
> What am asking is to reorder the patches in a such a way that its easy to
> review.
> ex: Order can be :
> 1> kref and update nvmem_unregister followed by the provider changes.
> 2> Add support to cell tables, cell lookup, notifier
> 3> general cleanup patches  followed by fixes
>
> Current set seems to jump from one thing to other which makes it hard to
> follow and time consuming while review!
>

I would just change that ordering a bit: I think we should fix stuff
that's broken first, so fix the name field of struct nvmem_device,
then the rest as you listed it.

Bart
