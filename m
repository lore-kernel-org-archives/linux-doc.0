Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CE5EE4996
	for <linux-doc@archiver.kernel.org>; Mon, 21 Aug 2023 20:43:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231274AbjHUUnw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Aug 2023 16:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbjHUUnN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Aug 2023 16:43:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C46711987
        for <linux-doc@vger.kernel.org>; Mon, 21 Aug 2023 13:41:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A465564B37
        for <linux-doc@vger.kernel.org>; Mon, 21 Aug 2023 20:41:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00ED0C433C9;
        Mon, 21 Aug 2023 20:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692650509;
        bh=+U4OxgNPa3HSAdSGG6DU4FYoXSXlX7k75MvbnTIwlr0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FVcItdkU2LEJUwiAkQu0W0zYAi9Jz9Y5AKQO6v4eDivMCCo5PqmQSozMDZYkcVFiV
         VwQL7kWt2BQQNrWM8ykC8/7q+GCfxStm9GzRd7kurCg8SQj+TlICNKGOjC9jjeOZ3w
         zrrL1jvVyVhfkGrATI3sTc5DpgILcmz9cE6BCuXGZrrcTZHMtjwdNTK4gRaKzXUyP9
         8oZdd7uDSS5n6ilaHjD2Dq84K+KF48RiPRLwYS7tcJNJhvWXWx2XTdUd37hJmIFtpF
         yqhWaqXFjIqIXsW2/I11SExZzRaYSoNr+WpPXx85j1uP3HoLIGqFbq9A+yEKyKg2jH
         2etmSvgx7hdFQ==
Date:   Mon, 21 Aug 2023 13:41:47 -0700
From:   Saeed Mahameed <saeed@kernel.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Leon Romanovsky <leon@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Dima Chumak <dchumak@nvidia.com>,
        Jiri Pirko <jiri@resnulli.us>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org, Saeed Mahameed <saeedm@nvidia.com>,
        Steffen Klassert <steffen.klassert@secunet.com>,
        Simon Horman <simon.horman@corigine.com>
Subject: Re: [PATCH net-next v3 0/8] devlink: Add port function attributes
Message-ID: <ZOPMCwKk88AzZgKJ@x130>
References: <cover.1692262560.git.leonro@nvidia.com>
 <20230817200725.20589529@kernel.org>
 <20230818041959.GX22185@unreal>
 <20230818093812.7ede8fbc@kernel.org>
 <20230818183640.GA22185@unreal>
 <20230818143240.3960be87@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230818143240.3960be87@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 18 Aug 14:32, Jakub Kicinski wrote:
>On Fri, 18 Aug 2023 21:36:40 +0300 Leon Romanovsky wrote:
>> > and you have to audacity to call the basic rules we had for a very long
>> > time "very strange".
>>
>> This rule relies on basic contract of 1 series -> fast review/acceptance.
>> Once fast review/acceptance doesn't happen, what else do you expect from me?
>
>Since you don't understand what I'm asking please let Saeed post
>your patches.
>

I usually try to avoid posting API changes as part of my pure mlx5 PRs. So
they get their fare share of focused review.

I prefer if such standalone patchsets to be submitted individually, as
they are mostly introducing new devlink knobs. This one isn't a new series
hence the V3, so I am not sure I can agree with the parallel submissions issue
here.

For the two ipsec UDP and TCP selector patches [1] I agree they should've been
part of my PRs.

[1] https://patchwork.kernel.org/project/netdevbpf/cover/cover.1691521680.git.leonro@nvidia.com/

I will take them to my next PR.

Thanks,
Saeed.

