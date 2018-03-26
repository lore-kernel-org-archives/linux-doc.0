Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8CAD87DD31
	for <lwn-linux-doc@archive.lwn.net>; Mon, 26 Mar 2018 18:04:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752147AbeCZSES (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 26 Mar 2018 14:04:18 -0400
Received: from mail-vk0-f65.google.com ([209.85.213.65]:34150 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751692AbeCZSER (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Mar 2018 14:04:17 -0400
Received: by mail-vk0-f65.google.com with SMTP id z190so11729486vkg.1;
        Mon, 26 Mar 2018 11:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=qV2n5rrFsJbzxXAkuGQZwBZy5hJT8yGOuGPmK2YZLTc=;
        b=q6DvcWX6c9Aj9ZPvFhi4diTmpApemTbsFtr2gir7gYUazt5+YTmN3iCo6MZAuX/eqM
         luwYb4F6VAbrrNgASivFyEfQbWitlGPG6p85jBYD+Rs+/BEGiZkCr0Dxo9VK/DXefS6b
         JwsTw3g0dsgfPnBj1s6YxOBBXa2EosnzFO1heGj0SPqBj3xuxigDvfYLdiAm1V2hFupt
         cRPEwrziBmiUjCQ5cVrTQaT4MxcIijIzmxejrDPmhaukYdTOHyiI6JTSxcpV0+6c9Vs/
         CH57TqqB7B+5LeSoRxsUrki876QpIuduhzK3HiZEoa5g/GGdTnjVdDjzMl2UwrJVHtqV
         eOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=qV2n5rrFsJbzxXAkuGQZwBZy5hJT8yGOuGPmK2YZLTc=;
        b=Gc9/CZpMDkKL0uIUcYU0+x008G560y8Gq8cs9EAbnGEmpeqptu7kVV7OrM5CrOp8hi
         ZUARaXHb3UW8bAp6D4nT2EJ4tVDsy2aHvyisPiwyGjmrN8AYCYQJRoxwcXJQaBVZNFr7
         WTCBGalqgjd8PUm9xeHpTVMdORO2Eom37e4dpFOxM5qtSL8IbSKLhDR1aXEoJi+p6n/t
         GNOKCOnlGQVKEjCu0Wo7zjmcgUYUnWVKZoLLx5f1GZ8IGNWv7ovDwMJemqzT+YRScDTI
         DZuGLqxGe/IV9zWoiqW2cGjYPA2rIacUyB31Je//gPZsTgMrOKgl/Vfni1uPYWioe0Tn
         BRwA==
X-Gm-Message-State: AElRT7H+k50K7A7iZh6EJ0v2wYzE3nichyNEhShYn+GYQlL+cVCBsazk
        CidNZY3JvGRi2UYHhkoFqrHViHLfVj3RnZlhhlw=
X-Google-Smtp-Source: AG47ELtd9AS9zKpfcYcPVE5uGZIZhCW1PN8mNI+u60GIjC5cnXtodJxES3nt5jEMVLYNEsTfYPsMr4IPdT+fqZCwVeA=
X-Received: by 10.31.229.196 with SMTP id c187mr25239154vkh.1.1522087456122;
 Mon, 26 Mar 2018 11:04:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.179.1 with HTTP; Mon, 26 Mar 2018 11:03:45 -0700 (PDT)
In-Reply-To: <91363263-1ab8-5513-23a3-bbcea802d788@citrix.com>
References: <20180320195658.17498-1-mudongliangabcd@gmail.com> <91363263-1ab8-5513-23a3-bbcea802d788@citrix.com>
From:   =?UTF-8?B?5oWV5Yas5Lqu?= <mudongliangabcd@gmail.com>
Date:   Mon, 26 Mar 2018 14:03:45 -0400
Message-ID: <CAD-N9QV0NCfcickCB-paV0Nvqzso4NRgxKDtWSWqEwZ8bMxytA@mail.gmail.com>
Subject: Re: [PATCH] fix one dead link in ia64/xen.txt
To:     Andrew Cooper <andrew.cooper3@citrix.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, yamada.masahiro@socionext.com,
        Sergei Trofimovich <slyfox@gentoo.org>, tony.luck@intel.com,
        =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>,
        linux-doc@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 20, 2018 at 4:17 PM, Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
> On 20/03/18 19:56, Dongliang Mu wrote:
>> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
>> ---
>>  Documentation/ia64/xen.txt | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/ia64/xen.txt b/Documentation/ia64/xen.txt
>> index a12c74ce2773..464d4c29b8b5 100644
>> --- a/Documentation/ia64/xen.txt
>> +++ b/Documentation/ia64/xen.txt
>> @@ -26,8 +26,8 @@ Getting and Building Xen and Dom0
>>      DomainU OS  : RHEL5
>>
>>   1. Download source
>> -    # hg clone http://xenbits.xensource.com/ext/ia64/xen-unstable.hg
>> -    # cd xen-unstable.hg
>> +    # hg clone http://xenbits.xensource.com/ext/ia64/xen-unstable
>> +    # cd xen-unstable
>>      # hg clone http://xenbits.xensource.com/ext/ia64/linux-2.6.18-xen.hg
>>
>>   2. # make world
>
> The last commit in that repository is almost 9 years old, and IA64
> support was dropped from Xen mainline6 years ago.
>
> http://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=570c311ca2c7a1131570cdfc77e977bc7a9bf4c0
>
> There are a number of other dead links in this doc, and those which
> aren't dead refer to Linux 2.6.x.  I'd just remove the entire file,
> rather than pretend that any of this still might work.  (If by some
> miracle it does still function, its 10 years behind on security fixes...)
>

If the situation is like that, I agree to delete this file.

> ~Andrew
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
