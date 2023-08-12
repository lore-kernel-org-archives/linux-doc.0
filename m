Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1459EB64DD
	for <linux-doc@archiver.kernel.org>; Sat, 12 Aug 2023 01:07:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234637AbjHLBH6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Aug 2023 21:07:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjHLBH6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Aug 2023 21:07:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D22E3
        for <linux-doc@vger.kernel.org>; Fri, 11 Aug 2023 18:07:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9691164CCE
        for <linux-doc@vger.kernel.org>; Sat, 12 Aug 2023 01:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71796C433C7;
        Sat, 12 Aug 2023 01:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691802477;
        bh=kKoMGqkaZrFbOmdnbjaZigHjWuY+wtaLeAvAQcSut8g=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=s+ecJZcm4Oz+U3bYwpLmbRS+QGsII+kG+5Ys0Day30a0lTlmbEW/48JDwfh5b1zhi
         XbM0VghvEgEJi9hEztjT19jxl9svUYb9VHZImvmIa3TFOnzP5unzQMpaKKYe1K1yCz
         WlwA9/ohm0vsDLnLR0JjYMsi/HtxdJQ+O6UpUM+QFGBO/OP4bBO7wuejAQDbH2MeGy
         OmxvfgYoEBcDZdRAV6DmTJeq88waEj9YwPqpyAsYLM4ChP8pBKskt50lseHBpbVRUY
         rcSNfsQMkbLesVajkALme9GXf98DDjvWeGD5Zv9jVRtr5yq9oKf7+6kzQfGw1mhYuV
         rU6cCDFBWjipA==
Date:   Fri, 11 Aug 2023 18:07:55 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Pavan Kumar Linga <pavan.kumar.linga@intel.com>
Cc:     netdev@vger.kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net,
        emil.s.tantilov@intel.com, joshua.a.hay@intel.com,
        sridhar.samudrala@intel.com, alan.brady@intel.com,
        madhu.chittim@intel.com, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, willemb@google.com, decot@google.com
Subject: Re: [PATCH net-next 0/2] Fix invalid kernel-doc warnings
Message-ID: <20230811180755.14efaf73@kernel.org>
In-Reply-To: <20230812002549.36286-1-pavan.kumar.linga@intel.com>
References: <20230812002549.36286-1-pavan.kumar.linga@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 11 Aug 2023 17:25:47 -0700 Pavan Kumar Linga wrote:
> kernel-doc reports invalid warnings on IDPF driver patch series [1]
> that is submitted for review. This patch series fixes those warnings.
> 
> [1]: https://lore.kernel.org/netdev/20230808003416.3805142-1-anthony.l.nguyen@intel.com/
> ---
> These fixes are needed for the IDPF driver patch series to have
> a clean CI. So targeting the series to net-next instead of
> linux-docs.

Neat, thanks for these.

Jon, no strong preference on the tree here. I'll confirm these resolve
the issues in Pavan's driver when applying it, there's no hard
requirement for the kdoc patches to be in net-next at that point.
