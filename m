Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1DAA97D043
	for <lwn-linux-doc@archive.lwn.net>; Tue, 26 Jun 2018 14:41:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933794AbeFZOlt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 26 Jun 2018 10:41:49 -0400
Received: from ms.lwn.net ([45.79.88.28]:35232 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933120AbeFZOlt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 26 Jun 2018 10:41:49 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9A28B2D5;
        Tue, 26 Jun 2018 14:41:48 +0000 (UTC)
Date:   Tue, 26 Jun 2018 08:41:47 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Tim Bird <tbird20d@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation/process: fix reST table border error
Message-ID: <20180626084147.26c0c188@lwn.net>
In-Reply-To: <727cda41-e8e5-06f5-ae54-3e91571fa6ac@infradead.org>
References: <727cda41-e8e5-06f5-ae54-3e91571fa6ac@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 16 Jun 2018 19:02:03 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> Fix reST error in Documentation/process/:
> 
> Documentation/process/2.Process.rst:131: ERROR: Malformed table.
> Bottom/header table border does not match top border.
> 
> Fixes: 8962e40c1993 ("docs: update kernel versions and dates in tables")
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Tim Bird <tbird20d@gmail.com>

Applied, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
