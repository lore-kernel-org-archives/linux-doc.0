Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB87DC433EF
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jun 2022 21:34:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238857AbiFCVeQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jun 2022 17:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbiFCVeP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 17:34:15 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0370D3DDFE
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 14:34:14 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B4ABF37C;
        Fri,  3 Jun 2022 21:34:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B4ABF37C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1654292054; bh=XuZAeQia/QYHoSFRgkIp9KTrN0mIPWPj5LK9HiKG5qE=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=SBhzQ7vh8jnJI6gbbseDp1/oFeXeqG+F8YMNiehTnMo+l+o5LhOSQGSw+KtngqS2B
         mCkBElCgADGZf6ZuBuXahM5xl/U+TkPqcuiidgql+tAXTd+nfnrcICvUuaC5aQKRp2
         TrBkclcoaVbeFQKOPkL+pSVjhNVCD8GrlBKEarLjghkgM6kEd7Kcj/9b3rzz79Ruzl
         JlNMVXTd19BbsXV6CJGJBao+9SvFmxgoVlXiNLSHkfbrhP0nsBfZ29oge20rZ1e8L5
         4SNdQLprYo8CfR53waXVRhxgtZdg5+m3bT7rZbDRH01jNgU4ebOXG0Um6lPVbaXpcP
         OAHv0GDv8NS6g==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Adam Turner <aaturnerpython@outlook.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Sphinx pre v3 -- removing support
In-Reply-To: <LO3P123MB2681ADAA6BD2102ACBD86622C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
References: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
 <877d5xx1xo.fsf@meer.lwn.net>
 <LO3P123MB2681ADAA6BD2102ACBD86622C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
Date:   Fri, 03 Jun 2022 15:34:14 -0600
Message-ID: <875ylhjusp.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adam Turner <aaturnerpython@outlook.com> writes:

>> We've been meaning to raise the minimum version for a bit.  Going to v3
>> might be a bit of a stretch, though.  I still do most of my test builds
>> with 2.4.3 just because Sphinx got so....much........slower with 3.0.
>> I've not yet had a chance to try out 5.0 to see if that helps things,
>> that's on my list to do soon.
>
> Sphinx 5.0 should be faster, I changed the logic to cache and reuse
> the core publisher objects [1]_. I haven't compared to 2.4.3 though.

So ... here are a few "make htmldocs" builds that I ran

  VERSION  BUILD TIME
  2.4.3     5:24
  4.1.2    10:51
  4.5.0    10:57
  5.0.1    11:17

So 5.0 has actually regressed from 4.5 in terms of speed, and takes more
than twice the time that 2.4.3 takes.  These slow builds are really
painful when I'm working through the docs patch queue and have to build
things frequently; they are also a disincentive for other developers to
build the docs and make sure they haven't broken anything.

(Interestingly, total CPU time is ~16:45 for 2.4.3, and ~21:45 for the
later versions.  So latter-day Sphinx does use more CPU, but it also
seems to have lost some parallelism.)

I hope you understand why that makes me reluctant to move the minimum
version up to 3.0.  But, looking further at this conversation, I don't
think we need to at this point.  You said:

> I'm referring to removing support for the "c_allow_pre_v3", 
> "c_warn_on_allowed_pre_v3", configuration options [1]_, and the 
> associated support for still parsing the pre v3 syntax in the C 
> domain [2]_. This means that pre v3 syntax in reStructuredText files
> would not work with Sphinx 6 onwards.

Having looked through the all-too-numerous warnings emitted by our docs
build, I don't see any that look like they would be tied to pre-v3
C-domain syntax.  I *believe* that you could remove that support and it
wouldn't bother us, unless there's something I'm missing?

I truly appreciate your contacting us about this - thanks!

jon
