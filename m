Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B4FBE7E3B2
	for <lwn-linux-doc@archive.lwn.net>; Fri,  3 Aug 2018 13:08:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730129AbeHCPEh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 3 Aug 2018 11:04:37 -0400
Received: from ms.lwn.net ([45.79.88.28]:33718 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729367AbeHCPEh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 3 Aug 2018 11:04:37 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 3BBC92DB;
        Fri,  3 Aug 2018 13:08:20 +0000 (UTC)
Date:   Fri, 3 Aug 2018 07:08:18 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Tobin C. Harding" <me@tobin.cc>
Cc:     Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        "David S. Miller" <davem@davemloft.net>, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC bpf-next v2 3/3] docs: Split filter.txt into separate
 documents.
Message-ID: <20180803070818.3d3e52e4@lwn.net>
In-Reply-To: <20180802223100.26236-4-me@tobin.cc>
References: <20180802223100.26236-1-me@tobin.cc>
        <20180802223100.26236-4-me@tobin.cc>
Organization: LWN.net
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri,  3 Aug 2018 08:31:00 +1000
"Tobin C. Harding" <me@tobin.cc> wrote:

> In preparation for conversion of Documentation/networking/filter.txt it
> was noticed that the document contains a lot of information.  The
> document may be more accessible if it was split up.  Some parts pertain
> to everyone, let's put these bits in core-api/.  The more hard core bits
> about eBPF internals could be put with the other BPF docs in
> Documentation/bpf/.  There is a small bit of information on testing and
> miscellaneous matters that are useful for everyone (everyone does
> testing, right) so lets keep that info at the bottom of both new
> documents.  (This includes the original authors.)
> 
> Split Documentation/networking/filter.txt into
> Documentation/bpf/eBPF.rst and Documentation/core-api/bpf.rst
> 
> Signed-off-by: Tobin C. Harding <me@tobin.cc>
> ---
>  .../{networking/filter.txt => bpf/eBPF.rst}   | 590 +----------------
>  Documentation/core-api/bpf.rst                | 599 ++++++++++++++++++

Some overall thoughts...

 - A good step in the right direction, and worthwhile work.  Thanks for
   doing this!

 - The new eBPF.rst file is not actually an RST file.  Giving it that
   extension while not converting the contents will confuse Sphinx.  I'd
   call it .txt at this point.

 - The document now known as core-api/bpf.rst is still covering two
   separate things.  One is the socket-filter API, while the other is
   classic BPF.  Since cBPF is still used elsewhere (seccomp), it's of
   wider interest.  Also, this is user-space API stuff, not kernel API
   stuff, so I think that Documentation/userspace-api/ is the right place
   for it.

I'm kind of thinking this through as I type it, but I guess I'm arguing
for the creation of three files, all in Documentation/userspace-api/:

 - socket-filter.rst on how to write socket filters
 - cBPF.rst describing classic BPF and its tools
 - eBPF.rst describing extended BPF

Tying cBPF.rst into seccomp_filter.rst could also be helpful for our
readers.

Does this make sense?

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
