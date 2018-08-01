Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 218C67DF75
	for <lwn-linux-doc@archive.lwn.net>; Wed,  1 Aug 2018 17:43:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407744AbeHATRM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 1 Aug 2018 15:17:12 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:49890 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407546AbeHATRL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Aug 2018 15:17:11 -0400
Received: from localhost (c-24-20-22-31.hsd1.or.comcast.net [24.20.22.31])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 21ECA100A39AE;
        Wed,  1 Aug 2018 09:52:55 -0700 (PDT)
Date:   Wed, 01 Aug 2018 09:52:54 -0700 (PDT)
Message-Id: <20180801.095254.162481197087516714.davem@davemloft.net>
To:     petrm@mellanox.com
Cc:     netdev@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, corbet@lwn.net, jiri@mellanox.com,
        idosch@mellanox.com, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org,
        shuah@kernel.org, nikolay@cumulusnetworks.com, dsahern@gmail.com
Subject: Re: [PATCH net-next v2 0/7] ipv4: Control SKB reprioritization
 after forwarding
From:   David Miller <davem@davemloft.net>
In-Reply-To: <cover.1533076217.git.petrm@mellanox.com>
References: <cover.1533076217.git.petrm@mellanox.com>
X-Mailer: Mew version 6.7 on Emacs 26 / Mule 6.0 (HANACHIRUSATO)
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 01 Aug 2018 09:52:55 -0700 (PDT)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Petr Machata <petrm@mellanox.com>
Date: Wed, 01 Aug 2018 00:35:53 +0200

> After IPv4 packets are forwarded, the priority of the corresponding SKB
> is updated according to the TOS field of IPv4 header. This overrides any
> prioritization done earlier by e.g. an skbedit action or ingress-qos-map
> defined at a vlan device.
> 
> Such overriding may not always be desirable. Even if the packet ends up
> being routed, which implies this is an L3 network node, an administrator
> may wish to preserve whatever prioritization was done earlier on in the
> pipeline.
> 
> Therefore this patch set introduces a sysctl that controls this
> behavior, net.ipv4.ip_forward_update_priority. It's value is 1 by
> default to preserve the current behavior.
> 
> All of the above is implemented in patch #1.
> 
> Value changes prompt a new NETEVENT_IPV4_FWD_UPDATE_PRIORITY_UPDATE
> notification, so that the drivers can hook up whatever logic may depend
> on this value. That is implemented in patch #2.
> 
> In patches #3 and #4, mlxsw is adapted to recognize the sysctl. On
> initialization, the RGCR register that handles router configuration is
> set in accordance with the sysctl. The new notification is listened to
> and RGCR is reconfigured as necessary.
> 
> In patches #5 to #7, a selftest is added to verify that mlxsw reflects
> the sysctl value as necessary. The test is expressed in terms of the
> recently-introduced ieee_setapp support, and works by observing how DSCP
> value gets rewritten depending on packet priority. For this reason, the
> test is added to the subdirectory drivers/net/mlxsw. Even though it's
> not particularly specific to mlxsw, it's not suitable for running on
> soft devices (which don't support the ieee_setapp et.al.).
 ...

Series applied, thank you.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
