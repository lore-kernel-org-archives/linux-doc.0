Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 65F3A7D917
	for <lwn-linux-doc@archive.lwn.net>; Fri, 19 Apr 2019 18:50:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727351AbfDSSsi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 19 Apr 2019 14:48:38 -0400
Received: from ms.lwn.net ([45.79.88.28]:40202 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbfDSSsi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 19 Apr 2019 14:48:38 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 53A34537;
        Fri, 19 Apr 2019 18:48:37 +0000 (UTC)
Date:   Fri, 19 Apr 2019 12:48:36 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yang Shi <yang.shi@linux.alibaba.com>
Cc:     mhocko@suse.com, kirill.shutemov@linux.intel.com, ziy@nvidia.com,
        rppt@linux.vnet.ibm.com, akpm@linux-foundation.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc: mm: migration doesn't use FOLL_SPLIT anymore
Message-ID: <20190419124836.0800991f@lwn.net>
In-Reply-To: <1555618624-23957-1-git-send-email-yang.shi@linux.alibaba.com>
References: <1555618624-23957-1-git-send-email-yang.shi@linux.alibaba.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 19 Apr 2019 04:17:04 +0800
Yang Shi <yang.shi@linux.alibaba.com> wrote:

> When demonstrating FOLL_SPLIT in transhuge document, migration is used
> as an example.  But, since commit 94723aafb9e7 ("mm: unclutter THP
> migration"), the way of THP migration is totally changed.  FOLL_SPLIT is
> not used by migration anymore due to the change.
> 
> Remove the obsolete example to avoid confusion.
> 
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
> Signed-off-by: Yang Shi <yang.shi@linux.alibaba.com>

Applied, thanks.

jon
