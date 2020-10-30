Return-Path: <SRS0=p3aP=EF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CF2C4363A
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 12:36:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1F7A221FF
	for <linux-doc@archiver.kernel.org>; Fri, 30 Oct 2020 12:36:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgJ3MgY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Oct 2020 08:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgJ3MgY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Oct 2020 08:36:24 -0400
X-Greylist: delayed 438 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 30 Oct 2020 05:36:23 PDT
Received: from smtp2-2.goneo.de (smtp2.goneo.de [IPv6:2001:1640:5::8:33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A294C0613CF
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2020 05:36:23 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by smtp2.goneo.de (Postfix) with ESMTP id 58C4A23F789;
        Fri, 30 Oct 2020 13:29:01 +0100 (CET)
X-Virus-Scanned: by goneo
Received: from smtp2.goneo.de ([127.0.0.1])
        by localhost (smtp2.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ZCtrefz9eu7S; Fri, 30 Oct 2020 13:29:00 +0100 (CET)
Received: from [192.168.1.127] (dyndsl-085-016-042-167.ewe-ip-backbone.de [85.16.42.167])
        by smtp2.goneo.de (Postfix) with ESMTPSA id 9BF6123F856;
        Fri, 30 Oct 2020 13:28:59 +0100 (CET)
Subject: Re: excess bolding in html
To:     Matthew Wilcox <willy@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
References: <31362b3b-469f-1f74-d929-b6faa7ae4e30@infradead.org>
 <20201030083748.4db9848b@coco.lan>
 <20201030113147.GG27442@casper.infradead.org>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <db164a2a-83f1-efd0-1c73-a4a77785bb59@darmarit.de>
Date:   Fri, 30 Oct 2020 13:28:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030113147.GG27442@casper.infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am 30.10.20 um 12:31 schrieb Matthew Wilcox:
> On Fri, Oct 30, 2020 at 08:37:48AM +0100, Mauro Carvalho Chehab wrote:
>> Just changing the kernel-doc markup at kernel/futex.c:
>>
>> 	/**
>> 	 * futex_setup_timer - set up the sleeping hrtimer.
>> 	 * @time:	ptr to the given timeout value
>> 	 * @timeout:	the hrtimer_sleeper structure to be set up
>> 	 * @flags:	futex flags
>> 	 * @range_ns:	optional range in ns
>> 	 *
>> 	 * Return: Initialized hrtimer_sleeper structure or NULL if no timeout
>> 	 *	   value given
>> 	 */
>>
>> To:
>>
>> ...
>> 	 * Return:
>> 	 *
>> 	 * Initialized hrtimer_sleeper structure or NULL if no timeout
>> 	 * value given
>> 	 */
>>
>> Should fix it.
> 
> Or just remove the indent.
> 
>   * Return: Initialized hrtimer_sleeper structure or NULL if no timeout
>   * value given.

To add my 2 cent:

The return value should be described in a dedicated section
named "Return:", like shown im Mauro's example (compare [1]).

For on-liners I think it is OK to use the short form (compare [2]).

[1] https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#return-values
[2] 
https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#function-documentation

-- Markus --

