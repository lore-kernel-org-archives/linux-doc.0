Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AE9A47D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Mar 2019 16:49:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfCEQtt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Mar 2019 11:49:49 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:42192 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726221AbfCEQtt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Mar 2019 11:49:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=bFk91jKxd3aIAkFlI94CiNWivddxpmM/piQyxKdIfmU=; b=eTxQ5CJPZS9cH6D8BO3QRg6iB
        GhvuEUxuHh9xggxAwsfVuIfZPseWCmcBxBGlGqWBxAOdPMVS7C+MbF/CR5/sm1/lZtzkYimAbxCTE
        t/yWIvlavZPjsdZPV0RpUSQKG4nVks/REJ72KuKgZI5/LKmsdClA3WJ3zOUPpsQ01r+PBHpzeOj38
        nvsW5VNpfEdHYWytPWs5phnzCNWIKphYUYXuMgQobu11F+Wv/8uP9f7gYFlwgbi04zS9AN8T+zZT2
        qi+jtbBmieFgYAzQ4v2azMLhWNVw2xGv8/vO6ZcuMgY81vECqSwDpFcdrXqwSwYSXd6ORsQMTWJiM
        ibKkrHoTg==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1h1DGG-0000g1-47; Tue, 05 Mar 2019 16:49:48 +0000
Subject: Re: [PATCH] Documentation: admin-guide: Fix minimum required gcc
 version
To:     =?UTF-8?Q?Timoth=c3=a9e_Isnard?= <timotheecisnard@gmail.com>,
        linux-doc@vger.kernel.org
Cc:     corbet@lwn.net, trivial@kernel.org
References: <20190305105303.30838-1-timotheecisnard@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <aa1db51a-f13f-6dd9-9350-2ba5950d1777@infradead.org>
Date:   Tue, 5 Mar 2019 08:49:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190305105303.30838-1-timotheecisnard@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 3/5/19 2:53 AM, Timothée Isnard wrote:
> Signed-off-by: Timothée Isnard <timotheecisnard@gmail.com>
> ---
>  Documentation/admin-guide/README.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

already sent and merged into the docs tree:

https://lore.kernel.org/lkml/ecb653af-79e5-6233-a7f6-edbb61715d3b@infradead.org/

> diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
> index 47e577264198..a582c780c3bd 100644
> --- a/Documentation/admin-guide/README.rst
> +++ b/Documentation/admin-guide/README.rst
> @@ -251,7 +251,7 @@ Configuring the kernel
>  Compiling the kernel
>  --------------------
>  
> - - Make sure you have at least gcc 3.2 available.
> + - Make sure you have at least gcc 4.6 available.
>     For more information, refer to :ref:`Documentation/process/changes.rst <changes>`.
>  
>     Please note that you can still run a.out user programs with this kernel.
> 


-- 
~Randy
