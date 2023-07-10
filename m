Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68E5EB64DC
	for <linux-doc@archiver.kernel.org>; Mon, 10 Jul 2023 09:41:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232953AbjGJJlY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Jul 2023 05:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232248AbjGJJkE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Jul 2023 05:40:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14396185;
        Mon, 10 Jul 2023 02:37:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9C53960F08;
        Mon, 10 Jul 2023 09:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAD20C433C7;
        Mon, 10 Jul 2023 09:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688981878;
        bh=5Va+D1vw5krsXXAHovHsEdN5okJNaHBciX0Ka1Bh8LI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d6ONynozQ5yTBS3WIdfoSmySH1DMQUcdlpG87TnWQ/PJ+obKufkZgO3RmSMsbcrAi
         zBwni1vClKRr6CI8ZxlAA6QtTrrAZqs7elCyzW04nLbF13gDk0t6YtuCjDlyXzoxat
         DjS0rTX9Y2rHrkkTs8xigbT5sF/U+odpM8JZ8nXKlMEX7Wd7R2BfzAyn5oi09tOlUg
         OyZeeBpjq95SqZO5pHYdeSKUogtXzvxubYPdyc6yAKLuu6yVSf5ZzoHYADa9G0QxDi
         HQhrA31+iFzk/tPKy64/KjMRIZ3qUgSwx0NIcgEaWEajdWwlIMXSZTH/HOtZwRlNEg
         OHdM1WBmoBhZQ==
Date:   Mon, 10 Jul 2023 10:37:52 +0100
From:   Will Deacon <will@kernel.org>
To:     Maria Yu <quic_aiquny@quicinc.com>
Cc:     corbet@lwn.net, catalin.marinas@arm.com, maz@kernel.org,
        quic_pkondeti@quicinc.com, quic_kaushalk@quicinc.com,
        quic_satyap@quicinc.com, quic_shashim@quicinc.com,
        quic_songxue@quicinc.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: Add the arm64.nolse_atomics command line option
Message-ID: <20230710093751.GC32673@willie-the-truck>
References: <20230710055955.36551-1-quic_aiquny@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710055955.36551-1-quic_aiquny@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 10, 2023 at 01:59:55PM +0800, Maria Yu wrote:
> In order to be able to disable lse_atomic even if cpu
> support it, most likely because of memory controller
> cannot deal with the lse atomic instructions, use a
> new idreg override to deal with it.

This should not be a problem for cacheable memory though, right?

Given that Linux does not issue atomic operations to non-cacheable mappings,
I'm struggling to see why there's a problem here.

Please can you explain the problem that you are trying to solve?

Will
