Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7F3C19F2D
	for <linux-doc@archiver.kernel.org>; Thu, 11 Aug 2022 04:47:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbiHKErH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Aug 2022 00:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiHKErG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Aug 2022 00:47:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AADB7642E1;
        Wed, 10 Aug 2022 21:47:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 457D461373;
        Thu, 11 Aug 2022 04:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0BCC433C1;
        Thu, 11 Aug 2022 04:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660193223;
        bh=DSzuevtxKxqevQzQwke3yCbJLWjrmeSiKTzQrcxQiXM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NtWGl83iD01vJOwDj+a9F3IQ3ZXIqT79GL4hHZlBPeI6ACKBrdMs9EFQmIkYgrlV0
         a5YXXlthFQZjCLAqfteynFUdmMHe8ESdIcDC7FmZAf882iJW5/MgS7C613AAlhOgDz
         NAnvjrufqrN70a0h4milFE/T+KMiDEydelURLiGwq4lu7mDqwl+0+Ioqn8voTJ94BO
         lY7xGDwIs8+04KO/7UYz/Bw5ylPRGnC6dGBtvaomLtOWlp66jztV8e0K/MXS9VvFBQ
         QQZHSNadMKGJbhlBL1KeUzFB/cUnS1PM4djOaVa+nL6apeJ5xpgwDfQ+G057hPszwO
         B+6YUYVpxTB5w==
Date:   Wed, 10 Aug 2022 21:47:01 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Stephen Hemminger <stephen@networkplumber.org>
Cc:     netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
        pabeni@redhat.com, sdf@google.com, jacob.e.keller@intel.com,
        vadfed@fb.com, johannes@sipsolutions.net, jiri@resnulli.us,
        dsahern@kernel.org, fw@strlen.de, linux-doc@vger.kernel.org
Subject: Re: [RFC net-next 0/4] ynl: YAML netlink protocol descriptions
Message-ID: <20220810214701.46565016@kernel.org>
In-Reply-To: <20220810211534.0e529a06@hermes.local>
References: <20220811022304.583300-1-kuba@kernel.org>
        <20220810211534.0e529a06@hermes.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 10 Aug 2022 21:15:34 -0700 Stephen Hemminger wrote:
> Would rather this be part of iproute2 rather than requiring it
> to be maintained separately and part of the kernel tree.

I don't understand what you're trying to say. What is "this", 
what is "separate" from what?

Did I fall victim of the "if the cover letter is too long nobody
actually reads it" problem? Or am I simply too tired to parse?

iproute2 is welcome to use the protocol descriptions like any other
user space, but I'm intending to codegen kernel code based on the YAML:

>> On the kernel side the YAML spec can be used to generate:
>>  - the C uAPI header
>>  - documentation of the protocol as a ReST file
>>  - policy tables for input attribute validation
>>  - operation tables

So how can it not be in the kernel tree?
