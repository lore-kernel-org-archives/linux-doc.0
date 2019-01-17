Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7E2D07D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 17 Jan 2019 12:13:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbfAQMM4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 17 Jan 2019 07:12:56 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:42920 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726991AbfAQMM4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Jan 2019 07:12:56 -0500
Received: by mail-ot1-f68.google.com with SMTP id v23so10874315otk.9
        for <linux-doc@vger.kernel.org>; Thu, 17 Jan 2019 04:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2i62l1RZ2Xxho+N5+QceoL6NMK+JFFGPVOl2S8RZleo=;
        b=C19+Y6YplMQFh5f7nkzET5jxbKi008OCEGVdsEZ95dtpos84JszUI53bIGzxuYAoT5
         Z/MLeyBK45pSrSvTanHN3jIQTrXRj+pTe07CZdEZTeG15DFJO3dgasMGJrC0qKndUT24
         3d6ghq5nb86I3tAUOG3SHutWIEx2U08+1JR22nwbOy05joJEhjMKwJEV6EAJpSCK0wYI
         zg/nzlDEjLPTg2dqYI9YtymAwKr1Qj6LNICsJ3+9Wzn9kniXsnZxCoaVTl1cHNlnbpAl
         O964qtNjrnu4JNo9KO5dLJJX5piYH1utgfmc1wOKFiMNLn14r+dmW+qxOawZ/hxNP9w0
         VkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2i62l1RZ2Xxho+N5+QceoL6NMK+JFFGPVOl2S8RZleo=;
        b=thOG5Dyp4sD7c8o7UQ7WXLTV/xt2oWS7f9YImNwHhaEpqxC7TPUvHzVgiqR8qpSan9
         WDDgDrZMEGgDHXptdOFkqCsAc+/HB91wDWUyQlxc3I0gZn5EMh7La9zVVckDziRdJ1sM
         nQRHQqsagXrZeEQNLLfeYKYgWpyRxlHEyNM4ovog3HeKP7BK9PApS97JZ9xyNJovdZzq
         +jB4hLODwpV0/uPZR8oJrp3z2b9jNsZW6Zru8MNyK3UdWyUbAvXFIWWDo/OfUux+U5fy
         2WSrCX/NrR2jDgFo5EuRxIi5mwukhZVihW4rGDkmUiAR1PH9hhdHaeSYUneztLO9l9fj
         v7cw==
X-Gm-Message-State: AJcUukd9yxsK9KcrOe4b7IW6lmuFTcst9aB9zSwaZWnai5nBcTsfiDGL
        Hvb911jw2xQaIgnxMe41wnACthJaH6eC+HPa1lLIA6rWsFY=
X-Google-Smtp-Source: ALg8bN719629qaqKSIGYp7xBXIRw5W9cIuUN8efeUgyoEDHRRaUdV+VBRcXWwFxxNAb27qAh/Ex59AWKx5+WRrFlPmM=
X-Received: by 2002:a9d:6191:: with SMTP id g17mr8790446otk.56.1547727175952;
 Thu, 17 Jan 2019 04:12:55 -0800 (PST)
MIME-Version: 1.0
References: <20190117101321.2164-1-wsa+renesas@sang-engineering.com> <CAMuHMdWtXA9Q66vCuG6U-+04kqu2F=DOA63pTkeMZ06EzfOQkQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWtXA9Q66vCuG6U-+04kqu2F=DOA63pTkeMZ06EzfOQkQ@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 17 Jan 2019 13:12:45 +0100
Message-ID: <CAMpxmJXEs1Lg775GtNq9p-feVW3yGU_yJM30n2OOgsm1i=2LUg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: driver: fix wire name for I2C
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

czw., 17 sty 2019 o 11:24 Geert Uytterhoeven <geert@linux-m68k.org> napisa=
=C5=82(a):
>
> On Thu, Jan 17, 2019 at 11:14 AM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > Typo: the data line is called "SDA" not "SCA".
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>

Applied to for-next, thanks!

Bart
