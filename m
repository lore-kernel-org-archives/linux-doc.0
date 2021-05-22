Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A1CC2B9F2
	for <linux-doc@archiver.kernel.org>; Sat, 22 May 2021 09:35:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1B1E6128A
	for <linux-doc@archiver.kernel.org>; Sat, 22 May 2021 09:35:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbhEVJgi convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 22 May 2021 05:36:38 -0400
Received: from vps-a2bccee9.vps.ovh.net ([51.75.19.47]:51166 "EHLO
        ursule.remlab.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbhEVJgi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 May 2021 05:36:38 -0400
X-Greylist: delayed 460 seconds by postgrey-1.27 at vger.kernel.org; Sat, 22 May 2021 05:36:37 EDT
Received: from ursule.remlab.net (localhost [IPv6:::1])
        by ursule.remlab.net (Postfix) with ESMTP id A2531C2C62;
        Sat, 22 May 2021 12:27:28 +0300 (EEST)
Received: from philogene.remlab.net ([2a01:e34:ec42:5c70:23f3:1053:78e5:7f3c])
        by ursule.remlab.net with ESMTPSA
        id wOWrJoDOqGBiAQAAwZXkwQ
        (envelope-from <remi@remlab.net>); Sat, 22 May 2021 12:27:28 +0300
From:   =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To:     Aditya Srivastava <yashsri421@gmail.com>
Cc:     courmisch@gmail.com, lukas.bulwahn@gmail.com,
        rdunlap@infradead.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Phonet: fix kernel-doc syntax in file headers
Date:   Sat, 22 May 2021 12:27:28 +0300
Message-ID: <52313028.m8L9TnScQ9@philogene>
Organization: Remlab Tmi
In-Reply-To: <20210520182159.31462-1-yashsri421@gmail.com>
References: <20210520182159.31462-1-yashsri421@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Le jeudi 20 mai 2021, 21:21:59 EEST Aditya Srivastava a écrit :
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for include/*/linux/phonet.h files follows this syntax, but
> the content inside does not comply with kernel-doc.
> 
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warning from kernel-doc.
> For e.g., running scripts/kernel-doc -none include/linux/phonet.h emits:
> warning: This comment starts with '/**', but isn't a kernel-doc comment.
> Refer Documentation/doc-guide/kernel-doc.rst * file phonet.h
> 
> Provide a simple fix by replacing this occurrence with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

You could just as well remove the stray "file XX" lines but OK.

Acked-by: Rémi Denis-Courmont <courmisch@gmail.com.>

-- 
Rémi Denis-Courmont


