Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F1DC27D071
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Jul 2018 09:11:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbeGMJZQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 13 Jul 2018 05:25:16 -0400
Received: from smtp3-1.goneo.de ([85.220.129.38]:34778 "EHLO smtp3-1.goneo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726364AbeGMJZQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 13 Jul 2018 05:25:16 -0400
X-Greylist: delayed 401 seconds by postgrey-1.27 at vger.kernel.org; Fri, 13 Jul 2018 05:25:15 EDT
Received: from localhost (localhost [127.0.0.1])
        by smtp3.goneo.de (Postfix) with ESMTP id 8CD1F23F3CC;
        Fri, 13 Jul 2018 11:04:49 +0200 (CEST)
X-Virus-Scanned: by goneo
Received: from smtp3.goneo.de ([127.0.0.1])
        by localhost (smtp3.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id KCKOS2fnah-Y; Fri, 13 Jul 2018 11:04:48 +0200 (CEST)
Received: from ryzen (dyndsl-091-096-214-158.ewe-ip-backbone.de [91.96.214.158])
        by smtp3.goneo.de (Postfix) with ESMTPSA id DB39223F11C;
        Fri, 13 Jul 2018 11:04:47 +0200 (CEST)
Message-ID: <9bc6b8f18ee22d9e7aa053a1167a3830a4e8f401.camel@darmarit.de>
Subject: FYI: [PATCH net-next 2/2] docs: networking: Fix failover build
 warnings
From:   Markus Heiser <markus.heiser@darmarit.de>
To:     "Tobin C. Harding" <me@tobin.cc>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Sridhar Samudrala <sridhar.samudrala@intel.com>,
        linux-doc@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Date:   Fri, 13 Jul 2018 11:04:47 +0200
In-Reply-To: <20180711214250.19039-3-me@tobin.cc>
References: <20180711214250.19039-1-me@tobin.cc>
         <20180711214250.19039-3-me@tobin.cc>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hy Tobin, 

> Add '::' before code snippets and indent all snippets uniformly starting
> with 2 spaces.

Just FYI about reST Markup (no need to fix anything in your patch).

You can also add '::' (the markup for literal blocks) at the last line of the
previous paragraph, e.g:

<snip>--- 
Booting a VM with the above configuration will result in the following 3
netdevs created in the VM.::

  4: ens10: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP
group default qlen 1000
      link/ether 52:54:00:00:12:53 brd ff:ff:ff:ff:ff:ff
<snap>---

IMO its more readable in plain text. Anyway it is not wrong to add '::' in a
separated new line ... and thanks for your patch.

If you have any doubt about reST markup, I recommend the primer from the Sphinx
project:

  http://www.sphinx-doc.org/en/stable/rest.html

and the quickref from the (underlying) docutils project:

  http://docutils.sourceforge.net/docs/user/rst/quickref.html

-- Markus --

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
