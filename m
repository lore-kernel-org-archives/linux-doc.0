Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CC6837D08A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Nov 2018 16:25:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728177AbeKUCz3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Nov 2018 21:55:29 -0500
Received: from ms.lwn.net ([45.79.88.28]:55706 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725904AbeKUCz3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 20 Nov 2018 21:55:29 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CDDD635A;
        Tue, 20 Nov 2018 16:25:31 +0000 (UTC)
Date:   Tue, 20 Nov 2018 09:25:30 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-doc@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] docs/mm: update kmalloc kernel-doc description
Message-ID: <20181120092530.5620a924@lwn.net>
In-Reply-To: <1541954924-21471-1-git-send-email-rppt@linux.ibm.com>
References: <1541954924-21471-1-git-send-email-rppt@linux.ibm.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 11 Nov 2018 18:48:44 +0200
Mike Rapoport <rppt@linux.ibm.com> wrote:

> Add references to GFP documentation and the memory-allocation.rst and remove
> GFP_USER, GFP_DMA and GFP_NOIO descriptions.
> 
> While on it slightly change the formatting so that the list of GFP flags
> will be rendered as "description" in the generated html.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
> 
> Probably this should go via the -mm tree as it touches include/linux/slab.h

A week and some later it's not there - Andrew is even slower than me, it
seems! :)  So I went ahead and applied it, fixing the conflict over the
addition of the memory_allocation label while I was at it.

Thanks,

jon
