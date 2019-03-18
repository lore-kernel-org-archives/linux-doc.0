Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4C95A7DBD4
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Mar 2019 17:44:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbfCRRm5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Mar 2019 13:42:57 -0400
Received: from ms.lwn.net ([45.79.88.28]:50968 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726837AbfCRRm5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 18 Mar 2019 13:42:57 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 659252B4;
        Mon, 18 Mar 2019 17:42:56 +0000 (UTC)
Date:   Mon, 18 Mar 2019 11:42:55 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Tobin C. Harding" <me@tobin.cc>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        "Tobin C. Harding" <tobin@kernel.org>, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] Convert vfs.txt to vfs.rst
Message-ID: <20190318114255.389851d3@lwn.net>
In-Reply-To: <20190318033430.GA27728@eros.localdomain>
References: <20190313040919.6937-1-tobin@kernel.org>
        <821449c9-e1f7-caa1-ff18-0cc1cc625596@infradead.org>
        <20190318033430.GA27728@eros.localdomain>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 18 Mar 2019 14:34:30 +1100
"Tobin C. Harding" <me@tobin.cc> wrote:

> > What does this patch set apply to?  Maybe Jon's git tree?  
> 
> I did this on top of Jon's tree before rc-1 came out (so during the
> merge window last week).  I can rebase and fire off another version if
> its easier for you Jon.

If you could do that, actually, and poke in Randy's Tested-by tag while
you're at it, I would appreciate it.

Thanks,

jon
