Return-Path: <SRS0=qRT1=DJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF31C4363D
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 19:10:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBC4620795
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 19:10:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387768AbgJBTKX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Oct 2020 15:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbgJBTKX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Oct 2020 15:10:23 -0400
Received: from dazzle.geroedel.de (unknown [IPv6:2a02:180:2:aa:1::b3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26649C0613D0
        for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2020 12:10:23 -0700 (PDT)
Received: from [192.168.15.2] (helo=feeble.bln.roederer.dhs.org)
        by dazzle.geroedel.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <devel-sven@geroedel.de>)
        id 1kOQRg-0005Ss-5y; Fri, 02 Oct 2020 21:10:20 +0200
Received: from strike.bln.roederer.dhs.org ([192.168.8.36] helo=strike.localnet)
        by feeble.bln.roederer.dhs.org with esmtp (Exim 4.92)
        (envelope-from <devel-sven@geroedel.de>)
        id 1kOQRf-0004aj-Q1; Fri, 02 Oct 2020 21:10:19 +0200
From:   Sven Roederer <devel-sven@geroedel.de>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-doc@vger.kernel.org
Date:   Fri, 02 Oct 2020 21:10:19 +0200
Message-ID: <1660456.qV5v0P9cVl@strike>
In-Reply-To: <20201001222023.GV20115@casper.infradead.org>
References: <20201001215029.30583-1-devel-sven@geroedel.de> <20201001222023.GV20115@casper.infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
X-Spam_report: Spam detection software, running on the system "dazzle",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 @@CONTACT_ADDRESS@@ for details.
 Content preview:  Am Freitag, 2. Oktober 2020, 00:20:23 CEST schrieb Matthew
    Wilcox: > On Thu, Oct 01, 2020 at 11:50:29PM +0200, Sven Roederer wrote:
   > > +rsync is used to instal the kernel-headers system wide with > > [...]
 Content analysis details:   (-2.9 points, 5.0 required)
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.0 ALL_TRUSTED            Passed through trusted hosts only via SMTP
 -1.9 BAYES_00               BODY: Bayes spam probability is 0 to 1%
                             [score: 0.0000]
X-SA-Exim-Connect-IP: 192.168.15.2
X-SA-Exim-Mail-From: devel-sven@geroedel.de
Subject: Re: [PATCH] docs: changes.rst: add rsync to the list of required tools
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on dazzle.geroedel.de)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am Freitag, 2. Oktober 2020, 00:20:23 CEST schrieb Matthew Wilcox:
> On Thu, Oct 01, 2020 at 11:50:29PM +0200, Sven Roederer wrote:
> > +rsync is used to instal the kernel-headers system wide with
> > administarative
> "install", "administrative" (or just "admin" or even "root"?)
> 
Depending on the system-layout, as special group might have the permissions to 
update the files. So root is not strictly needed, even it's the common case.
So I would perfer to stay with "administrative permissions".

Sven



