Return-Path: <SRS0=e/bK=4N=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15E6C35DF5
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 10:33:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 717A220726
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 10:33:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730228AbgBYKdY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Feb 2020 05:33:24 -0500
Received: from ms.lwn.net ([45.79.88.28]:53188 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730222AbgBYKdY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 25 Feb 2020 05:33:24 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 98727738;
        Tue, 25 Feb 2020 10:33:22 +0000 (UTC)
Date:   Tue, 25 Feb 2020 03:33:17 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     lxsameer@gnu.org
Cc:     rdunlap@infradead.org, linux-doc@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v3 1/2] Documentation: Converted the `kobject.txt` to
 rst format
Message-ID: <20200225033317.46b452a7@lwn.net>
In-Reply-To: <20200219211903.43924-1-lxsameer@gnu.org>
References: <20200219211903.43924-1-lxsameer@gnu.org>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 19 Feb 2020 21:19:02 +0000
lxsameer@gnu.org wrote:

> From: Sameer Rahmani <lxsameer@gnu.org>
> 
> Reviewed and converted the `kobject.txt` format to rst in place.
> 
> Signed-off-by: Sameer Rahmani <lxsameer@gnu.org>
> ---
>  Documentation/kobject.txt | 80 +++++++++++++++++++--------------------
>  1 file changed, 40 insertions(+), 40 deletions(-)

So I think this is generally OK, if just a bit heavy-handed with the
markup.  One thing right at the beginning catches my eye, though:

> diff --git a/Documentation/kobject.txt b/Documentation/kobject.txt
> index ff4c25098119..7c22cdfffd6d 100644
> --- a/Documentation/kobject.txt
> +++ b/Documentation/kobject.txt
> @@ -3,7 +3,7 @@ Everything you never wanted to know about kobjects, ksets, and ktypes
>  =====================================================================
>  
>  :Author: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> -:Last updated: December 19, 2007
> +:Last updated: Feb 18, 2020

This change suggests that the document is current as of last week.
Unless you've made sure that it actually matches the current state of the
kobject code in the v5.6-rc kernels, it's probably better to leave that
date untouched as a warning to others.  Things are relatively static in
kobject land, but I still suspect there might just be a change or two
over the last twelve years...?

Thanks,

jon
