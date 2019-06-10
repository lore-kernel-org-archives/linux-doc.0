Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C11B17D2EF
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Jun 2019 17:35:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388352AbfFJRfw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Jun 2019 13:35:52 -0400
Received: from ms.lwn.net ([45.79.88.28]:44930 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388346AbfFJRfw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 10 Jun 2019 13:35:52 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9710F382;
        Mon, 10 Jun 2019 17:35:51 +0000 (UTC)
Date:   Mon, 10 Jun 2019 11:35:50 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Doug Ledford <dledford@redhat.com>,
        linux-rdma@vger.kernel.org
Subject: Re: [PATCH v3 13/33] docs: infiniband: convert docs to ReST and
 rename to *.rst
Message-ID: <20190610113550.250aad35@lwn.net>
In-Reply-To: <20190610172712.GG18468@ziepe.ca>
References: <cover.1560045490.git.mchehab+samsung@kernel.org>
        <09036fdb89c4bec94cb92d25398c026afdb134e7.1560045490.git.mchehab+samsung@kernel.org>
        <20190610172712.GG18468@ziepe.ca>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 10 Jun 2019 14:27:12 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> Looks OK to me, do you want to run these patches through the docs tree
> or through RDMA?
> 
> Given that we've generally pushed doc updates through rdma, I think
> I'd prefer the latter? Jonathan?

Whichever works best for you is fine with me; go ahead and take them.

jon
