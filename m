Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8ABC6FD1D
	for <linux-doc@archiver.kernel.org>; Thu, 23 Mar 2023 14:24:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbjCWOY5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Mar 2023 10:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbjCWOYz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Mar 2023 10:24:55 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3213AD15
        for <linux-doc@vger.kernel.org>; Thu, 23 Mar 2023 07:24:54 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4E1C144A;
        Thu, 23 Mar 2023 14:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4E1C144A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1679581493; bh=HIOf9GJgQdgSa3AOucexW+2DYu2dMoHsz47p9eBwmpk=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=e165btGdh1tFr5I1Kd8whf6Lrp1yalREqsdH1di/u0c30hVLPjaeaHe22XBlwSH6C
         UZzOOY8F890DNoT+XlLT+ew0u24eozMuGexUsLH7kgQI66O0UQbvLIgbKdDIkICotc
         THQdp5R5AN/LnSTaaDmY/KR6p6FVM8ePSilySphF4r8NhqHi3y81OVMEwHlJpHVpIN
         Gf+MXq4HPFrR64ofxEQmLghIdfFUUfzgTZV/XZ6FH3n4N/kz6M/P2aDEHwcoSf4uVA
         fwhSUTJbLGuMVCRRL9P9zGA20uCppsA63zOhVHB06P3egNMs+9WFiQ8AaHVQcb3W4B
         Pa29Ps90lX3QQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Ken Goldman <kgold@linux.ibm.com>,
        Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Subject: Re: Fwd: Documentation on IMA for Linux Kernel Documentation
In-Reply-To: <437443de-b9cf-d09b-1f9b-23dfd47f3e6b@linux.ibm.com>
References: <60ac4c41-65b8-3c3d-7e31-1a580e728ca5@infradead.org>
 <a3289dfb-da44-47ce-9f3b-1f5c9dec900c@linux.ibm.com>
 <369843bb-3a7a-78d0-40ac-0df51b0cc58d@infradead.org>
 <437443de-b9cf-d09b-1f9b-23dfd47f3e6b@linux.ibm.com>
Date:   Thu, 23 Mar 2023 08:24:52 -0600
Message-ID: <87wn37czpn.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Ken Goldman <kgold@linux.ibm.com> writes:

> On 3/22/2023 6:58 PM, Randy Dunlap wrote:
>> Review in terms of IMA-specific content?  or in terms of ReST usage?
>> or in general terms to see if it is appropriate for kernel tree document=
ation?
>>
>> I think that you should Cc: linux-integrity@vger.kernel.org for their in=
put
>> as well as linux-doc@vger.kernel.org. Several of us here can look at it =
for
>> general review feedback.
>
> Not the accuracy - I have IMA experts looking at that.

You still want to copy the integrity list for something like this; they
will have the ultimate say on whether it makes sense for inclusion into
the kernel tree.

> I want to know if it'll be accepted, and if the structure is OK.

...and that's hard to answer without seeing the work.  It's better to
just post what you have then to ask whether you should.

>> 2. What is the process for getting a block of documentation added to=20
>> https://www.kernel.org/doc/html?
>>  From last week's email:
>>
>>>>> It should be added to the kernel tree in the Documentation/userspace-=
api/ subdirectory
>>>>> or Documentation/security/ subdirectory.  The kernel.org/doc/ web pag=
es are generated
>>>>> from what is in the Linux kernel tree.
>> although if you don't think that it is appropriate for either of those s=
ubdirectories,
>> just explain and justify that and it might be possible to put it somewhe=
re else.
>
> "Where" comes later.=C2=A0 I just want to know if it'll be accepted at al=
l.

We're not in the habit of turning down good documentation.  Please, post
your work to the relevant lists and we'll go from there.

Thanks,

jon
