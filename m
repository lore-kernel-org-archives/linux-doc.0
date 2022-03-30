Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DD9C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 30 Mar 2022 00:07:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234395AbiC3AJi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Mar 2022 20:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231715AbiC3AJh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Mar 2022 20:09:37 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 497A643483
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 17:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=M7/wM5Sv4abkqNwzQiBvwsq5klwbwW5NSGc6FxIClD4=; b=VZDaDxJq65vVBVr+jKos0Yla1/
        RAVu7DXEN9oWaunKj5B0vsrr7Hkqd/ljkRrsV7Qhv+GiQZy5BsxZ5UjOzgB82G5twQwMGvJJ3bmqA
        6yKCjFrtQMRpQIZgwW7CjI6528cGcY2t4Cgkhb6ncYRXsrs9kdKN2ulItUMccuSzZiDSG7ImTASJP
        zNB2I5h3n7iBYWEeHBfPGJPSr6X6Rk0tWOxBHAX2K704Oauiix2URHMCXmQZbDdvyp6UKfYd3Z1YZ
        aOdLutrf8DPJtbVCzm+vvZ3mAVjyItGkTG98S/qLJj+Oz9KlR53x4BToyguv2RxloAwqIEZHhmj3X
        0MTvj8Qw==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nZLsE-0064Vc-AX; Wed, 30 Mar 2022 00:07:42 +0000
Message-ID: <5d71d4a8-c087-c7cc-6ffa-b92decb39d25@infradead.org>
Date:   Tue, 29 Mar 2022 17:07:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] docs: sphinx/requirements: Limit jinja2<3.1
Content-Language: en-US
To:     Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org
References: <7dbff8a0-f4ff-34a0-71c7-1987baf471f9@gmail.com>
 <871qyk7p28.fsf@meer.lwn.net>
 <42ae72ad-70db-719b-ed0b-8afedf50121d@infradead.org>
 <83cd3e27-a40e-d6d5-c3b3-180d00edeead@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <83cd3e27-a40e-d6d5-c3b3-180d00edeead@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 3/29/22 16:51, Akira Yokosawa wrote:
> On Tue, 29 Mar 2022 08:36:23 -0700,
> Randy Dunlap wrote:
>>
>> On 3/29/22 08:31, Jonathan Corbet wrote:
>>> Akira Yokosawa <akiyks@gmail.com> writes:
>>>
>>>> jinja2 release 3.1.0 (March 24, 2022) broke Sphinx<4.0.
>>>> This looks like the result of deprecating Python 3.6.
>>>> It has been tested against Sphinx 4.3.0 and later later.
>>>
>>> *Sigh*.  I wish this stuff didn't feel like such a house of cards
>>> sometimes... 
>>
>> ack.
>>
>>>> Setting an upper limit of <3.1 to junja2 can unbreak Sphinx<4.0
>>>> including Sphinx 2.4.4.
>>>>
>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>> Cc: Jonathan Corbet <corbet@lwn.net>
>>>> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>>>> Cc: linux-doc@vger.kernel.org
>>>> ---
>>>> Or we can bump the requirement to Sphinx>=4.0.
>>>> Thoughts?
>>>
>>> It's probably time to consider a bump there, but that is a bigger one
>>> than I would want to do at this point.  So I'll just fast-track this
>>> patch in; dropping it into the stable updates probably makes sense too.
>>
>> Yeah, some of us don't have Python4 installed...
> 
> You can run Sphinx 4.5.0 with Python>=3.6.
> (jinja2>3.1 requires Python>=3.7, though.)
> 
> A requirement list for installing latest Sphinx for kerneldoc would be
> a single line of:
> 
> ----
> sphinx_rtd_theme
> ----
> 
> Or for Python 3.6,
> 
> ----
> jinja2<3.1
> sphinx_rtd_theme
> ----
> 
> should work (tested with Python 3.6.9 on Ubuntu 18.04).
> That is, give or take the occasional breakages caused by a conflict
> between updated dependent packages or updated dependencies.
> 
> We can't be safe just by pinning Sphinx version.  Old Sphinx can't
> know of breakages by future updates in its dependencies.
> To avoid this, we need to pin every dependent package.
> I'm not sure this is the right thing to do, though...

Hi Akira,
Thanks for the tips.
However, I think that I misread Sphinx.4+ as Python4. :(

-- 
~Randy
