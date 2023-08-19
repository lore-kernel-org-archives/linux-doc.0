Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2001DEE49A2
	for <linux-doc@archiver.kernel.org>; Sat, 19 Aug 2023 01:47:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242180AbjHSBrQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Aug 2023 21:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242219AbjHSBqw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Aug 2023 21:46:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63C8735A5
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 18:46:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EA3C660A5C
        for <linux-doc@vger.kernel.org>; Sat, 19 Aug 2023 01:46:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5D4C433C7;
        Sat, 19 Aug 2023 01:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692409609;
        bh=4aZ+zC6/s4isGMHOIFZxl3OM7a+uB6FHX+BHCSXvwsQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ijRBIHnvFNZziKaDwTz8K6lVRzSDvlMkmwnc6eWlBOcrc0lcP+j+ZX42OQs2YHw/0
         zwO3EyCBwxUNSe4ylABUhWDjNO0BLc9Uos5YS7GMP9LFUeULcL/OKsSLM4P7RAyK2P
         QI9l+Ehwk3zc8Gt9yITXAamSx3rjnRydvrVoqRloDv55ev2+W2lgVrMY2u44IsOJg3
         4+V5S3Yy7TOEuEn8T9iAZ4Vu9aOL1K9lQco9tZOxLLFJ1szIt909uJQNVIRVt2blbz
         kG7LtAxBIrXapgm2+Ylpu5Ha0aFk5g56Fy74/SZb3szJnQQlxsK28kIaBk3MspSdrP
         YbjCh3eUnUyuQ==
Date:   Fri, 18 Aug 2023 18:46:48 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Sabrina Dubroca <sd@queasysnail.net>
Cc:     netdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, Scott Dial <scott@scottdial.com>
Subject: Re: [PATCH net-next] macsec: introduce default_async_crypto sysctl
Message-ID: <20230818184648.127b2ccf@kernel.org>
In-Reply-To: <9328d206c5d9f9239cae27e62e74de40b258471d.1692279161.git.sd@queasysnail.net>
References: <9328d206c5d9f9239cae27e62e74de40b258471d.1692279161.git.sd@queasysnail.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 17 Aug 2023 17:07:03 +0200 Sabrina Dubroca wrote:
> Commit ab046a5d4be4 ("net: macsec: preserve ingress frame ordering")
> tried to solve an issue caused by MACsec's use of asynchronous crypto
> operations, but introduced a large performance regression in cases
> where async crypto isn't causing reordering of packets.
> 
> This patch introduces a per-netns sysctl that administrators can set
> to allow new SAs to use async crypto, such as aesni. Existing SAs
> won't be modified.
> 
> By setting default_async_crypto=1 and reconfiguring macsec, a single
> netperf instance jumps from 1.4Gbps to 4.4Gbps.

Can we not fix the ordering problem?
Queue the packets locally if they get out of order?
