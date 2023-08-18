Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B6DC7EE2A
	for <linux-doc@archiver.kernel.org>; Fri, 18 Aug 2023 16:39:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356943AbjHRQio (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Aug 2023 12:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236293AbjHRQiP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Aug 2023 12:38:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85C09272D
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 09:38:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 19F986137C
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 16:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194BFC433C8;
        Fri, 18 Aug 2023 16:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692376693;
        bh=Kq75jx3gNSVhhx+bk9h2GcY2ZSUOy3nY7gzQ9RKugUE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lJUmSF5O4HXViUOp5rMTg673GEa3xI1of2NBwNS0VPD9Pu9xxTY1gF2AeSSHuRBWx
         2YHHttWcoP3RLKbecmcjzfV2q7LsZ88cK/bnuL6Ahfbv0n+dLKiiphhgQuZrcEjT3y
         8Jl/0Zlv4/sdTGqU/G3nC5kqGnygxVrMLWHoa1c5yEaowJwu1QVvEQb0JYR2z09vRr
         tQRYXscFjCENShq1Nl1YevM+WDgzrZkB2mJAjwzi7fK5NHSup/gRD9g/fKwPSVxL5A
         gKsrmXSU/MkKeHW0O6X6aqG86IJEyLE2VMIDU4Mm6CVtqbTBYa9DlHTqoHHzWrlsIi
         UXq1gEFBfydww==
Date:   Fri, 18 Aug 2023 09:38:12 -0700
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
Message-ID: <20230818093812.7ede8fbc@kernel.org>
In-Reply-To: <20230818041959.GX22185@unreal>
References: <cover.1692262560.git.leonro@nvidia.com>
        <20230817200725.20589529@kernel.org>
        <20230818041959.GX22185@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 18 Aug 2023 07:19:59 +0300 Leon Romanovsky wrote:
> It is very strange to expect 1 series per vendor/driver without taking
> into account the size of that driver and the amount of upstream work
> involvement from that vendor.

According to the "reviewer rotation" nVidia is supposed to be reviewing
this week. Sorry it fell on you in particular, but as a company y'all
definitely are not pulling your weight. Then Saeed pings me to pull
your RDMA stuff faster, and you have to audacity to call the basic
rules we had for a very long time "very strange".

SMH
