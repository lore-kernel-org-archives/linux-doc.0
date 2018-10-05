Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 539677D082
	for <lwn-linux-doc@archive.lwn.net>; Fri,  5 Oct 2018 15:33:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727725AbeJEWct (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 5 Oct 2018 18:32:49 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:40820 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727572AbeJEWct (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Oct 2018 18:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=cVmoCc7Fs9SeTMXCAAX1k5IDbnngNCfM3Zdp6msfP0k=; b=vBRkVYBBV0s5yw3fk4cY/iYR9
        jsL6SVYe4htVr9kAwiax0trqGhIgFgr99rblIgwXKlwj+G6CSEb8AQ9urioeXyVi1GDQ3Ch89+WQc
        IUYgTUOg77HPVGUaFCo6gBb9uWPNEgVKwqheU568rCP/PXwcfuA+6iQatY0bVIIL5swyxaopn1BA/
        3MjPo3Fw4VZq1kLppkbb8bKme1JLg1bJuEKhrZccV80jk7CuoSmZCUuURcxqVo5h8r84KnvUaDGjW
        AB9Nr6U6v9s877NJPlPGvLm/HCfagFOtVe5n2h5BR9bApxDmtR7iqVDtxyxSJDjEy+bviIohRPGQR
        LAWpGq3HQ==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1g8S6h-00016E-Gv; Fri, 05 Oct 2018 15:33:35 +0000
Subject: Re: [PATCH 0/2] ext4: even more documentation fixes
To:     "Theodore Y. Ts'o" <tytso@mit.edu>
Cc:     "Darrick J. Wong" <darrick.wong@oracle.com>,
        linux-ext4@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net
References: <153870117116.30837.1220267868954289184.stgit@magnolia>
 <007a23b2-1db3-36fb-3300-f94115d4f2b3@infradead.org>
 <20181005152205.GA22801@thunk.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <830727e5-cb34-9a59-85c8-dd5e3772aeef@infradead.org>
Date:   Fri, 5 Oct 2018 08:33:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181005152205.GA22801@thunk.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/5/18 8:22 AM, Theodore Y. Ts'o wrote:
> On Thu, Oct 04, 2018 at 07:48:31PM -0700, Randy Dunlap wrote:
>> Hi Darrick,
>>
>> I don't see patch 2/2 anywhere (my inbox, email archives)...
> 
> Probably because it's moving a lot of files around, so the diffs were 276k.

Oh, yeah.  Thanks.

-- 
~Randy
