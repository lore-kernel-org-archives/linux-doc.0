Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 17E467D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Dec 2018 15:54:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730951AbeLTPyE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Dec 2018 10:54:04 -0500
Received: from ms.lwn.net ([45.79.88.28]:53534 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728172AbeLTPyE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 20 Dec 2018 10:54:04 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 13A726D9;
        Thu, 20 Dec 2018 15:54:04 +0000 (UTC)
Date:   Thu, 20 Dec 2018 08:54:03 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     NeilBrown <neilb@suse.com>
Cc:     linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] Documentation: convert path-lookup from markdown to
 resturctured text
Message-ID: <20181220085403.5538683d@lwn.net>
In-Reply-To: <87h8fmcnoi.fsf@notabene.neil.brown.name>
References: <87k1l9dgx9.fsf@notabene.neil.brown.name>
        <87sgzc7v50.fsf@notabene.neil.brown.name>
        <20181205124644.3f8a452a@lwn.net>
        <87woonelit.fsf@notabene.neil.brown.name>
        <20181206100912.535b351d@lwn.net>
        <87h8fmcnoi.fsf@notabene.neil.brown.name>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 10 Dec 2018 09:58:37 +1100
NeilBrown <neilb@suse.com> wrote:

> However we now have a stub section "Pathname lookup" which serves only
> to introduce another stub sectoin "Pathname lookup in Linux", which does
> little more than introduce the rest of the section.
> This seems inelegant, and is probably why I went for the "include"
> approach.
> 
> What would you think of something more like the following?

Sorry for the delay ... $EXCUSES ...

This makes sense; I went ahead and applied it with your SOB on it; let me
know if that's not what you wanted.

Thanks,

jon
