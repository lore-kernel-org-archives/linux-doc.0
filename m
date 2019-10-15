Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 29A407D910
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 Oct 2019 18:38:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731430AbfJOSiD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 15 Oct 2019 14:38:03 -0400
Received: from ms.lwn.net ([45.79.88.28]:36224 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726144AbfJOSiD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 15 Oct 2019 14:38:03 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id EE8AC316;
        Tue, 15 Oct 2019 18:38:02 +0000 (UTC)
Date:   Tue, 15 Oct 2019 12:38:01 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>
Cc:     linux-doc@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Shobhit Kukreti <shobhitkukreti@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/4] docs: admin-guide: Sort the "unordered guides"
 to avoid merge conflicts
Message-ID: <20191015123801.0ba2d123@lwn.net>
In-Reply-To: <20191012171114.6589-1-j.neuschaefer@gmx.net>
References: <20191012171114.6589-1-j.neuschaefer@gmx.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 12 Oct 2019 19:11:09 +0200
Jonathan Neuschäfer <j.neuschaefer@gmx.net> wrote:

> Since the "unordered guides" linked in admin-guide/index.rst are not
> supposed to be in any particular order, let's sort them alphabetically
> to avoid the risk of merge conflicts by spreading newly added lines more
> evenly.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>

I've applied this as being better than nothing, but I would *really* be
pleased if somebody could spend some time imposing a more interesting
order on those unordered guides.  Making readers pick through a long list
of random documents isn't all that friendly.

(The rest of the set is applied as well).

Thanks,

jon
