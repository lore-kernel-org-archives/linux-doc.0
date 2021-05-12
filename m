Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325F7C433ED
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 07:18:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07CF4613DA
	for <linux-doc@archiver.kernel.org>; Wed, 12 May 2021 07:18:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhELHTl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 12 May 2021 03:19:41 -0400
Received: from smtp4.goneo.de ([85.220.129.59]:34568 "EHLO smtp4.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229850AbhELHTk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 12 May 2021 03:19:40 -0400
Received: from [192.168.1.127] (dyndsl-085-016-042-119.ewe-ip-backbone.de [85.16.42.119])
        by smtp4.goneo.de (Postfix) with ESMTPSA id 7DD3C2038422;
        Wed, 12 May 2021 09:18:30 +0200 (CEST)
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1' codec
 can't encode characters in position 18-20: ordinal not in range(256)
To:     =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
References: <20210506103913.GE6564@kitsune.suse.cz>
 <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
 <20210506184641.6348a621@coco.lan>
 <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
 <20210506174849.GH6564@kitsune.suse.cz> <20210512082238.682f6aea@coco.lan>
 <20210512070157.GQ12700@kitsune.suse.cz>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <7d62123c-297b-fd80-06f7-23ff6ba51b5c@darmarit.de>
Date:   Wed, 12 May 2021 09:18:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512070157.GQ12700@kitsune.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am 12.05.21 um 09:01 schrieb Michal Suchánek:
> On Wed, May 12, 2021 at 08:22:38AM +0200, Mauro Carvalho Chehab wrote:
>> Hi Michal,
>>
>> Em Thu, 6 May 2021 19:48:49 +0200
>> Michal Suchánek <msuchanek@suse.de> escreveu:
>>
>>> [  127s] + :
>>> [  127s] + locale
>>> [  128s] LANG=en_US
>>> [  128s] LC_CTYPE="en_US"
>>> [  128s] LC_NUMERIC="en_US"
>>> [  128s] LC_TIME="en_US"
>>> [  128s] LC_COLLATE="en_US"
>>> [  128s] LC_MONETARY="en_US"
>>> [  128s] LC_MESSAGES="en_US"
>>> [  128s] LC_PAPER="en_US"
>>> [  128s] LC_NAME="en_US"
>>> [  128s] LC_ADDRESS="en_US"
>>> [  128s] LC_TELEPHONE="en_US"
>>> [  128s] LC_MEASUREMENT="en_US"
>>> [  128s] LC_IDENTIFICATION="en_US"
>>> [  128s] LC_ALL=
>>> [  128s] + echo LC_ALL=
>>> [  128s] LC_ALL=
>>> [  128s] + echo LANG=en_US
>>> [  128s] LANG=en_US
>>
>> Where those the locale settings that you used when the build
>> failed?
>>
>> I tried to reproduce the bug here with, disabling the parallel run (as
>> it masks the real error) with both:
>>
>> 	$ for i in LANG LC_ALL LC_ADDRESS LC_IDENTIFICATION LC_MEASUREMENT LC_MONETARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE LC_TIME; do echo $i=en_US; done
>> 	$ make cleandocs && make SPHINXOPTS=-j1 htmldocs
>>
>> (this one caused lots of warnings on Debian, due to the
>>   settings at /etc/locale.gen)
>>
>> and:
>>
>> 	$ for i in LANG LC_ALL LC_ADDRESS LC_IDENTIFICATION LC_MEASUREMENT LC_MONETARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE LC_TIME; do echo $i=en_US.ISO-8859-1; done
>> 	$ make cleandocs && make SPHINXOPTS=-j1 htmldocs
>>
>> Without any success.
>>
>> Could you please provide more details about the build VM and the git
>> changeset that caused the issue?
> 
> It depends on what character set your en_US locale implements.
> 
> ~> cat test.py
> print("↑ᛏ个")
> ~> locale
> LANG=en_US.utf8
> LC_CTYPE="en_US.utf8"
> LC_NUMERIC="en_US.utf8"
> LC_TIME="en_US.utf8"
> LC_COLLATE="en_US.utf8"
> LC_MONETARY="en_US.utf8"
> LC_MESSAGES="en_US.utf8"
> LC_PAPER="en_US.utf8"
> LC_NAME="en_US.utf8"
> LC_ADDRESS="en_US.utf8"
> LC_TELEPHONE="en_US.utf8"
> LC_MEASUREMENT="en_US.utf8"
> LC_IDENTIFICATION="en_US.utf8"
> LC_ALL=
> ~> python3 test.py
> ↑ᛏ个
> ~> LANG=en_US python3 test.py
> Traceback (most recent call last):
>    File "test.py", line 1, in <module>
>      print("\u2191\u16cf\u4e2a\uf8f9")
> UnicodeEncodeError: 'latin-1' codec can't encode characters in position 0-3: ordinal not in range(256)
> ~> LANG=C python3 test.py
> ↑ᛏ个
> 
> You can easily test if your python version can print UTF-8 in a specific
> locale, and if necessary define an ISO-8859-1 locale for testing.
> On some systems the situation is reversed - C locale is ASCII only, and
> en_US is UTF-8, and it is possible that some systems don't ship an 8bit
> locale at all.

Thats my problem :-) On my system (terminal) I can't reproduce the
issue since stdout always support utf-8, no matter what LANG
environment is set.

$ LANG=en_US.ISO-8859-1 python3
...
 >>> import sys
 >>> print (sys.stdout.encoding)
utf-8

 >>> import locale
 >>> locale.getdefaultlocale()
('en_US', 'UTF-8')

I'm not familar with POSIX's locale [1] in detail and in particular
on my system (gnome terminal), I can't say how I can change to 8 bit
coding to reproduce the issue.

[1] https://docs.python.org/3/library/locale.html

-- Markus --

