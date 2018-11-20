Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2C03D7D089
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Nov 2018 16:32:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727592AbeKUDC4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Nov 2018 22:02:56 -0500
Received: from ms.lwn.net ([45.79.88.28]:55780 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727193AbeKUDC4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 20 Nov 2018 22:02:56 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C31D79AF;
        Tue, 20 Nov 2018 16:32:55 +0000 (UTC)
Date:   Tue, 20 Nov 2018 09:32:54 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Will Deacon <will.deacon@arm.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Howells <dhowells@redhat.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Michael Halcrow <mhalcrow@google.com>
Subject: Re: [PATCH] Documentation: Use "while" instead of "whilst"
Message-ID: <20181120093254.675090f6@lwn.net>
In-Reply-To: <1542625365-21886-1-git-send-email-will.deacon@arm.com>
References: <1542625365-21886-1-git-send-email-will.deacon@arm.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 19 Nov 2018 11:02:45 +0000
Will Deacon <will.deacon@arm.com> wrote:

> Whilst making an unrelated change to some Documentation, Linus sayeth:
> 
>   | Afaik, even in Britain, "whilst" is unusual and considered more
>   | formal, and "while" is the common word.
>   |
>   | [...]
>   |
>   | Can we just admit that we work with computers, and we don't need to
>   | use þe eald Englisc spelling of words that most of the world never
>   | uses?
> 
> dictionary.com refers to the word as "Chiefly British", which is
> probably an undesirable attribute for technical documentation.
> 
> Replace all occurrences under Documentation/ with "while".

So I've gone ahead and applied this, just because "whilst" does look a
little strange to some.  I truly do not want this to be the beginning of a
pile of patches "fixing" British spellings and such, though; I really
don't think those need to be fixed.

Thanks,

jon
