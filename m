Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97211C61DA4
	for <linux-doc@archiver.kernel.org>; Thu, 16 Feb 2023 23:55:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbjBPXza (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Feb 2023 18:55:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230212AbjBPXzT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Feb 2023 18:55:19 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B661B10F3
        for <linux-doc@vger.kernel.org>; Thu, 16 Feb 2023 15:55:10 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id DE51C2ED;
        Thu, 16 Feb 2023 23:55:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DE51C2ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1676591709; bh=TAOf70FrpE43GRHSW3Qg/YAlDg1ZA65ImQpJxLnMIH4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=P7oaD6hew22WKKVTt0HXgObnQWHh0WhnimhNIoXEMHsHCL8de5xBJTiOsxg3VOPw5
         JeP2WuhCr4u/84oD9jRy0Ab7elRXEAqWW17kzIcJH5geuNNVrmTha6xb3IpCPgPx49
         D7TOWrv60pn4sWC4wJFQGAaNRJZD8g55hPvucA5zELjstyUFv/x6YIpy/eS0cPbyCs
         vw7Q6I/Xh8lHdowIPlEQAV7BecvMKZErKhCQM69SjO7S1sBb3rqSapE1x++PAEtgJV
         T9ICpvN4WWpMfe7Z2RaP2JIXTguT4270/5K46ZLMDnkvZsghBFKNDCXJO4CS6vKLoB
         UG3AcQuFDsKIA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Akira Yokosawa <akiyks@gmail.com>, rdunlap@infradead.org
Cc:     akiyks@gmail.com, davidgow@google.com, linux-doc@vger.kernel.org,
        sadiyakazi@google.com
Subject: Re: [PATCH RFC V2] docs: Add more information to the HTML sidebar
In-Reply-To: <f242e068-2126-c67e-c894-7a1727b1d2b7@gmail.com>
References: <874jroksgq.fsf@meer.lwn.net>
 <f242e068-2126-c67e-c894-7a1727b1d2b7@gmail.com>
Date:   Thu, 16 Feb 2023 16:55:08 -0700
Message-ID: <87fsb5go83.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Akira Yokosawa <akiyks@gmail.com> writes:

> I think the patch appended below (on top of current docs-next)
> would have been a better approach, where each .rst file is listed
> only once in the whole toctree. The refurbished part of main index
> is moved to index-frequent.rst and toctrees are replaced with
> lists of :doc: references.
>
> Per-directory indexes are listed in the main index's toctree
> below the index-frequent.
>
> I'm not saying this is "the" right approach.
> There can be many ways to accomplish the same result, I suppose.
>
> I'll submit this change as a proper patch if I can get positive
> feedback.

So I applied this and built it.  There may be potential in this
approach, but I don't think we are there yet.

This change completely loses the organization that I wanted to put onto
the front page itself.  That page will be the place where people land
first, so it should guide them to somewhere useful as quickly and easily
as possible.  With this change, we've hidden that guidance in a
subsidiary page and the front is back to a random collection of
unordered stuff.

The front page, I think, is more important than the sidebar.

We really need to look into the actual generation of the sidebar; it's
on my list, but won't happen before the merge window.  I do appreciate
playing with ideas, though - please keep it up!  We'll figure out
something eventually...:)

Thanks,

jon
