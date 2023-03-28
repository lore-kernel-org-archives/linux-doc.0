Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D40E9C6FD1D
	for <linux-doc@archiver.kernel.org>; Tue, 28 Mar 2023 02:06:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232132AbjC1CGf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Mar 2023 22:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230473AbjC1CGe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Mar 2023 22:06:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 733D4B2;
        Mon, 27 Mar 2023 19:06:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1C242B81A1F;
        Tue, 28 Mar 2023 02:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E9DC433EF;
        Tue, 28 Mar 2023 02:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679969190;
        bh=G2/X1nXuF4BbomfyWKEAGkm9GJfAOUoBYypRSR+uX3A=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OYcPQRHYl3iEM3EACDs9ZylOn6EOamZQJVgmvP6maOOeJSslXFYLwpm+CS9IO/mBs
         wWHkiqjGNKvqctLMIwqEjR6qy3FvnBvAJ9tpudHERd+ZnRpNNWbCh33p1ZE87a/cb2
         ttMq8ZzMRpjBBy9MsJtAr/nIMlZuo4jJXOEEjktlcmkOq9mAyENkj1ZEAikP1q2yik
         eYRRsz0A7ukHQRAvyl9Vv/dnI9ZjMuSD0hQKCttt540sFjeMREOaF8ywrs6sX0xcvc
         sZso1+AvK1puOoOT9FJ65RiSw69Ht6eJth0HkIJgLbwlOseiuzgh3ui5vhtU5mQQj+
         UxswxxQKL1NJw==
Date:   Mon, 27 Mar 2023 19:06:29 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Felix Fietkau <nbd@nbd.name>
Cc:     netdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net/core: add optional threading for backlog
 processing
Message-ID: <20230327190629.7e966f46@kernel.org>
In-Reply-To: <2ef8ab92-3670-61a1-384d-b827865447ca@nbd.name>
References: <20230324171314.73537-1-nbd@nbd.name>
        <20230324102038.7d91355c@kernel.org>
        <2d251879-1cf4-237d-8e62-c42bb4feb047@nbd.name>
        <20230324104733.571466bc@kernel.org>
        <f59ee83f-7267-04df-7286-f7ea147b5b49@nbd.name>
        <20230324201951.75eabe1f@kernel.org>
        <2ef8ab92-3670-61a1-384d-b827865447ca@nbd.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 25 Mar 2023 06:42:43 +0100 Felix Fietkau wrote:
> >> In my tests it brings down latency (both avg and p99) considerably in
> >> some cases. I posted some numbers here:
> >> https://lore.kernel.org/netdev/e317d5bc-cc26-8b1b-ca4b-66b5328683c4@nbd.name/  
> > 
> > Could you provide the full configuration for this test?
> > In non-threaded mode the RPS is enabled to spread over remaining
> > 3 cores? 
> 
> In this test I'm using threaded NAPI and backlog_threaded without any 
> fixed core assignment.

I was asking about the rps_threaded=0 side of the comparison.
So you're saying on that side you were using threaded NAPI with 
no pinning and RPS across all cores?
