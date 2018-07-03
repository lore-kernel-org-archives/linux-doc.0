Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D55177DF93
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Jul 2018 19:52:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752734AbeGCTwe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 3 Jul 2018 15:52:34 -0400
Received: from ms.lwn.net ([45.79.88.28]:54066 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752732AbeGCTwd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 3 Jul 2018 15:52:33 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4166D2DB;
        Tue,  3 Jul 2018 19:52:33 +0000 (UTC)
Date:   Tue, 3 Jul 2018 13:52:32 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Kees Cook <keescook@chromium.org>
Cc:     Matthew Wilcox <willy@infradead.org>, linux-doc@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] reed_solomon: Fix kernel-doc
Message-ID: <20180703135232.669c9554@lwn.net>
In-Reply-To: <CAGXu5jKN2HTno=1MfAug+pn0yf82tV-YAWURpx6v_xk7spc4mA@mail.gmail.com>
References: <20180703194354.21614-1-willy@infradead.org>
        <CAGXu5jKN2HTno=1MfAug+pn0yf82tV-YAWURpx6v_xk7spc4mA@mail.gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 3 Jul 2018 12:47:44 -0700
Kees Cook <keescook@chromium.org> wrote:

> > The current doc build warns:
> > ./lib/reed_solomon/reed_solomon.c:287: WARNING: Unknown target name: "gfp".
> >
> > This is because it misinterprets the "GFP_" that is part of the
> > description.  Change the description to avoid the problem.
> >
> > Signed-off-by: Matthew Wilcox <willy@infradead.org>  
> 
> Acked-by: Kees Cook <keescook@chromium.org>
> 
> Jon can you take this?

Will do.

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
