Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4A6C97DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 15:19:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755059AbeEHPTK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 May 2018 11:19:10 -0400
Received: from ms.lwn.net ([45.79.88.28]:35562 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752228AbeEHPTK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 8 May 2018 11:19:10 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 8FE2B318;
        Tue,  8 May 2018 15:19:08 +0000 (UTC)
Date:   Tue, 8 May 2018 09:19:06 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        axboe <axboe@kernel.dk>, LKML <linux-kernel@vger.kernel.org>,
        Cai Zhiyong <caizhiyong@huawei.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] Documentation: block: cmdline-partition.txt fixes and
 additions
Message-ID: <20180508091906.7d085bf4@lwn.net>
In-Reply-To: <dba389fc-2745-34b1-e33e-fc83f53eaf42@infradead.org>
References: <dba389fc-2745-34b1-e33e-fc83f53eaf42@infradead.org>
Organization: LWN.net
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 6 May 2018 11:50:29 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> Make the description of the kernel command line option "blkdevparts"
> a bit more flowing and readable.
> 
> Fix a few typos.
> Add the optional <size> and <offset> suffixes.
> Note that size can be "-" to indicate all of the remaining space.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Applied, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
