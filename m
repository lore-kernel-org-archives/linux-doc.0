Return-Path: <SRS0=iD3b=BR=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0506FC433E0
	for <linux-doc@archiver.kernel.org>; Fri,  7 Aug 2020 05:07:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC41F22CF7
	for <linux-doc@archiver.kernel.org>; Fri,  7 Aug 2020 05:07:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tuu4Vx/P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725265AbgHGFHE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 Aug 2020 01:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725263AbgHGFHE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Aug 2020 01:07:04 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01350C061574
        for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2020 22:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=0Or2d6EdEIs4Uy/6wA5sGTDUGv3E+wuJeChjvgC1alo=; b=tuu4Vx/Pm+Fg2iAj2U/o754wSY
        mAHfBcXbx9jCuVQ7pT69AXZjoVLYqMeaVYxK3s3pBRphtbfh8CW3t4R7g5sSVBjmu6Kc4cZZzEmNK
        eZNcnLsN0HbTRVASMZTqi7mcC31UYDh9w5t43BNma0+eTKC4KWJZ3ADHQX95Gxf4sRgZEMblttMzR
        750UnIHG/rYtnksGYE+MXBSIzwkRINwRW/1AW6ChBkQDsrN/WcahB1n5fopCoZz1ao83b0vOliv+v
        LB0/+cLjQv0TAMfbM/FbnEWZMID/C9erIAqy/t0HgpxAK3gBPQoRMjaYkRug+xY3RWqYcPXiEOoLg
        WuwbyPJg==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k3uaq-0004db-2U; Fri, 07 Aug 2020 05:07:00 +0000
Subject: Re: [PATCH] docs: Correct the release date of 5.2 stable
To:     Billy Wilson <billy_wilson@byu.edu>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
References: <20200806231754.7735-1-billy_wilson@byu.edu>
 <84f3c886-7ade-5870-22a0-6cef2735c19b@infradead.org>
 <20200807000823.GA7953@imjin>
 <d67c4c89-72c9-43d8-9e86-c5ad48df132b@infradead.org>
 <20200807035148.GB7953@imjin>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e1868299-74a0-3d8d-b1a6-001f6afb1394@infradead.org>
Date:   Thu, 6 Aug 2020 22:06:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807035148.GB7953@imjin>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 8/6/20 8:51 PM, Billy Wilson wrote:
> On Thu, Aug 06, 2020 at 05:41:55PM -0700, Randy Dunlap wrote:
>> On 8/6/20 5:08 PM, Billy Wilson wrote:
>>> On Thu, Aug 06, 2020 at 04:46:13PM -0700, Randy Dunlap wrote:
>>>> On 8/6/20 4:17 PM, Billy Wilson wrote:
>>>>> A table lists the 5.2 stable release date as September 15, but it was
>>>>> released on July 7. This may confuse a reader who is trying to
>>>>> understand the stable update release cycle.
>>>>>
>>>>> Signed-off-by: Billy Wilson <billy_wilson@byu.edu>
>>>>> ---
>>>>>  Documentation/process/2.Process.rst | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Documentation/process/2.Process.rst b/Documentation/process/2.Process.rst
>>>>> index 3588f48841eb..4ae1e0f600c1 100644
>>>>> --- a/Documentation/process/2.Process.rst
>>>>> +++ b/Documentation/process/2.Process.rst
>>>>> @@ -113,7 +113,7 @@ than one development cycle past their initial release. So, for example, the
>>>>>  5.2 kernel's history looked like this (all dates in 2019):
>>>>>  
>>>>>  	==============  ===============================
>>>>> -	September 15 	5.2 stable release
>>>>> +	July 7		5.2 stable release
>>>>>  	July 14		5.2.1
>>>>>  	July 21		5.2.2
>>>>>  	July 26		5.2.3
>>>>
>>>> Hi,
>>>> For clarification, what 5.2 kernel do you find that was released on
>>>> July 7, 2019?  IOW, what you consider the 5.2 stable release of that date?
>>>> or where did you get that date?
>>>>
>>>> thanks.
>>>>
>>>> -- 
>>>> ~Randy
>>>>
>>>
>>> I found the date of July 7 at https://kernelnewbies.org/Linux_5.2 . I
>>> just double checked that date against the git tag for v5.2 (commit
>>> 0ecfebd2b524) and it looks like it matches.
>>
>> OK, that part makes sense (to me).
>>
>>> September 15, meanwhile, is the 5.3 stable release date. I mainly
>>> noticed this because the table uses the 5.2 release dates to illustrate
>>> the stable update release cycle. I was scratching my head for a few
>>> minutes trying to figure out why 5.2 had a date of September 15 and
>>> 5.2.1 had a date of July 14, until I realized it was a mistake.
>>
>> I had 2 questions. One was why not July 8 instead of July 7,
>> but you answered that part satisfactorily (above).  (July 8 is when
>> the tarball and .sign files are dated.)
>>
>> The other question is do we call v5.2 stable?  Or should we begin
>> stable at v5.2.1?
>>
>>
>> thanks.
>> -- 
>> ~Randy
>>
> 
> That's a good question. This same page describes the cycle of -rc
> kernels as, "a normal series will get up to somewhere between -rc6 and
> -rc9 before the kernel is considered to be sufficiently stable and the
> final release is made."
> 
> In that context, I had read "stable" as in sufficiently stable, not as
> "released by the stable team."
> 
> The author also did well at introducing the stable tree shortly after
> that. "Once a stable release is made, its ongoing maintenance is passed
> off to the 'stable team.'"
> 
> Personally, I think those clarifications make it okay to call v5.2
> stable in this particular table. But there could be nuances with that
> choice that I am missing.

OK, so if a kernel release is not an -rc, then it's stable.
I guess I'm OK with that.

Thanks for your explanations.

-- 
~Randy

