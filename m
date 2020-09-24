Return-Path: <SRS0=A0dr=DB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_TONAME_EQ_TOLOCAL_SHORT,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3735C4363D
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 16:44:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E02720738
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 16:44:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbgIXQoD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Sep 2020 12:44:03 -0400
Received: from ms.lwn.net ([45.79.88.28]:59198 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726645AbgIXQoD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 24 Sep 2020 12:44:03 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A14022CB;
        Thu, 24 Sep 2020 16:44:02 +0000 (UTC)
Date:   Thu, 24 Sep 2020 10:43:57 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     lijiang <lijiang@redhat.com>
Cc:     linux-kernel@vger.kernel.org, bhe@redhat.com,
        kexec@lists.infradead.org, linux-doc@vger.kernel.org,
        vgoyal@redhat.com
Subject: Re: [PATCH v2] docs: admin-guide: update kdump documentation due to
 change of crash URL
Message-ID: <20200924104357.7729210e@lwn.net>
In-Reply-To: <a088bff5-1174-25fa-ac26-6e46795f4085@redhat.com>
References: <20200918080958.19841-1-lijiang@redhat.com>
        <a088bff5-1174-25fa-ac26-6e46795f4085@redhat.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 24 Sep 2020 09:56:02 +0800
lijiang <lijiang@redhat.com> wrote:

> Since crash utility has been moved to github, the original URL is no
> longer available. Let's update it accordingly.
> 
> Suggested-by: Dave Young <dyoung@redhat.com>
> Signed-off-by: Lianbo Jiang <lijiang@redhat.com>
> ---
>  Documentation/admin-guide/kdump/kdump.rst | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied, thanks.

jon
