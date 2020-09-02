Return-Path: <SRS0=NxQi=CL=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ABA5C433E2
	for <linux-doc@archiver.kernel.org>; Wed,  2 Sep 2020 16:12:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D333020773
	for <linux-doc@archiver.kernel.org>; Wed,  2 Sep 2020 16:12:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ftzF0b87"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgIBQMQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Sep 2020 12:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728463AbgIBQLo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Sep 2020 12:11:44 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 857C7C061245
        for <linux-doc@vger.kernel.org>; Wed,  2 Sep 2020 09:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=s9dnC/Ae0JRQ2cNS49MXb/d+jgM0c7BZUzlfCIVAXGI=; b=ftzF0b87ZoZmWRtbBgNxZvcz3g
        frJNIfLvJdJ1+CFWBDP2JBKZRuSpe3k1ZFE5XgX57nKM0mt7i0nqonWbCL/5FVFQjP9qqoHgPHRuW
        GcPkaoGKYikcyzWctVSIs1bEk2TvW2rYwKsHoYUrY2p/4YHhs8fw71bkDQ1yvmkInyghMJhlXLide
        vN5wnVwSyOCP6kVOhUfoQGiDUOYxgw40bpHByS5NfrMfkPa81q7LNPpnvQOYqA4awD9PshnAlURbR
        /VE07wVypHACceF0XjnmsSIm0uLVv3S10JazNpGg/tfh6mk0Xvr/SCK4LDiqH5VO7GrievKQSf8Ks
        qYbcIacg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kDVMM-0005iy-Rj; Wed, 02 Sep 2020 16:11:43 +0000
Subject: Re: [PATCH 4/4] submitting-patches.rst: presume git will be used
To:     Drew DeVault <sir@cmpwn.com>, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
References: <20200902155759.55895-1-sir@cmpwn.com>
 <20200902155759.55895-5-sir@cmpwn.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <bb292b17-6fed-c20f-6efc-ee45657abd40@infradead.org>
Date:   Wed, 2 Sep 2020 09:11:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200902155759.55895-5-sir@cmpwn.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/2/20 8:57 AM, Drew DeVault wrote:
> Git is fairly ubiquitous these days, and the additional information in
> this documentation for preparing patches without it is not especially
> relevant anymore and may serve to confuse new contributors.
> 
> Signed-off-by: Drew DeVault <sir@cmpwn.com>
> ---
> Conflict of interest: I wrote and maintain the website,
> git-send-email.io, which is recommended in the revised document.

Understood. And how long do you expect to actively maintain those 2 websites?

At least ask archive.org to make backup/copies of them periodically...

>  Documentation/process/submitting-patches.rst | 91 +++++---------------
>  1 file changed, 22 insertions(+), 69 deletions(-)


thanks.
-- 
~Randy

