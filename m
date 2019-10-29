Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 882CB7D918
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Oct 2019 20:10:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbfJ2UKS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Oct 2019 16:10:18 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:56574 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbfJ2UKS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Oct 2019 16:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=nc7bEdR1NmpD3hIU6RwdoUbYatCVvAaB4mjOO9zrdHI=; b=gzJEMKWaArDZvnXnt66OduUih
        SFp/amCaujtg8MnXiUr1klZJ9/2d8teQtivvKEIZpoELkUqfWOW3sPHZTy72fjft4ceEtEf+kVCTD
        omnPyYvQxrE/Od3MpuWDlukUpDtDoseD0r8j7X+Z/PXDQDVBG/w6pftm5QErKv0Xh+431cjNUE+LV
        zcGR+eBrhLMJ0/dEETa5E/d8G1K6waGrHn15CQ8LaB9v1bMjLPeRQtk+D9Y3XUg6iLh9UxkcNZCjp
        ku6XG9O5g/7o6LX97g6vVJtn3V0/pCS2C7kDDCeZoJhAYfkkCLspgrJ0vpIQDQtRDwxbIpjJ/aala
        w8gdp/C2A==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iPXon-0005lq-Ft; Tue, 29 Oct 2019 20:10:17 +0000
Subject: Re: Sphinx parallel build errors
To:     Markus Heiser <markus.heiser@darmarit.de>,
        Kees Cook <keescook@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <dc19a670-7e8e-04e5-667d-578c2dd3754e@infradead.org>
 <201910091929.0C058BB@keescook> <20191010124832.23bc4362@lwn.net>
 <c6263597-e9d0-5a1f-effd-d1706c24e666@infradead.org>
 <8305ffe2-51ba-eb4b-4d44-2defe45aa68f@infradead.org>
 <20191027121729.59c1d539@lwn.net>
 <c0be66ed-eb97-bc19-5bdb-0ef8903c3709@infradead.org>
 <20191027160507.6d7be266@coco.lan> <201910281205.DD5B74F@keescook>
 <205d5664-88b9-36d4-75f3-67b51884bbda@darmarit.de>
 <c0f0af19-0a77-8640-0152-7558aa367752@infradead.org>
 <f6df7edc-74bf-74b3-1dcd-203d74d0787e@darmarit.de>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5c7c968d-800f-7d29-e52e-e163ffe2dc8c@infradead.org>
Date:   Tue, 29 Oct 2019 13:10:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <f6df7edc-74bf-74b3-1dcd-203d74d0787e@darmarit.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/29/19 12:57 PM, Markus Heiser wrote:
> Am 29.10.19 um 20:41 schrieb Randy Dunlap:
>>> In the past I run sphinx builds on a small 4GB VM (2cpu) without any problems.
>>> (nowadays) 16 CPU, 16 GB PC with sphinx-build the max load of my whole PC is
>>> about 5GB (*more CPUs need more mem*).
>>>
>>> @Randy you said the build machine hase 8GB .. and how much CPUs?
>>
>> 4.
>>
> 
>>>> Randy, are you able to just use -j2 or similar with your builds to avoid
>>>> this?
>>
>> No, sometimes even -j1 fails with oom-killer. >
>>> @Randy: my first questions are:
>>>
>>> - cpu / mem?
>>> - are OOM-kills when building target htmldocs, pdfdocs or ..?
>>
>> htmldocs
>>
>>> - which py & sphinx version are used? Reference installation see 'virtualenv'
>>>    in [1]
>>
>> Python 2.7.14
>> sphinx-build 1.7.6
> 
> Seems nothing special in your environment .. its strange to me.
> 
> Installing new sphinx-doc will not help, you are fighting with some
> other problems.  Hoped that I can help, but realize that I don't have
> a clue what it is / sorry.

No problem.  Thanks for looking.

-- 
~Randy

