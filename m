Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 040E87D088
	for <lwn-linux-doc@archive.lwn.net>; Fri, 19 Oct 2018 13:18:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727189AbeJSVYY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 19 Oct 2018 17:24:24 -0400
Received: from ms.lwn.net ([45.79.88.28]:50804 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727104AbeJSVYY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 19 Oct 2018 17:24:24 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A1DB87F5;
        Fri, 19 Oct 2018 13:18:18 +0000 (UTC)
Date:   Fri, 19 Oct 2018 07:18:16 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Will Korteland <will@korte.land>
Cc:     gregkh@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs/uio: fix a grammar nitpick
Message-ID: <20181019071816.07e80ed5@lwn.net>
In-Reply-To: <fa74b1f965d5a33d708f74d9fe8d7517@korte.land>
References: <7e426c03c0e342ade7ce86a977ef13b2@korte.land>
        <20181018123126.3e59c3fd@lwn.net>
        <fa74b1f965d5a33d708f74d9fe8d7517@korte.land>
Organization: LWN.net
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 19 Oct 2018 10:55:58 +0000 (UTC)
Will Korteland <will@korte.land> wrote:

> Thanks for
> the pointer to the email docs, but unfortunately my client isn't covered
> there. Still, I've used it as a guide for the kind of settings I need,
> hopefully my patches won't get mangled from now on.

When you figure out what's needed to bring your client into line, I would
more than welcome a patch to email-clients.rst providing the necessary
information for the next person who comes along!

Thanks,

jon
