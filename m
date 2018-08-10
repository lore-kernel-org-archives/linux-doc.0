Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 98F607D00A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 12:58:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbeHJP1m (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 11:27:42 -0400
Received: from ms.lwn.net ([45.79.88.28]:59368 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726379AbeHJP1m (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 10 Aug 2018 11:27:42 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 90F0A9B0;
        Fri, 10 Aug 2018 12:57:53 +0000 (UTC)
Date:   Fri, 10 Aug 2018 06:57:52 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Tobin C. Harding" <me@tobin.cc>
Cc:     Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <alexei.starovoitov@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Kees Cook <keescook@chromium.org>,
        Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next 0/4] Convert filter.txt to RST
Message-ID: <20180810065752.2ab5473d@lwn.net>
In-Reply-To: <20180810014636.GJ32374@eros>
References: <20180809052328.27942-1-me@tobin.cc>
        <20180809060734.rtqqu4sexbwzuqmm@ast-mbp>
        <20180809072753.GF32374@eros>
        <80bdc251-9f57-602f-6536-b34651684bb7@iogearbox.net>
        <20180810014636.GJ32374@eros>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 10 Aug 2018 11:46:36 +1000
"Tobin C. Harding" <me@tobin.cc> wrote:

> Thanks for clarifying.  My understanding is now; this is a case where
> checkpatch is too verbose and we do not actually need to add a specific
> license identifier to the documentation files (new or otherwise).  They
> get an implicit GPLv2.

The objective actually is to have SPDX tags in all files in the kernel.
That includes documentation, even though people, as always, care less
about the docs than they do the code.

As I understood it, the complaint with the tags you put in wasn't their
existence, it was your putting GPLv2+ rather than straight GPLv2.  In the
absence of information to the contrary, you really have to assume the
latter, since that's the overall license for the kernel.

Thanks,

jon
