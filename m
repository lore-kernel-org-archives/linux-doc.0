Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3575C433E9
	for <linux-doc@archiver.kernel.org>; Wed,  3 Mar 2021 10:53:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A77664EDF
	for <linux-doc@archiver.kernel.org>; Wed,  3 Mar 2021 10:53:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237680AbhCCKnF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Mar 2021 05:43:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:43514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1383201AbhCCHTe (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 3 Mar 2021 02:19:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C37CF64ECE;
        Wed,  3 Mar 2021 07:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1614755933;
        bh=4vVVHamDlqu1I17garzJuqfMIjvLp27q4Y6sRtg5exY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a425FmTbSdrjc2JoMvhyukaheXq1A4N7o64GcakWhFpuVmF0DP4BiiEE4NBOGBg+j
         M+Tn878WtKhbyavYpzFkpK2Ij/lEgXwkc99Jz8Jcix7NWDOd+EPQZxto5tjISTg6AJ
         2HkwTKB0ZU0nkkySiS7xvRFwkP1BT/dsbzXkjWiE=
Date:   Wed, 3 Mar 2021 08:18:50 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     davem@davemloft.net, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net] docs: networking: drop special stable handling
Message-ID: <YD84WnwX19boOZTY@kroah.com>
References: <20210303024643.1076846-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303024643.1076846-1-kuba@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 02, 2021 at 06:46:43PM -0800, Jakub Kicinski wrote:
> Leave it to Greg.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


