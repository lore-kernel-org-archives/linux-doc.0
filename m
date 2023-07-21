Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A5C1C0015E
	for <linux-doc@archiver.kernel.org>; Fri, 21 Jul 2023 20:58:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbjGUU6H (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Jul 2023 16:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230040AbjGUU6G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Jul 2023 16:58:06 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E7251FD2;
        Fri, 21 Jul 2023 13:58:06 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E47C3733;
        Fri, 21 Jul 2023 20:58:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E47C3733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1689973086; bh=0S0lXqmQ10UyA193KMaPIpP1eAySzNFpPG8iYMqQCSI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=tPC2ADnCieaEyaT11qFoKkac2of2YpKO4FSePRzj0CchxroTzXONm/lZJrpkxlYLu
         3r9//cN/l2u2YWDH1HcCOGsGElGilKcpQRMLXyDHjMj53xfqct1Ug2GAiIjdVCebjy
         /vvs1laQ7CMCaL7flspY2EBE0wH/J4r7otr6ydb7ToMoTvvqJT+DKIUgpcOOd7SxzO
         DyUyjDPVBMS0qY2lwefHrzXyiVutexXVp8Ph2y70dTEAV7v4M6+XkHl1buOhp7CbO6
         5p5TiODc2pJY0HSwZQuWSVj8DlzUTW+gYVdvbh18qGImcYcfozQ9TtchDviHrFb6PH
         tYWbxxV5xzK+Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Costa Shulyupin <costa.shul@redhat.com>, linux-doc@vger.kernel.org
Cc:     Costa Shulyupin <costa.shul@redhat.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] docs: consolidate peripheral interfaces
In-Reply-To: <20230715165759.74901-1-costa.shul@redhat.com>
References: <20230715165759.74901-1-costa.shul@redhat.com>
Date:   Fri, 21 Jul 2023 14:58:05 -0600
Message-ID: <874jlxc78i.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Costa Shulyupin <costa.shul@redhat.com> writes:

> to make the page more organized as requested
>
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---
>  Documentation/subsystem-apis.rst | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/subsystem-apis.rst b/Documentation/subsystem-apis.rst
> index 90a0535a932a..7b086c89e2be 100644
> --- a/Documentation/subsystem-apis.rst
> +++ b/Documentation/subsystem-apis.rst
> @@ -48,6 +48,17 @@ Networking interfaces
>     isdn/index
>     mhi/index
>  
> +Peripheral interfaces
> +----------------------
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   usb/index
> +   PCI/index
> +   hwmon/index
> +   leds/index
> +
>  Storage interfaces
>  ------------------
>  
> @@ -70,19 +81,15 @@ Storage interfaces
>     fpga/index
>     i2c/index
>     iio/index
> -   leds/index
>     pcmcia/index
>     spi/index
>     w1/index
>     watchdog/index
>     virt/index
> -   hwmon/index
>     accel/index
>     security/index
>     crypto/index
>     bpf/index
> -   usb/index
> -   PCI/index
>     misc-devices/index
>     peci/index
>     wmi/index

So this one seems a bit less well thought out.  How are you defining
"peripheral interface"?  How is it that PCI qualifies but, say, PCMCIA
does not?  In a real sense, most of our interfaces deal with peripherals
in one way or another.

Were you thinking maybe of "bus interfaces"?  If so, a somewhat
different selection would be indicated.

Thanks,

jon
