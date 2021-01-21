Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E5D7C433DB
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 20:07:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CEC823A5B
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 20:07:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbhAUUH1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Jan 2021 15:07:27 -0500
Received: from ms.lwn.net ([45.79.88.28]:35700 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbhAUSq0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 21 Jan 2021 13:46:26 -0500
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id AAA97615C;
        Thu, 21 Jan 2021 18:44:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AAA97615C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1611254700; bh=ohCI30gEmYwmhbDDDUE0YNczMwHC6QQw0UWJHKghkGY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Tbre4kwyqWH/Y3GrTBNCfMHd8K5c+nOh7d8mpLo8Q9G63QD5exwl8UMbcMuNtd4b/
         ScqOyDdUHL3IzLaDy0oJ4L505CXx6wh8Mey9Ty7vXyf/HdM+GB83cK3SYfSxOKoda0
         0J0piOCn2m/Kr0xzQw6PI4iYoO6GmXVGOvw91CmzXXBkP9YiCuxSI2IAhik8zrEr0O
         8ZfDCJRCw4Y2JeZbFbCfBFlEnp9kSr3MXsoj/WAKWrgrwOWFeS60/fjvx3dIxK1NP3
         X4nDmCkDZtqlD1EEaMq9TOLsveuZmS5GSQsZgrmB2SP0VFsTptfhv5Y/La5EHp7k3y
         bBHnflrVcDjkw==
Date:   Thu, 21 Jan 2021 11:44:58 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>, linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arch/Kconfig: update a broken file reference
Message-ID: <20210121114458.614ee8da@lwn.net>
In-Reply-To: <20210119095326.13896-1-lukas.bulwahn@gmail.com>
References: <20210119095326.13896-1-lukas.bulwahn@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 19 Jan 2021 10:53:26 +0100
Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit adab66b71abf ("Revert: "ring-buffer: Remove HAVE_64BIT_ALIGNED_ACCESS"")
> added the config HAVE_64BIT_ALIGNED_ACCESS back into arch/Kconfig with this
> revert. In the meantime, commit c9b54d6f362c ("docs: move other kAPI
> documents to core-api") changed ./Documentation/unaligned-memory-access.txt
> to ./Documentation/core-api/unaligned-memory-access.rst.
> 
> Fortunately, ./scripts/documentation-file-ref-check detects this and warns
> about this broken reference.
> 
> Update the file reference in arch/Kconfig.
> 
> Fixes: adab66b71abf ("Revert: "ring-buffer: Remove HAVE_64BIT_ALIGNED_ACCESS"")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on current master and next-20210118
> 
> Steven, could you pick this fix to your commit or, at least, ack it so that
> Jonathan can pick it?

I've gone ahead and applied it, thanks.

jon
