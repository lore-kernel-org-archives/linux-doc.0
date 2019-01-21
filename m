Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 37CF27D2F0
	for <lwn-linux-doc@archive.lwn.net>; Mon, 21 Jan 2019 08:08:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729651AbfAUIE4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 21 Jan 2019 03:04:56 -0500
Received: from ms.lwn.net ([45.79.88.28]:33064 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729601AbfAUIEy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 21 Jan 2019 03:04:54 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C4742AAB;
        Mon, 21 Jan 2019 02:08:04 +0000 (UTC)
Date:   Sun, 20 Jan 2019 19:08:00 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Joe Perches <joe@perches.com>, Gal Pressman <galpress@amazon.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Tariq Toukan <tariqt@mellanox.com>, xavier.huwei@huawei.com,
        netdev@vger.kernel.org, linux-rdma@vger.kernel.org,
        Doug Ledford <dledford@redhat.com>,
        Stephen Warren <swarren@nvidia.com>,
        Christoph Hellwig <hch@lst.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] coding-style: Clarify the expectations around bool
Message-ID: <20190120190800.64814cd4@lwn.net>
In-Reply-To: <20190118225047.GH4759@ziepe.ca>
References: <20190118225047.GH4759@ziepe.ca>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 18 Jan 2019 15:50:47 -0700
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> There has been some confusion since checkpatch started warning about bool
> use in structures, and people have been avoiding using it.
> 
> Many people feel there is still a legitimate place for bool in structures,
> so provide some guidance on bool usage derived from the entire thread that
> spawned the checkpatch warning.
> 
> Link: https://lkml.kernel.org/r/CA+55aFwVZk1OfB9T2v014PTAKFhtVan_Zj2dOjnCy3x6E4UJfA@mail.gmail.com
> Signed-off-by: Joe Perches <joe@perches.com>
> Acked-by: Joe Perches <joe@perches.com>
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Joey Pabalinas <joeypabalinas@gmail.com>
> Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>

So this seems ready; I've applied it.  

Thanks,

jon
