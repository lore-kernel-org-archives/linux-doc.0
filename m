Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51108EB64DB
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jun 2023 07:51:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbjFVHvt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Jun 2023 03:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbjFVHvs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Jun 2023 03:51:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E19BAFC;
        Thu, 22 Jun 2023 00:51:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 731C961786;
        Thu, 22 Jun 2023 07:51:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93F5BC433C8;
        Thu, 22 Jun 2023 07:51:45 +0000 (UTC)
Date:   Thu, 22 Jun 2023 08:51:42 +0100
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chaitanya S Prakash <chaitanyas.prakash@arm.com>,
        Will Deacon <will@kernel.org>, Anshuman.Khandual@arm.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH V2] Documentation/arm64: Add ptdump documentation
Message-ID: <ZJP9joL+QZiVM9Tg@arm.com>
References: <20230619083802.76092-1-chaitanyas.prakash@arm.com>
 <168736253462.605140.8006082140297031307.b4-ty@arm.com>
 <87ttv0pzt8.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ttv0pzt8.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jon,

On Wed, Jun 21, 2023 at 10:04:03AM -0600, Jonathan Corbet wrote:
> Catalin Marinas <catalin.marinas@arm.com> writes:
> 
> > On Mon, 19 Jun 2023 14:08:02 +0530, Chaitanya S Prakash wrote:
> >> ptdump is a debugfs interface used to dump the kernel page tables. It
> >> provides a comprehensive overview about the kernel's virtual memory
> >> layout, page table entries and associated page attributes. A document
> >> detailing how to enable ptdump in the kernel and analyse its output has
> >> been added.
> >> 
> >> Changes in V2:
> >> 
> >> [...]
> >
> > Applied to arm64 (for-next/doc), thanks! I did some tidying up, minor
> > fixes.
> >
> > [1/1] Documentation/arm64: Add ptdump documentation
> >       https://git.kernel.org/arm64/c/a0238ada560f
> 
> Note that this will generate a conflict with the arm64 documentation
> move, which I dropped into -next today.  It's easily enough fixed up
> top, but if you'd rather carry the directory move in your tree just say
> the word.

Ah, I forgot about this move. Are you ok to pull the arm64 for-next/doc
into your tree to avoid the conflict? There's also the arm64
for-next/acpi-doc branch that you could also pull.

Thanks.

-- 
Catalin
