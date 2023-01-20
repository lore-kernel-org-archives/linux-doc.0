Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 805F8C05027
	for <linux-doc@archiver.kernel.org>; Fri, 20 Jan 2023 11:05:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbjATLFr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Jan 2023 06:05:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjATLFq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Jan 2023 06:05:46 -0500
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7B6BB1ECB;
        Fri, 20 Jan 2023 03:05:44 -0800 (PST)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5771A1EC0373;
        Fri, 20 Jan 2023 12:05:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1674212743;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=DMz1hMX9bIi702U1qUGeKb6wgRmvVReg19Kv4qlT7fk=;
        b=ViXFRD98djm5tkg3Cd5Expr9eruzSxHLAM0zo29yMexB6w4nmR2/NqT+8hNVHA4eekMbeZ
        P1zX7DBYHX+EAz/LhT9dgSgT0mqSTvfZxv+WBLVuH/G9ltPvilfioqb3bbq/82E1XZIJ7K
        l07ploxyyfzfejxRKVYaGZPThp3R5rk=
Date:   Fri, 20 Jan 2023 12:05:38 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Sean Christopherson <seanjc@google.com>
Cc:     Kim Phillips <kim.phillips@amd.com>, x86@kernel.org,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Joao Martins <joao.m.martins@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        David Woodhouse <dwmw@amazon.co.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Juergen Gross <jgross@suse.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Tony Luck <tony.luck@intel.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Alexey Kardashevskiy <aik@amd.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/7] x86/cpu, kvm: Add the NO_NESTED_DATA_BP feature
Message-ID: <Y8p1ghpErykiCYjr@zn.tnic>
References: <20230110224643.452273-1-kim.phillips@amd.com>
 <20230110224643.452273-4-kim.phillips@amd.com>
 <Y8nvXj0//cImdTJQ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y8nvXj0//cImdTJQ@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 20, 2023 at 01:33:18AM +0000, Sean Christopherson wrote:
> Is it too late to back this out?  Not a huge deal, but it seems easy enough to
> clean up.

No, not at all. Lemme zap them from the lineup.

Kim, please send a new set like Sean suggests.

Thx.


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
