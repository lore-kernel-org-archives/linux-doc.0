Return-Path: <SRS0=/07d=4B=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C1BC2BA83
	for <linux-doc@archiver.kernel.org>; Thu, 13 Feb 2020 18:26:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A65C21734
	for <linux-doc@archiver.kernel.org>; Thu, 13 Feb 2020 18:26:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbgBMS0z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Feb 2020 13:26:55 -0500
Received: from ms.lwn.net ([45.79.88.28]:46850 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725781AbgBMS0z (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 13 Feb 2020 13:26:55 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 570832D8;
        Thu, 13 Feb 2020 18:26:54 +0000 (UTC)
Date:   Thu, 13 Feb 2020 11:26:53 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     mchehab+samsung@kernel.org, linux-doc@vger.kernel.org,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v2 0/5] Documentation: nfs: convert remaining files to
 ReST.
Message-ID: <20200213112653.069734d7@lwn.net>
In-Reply-To: <20200129044917.566906-1-dwlsalmeida@gmail.com>
References: <20200129044917.566906-1-dwlsalmeida@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 29 Jan 2020 01:49:12 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> wrote:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> This series completes the conversion of Documentation/filesystems/nfs to ReST.
> 
> 
> I did not think these rst files were supposed to be
> in admin-guide, so I left them where they are.
> 
> Changes in v2:
> 	Change csv-table to ReST grid table format
> 	Remove "#." syntax
> 
> Daniel W. S. Almeida (5):
>   Documentation: nfs: convert pnfs.txt to ReST
>   Documentation: nfs: rpc-cache: convert to ReST
>   Documentation: nfs: rpc-server-gss: convert to ReST
>   Documentation: nfs: nfs41-server: convert to ReST
>   Documentation: nfs: knfsd-stats: convert to ReST

I've applied the set, thanks.

jon
