Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9E2C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 21:07:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF40E61213
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 21:07:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234125AbhINVI4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Sep 2021 17:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234059AbhINVI4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Sep 2021 17:08:56 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 052E8C061574;
        Tue, 14 Sep 2021 14:07:39 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B74982CA;
        Tue, 14 Sep 2021 21:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B74982CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1631653658; bh=OzDEUFY2Bj1S96d7As00iUBtqJT+TjALkXWjNkA61Bo=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=kqxq+6V//lUSVPwPraPJLTgvbx9gLA8jia4ZdCAJptiJHYpTBrQZqf4jwIpWgIhxg
         9nQFyireI8Ymahvu3sOo02bHjFJYha5agddTciIRzSV1tT4n4evbeFJrRGbWqOpSA5
         6K2+0FnIi0bqO3VwCu/vY6Ir/EytTsLDCqYW0WDdulivy2QMjehHQ1jskYswL81xsg
         9MKDxuWXnzfVvKFPx7kpaB7B7qk7hyqGzSs8NRc5ZTWf2gnznDJll2fAChm/s13TT4
         grJmeqt11pilFvKxj2RuJyyA+MFYg1dkhmgC9drnJaTDpEp/uIkGBXDRc6UECn+AFC
         +MoI+IJ3hYsCg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Utkarsh Verma <utkarshverma294@gmail.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Joe Perches <joe@perches.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Utkarsh Verma <utkarshverma294@gmail.com>
Subject: Re: [PATCH] Documentation: checkpatch: Add SPLIT_STRING message
In-Reply-To: <20210904073621.12987-1-utkarshverma294@gmail.com>
References: <20210904073621.12987-1-utkarshverma294@gmail.com>
Date:   Tue, 14 Sep 2021 15:07:38 -0600
Message-ID: <87mtoedfxh.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Utkarsh Verma <utkarshverma294@gmail.com> writes:

> Add a new message type SPLIT_STRING under the 'Indentation and Line
> Breaks' subsection. Checkpatch documentation for the splitting of
> quoted strings that appear in userspace, across multiple lines.
>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
> ---
>  Documentation/dev-tools/checkpatch.rst | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied, thanks.

jon
