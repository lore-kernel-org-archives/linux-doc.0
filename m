Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEBDC00140
	for <linux-doc@archiver.kernel.org>; Fri, 19 Aug 2022 03:14:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346410AbiHSDOO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Aug 2022 23:14:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346358AbiHSDOE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Aug 2022 23:14:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64D795F12C;
        Thu, 18 Aug 2022 20:13:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EBB02614B5;
        Fri, 19 Aug 2022 03:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B293BC433C1;
        Fri, 19 Aug 2022 03:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660878827;
        bh=xq8GaMbdnr+OeugUSDXfCUbYIEQrPvt8b9MwtJPTNT8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=a2xsM/jKHo9rxzOdrrUFgDg7TJRNU4XWYRJg+8SzLMHGdqLhByTekuzSXJY8PUjaN
         oxp6eWcd50wp0DlmbI9CANJ3L8LvVrNLaBHzlD1bpxtpa/c28TMCAbPnMvEisIoj1a
         2YEQZ9+nSyQo4U1g26jfFPoFQ+/gW3+ddPY8z0VULC6XQPeNeCQFuYTWhomfDpxyZu
         i/1fYGolU3tQIMGxgi0poKO4K6VbuR8XEkEdaLyCYA94/ir8PHMz3es+zwjArF5o0d
         Sos9TnQrDuQ/rAB+CTB4ofTJERxo6cAlouFLh+QIr1Px+SFFd36jo2Yl2oZD1619qh
         Tbyys5kEzi1RQ==
Date:   Thu, 18 Aug 2022 20:13:45 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Stanislav Fomichev <sdf@google.com>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, corbet@lwn.net,
        johannes@sipsolutions.net, stephen@networkplumber.org,
        ecree.xilinx@gmail.com, benjamin.poirier@gmail.com,
        idosch@idosch.org, f.fainelli@gmail.com, jiri@resnulli.us,
        dsahern@kernel.org, fw@strlen.de, linux-doc@vger.kernel.org,
        jhs@mojatatu.com, tgraf@suug.ch, jacob.e.keller@intel.com,
        svinota.saveliev@gmail.com
Subject: Re: [PATCH net-next 2/2] docs: netlink: basic introduction to
 Netlink
Message-ID: <20220818201345.7b523818@kernel.org>
In-Reply-To: <CAKH8qBv7zoD6NyYBUeb3o9KjG2KpX8iw8aCpNNsoUa=oJA=VsA@mail.gmail.com>
References: <20220818023504.105565-1-kuba@kernel.org>
        <20220818023504.105565-2-kuba@kernel.org>
        <CAKH8qBv7zoD6NyYBUeb3o9KjG2KpX8iw8aCpNNsoUa=oJA=VsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 17 Aug 2022 21:05:21 -0700 Stanislav Fomichev wrote:
> > +Most of the concepts and examples here refer to the ``NETLINK_ROUTE`` family,
> > +which covers much of the configuration of the Linux networking stack.
> > +Real documentation of that family, deserves a chapter (or a book) of its own.
> 
> I'm assuming the answer is "no", but nonetheless: is it possible to
> use classic families over generic netlink (discover/get policy/etc)?

Not as far as I know.

> So we can just assume everything is genetlink and safely ignore all
> old quirks of the classic variant?

The behavior may differ a little with older families when it comes to
validation but yes, for the most part genetlink users should be able 
to ignore all the quirks.
