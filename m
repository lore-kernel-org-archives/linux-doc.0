Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E94CE7D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 Jan 2019 01:37:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbfAaBh2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 Jan 2019 20:37:28 -0500
Received: from merlin.infradead.org ([205.233.59.134]:56146 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbfAaBh2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Jan 2019 20:37:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=TVLIi6Iir2vQv5YqAibJKXkVudKU+284LRe2sHNamvE=; b=qyZ5z2Rd9NJ7pW8fs8YOY/dI78
        sWfNXuloXy3u/HAF0/tjzqZzCQriz4sKaQjwgeV8yo6noLUfmkCNxIMNJI9yVpR4Inz8beUeXrbBs
        O74N/SzrzNiOBUhSjGljDk7N7XhXSsWSxDvtBj53GRN2+QvqRWSH/fh/8JHC+1iGJa2ABpXpft9cX
        6etLt3OrcF6yE7UMGBfHosX6IH6nBK/lt3UJJF6QV9QrQB0nuwEFGPUDqwBrTXcvb1UKHjwmyE665
        /wql5Gt6/FYahbQyYZydmfABP+38QGd9kCF4CaCX4f0QAXV91P081cEI3Yz/wMf4tN4wEC4VlL65G
        HAnbl7KA==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=dragon.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gp1ID-0003o6-GB; Thu, 31 Jan 2019 01:37:25 +0000
Subject: Re: docs tree
To:     "Tobin C. Harding" <me@tobin.cc>, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
References: <20190131012553.GA30122@eros.localdomain>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <84dc9207-a6c3-f40d-c0be-815a4563fc83@infradead.org>
Date:   Wed, 30 Jan 2019 17:37:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20190131012553.GA30122@eros.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 1/30/19 5:25 PM, Tobin C. Harding wrote:
> Hi Jon,
> 
> Has the docs tree moved?  I haven't fetched it lately and this morning I
> get:
> 
> 	$ git fetch corbet
> 	fatal: unable to connect to git3.lwn.net:
> 	git3.lwn.net[0: 45.79.184.34]: errno=Connection refused
> 
> All my other trees fetch ok.  Relevant .git/config entry is:
> 
>         [remote "corbet"]
>      		url = git://git3.lwn.net/linux.git
> 		fetch = +refs/heads/*:refs/remotes/corbet/*
> 		pushurl = no_push
> 
> 
> thanks,
> Tobin.


Hi Tobin,

The MAINTAINERS file says:
T:	git git://git.lwn.net/linux.git docs-next


cheers.
-- 
~Randy
