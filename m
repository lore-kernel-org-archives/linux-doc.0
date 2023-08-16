Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBB3C04E69
	for <linux-doc@archiver.kernel.org>; Wed, 16 Aug 2023 15:01:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239469AbjHPPBO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Aug 2023 11:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344002AbjHPPBF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Aug 2023 11:01:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F8E4271D
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 08:00:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 139D166A7C
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 15:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7633C433C8;
        Wed, 16 Aug 2023 15:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692198008;
        bh=zIFuavAAkrRzHP97/+EypFEFEaYwyMI665GY6yMI4Hc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=XsI833QBL1DiCoS9rGj8A1KK5ljEkiOOPQOlRDcexni1sWI+j4923/ncmD/PsyJjb
         xXrrENoEI1BjbVsD2+vZ7WltgbL1HDnavZxD+iySM/E0ywBYpwMf1Begt+Okog8Itf
         /4vi00CxwGnkP0G347P24S6NNZGHWcuqcc4vt68DcJsTpHIfkvVJ77nEOioWID6zBT
         drLQkcmIa/RTZHdgAsOdouzz/YIDwpedSyclQ7qAZe0oxGQU92UXECEGQ22Kt7gprn
         BLTGKTvCLowct7OiuNuvTrbCc2OfunZUf1wRS7Vz5OZd6uQCQubDEZxoyP/PN6QcjY
         /A81610E7jnHw==
Date:   Wed, 16 Aug 2023 08:00:06 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Donald Hunter <donald.hunter@gmail.com>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        donald.hunter@redhat.com
Subject: Re: [PATCH net-next v2 02/10] doc/netlink: Document the
 genetlink-legacy schema extensions
Message-ID: <20230816080006.42496226@kernel.org>
In-Reply-To: <m2ttszi0um.fsf@gmail.com>
References: <20230815194254.89570-1-donald.hunter@gmail.com>
        <20230815194254.89570-3-donald.hunter@gmail.com>
        <20230815194902.6ce9ae12@kernel.org>
        <m2bkf7jswr.fsf@gmail.com>
        <m2ttszi0um.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 16 Aug 2023 14:16:33 +0100 Donald Hunter wrote:
> > Ack. As an aside, what do we mean by "kernel input policy"?  
> 
> So I've just spotted that kernel-policy is already documented in
> core-api/netlink.rst and I guess I shouldn't be documenting it in the
> userspace-api at all? I could add a reference to the core-api docs so
> that it's easier to find the kernel side docs when reading the
> userspace-api?

Ah, yes, reference sounds good.
But we should also add split to the doc, I only see ``global`` and
``per-op`` described?
