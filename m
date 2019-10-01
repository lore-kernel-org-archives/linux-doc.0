Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0802F7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue,  1 Oct 2019 12:47:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbfJAMre (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 1 Oct 2019 08:47:34 -0400
Received: from ms.lwn.net ([45.79.88.28]:36388 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726464AbfJAMre (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 1 Oct 2019 08:47:34 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 200D06A2;
        Tue,  1 Oct 2019 12:47:34 +0000 (UTC)
Date:   Tue, 1 Oct 2019 06:47:33 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     bhenryj0117@gmail.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] docs: security: fix section hyperlink
Message-ID: <20191001064733.36f65170@lwn.net>
In-Reply-To: <20190925101745.3645-1-bhenryj0117@gmail.com>
References: <20190925101745.3645-1-bhenryj0117@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 25 Sep 2019 17:17:44 +0700
bhenryj0117@gmail.com wrote:

> From: Brendan Jackman <bhenryj0117@gmail.com>
> 
> The reStructuredText syntax is wrong here; not sure how it was
> intended but we can just use the section header as an implicit
> hyperlink target, with a single "outward" underscore.
> 
> Signed-off-by: Brendan Jackman <bhenryj0117@gmail.com>

Applied, thanks.

jon
