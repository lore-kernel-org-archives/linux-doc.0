Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C307C7D90D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 11 Nov 2019 17:36:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbfKKRg4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Nov 2019 12:36:56 -0500
Received: from utopia.booyaka.com ([74.50.51.50]:39398 "EHLO
        utopia.booyaka.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbfKKRg4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Nov 2019 12:36:56 -0500
X-Greylist: delayed 402 seconds by postgrey-1.27 at vger.kernel.org; Mon, 11 Nov 2019 12:36:56 EST
Received: (qmail 2500 invoked by uid 1019); 11 Nov 2019 17:30:13 -0000
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 11 Nov 2019 17:30:13 -0000
Date:   Mon, 11 Nov 2019 17:30:13 +0000 (UTC)
From:   Paul Walmsley <paul@pwsan.com>
To:     Christoph Hellwig <hch@lst.de>
cc:     Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Andreas Schwab <schwab@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH] Documentation: admin-guide: add earlycon documentation
 for RISC-V
In-Reply-To: <20191108061009.GA30335@lst.de>
Message-ID: <alpine.DEB.2.21.999.1911111729271.32333@utopia.booyaka.com>
References: <alpine.DEB.2.21.9999.1910091252160.11044@viisi.sifive.com> <CAMuHMdUfqvkVJHHwyuYxLSxj_iUofx-vSvEj92C5mg3bGxHqmA@mail.gmail.com> <20191010112347.4a7237bb@lwn.net> <20191108061009.GA30335@lst.de>
User-Agent: Alpine 2.21.999 (DEB 260 2018-02-26)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jon,

On Fri, 8 Nov 2019, Christoph Hellwig wrote:

> can you please revert this?  The paragraph above this addition already
> describes the riscv case perfecty well with my previous patch:
> 
> 	earlycon=	[KNL] Output early console device and options.
> 
> 			When used with no options, the early console is
> 			determined by stdout-path property in device tree's
> 			chosen node or the ACPI SPCR table if supported by
> 			the platform.
> 
> 			[RISCV] When used with no options, the early
> 			console is determined by the stdout-path
> 			property in the device tree's chosen node.

I support reverting the RISCV section, now that Christoph's more general 
change has gone in.



- Paul
