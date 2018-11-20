Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 14C697D089
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Nov 2018 16:18:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbeKUCr7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Nov 2018 21:47:59 -0500
Received: from ms.lwn.net ([45.79.88.28]:55662 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725876AbeKUCr6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 20 Nov 2018 21:47:58 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 2DB0235A;
        Tue, 20 Nov 2018 16:18:04 +0000 (UTC)
Date:   Tue, 20 Nov 2018 09:18:03 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Mike Rapoport <rppt@linux.ibm.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Link the memory allocation guide from the MM docs
Message-ID: <20181120091803.29db8b4e@lwn.net>
In-Reply-To: <20181119160049.GC394@bombadil.infradead.org>
References: <20181119160049.GC394@bombadil.infradead.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 19 Nov 2018 08:00:49 -0800
Matthew Wilcox <willy@infradead.org> wrote:

> I just went looking for the memory allocation guide in the MM docs instead
> of in the core API.  For the benefit of the next person who makes that
> mistake, link to it from the MM docs.
> 
> Signed-off-by: Matthew Wilcox <willy@infradead.org>

Applied, thanks.

jon
