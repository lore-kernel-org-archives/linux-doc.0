Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E61C001B0
	for <linux-doc@archiver.kernel.org>; Wed, 16 Aug 2023 02:53:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236810AbjHPCxJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Aug 2023 22:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241376AbjHPCwj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Aug 2023 22:52:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658C9212B
        for <linux-doc@vger.kernel.org>; Tue, 15 Aug 2023 19:52:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E7C2463C2C
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 02:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01022C433C8;
        Wed, 16 Aug 2023 02:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692154357;
        bh=3QjhTCHuuIiV8csmB6TyJmQ1YEMYzNv95EvJW8GWkZA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rxBQboLivi6aw7MZhbkeGipJwbAtnK45XfWdhdaZYYr3kUVWHnl4NP/k9YSkv/bDf
         +L6rae7IgCI1my0IdSm1L3hkhfzTKngSd6SHGkG+0P/+L3tMu4jH+pc1x7qbdctbw+
         xESeiUGxdN+8c8WVZ1oNmWyvZR1VfW/VqWtnQ3bF5k1Kmq+WGlzY0NTljbW1k6EBTf
         xKVXgA/WuDoRv9cAp04WJtk+VU2HPYpCH4LuQfi2J9Q3Zk/1nyq0R8D3CbBneVIX9T
         paGCnHcfXy4e9aus7GqHJgZGME75wEaZ5Bib05h2JJ4Zgxrp01Icn7Tox5x7C6FJMH
         vIs7rsRHErBWw==
Date:   Tue, 15 Aug 2023 19:52:36 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Donald Hunter <donald.hunter@gmail.com>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Stanislav Fomichev <sdf@google.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        donald.hunter@redhat.com
Subject: Re: [PATCH net-next v2 03/10] doc/netlink: Document the netlink-raw
 schema extensions
Message-ID: <20230815195236.3835a60b@kernel.org>
In-Reply-To: <20230815194254.89570-4-donald.hunter@gmail.com>
References: <20230815194254.89570-1-donald.hunter@gmail.com>
        <20230815194254.89570-4-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 15 Aug 2023 20:42:47 +0100 Donald Hunter wrote:
> Add description of netlink-raw specific attributes to the ynl spec
> documentation and refer to the classic netlink documentation.

I wonder if we should make this a separate doc, similarly to
genetlink-legacy. Keep the specs.rst focused on newer stuff?
