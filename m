Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3689F7D08A
	for <lwn-linux-doc@archive.lwn.net>; Sat, 27 Apr 2019 18:42:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbfD0SmM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 27 Apr 2019 14:42:12 -0400
Received: from casper.infradead.org ([85.118.1.10]:52622 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725942AbfD0SmM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 27 Apr 2019 14:42:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Mu+jtxl8QJFERxk7BjYpouVnY66evnSpJ3ehj9Zzgqo=; b=Su4BXtsbGF2CAKVmeqA2kvfq/q
        WlRzMG5gKMSOGUtG+082U/KDSTRBTimGoHG/GN7qUpMjNBo+ZAeiu522/bFrGCTY1Da/My0JL5nq3
        XUMM5x3FXYagOlwXtOUmZLgfmTtrLcia4mlZz/Gl+8awbicCvvsZQF2lgCeyn1aRQjjvqtWSnfIRs
        BGkwX5tXXvF4TTbjT5Q1htU0kBZ3CM77CFtTJ0DjDnloGr+W3AFlfhohMleCy820OoG9M/Zeh6UHX
        KsaMnuUh5eYntyJp/mEOcD4jcOMMPtwrDzIPEWmGh/qMe7jl9A9XnsAEv8Nx1JwWzAmUbU5aF5qfz
        e0K8eGRg==;
Received: from 177.17.250.151.dynamic.adsl.gvt.net.br ([177.17.250.151] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hKSH1-0005OL-Ak; Sat, 27 Apr 2019 18:42:07 +0000
Date:   Sat, 27 Apr 2019 15:42:02 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Changbin Du <changbin.du@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 27/27] Documentation: x86: convert x86_64/machinecheck
 to reST
Message-ID: <20190427154202.2b25c281@coco.lan>
In-Reply-To: <20190426153150.21228-28-changbin.du@gmail.com>
References: <20190426153150.21228-1-changbin.du@gmail.com>
        <20190426153150.21228-28-changbin.du@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Fri, 26 Apr 2019 23:31:50 +0800
Changbin Du <changbin.du@gmail.com> escreveu:

> This converts the plain text documentation to reStructuredText format and
> add it to Sphinx TOC tree. No essential content change.
> 
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  Documentation/x86/x86_64/index.rst                    |  1 +
>  .../x86/x86_64/{machinecheck => machinecheck.rst}     | 11 ++++++-----
>  2 files changed, 7 insertions(+), 5 deletions(-)
>  rename Documentation/x86/x86_64/{machinecheck => machinecheck.rst} (92%)
> 
> diff --git a/Documentation/x86/x86_64/index.rst b/Documentation/x86/x86_64/index.rst
> index c04b6eab3c76..d6eaaa5a35fc 100644
> --- a/Documentation/x86/x86_64/index.rst
> +++ b/Documentation/x86/x86_64/index.rst
> @@ -13,3 +13,4 @@ x86_64 Support
>     5level-paging
>     fake-numa-for-cpusets
>     cpu-hotplug-spec
> +   machinecheck
> diff --git a/Documentation/x86/x86_64/machinecheck b/Documentation/x86/x86_64/machinecheck.rst
> similarity index 92%
> rename from Documentation/x86/x86_64/machinecheck
> rename to Documentation/x86/x86_64/machinecheck.rst
> index d0648a74fceb..8e9d2d529a8d 100644
> --- a/Documentation/x86/x86_64/machinecheck
> +++ b/Documentation/x86/x86_64/machinecheck.rst
> @@ -1,5 +1,8 @@
> +.. SPDX-License-Identifier: GPL-2.0
>  
> -Configurable sysfs parameters for the x86-64 machine check code.
> +===============================================================
> +Configurable sysfs parameters for the x86-64 machine check code
> +===============================================================
>  
>  Machine checks report internal hardware error conditions detected
>  by the CPU. Uncorrected errors typically cause a machine check
> @@ -16,14 +19,12 @@ log then mcelog should run to collect and decode machine check entries
>  from /dev/mcelog. Normally mcelog should be run regularly from a cronjob.
>  
>  Each CPU has a directory in /sys/devices/system/machinecheck/machinecheckN
> -(N = CPU number)
> +(N = CPU number).
>  
>  The directory contains some configurable entries:
>  
> -Entries:
> -
>  bankNctl
> -(N bank number)
> +	(N bank number)

Hmm.. I would add a blank line here.

After such change:

Reviewed-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

>  	64bit Hex bitmask enabling/disabling specific subevents for bank N
>  	When a bit in the bitmask is zero then the respective
>  	subevent will not be reported.



Thanks,
Mauro
