Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E832AC433ED
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 17:53:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE97F61166
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 17:53:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236304AbhEFRyZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 May 2021 13:54:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236302AbhEFRyZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 May 2021 13:54:25 -0400
Received: from smtp3.goneo.de (smtp3.goneo.de [IPv6:2001:1640:5::8:37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC5CEC061574
        for <linux-doc@vger.kernel.org>; Thu,  6 May 2021 10:53:26 -0700 (PDT)
Received: from [192.168.1.127] (dyndsl-091-096-024-137.ewe-ip-backbone.de [91.96.24.137])
        by smtp3.goneo.de (Postfix) with ESMTPSA id 40DDE203F763;
        Thu,  6 May 2021 19:53:25 +0200 (CEST)
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1' codec
 can't encode characters in position 18-20: ordinal not in range(256)
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
References: <20210506103913.GE6564@kitsune.suse.cz>
 <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
 <20210506184641.6348a621@coco.lan>
 <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
 <20210506192756.2a2cc273@coco.lan>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <b6059fb8-dd68-5564-a29f-8d8e828b2946@darmarit.de>
Date:   Thu, 6 May 2021 19:53:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210506192756.2a2cc273@coco.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am 06.05.21 um 19:27 schrieb Mauro Carvalho Chehab:
> Em Thu, 6 May 2021 19:04:44 +0200
> Markus Heiser <markus.heiser@darmarit.de> escreveu:
> 
>> Am 06.05.21 um 18:46 schrieb Mauro Carvalho Chehab:
>>> Em Thu, 6 May 2021 17:57:15 +0200
>>> Markus Heiser <markus.heiser@darmarit.de> escreveu:
>>>    
>>>> Am 06.05.21 um 12:39 schrieb Michal Suchánek:
>>>>> When building HTML documentation I get this output:
>>>> ...
>>>>> [  412s] UnicodeEncodeError: 'latin-1' codec can't encode characters in position 18-20: ordinal not in range(256)
>>>> ...
>>>>>
>>>>> It does not say which input file contains the offending character so I can't tell which file is broken.
>>>>>
>>>>> Any idea how to debug?
>>>>
>>>> I guess the build host is a very simple container, what does
>>>>
>>>>      echo $LC_ALL
>>>>      echo $LANG
>>>>
>>>> prompt?  If it is latin, change it to something using utf-8 (I recommend
>>>> 'en_US.utf8').
>>>>
>>>> A UnicodeEncodeError can occour everywhere where characters are
>>>> encoded from (internal) unicode to the encoding of the stream.
>>>>
>>>> By example:
>>>>
>>>> A print or log statement which streams to stdout needs to encode
>>>> from unicode to stdout's encoding.  If there is one unicode symbol
>>>> which can not encoded to stream's encoding a UnicodeEncodeError
>>>> is raised.
>>>
>>> Hi Markus,
>>>
>>> It shouldn't matter the builder's locale when building the Kernel
>>> documentation (or any other documents built from other git trees
>>> on other open source projects), as the Kernel's *.rpm document charset
>>> won't change, no matter on what part of the globe it was built.
>>>
>>> I vaguely remember about a change we made a couple of years ago
>>> in order to address this issue.
>>
>> Hi Mauro :)
>>
>> sure? .. what if the logger wants to log some symbols from the
>> chines translated parts to stdout and the encoding of stdout is
>> latin?
>>
>> In python the logger will raise a UnicodeEncodeError, this is
>> what I know .. but I'm often wrong ;)
> 
> Yeah, Python (and almost all python apps) has a mad behavior when
> it finds an unexpected character: instead of ignoring it, it

Hi Mauro,

it is not comfortable but is it mad? ..

Most often languages (or applications) do not handle encoding
of strings they just piping a binary stream while python
decode / encodes strings.

"The Zen of Python" [1] says

    Explicit is better than implicit.

If a stream can't encode symbols and these symbols should be ignored
you have to set the encoding of the stream explicit to ignore
such symbols.

I guess this encode discussions will haunt me for the rest of my
life.  My escape strategy is to use UTF-8 wherever possible.

[1] https://www.python.org/dev/peps/pep-0020/

   -- Markus --
