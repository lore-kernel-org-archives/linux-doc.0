Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC50BC433EF
	for <linux-doc@archiver.kernel.org>; Mon,  1 Nov 2021 14:00:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9684760F58
	for <linux-doc@archiver.kernel.org>; Mon,  1 Nov 2021 14:00:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbhKAOCo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Nov 2021 10:02:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39023 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231366AbhKAOCm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Nov 2021 10:02:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635775209;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CGF/tc1tys7W0SSlzlHBg4COK2uDj55D54FnN5zXvwg=;
        b=F6d5wok9IZifOCzZzaPB02i7IZGCYlIWXDyRgTGXkD/p3BTrDosznTFqJ9U2gQIebeShY5
        fbS/Q3AAZ9l0Vmz+Is6ph93jyfpFU0Z5IjawnFZktOlc3cbddg0yK5IXdGg6/56bejf4gV
        RjYtx+36pLx6VLoPdK7e/KQD+F7axm0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-3-ysT1zwOyyKazf1Xpj3Gw-1; Mon, 01 Nov 2021 10:00:08 -0400
X-MC-Unique: 3-ysT1zwOyyKazf1Xpj3Gw-1
Received: by mail-wr1-f71.google.com with SMTP id z5-20020a5d6405000000b00182083d7d2aso1834101wru.13
        for <linux-doc@vger.kernel.org>; Mon, 01 Nov 2021 07:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:organization:subject
         :in-reply-to:content-transfer-encoding;
        bh=CGF/tc1tys7W0SSlzlHBg4COK2uDj55D54FnN5zXvwg=;
        b=MuqWTSiHRnrEIMcSf0wP6LHryEMvbr1vlKuSlpCXGyVs8l5RSVT4+6SjZ0DfbyV32l
         7oB5na1OhKz7B8t3hJtVF1JhAlAqBl8md5Fgbbt9jHsIwcO3siZ8L0J03dqB+vgnNNd7
         ocphrJrpA0SKfZLiP/UlgX4X2+sIesHcY+iw6ho9Vt5dHQvcCKtLWXe5rgdHPhYndSki
         ToLZrtdFh/mtDcpcXJcZ2XmqU7PsIe0FG+kJR9H5IOpM/zPWDt1Ha33HdLSonNaZe2bO
         t2JGeST1R62BWy2KSNJZdDZP06eZEWQrl3Hu17kpEXU6VuQ81H4sNXZbl7fKy2t6If9d
         WbQg==
X-Gm-Message-State: AOAM531zAhrfBqVikWmbTNV36ne0RIBFKp+FcYR2VI8R/FZjObLKkgvj
        Jy3uFqVX67q8bAMf6La/bUNuVW1pcbprYte0KT8eNs3a6fJcMUxsrR0AcI1VEtUe+rcQPLJfL2V
        asw2wk/EOGNallPpsn4R7
X-Received: by 2002:adf:a28f:: with SMTP id s15mr37249416wra.138.1635775206456;
        Mon, 01 Nov 2021 07:00:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAldUsQPP7Lli9jGRoJzxybz2sntHyUvrjKSbHwlWI9s0xBLd2KiypkKB5/K89Pzn79yikWw==
X-Received: by 2002:adf:a28f:: with SMTP id s15mr37249383wra.138.1635775206204;
        Mon, 01 Nov 2021 07:00:06 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c692a.dip0.t-ipconnect.de. [91.12.105.42])
        by smtp.gmail.com with ESMTPSA id h18sm8369717wre.46.2021.11.01.06.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 06:59:58 -0700 (PDT)
Message-ID: <997b4919-ea13-b5a7-0b4e-8c39b63bde0b@redhat.com>
Date:   Mon, 1 Nov 2021 14:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To:     teng sterling <sterlingteng@gmail.com>,
        Alex Shi <seakeel@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Alex Shi <alexs@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>,
        linux-kernel@vger.kernel.org
References: <cover.1634630485.git.mchehab+huawei@kernel.org>
 <b22b772c23f531708a9bc025d56c0312a53bd6c9.1634630486.git.mchehab+huawei@kernel.org>
 <878ryosocf.fsf@meer.lwn.net>
 <f0269915-4863-9ed6-dedd-592f2e308f46@redhat.com>
 <CAJy-AmnHht4=sNyQ5r78MwfOpMF8dRqrct8fasVX-ULadfMNvg@mail.gmail.com>
 <CAMU9jJoSVeXThH6vKjKKEvrMQ5f_Yu7Z9PD99Oxk1-MHVLLb5w@mail.gmail.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v3 16/23] docs: translations: zh_CN: memory-hotplug.rst:
 fix a typo
In-Reply-To: <CAMU9jJoSVeXThH6vKjKKEvrMQ5f_Yu7Z9PD99Oxk1-MHVLLb5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 01.11.21 14:38, teng sterling wrote:
> Alex Shi <seakeel@gmail.com> 于2021年11月1日周一 下午3:48写道：
>>
>> On Wed, Oct 20, 2021 at 3:08 PM David Hildenbrand <david@redhat.com> wrote:
>>>
>>> Dumb question that probably has been asked a couple of times already:
>>> why do we even maintain a translated doc in-tree?
>>>
>>> Every time I do an update on the original doc, I for sure can only guess
>>> which translated parts need updating. And I really can only update when
> Dear David
> 
> Thank you very much for your contribution, in fact, we are always updating the
> translations and improving the speed of the sync, so If you are not
> good at Chinese
> and want to get the sync faster, please CC us when you send the patch.
> 

It would be great if we would get this suggestion automatically, e.g.,
via get_maintainers.pl --- maybe that's already done, I didn't check.

Personally, I don't speak/read any Chinese, so I'm mostly lost staring
at the Chinese translation. :)


>>> "deleting", not when rewording/adding. So we'll be left with stale doc
>>> that will have to be updated manually by $whoever.
>>
>> cc to the translation maintainers and translator would be helpful?
> Alex,Maybe we should provide a translation guide in English, e.g::
> 
>   Dear developers, if you have trouble updating the Chinese documentation after
>   updating the original documentation, please CC the translator of
> that documentation
>   and the maintainer of the Chinese documentation, and the relevant
> documentation
>   will be updated soon.
> 
>>
>>> I don't feel very
>>> confident about this. No translated doc is better than outdated
>>> translated doc.
>>
>> Uh, I don't know other languages, but in Chinese, 15 years before
>> translated books are still selling well in China. :)
>> https://item.jd.com/1075130482.html  ->  Linux device driver
>> https://item.jd.com/10100237.html  -> Understanding linux kernel
> Yes, I just bought a LDD3 last week.! >_<

Yes, these books in particular are still of a lot of value, although
outdated. :)

The difference is that when you translate a book, there is a
date/version attached, meaning, the original book was for example based
on kernel v2.XXX. Once you translate the book, it's simply based on the
same kernel version.

The in-tree doc is similar. You can access the v5.14 doc for example
easily via https://www.kernel.org/doc/html/v5.14/. And the Chinese
version via https://www.kernel.org/doc/html/v5.14/translations/zh_CN/.

If I as a developer perform a doc update in v5.14, and the translation
isn't updated until the end of the same release, the versioned
documentation will be out of sync. And that happens automatically with a
new release.

With an out-of-tree translation, there wouldn't really be an issue. Once
everything was translated (brought up-to-date), you would mark it has
"fully translated doc of v5.15" manually and release it.

But maybe the translation maintainers already take proper care of
updating any translation just before the new kernel is released.

So just my comment after stumbling over in-tree doc translations.

-- 
Thanks,

David / dhildenb

