Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 54BE67D0DA
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Mar 2018 15:09:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752532AbeCUPJw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Mar 2018 11:09:52 -0400
Received: from ms.lwn.net ([45.79.88.28]:49964 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752539AbeCUPJu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 21 Mar 2018 11:09:50 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BA3EB536;
        Wed, 21 Mar 2018 15:09:49 +0000 (UTC)
Date:   Wed, 21 Mar 2018 09:09:48 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] kernel-doc: Remove __sched markings
Message-ID: <20180321090948.03f03087@lwn.net>
In-Reply-To: <20180315120623.GB9949@bombadil.infradead.org>
References: <20180315120623.GB9949@bombadil.infradead.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 15 Mar 2018 05:06:23 -0700
Matthew Wilcox <willy@infradead.org> wrote:

> I find the __sched annotations unaesthetic in the kernel-doc.  Remove
> them like we remove __inline, __weak, __init and so on.

Makes sense, applied, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
