Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0775AC4727C
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 17:26:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B866E20754
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 17:26:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DmptSC73"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725372AbgI3R0M (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 13:26:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI3R0M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Sep 2020 13:26:12 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C741EC061755
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2020 10:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=X12mdcul3az9gBTKZJYsXCRPXm7LQsImQmQrSBYSVBE=; b=DmptSC73I+fc7cKNup2nUHCo0Y
        vzWEDj6PL67x0Ok5lV33fChcaDKubfmG96gOnzToWmdSeTKgei5x2iDfk7w2sQL2YDGdAi9prJF21
        fWrish7H41lH4tadUrhOx5gQKOBh4qgD67ULnpLA7W+jI0v26pZgYpHTTMP4v0RHO4ho2mDLvCrtq
        JX1enPGgDFEedPasqggCjLM2nskWI4k0Igyh2kdFDTNP6/sp81sAgRrz5NEfAFCCR4ebBNkGckpT/
        J88St6Z2E4e7Yt75b0for5aaZVsE81PyWphX+5GMynWrQxaSUevQpnAy/61xSTu3PqcoqLX8LkOJ/
        ey5Yq9XQ==;
Received: from [2601:1c0:6280:3f0::f767]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kNfrl-00061w-A6; Wed, 30 Sep 2020 17:26:09 +0000
Subject: Re: [RFC][PATCH] docs: process: Submitting a patch for a single git
 commit.
To:     Jonathan Corbet <corbet@lwn.net>,
        Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc:     linux-doc@vger.kernel.org
References: <20191011163358.17667-1-ingo.rohloff@lauterbach.com>
 <20191011112357.7c3863cd@lwn.net>
 <20200930180238.1c25692e@ingpc3.intern.lauterbach.com>
 <20200930104722.54c06f6f@lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a1efe7e8-612a-eaee-eb1e-08ab0541b4f3@infradead.org>
Date:   Wed, 30 Sep 2020 10:26:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200930104722.54c06f6f@lwn.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/30/20 9:47 AM, Jonathan Corbet wrote:
> On Wed, 30 Sep 2020 18:02:38 +0200
> Ingo Rohloff <ingo.rohloff@lauterbach.com> wrote:
> 
>> it's been quite a long time, but I really want to try again,
>> because the last 5 times I tried to send in a patch,
>> the information I wrote down here is EXACTLY what I needed (5 times...)
>>
>> I cleaned up the patch a little bit (only very minor modifications),
>> but before I send this again, let me try to comment on the original
>> critique.
> 
> I'm sorry, but this is far from useful...you're referencing a year-old
> discussion that has long since been pushed out of my brain.
> 
> If you have a patch, please send it.  If, however, you choose to ignore
> the feedback you got last time, you're likely to run into the same issues
> this time around.

And there have been a few changes to submitting-patches.rst in that year,
so please take them into account also.

thanks.
-- 
~Randy

