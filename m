Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 42F267D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon,  1 Apr 2019 21:01:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfDAVBw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 1 Apr 2019 17:01:52 -0400
Received: from ms.lwn.net ([45.79.88.28]:40668 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725878AbfDAVBv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 1 Apr 2019 17:01:51 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4E3777DE;
        Mon,  1 Apr 2019 21:01:51 +0000 (UTC)
Date:   Mon, 1 Apr 2019 15:01:50 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Joe Perches <joe@perches.com>
Cc:     Nick Crews <ncrews@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] coding-style.rst: Generic alloc functions do not need
 OOM logging
Message-ID: <20190401150150.23d2a0f0@lwn.net>
In-Reply-To: <5d7229de06286b4ec06daee3411e39e9b638d66c.camel@perches.com>
References: <5d7229de06286b4ec06daee3411e39e9b638d66c.camel@perches.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 30 Mar 2019 10:25:03 -0700
Joe Perches <joe@perches.com> wrote:

> Generic allocation functions already emit a dump_stack()
> so additional error logging isn't useful.
> 
> Document it as such and add a reference to the allocation
> API.
> 
> Signed-off-by: Joe Perches <joe@perches.com>

Applied, thanks.

jon
