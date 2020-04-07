Return-Path: <SRS0=OmAX=5X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0724CC2BB1D
	for <linux-doc@archiver.kernel.org>; Tue,  7 Apr 2020 22:21:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D003F20730
	for <linux-doc@archiver.kernel.org>; Tue,  7 Apr 2020 22:21:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GT1CTS33"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbgDGWVI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Apr 2020 18:21:08 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:52134 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgDGWVI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Apr 2020 18:21:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=+z+xooxwFNmyw+VMMfdEIQxL55gapq/qfOSpdq0HVrU=; b=GT1CTS337W+O4VvgVGSLRUk4Mw
        XT+BY7+pu9cewBgxHC8oEpjGC1Q3GGq4CLgdui5aXBYzcVdzoev83dm7m3Og07GlI7xyvMK+JXbap
        cPm0gljTGhL9g2KlG61CDOrCQvHUAuFO4QMkb2I7ENcboQxhWH+rdVEKJ8QgFbfDAnkwUi4zPCOEE
        TIv/PsE0+TBofxC9QvMOuwqaxjzMe70gVTZw555VA3LBKgECBOI1ESUEh1Wl4Wi6qAw9nyYwxsoWz
        nzyNtrgo18/1zgaxc35/KdXAwUeoie4hfqUXP9R0YT2wCJybXk2QfSOP4UK3V4ijAkn3quIusRzBW
        Fgauh2mg==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jLwah-0002Zs-Gb; Tue, 07 Apr 2020 22:21:07 +0000
Subject: Re: [PATCH] Documentation: memory - fix warning
To:     Lothar Rubusch <l.rubusch@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
References: <20200406220743.22183-1-l.rubusch@gmail.com>
 <20200407132442.72d19de7@lwn.net>
 <CAFXKEHadRuaD7mAOu0193K6DL-9Tr=BV2L3HoTKHGb9Aa4Pzdg@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <082aa140-2891-5908-7dd3-c234b317d211@infradead.org>
Date:   Tue, 7 Apr 2020 15:21:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAFXKEHadRuaD7mAOu0193K6DL-9Tr=BV2L3HoTKHGb9Aa4Pzdg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/7/20 3:09 PM, Lothar Rubusch wrote:
> On Tue, Apr 7, 2020 at 9:24 PM Jonathan Corbet <corbet@lwn.net> wrote:
>>
>> On Mon,  6 Apr 2020 22:07:43 +0000
>> Lothar Rubusch <l.rubusch@gmail.com> wrote:
>>
>>> The label in sphinx can refer to a document section but not to the document
>>> header.
>>>
>>> The handle 'memory_allocation' is used in another document(s) to refer to
>>> GFP_KERNEL flags description in this modified document.
>>>
>>> Since the sphinx label does not work as it is placed here, a proposal is to
>>> better shift it to the section about memory allocation flags.
>>>
>>> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
>>
>> So I don't see any warnings associated with this label; what are you
>> seeing and how are you getting it?  Which version of Sphinx are you
>> running?
> 
> My setup says "Running Sphinx v1.8.4". My sources are cloned from
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git from
> branch testing-staging
> Am I doing this correctly?
> 
> I tried
> $ git clean -fxd
> $ make htmldocs
> (...)
> writing output... [ 16%] block/request .. crypto/api-akcipher
> ./include/linux/slab.h:503: WARNING: undefined label:
> memory-allocation (if the link has no caption the label must precede a
> section header)
> writing output... [ 19%] crypto/api-digest .. driver-api/dmaengine/client
> (...)
> 
> Alternatively, on plain console I see the following
> $ make htmldocs
> (...)
> preparing documents... done
> ./include/linux/slab.h:503: WARNING: undefined label:
> memory-allocation (if the link has no caption the label must precede a
> section header)
> /home/user/linux/Documentation/networking/devlink/devlink-trap.rst:302:
> WARNING: undefined label: generic-packet-trap-groups (if the link has
> no caption the label must precede a section header)
> writing output... [100%] xtensa/mmu
> waiting for workers...
> (...)
> 
> Is this reproducible to you?
> 
> Honestly, I figured out my current patch fixes nothing. I see
> definitely a warning there,
> but the problem is different:
> 
> A working referrer e.g. in Documentation/vm/index.rst:5
> :ref:`Documentation/core-api/memory-allocation.rst <memory_allocation>`
> 
> The erronous referrer in /include/linux/slab.h:503
> :ref:`Documentation/core-api/memory-allocation.rst <memory-allocation>`

Yes, I see that warning from slab.h.

> Now this is really embarrassing! Can it be that I should rather have
> replaced the '-' by a '_'?
> 
> I would like to file a patch v2. Please rather consider the second
> patch, if this warning is reproducable to you guys.
> I appologize for not having checked enough!
> 
> Best,
> Lothar
> 


-- 
~Randy

