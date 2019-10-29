Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 029247D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Oct 2019 09:21:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727560AbfJ2JVf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Oct 2019 05:21:35 -0400
Received: from ms.lwn.net ([45.79.88.28]:43994 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727257AbfJ2JVf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 29 Oct 2019 05:21:35 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7CA2B739;
        Tue, 29 Oct 2019 09:21:34 +0000 (UTC)
Date:   Tue, 29 Oct 2019 03:21:30 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     =?UTF-8?B?SMOpY3RvciBPcsOzbiBNYXJ0w61uZXo=?= 
        <hector.oron@gmail.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: fix warnings for unused files in toctree
Message-ID: <20191029032130.444c6fce@lwn.net>
In-Reply-To: <CAODfWeH67_ZfO7yrrQ+EcFgXd8stA23y6hUtimhzEbXvWmjhbw@mail.gmail.com>
References: <CAODfWeEohxJYW1w9g5u8G7RV+OKDqycWw0uEEqRoTQCVvfvKjw@mail.gmail.com>
        <CAODfWeH67_ZfO7yrrQ+EcFgXd8stA23y6hUtimhzEbXvWmjhbw@mail.gmail.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 28 Oct 2019 18:26:09 +0100
Héctor Orón Martínez <hector.oron@gmail.com> wrote:

>   I was planning to add more fixes in separated commit, but while
> working on it, apparently it could be part of the previous commit.
>   Apologies, find updated patch.

Thanks for working to improve the documentation!  I do have a couple of
requests, though...

 - Please send patches inline, rather than as attachments; that makes
   them much easier to review.

 - Please work against docs-next and look at the history of what you are
   working on. For example:

> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> index b541e97c7ab1..d2f3c95ea9ed 100644
> --- a/Documentation/driver-api/dma-buf.rst
> +++ b/Documentation/driver-api/dma-buf.rst
> @@ -115,18 +115,6 @@ Kernel Functions and Structures Reference
>  .. kernel-doc:: include/linux/dma-buf.h
>     :internal:
>  
> -Reservation Objects
> --------------------
> -
> -.. kernel-doc:: drivers/dma-buf/reservation.c
> -   :doc: Reservation Object Overview
> -
> -.. kernel-doc:: drivers/dma-buf/reservation.c
> -   :export:
> -
> -.. kernel-doc:: include/linux/reservation.h
> -   :internal:

This is not a correct fix; those files have been renamed, not removed.
There is a (correct) fix in docs-next, and has been for some weeks now.

If you could please review the rest of your patch and resubmit against
docs-next, I would appreciate it.

Many thanks,

jon
