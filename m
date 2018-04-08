Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 275537DE78
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 00:03:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751587AbeDIAD6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 8 Apr 2018 20:03:58 -0400
Received: from forward104o.mail.yandex.net ([37.140.190.179]:53566 "EHLO
        forward104o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751526AbeDIAD5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Apr 2018 20:03:57 -0400
X-Greylist: delayed 424 seconds by postgrey-1.27 at vger.kernel.org; Sun, 08 Apr 2018 20:03:57 EDT
Received: from mxback7g.mail.yandex.net (mxback7g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:168])
        by forward104o.mail.yandex.net (Yandex) with ESMTP id 0548C703D63;
        Mon,  9 Apr 2018 02:56:51 +0300 (MSK)
Received: from localhost (localhost [::1])
        by mxback7g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id m8wwZ8fgXH-unR0nYE4;
        Mon, 09 Apr 2018 02:56:50 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1523231810;
        bh=aqxevX7ZkKvkxWOGFyo9JwFSvf272H9BylIbNQCg/fM=;
        h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date;
        b=l/V4LvtL6qvJ0HGs6OG82dPwkZIAqmnyQOpglBq6HrHblEuhciM5N7HfJYT39stT7
         gSM6sG/Y019WAYuLSDPhmf2Yy09SuMGftH4dFPVDPS2Vp3rgBObg95wNt6Vjk39x9N
         hncYPSGWtghS04pCoNRIgUfRK5uv7e+JwUArPDSg=
Authentication-Results: mxback7g.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by web57o.yandex.ru with HTTP;
        Mon, 09 Apr 2018 02:56:49 +0300
From:   Evgeniy Polyakov <zbr@ioremap.net>
Envelope-From: drustafa@yandex.ru
To:     Gergo Huszty <huszty.gergo@digitaltrip.hu>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
In-Reply-To: <20171220190709.6584-1-huszty.gergo@digitaltrip.hu>
References: <20171220190709.6584-1-huszty.gergo@digitaltrip.hu>
Subject: Re: [PATCH] Fixed typo in onewire generic doc
MIME-Version: 1.0
Message-Id: <6472401523231809@web57o.yandex.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Mon, 09 Apr 2018 02:56:49 +0300
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi everyone

I'm really sorry for that long delay.

Was this patch accepted or should I push it upstream?

20.12.2017, 22:09, "Gergo Huszty" <huszty.gergo@digitaltrip.hu>:
> Onewire devices has 6 byte long unique serial numbers, 1 byte family
> code and 1 byte CRC. Linux sysfs presents the device folder in the
> form of familyID-deviceID, so CRC is not shown. The consequence is
> that the device serial number is always a 12 long hex-string, but
> doc says 13 in one place. This is corrected by this change.
> Reference: https://en.wikipedia.org/wiki/1-Wire
>
> Signed-off-by: Gergo Huszty <huszty.gergo@digitaltrip.hu>
> ---
>  Documentation/w1/w1.generic | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/w1/w1.generic b/Documentation/w1/w1.generic
> index b3ffaf8cfab2..c51b1ab012d0 100644
> --- a/Documentation/w1/w1.generic
> +++ b/Documentation/w1/w1.generic
> @@ -76,7 +76,7 @@ See struct w1_bus_master definition in w1.h for details.
>
>  w1 master sysfs interface
>  ------------------------------------------------------------------
> -<xx-xxxxxxxxxxxxx> - A directory for a found device. The format is family-serial
> +<xx-xxxxxxxxxxxx> - A directory for a found device. The format is family-serial
>  bus - (standard) symlink to the w1 bus
>  driver - (standard) symlink to the w1 driver
>  w1_master_add - (rw) manually register a slave device
> --
> 2.15.1
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
