Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B63FC7DE78
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 03:07:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753941AbeEHDHr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 23:07:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:57008 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753958AbeEHDHo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 7 May 2018 23:07:44 -0400
Received: from localhost (LFbn-1-12247-202.w90-92.abo.wanadoo.fr [90.92.61.202])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 39EEB217B4;
        Tue,  8 May 2018 03:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1525748863;
        bh=zCdJ67XhWLsLGy/TVU5+Wfpw+AC5+7yt06NbuXWD9mo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WeJhLRAEJHu4F0ryJWB+Pq7EpzNksclNxTHCDgW7ZrSPfMQ0aiiNeAn3YrWy+7zGW
         zBY+DMnbHu6wquS67kg1bNqr13dfVUs1ZYv1VwPqMSJFmeRWg8Fl7z5tSfOw7fjDUD
         yjMQhaajb5rNpN+8JNxewSwORAK67N8nfKFYe84o=
Date:   Tue, 8 May 2018 05:07:30 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vinod Koul <vinod.koul@intel.com>,
        Thierry Reding <treding@nvidia.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Ingo Molnar <mingo@kernel.org>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 03/18] docs: */index.rst: Add newer documents to their
 respective index.rst
Message-ID: <20180508030730.GC1882@kroah.com>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
 <e6852448ac11e827f86dab1e183b82af6a320559.1525684985.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6852448ac11e827f86dab1e183b82af6a320559.1525684985.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 07, 2018 at 06:35:39AM -0300, Mauro Carvalho Chehab wrote:
> A number of new docs were added, but they're currently not on
> the index.rst from the session they're supposed to be, causing
> Sphinx warnings.
> 
> Add them.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
