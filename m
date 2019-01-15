Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 74AE97D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 Jan 2019 00:25:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727299AbfAOAZU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 Jan 2019 19:25:20 -0500
Received: from ms.lwn.net ([45.79.88.28]:38544 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726911AbfAOAZT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 14 Jan 2019 19:25:19 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 3336A2E5;
        Tue, 15 Jan 2019 00:25:19 +0000 (UTC)
Date:   Mon, 14 Jan 2019 17:25:18 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, dave.hansen@linux.intel.com,
        Vincent Whitchurch <rabinv@axis.com>,
        Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] Documentation/sysctl/vm.txt: Fix drop_caches bit number
Message-ID: <20190114172518.5ea0d704@lwn.net>
In-Reply-To: <20190111161410.11831-1-vincent.whitchurch@axis.com>
References: <20190111161410.11831-1-vincent.whitchurch@axis.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 11 Jan 2019 17:14:10 +0100
Vincent Whitchurch <vincent.whitchurch@axis.com> wrote:

> Bits are usually numbered starting from zero, so 4 should be bit 2, not
> bit 3.
> 
> Suggested-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
>  Documentation/sysctl/vm.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/sysctl/vm.txt b/Documentation/sysctl/vm.txt
> index 187ce4f599a2..6af24cdb25cc 100644
> --- a/Documentation/sysctl/vm.txt
> +++ b/Documentation/sysctl/vm.txt
> @@ -237,7 +237,7 @@ used:
>  	cat (1234): drop_caches: 3
>  
>  These are informational only.  They do not mean that anything is wrong
> -with your system.  To disable them, echo 4 (bit 3) into drop_caches.
> +with your system.  To disable them, echo 4 (bit 2) into drop_caches.

Applied, thanks.

jon
