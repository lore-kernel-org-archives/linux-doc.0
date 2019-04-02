Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E22227D919
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Apr 2019 15:49:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729104AbfDBPtg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Apr 2019 11:49:36 -0400
Received: from ms.lwn.net ([45.79.88.28]:46046 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728999AbfDBPtg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 2 Apr 2019 11:49:36 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BBEEC2EF;
        Tue,  2 Apr 2019 15:49:35 +0000 (UTC)
Date:   Tue, 2 Apr 2019 09:49:34 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Tobin C. Harding" <tobin@kernel.org>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Mauro Carvalho Chehab <mchehab@s-opensource.com>,
        Neil Brown <neilb@suse.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/24] Convert vfs.txt to vfs.rst
Message-ID: <20190402094934.5b242dc0@lwn.net>
In-Reply-To: <20190327051717.23225-1-tobin@kernel.org>
References: <20190327051717.23225-1-tobin@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 27 Mar 2019 16:16:53 +1100
"Tobin C. Harding" <tobin@kernel.org> wrote:

> Hi Al,
> 
> This series converts the VFS file Documentation/filesystems/vfs.txt to
> reStructuredText format.  Please consider taking this series through
> your tree as apposed to Jon's tree because this set makes a fair amount
> of changes to VFS files (and also the VFS tree and docs tree are out of
> sync right now with the recent work by Mauro and Neil).

Al, do you have any thoughts on how you want to handle this?  I was about
to apply Jeff Layton's vfs.txt update, but would rather not create
conflicts unnecessarily.  Let me know if you'd like me to pick this work
up.

Thanks,

jon
