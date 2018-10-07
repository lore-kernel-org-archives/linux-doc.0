Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D0BDC7D08A
	for <lwn-linux-doc@archive.lwn.net>; Sun,  7 Oct 2018 14:37:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbeJGVpC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 7 Oct 2018 17:45:02 -0400
Received: from ms.lwn.net ([45.79.88.28]:34580 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726616AbeJGVpC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 7 Oct 2018 17:45:02 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 98A1F8AF;
        Sun,  7 Oct 2018 14:37:36 +0000 (UTC)
Date:   Sun, 7 Oct 2018 08:37:35 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Kees Cook <keescook@chromium.org>
Cc:     Yves-Alexis Perez <corsac@corsac.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, trivial@kernel.org
Subject: Re: [PATCH] yama: clarify ptrace_scope=2 in Yama documentation
Message-ID: <20181007083735.61f117f3@lwn.net>
In-Reply-To: <CAGXu5jKLaYxP81FYp_=Vc8GZWVGs_TAzjw5m2CBm0sNKwohXCg@mail.gmail.com>
References: <20181002204722.GA9610@scapa.corsac.net>
        <CAGXu5jKLaYxP81FYp_=Vc8GZWVGs_TAzjw5m2CBm0sNKwohXCg@mail.gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2 Oct 2018 13:52:32 -0700
Kees Cook <keescook@chromium.org> wrote:

> On Tue, Oct 2, 2018 at 1:47 PM, Yves-Alexis Perez <corsac@corsac.net> wrote:
> > Current phrasing is ambiguous since it's unclear if attaching to a
> > children through PTRACE_TRACEME requires CAP_SYS_PTRACE. Rephrase the
> > sentence to make that clear.
> >
> > Signed-off-by: Yves-Alexis Perez <corsac@corsac.net>  
> 
> Thanks! Yes, this makes things more clear.
> 
> Acked-by: Kees Cook <keescook@chromium.org>
> 
> Jon, can you take this in your tree?

Applied, thanks.

jon
