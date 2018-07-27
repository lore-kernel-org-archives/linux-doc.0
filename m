Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F33AB7D071
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Jul 2018 21:34:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389583AbeG0W6L (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Jul 2018 18:58:11 -0400
Received: from ms.lwn.net ([45.79.88.28]:40674 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389523AbeG0W6L (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Jul 2018 18:58:11 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id ED82330D;
        Fri, 27 Jul 2018 21:34:25 +0000 (UTC)
Date:   Fri, 27 Jul 2018 15:34:24 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Federico Vaga <federico.vaga@vaga.pv.it>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alessia Mantegazza <amantegazza@vaga.pv.it>
Subject: Re: [PATCH 2/2] doc:it_IT: translation for kernel-hacking
Message-ID: <20180727153424.7bba09ce@lwn.net>
In-Reply-To: <1944849.qmSSJrysef@pcbe13614>
References: <20180706220517.28623-1-federico.vaga@vaga.pv.it>
        <20180706220517.28623-3-federico.vaga@vaga.pv.it>
        <20180726162330.786826cf@lwn.net>
        <1944849.qmSSJrysef@pcbe13614>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 27 Jul 2018 09:46:47 +0200
Federico Vaga <federico.vaga@vaga.pv.it> wrote:

> Generally speaking, how readers can understand 
> how old is a document or if it still correct (in the sense that the document 
> and the correspondent code are in sync)? 

We don't have a good answer to that, really.  Some of our docs are
up-to-the-second current, and others still talk about how to find out
which vacuum tube has gone bad in your system.  It's a trap for our
readers, unfortunately.  My plan has been to try to bring some more order
to Documentation/ first, hopefully cleaning things up a bit on the way.


> How this is handled? Just by enforcing people to update 
> the documentation when they change, for example, an interface that has been 
> documented?

magari ... talk of such enforcement is a recurring thing, but nobody has
the will to actually do that.  

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
