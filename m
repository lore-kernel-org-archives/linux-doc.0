Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 68B0A7D04D
	for <lwn-linux-doc@archive.lwn.net>; Sat, 19 Jan 2019 08:33:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727581AbfASIdA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 19 Jan 2019 03:33:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:44066 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726465AbfASIdA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 19 Jan 2019 03:33:00 -0500
Received: from localhost (5356596B.cm-6-7b.dynamic.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 61E30204EC;
        Sat, 19 Jan 2019 08:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1547886780;
        bh=AwsiwZUGvjBlXznYcMPKKYCxXOX37BXovBXeQHLPHas=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qRKJx1/BW9hnkwHhHZUA0/8NZur0zTW6xKn2JjLI4a+Jqap1RQP9q3EFxvsaLRI1h
         wrtT0PtLknzavrGWE+Uwbnk3w+J/78Ema1HpSAZHbueurvrWJK4Iq4RynqOvKwDuHI
         OjRU2wX1RvUPuxEteFrygHkHxE7QdjZZEIkALTdk=
Date:   Sat, 19 Jan 2019 09:32:56 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Federico Vaga <federico.vaga@vaga.pv.it>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc:process: remove note from 'stable api nonsense'
Message-ID: <20190119083256.GD9004@kroah.com>
References: <20190118215804.3340-1-federico.vaga@vaga.pv.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190118215804.3340-1-federico.vaga@vaga.pv.it>
User-Agent: Mutt/1.11.2 (2019-01-07)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 18, 2019 at 10:58:04PM +0100, Federico Vaga wrote:
> The link referred by the note can't be retrieved: this patch just
> remove that old note.
> 
> Signed-off-by: Federico Vaga <federico.vaga@vaga.pv.it>
> ---
>  Documentation/process/stable-api-nonsense.rst | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
