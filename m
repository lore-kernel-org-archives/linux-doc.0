Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 496757DF83
	for <lwn-linux-doc@archive.lwn.net>; Tue, 10 Jul 2018 21:14:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732440AbeGJVNY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 10 Jul 2018 17:13:24 -0400
Received: from ms.lwn.net ([45.79.88.28]:35430 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732274AbeGJVNY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 10 Jul 2018 17:13:24 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9E737866;
        Tue, 10 Jul 2018 21:12:30 +0000 (UTC)
Date:   Tue, 10 Jul 2018 15:12:28 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yohan Pipereau <yohan.pipereau@gmail.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation : Update relay function types
Message-ID: <20180710151228.09901804@lwn.net>
In-Reply-To: <d8f47b2d-dd39-ba65-8c4e-149718aea5bf@gmail.com>
References: <d8f47b2d-dd39-ba65-8c4e-149718aea5bf@gmail.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 8 Jul 2018 20:19:32 +0200
Yohan Pipereau <yohan.pipereau@gmail.com> wrote:

> This patch updates two callback functions provided as an example in
> relay API documentation : subbuf_start and create_buf_file_handler.
> 
> These functions were using older and incorrect types causing an
> "initialization from incompatible pointer type".

Heh, nobody has seriously touched that file in ten years.  Patch applied,
but...

> diffstat for this patch is:
>  relay.txt |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Please include information like this after the "---" line so I don't have
to edit it out of the changelog manually.  

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
