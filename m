Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD26AC4338F
	for <linux-doc@archiver.kernel.org>; Sun, 25 Jul 2021 20:53:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 952F560E77
	for <linux-doc@archiver.kernel.org>; Sun, 25 Jul 2021 20:53:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbhGYUNF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 25 Jul 2021 16:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231293AbhGYUNE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Jul 2021 16:13:04 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05620C061765
        for <linux-doc@vger.kernel.org>; Sun, 25 Jul 2021 13:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=iFuSi0YLEuOPG33zdR9k83Z13YmSEkJl3iCobUICgyo=; b=PoU6oheAhPtQQJFQYDtcnPmRur
        fLkRboEs81kds+W1G0KO41dmTtKLxP3bpgxFDmUq8XqOYKk4Qk9uifzJeagxX/CzRWSB9wcO8+XC2
        F+yEdv6nW7X2HtOsszJS/ivBCV1sJq+Gr9wlvThxDf+ngykYmVOXn3zIUE2VFPCNkLtpb22rd0u7Y
        dQEC1RTFNxzBkUbvEXqDPsyonfqvozr0Yzz8/t164bffUTEKqdvMHPf6sxp26PYYNdpXJFQ/1W2fW
        eHZKFFKLwoPbKj6KAlzQTpeVBCcUpC57Yhtjw1u3Ln9Jizo32Nl9FCm76DmuNRQ5yEqFYb8URLAnB
        oCvxa50Q==;
Received: from [2601:1c0:6280:3f0::aefb]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m7l7r-0097a7-V4; Sun, 25 Jul 2021 20:53:32 +0000
Subject: Re: make cleandocs issue: rm -rf /output when obj not defined
To:     Jonathan Corbet <corbet@lwn.net>,
        pioneer695 <pioneer695@protonmail.com>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <hMV_L3bAsgmBToxsfiYBJDxTBoLHll-1BOk7FvqialjmZFNDp14Bq69ddTVagVH49yViCM43-yFpZ39Kfr6geVK7ota0QhCDA4MaC_5vILY=@protonmail.com>
 <875ywyw3ui.fsf@meer.lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5e93f77f-79a5-7dc9-287e-a48865afd133@infradead.org>
Date:   Sun, 25 Jul 2021 13:53:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <875ywyw3ui.fsf@meer.lwn.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/25/21 1:11 PM, Jonathan Corbet wrote:
> pioneer695 <pioneer695@protonmail.com> writes:
> 
>> In an attempt to get some readable documentation I cloned the git repository
>> to check how the PDF format is.
>>
>> Entered Documentation and proceeded with:
>>
>> 	make pdfdocs

Hi,
I'm curious about this part above. Are you saying that you did:

cd Documentation
make pdfdocs

I've never tried that and don't expect it to be done that way.

I do (from the top of the kernel source tree):

make pdfdocs
or
make htmldocs

with no problems, other than I may not have all of the latex
tools installed.

>> which failed, so to start fresh, my thought was that:
>>
>> 	make cleandocs
>>
>> would be the next step before anything else. But, this resulted in:
>>
>> 	rm -rf /output
> 
> That's not good...
> 
>> as $(obj) for some reason was empty.
> 
> *This* would appear to be the real problem.  If you could do some
> digging to figure out why that happened, I suspect that would be
> useful. 
> 
>> Makefile for Documentation has:
>>
>> 	BUILDDIR      = $(obj)/output
>>
>> 	cleandocs:
>> 		$(Q)rm -rf $(BUILDDIR)
>>
>>
>> This should (at least?!) be:
>>
>> 	BUILDDIR      = ./$(obj)/output
>> or:
>> 	$(Q)rm -rf ./$(BUILDDIR)
> 
> These would break builds for a lot of people and are not the right
> solution.


-- 
~Randy

