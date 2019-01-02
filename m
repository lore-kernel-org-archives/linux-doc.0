Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 03EF97D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 Jan 2019 16:10:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728632AbfABQJt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 Jan 2019 11:09:49 -0500
Received: from ms.lwn.net ([45.79.88.28]:41952 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728163AbfABQJt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 2 Jan 2019 11:09:49 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 28E967DC;
        Wed,  2 Jan 2019 16:09:49 +0000 (UTC)
Date:   Wed, 2 Jan 2019 09:09:48 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tejun Heo <tj@kernel.org>
Cc:     Otto Sabart <ottosabart@seberm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] doc: cgroup: highlight all paths using the :file:
 inline markup
Message-ID: <20190102090948.1500a4a8@lwn.net>
In-Reply-To: <20190102160149.GQ2509588@devbig004.ftw2.facebook.com>
References: <20181230165044.GA3097@personal>
        <20190102160149.GQ2509588@devbig004.ftw2.facebook.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2 Jan 2019 08:01:49 -0800
Tejun Heo <tj@kernel.org> wrote:

> On Sun, Dec 30, 2018 at 05:50:44PM +0100, Otto Sabart wrote:
> > Improve readability using the :file: markup.  
> 
> Heh, that's a minor plus for formatted output and minor minus for the
> source.  If this is a convention generally followed for
> documentations, I have no objects.  That said, can you please reflow
> the lines?

The convention is to minimize markup, especially in cases where it's not
really needed and it impairs the readability of the plain-text file.  My
feeling is that this particular markup doesn't provide enough benefit to
be worth the cost.  

Otto, we all very much appreciate attempts to improve the documentation,
and I hope you won't stop.  If you would like to do RST work, one very
helpful thing would be to look into the conversion of the (many) remaining
plain-text documents and integration into the doc tree.

Thanks,

jon
