Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 671777D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 27 Feb 2019 21:21:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730136AbfB0VVC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 27 Feb 2019 16:21:02 -0500
Received: from proxima.lasnet.de ([78.47.171.185]:42696 "EHLO
        proxima.lasnet.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730105AbfB0VVC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Feb 2019 16:21:02 -0500
Received: from localhost.localdomain (p200300E9D725588FF6636196BCBB06B8.dip0.t-ipconnect.de [IPv6:2003:e9:d725:588f:f663:6196:bcbb:6b8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: stefan@datenfreihafen.org)
        by proxima.lasnet.de (Postfix) with ESMTPSA id 34058CA69C;
        Wed, 27 Feb 2019 22:20:59 +0100 (CET)
Subject: Re: [PATCH 0/2] doc: net: ieee802154: move from plain text to rst
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     davem@davemloft.net, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-wpan@vger.kernel.org
References: <20190227195914.4594-1-stefan@datenfreihafen.org>
 <20190227131856.2a9cfdde@lwn.net>
From:   Stefan Schmidt <stefan@datenfreihafen.org>
Message-ID: <5c1ff7e8-ed89-9d93-a9f7-b36248efb3ed@datenfreihafen.org>
Date:   Wed, 27 Feb 2019 22:20:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190227131856.2a9cfdde@lwn.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Jon.

On 27.02.19 21:18, Jonathan Corbet wrote:
> On Wed, 27 Feb 2019 20:59:12 +0100
> Stefan Schmidt <stefan@datenfreihafen.org> wrote:
> 
>> The patches are based on net-next, but they only touch the networking book so I
>> would not expect and trouble. From what I have seen they would go through
>> Jonathan's tree after being acked by Dave? If you want this patches against a
>> different tree let me know.
> 
> Usually Dave takes networking documentation patches directly, so that is
> what I would expect here.

OK, so I got that wrong. Works for me. Dave, you want to take them
directly, if nothing else comes up during review, or should I apply them
to my tree and send them with the next pull request?

> I took a quick look anyway; seems generally good.  The main comment I
> would make is that much of what's there would be better placed as
> kerneldoc comments in the code itself that can then be pulled into the
> formatted docs.  But that can be a job for another day...

Interesting point. That might be indeed a good idea on some parts of
this sparse doc. Need to check how this is handled in other docs. It
also needs extending scope and context, but again something for a follow
up patchset.

regards
Stefan Schmidt


