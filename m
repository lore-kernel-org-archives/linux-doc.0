Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53178CD6107
	for <linux-doc@archiver.kernel.org>; Mon,  9 Oct 2023 16:38:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377261AbjJIQh7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 Oct 2023 12:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376759AbjJIQh6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Oct 2023 12:37:58 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CD4092
        for <linux-doc@vger.kernel.org>; Mon,  9 Oct 2023 09:37:57 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B489DC433C8;
        Mon,  9 Oct 2023 16:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696869477;
        bh=qlRswpJRFpIH5Iy48M5LSdwCmWTl90kKMCV2ExLF/EQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jTDzFvnmUfShJHJDdWz4lW8h8tANOLQ6wB1tT/XTuNQdahE8Wo2p1rZtdVII1Czr0
         oGGza2C7Y8cka2FZhZZKl7Epeg7kvxcIZfNZz0UhRwfy44uW0hEKDT809cB0saglQ0
         UEa+8uoS4rTd5IqpriPgWvDkY2gbluW5/DOOkUT+hQ4lN6Vj4Gk7Wu/7EArtRu8C7t
         0BBRa3K8Ywy08/RWW8nsjFOQrLCe5jexNiliCE8GozheWa/SvTi/vJuNjWzi9HGLLW
         q2oL83ME5NYAc1bztvpFAOyceh4kbXBu1ykYc1rv7e+J8rCyVysAngspljKq563x5F
         z6RCwUChQBjgg==
Date:   Mon, 9 Oct 2023 09:37:55 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Ahmed Zaki <ahmed.zaki@intel.com>
Cc:     netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
        linux-doc@vger.kernel.org, corbet@lwn.net,
        jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
        vladimir.oltean@nxp.com, andrew@lunn.ch, horms@kernel.org,
        mkubecek@suse.cz, Wojciech Drewek <wojciech.drewek@intel.com>
Subject: Re: [PATCH net-next v2 2/6] ice: fix ICE_AQ_VSI_Q_OPT_RSS_*
 register values
Message-ID: <20231009093755.19f9ec9c@kernel.org>
In-Reply-To: <20231006224726.443836-3-ahmed.zaki@intel.com>
References: <20231006224726.443836-1-ahmed.zaki@intel.com>
        <20231006224726.443836-3-ahmed.zaki@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri,  6 Oct 2023 16:47:22 -0600 Ahmed Zaki wrote:
> Fixes: 7bd527aa174f ("ice: Adjust naming for inner VLAN operations")

If there is v3 please drop the Fixes tag.

If the mistake doesn't result in a triggerable bug there's no need 
to backport this and therefore no need to annotate the source of 
the problem. It will just confuse people into thinking it's a real
issue.
