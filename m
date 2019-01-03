Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 97B027D08E
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 Jan 2019 16:28:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732263AbfACQ2v (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 Jan 2019 11:28:51 -0500
Received: from ms.lwn.net ([45.79.88.28]:57164 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730795AbfACQ2u (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Jan 2019 11:28:50 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 3BF0C97D;
        Thu,  3 Jan 2019 16:28:50 +0000 (UTC)
Date:   Thu, 3 Jan 2019 09:28:49 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Otto Sabart <ottosabart@seberm.com>
Cc:     linux-doc@vger.kernel.org, trivial@kernel.org
Subject: Re: [PATCH 0/8] Fix bad references to documentation files
Message-ID: <20190103092849.48e14277@lwn.net>
In-Reply-To: <cover.1546457946.git.ottosabart@seberm.com>
References: <cover.1546457946.git.ottosabart@seberm.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2 Jan 2019 21:00:47 +0100
Otto Sabart <ottosabart@seberm.com> wrote:

> This series of patches fixes multiple warnings
> from `$ make refcheckdocs` output.
> 
> I am still not sure if it's good practise to send these changes in
> a series (because they touch multiple trees) or as a single commit
> because it is one "logical" change :).

Definitely not as a single commit for something like this.

It's a good practice to use the get_maintainer.pl script to figure out who
should receive any given patch.  In particular, the various device-tree
patches should go to the device-tree maintainers, the SCSI one to the SCSI
list, etc.

I'll go ahead and apply patch 2 (the ext4 one) since it's a pure docs
fix.  For the rest, I'd suggest doing multiple mailings, being sure to get
them to the right maintainers.

Thanks,

jon
