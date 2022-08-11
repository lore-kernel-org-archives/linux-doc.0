Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF91C19F2A
	for <linux-doc@archiver.kernel.org>; Thu, 11 Aug 2022 19:42:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235402AbiHKTmu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Aug 2022 15:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234698AbiHKTmt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Aug 2022 15:42:49 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 518D523BF5;
        Thu, 11 Aug 2022 12:42:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 15B8BB8200A;
        Thu, 11 Aug 2022 19:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B02C433D6;
        Thu, 11 Aug 2022 19:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660246965;
        bh=/Z5JO62QRcw9PN+qiv1je4iFkrsxHarqJZOZ+PuLgI8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PjRMAWierwHCQj5xoYTF3u0AKmy9efK/2iDjcK1Qd0CYhfSgHLy2KM6iO88hBCaBt
         dQ330fPz46AM/DEiUoyueFwdUXbpZTQ4WuVGOCNQKc5sApBQU0DKl72ErHndGO+p4t
         c4BUHZVR0ZnFqJ9vtXYV4n6lnjzBtcLurGWTrS+dZcWwilkCcYX/M407uTO7c1RlJy
         Bj4PPvdmRuFTIJ4Sz6V1D0/VKkhblfZKeY1ePW6lS7DgimIkYdkcW+1TbF4E+YB7ix
         rtVEPzKfV8rDoHBv3nTkOlJOl9AC9y6vBfY742AecMoaNo65tZ5ilwLiHv/8MUK+r4
         02c4TcHcny7rA==
Date:   Thu, 11 Aug 2022 12:42:44 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     sdf@google.com
Cc:     Stephen Hemminger <stephen@networkplumber.org>,
        netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
        pabeni@redhat.com, jacob.e.keller@intel.com, vadfed@fb.com,
        johannes@sipsolutions.net, jiri@resnulli.us, dsahern@kernel.org,
        fw@strlen.de, linux-doc@vger.kernel.org,
        Michal Kubecek <mkubecek@suse.cz>
Subject: Re: [RFC net-next 0/4] ynl: YAML netlink protocol descriptions
Message-ID: <20220811124244.37a66b98@kernel.org>
In-Reply-To: <YvUuPU8dMSvv2tdJ@google.com>
References: <20220811022304.583300-1-kuba@kernel.org>
        <20220810211534.0e529a06@hermes.local>
        <20220810214701.46565016@kernel.org>
        <20220811080152.2dbd82c2@hermes.local>
        <20220811083435.1b271c7f@kernel.org>
        <YvUuPU8dMSvv2tdJ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 11 Aug 2022 09:28:45 -0700 sdf@google.com wrote:
> Putting it into iproute2 will make it carry a 'networking' badge on it
> meaning no other subsystem would look into it.

Good point.

> I'd rather make netlink more generic (s/netlink/kernelink/?) and remove
> CONFIG_NET dependency to address https://lwn.net/Articles/897202/

I think people just use that as an excuse, TBH.
