Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6E9BB7D57F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 13 Sep 2018 22:41:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbeINDxA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 13 Sep 2018 23:53:00 -0400
Received: from ms.lwn.net ([45.79.88.28]:48224 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727383AbeINDxA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 13 Sep 2018 23:53:00 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BC72E2D8;
        Thu, 13 Sep 2018 22:41:28 +0000 (UTC)
Date:   Thu, 13 Sep 2018 16:41:27 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mike Rapoport <rppt@linux.vnet.ibm.com>
Cc:     Michal Hocko <mhocko@suse.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Matthew Wilcox <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] docs: core-api: add memory allocation guide
Message-ID: <20180913164127.4e44045f@lwn.net>
In-Reply-To: <20180912103305.GC6719@rapoport-lnx>
References: <1534517236-16762-1-git-send-email-rppt@linux.vnet.ibm.com>
        <1534517236-16762-4-git-send-email-rppt@linux.vnet.ibm.com>
        <20180911115555.5fce5631@lwn.net>
        <20180912103305.GC6719@rapoport-lnx>
Organization: LWN.net
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 12 Sep 2018 13:33:06 +0300
Mike Rapoport <rppt@linux.vnet.ibm.com> wrote:

> How about:
> 
>     ``GFP_HIGHUSER_MOVABLE`` does not require that allocated memory
>     will be directly accessible by the kernel and implies that the
>     data is movable.
> 
>     ``GFP_HIGHUSER`` means that the allocated memory is not movable,
>     but it is not required to be directly accessible by the kernel. An
>     example may be a hardware allocation that maps data directly into
>     userspace but has no addressing limitations.
> 
>     ``GFP_USER`` means that the allocated memory is not movable and it
>     must be directly accessible by the kernel

Sounds good to me.

Thanks,

jon
