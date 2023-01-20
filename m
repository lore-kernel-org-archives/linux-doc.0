Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D270C27C7C
	for <linux-doc@archiver.kernel.org>; Fri, 20 Jan 2023 15:19:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbjATPTJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Jan 2023 10:19:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbjATPTF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Jan 2023 10:19:05 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B146DA109
        for <linux-doc@vger.kernel.org>; Fri, 20 Jan 2023 07:19:03 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 79FAA2AE;
        Fri, 20 Jan 2023 15:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 79FAA2AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1674227943; bh=3FC403uzC8WVoVzxoAdPn9dH5q4g1dqTxwv/UY3Ryeg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=V4KA1dA47oKVT8FSlZT10ODjvbCMotB17nIhVMM/kgddM96QPO+Swc8elCXHncvK0
         VyyIoQ2mu1LGDPVek9qdLqeYovu+iqwUYinLMvXOnpYIqNAokSopyggRebEJWPAL1/
         VTBM33dVnoiaXlDPPUkwCISELgwpEisUuzDSz8NL+QgQN0bf/06W2mswsuefMf9sr6
         JFpqs4kKJ7XEW87wHTM4Xs+pEIPZ77SEypycU8Jy0wV5mEAOR5GK5MluyiiPYfTwM2
         E3FsYVG2rwQ388CIUAyzcfWRsVSTccU+xrpL+vZoCi5O2eYvQ/uqfeWhq10dFFD+wk
         hu+cQyUODElhQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Akira Yokosawa <akiyks@gmail.com>,
        Sadiya Kazi <sadiyakazi@google.com>
Cc:     linux-doc@vger.kernel.org, David Gow <davidgow@google.com>
Subject: Re: [PATCH RFC] docs: Add more information to the HTML sidebar
In-Reply-To: <fa426691-c76a-8ab0-4975-6edacc9cb247@gmail.com>
References: <87o7qu5al3.fsf@meer.lwn.net>
 <CAO2JNKW9pL5097qdte1N4F=RSnRJtcnpaDf__ROJAFfHitooYQ@mail.gmail.com>
 <fa426691-c76a-8ab0-4975-6edacc9cb247@gmail.com>
Date:   Fri, 20 Jan 2023 08:19:02 -0700
Message-ID: <8735855j4p.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Akira Yokosawa <akiyks@gmail.com> writes:

>>> Thoughts?  Is this headed in the right direction?  This view of the TOC
>>> is readily available from Sphinx; if we want something else it's going
>>> to be rather more work.
>
> I think this looks like the right direction. But how far do you want to
> mimic RTD's sidebar???

Well ... that is kind of my question for all of the folks who are
unhappy with the current sidebar.  What would you like to see there?

Things like sidebar width, whether bullets are used (I'd deliberately
taken them out as excess noise), which text is which color, etc. are all
just CSS; we can paint that shed any color we like.  The harder part is
deciding which information we want to have there in the first place.  So
... is the set of links shown in the new sidebar close to what we
want...  too much stuff?  Something missing?

Thanks,

jon
