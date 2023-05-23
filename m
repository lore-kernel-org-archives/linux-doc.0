Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D4BC77B75
	for <linux-doc@archiver.kernel.org>; Tue, 23 May 2023 02:38:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjEWCij (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 May 2023 22:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234721AbjEWCig (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 May 2023 22:38:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F152A19B
        for <linux-doc@vger.kernel.org>; Mon, 22 May 2023 19:38:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 53371616CB
        for <linux-doc@vger.kernel.org>; Tue, 23 May 2023 02:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5999EC433D2;
        Tue, 23 May 2023 02:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684809507;
        bh=bMQX7nxLNAZp0941mwLdOgEWnsP6ucv1KeEe2O/NpT8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=o3Gs7Sk7Sp+Lbl6n2tEs3E4bYqtkYMKda+4PlCDojdgItyBmUfjioKzFQV3jzB6zX
         Uw5r9uhGfCZLO7wmRwxPkHXFw9wPKSpkah2TmK0nXQG5/OhE320HZdWveEo/9g8dQi
         7uz6R5DzqnuuaTwjMvC5rElczyEr930FABy3/dDeEAVgUnhlLTacgepBqqAP/Ergv3
         okZE2cL8xQC1L17Kz4n0X9nGGAzRBqKrA73vMql6NEBU0wUXYmmJwDY/Uz9vCsLNgH
         /D/woeIv5slR8DMyVJOiqxZaVQcvJtDMdq5lQPAEeiMefHMCwtPQoF+CiAJSAWSQri
         pVv330gOOTC9Q==
Date:   Mon, 22 May 2023 19:38:26 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Donald Hunter <donald.hunter@gmail.com>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        donald.hunter@redhat.com
Subject: Re: [patch net-next v1 2/2] tools: ynl: Handle byte-order in struct
 members
Message-ID: <20230522193826.48ecdd59@kernel.org>
In-Reply-To: <20230521170733.13151-3-donald.hunter@gmail.com>
References: <20230521170733.13151-1-donald.hunter@gmail.com>
        <20230521170733.13151-3-donald.hunter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 21 May 2023 18:07:33 +0100 Donald Hunter wrote:
> Add support for byte-order in struct members in the genetlink-legacy
> spec.

Acked-by: Jakub Kicinski <kuba@kernel.org>

Which spec is this for? 
