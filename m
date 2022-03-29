Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91895C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 29 Mar 2022 23:51:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241336AbiC2Xxl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Mar 2022 19:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241304AbiC2Xx0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Mar 2022 19:53:26 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C68A21795E
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 16:51:34 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id mp6-20020a17090b190600b001c6841b8a52so420303pjb.5
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 16:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lCbPZgZ5F9lpxHcM9arOFaznEWqI3PfUhqJRCKwipNo=;
        b=UeigN0ENRj7P25JOugWlJkEU3i6OiFiv/I2j8KAuLnF/iaJBhxRnk9DCbeya8gV4Mz
         0UUmo1seprOcbsciRO0hkS3uiOswkF1zIJsBeGDpso406y2eRdNo/4oAUr0FKY9jQ8MA
         qNqJUwtx4PihGoNZ9uyRdCjCW+I6MJGhrRqJCyNKZLPi+bFOyd7FuzXSJ/VdpxoC70CY
         QRTOXBjnoQwXLWb2B9Jd/xHTtlhQpLPpWMthxwjHdE/lUI3MM6+nEjQyCKQbFDe0UrK0
         aCVL5q+McBcDh+VJYxPdZJ8OVM/ElNdeMLMdazEx1cNLM9A2dGp27BvbqFTZDydHOw28
         G7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lCbPZgZ5F9lpxHcM9arOFaznEWqI3PfUhqJRCKwipNo=;
        b=y0/GJg2at4K6Jfg26RJjYk35vj+xaW8hKj/C4PiAV0ZRW+KcA5Mkvu08OKy2RW2GAW
         JrF2LayIZstlo14KU5I+saei8Rsjm7mZEL92nl/7d/s7temf/eKQwN5ng5Cd0sXZjFoZ
         R6k3fYJtLne8IyCKvm5I+Q/RlMZYqwc5ds7GOOtdL9wOQoa9GYabmmkq4SYSPZkXLSw8
         Erodw1d56s+B8r9Qb91SGvyisnZhKF8lC5MVyfIuav5Rl7lnksdXGqog8lH+Y4FSXI0I
         mo/zCeGSHCiLq/emgMeAK0gFxzbLcuCclK7qXT7YEtkM3DnTDu1pwDq/cjTu+mmxhUAj
         ObFA==
X-Gm-Message-State: AOAM533Nq7DiSfOk41n66Of/nZUWnEF9SoLYGdlS3fdtClyJvZMLuLtl
        E9WWiw+S0HCo/UNOp0m6eug0N/JsJ24=
X-Google-Smtp-Source: ABdhPJzhPP/cZnj5Cr+rQctCOAlM2ZR64fCKGl4dbyQ1CU82sxe59MxpIdmmO/LG412U57Y5jsjFfQ==
X-Received: by 2002:a17:90b:1b4f:b0:1c6:d91b:9d0 with SMTP id nv15-20020a17090b1b4f00b001c6d91b09d0mr1766370pjb.72.1648597893876;
        Tue, 29 Mar 2022 16:51:33 -0700 (PDT)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id e1-20020a17090a118100b001c9ee116c35sm657727pja.16.2022.03.29.16.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 16:51:33 -0700 (PDT)
Message-ID: <83cd3e27-a40e-d6d5-c3b3-180d00edeead@gmail.com>
Date:   Wed, 30 Mar 2022 08:51:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] docs: sphinx/requirements: Limit jinja2<3.1
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org
References: <7dbff8a0-f4ff-34a0-71c7-1987baf471f9@gmail.com>
 <871qyk7p28.fsf@meer.lwn.net>
 <42ae72ad-70db-719b-ed0b-8afedf50121d@infradead.org>
From:   Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <42ae72ad-70db-719b-ed0b-8afedf50121d@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 29 Mar 2022 08:36:23 -0700,
Randy Dunlap wrote:
> 
> On 3/29/22 08:31, Jonathan Corbet wrote:
>> Akira Yokosawa <akiyks@gmail.com> writes:
>>
>>> jinja2 release 3.1.0 (March 24, 2022) broke Sphinx<4.0.
>>> This looks like the result of deprecating Python 3.6.
>>> It has been tested against Sphinx 4.3.0 and later later.
>>
>> *Sigh*.  I wish this stuff didn't feel like such a house of cards
>> sometimes... 
> 
> ack.
> 
>>> Setting an upper limit of <3.1 to junja2 can unbreak Sphinx<4.0
>>> including Sphinx 2.4.4.
>>>
>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>> Cc: Jonathan Corbet <corbet@lwn.net>
>>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>>> Cc: linux-doc@vger.kernel.org
>>> ---
>>> Or we can bump the requirement to Sphinx>=4.0.
>>> Thoughts?
>>
>> It's probably time to consider a bump there, but that is a bigger one
>> than I would want to do at this point.  So I'll just fast-track this
>> patch in; dropping it into the stable updates probably makes sense too.
> 
> Yeah, some of us don't have Python4 installed...

You can run Sphinx 4.5.0 with Python>=3.6.
(jinja2>3.1 requires Python>=3.7, though.)

A requirement list for installing latest Sphinx for kerneldoc would be
a single line of:

----
sphinx_rtd_theme
----

Or for Python 3.6,

----
jinja2<3.1
sphinx_rtd_theme
----

should work (tested with Python 3.6.9 on Ubuntu 18.04).
That is, give or take the occasional breakages caused by a conflict
between updated dependent packages or updated dependencies.

We can't be safe just by pinning Sphinx version.  Old Sphinx can't
know of breakages by future updates in its dependencies.
To avoid this, we need to pin every dependent package.
I'm not sure this is the right thing to do, though...

        Thanks, Akira

> 
