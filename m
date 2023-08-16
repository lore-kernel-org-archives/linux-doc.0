Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAC9C001B0
	for <linux-doc@archiver.kernel.org>; Wed, 16 Aug 2023 15:30:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344144AbjHPP3o (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Aug 2023 11:29:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244266AbjHPP3O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Aug 2023 11:29:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F2361FE2
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 08:29:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B00E262B07
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 15:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9068EC433C8;
        Wed, 16 Aug 2023 15:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692199750;
        bh=K3pspvi+mNztq0zUKx2QOh+ZhXb8RA04MXtTRCHzTlk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=L4jvAo9Le55BA3M8kyRi3pLpFgETZBGFwqYsjeJJy95vCY7nZz4V9MEGhcTQLe9QC
         U6IcqoiOj5syiLeJtst1wJMMAhvh6KLZwXc3Ta6goTfXMUxTsh5ua/zsTgyTnNB5eG
         B8+FK5cdEUqx/3okhEbc+y1wnXJLPBE++iT74ErxWjTkbVV8AOrRNs5Q4AH4eN2pIe
         F/gzVXunyKORmmi8M0Dv/od19L0+ZdkHAfqZhsk3cncAZSZjhLV4ZYJ+syKf089gLR
         yArITDJlAHC4kmfhhqb6i5jJHfVJQTw30II8cRyg+lP5DG7PQwWO/xkhgc7MOLTQMl
         3muPgzzpFALMg==
Date:   Wed, 16 Aug 2023 08:29:08 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Donald Hunter <donald.hunter@gmail.com>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        donald.hunter@redhat.com
Subject: Re: [PATCH net-next v2 06/10] tools/net/ynl: Add support for
 netlink-raw families
Message-ID: <20230816082908.1365f287@kernel.org>
In-Reply-To: <20230815194254.89570-7-donald.hunter@gmail.com>
References: <20230815194254.89570-1-donald.hunter@gmail.com>
        <20230815194254.89570-7-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 15 Aug 2023 20:42:50 +0100 Donald Hunter wrote:
> Refactor the ynl code to encapsulate protocol specifics into
> NetlinkProtocol and GenlProtocol.

Looks good, but do we also need some extra plumbing to decode extack
for classic netlink correctly?  Basically shouldn't _decode_extack()
also move to proto? Or we can parameterize it? All we really need there
is to teach it how much of fixed headers parser needs to skip to get to
attributes, really (which, BTW is already kinda buggy for genl families
with fixed headers).
