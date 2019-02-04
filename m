Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B55367D099
	for <lwn-linux-doc@archive.lwn.net>; Mon,  4 Feb 2019 23:03:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728502AbfBDXDi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 4 Feb 2019 18:03:38 -0500
Received: from ms.lwn.net ([45.79.88.28]:49060 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728074AbfBDXDi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 4 Feb 2019 18:03:38 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 8779E2C0;
        Mon,  4 Feb 2019 23:03:37 +0000 (UTC)
Date:   Mon, 4 Feb 2019 16:03:36 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Tobin C. Harding" <me@tobin.cc>
Cc:     Mike Rapoport <rppt@linux.ibm.com>,
        "Tobin C. Harding" <tobin@kernel.org>,
        Christopher Lameter <cl@linux.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] docs: Use underscore not hyphen in label
Message-ID: <20190204160336.12fe82f6@lwn.net>
In-Reply-To: <20190204211220.GA8601@eros.localdomain>
References: <20190131040623.15569-1-me@tobin.cc>
        <20190131040623.15569-4-me@tobin.cc>
        <20190131092757.GF28876@rapoport-lnx>
        <20190131205608.GB1329@eros.localdomain>
        <20190201160310.5b98eb69@lwn.net>
        <20190202143209.GA8620@rapoport-lnx>
        <20190204211220.GA8601@eros.localdomain>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 5 Feb 2019 08:12:20 +1100
"Tobin C. Harding" <me@tobin.cc> wrote:

> I tried to investigate this further and I am unable to reproduce the
> original warning.  I'm using python virtual environment as directed by
> the output of `make htmldocs` so the environment should not have
> changed.  The only other plausible explanation seems to be that I've
> gone mad and can't remember what I was doing three days ago.

You are not the first to have reported such issues, though; I've seen a
couple of things go by in the past.  Until we understand what is going on,
it's probably best to avoid hyphens in labels.

Thanks,

jon
