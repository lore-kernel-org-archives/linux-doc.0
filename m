Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC460C433DB
	for <linux-doc@archiver.kernel.org>; Sat, 30 Jan 2021 09:09:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 726A564DE2
	for <linux-doc@archiver.kernel.org>; Sat, 30 Jan 2021 09:09:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbhA3JIt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 30 Jan 2021 04:08:49 -0500
Received: from isilmar-4.linta.de ([136.243.71.142]:56112 "EHLO
        isilmar-4.linta.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233864AbhA3JIH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 30 Jan 2021 04:08:07 -0500
X-Greylist: delayed 530 seconds by postgrey-1.27 at vger.kernel.org; Sat, 30 Jan 2021 04:07:49 EST
Received: by isilmar-4.linta.de (Postfix, from userid 1000)
        id 4BCA3200EB0; Sat, 30 Jan 2021 07:18:25 +0000 (UTC)
Date:   Sat, 30 Jan 2021 08:18:25 +0100
From:   Dominik Brodowski <linux@dominikbrodowski.net>
To:     =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@collabora.com>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] docs: Make syscalls' helpers naming consistent
Message-ID: <20210130071825.GA26647@isilmar-4.linta.de>
References: <20210130014547.123006-1-andrealmeid@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210130014547.123006-1-andrealmeid@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 29, 2021 at 10:45:46PM -0300, André Almeida wrote:
> The documentation explains the need to create internal syscalls' helpers,
> and that they should be called `kern_xyzzy()`. However, the comment at
> include/linux/syscall.h says that they should be named as
> `ksys_xyzzy()`, and so are all the helpers declared bellow it. Change the
> documentation to reflect this.
> 
> Cc: Dominik Brodowski <linux@dominikbrodowski.net>
> Fixes: 819671ff849b ("syscalls: define and explain goal to not call syscalls in the kernel")
> Signed-off-by: André Almeida <andrealmeid@collabora.com>

Reviewed-by: Dominik Brodowski <linux@dominikbrodowski.net>

Thanks,
	Dominik
