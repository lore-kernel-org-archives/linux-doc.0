Return-Path: <SRS0=DKq9=3L=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 720CCC32771
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jan 2020 23:59:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3314B205C9
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jan 2020 23:59:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uuIc7/ci"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgAVX7b (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Jan 2020 18:59:31 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:51540 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgAVX7a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Jan 2020 18:59:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Afyczq2i8F00PWBnspaES1ymWf8fVUfhkQSjut+a8X8=; b=uuIc7/ciyFjSPrTaSROTHAWst
        wZN92a49guDQdAhLCx0syON7Q9GiVWrFrk8aHQdFPMtbpomtzsDt2xvoBgl0WUnB+HaAE/4eWjHy8
        qjFL4wg8MJyIRSFgyerndbpqVfa86SbmENrAz3yLBnE4/YBg6UplZEaIv0TfpiKDg+H0qWOem03OB
        ofjhQRQNWrT956J0d1pAiFIEnGwYBBKR8EC4fhB0zG1kIE9sycEdTlMXIItHYdHuhgGvDQJg5LwRn
        RIYzWIqJ4/l7F1NiE9KoRWJjKtJ77c8tRgdPoHiSyZ9icL/odndBTiH1n+5QL00B/r3fWfozK+RaS
        fNkt+39/g==;
Received: from [2603:3004:32:9a00::c7a3]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iuPuE-0001jk-Gh; Wed, 22 Jan 2020 23:59:30 +0000
Subject: Re: [PATCH] Add a document on how to contribute to the documentation
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20200122162030.5b789232@lwn.net>
 <20200122235302.GD4675@bombadil.infradead.org>
 <c24d4e3f-703f-b047-7ac0-4b92503a915f@infradead.org>
 <20200122235828.GE4675@bombadil.infradead.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6834a79b-2340-a036-9c86-c51e96783d45@infradead.org>
Date:   Wed, 22 Jan 2020 15:59:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200122235828.GE4675@bombadil.infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 1/22/20 3:58 PM, Matthew Wilcox wrote:
> On Wed, Jan 22, 2020 at 03:54:18PM -0800, Randy Dunlap wrote:
>> On 1/22/20 3:53 PM, Matthew Wilcox wrote:
>>> On Wed, Jan 22, 2020 at 04:20:30PM -0700, Jonathan Corbet wrote:
>>>> This is mostly a collection of thoughts for how people who want to help out
>>>> can make the docs better.  Hopefully the world will respond with a flurry
>>>> of useful patches.
>>>
>>> Thanks for writing this with your characteristic blend of self-deprecating
>>> humour and supportive advice.  One thing which I feel should be mentioned
>>> is the hard work put in by hundreds of kernel maintainers who have
>>> written kernel-doc and nobody has done the trivial work to actually
>>> include those source files in an rst file, so all that documentation
>>> is being ignored.  A great task that's a step up from "fixing typos" is
>>> "find documentation that's not currently in a kernel book and add it".
>>> Even if it's just dumped into a "misc" section, having (eg) kvmalloc()
>>> documentation in a kernel book is a benefit.
>>>
>>>> +Please note that some things are *not* typos and should not be "fixed":
>>>> +
>>>> + - Both American and British English spellings are allowed within the
>>>> +   kernel documentation.  There is no need to fix one by replacing it with
>>>> +   the other.
>>>> +
>>>> + - The question of whether a period should be followed by one or two spaces
>>>> +   is not to be debated in the context of kernel documentation.
>>>
>>> Do you want to preemptively mention the Oxford comma here?
>>>
>>
>> to allow it, like one or two spaces after a '.'?
> 
> To not nit-pick over it; use it or not at your preference.
> 

Thanks for the clarification.  OK with me.


-- 
~Randy
