Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5A3A37D90D
	for <lwn-linux-doc@archive.lwn.net>; Sun, 27 Oct 2019 19:36:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbfJ0TgS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 27 Oct 2019 15:36:18 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:49896 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbfJ0TgS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 27 Oct 2019 15:36:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=kRU3oNhxURDyejBgiRAhNz/M4wWHnnqxSco1rtZgGJM=; b=Gpv89L0VV+Rjh1gQupxhw2d5D
        nEigV4TCAo2FiOAB9fFaLdB9v+FoIHr7iFRgLt+F7ZsGFnmC0HiZHCj/oM5+BwUQV/tzaI1NWK1X2
        2a15Ejn351G+IA9b2UokUBdbVn8/5Is5WktqzuYobFNILO8H97M3U6STI1Aj+wcLZ6xxbiSNzMHDS
        L3sZjyE7JymCRPrAa8si1MS1XKtwL8j07DxP669PNQoNzWUIXdRTYpKzUkZ4Qi/5S5E9vKCPT1pHj
        W70KENR2BDxkXyEn5pN95AWZIyA54sPdu+YU71xKWmEARlUvyGej7pyoicnWkRK7548CfZGdcGb2L
        H2A+vRBKQ==;
Received: from [2601:1c0:6280:3f0::9ef4]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iOoKn-0000nw-GV; Sun, 27 Oct 2019 19:36:17 +0000
Subject: Re: Sphinx parallel build errors
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <dc19a670-7e8e-04e5-667d-578c2dd3754e@infradead.org>
 <201910091929.0C058BB@keescook> <20191010124832.23bc4362@lwn.net>
 <c6263597-e9d0-5a1f-effd-d1706c24e666@infradead.org>
 <8305ffe2-51ba-eb4b-4d44-2defe45aa68f@infradead.org>
 <20191027121729.59c1d539@lwn.net>
 <c0be66ed-eb97-bc19-5bdb-0ef8903c3709@infradead.org>
 <20191027160507.6d7be266@coco.lan>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7dc861ad-3372-6cce-be36-0f0549f9662f@infradead.org>
Date:   Sun, 27 Oct 2019 12:36:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191027160507.6d7be266@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/27/19 12:05 PM, Mauro Carvalho Chehab wrote:
> Em Sun, 27 Oct 2019 11:30:22 -0700
> Randy Dunlap <rdunlap@infradead.org> escreveu:
> 
>> On 10/27/19 11:17 AM, Jonathan Corbet wrote:
>>> On Sun, 27 Oct 2019 11:11:57 -0700
>>> Randy Dunlap <rdunlap@infradead.org> wrote:
>>>   
>>>>> Yes, I see oom-kills when building docs for 5.4-rc2.
>>>>> But only after I ran 'gimp *.jpg' for 22 photos.
>>>>>
>>>>> I can see anywhere from 1 to 4 sphinx-build processes running.    
>>>>
>>>> I continue to have oom-kills when building docs.
> 
> My 2 cents here.
> 
> I would keep the default to use more CPUs, as nowadays I suspect that
> most devs have a way more than 8GB installed. The worse machine I use
> here to build Kernel is a Gen-3 i5 that has has 16GB (and it is a 
> personal laptop I bought 5 years ago).
> 
> Yet, I agree that doc build should be saner on low-cap machines.
> 
> Ideally, the fix should be, IMHO, at sphinx-build: -jauto should
> detect OOM possible conditions and reduce the number of used CPUs
> it the max available memory is too low.
> 
> As there's now a script at Kernel, maybe the script could be modified 
> to detect if the max available memory is too low, passing -j1 if,
> let's say, the machine has less than (let's say) 16 GB RAM.
> 
>>>> At least 2 times I also had system freezes where I had to power
>>>> cycle to reboot.
> 
> That sounds weird. I can't imagine why you would experience system
> freeze with doc build. Are you sure this is not your CPU overheating?
> 

No, I'm not sure.  I'm just sure that it only happens when I am
building kernel docs.

>>>> I suppose I can only hope that other people start running into this
>>>> issue.  :(  
>>>
>>> Are you still running gimp at the same time?  
>>
>> no.
>>
>>> Also, are you doing a straight "make htmldocs" or something else?  
>>
>> straight "make htmldocs".
> 
> 
> Thanks,
> Mauro


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
