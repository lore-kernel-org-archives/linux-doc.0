Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 750567E22E
	for <lwn-linux-doc@archive.lwn.net>; Sat, 14 Apr 2018 17:45:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751173AbeDNRo5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 14 Apr 2018 13:44:57 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:42826 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751138AbeDNRo4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 14 Apr 2018 13:44:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=sWa71oN7mLVuaySuiM97pOLYalmyYuFD2BAhXmtC2VY=; b=UpEBAwgbwsthzhA0Uhm69uiAQ
        /2fbWWBb+W3iTZq3ust9MwYuhzUf3NqPAwxio01+6qN6tHj0sIoByXBYoKXNasAe2lUo7yHeG4tig
        5mFqDVuHHUUL3hTf6w4cmmZ2NG4X1B/dNSlmiRaP+lJoPvw4mJ6Ozwzvu1bATY16AlIpfSFGSHCPU
        VDQHGvCHp7TyjAkhjTQBcI5qCBz/DL0DTREAKj6U4yoSuziNJq4JfO+OOK9Bb0DO2HfcxRKQRL0r8
        6SYo3oO/ygMPkhDGDllLo0jWr59iajJOJgFpfR3bYh7JZVO97lmztcX3XcJ7mZZGwAdpXzGOaEiKd
        RmwikXHiA==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1f7PEN-0007A6-9x; Sat, 14 Apr 2018 17:44:56 +0000
Subject: Re: target documentation patches?
From:   Randy Dunlap <rdunlap@infradead.org>
To:     "Nicholas A. Bellinger" <nab@linux-iscsi.org>,
        target-devel <target-devel@vger.kernel.org>
Cc:     linux-scsi <linux-scsi@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <e2bc69ce-2270-7996-ca50-928fa3c71ffa@infradead.org>
Message-ID: <b7b5adf9-2e1b-c5ce-8f54-90468d3da252@infradead.org>
Date:   Sat, 14 Apr 2018 10:44:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <e2bc69ce-2270-7996-ca50-928fa3c71ffa@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 02/22/2018 04:38 PM, Randy Dunlap wrote:
> Hi Nicholas,
> 
> I posted several patches for target documentation cleanups and adding
> a chapter to the driver-api chapter back in December.
> 
> Do I need to repost those?  Do you want someone else to merge them, even
> though several of them are in drivers/target/ ?


[no response in 7 weeks]
[adding linux-doc list]


I have a new 4-patch series for target kernel-doc fixes and adding
Documentation/driver-api/target.rst.  However, I am wondering who will
merge the series.

I'll post the series to target-devel, linux-scsi, and linux-doc.
Hopefully one of the maintainers there will apply them.


thanks,
-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
