Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBAB7C4338F
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 07:16:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD07B60EE6
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 07:16:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhGWGgH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jul 2021 02:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbhGWGgH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jul 2021 02:36:07 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68133C061757
        for <linux-doc@vger.kernel.org>; Fri, 23 Jul 2021 00:16:41 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id u9-20020a17090a1f09b029017554809f35so7674659pja.5
        for <linux-doc@vger.kernel.org>; Fri, 23 Jul 2021 00:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci-edu.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=KJ32JKsbpweHxm/Oe2m0XCE83TA5ZDfxZUOm3KQD4+g=;
        b=v5DXI7gMfxtI/KrtCorH0ZVVm26EV2ArJlOBECnLs/re4yGdwnumsMq72RIvzb0p3F
         V8+BTnxpcRSsnp2AU8Byt+o0orbFdDqoQj+HvoTxap0DJUbZpaprZcVIr6NqeL1hvU/E
         xL4629EnkMia4ACrvPHTw3KoRDCHRK/U6QuULRN9Rl1NsSLZNL3uD9M80AK+gsE7zqce
         6IPAkcZLvjSNed24xJhsL107G1lyptJICKqT44P0e/NtBpoLZPNqEj7WGsgr/n4jUy/f
         x6KE1/8qmIK2DjpBREjgjRVhDF04j5EayZcXIknHRK35GSUaqMhgF/dDoV+kJ7XS0phg
         AHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=KJ32JKsbpweHxm/Oe2m0XCE83TA5ZDfxZUOm3KQD4+g=;
        b=UH+oJwcrVxzwGOyAy2or0YJPMCFZv6noAt9+jX/5fUQjWchytQ0CGVRQUGpOtQDH8A
         plLz6ObgpnSVZRCzpxTBAi1Ty5IhfeAv2gGk8RLPUuT7aDbTuMYMxA4RSP85I4QZfzbJ
         mHhmY1I+OXFigaiW1VVC9nP167wuz9ZjbclIPnBfiUJ1hrcZb4Crk0jIt2zM7Eh/0hgT
         ebX/x8sbCJV6OQAhbM3hAi0+H65rWqRAfl0iNBNvxvqPqaYael9fp1y+QF5PaQUwq+2L
         ARGHS8nUFJjRqzdylpP6SSdeM+LbCxuh4FqxNGgbbaUfhlJ0e/tjNTZ4wKXE2wHULYZl
         DIBw==
X-Gm-Message-State: AOAM530vohy47kUBs7+1P40bg7XRdr2knN9zwDwvoqcTwnyeqA4p9s8p
        nPf8OGPo01Eo22/FnOZEob1A+Q==
X-Google-Smtp-Source: ABdhPJw4RNjfW44tTWvF+QMKfvzq2FFk7kRKeD07yfn5twpfxvuJBUZoWE1LKD40ZKMXMhjjuGTNWA==
X-Received: by 2002:a17:902:ead2:b029:12a:ec28:7bc9 with SMTP id p18-20020a170902ead2b029012aec287bc9mr2886521pld.79.1627024600876;
        Fri, 23 Jul 2021 00:16:40 -0700 (PDT)
Received: from [192.168.1.3] ([183.98.43.105])
        by smtp.gmail.com with ESMTPSA id z9sm32569827pfa.2.2021.07.23.00.16.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Jul 2021 00:16:40 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH v34 00/13] Introduce Data Access MONitor (DAMON)
From:   Dongjoo Seo <dseo3@uci.edu>
In-Reply-To: <YPpq4u+b/UzAE/3u@kroah.com>
Date:   Fri, 23 Jul 2021 16:16:27 +0900
Cc:     SeongJae Park <sj38.park@gmail.com>,
        "Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>,
        acme@kernel.org, akpm@linux-foundation.org,
        alexander.shishkin@linux.intel.com, amit@kernel.org,
        benh@kernel.crashing.org, brendanhiggins@google.com,
        corbet@lwn.net, david@redhat.com, dwmw@amazon.com,
        elver@google.com, fan.du@intel.com, foersleo@amazon.de,
        gthelen@google.com, guoju.fgj@alibaba-inc.com, jgowans@amazon.com,
        joe@perches.com, linux-damon@amazon.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, mgorman@suse.de,
        mheyne@amazon.de, minchan@kernel.org, mingo@redhat.com,
        namhyung@kernel.org, peterz@infradead.org, riel@surriel.com,
        rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org,
        shakeelb@google.com, shuah@kernel.org, sieberf@amazon.com,
        sjpark@amazon.de, snu@zelle79.org, vbabka@suse.cz,
        vdavydov.dev@gmail.com, zgf574564920@gmail.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <23F9BFF6-51B0-4EF7-AF2F-278F89D310C3@uci.edu>
References: <2E16FC36-18B4-4F92-86AE-51249CCDB1A4@uci.edu>
 <YPpq4u+b/UzAE/3u@kroah.com>
To:     Greg KH <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thank you for your comment!.

It has been a long time since Nvidia ended supporting the new kernel =
version on tx2 boards, but for researchers, this set of boards (tx2, =
px2, agx) is a very attractive candidate to use.
That's why I asked. If it's impossible because the maintainer is busy =
with other work, I'll do it myself!=20

Best,
Dongjoo Seo

> On Jul 23, 2021, at 4:08 PM, Greg KH <gregkh@linuxfoundation.org> =
wrote:
>=20
> On Fri, Jul 23, 2021 at 04:02:44PM +0900, Dongjoo Seo wrote:
>> Hello, I am new user of this amazing tool.
>> I want to use this tool for Nvidia tx2 board with kernel version =
4.9.140.
>>=20
>> Do you guys have any timeline or update schedule for different kernel =
version compatibility?
>=20
> Use a newer kernel on that board, there's no need for anyone to port =
new
> features to older kernel versions.
>=20
> Why are you stuck with 4.9.140?  That's very old and known insecure =
and
> obsolete.  Please contact the vendor who is providing it to you to =
give
> you the latest version as you are paying them for that support.
>=20
> good luck!
>=20
> greg k-h

