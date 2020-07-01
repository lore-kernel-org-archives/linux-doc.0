Return-Path: <SRS0=6tkN=AM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273BFC433E0
	for <linux-doc@archiver.kernel.org>; Wed,  1 Jul 2020 07:38:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AAAB20722
	for <linux-doc@archiver.kernel.org>; Wed,  1 Jul 2020 07:38:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728055AbgGAHiQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Jul 2020 03:38:16 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:55898 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727836AbgGAHiQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Jul 2020 03:38:16 -0400
Received: from madeliefje.horms.nl (unknown [83.161.246.101])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A1DE625B81D;
        Wed,  1 Jul 2020 17:38:14 +1000 (AEST)
Received: by madeliefje.horms.nl (Postfix, from userid 7100)
        id B4711379E; Wed,  1 Jul 2020 09:38:12 +0200 (CEST)
Date:   Wed, 1 Jul 2020 09:38:12 +0200
From:   Simon Horman <horms@verge.net.au>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     dyoung@redhat.com, bhe@redhat.com, vgoyal@redhat.com,
        corbet@lwn.net, kexec@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Replace HTTP links with HTTPS ones: kdump
Message-ID: <20200701073812.GB24403@vergenet.net>
References: <20200627103151.71942-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200627103151.71942-1-grandmaster@al2klimov.de>
Organisation: Horms Solutions BV
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jun 27, 2020 at 12:31:51PM +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
>           If both the HTTP and HTTPS versions
>           return 200 OK and serve the same content:
>             Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Reviewed-by: Simon Horman <horms@verge.net.au>
