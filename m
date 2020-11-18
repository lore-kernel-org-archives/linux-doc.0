Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC4EC6369E
	for <linux-doc@archiver.kernel.org>; Wed, 18 Nov 2020 16:27:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73B5824818
	for <linux-doc@archiver.kernel.org>; Wed, 18 Nov 2020 16:27:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbgKRQ1d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Nov 2020 11:27:33 -0500
Received: from ms.lwn.net ([45.79.88.28]:45438 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726039AbgKRQ1d (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Nov 2020 11:27:33 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A618835A;
        Wed, 18 Nov 2020 16:27:31 +0000 (UTC)
Date:   Wed, 18 Nov 2020 09:27:30 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Eduardo Habkost <ehabkost@redhat.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC] Add kernel-doc test script
Message-ID: <20201118092730.32a3920c@lwn.net>
In-Reply-To: <20201117223612.GN1235237@habkost.net>
References: <20201030144713.201372-1-pbonzini@redhat.com>
        <20201030144713.201372-3-pbonzini@redhat.com>
        <20201113152106.7b4a07ee@lwn.net>
        <20201113223912.GK17076@casper.infradead.org>
        <20201117212452.GM1235237@habkost.net>
        <20201117213051.GA29991@casper.infradead.org>
        <20201117223612.GN1235237@habkost.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 17 Nov 2020 17:36:12 -0500
Eduardo Habkost <ehabkost@redhat.com> wrote:

> Add a kernel-doc test script to tools/testing/kernel-doc.
> 
> radix_tree_lookup_slot test case provided by Matthew Wilcox.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  tools/testing/kernel-doc/test-case.h          | 111 ++++++++++
>  .../testing/kernel-doc/test-case.man.expected | 150 ++++++++++++++
>  .../kernel-doc/test-case.none.expected        |   0
>  .../kernel-doc/test-case.rst2.expected        | 195 ++++++++++++++++++
>  .../kernel-doc/test-case.rst3.expected        | 195 ++++++++++++++++++
>  tools/testing/kernel-doc/test.sh              |  90 ++++++++
>  6 files changed, 741 insertions(+)
>  create mode 100644 tools/testing/kernel-doc/test-case.h
>  create mode 100644 tools/testing/kernel-doc/test-case.man.expected
>  create mode 100644 tools/testing/kernel-doc/test-case.none.expected
>  create mode 100644 tools/testing/kernel-doc/test-case.rst2.expected
>  create mode 100644 tools/testing/kernel-doc/test-case.rst3.expected
>  create mode 100755 tools/testing/kernel-doc/test.sh

Seems like a good thing to have overall.

I do worry a bit that the test will be sensitive to *any* change to
kernel-doc output, including formatting changes that might be deliberate.
But if that turns out to be a problem in the real world, we can deal with
it then.

Thanks,

jon
