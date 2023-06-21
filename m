Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA057EB64D8
	for <linux-doc@archiver.kernel.org>; Wed, 21 Jun 2023 16:04:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231955AbjFUQEJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Jun 2023 12:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231777AbjFUQEG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Jun 2023 12:04:06 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDB1395;
        Wed, 21 Jun 2023 09:04:04 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 6443D2AE;
        Wed, 21 Jun 2023 16:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6443D2AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1687363444; bh=9GsjYoK1UjQi4wFJupRIYmzN22GQzBlgOXxDNpcaMrc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=LSmPpF70c1bddUTI0VB66CNSrJ2iw4d8Re3bALfGvMm5Lwmyh17cqmFJdVLk6shdU
         TnVyC8brL/qwyAJPKxCJlL/fkXwq4n3Y3JIXXR5IsAyCoatv1DgOQQLvf+7Ck7sB7m
         B/xw+DTqt9kxSLMTcpJaGVLP4JlO9l3A02svYVOU+jidTIf4XH3lvvEZCHl0ofxbAi
         rtXNyXTX8m9P9cVGYsM5kLILQHOriIru1PEd1vQI0X3766RUvpOmpnggQaYiTHayFk
         SBr695wayBy1J06zMH3kKbLUFueYvtvASZDMiUEI0AGuO1Fde/OFt0T7cS2vJC3jc+
         Wy8aPsnL+RPvA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chaitanya S Prakash <chaitanyas.prakash@arm.com>
Cc:     Will Deacon <will@kernel.org>, Anshuman.Khandual@arm.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH V2] Documentation/arm64: Add ptdump documentation
In-Reply-To: <168736253462.605140.8006082140297031307.b4-ty@arm.com>
References: <20230619083802.76092-1-chaitanyas.prakash@arm.com>
 <168736253462.605140.8006082140297031307.b4-ty@arm.com>
Date:   Wed, 21 Jun 2023 10:04:03 -0600
Message-ID: <87ttv0pzt8.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Mon, 19 Jun 2023 14:08:02 +0530, Chaitanya S Prakash wrote:
>> ptdump is a debugfs interface used to dump the kernel page tables. It
>> provides a comprehensive overview about the kernel's virtual memory
>> layout, page table entries and associated page attributes. A document
>> detailing how to enable ptdump in the kernel and analyse its output has
>> been added.
>> 
>> Changes in V2:
>> 
>> [...]
>
> Applied to arm64 (for-next/doc), thanks! I did some tidying up, minor
> fixes.
>
> [1/1] Documentation/arm64: Add ptdump documentation
>       https://git.kernel.org/arm64/c/a0238ada560f

Note that this will generate a conflict with the arm64 documentation
move, which I dropped into -next today.  It's easily enough fixed up
top, but if you'd rather carry the directory move in your tree just say
the word.

Thanks,

jon
