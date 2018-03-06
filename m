Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F110F7E653
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Mar 2018 09:40:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750859AbeCFJkR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Mar 2018 04:40:17 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:64310 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750819AbeCFJkP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Mar 2018 04:40:15 -0500
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com [209.85.213.53]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id w269eBra017331;
        Tue, 6 Mar 2018 18:40:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com w269eBra017331
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1520329212;
        bh=jZBOyA94/3EvSsFcuz6FfNHePMYS3ELvf0jmbnBVCS8=;
        h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
        b=yAlf6/SMj2JSZfTzpvNsoQgJJ3uxbPIoVEqRP53Edj6AGFnAEM7ceGTT/AvBxmnvE
         cq6R9Cy6fSSb/dWcN7efmKjDhnVjmHUpc6jC78MqpQiWa23p/a66HCf8C1hqEjXZRX
         tE6AlpQSoRa68QYuoknQRoosE+t5Ki6I4+LWyKC/6xE8zrcAIcS0FaGXVXTEEtEB9o
         /C/A2nR1/R3poQsYtLDyb0phuinXFt63YdgIHJcqwLvDbdw0AyrLonyKODoU8dgBKe
         wrOWql0llUOYIqGaWP1yZUFA11ozrwRedT9dW+8CD8KvYTvYr4SmyfNWzsbZ+v+k7f
         vrGBV0rDY1UeQ==
X-Nifty-SrcIP: [209.85.213.53]
Received: by mail-vk0-f53.google.com with SMTP id z190so11877905vkg.1;
        Tue, 06 Mar 2018 01:40:11 -0800 (PST)
X-Gm-Message-State: APf1xPAxClWhV8NOyNNqCWIcfqzjFy/8ulxhq2AfDAlrNIhRMmBG81mG
        U/eIrrhu1HcYGAYWoQyQlhfz6030IMH9m4q8RnI=
X-Google-Smtp-Source: AG47ELvEOXNnqi7fUuzweqXhmAQvW6iKZ8ib8iz7c8h6OoqVBIkjl3yBaokKO1reKoKhvfcQWbvI/wT44X4q2gTplIQ=
X-Received: by 10.31.237.68 with SMTP id l65mr12370106vkh.11.1520329210775;
 Tue, 06 Mar 2018 01:40:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.32.138 with HTTP; Tue, 6 Mar 2018 01:39:30 -0800 (PST)
In-Reply-To: <1519886077-31914-2-git-send-email-yamada.masahiro@socionext.com>
References: <1519886077-31914-1-git-send-email-yamada.masahiro@socionext.com> <1519886077-31914-2-git-send-email-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 6 Mar 2018 18:39:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNARM_1fXyh8hnnAw7DGC97LZ7-pcriqWC9gQ4uSnU==Vpg@mail.gmail.com>
Message-ID: <CAK7LNARM_1fXyh8hnnAw7DGC97LZ7-pcriqWC9gQ4uSnU==Vpg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kconfig: rename silentoldconfig to syncconfig
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Ulf Magnusson <ulfalizer@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Marc Herbert <marc.herbert@intel.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Michal Marek <michal.lkml@markovi.net>,
        intel-wired-lan@lists.osuosl.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-03-01 15:34 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> As commit cedd55d49dee ("kconfig: Remove silentoldconfig from help
> and docs; fix kconfig/conf's help") mentioned, 'silentoldconfig' is a
> historical misnomer.  That commit removed it from help and docs since
> it is an internal interface.  If so, it should be allowed to rename
> it to something more intuitive.  'syncconfig' is the one I came up
> with because it updates the .config if necessary, then synchronize
> include/generated/autoconf.h and include/config/* with it.
>
> You should not manually invoke 'silentoldcofig'.  Display warning if
> used in case existing scripts are doing wrong.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Changes in v3:
>   - Fix Documentation/networking/i40e.txt
>   - Display warning if silentoldconfig is used
>
> Changes in v2:
>   - newly added
>

Both applied to linux-kbuild/kconfig.


-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
