Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 979EA7DF93
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Jul 2018 20:40:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752607AbeGCUkA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 3 Jul 2018 16:40:00 -0400
Received: from zeniv.linux.org.uk ([195.92.253.2]:43182 "EHLO
        ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752237AbeGCUj7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Jul 2018 16:39:59 -0400
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.87 #1 (Red Hat Linux))
        id 1faS5d-0008KW-RX; Tue, 03 Jul 2018 20:39:57 +0000
Date:   Tue, 3 Jul 2018 21:39:57 +0100
From:   Al Viro <viro@ZenIV.linux.org.uk>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Ross Zwisler <ross.zwisler@linux.intel.com>
Subject: Re: [PATCH 1/2] fs: Fix attr.c kernel-doc
Message-ID: <20180703203957.GW30522@ZenIV.linux.org.uk>
References: <20180703150835.19565-1-willy@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180703150835.19565-1-willy@infradead.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 03, 2018 at 08:08:34AM -0700, Matthew Wilcox wrote:
> A couple of minor warnings.

Both patches applied...
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
