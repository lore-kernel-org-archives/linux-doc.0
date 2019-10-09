Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 259E67D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 Oct 2019 22:18:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732132AbfJIWS4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 Oct 2019 18:18:56 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:34514 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731589AbfJIWS4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Oct 2019 18:18:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=jy63heQoOUILqzbjLCggb95N0BVUszm8tQSH+ht63c0=; b=GY3ALZp6xABrMaF/c7f8j3kHl
        c4gueY5PqO2aPo1yUrTA88MIzXty5uITX+tjA1jo9JDoj9ZdM/D9P4MGTqaa7oGfROYv//kMB/nL+
        YyAeipfzAMG7HW96UDwvNMMc/P2Z1J2nMf8jiM1hKroFyr41ltWwnwaV3RKaeQ8oMU+NskcAPZ6WZ
        EW5DrBSLTzCz/HUfOq/rpyUBvYQvRhVii5sQ/gWtvMxSlROYrn8o3PpgSd9Dp23QadeQIW4Tah1v/
        sHn0dtJoNuwOuy8BvzjEwpvjcHCSJWkU8Zm4jzp/SiLmtjBEA/UWPJI4NB9siGUqTbnVgn+A/o0/Z
        5kkkLcnBw==;
Received: from [2601:1c0:6280:3f0::9ef4]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iIKIJ-0000FY-Qz; Wed, 09 Oct 2019 22:18:55 +0000
Subject: Re: Sphinx parallel build errors
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <dc19a670-7e8e-04e5-667d-578c2dd3754e@infradead.org>
 <20191009154050.502061fa@lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6dc30265-4952-76e0-7b74-035542334d5d@infradead.org>
Date:   Wed, 9 Oct 2019 15:18:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191009154050.502061fa@lwn.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/9/19 2:40 PM, Jonathan Corbet wrote:
> On Wed, 9 Oct 2019 14:37:51 -0700
> Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> Sphinx parallel build error:
>> OSError: [Errno 12] Cannot allocate memory
>>
>> I have had this error 4 times in the last 3 days.
>>
>> The first time it oom-killed Thunderbird.  No big deal.
>> The second time it oom-killed gimp, which had 24 photos open.
>> Still no big deal.  Just a nuisance.
>>
>> My little laptop has only 8 GB of RAM.
>>
>> Is there a way that I can limit the amount of parallelism?
> 
> Is this a change with current docs-next, or have you seen this for a
> while?  The parallelism logic changed a bit in docs-next, but the default
> behavior should be the same as it was before.

I'm not sure.  Today's 3 instances were all in linux-next but I don't know
about the oom failure a few days ago.

> "make -j 1 htmldocs" (in current docs-next) should give you a nice, slow,
> serial build.

I don't want to limit is _that much_.  :(

-- 
~Randy
