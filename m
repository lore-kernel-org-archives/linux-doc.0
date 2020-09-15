Return-Path: <SRS0=ug/q=CY=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389E2C43461
	for <linux-doc@archiver.kernel.org>; Tue, 15 Sep 2020 01:34:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B32BB20829
	for <linux-doc@archiver.kernel.org>; Tue, 15 Sep 2020 01:34:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ioWQ6RfR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbgIOBex (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Sep 2020 21:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgIOBev (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Sep 2020 21:34:51 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF6F9C06174A;
        Mon, 14 Sep 2020 18:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=5O6R4wFiQE5iCaDQZmXLRcqdjOENLSVdkUPEBgLW0Ho=; b=ioWQ6RfRfJd1Q5jWydaYLCLm5N
        f4JLcDq4Su61ky7reqlcIAqDo6Fv63/Ed4IDhvOS+A+aBcyen9W/QuD4z+VnN91BFC1hCIAWBVN5Q
        6sOLPnIMd/ZaqphPCxjMBtMSOTQLRVaSTBo3vMFhJAa0FTvddvIDoK5wc0tPiEki4edGSdw6/rcmI
        p3Wjo64KL4e4loIeI66t0LHuJpFso6vgLgnKxgSx/VZp1X8nb7Z9L58/Yn7PDS2tqf5+Gxf4EVnUN
        2st7QUxhLNK7M4bN+1wsj8FOg7fytDYeAatDohvGTPey22vvwRjgZWDtU7mGSelmOfo3vrE5Ylhj7
        5N2HPNIA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kHzrb-00052l-5N; Tue, 15 Sep 2020 01:34:31 +0000
Subject: Re: fbcon: remove soft scrollback code (missing Doc. patch)
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Yuan Ming <yuanmingbuaa@gmail.com>, Willy Tarreau <w@1wt.eu>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        NopNop Nop <nopitydays@gmail.com>,
        =?UTF-8?B?5byg5LqR5rW3?= <zhangyunhai@nsfocus.com>,
        Andy Lutomirski <luto@amacapital.net>,
        Jonathan Corbet <corbet@lwn.net>
References: <git-mailbomb-linux-master-50145474f6ef4a9c19205b173da6264a644c7489@kernel.org>
 <c9cd22ec-60dc-d761-b488-d3a1392708c0@infradead.org>
 <20200915012800.GA17809@Gentoo>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ada6aecf-b98e-5249-5e68-7a4eaa947ce3@infradead.org>
Date:   Mon, 14 Sep 2020 18:34:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200915012800.GA17809@Gentoo>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/14/20 6:28 PM, Bhaskar Chowdhury wrote:
> On 18:18 Mon 14 Sep 2020, Randy Dunlap wrote:
>> HI--
>>
>> On 9/14/20 3:48 PM, Linux Kernel Mailing List wrote:
>>> Commit:     50145474f6ef4a9c19205b173da6264a644c7489
>>> Parent:     856deb866d16e29bd65952e0289066f6078af773
>>> Refname:    refs/heads/master
>>> Web:        https://git.kernel.org/torvalds/c/50145474f6ef4a9c19205b173da6264a644c7489
>>> Author:     Linus Torvalds <torvalds@linux-foundation.org>
>>> AuthorDate: Mon Sep 7 11:45:27 2020 -0700
>>> Committer:  Linus Torvalds <torvalds@linux-foundation.org>
>>> CommitDate: Mon Sep 14 10:06:15 2020 -0700
>>>
>>>     fbcon: remove soft scrollback code
>>>         This (and the VGA soft scrollback) turns out to have various nasty small
>>>     special cases that nobody really is willing to fight.  The soft
>>>     scrollback code was really useful a few decades ago when you typically
>>>     used the console interactively as the main way to interact with the
>>>     machine, but that just isn't the case any more.
>>
>> and:
>>
>>> Commit:     973c096f6a85e5b5f2a295126ba6928d9a6afd45
>>> Parent:     06a0df4d1b8b13b551668e47b11fd7629033b7df
>>> Refname:    refs/heads/master
>>> Web:        https://git.kernel.org/torvalds/c/973c096f6a85e5b5f2a295126ba6928d9a6afd45
>>> Author:     Linus Torvalds <torvalds@linux-foundation.org>
>>> AuthorDate: Wed Sep 9 14:53:50 2020 -0700
>>> Committer:  Linus Torvalds <torvalds@linux-foundation.org>
>>> CommitDate: Mon Sep 14 10:06:15 2020 -0700
>>>
>>>     vgacon: remove software scrollback support
>>
>>
>>
>> diffstats:
>>
>>> ---
>>>  drivers/video/fbdev/core/fbcon.c | 334 +--------------------------------------
>>>  1 file changed, 4 insertions(+), 330 deletions(-)
>>
>>>  arch/powerpc/configs/pasemi_defconfig |   1 -
>>>  arch/powerpc/configs/ppc6xx_defconfig |   1 -
>>>  arch/x86/configs/i386_defconfig       |   1 -
>>>  arch/x86/configs/x86_64_defconfig     |   1 -
>>>  drivers/video/console/Kconfig         |  46 -------
>>>  drivers/video/console/vgacon.c        | 221 +---------------------------------
>>>  6 files changed, 1 insertion(+), 270 deletions(-)
>>
>>
>>
>>
>> Now someone can remove the documentation for scrollback (and "no-scroll")...
>>
>>
> If you wont mind ...let me stab at it ...

Sure, go for it.  Thanks.

> 
> Documentation/admin-guide/kernel-parameters.txt:        no-scroll       [VGA] Disables scrollback.
> Documentation/fb/fbcon.rst:2. fbcon=scrollback:<value>[k]
> Documentation/fb/fbcon.rst:     The scrollback buffer is memory that is used to preserve display
> Documentation/fb/matroxfb.rst:   with 'video=scrollback:0'.
> Documentation/fb/sstfb.rst:  disable software scrollback, as it can oops badly ...
> Documentation/fb/vesafb.rst:            * You'll get scrollback (the Shift-PgUp thing),
> Documentation/fb/vesafb.rst:              the video memory can be used as scrollback buffer


-- 
~Randy

