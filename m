Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 02EC97D08F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 10 Oct 2018 15:47:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbeJJXKh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 10 Oct 2018 19:10:37 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53844 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbeJJXKh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Oct 2018 19:10:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=8fTn6BowjmQncGclEmbTWHA31igpnwwR4zEcsmI4mK4=; b=Y+09AEv1cgxrgIwkFWXzW1QSf
        GUrwenA/8ottA5hH2NAFdFUqvDoixBV3PYy6M0XdIx5uKYYjcKTu6fpVqlkRfRc7Z/53wpznWhZmE
        0bJ6cZZMUo/hR2siMRmtvkoyNfNvh2pgnaqBaXGQb7JmuywW/kxjgdpcVuyHbVfUsZDBH7SkHhgil
        pFLStmdzO1RPPNeIvdbxFksH/x+1MaIj0EgIuyM8dS41GKjW0krbr1d0W4FEH9W1nAGtv46+l8VuM
        qDJf5FNXW9p15GJHBGdHrSnPmXrfIROnBCpx0K992e2MuhCDqWKUqlpcSMFxTy1k1EMJzVojL5Rkv
        tST2MKc3Q==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gAGiF-0007Sd-15; Wed, 10 Oct 2018 15:47:51 +0000
Subject: Re: [PATCH] docs/completion.txt: Fix a couple of punctuation nits
To:     John Garry <john.garry@huawei.com>, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        peterz@infradead.org, mingo@redhat.com
References: <1539183392-239389-1-git-send-email-john.garry@huawei.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <eca16ac4-50bf-7115-69af-b0d0b48a37b7@infradead.org>
Date:   Wed, 10 Oct 2018 08:47:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1539183392-239389-1-git-send-email-john.garry@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/10/18 7:56 AM, John Garry wrote:
> This patch fixes a couple of punctuation nits which can make the document
> more correct and readable.
> 
> Also missing "()" are added to some function references for consistency.
> 
> Signed-off-by: John Garry <john.garry@huawei.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

thanks,
-- 
~Randy
