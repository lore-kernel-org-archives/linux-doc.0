Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5B3C07D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 Jan 2019 00:35:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbfAOAfb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 Jan 2019 19:35:31 -0500
Received: from ms.lwn.net ([45.79.88.28]:38588 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726782AbfAOAfb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 14 Jan 2019 19:35:31 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4132D7DE;
        Tue, 15 Jan 2019 00:35:31 +0000 (UTC)
Date:   Mon, 14 Jan 2019 17:35:30 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/core-api/mm: fix GFP combinations section name
Message-ID: <20190114173530.0d70d86f@lwn.net>
In-Reply-To: <1547490778-6758-1-git-send-email-rppt@linux.ibm.com>
References: <1547490778-6758-1-git-send-email-rppt@linux.ibm.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 14 Jan 2019 20:32:58 +0200
Mike Rapoport <rppt@linux.ibm.com> wrote:

> Fix the mismatch between "Useful GFP flag combinations" section naming in
> the DOC: section in include/linux/gfp.h and
> Documentation/core-api/mm-api.rst
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  Documentation/core-api/mm-api.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
> index aa8e54b8..128e8a7 100644
> --- a/Documentation/core-api/mm-api.rst
> +++ b/Documentation/core-api/mm-api.rst
> @@ -35,7 +35,7 @@ users will want to use a plain ``GFP_KERNEL``.
>     :doc: Reclaim modifiers
>  
>  .. kernel-doc:: include/linux/gfp.h
> -   :doc: Common combinations
> +   :doc: Useful GFP flag combinations

This also eliminates one warning:

	./include/linux/gfp.h:1: warning: no structured comments found

I'll add that to the changelog.  Applied, thanks.

jon
