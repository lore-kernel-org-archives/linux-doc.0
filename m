Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 685E77D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 27 Feb 2019 20:19:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730265AbfB0US6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 27 Feb 2019 15:18:58 -0500
Received: from ms.lwn.net ([45.79.88.28]:56128 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730240AbfB0US5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 27 Feb 2019 15:18:57 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 44ED52D5;
        Wed, 27 Feb 2019 20:18:57 +0000 (UTC)
Date:   Wed, 27 Feb 2019 13:18:56 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stefan Schmidt <stefan@datenfreihafen.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-wpan@vger.kernel.org
Subject: Re: [PATCH 0/2] doc: net: ieee802154: move from plain text to rst
Message-ID: <20190227131856.2a9cfdde@lwn.net>
In-Reply-To: <20190227195914.4594-1-stefan@datenfreihafen.org>
References: <20190227195914.4594-1-stefan@datenfreihafen.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 27 Feb 2019 20:59:12 +0100
Stefan Schmidt <stefan@datenfreihafen.org> wrote:

> The patches are based on net-next, but they only touch the networking book so I
> would not expect and trouble. From what I have seen they would go through
> Jonathan's tree after being acked by Dave? If you want this patches against a
> different tree let me know.

Usually Dave takes networking documentation patches directly, so that is
what I would expect here.

I took a quick look anyway; seems generally good.  The main comment I
would make is that much of what's there would be better placed as
kerneldoc comments in the code itself that can then be pulled into the
formatted docs.  But that can be a job for another day...

Thanks,

jon
