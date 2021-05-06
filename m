Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1AEC433B4
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 17:58:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A53D61107
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 17:58:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236381AbhEFR7u (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 May 2021 13:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236376AbhEFR7u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 May 2021 13:59:50 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB28C061574
        for <linux-doc@vger.kernel.org>; Thu,  6 May 2021 10:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=wJuvvE1FARX4uNDpNlv/0OihLUqL0aDipUj+ZgiA0Hs=; b=cBF9ovzOoARFUDpeqVsAg/R+j2
        vus0YkC3FopGM1DxIGLNU7e+11HFl94zNNOhE8VcWO2fliAMOkCFBOwPW4WNBE++GaYr1xEk7YBiQ
        hYe5PeOuwdYNTORu5P/v6cLO8kv9FN1b1U00x/UKGyO0CCIVivQ1/K5JO1euGwSFmwb4t53f8Z68t
        h0LFGUF+bMPkO8KwdlgCOc6nOp/EgRzvgxocSvYEty9WbKPWgbjdQ0HLs0AsRUA+2M1aCA5ihGymc
        Op/ZCxdB/SpOuVAIr7N6EJMXYKOyMGa9X/dTOt8/F7fDiPWJPr8uTgPCIq4/MjZ/hCMqCgejgO+Wj
        lDVVCyUw==;
Received: from [2601:1c0:6280:3f0::7376]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1leiG4-002379-DF; Thu, 06 May 2021 17:58:03 +0000
Subject: Re: Sphinx parallel build error: UnicodeEncodeError: 'latin-1' codec
 can't encode characters in position 18-20: ordinal not in range(256)
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Markus Heiser <markus.heiser@darmarit.de>
Cc:     =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
References: <20210506103913.GE6564@kitsune.suse.cz>
 <30f2117f-aa38-6d60-f020-ff5cf8f004b5@darmarit.de>
 <20210506184641.6348a621@coco.lan>
 <0fd5bb54-a8fc-84b2-2bd6-31ab12f12303@darmarit.de>
 <20210506192756.2a2cc273@coco.lan>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <cecb28f8-dfaa-3584-c9f5-fe15145ef3cf@infradead.org>
Date:   Thu, 6 May 2021 10:57:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210506192756.2a2cc273@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/6/21 10:27 AM, Mauro Carvalho Chehab wrote:
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
>>>>     echo $LC_ALL
>>>>     echo $LANG
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
> just crashes. On Sphinx, this is is even worse, as it blames
> the parallel building, instead of pinpointing the real culprit.

And for error messages such as this problem, it should include
file name and line number along with the position.  Is position
in this case offset from the beginning of file or beginning of line?
What a bad error message.

[ah, I see that Michal has found where the error happens.]


I have been going thru some of the Documentation/ files...

Why do several of the files begin with
(hex) ef bb bf    followed by "=================="
for a heading, instead of just "===================".
See e.g. Documentation/timers/no_hz.rst.

thanks.
-- 
~Randy [resending due to smtp error]

