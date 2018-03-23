Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DA9387D0F4
	for <lwn-linux-doc@archive.lwn.net>; Fri, 23 Mar 2018 18:42:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751812AbeCWSmp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 23 Mar 2018 14:42:45 -0400
Received: from ms.lwn.net ([45.79.88.28]:42400 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751790AbeCWSmo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Mar 2018 14:42:44 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 470FC306;
        Fri, 23 Mar 2018 18:42:44 +0000 (UTC)
Date:   Fri, 23 Mar 2018 12:42:43 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Joel Stanley <joel@jms.id.au>
Cc:     "Tobin C . Harding" <me@tobin.cc>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: Mention why %p prints ptrval
Message-ID: <20180323124243.64fdc17b@lwn.net>
In-Reply-To: <20180322052336.1001-1-joel@jms.id.au>
References: <20180322052336.1001-1-joel@jms.id.au>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 22 Mar 2018 15:53:36 +1030
Joel Stanley <joel@jms.id.au> wrote:

> When debugging recent kernels, people will see '(ptrval)' but there
> isn't much information as to what that means. Briefly describe why it's
> there.

Applied, thanks.

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
