Return-Path: <SRS0=A0dr=DB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42329C4363D
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 16:45:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 098A420936
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 16:45:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727153AbgIXQpy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Sep 2020 12:45:54 -0400
Received: from ms.lwn.net ([45.79.88.28]:59212 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727330AbgIXQpy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 24 Sep 2020 12:45:54 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id EEC5D77D;
        Thu, 24 Sep 2020 16:45:51 +0000 (UTC)
Date:   Thu, 24 Sep 2020 10:45:49 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     <keescook@chromium.org>, <anton@enomsg.org>, <ccross@android.com>,
        <tony.luck@intel.com>, <paulmck@kernel.org>, <tglx@linutronix.de>,
        <akpm@linux-foundation.org>, <bp@suse.de>,
        <mchehab+huawei@kernel.org>, <pawan.kumar.gupta@linux.intel.com>,
        <rdunlap@infradead.org>, <mike.kravetz@oracle.com>,
        <oneukum@suse.com>, <gpiccoli@canonical.com>,
        <linux-doc@vger.kernel.org>, <linuxarm@huawei.com>
Subject: Re: [PATCH v2] Documentation: Remove CMA's dependency on
 architecture
Message-ID: <20200924104549.0e77e40d@lwn.net>
In-Reply-To: <1600412758-60545-1-git-send-email-tiantao6@hisilicon.com>
References: <1600412758-60545-1-git-send-email-tiantao6@hisilicon.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 18 Sep 2020 15:05:58 +0800
Tian Tao <tiantao6@hisilicon.com> wrote:

> CMA only depends on MMU. It doesn't depend on arch too much. such as ARM,
> ARM64, X86, MIPS etc. so We remove the dependency of cma about the
> architecture in kernel-parameters.txt.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Applied, thanks.  One small request, though:

> v2:
> rewrite the patch, patch name, commit messages.
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

The "v2:" information should appear after the "---" line so I don't have
to edit it out manually.

Thanks,

jon
