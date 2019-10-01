Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D44927D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue,  1 Oct 2019 13:14:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbfJANOM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 1 Oct 2019 09:14:12 -0400
Received: from ms.lwn.net ([45.79.88.28]:36738 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726086AbfJANOM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 1 Oct 2019 09:14:12 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E782E491;
        Tue,  1 Oct 2019 13:14:11 +0000 (UTC)
Date:   Tue, 1 Oct 2019 07:14:10 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        schwab@suse.de
Subject: Re: [PATCH] Documentation: document earlycon without options for
 more platforms
Message-ID: <20191001071410.4e89e079@lwn.net>
In-Reply-To: <20190916070316.7371-1-hch@lst.de>
References: <20190916070316.7371-1-hch@lst.de>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 16 Sep 2019 09:03:16 +0200
Christoph Hellwig <hch@lst.de> wrote:

> The earlycon options without arguments is supposed on all device
> tree platforms, not just arm64.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Applied (finally), thanks.

jon
