Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E745C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 29 Sep 2022 19:18:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbiI2TSo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Sep 2022 15:18:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbiI2TSj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Sep 2022 15:18:39 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AAB3124C34
        for <linux-doc@vger.kernel.org>; Thu, 29 Sep 2022 12:18:39 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0ED62734;
        Thu, 29 Sep 2022 19:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0ED62734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1664479119; bh=f9ksSoEj1+h+wBcjct/1/BkG41SCntUbhQJDW/SqUrY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=k8waAPMfcdXLIHEaHjF0yZ5IFspbqs5XHWSc6raObJ4ATnH4aPy+kCLib7sHBfqe5
         7SN4lQvOs41lJhflfl7DfQbJP4kCjDGuPWhJ/68RElivAFiErW1h0pWUsVGJONjxF6
         4sNS6n5PYrpmDBjViqNJFzoW3tE62Y13dwaErMMf3NkKaEWl+d9clBzxO0UslUE2WG
         qEJYDDemBN1dtrxsNWYIY5LDszG8nKydS9BXL2NPmNrsMEBjpS7+dOvA1N1IkM5+ee
         PcT15B4ZiZZeVJ8qMLzk5r2NLjWDvvhU4gYXgpmCopMpP2FC/Q2Tip3NcmsPhTBjAa
         L1ekjRw9tP7hg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-doc@vger.kernel.org
Cc:     hch@lst.de, jgg@mellanox.com, jhubbard@nvidia.com,
        dan.j.williams@intel.com, yangyingliang@huawei.com
Subject: Re: [PATCH -next] Documentation: devres: add missing IO helper
In-Reply-To: <20220927080215.1359979-1-yangyingliang@huawei.com>
References: <20220927080215.1359979-1-yangyingliang@huawei.com>
Date:   Thu, 29 Sep 2022 13:18:38 -0600
Message-ID: <87o7uygfap.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yang Yingliang <yangyingliang@huawei.com> writes:

> Add missing devm_request_free_mem_region() to devres.rst.
> It's introduced by commit 0092908d16c6 ("mm: factor out a
> devm_request_free_mem_region helper").
>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  Documentation/driver-api/driver-model/devres.rst | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

jon
