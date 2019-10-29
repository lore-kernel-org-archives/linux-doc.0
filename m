Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3A8847D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Oct 2019 08:16:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728759AbfJ2IQM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Oct 2019 04:16:12 -0400
Received: from smtp2.goneo.de ([85.220.129.33]:42672 "EHLO smtp2.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727331AbfJ2IQM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 29 Oct 2019 04:16:12 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp2.goneo.de (Postfix) with ESMTP id 276B723F610;
        Tue, 29 Oct 2019 09:16:09 +0100 (CET)
X-Virus-Scanned: by goneo
Received: from smtp2.goneo.de ([127.0.0.1])
        by localhost (smtp2.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id VxsONVvU9e2J; Tue, 29 Oct 2019 09:16:07 +0100 (CET)
Received: from [192.168.1.103] (dyndsl-037-138-239-146.ewe-ip-backbone.de [37.138.239.146])
        by smtp2.goneo.de (Postfix) with ESMTPSA id 1697023F56F;
        Tue, 29 Oct 2019 09:16:07 +0100 (CET)
Subject: Re: Sphinx parallel build errors
To:     Kees Cook <keescook@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <dc19a670-7e8e-04e5-667d-578c2dd3754e@infradead.org>
 <201910091929.0C058BB@keescook> <20191010124832.23bc4362@lwn.net>
 <c6263597-e9d0-5a1f-effd-d1706c24e666@infradead.org>
 <8305ffe2-51ba-eb4b-4d44-2defe45aa68f@infradead.org>
 <20191027121729.59c1d539@lwn.net>
 <c0be66ed-eb97-bc19-5bdb-0ef8903c3709@infradead.org>
 <20191027160507.6d7be266@coco.lan> <201910281205.DD5B74F@keescook>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <205d5664-88b9-36d4-75f3-67b51884bbda@darmarit.de>
Date:   Tue, 29 Oct 2019 09:16:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <201910281205.DD5B74F@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am 28.10.19 um 20:07 schrieb Kees Cook:
> On Sun, Oct 27, 2019 at 04:05:07PM -0300, Mauro Carvalho Chehab wrote:
>> Em Sun, 27 Oct 2019 11:30:22 -0700
>> Randy Dunlap <rdunlap@infradead.org> escreveu:
>>
>>> On 10/27/19 11:17 AM, Jonathan Corbet wrote:
>>>> On Sun, 27 Oct 2019 11:11:57 -0700
>>>> Randy Dunlap <rdunlap@infradead.org> wrote:
>>>>    
>>>>>> Yes, I see oom-kills when building docs for 5.4-rc2.
>>>>>> But only after I ran 'gimp *.jpg' for 22 photos.
>>>>>>
>>>>>> I can see anywhere from 1 to 4 sphinx-build processes running.
>>>>>
>>>>> I continue to have oom-kills when building docs.
>>
>> My 2 cents here.
>>
>> I would keep the default to use more CPUs, as nowadays I suspect that
>> most devs have a way more than 8GB installed. The worse machine I use
>> here to build Kernel is a Gen-3 i5 that has has 16GB (and it is a
>> personal laptop I bought 5 years ago).
>>
>> Yet, I agree that doc build should be saner on low-cap machines.
>>

In the past I run sphinx builds on a small 4GB VM (2cpu) without any problems.
(nowadays) 16 CPU, 16 GB PC with sphinx-build the max load of my whole PC is
about 5GB (*more CPUs need more mem*).

@Randy you said the build machine hase 8GB .. and how much CPUs?

>> Ideally, the fix should be, IMHO, at sphinx-build: -jauto should
>> detect OOM possible conditions and reduce the number of used CPUs
>> it the max available memory is too low.
> 
> How can we determine that dynamically, though? e.g. how do we determine
> how much is needed per thread in a way that will move with the future
> needs of Sphinx, etc?

d'accord

>> As there's now a script at Kernel, maybe the script could be modified
>> to detect if the max available memory is too low, passing -j1 if,
>> let's say, the machine has less than (let's say) 16 GB RAM.
> 
> Randy, are you able to just use -j2 or similar with your builds to avoid
> this?
> 

Sphinx-doc is pure Python, it runs a lot of regexpr and is moving string,
nothing special .. maybe we have a mem leak in one of our extensions?

@Kess: why did you mentioning MAINTAINERS parsing .. did you observe anything
strange?

Maybe one of the tools used by sphinx is buggy (latex, dot, image-magic) .. 
needs investigation.

@Randy: my first questions are:

- cpu / mem?
- are OOM-kills when building target htmldocs, pdfdocs or ..?
- which py & sphinx version are used? Reference installation see 'virtualenv'
   in [1]

-- Markus --


[1] https://www.kernel.org/doc/html/latest/doc-guide/sphinx.html#sphinx-install







