Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE71EE4998
	for <linux-doc@archiver.kernel.org>; Fri, 18 Aug 2023 21:33:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240392AbjHRVdO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Aug 2023 17:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240827AbjHRVcq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Aug 2023 17:32:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB3930F6
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 14:32:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 04422652A9
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 21:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DBC7C433D9;
        Fri, 18 Aug 2023 21:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692394361;
        bh=nn+nuO251dwWEoQpIKim8e/7fuF7cbVUVmYKEOTd2iM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nCSrnlIOylHNxMgmBRTjle9FFsaqh6kRx1T07ftpAHvLmFX/jDo5VL7KTmTygwhSF
         14Hbm5OB215bm1QbgUz8HrNUyEx5n1K+fWI2AupaVzpoBH1uWmP36jfrL9UbEadMKv
         45z2T7mc6SnZhxYngawWfYs7LJqSKsktGlQpbYzCdpLthlV2YD43Wf9K5WZUT5KJDI
         NbFF/wJ//nZWaSGeNlWBfh0bYrLa5aC1xGwpCqeiTYiKzFIpYQ3f23Iw0k1YbM2oh6
         U4nQDco6RMgr1FDa2bjW0Y9Gs4xGmYr7MYEhU5FonsKT9aumE/emduC6oe+4CYYBS6
         jmM389Kg3zgYQ==
Date:   Fri, 18 Aug 2023 14:32:40 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Leon Romanovsky <leon@kernel.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Dima Chumak <dchumak@nvidia.com>,
        Jiri Pirko <jiri@resnulli.us>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
        Steffen Klassert <steffen.klassert@secunet.com>,
        Simon Horman <simon.horman@corigine.com>
Subject: Re: [PATCH net-next v3 0/8] devlink: Add port function attributes
Message-ID: <20230818143240.3960be87@kernel.org>
In-Reply-To: <20230818183640.GA22185@unreal>
References: <cover.1692262560.git.leonro@nvidia.com>
        <20230817200725.20589529@kernel.org>
        <20230818041959.GX22185@unreal>
        <20230818093812.7ede8fbc@kernel.org>
        <20230818183640.GA22185@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 18 Aug 2023 21:36:40 +0300 Leon Romanovsky wrote:
> > and you have to audacity to call the basic rules we had for a very long
> > time "very strange".  
> 
> This rule relies on basic contract of 1 series -> fast review/acceptance.
> Once fast review/acceptance doesn't happen, what else do you expect from me?

Since you don't understand what I'm asking please let Saeed post
your patches.
