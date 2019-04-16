Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7AA897D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Apr 2019 08:44:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbfDPIn4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 16 Apr 2019 04:43:56 -0400
Received: from mx2.suse.de ([195.135.220.15]:59442 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726208AbfDPIn4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 16 Apr 2019 04:43:56 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id B07D6ADAA;
        Tue, 16 Apr 2019 08:43:54 +0000 (UTC)
Date:   Tue, 16 Apr 2019 10:43:54 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        live-patching@vger.kernel.org
Subject: Re: [PATCH 20/57] docs: livepatch: convert it to ReST format
Message-ID: <20190416084354.ol7umvh2lmii6jbk@pathway.suse.cz>
References: <cover.1555382110.git.mchehab+samsung@kernel.org>
 <f8eb5302d14147f5721cce816b1d3500184ce383.1555382110.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8eb5302d14147f5721cce816b1d3500184ce383.1555382110.git.mchehab+samsung@kernel.org>
User-Agent: NeoMutt/20170912 (1.9.0)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon 2019-04-15 23:55:45, Mauro Carvalho Chehab wrote:
> Convert livepatch documentation to ReST format. The changes
> are mostly trivial, as the documents are already on a good
> shape. Just a few markup changes are needed for Sphinx to
> properly parse the docs.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Thanks a lot for the conversion. I tried html output and
it looks very well.

Just a question. This patch does only the formatting.
The documentation is not really generated because the file
is not renamed to .rst. Also it is not referenced from
any top level documents. Is it by intention?


I am happy even for the conversion, so:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
