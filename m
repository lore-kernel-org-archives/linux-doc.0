Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2EEFF7D09D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 May 2018 12:41:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933653AbeE2MlT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 May 2018 08:41:19 -0400
Received: from ms.lwn.net ([45.79.88.28]:34716 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933565AbeE2MlS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 29 May 2018 08:41:18 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CEBCD2C0;
        Tue, 29 May 2018 12:41:17 +0000 (UTC)
Date:   Tue, 29 May 2018 06:41:15 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Omar Sandoval <osandov@osandov.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-team@fb.com
Subject: Re: [PATCH] Documentation: document hung_task_panic kernel
 parameter
Message-ID: <20180529064115.6ed0a00f@lwn.net>
In-Reply-To: <53ad4158547699c2d35ba817394750dc2487158a.1526926625.git.osandov@fb.com>
References: <53ad4158547699c2d35ba817394750dc2487158a.1526926625.git.osandov@fb.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 21 May 2018 11:18:17 -0700
Omar Sandoval <osandov@osandov.com> wrote:

> This parameter has been around since commit e162b39a368f ("softlockup:
> decouple hung tasks check from softlockup detection") in 2009 but was
> never documented.
> 
> Signed-off-by: Omar Sandoval <osandov@fb.com>

Applied, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
