Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A2DF17D099
	for <lwn-linux-doc@archive.lwn.net>; Mon,  5 Nov 2018 13:02:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729228AbeKEWWC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 5 Nov 2018 17:22:02 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:36941 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728136AbeKEWWC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Nov 2018 17:22:02 -0500
Received: by mail-qk1-f196.google.com with SMTP id 131so14428111qkd.4;
        Mon, 05 Nov 2018 05:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VGHCPFNS1XDl7BfaftTX/Qrdp5iwmkSiv+oafR/mpo8=;
        b=a4/OQCbqnoz6EXv31kIDos0BCKrQ/oP4xCdAkLV3qRB2FyUsKP31rSOY2waAFiEixi
         vNaoNzcd2CQaoRIWZvTTh91p0OMXoBZfTNB5GsFJnL59mkFTHlcMb2antU4xyJJItJhW
         UOh+mls1L+1Z1xDERg5HCBmXYXodnulDTS6YoCrMuB6tPjbL/TJVHX+eRy5LbBq5yRmT
         XHkficZDm/ZgRdg84AkQr2gITA2NyMTztGaHm/PDE1Y/8BeT+kj1UZMaC+zDbvE0cF5Y
         Pz2UX54oezrMetM1MGGKwElty+M4GoQaVfK6CDqBNPRu1TTpM75hsBt3IdGPTgUBN9Ob
         z5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VGHCPFNS1XDl7BfaftTX/Qrdp5iwmkSiv+oafR/mpo8=;
        b=ZD/88evp3uYDn3//sALBXhp4Jd3PnIz9PBPrxORdKks5GvGt5wGegkoeFEcGf5eKj/
         A4MC4SIVFgePhMfEu7i0yoOBJ56OhNdu1PXuQ/vfcWs2hxHbXjr/CpFFBN4HdDg1bMLr
         vdsns0X3a5CpYwTqSyPB7YwpFDSUALpFzMn3KV8ddzP8LFqXzE4bBtdQl+HfXKwqKU+Q
         DaBz71tpSxRjaEMAbXshtCqJRuDAhNN0Le+3HKzvHQE1IfEQZBbWaZkG0DCXaJFluiHE
         0wIWSzGQsyv0BXq/kpJkLfwnm8LAjwWrs5gm4G1MBvD4HUIge/degv/cnCdT7PrnBEV1
         Aw/g==
X-Gm-Message-State: AGRZ1gJ3JI+I63Ytp40xkvyPG4aQWTMgHYQkp77MCqDzgnKpRC9J+cWL
        YQkNRHubPL8P02zHy1xFH4ODlQmeZUvMWsBfrwI=
X-Google-Smtp-Source: AJdET5dJK2NMIiAv57f0u5C2AlRLHKqTS1izPn7eyNmMI/4m0DqB8M4aXEGAEewy/7cCl+tnLjM6ZTQaMKKHGjXIdds=
X-Received: by 2002:a37:1f44:: with SMTP id f65mr19747854qkf.33.1541422943087;
 Mon, 05 Nov 2018 05:02:23 -0800 (PST)
MIME-Version: 1.0
References: <1541414431-84128-1-git-send-email-peng.hao2@zte.com.cn> <1541414431-84128-9-git-send-email-peng.hao2@zte.com.cn>
In-Reply-To: <1541414431-84128-9-git-send-email-peng.hao2@zte.com.cn>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 5 Nov 2018 15:02:11 +0200
Message-ID: <CAHp75VcShwubDc0Mxkygs=zyVCJbztQeGjmpCmGEkT6uXzsELg@mail.gmail.com>
Subject: Re: [PATCH V7 9/9] misc/pvpanic: remove a redundant comma
To:     peng.hao2@zte.com.cn
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        hutao@cn.fujitsu.com,
        Linux Documentation List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 5, 2018 at 4:31 AM Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> Remove a redundant comma in pvpanic_device_ids.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Acked-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  drivers/misc/pvpanic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
> index f416c01..8c4bfa6 100644
> --- a/drivers/misc/pvpanic.c
> +++ b/drivers/misc/pvpanic.c
> @@ -29,7 +29,7 @@
>
>  static const struct acpi_device_id pvpanic_device_ids[] = {
>         { "QEMU0001", 0 },
> -       { "", 0 },
> +       { "", 0 }
>  };
>  MODULE_DEVICE_TABLE(acpi, pvpanic_device_ids);
>
> --
> 1.8.3.1
>


-- 
With Best Regards,
Andy Shevchenko
