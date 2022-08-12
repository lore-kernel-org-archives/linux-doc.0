Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E46C00140
	for <linux-doc@archiver.kernel.org>; Fri, 12 Aug 2022 22:27:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238040AbiHLW1X (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 12 Aug 2022 18:27:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237781AbiHLW1B (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 12 Aug 2022 18:27:01 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845B117A8F;
        Fri, 12 Aug 2022 15:26:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8A705B82536;
        Fri, 12 Aug 2022 22:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2ABC433D6;
        Fri, 12 Aug 2022 22:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660343185;
        bh=h+fz/E+NxPvEO954aa/+BZq/UDfByd5N3bVglPOEEcw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=a8tCzSufpZqsGbXZv5aQZzYlpu+xezcLKiDPlXy9ptMAHv6SvNhGwWD1gY2IJM5yL
         DcIcqitC1ruqJtpADE300CLinOcpfZ60W/mzbECWf1OTNO5j1XuerAY9pk3v5qC1Ny
         wNOvU6VrksSHFyM0CkwIzP6ojVz4fLjPbldH7nZKp1QbWj8RAa+jWnh9ZK/iFnyRAD
         FERYNsLBl6nT1kURXYc4pwBqf5NZWippcIatncysXAWHYXSydBcATwUCTSV+bPd2uj
         cXB6uKHg9Cc/RCqcWHLNj8rmEe1ccR1460N/wZ1+kE5M1TC1yBchx1mDp+pYP3UVzY
         DJmXPU3TChzHw==
Date:   Fri, 12 Aug 2022 15:26:24 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
        pabeni@redhat.com, sdf@google.com, jacob.e.keller@intel.com,
        vadfed@fb.com, johannes@sipsolutions.net, jiri@resnulli.us,
        dsahern@kernel.org, stephen@networkplumber.org, fw@strlen.de,
        linux-doc@vger.kernel.org
Subject: Re: [RFC net-next 0/4] ynl: YAML netlink protocol descriptions
Message-ID: <20220812152624.136c16a2@kernel.org>
In-Reply-To: <9208fec1-60e9-dd2b-af27-ada3dfa50121@gmail.com>
References: <20220811022304.583300-1-kuba@kernel.org>
        <9208fec1-60e9-dd2b-af27-ada3dfa50121@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 12 Aug 2022 10:00:52 -0700 Florian Fainelli wrote:
> > The ability for a high level language like Python to talk to the kernel
> > so easily, without ctypes, manually packing structs, copy'n'pasting
> > values for defines etc. excites me more than C codegen, anyway.  
> 
> This is really cool BTW, and it makes a lot of sense to me that we are 
> moving that way, especially with Rust knocking at the door. I will try 
> to do a more thorough review, than "cool, I like it".

Thanks! Feel free to ping me for the latest version whenever you want
to take a look, because the code will hopefully be under very active
development for a few more weeks..
