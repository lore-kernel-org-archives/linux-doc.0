Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D2B3A7D918
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Oct 2019 19:57:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbfJ2T5J (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Oct 2019 15:57:09 -0400
Received: from smtp3-1.goneo.de ([85.220.129.38]:40913 "EHLO smtp3-1.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725958AbfJ2T5J (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 29 Oct 2019 15:57:09 -0400
Received: from localhost (localhost [127.0.0.1])
        by smtp3.goneo.de (Postfix) with ESMTP id CA80023FA45;
        Tue, 29 Oct 2019 20:57:05 +0100 (CET)
X-Virus-Scanned: by goneo
Received: from smtp3.goneo.de ([127.0.0.1])
        by localhost (smtp3.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id xvYQVAn4DEW3; Tue, 29 Oct 2019 20:57:04 +0100 (CET)
Received: from [192.168.1.103] (dyndsl-037-138-239-146.ewe-ip-backbone.de [37.138.239.146])
        by smtp3.goneo.de (Postfix) with ESMTPSA id 4729C23F41C;
        Tue, 29 Oct 2019 20:57:04 +0100 (CET)
Subject: Re: Sphinx parallel build errors
To:     Randy Dunlap <rdunlap@infradead.org>,
        Kees Cook <keescook@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <dc19a670-7e8e-04e5-667d-578c2dd3754e@infradead.org>
 <201910091929.0C058BB@keescook> <20191010124832.23bc4362@lwn.net>
 <c6263597-e9d0-5a1f-effd-d1706c24e666@infradead.org>
 <8305ffe2-51ba-eb4b-4d44-2defe45aa68f@infradead.org>
 <20191027121729.59c1d539@lwn.net>
 <c0be66ed-eb97-bc19-5bdb-0ef8903c3709@infradead.org>
 <20191027160507.6d7be266@coco.lan> <201910281205.DD5B74F@keescook>
 <205d5664-88b9-36d4-75f3-67b51884bbda@darmarit.de>
 <c0f0af19-0a77-8640-0152-7558aa367752@infradead.org>
From:   Markus Heiser <markus.heiser@darmarit.de>
Message-ID: <f6df7edc-74bf-74b3-1dcd-203d74d0787e@darmarit.de>
Date:   Tue, 29 Oct 2019 20:57:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c0f0af19-0a77-8640-0152-7558aa367752@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am 29.10.19 um 20:41 schrieb Randy Dunlap:
>> In the past I run sphinx builds on a small 4GB VM (2cpu) without any problems.
>> (nowadays) 16 CPU, 16 GB PC with sphinx-build the max load of my whole PC is
>> about 5GB (*more CPUs need more mem*).
>>
>> @Randy you said the build machine hase 8GB .. and how much CPUs?
> 
> 4.
> 

>>> Randy, are you able to just use -j2 or similar with your builds to avoid
>>> this?
> 
> No, sometimes even -j1 fails with oom-killer. >
>> @Randy: my first questions are:
>>
>> - cpu / mem?
>> - are OOM-kills when building target htmldocs, pdfdocs or ..?
> 
> htmldocs
> 
>> - which py & sphinx version are used? Reference installation see 'virtualenv'
>>    in [1]
> 
> Python 2.7.14
> sphinx-build 1.7.6

Seems nothing special in your environment .. its strange to me.

Installing new sphinx-doc will not help, you are fighting with some
other problems.  Hoped that I can help, but realize that I don't have
a clue what it is / sorry.

   -- Markus --
