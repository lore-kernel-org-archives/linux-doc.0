Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EE7B17D2EE
	for <lwn-linux-doc@archive.lwn.net>; Fri, 31 Aug 2018 22:24:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbeIACdf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 31 Aug 2018 22:33:35 -0400
Received: from ms.lwn.net ([45.79.88.28]:33870 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727261AbeIACde (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 31 Aug 2018 22:33:34 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id F00FA2B0;
        Fri, 31 Aug 2018 22:23:58 +0000 (UTC)
Date:   Fri, 31 Aug 2018 16:23:43 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Baoquan He <bhe@redhat.com>
Cc:     jglisse@redhat.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/vm/hmm.rst: Add missed space
Message-ID: <20180831162343.1bf2fa31@lwn.net>
In-Reply-To: <20180831080119.6522-1-bhe@redhat.com>
References: <20180831080119.6522-1-bhe@redhat.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 31 Aug 2018 16:01:19 +0800
Baoquan He <bhe@redhat.com> wrote:

> This space missing caused the colour scheme in vim editor messy
> after that line. Add it to fix.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>

I'm all in favor of non-messy color schemes - and for consistent
alignment in general.  To that end, I took the liberty of fixing the rest
of the lines after the one you changed.

Applied, thanks.

jon
