Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E4C2C7D089
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Dec 2018 18:32:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbeLJSck (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Dec 2018 13:32:40 -0500
Received: from mail.skyhub.de ([5.9.137.197]:58424 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728191AbeLJSck (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 10 Dec 2018 13:32:40 -0500
Received: from zn.tnic (p200300EC2BCAD0009567F52EDB121050.dip0.t-ipconnect.de [IPv6:2003:ec:2bca:d000:9567:f52e:db12:1050])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 2346E1EC0B1A;
        Mon, 10 Dec 2018 19:32:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1544466758;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=AnYQxsLg5VLYWmdi1oAOl6F1M7J8PNaU8ra3mMt6E14=;
        b=bFVRFebkcKmTz/0nqijmCluZ/7Vi+valJqfkmk/tyMBuFCysvBzOzP2kGSFg6d8fsC2JWh
        yDs6r+J/25stHBQNgeRIFO2pdPI5jDyzvAjch4JKL3FHY3VDO7eE9LNfTqP2he/uYTIHm9
        iLM5oWPaxrCaydLMNzh0j0ExNpBs2wg=
Date:   Mon, 10 Dec 2018 19:32:21 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Kazuhito Hagio <k-hagio@ab.jp.nec.com>
Cc:     lijiang <lijiang@redhat.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "bhe@redhat.com" <bhe@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "x86@kernel.org" <x86@kernel.org>,
        "kexec@lists.infradead.org" <kexec@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "dyoung@redhat.com" <dyoung@redhat.com>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/2 v2] kdump: add the vmcoreinfo documentation
Message-ID: <20181210183221.GA5482@zn.tnic>
References: <20181202030839.29945-1-lijiang@redhat.com>
 <20181202030839.29945-2-lijiang@redhat.com>
 <20181203150809.GA4794@zn.tnic>
 <779dbae7-f6e2-e9e4-bdd0-0a9e6ec62487@redhat.com>
 <20181205113032.GF29510@zn.tnic>
 <3d1a7e68-34c5-d118-fe09-7c9bc14cce84@redhat.com>
 <4AE2DC15AC0B8543882A74EA0D43DBEC0356426E@BPXM09GP.gisp.nec.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4AE2DC15AC0B8543882A74EA0D43DBEC0356426E@BPXM09GP.gisp.nec.co.jp>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 05, 2018 at 08:29:14PM +0000, Kazuhito Hagio wrote:
> Please note that this VMCOREINFO is generated from the information in
> the vmlinux only, not from the running kernel and /proc/kcore. So if
> we add a command to dump it from running kernel, it's not suitable.

Sure, I used a vmlinux for that.

> makedumpfile doesn't have any switch which dumps VMCOREINFO from kcore
> for now. (I'm thinking to have makedumpfile dump it as debug message,
> though.)

Might be useful as people are looking into using VMCOREINFO when
debugging a live kernel...

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
