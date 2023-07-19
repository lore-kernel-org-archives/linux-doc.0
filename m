Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5ABEB64DC
	for <linux-doc@archiver.kernel.org>; Wed, 19 Jul 2023 02:44:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjGSCof (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Jul 2023 22:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjGSCof (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Jul 2023 22:44:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC77FC;
        Tue, 18 Jul 2023 19:44:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3963E61689;
        Wed, 19 Jul 2023 02:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABF1AC433C8;
        Wed, 19 Jul 2023 02:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689734673;
        bh=i6ODCpZdw7yLI/3Tk1F1jRRURwyjESiWyE6EJzeWL4o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GyXCHH1o6MXRYbpwlAWo4bDRRNaRqreFxfEWh0bv1gqA+vFzisAQkWBWtkkR2rolW
         S+i0qIHgWdTNZOoRGNoPF+EkIPIeORj7roVfF68SIRnaPCRBM9ijv6lefLhqZRByyC
         Xg8WIpkO+pv0vXIEaolUwgguTnnrLcBu9+M0oqRMf6AN3TjxSY7OcUDV/bUSUPnnq6
         QwAX0DgHnxeHhs8/50NznKzCII/5A6/lY3ly853LXskuA2qmcOj22UfMuGtcKXNzLr
         m8b96MtnZlVYnKNLUyLsHeAkHgpWGeDSopECi2I75Fgeky1JzsvHjJinJfTYCXRffs
         TmUnKrM3uaIqg==
Date:   Tue, 18 Jul 2023 19:44:31 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Hariprasad Kelam <hkelam@marvell.com>
Cc:     <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <davem@davemloft.net>, <willemdebruijn.kernel@gmail.com>,
        <andrew@lunn.ch>, <sgoutham@marvell.com>, <lcherian@marvell.com>,
        <gakula@marvell.com>, <jerinj@marvell.com>, <sbhatta@marvell.com>,
        <naveenm@marvell.com>, <edumazet@google.com>, <pabeni@redhat.com>,
        <jhs@mojatatu.com>, <xiyou.wangcong@gmail.com>, <jiri@resnulli.us>,
        <maxtram95@gmail.com>, <corbet@lwn.net>,
        <linux-doc@vger.kernel.org>
Subject: Re: [net-next Patch v3 4/4] docs: octeontx2: extend documentation
 for Round Robin scheduling
Message-ID: <20230718194431.38c02846@kernel.org>
In-Reply-To: <20230717093319.26618-5-hkelam@marvell.com>
References: <20230717093319.26618-1-hkelam@marvell.com>
        <20230717093319.26618-5-hkelam@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 17 Jul 2023 15:03:19 +0530 Hariprasad Kelam wrote:
> +4. Create tc classes with same priorities and different quantum::
> +
> +        # tc class add dev <interface> parent 1: classid 1:1 htb rate 10Gbit prio 2 quantum 409600
> +
> +        # tc class add dev <interface> parent 1: classid 1:2 htb rate 10Gbit prio 2 quantum 188416
> +
> +        # tc class add dev <interface> parent 1: classid 1:2 htb rate 10Gbit prio 2 quantum 32768

last two rules should presumably have different classids?
-- 
pw-bot: cr
