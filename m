Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA734C77B73
	for <linux-doc@archiver.kernel.org>; Tue, 23 May 2023 01:47:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjEWBrB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 May 2023 21:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjEWBrA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 May 2023 21:47:00 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E989A90;
        Mon, 22 May 2023 18:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=YIMkffsXkgXdfOfA9ikOVYM3BgfZkI7WyagD+RJ4C+8=; b=O493woKucAM758iB7TGdAwbef9
        +cPsKK9ZrzO2OagXMv58IKzFdixCa5NPu6zTSZbtoebD2WGRWhWMJJ5qrzG+h7bulbqUQN+tqh4hk
        P+z7Eevm65zmzeLrSowvF3/XJOoonIOgSl3XB7loaLLUgSpVil5lugGjCmUByZ8yBn3w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1q1H6s-00DbGI-Ok; Tue, 23 May 2023 03:46:46 +0200
Date:   Tue, 23 May 2023 03:46:46 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH net] docs: netdev: document the existence of the mail bot
Message-ID: <043df418-28f0-49e5-bff0-2ea511148bb6@lunn.ch>
References: <20230522230903.1853151-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522230903.1853151-1-kuba@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 22, 2023 at 04:09:03PM -0700, Jakub Kicinski wrote:
> We had a good run, but after 4 weeks of use we heard someone
> asking about pw-bot commands. Let's explain its existence
> in the docs. It's not a complete documentation but hopefully
> it's enough for the casual contributor. The project and scope
> are in flux so the details would likely become out of date,
> if we were to document more in depth.
> 
> Link: https://lore.kernel.org/all/20230522140057.GB18381@nucnuc.mle/
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

> +Instead of delegating patchwork permissions netdev uses a simple mail
> +bot which looks for special commands/lines within the emails sent to
> +the mailing list. For example to mark a series as Changes Requested
> +one needs to send the following line anywhere in the email thread::
> +
> +  pw-bot: changes-requested

...

> +  https://patchwork.hopto.org/pw-bot.html

[Evil grin]
So your patch did not trigger the bot. Lets see if my reply does?
[/Evil grin]

   Andrew
