Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C150E7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 14 May 2019 14:10:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbfENOKm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 14 May 2019 10:10:42 -0400
Received: from mail.skyhub.de ([5.9.137.197]:41156 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbfENOKm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 14 May 2019 10:10:42 -0400
Received: from zn.tnic (p200300EC2F29E500329C23FFFEA6A903.dip0.t-ipconnect.de [IPv6:2003:ec:2f29:e500:329c:23ff:fea6:a903])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E6FDD1EC04B7;
        Tue, 14 May 2019 16:10:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1557843041;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=8Hbl+3qJJ2G8Wf0uUR9v/gw2H5E1wWu0W0VJu88KW/g=;
        b=IufzjsnjDv4kGPolkiZ24lZROT5JMf9O5BJeQDU1T8TA2+THiRiQdEpwZrOiFGgMdJm7gP
        SBN3kxfXBm2Ue3fjOj/2Q9CzkM2dZ0Rbq0a8sA1FxwAI6j4Ivx4KLKeLnk6qZO5npFKBle
        85ojlwGMVueEQTgV0c3H7OrAFuqH21U=
Date:   Tue, 14 May 2019 16:10:35 +0200
From:   Borislav Petkov <bp@alien8.de>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] LICENSES: Rename other to deprecated
Message-ID: <20190514141035.GC31140@zn.tnic>
References: <20190430105130.24500-1-hch@lst.de>
 <20190430105130.24500-4-hch@lst.de>
 <20190514102632.GA4574@zn.tnic>
 <20190514134943.GA13662@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190514134943.GA13662@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 14, 2019 at 03:49:43PM +0200, Christoph Hellwig wrote:
> On Tue, May 14, 2019 at 12:26:32PM +0200, Borislav Petkov wrote:
> > This breaks scripts/spdxcheck.py, it needs below hunk. Also, should
> > "dual" be added to license_dirs too?
> 
> Yes.  In fact two people already submitted patches for that before
> you, just waiting for them to get picked up.

Yeah, it is definitely worth mentioning how minor stuff like that gets
noticed and fixed immediately in recent times. We've become better... :-)

Thx!

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
