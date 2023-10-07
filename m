Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D46E94139
	for <linux-doc@archiver.kernel.org>; Sat,  7 Oct 2023 00:22:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233729AbjJGAWx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 6 Oct 2023 20:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233696AbjJGAWw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 6 Oct 2023 20:22:52 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6028BE
        for <linux-doc@vger.kernel.org>; Fri,  6 Oct 2023 17:22:50 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D98C433C7;
        Sat,  7 Oct 2023 00:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696638170;
        bh=1BUaZMMqeVoMjxtWGj61G/fPUFnRdfmeq8RRHm9Afao=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tXBV49x9rKgM6epMxAqC8fscSz1He1fGGH+TQlQOP3lInkJgrxGQPxCV0iXAdzsIg
         gjGnly/3owUlWuEvkYpfPdQ0lbfj0qm7WTEn/8RIlZuNjggB4Uy+vFnDLQnUIigCyc
         /gtMtNyya3K29aEFAhOduPLa7Xc2svO/ZZRoNNjyw6ZWMa0oVOV+NJ5AEivmA476uY
         J8V876MGA9t5r5/bE7iItYOk4CCwOFOVY4D1VsuGTWu3ly7Rnj2X7s9aG+zikDZdKX
         EOSEYM/Yg+ii7/f/TkhX47i9yzYVftobwMhYfyomsK3SHf1Xhj8xdXVJkWNKzW6o7u
         A65nmtO1Nj0aw==
Date:   Fri, 6 Oct 2023 17:22:48 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Ahmed Zaki <ahmed.zaki@intel.com>
Cc:     netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
        linux-doc@vger.kernel.org, corbet@lwn.net,
        jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
        vladimir.oltean@nxp.com, andrew@lunn.ch, horms@kernel.org,
        mkubecek@suse.cz, Wojciech Drewek <wojciech.drewek@intel.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH net-next v2 1/6] net: ethtool: allow symmetric RSS hash
 for any flow type
Message-ID: <20231006172248.15c2e415@kernel.org>
In-Reply-To: <20231006224726.443836-2-ahmed.zaki@intel.com>
References: <20231006224726.443836-1-ahmed.zaki@intel.com>
        <20231006224726.443836-2-ahmed.zaki@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri,  6 Oct 2023 16:47:21 -0600 Ahmed Zaki wrote:
> Symmetric RSS hash functions are beneficial in applications that monitor
> both Tx and Rx packets of the same flow (IDS, software firewalls, ..etc).
> Getting all traffic of the same flow on the same RX queue results in
> higher CPU cache efficiency.
> 
> Only fields that has counterparts in the other direction can be
> accepted; IP src/dst and L4 src/dst ports.
> 
> The user may request RSS hash symmetry for a specific flow type, via:
> 
>     # ethtool -N|-U eth0 rx-flow-hash <flow_type> s|d|f|n symmetric
> 
> or turn symmetry off (asymmetric) by:
> 
>     # ethtool -N|-U eth0 rx-flow-hash <flow_type> s|d|f|n

Thanks for the changes, code looks good!

The question left unanswered is whether we should care about the exact
implementation of the symmetry (xor, xor duplicate, sort fields).
Toeplitz-based RSS is very precisely specified, so we may want to carry
that precision into the symmetric behavior. I have a weak preference 
to do so... but no willingness to argue with you, so let me put Willem
on the spot and have him make a decision :)

Please make sure to CC Willem and anyone else who commented on previous
revisions on future versions!
