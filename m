Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 050F57E3DB
	for <lwn-linux-doc@archive.lwn.net>; Tue,  7 Aug 2018 13:14:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389002AbeHGP2X (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 7 Aug 2018 11:28:23 -0400
Received: from ms.lwn.net ([45.79.88.28]:57986 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388950AbeHGP2X (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 7 Aug 2018 11:28:23 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 804D89B0;
        Tue,  7 Aug 2018 13:14:06 +0000 (UTC)
Date:   Tue, 7 Aug 2018 07:14:05 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Tobin C. Harding" <me@tobin.cc>
Cc:     Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        "David S. Miller" <davem@davemloft.net>, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC bpf-next v2 3/3] docs: Split filter.txt into separate
 documents.
Message-ID: <20180807071405.58d38277@lwn.net>
In-Reply-To: <20180807024844.GW3088@eros>
References: <20180802223100.26236-1-me@tobin.cc>
        <20180802223100.26236-4-me@tobin.cc>
        <20180803070818.3d3e52e4@lwn.net>
        <20180807024844.GW3088@eros>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 7 Aug 2018 12:48:44 +1000
"Tobin C. Harding" <me@tobin.cc> wrote:

> How about these steps:
> 
> 	1. start with foo.txt
> 	2. do typo and grammar fixes (any number of patches).
> 	3. rename to foo.rst, do whitespace changes, code snippet
> 	   indentation, heading adornments, update references to this file.
> 	   (single patch).
> 	4. Fix up references in the file text to use RST (i.e :ref: blah)
> 	5. Fix up RST markers (backticks etc). (any number of patches)

That can certainly work; just don't call it foo.rst until it actually is a
valid RST file.

And, of course, go easy with the later steps and try to avoid the
temptation to mark up everything; we really want to preserve the
readability of the plain-text files.

Thanks for doing this work!

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
