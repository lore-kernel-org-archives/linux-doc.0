Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5433D7D913
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 Oct 2019 16:55:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392972AbfJCQzf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 Oct 2019 12:55:35 -0400
Received: from ms.lwn.net ([45.79.88.28]:33172 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393158AbfJCQwN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Oct 2019 12:52:13 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 414B02D4;
        Thu,  3 Oct 2019 16:52:12 +0000 (UTC)
Date:   Thu, 3 Oct 2019 10:52:11 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Paul Walmsley <paul.walmsley@sifive.com>
Cc:     Chester Lin <clin@suse.com>,
        "palmer@sifive.com" <palmer@sifive.com>,
        "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
        "atish.patra@wdc.com" <atish.patra@wdc.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv-docs: correct the sequence of the magic number 2
 since it's little endian
Message-ID: <20191003105211.4ec1ed16@lwn.net>
In-Reply-To: <alpine.DEB.2.21.9999.1910011132280.3732@viisi.sifive.com>
References: <20190916130108.31404-1-clin@suse.com>
        <20191001072212.21d55899@lwn.net>
        <alpine.DEB.2.21.9999.1910011132280.3732@viisi.sifive.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 1 Oct 2019 11:35:11 -0700 (PDT)
Paul Walmsley <paul.walmsley@sifive.com> wrote:

> This was simply due to idiocy on my part, due to a very last-minute patch 
> submission, where I missed that the original documented magic number was 
> already in little-endian format.  The updated number from Chester is 
> correct.
> 
> So,
> 
> Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>

Great, patch applied, thanks.

jon
