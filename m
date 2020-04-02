Return-Path: <SRS0=YY78=5S=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCF5C43331
	for <linux-doc@archiver.kernel.org>; Thu,  2 Apr 2020 16:10:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFF8720719
	for <linux-doc@archiver.kernel.org>; Thu,  2 Apr 2020 16:10:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nss70K3q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389120AbgDBQKK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Apr 2020 12:10:10 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:45018 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389041AbgDBQKK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Apr 2020 12:10:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=JFd8RwJo3T4ykX9cVTv66G4uHxZUZwkrk0BNY9djN/g=; b=nss70K3q25r1u5iqwUnYcgHRTK
        0QbNzMoX17lHtud6smdDPp0ErOzI9EwsuqlZ0fSxjT6RAITfROzXyed+bFhhz92AM8INfglS4W3My
        5TjRPo0jzZQlQgVembVoCjOxXoEM1SCwCvc6K+e7l9NNyGRkVksi9j86aTPxMXIt9ZbWC6uEPD6+M
        qlL/ii07a+oKiU5U0vnwX2v6tnWX5Mrn35m7iiMISGfYfwQlLiZ/Ld6k+/GjS6uzM2yvZgsFrFlm2
        act2eUppIawg9t490HYDvLLsT6wpl9aLLRf5asfdQkmDD/IuqgvkxzshoBjvERqcw2K62a869NxFc
        SnypSUOA==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jK2Pw-00060C-K7; Thu, 02 Apr 2020 16:10:08 +0000
Subject: Re: [PATCH] docs: pr_*() kerneldocs and basic printk docs
To:     =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org, pmladek@suse.com,
        kernel@collabora.com
References: <20200401083121.20961-1-ricardo.canuelo@collabora.com>
 <6e398e11-0c5b-7308-1bda-8d7178c0a42b@infradead.org>
 <20200402082632.dii3jytk3rhqtoln@rcn-XPS-13-9360>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <df1f1c6b-b438-feab-4984-7a8cd8106f5a@infradead.org>
Date:   Thu, 2 Apr 2020 09:10:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200402082632.dii3jytk3rhqtoln@rcn-XPS-13-9360>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/2/20 1:26 AM, Ricardo Cañuelo wrote:
> 
>>> +  #define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
>>
>> "fmt" should be last, not first, in order for modname and func to be
>> prefixes.
> 
> The way it's used in the pr_*() macros, this is the correct way to get the
> prefixes right.
> 
> Example:
> 
> 	pr_emerg("message no. %d", num)
> 
> expands to
> 
> 	printk(KERN_EMERG pr_fmt("message no. %d", num)
> 
> which expands to
> 
> 	printk(KERN_EMERG "%s:%s: " "message no. %d", KBUILD_MODNAME,
> 			__func__, num)

I see.  Thanks for explaining.

-- 
~Randy

