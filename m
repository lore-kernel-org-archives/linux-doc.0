Return-Path: <SRS0=VSGv=6E=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCFCC54FCB
	for <linux-doc@archiver.kernel.org>; Mon, 20 Apr 2020 23:15:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 558A520B1F
	for <linux-doc@archiver.kernel.org>; Mon, 20 Apr 2020 23:15:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgDTXPq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Apr 2020 19:15:46 -0400
Received: from ms.lwn.net ([45.79.88.28]:54286 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726006AbgDTXPp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 20 Apr 2020 19:15:45 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 650DF536;
        Mon, 20 Apr 2020 23:15:45 +0000 (UTC)
Date:   Mon, 20 Apr 2020 17:15:44 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Ricardo =?UTF-8?B?Q2HDsXVlbG8=?= <ricardo.canuelo@collabora.com>
Cc:     linux-doc@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v3] docs: pr_*() kerneldocs and basic printk docs
Message-ID: <20200420171544.3c443e36@lwn.net>
In-Reply-To: <20200403093617.18003-1-ricardo.canuelo@collabora.com>
References: <20200403093617.18003-1-ricardo.canuelo@collabora.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri,  3 Apr 2020 11:36:17 +0200
Ricardo Cañuelo <ricardo.canuelo@collabora.com> wrote:

> Add kerneldocs comments to the pr_*() macros in printk.h.
> 
> Add a new rst node in the core-api manual describing the basic usage of
> printk and the related macro aliases.
> 
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
> ---
> Changes in v3:
> - @... varargs documentation in printk.h kerneldocs
> - Group all printk.h function references in a single <.. kernel-doc> ref in
>   printk-formats.rst
> 
>  Documentation/core-api/index.rst          |   1 +
>  Documentation/core-api/printk-basics.rst  | 115 ++++++++++++++++++++++
>  Documentation/core-api/printk-formats.rst |   2 +
>  include/linux/printk.h                    | 112 ++++++++++++++++++---
>  4 files changed, 218 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/core-api/printk-basics.rst

I've applied this, thanks.

jon
