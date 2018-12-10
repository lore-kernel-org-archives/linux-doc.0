Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7A94C7D089
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Dec 2018 06:06:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbeLJGGp (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Dec 2018 01:06:45 -0500
Received: from imap.thunk.org ([74.207.234.97]:41090 "EHLO imap.thunk.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726422AbeLJGGo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 10 Dec 2018 01:06:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=thunk.org;
         s=ef5046eb; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=k2uo0/vB27zkNp2h/w5RUklfsPuynkqE2vL21peVqe8=; b=DJ5+LkNF9XL/SbDcy20sBEp+p4
        XK3LXFG4JBJxqFTHv0tG9jBdNEsL/NTsNipx0orN8rQNQxOataKKt4mWhzsZEYtkGUYVyqMXvwVNt
        sYQbNbHlukJks0Msc9s/hwxRYg+wDC+6lY4uPWlmXfKt9VQs8oMXuLg/EIDcbyJE+ET0=;
Received: from root (helo=callcc.thunk.org)
        by imap.thunk.org with local-esmtp (Exim 4.89)
        (envelope-from <tytso@thunk.org>)
        id 1gWEhn-0004TR-Uf; Mon, 10 Dec 2018 06:06:12 +0000
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id 5286C7A492E; Mon, 10 Dec 2018 01:06:10 -0500 (EST)
Date:   Mon, 10 Dec 2018 01:06:10 -0500
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Chandan Rajendra <chandan@linux.vnet.ibm.com>
Cc:     linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
        linux-doc@vger.kernel.org, linux-mips@linux-mips.org,
        linux-s390@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-fsdevel@vger.kernel.org, adilger.kernel@dilger.ca,
        ebiggers@kernel.org, jaegeuk@kernel.org, yuchao0@huawei.com,
        corbet@lwn.net, ralf@linux-mips.org, paul.burton@mips.com,
        jhogan@kernel.org, green.hu@gmail.com, deanbo422@gmail.com,
        schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, richard@nod.at,
        dedekind1@gmail.com, adrian.hunter@intel.com,
        viro@zeniv.linux.org.uk
Subject: Re: [PATCH V3 0/9] Remove fs specific fscrypt and fsverity build
 config options
Message-ID: <20181210060610.GJ1840@mit.edu>
References: <20181208065144.19486-1-chandan@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181208065144.19486-1-chandan@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tytso@thunk.org
X-SA-Exim-Scanned: No (on imap.thunk.org); SAEximRunCond expanded to false
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Chandan,

Thanks!  I've applied this patch series to the fscrypt git tree.

	      	      	   	 	- Ted
