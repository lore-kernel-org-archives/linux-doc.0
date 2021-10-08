Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6D2C433F5
	for <linux-doc@archiver.kernel.org>; Fri,  8 Oct 2021 16:01:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24D4260F4F
	for <linux-doc@archiver.kernel.org>; Fri,  8 Oct 2021 16:01:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233427AbhJHQDb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Oct 2021 12:03:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:55710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230512AbhJHQDa (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 8 Oct 2021 12:03:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF7C360F58;
        Fri,  8 Oct 2021 16:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633708895;
        bh=bEWdIQv6cKWdUAsG60DmbodPiS4zWls1tuuWMg14+lY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sT4zGBXdS40msvzkS47n7JRzXb18L7/CZAykHPWUmRcriMopc8RmmcYQNNkK4u68q
         8ab+HcNTmVoVOOnnp4m64Wg2MKi3zw0cdR0eWnCG/AC3+R93EaTWqMy+a++PQ0Yd5l
         Y/Q8iPT+XbSma14yqvtY6rJrdx9o8shoaTqzjqL0=
Date:   Fri, 8 Oct 2021 18:01:33 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jason Baron <jbaron@akamai.com>
Cc:     Andrew Halaney <ahalaney@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jim Cromie <jim.cromie@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Trivial dynamic debug fixups
Message-ID: <YWBrXZrqdoETlqWG@kroah.com>
References: <20210920205444.20068-1-ahalaney@redhat.com>
 <670b5afa-0d76-7e78-2b31-f1d4355dd026@akamai.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <670b5afa-0d76-7e78-2b31-f1d4355dd026@akamai.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 08, 2021 at 11:58:57AM -0400, Jason Baron wrote:
> Adding Greg to this (should have added him earlier)
> 
> Greg, if you are ok with this series, we'd like to have it added
> to -next.

What series?

Have a pointer to it?  It would help if it was actually sent to me if
people want it applied...

thanks,

greg k-h
