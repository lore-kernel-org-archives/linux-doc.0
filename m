Return-Path: <SRS0=eakK=Z4=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9459AC43603
	for <linux-doc@archiver.kernel.org>; Fri,  6 Dec 2019 07:49:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3D06424677
	for <linux-doc@archiver.kernel.org>; Fri,  6 Dec 2019 07:49:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="cnxkcM2z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbfLFHtY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 6 Dec 2019 02:49:24 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:35201 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbfLFHtY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Dec 2019 02:49:24 -0500
Received: by mail-lf1-f68.google.com with SMTP id 15so4553778lfr.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Dec 2019 23:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kmy/hqtYsjJdqSxe1RXY3ysFVnTDOWj+4UzNeSbXyQ0=;
        b=cnxkcM2zBCw501wJ8H5ubD377z1l0CWx0Em/20T7JYyuEYICO/QR0xiCDpWHlSqXCt
         JjWLfxgjwWgB54GyOzKMnLh1bB6nsh4ImXgzI1MeSR4Di1aNIVrjKE/cS51QrcznZZ1W
         JkjfcBgRrm+7vlzN5nXW89Na8ZWKr3ivSkAfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kmy/hqtYsjJdqSxe1RXY3ysFVnTDOWj+4UzNeSbXyQ0=;
        b=oVWocjjfq9NXnn0vZQuN9lFgCVZutr8LETDlV/3UetEV6wY6ysLJidw9gZwCmOYFN4
         PH606AW5FMLic3CKqXLfoh06NxXckJgKptv5m/VArDcR6UL5CX/vtBgalD7U9TwEyeqw
         sBSlJSKfdl3aN1A0Fu9Juagreknzf1rxcSDDZc07ycxXlwn8JJOymajgfxa8DSW1wvyj
         DiE3pEM7Fbm8xzb2W1kSMGdmKtH92haCAMN72z15V2R9Hnmb161cktwoAUZdk6qF90fp
         JH8Jca3/um9WFnRgiGCKT83516szZwg1ho0Qu2cAzFw0GU9q9p3FBdeCTTswVWVYFsod
         ZIRw==
X-Gm-Message-State: APjAAAXZizASVHDGQ7NF+BwwadGHJQoZI0SuFqKtgAWNl6LhWbVIHgxm
        FrUI8VJsMtlWu6NXLv1O+ZyhW+7qVBCmYl6C
X-Google-Smtp-Source: APXvYqzWK9nbn2UUY59BW9P/8Slwo/2W/+Hi1HaS8kg5zC9iRhpU7XfAl0CMdm/YK0/eeVy3i4vXKg==
X-Received: by 2002:a19:f80a:: with SMTP id a10mr7621557lff.107.1575618562000;
        Thu, 05 Dec 2019 23:49:22 -0800 (PST)
Received: from [172.16.11.28] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id g85sm6094899lfd.66.2019.12.05.23.49.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Dec 2019 23:49:21 -0800 (PST)
Subject: Re: [PATCH 17/18] dyndbg: rename dynamic_debug to dyndbg
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jim Cromie <jim.cromie@gmail.com>
Cc:     jbaron@akamai.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "David S. Miller" <davem@davemloft.net>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Kent Overstreet <kent.overstreet@gmail.com>,
        "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Gary Hook <Gary.Hook@amd.com>, Arnd Bergmann <arnd@arndb.de>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux Documentation List <linux-doc@vger.kernel.org>
References: <20191205215151.421926-1-jim.cromie@gmail.com>
 <20191205215151.421926-20-jim.cromie@gmail.com>
 <CAHp75VcSkm4M7VOuMWnNUOMAPbbvmodGfn9_Pu25H213pMuxFA@mail.gmail.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <4e758f68-f1f3-432b-7bc0-2691012ec831@rasmusvillemoes.dk>
Date:   Fri, 6 Dec 2019 08:49:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcSkm4M7VOuMWnNUOMAPbbvmodGfn9_Pu25H213pMuxFA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/12/2019 23.24, Andy Shevchenko wrote:
> On Thu, Dec 5, 2019 at 11:54 PM Jim Cromie <jim.cromie@gmail.com> wrote:
>>
>> This rename fixes a subtle usage wrinkle; the __setup() names didn't
>> match the fake "dyndbg" module parameter used to enable dynamic-printk
>> callsites in modules.  See the last change in Docs for the effect.
>>
>> It also shortens the "__FILE__:__func__" prefix in dyndbg.verbose
>> messages, effectively s/dynamic_debug/dyndbg/
>>
>> This is a 99.9% rename; trim_prefix and debugfs_create_dir arg excepted.
>> Nonetheless, it also changes both /sys appearances:
>>
>> bash-5.0# ls -R /sys/kernel/debug/dyndbg/ /sys/module/dyndbg/parameters/
>> /sys/kernel/debug/dyndbg/:
>> control
> 
>> /sys/module/dyndbg/parameters/:
> 
> Isn't this path a part of ABI?

Yeah, I think this is a somewhat dangerous change, and I don't really
see the point.

Unrelated: Jim, if you want these patches picked up eventually, you have
to put akpm on the recipient list (he is on this one, but AFAICT not on
any of the others).

Rasmus
