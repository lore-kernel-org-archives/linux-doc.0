Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AC7C6FD1D
	for <linux-doc@archiver.kernel.org>; Wed, 15 Mar 2023 04:28:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbjCOE2o (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Mar 2023 00:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbjCOE2m (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Mar 2023 00:28:42 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B5026CE9
        for <linux-doc@vger.kernel.org>; Tue, 14 Mar 2023 21:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=NxR+BZmuFNCXOVHjpR+qVNz1oG/Ubl50tqFNde1Zv48=; b=RgJ1s7ph8S+W+1aSsOFde6e5LZ
        Y1AlmXXrbZDd3VdjzUV4iG/Opy7QozzKLa7POmJ7DIXenhkVz7uPe7MLbP0F510mMWRQwlqR146AJ
        OEmQbYy85RiKHDRT6DhLUYhONgOxanFLMz0MG3k5xr/W6i+YmULrBuoC0BXPLylgDUFQY0I7HcEdm
        QjnypB4VF+k05fu3GD17Iun9A4z3+Qdp4g3i9ls0mvB2zvK3LGBe6Tmib9p1sg9I4NLP8k7vvQeJO
        0cBbXnrJ7tPUsGFSA4S5C0Gc80jS8eFqxaTAUX8kF607ZBIlB0lmX+Kp/4kAPTHqC/wv7C4J5Y5AT
        Oz/iesYw==;
Received: from [2601:1c2:980:9ec0::df2f]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1pcIkG-00CHEk-1L;
        Wed, 15 Mar 2023 04:28:12 +0000
Message-ID: <53b1194f-ae4a-87c9-5670-d1dbc298242f@infradead.org>
Date:   Tue, 14 Mar 2023 21:28:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1] docs/mm: extend ksm doc
Content-Language: en-US
To:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Stefan Roesch <shr@devkernel.io>, kernel-team@fb.com
Cc:     linux-mm@kvack.org, riel@surriel.com, mhocko@suse.com,
        david@redhat.com, linux-doc@vger.kernel.org,
        akpm@linux-foundation.org, hannes@cmpxchg.org
References: <20230314204557.3863923-1-shr@devkernel.io>
 <ZBFCud+I8mVAoh87@debian.me>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ZBFCud+I8mVAoh87@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi--

On 3/14/23 20:59, Bagas Sanjaya wrote:
> On Tue, Mar 14, 2023 at 01:45:57PM -0700, Stefan Roesch wrote:
>> +to cancel that advice and restore unshared pages: whereupon KSM
>> +unmerges whatever is merged for that process.  Note: this unmerging call
>> +may suddenly require more memory than is available - possibly failing
>> +with EAGAIN, but more probably arousing the Out-Of-Memory killer.
> 
> "... to disable KSM and let it unmerges ... . Note that this unmerging
> call may exhaust memory and triggers OOM killer."

I can't tell exactly what is being proposed here, but "let it unmerges"
is not good & proper...

Perhaps fewer ellipses and more complete sentences are in order.

>> +However, if the system is dedicated to running multiple jobs within the
>> +same security domain, there is a usecase where multiple instances of the
>> +same job are running inside a safe shared security domain and using the
>> +same sensitive data.
> 
> "... it is possible for multiple instances ... and share the same
> sensitive data."
> 
> Thanks. 
> 

-- 
~Randy
