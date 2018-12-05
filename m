Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4ECA17D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Dec 2018 19:30:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727523AbeLETaZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Dec 2018 14:30:25 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:42920 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727297AbeLETaY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Dec 2018 14:30:24 -0500
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::bf5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 9452A1452B3E7;
        Wed,  5 Dec 2018 11:30:23 -0800 (PST)
Date:   Wed, 05 Dec 2018 11:30:20 -0800 (PST)
Message-Id: <20181205.113020.101544977962047466.davem@davemloft.net>
To:     jakub.kicinski@netronome.com
Cc:     corbet@lwn.net, oss-drivers@netronome.com, netdev@vger.kernel.org,
        jesse.brandeburg@intel.com, dsahern@gmail.com, jiri@resnulli.us,
        stephen@networkplumber.org, henrik@austad.us,
        linux-doc@vger.kernel.org
Subject: Re: [RFC] net: documentation: build a directory structure for
 drivers
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20181204233455.41e78793@cakuba.netronome.com>
References: <20181204014328.14424-1-jakub.kicinski@netronome.com>
        <20181204.211327.172944025163036359.davem@davemloft.net>
        <20181204233455.41e78793@cakuba.netronome.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 05 Dec 2018 11:30:24 -0800 (PST)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Jakub Kicinski <jakub.kicinski@netronome.com>
Date: Tue, 4 Dec 2018 23:34:55 -0800

> On Tue, 04 Dec 2018 21:13:27 -0800 (PST), David Miller wrote:
>> From: Jakub Kicinski <jakub.kicinski@netronome.com>
>> Date: Mon,  3 Dec 2018 17:43:28 -0800
>> 
>> > Documentation/networking/ is full of cryptically named files with
>> > driver documentation.  This makes finding interesting information
>> > at a glance really hard.  Move all those files into a directory
>> > called device_drivers (since not all drivers are for device) and
>> > fix up references.
>> > 
>> > RFC v0.1 -> RFC v1:
>> >  - also add .txt suffix to the files which are missing it (Quentin)
>> > 
>> > Signed-off-by: Jakub Kicinski <jakub.kicinski@netronome.com>
>> > Reviewed-by: Quentin Monnet <quentin.monnet@netronome.com>
>> > ---
>> > I'm posting as an RFC to see what the general feeling is about
>> > such a patch.  I can split into per-driver changes later if that's
>> > the best way forward.  
>> 
>> I'm fine with this patch as-is.
>> 
>> Do you mind if I just apply it to net-next?
> 
> Not at all.  

Ok, done.
