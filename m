Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C7FC433DB
	for <linux-doc@archiver.kernel.org>; Sat, 20 Feb 2021 23:08:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C68CC64E92
	for <linux-doc@archiver.kernel.org>; Sat, 20 Feb 2021 23:08:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbhBTXIB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 20 Feb 2021 18:08:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbhBTXH7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 20 Feb 2021 18:07:59 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74309C061574
        for <linux-doc@vger.kernel.org>; Sat, 20 Feb 2021 15:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=nCH0pczjvUYoZUHd7KpeExfBKqLn1lu0C8/KHD4EMKI=; b=tskyMFHa2HuZAIqLh4ofO9EF5p
        L811H7qai4LR2yHnt1brX+eMXA/9t+5hnS93CXkZpyGJdqazUB0u5sKhqDda6ChVwDK67J+boGdR6
        1EG5gN9MMBXrp/UNiWOxonzl0Y7nxInKXaMI8z7rI0HHZy+FtocibhCt0eGZcHLokAeLcNIjAT4OX
        gwUaHZJHgAAfgpGKYKFDUbpE2aVJIPo5oeV2HTGqpi6jfWQ63wxjvbgcd7i52V/SnxMnS6x4MqH2F
        mbF/pEPdsswc/1A62oKekat+iSya4iEF1QFPLGzcXBL7snHDxMOetOnjblEkhg1ca7ZmuKKiCIQXk
        u0jxHv5Q==;
Received: from [2601:1c0:6280:3f0::d05b]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1lDbLH-0003dM-5P; Sat, 20 Feb 2021 23:07:15 +0000
Subject: Re: About the .txt docs files
To:     Igor <igormtorrente@gmail.com>, linux-doc@vger.kernel.org
References: <YDGRUCzcVskYYrVv@debian-vm>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7929a6a1-65b0-a057-b351-23326981ad5d@infradead.org>
Date:   Sat, 20 Feb 2021 15:07:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDGRUCzcVskYYrVv@debian-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

Yes, it's good to ask.

On 2/20/21 2:46 PM, Igor wrote:
> Hi everyone,
> 
> I was converting the memory-barrier.txt to .rst so it can be properly
> displayed alongside the rest of the documentation that is already
> converted to .rst.
> 
> After I started, I realize that is better to ask if is desirable for
> these files to be converted in the first place.
> 
> So, that is my question, from the files in the following list there
> any that would be desirable for the conversion?
> 
> memory-barriers.txt
> atomic_t.txt
> atomic_bitops.txt

For the atomic files, my understanding is that the owners don't
want to have them converted to .rst files.
That could easily be true of memory-barriers.txt as well.


> admin-guide/spkguide.txt
> filesystems/dax.txt
> filesystems/path-lookup.txt


thanks.
-- 
~Randy

