Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE0CC001DB
	for <linux-doc@archiver.kernel.org>; Tue,  8 Aug 2023 23:20:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbjHHXUY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Aug 2023 19:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbjHHXUY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Aug 2023 19:20:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2884F19AF
        for <linux-doc@vger.kernel.org>; Tue,  8 Aug 2023 16:20:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BC54462E20
        for <linux-doc@vger.kernel.org>; Tue,  8 Aug 2023 23:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28371C433C9;
        Tue,  8 Aug 2023 23:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691536820;
        bh=hDJyGT1EW9AJZNFTtNI/f9U9RD19MdRHN85tVl7Qga0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Yh9XcnFJc2VHeOiXwXsZHkqD7YduBU2WuRKmQBloybekOmWTJzcpT/WkK5sYDygd6
         g9JNpefjB4uMZWJyrR5GB3HrDfK8G4FJezNr0nn4Zz+GnaLq7IpfQKnQ7tVDlxdSvQ
         WAZjmVaxTFSwjHDC/DskWUAJyd45fv9tOTGezBFZPsfOkkjm9PuMf4msNaqQYpLULF
         q9hg4bbfFNKIS4MXMqpUCz+ZdBNzq1QJ56dioXwny7iWrSzPZgIjhJePI4O+sh4sbK
         3bSr8JvOhLnsx6PWyhrZ+XUFbvGy2Mxv21LiI1lDjkLZ166pyXCAqkpPPzjt5+dBzQ
         0LjOx7RzTNb4Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 09E3AC395C5;
        Tue,  8 Aug 2023 23:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] docs: net: page_pool: de-duplicate the intro comment
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169153682003.18545.14656413462759347609.git-patchwork-notify@kernel.org>
Date:   Tue, 08 Aug 2023 23:20:20 +0000
References: <20230807210051.1014580-1-kuba@kernel.org>
In-Reply-To: <20230807210051.1014580-1-kuba@kernel.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, hawk@kernel.org, ilias.apalodimas@linaro.org,
        corbet@lwn.net, linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  7 Aug 2023 14:00:51 -0700 you wrote:
> In commit 82e896d992fa ("docs: net: page_pool: use kdoc to avoid
> duplicating the information") I shied away from using the DOC:
> comments when moving to kdoc for documenting page_pool API,
> because I wasn't sure how familiar people are with it.
> 
> Turns out there is already a DOC: comment for the intro, which
> is the same in both places, modulo what looks like minor rewording.
> Use the version from Documentation/ but keep the contents with
> the code.
> 
> [...]

Here is the summary with links:
  - [net-next] docs: net: page_pool: de-duplicate the intro comment
    https://git.kernel.org/netdev/net-next/c/2c2b88748fd5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


