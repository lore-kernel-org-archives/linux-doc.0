Return-Path: <SRS0=OmAX=5X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36931C2BB85
	for <linux-doc@archiver.kernel.org>; Tue,  7 Apr 2020 19:30:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0BD8E20730
	for <linux-doc@archiver.kernel.org>; Tue,  7 Apr 2020 19:30:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgDGTau (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Apr 2020 15:30:50 -0400
Received: from ms.lwn.net ([45.79.88.28]:40568 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726339AbgDGTau (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 7 Apr 2020 15:30:50 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 14C43728;
        Tue,  7 Apr 2020 19:30:50 +0000 (UTC)
Date:   Tue, 7 Apr 2020 13:30:49 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jimmy Assarsson <jimmyassarsson@gmail.com>
Cc:     linux-doc@vger.kernel.org,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Subject: Re: [PATCH 1/2] docs: kernel-parameters.txt: Remove nompx
Message-ID: <20200407133049.56fa05f1@lwn.net>
In-Reply-To: <20200402172614.3020-1-jimmyassarsson@gmail.com>
References: <20200402172614.3020-1-jimmyassarsson@gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu,  2 Apr 2020 19:26:13 +0200
Jimmy Assarsson <jimmyassarsson@gmail.com> wrote:

> x86/mpx was removed in commit 45fc24e89b7c
> ("x86/mpx: remove MPX from arch/x86"), this removes the documentation of
> parameter nompx.
> 
> Fixes: 45fc24e89b7c ("x86/mpx: remove MPX from arch/x86")
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Jimmy Assarsson <jimmyassarsson@gmail.com>

Both patches applied, thanks.

jon
