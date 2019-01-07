Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7A8FA7D099
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Jan 2019 22:25:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbfAGWZg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 Jan 2019 17:25:36 -0500
Received: from ms.lwn.net ([45.79.88.28]:53620 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727159AbfAGWZg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 Jan 2019 17:25:36 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 510182B6;
        Mon,  7 Jan 2019 22:25:35 +0000 (UTC)
Date:   Mon, 7 Jan 2019 15:25:34 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     NeilBrown <neilb@suse.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        "linux-doc\@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] Documentation/filesystems: fix title underline lengths
 in path-lookup.rst
Message-ID: <20190107152534.07bf648c@lwn.net>
In-Reply-To: <87k1jhjeni.fsf@notabene.neil.brown.name>
References: <abe71918-29c1-ce47-57ad-e1908c7136e6@infradead.org>
        <87k1jhjeni.fsf@notabene.neil.brown.name>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 07 Jan 2019 15:05:37 +1100
NeilBrown <neilb@suse.com> wrote:

> I probably did, but I didn't notice them.
> I just ran "make htmldocs" and there are pages and pages of warnings.
> When I look closely they do include these ones.  At the time I was more
> focused on getting the output to look right.

The warning situation is really out of hand, and has been for a long
time.  For a while I was trying to whack them (and Randy has done some),
but it needs a more focused effort.  Someday...

Meanwhile, I've applied this one, thanks.

jon
