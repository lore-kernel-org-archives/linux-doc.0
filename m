Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEB2C433EF
	for <linux-doc@archiver.kernel.org>; Tue,  5 Jul 2022 18:06:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbiGESGi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Jul 2022 14:06:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbiGESGh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Jul 2022 14:06:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8511415A1A;
        Tue,  5 Jul 2022 11:06:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2994961835;
        Tue,  5 Jul 2022 18:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38630C341C7;
        Tue,  5 Jul 2022 18:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657044395;
        bh=E3601zQ2j/tztwTxZrm7lvZKQ3SjhUTsiW9Ta8zjZHA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=St+4rFsBcwusXUzvSyEoUlhEGP//kYjqjIQmxgRuMMSSpMRYvZ/UylzMi56wQQhEf
         vX5/rLDHY8sRg+w30XpFuHBrFwXnKZvsqVIqXMoydrej3Qf5Uow0b6cW4HlbHz91Yr
         MNuPofmRV7QUIbZxYcAU3BZGazoxNObYyBNxAk8mQtWel5p8F8HNdSDJopXmEenoLs
         lHTGRC2bVuKGOdOaadedVawKAB1Rgd87QXbseS/Gd19d5ejxHL4CoVLhFamYRAguRj
         82k/5w4n7Vm4HNEAxuja/1o7qtBQrEtBNqmeRoujeG3xo5p+XomS93qAvKxrFUIFPa
         /Fe2wj0hiR8kw==
Date:   Tue, 5 Jul 2022 11:06:34 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Paolo Abeni <pabeni@redhat.com>
Cc:     Francois Romieu <romieu@fr.zoreil.com>, davem@davemloft.net,
        netdev@vger.kernel.org, edumazet@google.com, corbet@lwn.net,
        jdmason@kudzu.us, vburru@marvell.com, jiawenwu@trustnetic.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] eth: remove neterion/vxge
Message-ID: <20220705110634.4a66389a@kernel.org>
In-Reply-To: <cbd7e14b3496229497ae49edbb68c04d4c1d7449.camel@redhat.com>
References: <20220701044234.706229-1-kuba@kernel.org>
        <Yr8rC9jXtoFbUIQ+@electric-eye.fr.zoreil.com>
        <20220701144010.5ae54364@kernel.org>
        <cbd7e14b3496229497ae49edbb68c04d4c1d7449.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 05 Jul 2022 08:17:24 +0200 Paolo Abeni wrote:
> On Fri, 2022-07-01 at 14:40 -0700, Jakub Kicinski wrote:
> > 100%, I really wish something like that existed. I have a vague memory
> > of Fedora or some other distro collecting HW data. Maybe it died because
> > of privacy issues?  
> 
> AFAICS that database still exists and is active:
> 
> https://linux-hardware.org/?view=search&vendor=neterion&d=All
> 
> It shows no usage at all for the relevant vendor.
> 
> On the flip side, it looks like the data points come mostly/exclusively
> from desktop systems, not very relevant in this specific case.

GTK! There is a whole bunch of old Mellanox NICs reported so I think
there is _some_ server coverage. I'm leaning towards applying the patch.
