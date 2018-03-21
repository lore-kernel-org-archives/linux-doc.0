Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D94017D0DA
	for <lwn-linux-doc@archive.lwn.net>; Wed, 21 Mar 2018 15:02:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752382AbeCUPCL (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 21 Mar 2018 11:02:11 -0400
Received: from ms.lwn.net ([45.79.88.28]:49934 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752305AbeCUPCL (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 21 Mar 2018 11:02:11 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BA24C536;
        Wed, 21 Mar 2018 15:02:10 +0000 (UTC)
Date:   Wed, 21 Mar 2018 09:02:09 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Martin Kepplinger <martink@posteo.de>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] README: Improve documentation descriptions
Message-ID: <20180321090209.46b6e04f@lwn.net>
In-Reply-To: <20180316155707.28426-1-martink@posteo.de>
References: <20180316155707.28426-1-martink@posteo.de>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 16 Mar 2018 16:57:07 +0100
Martin Kepplinger <martink@posteo.de> wrote:

> "This file" indeed was moved once, but at some point "this file", the
> top-level README, becomes a file in itself. Now that time has come :)
> 
> Let's describe how things are, and suggest reading "this file" first,
> "this file" simply being a the admin-guide README file, not a file that
> was once moved.

OK, sure, applied.

Maybe I'll tack on something pointing to
https://www.kernel.org/doc/html/latest/ as well.

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
