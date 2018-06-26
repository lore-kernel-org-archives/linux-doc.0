Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EA94F7D043
	for <lwn-linux-doc@archive.lwn.net>; Tue, 26 Jun 2018 14:42:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935037AbeFZOmm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 26 Jun 2018 10:42:42 -0400
Received: from ms.lwn.net ([45.79.88.28]:35238 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934936AbeFZOmk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 26 Jun 2018 10:42:40 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4A91E2F3;
        Tue, 26 Jun 2018 14:42:40 +0000 (UTC)
Date:   Tue, 26 Jun 2018 08:42:39 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Martin Kepplinger <martink@posteo.de>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: nommu-map: Fix duplicate word typo
Message-ID: <20180626084239.27d88f7e@lwn.net>
In-Reply-To: <20180622073211.8220-1-martink@posteo.de>
References: <20180622073211.8220-1-martink@posteo.de>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 22 Jun 2018 09:32:11 +0200
Martin Kepplinger <martink@posteo.de> wrote:

> Signed-off-by: Martin Kepplinger <martink@posteo.de>
> ---
>  Documentation/nommu-mmap.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/nommu-mmap.txt b/Documentation/nommu-mmap.txt
> index 69556f0d494b..530fed08de2c 100644
> --- a/Documentation/nommu-mmap.txt
> +++ b/Documentation/nommu-mmap.txt
> @@ -47,7 +47,7 @@ and it's also much more restricted in the latter case:
>             appropriate mapping protection capabilities. Ramfs, romfs, cramfs
>             and mtd might all permit this.
>  
> -	 - If the backing device device can't or won't permit direct sharing,
> +	 - If the backing device can't or won't permit direct sharing,
>             but does have the NOMMU_MAP_COPY capability, then a copy of the
>             appropriate bit of the file will be read into a contiguous bit of
>             memory and any extraneous space beyond the EOF will be cleared

Applied, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
