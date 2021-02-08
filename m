Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03287C4332D
	for <linux-doc@archiver.kernel.org>; Mon,  8 Feb 2021 15:21:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF42D64E42
	for <linux-doc@archiver.kernel.org>; Mon,  8 Feb 2021 15:21:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233355AbhBHPU4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Feb 2021 10:20:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233645AbhBHPSB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Feb 2021 10:18:01 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99A59C061797
        for <linux-doc@vger.kernel.org>; Mon,  8 Feb 2021 07:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=geiCfd9PILCCJU0vFA1EOBDN/jltb8SbRyptTdR/uVA=; b=VBHM6IsC/miyIaq6tqh5/maFcU
        F3lHT6lwis2EimkCCDDQviQi56OQ/BVNHMHToteBmY0tUM8iTpxlRMqP6SqU/cN1Wh2VwNUOnAaIj
        VVnCh4hV31kmkN6s7U2bpD2ArVImc1QcM2IPx+u2XRcctZaBtKFjMdI1giKBg7pgmd4tptaKnEcCC
        iPJjJsxLrZFkauIMXx5H2IUWfpdXf1O7BDf4cD/+6lMFvXPpFyuuVCftVz7QqS6O+j64QGQI2qlrO
        JglYMuY7rm7a+IebpFKzl35LaqtWemlxXSmdTchmtbBs76/7ufaHTNka8W0gY7Sh9sLYM/QM6FdFq
        oc655gdg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l98GY-0068K2-8k; Mon, 08 Feb 2021 15:15:54 +0000
Date:   Mon, 8 Feb 2021 15:15:54 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Yorick de Wid <ydewid@gmail.com>
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net,
        Yorick de Wid <yorickdewid@users.noreply.github.com>
Subject: Re: [PATCH] docs: Remove the Microsoft rhetoric
Message-ID: <20210208151554.GR308988@casper.infradead.org>
References: <20210208150447.87104-1-ydewid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210208150447.87104-1-ydewid@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 08, 2021 at 04:04:48PM +0100, Yorick de Wid wrote:
> From: Yorick de Wid <yorickdewid@users.noreply.github.com>
> 
> There is no need to need to name Microsoft. The point is clear without that context.
> 
> Signed-off-by: Yorick de Wid <ydewid@gmail.com>
> ---
>  Documentation/process/coding-style.rst | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
> index 98227226c4e..5608ed2931f 100644
> --- a/Documentation/process/coding-style.rst
> +++ b/Documentation/process/coding-style.rst
> @@ -306,8 +306,7 @@ that counts the number of active users, you should call that
>  
>  Encoding the type of a function into the name (so-called Hungarian
>  notation) is asinine - the compiler knows the types anyway and can check
> -those, and it only confuses the programmer. No wonder Microsoft makes buggy
> -programs.
> +those, and it only confuses the programmer.

I'm not opposed to this, but it'd be nice to distinguish between Systems
Hungarian (which is what this paragraph is correctly excoriating) and
Apps Hungarian (which is actually useful and we should do more of):

https://www.joelonsoftware.com/2005/05/11/making-wrong-code-look-wrong/
