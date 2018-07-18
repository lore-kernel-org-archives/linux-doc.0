Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 387667D071
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Jul 2018 00:59:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730614AbeGRBeK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Jul 2018 21:34:10 -0400
Received: from condef-01.nifty.com ([202.248.20.66]:59485 "EHLO
        condef-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731513AbeGRBeI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Jul 2018 21:34:08 -0400
Received: from conssluserg-02.nifty.com ([10.126.8.81])by condef-01.nifty.com with ESMTP id w6I0rJaL011874
        for <linux-doc@vger.kernel.org>; Wed, 18 Jul 2018 09:53:19 +0900
Received: from mail-ua0-f175.google.com (mail-ua0-f175.google.com [209.85.217.175]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id w6I0qwfM032648;
        Wed, 18 Jul 2018 09:52:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com w6I0qwfM032648
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1531875179;
        bh=lYqEq28KFEi2SfHDQG28X5BGNtVJLWXq2pv/8ehGV1U=;
        h=In-Reply-To:References:From:Date:Subject:To:Cc:From;
        b=V77oTJg4YBSDpn6Ha/oCdO7pb1JZJFWFlt/XyWGHKqWT0c4zB48aBIv7sK6ihT71j
         MH/02b0EP9sfImNjjGJ6pJwMu/33MC0RfZKoB1jXu7o46PFaLB5EOg40EgIVsL3wBi
         3ICwny1zKNZiw/6TJgQAz93+BPiRFcC4WkaYpop0wMTo0mx2ImwlxQHnxtu9LIjBTb
         1/wbEDdVJbBDVmVFJ4aMR/pE/7IaiKU+ZCGnvoFTJcah2Qqd3B5ONcEIc8xBUzZUdU
         wAY4k1Yf285ckcj1qV+ciOQIoHyj4pF6fNNB3G5CJ8KU/5j7UEURnpT8aB6p2MIJQ5
         ioNlGxYoGoRSQ==
X-Nifty-SrcIP: [209.85.217.175]
Received: by mail-ua0-f175.google.com with SMTP id x24-v6so1875554ual.10;
        Tue, 17 Jul 2018 17:52:58 -0700 (PDT)
X-Gm-Message-State: AOUpUlFLOPRklXlpoeKhrNvtLgU7iJBJlTrHB8T7YAAC7GeNDiomfbGq
        WOUaJWjKIYur/dFTVTOoNL3C7XNdYHFil3m443g=
X-Google-Smtp-Source: AAOMgpetCRndZguWwwqVwpjeOGZ/5LvcnBDI7iF1If1jg7dI8NZa5vaXva/8hW9Fnih6tgNrHABK+NSBRiydp5ImX4M=
X-Received: by 2002:ab0:4705:: with SMTP id h5-v6mr2611615uac.140.1531875177745;
 Tue, 17 Jul 2018 17:52:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3308:0:0:0:0:0 with HTTP; Tue, 17 Jul 2018 17:52:17
 -0700 (PDT)
In-Reply-To: <bd8bd678-c42d-4b04-fa55-00c6f524a4bb@redhat.com>
References: <20180710004602.21599-1-labbott@redhat.com> <CAK7LNAQ0dWqaYkLjevCuboCBovcsTV1cMh48qv__wwMZs-vAxg@mail.gmail.com>
 <bd8bd678-c42d-4b04-fa55-00c6f524a4bb@redhat.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 18 Jul 2018 09:52:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNATtCz9FwELNOcrWHKp=5KSh+y68d5tjZbqnK=DCXVYFrQ@mail.gmail.com>
Message-ID: <CAK7LNATtCz9FwELNOcrWHKp=5KSh+y68d5tjZbqnK=DCXVYFrQ@mail.gmail.com>
Subject: Re: [PATCHv2 0/7] HOSTFLAGS and HOSTLDFLAGS from the environment
To:     Laura Abbott <labbott@redhat.com>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Robin Jarry <robin.jarry@6wind.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-07-13 2:08 GMT+09:00 Laura Abbott <labbott@redhat.com>:
> On 07/12/2018 03:13 AM, Masahiro Yamada wrote:
>>
>> 2018-07-10 9:45 GMT+09:00 Laura Abbott <labbott@redhat.com>:
>>>
>>>
>>> Hi,
>>>
>>> This is v2 of the series to set HOSTCFLAGS and HOSTLDFLAGS from the
>>> environment. The changes are mostly minor fixups requested and also
>>> include documentation of the new options.
>>
>>
>>
>>
>> I checked this series.
>>
>>
>> I left minor comments for 3/7 and 7/7.
>>
>> Unless you disagree,
>> I will fix them up locally
>> and queue it to my tree.
>>
>
> The fixes look fine.
>


Applied to linux-kbuild. Thanks.


> Thanks,
> Laura
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
