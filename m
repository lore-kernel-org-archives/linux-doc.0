Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75906C433ED
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 17:53:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F12B6128A
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 17:53:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348479AbhDGRxq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 13:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229917AbhDGRxp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Apr 2021 13:53:45 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEBE2C06175F;
        Wed,  7 Apr 2021 10:53:35 -0700 (PDT)
Received: from ip4d14bd53.dynamic.kabel-deutschland.de ([77.20.189.83] helo=[192.168.66.200]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1lUCMp-0004Q9-JB; Wed, 07 Apr 2021 19:53:27 +0200
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1617786974.git.linux@leemhuis.info>
 <f959331ed0e1a8ed59be9771fcab64378bd6977d.1617786974.git.linux@leemhuis.info>
 <YG2BxMBLqEt4mkgS@kroah.com>
 <3121a1cd-47c6-b26e-0cb3-71872d5ffc65@leemhuis.info>
 <YG3IK46M4LNWp3EO@kroah.com>
From:   Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [RFC PATCH v1 1/2] MAINTAINERS: add regressions mailing list
Message-ID: <de24893c-8e36-e810-dca8-bc84934780b1@leemhuis.info>
Date:   Wed, 7 Apr 2021 19:53:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YG3IK46M4LNWp3EO@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-BS
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1617818016;ed61a651;
X-HE-SMSGID: 1lUCMp-0004Q9-JB
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07.04.21 16:56, Greg KH wrote:
> On Wed, Apr 07, 2021 at 12:51:43PM +0200, Thorsten Leemhuis wrote:
>> On 07.04.21 11:56, Greg KH wrote:
>>> On Wed, Apr 07, 2021 at 11:21:55AM +0200, Thorsten Leemhuis wrote:
>>>> Add the newly created regression mailing list finally created after it
> [...]
>>> [...]
>>>> +REGRESSIONS
>>>> +L:	regressions@lists.linux.dev
>>>> +K:	regression
>>>
>>> A bit more information here perhaps?  This will not really help anyone
>>> out to know what to do.
>> [...]
>> Or did you have something totally different in mind?
> 
> Well, "K:	regression" is not a regex,

FWIW, there are a few other entries with a K: like that, for example:

K:	riscv

K:	regulator_get_optional

And I checked with get_maintainer.pl that the "K: regression" worked
when letting it work on a patch. But that it is a unusual thing to do I
guess, so in the end...

> so that's not going to really help much.

...you are right here afaics.

> How about something simple like:
> 	KERNEL REGRESSIONS:
> 	M:	Thorsten Leemhuis <linux@leemhuis.info>
> 	L:	regressions@lists.linux.dev
> 	S:	Supported
> 
> That looks a bit more like other entries, has a name and a list and a
> state of your status for this work.
> 
> Would that work?

Yup, thx for the example, much appreciated.

Ciao, Thorsten
