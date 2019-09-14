Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1B42C7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Sat, 14 Sep 2019 07:55:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbfINHzw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 14 Sep 2019 03:55:52 -0400
Received: from ms.lwn.net ([45.79.88.28]:35676 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727306AbfINHzw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 14 Sep 2019 03:55:52 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 347342CC;
        Sat, 14 Sep 2019 07:55:51 +0000 (UTC)
Date:   Sat, 14 Sep 2019 01:55:47 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Palmer Dabbelt <palmer@sifive.com>
Cc:     linux-doc@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
        schwab@suse.de, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] Documentation: Add "earlycon=sbi" to the admin guide
Message-ID: <20190914015547.7f151d2b@lwn.net>
In-Reply-To: <20190913203843.27149-1-palmer@sifive.com>
References: <20190913203843.27149-1-palmer@sifive.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 13 Sep 2019 13:38:43 -0700
Palmer Dabbelt <palmer@sifive.com> wrote:

> This argument is supported on RISC-V systems and widely used, but was
> not documented here.
> 
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

Applied, thanks.

jon
