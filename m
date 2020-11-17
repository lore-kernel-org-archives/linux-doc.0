Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA16C2D0E4
	for <linux-doc@archiver.kernel.org>; Tue, 17 Nov 2020 14:50:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3F2C22240
	for <linux-doc@archiver.kernel.org>; Tue, 17 Nov 2020 14:50:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fG8a2uQL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728945AbgKQOuU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Nov 2020 09:50:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728533AbgKQOuT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Nov 2020 09:50:19 -0500
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66795C0617A6
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2020 06:50:18 -0800 (PST)
Received: by mail-il1-x141.google.com with SMTP id y18so11524243ilp.13
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2020 06:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0F9QrEMmipyRzRUrpK0Sko+2gt7s5nXq2Op6QHWtaWY=;
        b=fG8a2uQLrFTPi4znGWSt+P/xgw0UKNCRO0UgviV5HOFquLtz1rjhw5V8zvXFlHMJrK
         ziyyKSm7G2wirbwzmnStcscR4+w0dvLI8v/TuSmOo6hl1OsuWrwneotUFBSRth4FUgpq
         QCTvZCkPbkEPhWqGy0m3MvptcDAjhJ7G5UhY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0F9QrEMmipyRzRUrpK0Sko+2gt7s5nXq2Op6QHWtaWY=;
        b=Y0dcWc/v+/DIRINizEAbQ6SgX7lgaTqB5CCOb5tDHGO8Ic5WErjct0v8foPiBxpYRV
         zA0SkA3ulAeMka/m1taGvjSjbhrETHsnTz9LVTOXXwOO7lTFp+HxyelOpiBVGrPuSjat
         jc9hiqxmHDuYgTVRerHnzfG0995rid4P83nvx5yiQCx8S7w2uZRWKIGvjQpjjOjckkYx
         cgazHd7C/hpxHo45ASH0/03mvVOlg5zPBej+71JRxS00kdWSRucXgCHX/Bh3OCvT7JJ9
         ynSGmbDBOcZ9yce+rDUnoqKmUNwWsM14YS2x755C2gjVsXoboNkVeI16t2aLnwyyvktq
         62Sg==
X-Gm-Message-State: AOAM530ykz1O4rh14L52TbQEEY9Z6h9oPmNkXR4iI1qbyMFk6h91LY9y
        Laetz7AcbTT89uMg/oMfc4uKUw==
X-Google-Smtp-Source: ABdhPJyrANrNGg/dWB9vjRuI4mge19PoX0QvpjAv4oSotcRHIzQB3qpxA6K+J7PWRiUj+YwjUSif5g==
X-Received: by 2002:a92:c042:: with SMTP id o2mr13022311ilf.103.1605624617604;
        Tue, 17 Nov 2020 06:50:17 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id c89sm13961342ilf.26.2020.11.17.06.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2020 06:50:16 -0800 (PST)
Subject: Re: [PATCH v2 01/13] seqnum_ops: Introduce Sequence Number Ops
To:     Peter Zijlstra <peterz@infradead.org>,
        Matthew Wilcox <willy@infradead.org>
Cc:     corbet@lwn.net, keescook@chromium.org, gregkh@linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1605287778.git.skhan@linuxfoundation.org>
 <26cbcc431be5e3ab7d8e0e881d522605a27b1312.1605287778.git.skhan@linuxfoundation.org>
 <20201113210327.GJ17076@casper.infradead.org>
 <20201116144914.GE3121378@hirez.programming.kicks-ass.net>
 <20201116145850.GC3121429@hirez.programming.kicks-ass.net>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <050d5555-f8b4-f54d-e13c-149815b1b64c@linuxfoundation.org>
Date:   Tue, 17 Nov 2020 07:50:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201116145850.GC3121429@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/16/20 7:58 AM, Peter Zijlstra wrote:
> On Mon, Nov 16, 2020 at 03:49:14PM +0100, Peter Zijlstra wrote:
>> On Fri, Nov 13, 2020 at 09:03:27PM +0000, Matthew Wilcox wrote:
>>> I think almost all of this information should go into atomic_ops.rst
>>
>> No, we should delete atomic_ops.rst. It's bitrotted nonsense. The only
> 
> Sod it, I'll just queue a deletion. That'll stop people from trying to
> update the trainwreck.
> 

Please don't delete the document. This is one of the documents that has
the information to make decisions about the api usage.

atomic_t information is spread out in various Doc directories. It should
be consolidated, instead of removing files.

thanks,
-- Shuah
