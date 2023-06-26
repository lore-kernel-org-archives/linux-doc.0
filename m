Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70682EB64D7
	for <linux-doc@archiver.kernel.org>; Mon, 26 Jun 2023 19:36:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbjFZTg6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Jun 2023 15:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjFZTg6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Jun 2023 15:36:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8042810DA;
        Mon, 26 Jun 2023 12:36:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 14F4A60F45;
        Mon, 26 Jun 2023 19:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40E6C433C0;
        Mon, 26 Jun 2023 19:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687808216;
        bh=PP/GTx4QLdaWRtLnnpCysj5uuCRgSOia5f0XjRfzq1M=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sy2tp4qcq+PfJPxXR8yzfzOcJU4bOevfwuBzYqBpI3Hum6p/EOrzHhoY/Y8gsb8Nz
         VT1K997c9v1Rk6z6hfqMI1QxbAvpvWDlqsu2bh1IN/HS5XuO4YTtfCPUMO+f2MffJ4
         iaZV5tgGSCrKlDFvOK0oo4vB1CnE32IM0y7OwNCSJ7VoDt4O6kdhHvOaOWkbqw9puy
         22+GBtmesUB9OrQi4OjTWkZoBOKn1rQ4aLdCaKqJxheNKGE6VSdOqtMK9rOQDMbRSd
         ifIwMn4l9UO9d0ntJ5OoAwdevYDc10JnvFfhUTJZU/jHzxIbrx9z4M6IwQ7KwZk1f7
         4J/Vwlaz+GTbw==
Date:   Mon, 26 Jun 2023 12:36:54 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Hariprasad Kelam <hkelam@marvell.com>
Cc:     <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <davem@davemloft.net>, <willemdebruijn.kernel@gmail.com>,
        <andrew@lunn.ch>, <sgoutham@marvell.com>, <lcherian@marvell.com>,
        <gakula@marvell.com>, <jerinj@marvell.com>, <sbhatta@marvell.com>,
        <naveenm@marvell.com>, <edumazet@google.com>, <pabeni@redhat.com>,
        <jhs@mojatatu.com>, <xiyou.wangcong@gmail.com>, <jiri@resnulli.us>,
        <maxtram95@gmail.com>, <corbet@lwn.net>,
        <linux-doc@vger.kernel.org>
Subject: Re: [net-next Patchv2 0/3] support Round Robin scheduling
Message-ID: <20230626123654.71d1bf38@kernel.org>
In-Reply-To: <20230626072407.32158-1-hkelam@marvell.com>
References: <20230626072407.32158-1-hkelam@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 26 Jun 2023 12:54:04 +0530 Hariprasad Kelam wrote:
> octeontx2 and CN10K silicons support Round Robin scheduling. When multiple
> traffic flows reach transmit level with the same priority, with Round Robin
> scheduling traffic flow with the highest quantum value is picked. With this
> support, the user can add multiple classes with the same priority and
> different quantum in htb offload.

## Form letter - net-next-closed

The merge window for v6.5 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations.
We are currently accepting bug fixes only.

Please repost when net-next reopens after July 10th.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer

