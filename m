Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335BCC41513
	for <linux-doc@archiver.kernel.org>; Wed, 16 Aug 2023 17:16:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235983AbjHPRPh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Aug 2023 13:15:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345218AbjHPRPc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Aug 2023 13:15:32 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7063BE52
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 10:15:30 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BD3686A2;
        Wed, 16 Aug 2023 17:15:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BD3686A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1692206129; bh=3p6PL7iQKwt5XtOG7NlyIqxWzZzpH1yyc7VZIgjwdwg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=R664iSmyRF3u3fM03iiYGwcyF/W73HqmdBaPM6/Wz9EVyDycJH0o2LVcqZ/hk3UjS
         FlO/5QjGwtWln6NZbgJtVInHXSM6NSaiDnF3NCPiyHcWVAjtgdPd5ovAzesOUHMAvn
         b+1WFtbdYyAeSassfMWw6gz3GKRcNOlrbSZD7QfOna7Ah0zeDWiXmKqGOIceVo/ESh
         1SyKC4r0Wur8pHJ69mDbNMdaBIeSrzVeohmdaiQWJShpXsd3WRAzGLePz8xv7dBeJM
         /wJe96UAePsCj7wTmGOILzdqFkE4RnaMStUI+gDLMEn2B/fSfaCutejrpyNX2AJckl
         F4toHRXahVz5g==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Simon Glass <sjg@chromium.org>, linux-doc@vger.kernel.org
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Heinrich Schuchardt <xypron.glpk@gmx.de>,
        U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: Doc style for method functions
In-Reply-To: <CAPnjgZ0vPwd9v+V8Pg5Bo87OELD-vokB7ZrvU3Bv5dQ_O9z6Sg@mail.gmail.com>
References: <CAPnjgZ0vPwd9v+V8Pg5Bo87OELD-vokB7ZrvU3Bv5dQ_O9z6Sg@mail.gmail.com>
Date:   Wed, 16 Aug 2023 11:15:28 -0600
Message-ID: <877cpusybz.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Simon Glass <sjg@chromium.org> writes:

> Hi Jonathan,
>
> I would like to do something like this:
>
> struct part_driver {
>    /**
>     * get_info() - Get information about a partition
>
>               ^ causes error
>
>     *
>     * @desc: Block device descriptor
>     * @part: Partition number (1 = first)
>     * @info: Returns partition information
>     */
>    int (*get_info)(struct blk_desc *desc, int part, struct
> disk_partition *info);
> ...
> };
>
> But this gives:
>
> scripts/kernel-doc:292:
>    print STDERR "Incorrect use of kernel-doc format: $_";
>
> Without the brackets on get_info() it works OK. What is the purpose of
> that check, please?

That's how the kerneldoc syntax was defined, well before my time as the
maintainer.  This could be relaxed, I guess, but one would have to look
at the parsing code to be sure that the right thing happens all the way
through the process.  I'm not entirely sure it's worth it...

Thanks,

jon
