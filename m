Return-Path: <SRS0=WlwM=BC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C4EC433E0
	for <linux-doc@archiver.kernel.org>; Thu, 23 Jul 2020 20:40:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB5FF20714
	for <linux-doc@archiver.kernel.org>; Thu, 23 Jul 2020 20:40:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbgGWUkL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Jul 2020 16:40:11 -0400
Received: from ms.lwn.net ([45.79.88.28]:42594 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725979AbgGWUkL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 23 Jul 2020 16:40:11 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 168312BA;
        Thu, 23 Jul 2020 20:40:11 +0000 (UTC)
Date:   Thu, 23 Jul 2020 14:40:09 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tao Zhou <ouwen210@hotmail.com>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc/zh_CN: add cpu-load Chinese version
Message-ID: <20200723144009.2f85578e@lwn.net>
In-Reply-To: <BL0PR14MB37791BB5BC0E7224102B686A9A7C0@BL0PR14MB3779.namprd14.prod.outlook.com>
References: <BL0PR14MB37791BB5BC0E7224102B686A9A7C0@BL0PR14MB3779.namprd14.prod.outlook.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 17 Jul 2020 12:58:48 +0800
Tao Zhou <ouwen210@hotmail.com> wrote:

> Add cpu-load Chinese version and link it into admin-guide.
> Based on Alex's recent thread:
> 
>   https://lkml.kernel.org/r/20200713115807.56362-1-alex.shi@linux.alibaba.com
> 
> Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>
> Signed-off-by: Tao Zhou <ouwen210@hotmail.com>
> ---
>  .../zh_CN/admin-guide/cpu-load.rst            | 105 ++++++++++++++++++
>  .../translations/zh_CN/admin-guide/index.rst  |   2 +-
>  2 files changed, 106 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/cpu-load.rst

So I get "corrupt patch" errors when I try to apply this.  Could I ask you
please to regenerate it, send it to yourself, and verify that you can
apply it, then resend to me?

Thanks,

jon
