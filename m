Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5B2B27D082
	for <lwn-linux-doc@archive.lwn.net>; Sun,  7 Oct 2018 14:46:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727258AbeJGVyJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 7 Oct 2018 17:54:09 -0400
Received: from ms.lwn.net ([45.79.88.28]:34640 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726527AbeJGVyJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 7 Oct 2018 17:54:09 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 825898AF;
        Sun,  7 Oct 2018 14:46:41 +0000 (UTC)
Date:   Sun, 7 Oct 2018 08:46:40 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc:     linux-doc@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 2/2] docs/vm: split memory hotplug notifier description
 to Documentation/core-api
Message-ID: <20181007084640.76cd08c8@lwn.net>
In-Reply-To: <1538691061-31289-3-git-send-email-rppt@linux.vnet.ibm.com>
References: <1538691061-31289-1-git-send-email-rppt@linux.vnet.ibm.com>
        <1538691061-31289-3-git-send-email-rppt@linux.vnet.ibm.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri,  5 Oct 2018 01:11:01 +0300
Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:

> The memory hotplug notifier description is about kernel internals rather
> than admin/user visible API. Place it appropriately.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.vnet.ibm.com>

One little nit...

>  Documentation/admin-guide/mm/memory-hotplug.rst    | 83 ---------------------
>  Documentation/core-api/index.rst                   |  2 +
>  Documentation/core-api/memory-hotplug-notifier.rst | 84 ++++++++++++++++++++++
>  3 files changed, 86 insertions(+), 83 deletions(-)
>  create mode 100644 Documentation/core-api/memory-hotplug-notifier.rst
> 
> diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
> index a33090c..0b9c83e 100644
> --- a/Documentation/admin-guide/mm/memory-hotplug.rst
> +++ b/Documentation/admin-guide/mm/memory-hotplug.rst
> @@ -31,7 +31,6 @@ be changed often.
>      6.1 Memory offline and ZONE_MOVABLE
>      6.2. How to offline memory
>    7. Physical memory remove
> -  8. Memory hotplug event notifier
>    9. Future Work List

That leaves a gap in the numbering here.

In general, the best solution to this sort of issue is to take the TOC out
entirely and let Sphinx worry about generating it.  People tend not to
think about updating the TOC when they make changes elsewhere, so it often
goes out of sync with the rest of the document anyway.

I'll apply these, but please feel free to send a patch to fix this up.

Thanks,

jon
