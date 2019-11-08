Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 978777D90D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  8 Nov 2019 06:10:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbfKHGKN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 8 Nov 2019 01:10:13 -0500
Received: from verein.lst.de ([213.95.11.211]:33056 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbfKHGKN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 8 Nov 2019 01:10:13 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 68D1368BE1; Fri,  8 Nov 2019 07:10:09 +0100 (CET)
Date:   Fri, 8 Nov 2019 07:10:09 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
        Andreas Schwab <schwab@suse.de>
Subject: Re: [PATCH] Documentation: admin-guide: add earlycon documentation
 for RISC-V
Message-ID: <20191108061009.GA30335@lst.de>
References: <alpine.DEB.2.21.9999.1910091252160.11044@viisi.sifive.com> <CAMuHMdUfqvkVJHHwyuYxLSxj_iUofx-vSvEj92C5mg3bGxHqmA@mail.gmail.com> <20191010112347.4a7237bb@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191010112347.4a7237bb@lwn.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jon,

can you please revert this?  The paragraph above this addition already
describes the riscv case perfecty well with my previous patch:


	earlycon=	[KNL] Output early console device and options.

			When used with no options, the early console is
			determined by stdout-path property in device tree's
			chosen node or the ACPI SPCR table if supported by
			the platform.

			[RISCV] When used with no options, the early
			console is determined by the stdout-path
			property in the device tree's chosen node.
