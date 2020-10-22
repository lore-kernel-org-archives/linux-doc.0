Return-Path: <SRS0=90uN=D5=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230A9C388F2
	for <linux-doc@archiver.kernel.org>; Thu, 22 Oct 2020 08:01:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A50FA223FB
	for <linux-doc@archiver.kernel.org>; Thu, 22 Oct 2020 08:01:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="cvLN1NFO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2509165AbgJVIBw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Oct 2020 04:01:52 -0400
Received: from mx2.suse.de ([195.135.220.15]:57764 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2509164AbgJVIBw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 22 Oct 2020 04:01:52 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1603353710;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=al5X9k9TmXnWVtHnDRc3HqlGbm+NoIWAXwyHFtAngDw=;
        b=cvLN1NFO4flcJ7AqVjmOAOYFNPxed6JADv1j2NB9NnIE/WIqa9Y1zTrnZjfjt9QbjwXhcp
        9vW4/GI6DGzMeNr16xacgc9d6c58Z1h1WWKIRVyyPWF/OKW6Q+52qGGG/ZMXYmMvuK3hoC
        gDRGji9S/lulT/lCAcVc6a7EupoAzZY=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 270F9AE7A;
        Thu, 22 Oct 2020 08:01:50 +0000 (UTC)
Subject: Re: [PATCH 0/5] xen: event handling cleanup
To:     Juergen Gross <jgross@suse.com>
Cc:     xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
        x86@kernel.org, linux-doc@vger.kernel.org,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>
References: <20201022074214.21693-1-jgross@suse.com>
From:   Jan Beulich <jbeulich@suse.com>
Message-ID: <9f2c78c8-da92-1b64-02ba-1130bfc79962@suse.com>
Date:   Thu, 22 Oct 2020 10:01:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201022074214.21693-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 22.10.2020 09:42, Juergen Gross wrote:
> Do some cleanups in Xen event handling code.
> 
> Juergen Gross (5):
>   xen: remove no longer used functions
>   xen/events: make struct irq_info private to events_base.c
>   xen/events: only register debug interrupt for 2-level events
>   xen/events: unmask a fifo event channel only if it was masked
>   Documentation: add xen.fifo_events kernel parameter description

With the two remarks to individual patches suitably taken care of
one way or another
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan
