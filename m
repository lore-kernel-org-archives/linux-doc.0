Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 771DEC6FD1F
	for <linux-doc@archiver.kernel.org>; Thu, 23 Mar 2023 01:07:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjCWBHE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Mar 2023 21:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjCWBHE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Mar 2023 21:07:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF1932798B;
        Wed, 22 Mar 2023 18:06:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 553656237B;
        Thu, 23 Mar 2023 01:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AB53C433D2;
        Thu, 23 Mar 2023 01:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679533618;
        bh=RoGVNrMnM2MNBp0dqcQAezNTO1axws6G/zVkGqChpHM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jKAhnR43hrp5CEWtRDh+vdKAoU91kW9aBeYWLs+Z7uyvu2DX2vgrDMxSj2VZptYPb
         BbA1UEyYW7+IKBJpvSmzERgFmhcapiSL/kfJG0/p/pCatKD73P6eFKJBUZb15KcXa/
         LYAqoVcj6MjCT8fiwtGI0myIp3aS9utx+ldKcvxhmp45kLCHAVpwKWZBgvwPJjTjtx
         VHJxSmjH20i20AxzXw2MFjaisNB3/tmp6tQfKf6jCbKAbA/+YVkTqvN7q0sKnofSi8
         McWiixlEIhSk1b15E+jd4eibP7KXcFB2FxUN10gmrFDnU33rpTL3Q6LRMMb1O/xN7V
         p5+1+fdVdGkGw==
Date:   Wed, 22 Mar 2023 18:06:57 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
        pabeni@redhat.com, sean.anderson@seco.com, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] docs: netdev: add note about Changes Requested
 and revising commit messages
Message-ID: <20230322180657.41903d30@kernel.org>
In-Reply-To: <af2e9958-d624-d5fc-9403-a082ff15df9a@infradead.org>
References: <20230322231202.265835-1-kuba@kernel.org>
        <af2e9958-d624-d5fc-9403-a082ff15df9a@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 22 Mar 2023 16:38:53 -0700 Randy Dunlap wrote:
> > +had to ask in previous discussions. Occasionally the update of  
> 
> asked in previous discussions.

"had to ask" as in were forced to ask due to a poor commit message,
is that not a valid use of "had to"?
