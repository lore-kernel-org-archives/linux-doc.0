Return-Path: <SRS0=ldhC=4X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA6CC10F25
	for <linux-doc@archiver.kernel.org>; Fri,  6 Mar 2020 13:39:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A7D321739
	for <linux-doc@archiver.kernel.org>; Fri,  6 Mar 2020 13:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1583501943;
	bh=xjWW14TC0TTciWBjku0A3OHDB9CP0FwrNfb3H6Z58Gc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ztrcYXGQ4Y7ceafLG9QiHQZDu8mK2dhW7w1elc0SYFJ+F/POa9ULTtJtkCeAL8zRC
	 LuhVyB6h9RNDEaoQ8x5Kd3GTn9KjM0F5/c1Df6z4/1CaYADeyEqDdpKBFIC6ygQM94
	 tagpwfP2IXFXzu+FtOmIF3lagFa5nKrQ1kWcqnCk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbgCFNjC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 6 Mar 2020 08:39:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:56998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726090AbgCFNjC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 6 Mar 2020 08:39:02 -0500
Received: from localhost (unknown [122.178.250.113])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6E5DC2072D;
        Fri,  6 Mar 2020 13:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583501942;
        bh=xjWW14TC0TTciWBjku0A3OHDB9CP0FwrNfb3H6Z58Gc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C8olfGSKeQvEWcUrS9PoIs6aQmZZbnvMHMHXdKYNnE0vLRtpGtcheuSEHx+WMNakr
         CRDYhaa/0dA0Wb4TEq0hsq9f4fzszK9HaVpQ3tR2Jxt21Q91HvjEBPnG1HjnSiqWm2
         oE/ZNZ9HslgG3FT7I0/mMbyHtE1ot/ifytSaUYF8=
Date:   Fri, 6 Mar 2020 19:08:58 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Dan Williams <dan.j.williams@intel.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-crypto@vger.kernel.org,
        linux-doc@vger.kernel.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH v3 04/18] docs: crypto: convert async-tx-api.txt to ReST
 format
Message-ID: <20200306133858.GI4148@vkoul-mobl>
References: <cover.1583243826.git.mchehab+huawei@kernel.org>
 <f6c75c58cf682cce5fa46b2cd7f7fe902ff833b1.1583243826.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6c75c58cf682cce5fa46b2cd7f7fe902ff833b1.1583243826.git.mchehab+huawei@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03-03-20, 14:59, Mauro Carvalho Chehab wrote:
> - Place the txt index inside a comment;
> - Use title and chapter markups;
> - Adjust markups for numbered list;
> - Mark literal blocks as such;
> - Use tables markup.
> - Adjust indentation when needed.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../{async-tx-api.txt => async-tx-api.rst}    | 253 +++++++++++-------
>  Documentation/crypto/index.rst                |   2 +
>  Documentation/driver-api/dmaengine/client.rst |   2 +-
>  .../driver-api/dmaengine/provider.rst         |   2 +-

For dmaengine parts:

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
