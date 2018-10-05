Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 336D17D082
	for <lwn-linux-doc@archive.lwn.net>; Fri,  5 Oct 2018 02:48:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbeJEJpU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 5 Oct 2018 05:45:20 -0400
Received: from merlin.infradead.org ([205.233.59.134]:38772 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbeJEJpU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Oct 2018 05:45:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=c5EYHEV82TQ2GZ9nUAsKPMii9X6uR0T0q/WTR3N0YqU=; b=MV+cECIbxoBT6ihH+Wo+zgQ6w6
        CibEyGpHDLCfxbYdH4FoKwgD/S1jUsuDydYWBAz91eP+im159lxQCFFaIxdRYvDU39Aovi/1FpNJ9
        iG43dm8XTNHMng422TDn4YTqq7wg0q9bma0lAfHd3nDfSHgpw0lj1Izem3rltYNwWiPAOIHxtbPUb
        0aC1EsCbe9Ep9CjdT0Kdih5xdNYh2aQZ+7GVesORTvtqOIT07cZnysz89tMaQuEiP3HyHl6cQ7YZc
        4DfaFVFodj2GXGdAr7BkKkwKv01uMzBM+ZOsOkJny/RWWesRf9wboL5GbchaJKXRV5NOgq28iKvCM
        QLT1wULQ==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=vortex.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1g8GAR-0000D8-M4; Fri, 05 Oct 2018 02:48:40 +0000
Subject: Re: [PATCH 0/2] ext4: even more documentation fixes
To:     "Darrick J. Wong" <darrick.wong@oracle.com>, tytso@mit.edu
Cc:     linux-ext4@vger.kernel.org, linux-doc@vger.kernel.org,
        corbet@lwn.net
References: <153870117116.30837.1220267868954289184.stgit@magnolia>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <007a23b2-1db3-36fb-3300-f94115d4f2b3@infradead.org>
Date:   Thu, 4 Oct 2018 19:48:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <153870117116.30837.1220267868954289184.stgit@magnolia>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/4/18 5:59 PM, Darrick J. Wong wrote:
> Hi all,
> 
> This series fixes some problems that were brought up during review for
> the XFS documentation which I hadn't known about when pushing the ext4
> documentation during the 4.19 cycle.
> 
> The first patch moves the ext4 mount option and sysfs knob information
> into the Linux administration guide.
> 
> The second patch moves the ext4 Data Structures & Algorithms book up a
> level since it's a self-contained documentation book.
> 
> I've built the docs and put them here, in case you hate reading rst:
> https://djwong.org/docs/kdoc/filesystems/ext4/index.html
> 
> The patchset should apply cleanly against 4.19-rc6.  Comments and
> questions are, as always, welcome.

Hi Darrick,

I don't see patch 2/2 anywhere (my inbox, email archives)...

-- 
~Randy
