Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CABEF7D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 14 Jan 2019 20:35:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbfANUfI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 14 Jan 2019 15:35:08 -0500
Received: from mail.skyhub.de ([5.9.137.197]:59018 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726755AbfANUfI (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 14 Jan 2019 15:35:08 -0500
Received: from zn.tnic (p200300EC2BC4CA00255595821D34C4F7.dip0.t-ipconnect.de [IPv6:2003:ec:2bc4:ca00:2555:9582:1d34:c4f7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1D7561EC027A;
        Mon, 14 Jan 2019 21:35:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1547498106;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=ojXxOskL0OW2grAWbQg+gv1scSqyRWX8gYLB34yBQFw=;
        b=cm2NLAWINNhxnVCeeBrOSVHxsc94zuch92ErHBVdjoGbCsUfW5RkvTL8wlZBpda8cywvea
        GXHAQVOKVqCo0zka8KnCFEbPdouyAREr0EQGFwf51pRE2idZgUjzrrQmUlZsCMIQM8OjPh
        cGHfraBAxsS5OYUwfUY0jTDIJ/mx9iM=
Date:   Mon, 14 Jan 2019 21:35:00 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Dave Anderson <anderson@redhat.com>
Cc:     Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
        Lianbo Jiang <lijiang@redhat.com>,
        linux-kernel@vger.kernel.org, kexec@lists.infradead.org,
        tglx@linutronix.de, mingo@redhat.com, x86@kernel.org,
        akpm@linux-foundation.org, bhe@redhat.com, dyoung@redhat.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2 v6] kdump: add the vmcoreinfo documentation
Message-ID: <20190114203500.GU2773@zn.tnic>
References: <20190110121944.6050-1-lijiang@redhat.com>
 <20190114180142.GO2773@zn.tnic>
 <2126185079.69727846.1547492312033.JavaMail.zimbra@redhat.com>
 <20190114192144.GQ2773@zn.tnic>
 <134663991.69764038.1547494607008.JavaMail.zimbra@redhat.com>
 <20190114195940.GS2773@zn.tnic>
 <244986363.69770015.1547496453312.JavaMail.zimbra@redhat.com>
 <20190114201812.GT2773@zn.tnic>
 <221183717.69773903.1547497592624.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <221183717.69773903.1547497592624.JavaMail.zimbra@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 14, 2019 at 03:26:32PM -0500, Dave Anderson wrote:
> No.  It needs *both* the vmlinux file and the vmcore file in order to read kernel
> virtual memory, so just having a kernel virtual address is insufficient.
> 
> So it's a chicken-and-egg situation.  This particular --osrelease option is used
> to determine *what* vmlinux file would be required for an actual crash analysis 
> session.

Ok, that makes sense. I could've used that explanation when reviewing
the documentation. Do you mind skimming through this:

https://lkml.kernel.org/r/20190111145650.GG4729@zn.tnic

in case we've missed explaining relevant usage - like that above - of
some of the vmcoreinfo members?

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
