Return-Path: <SRS0=DBCI=DP=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84634C433E7
	for <linux-doc@archiver.kernel.org>; Thu,  8 Oct 2020 07:46:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F18A21924
	for <linux-doc@archiver.kernel.org>; Thu,  8 Oct 2020 07:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602143163;
	bh=f7syuYxd7pSyhG15DMcL/MnkQd064/mINipKDjU5y24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=LJCDSiuX34+KyLx54GqG+k82+DHit1MCUSxQX7eEW9Naw3Aw+0DD+uh7JjnKMNzIv
	 8GOXGVnP4lr8I3l20Zdgm9SU801G9IX0I5sYrMRIXNGovUwhGtTQhN1fPzk2f2svfV
	 TNtgR7KcB3FKGu8YqZ372VhvnRJ31DCRtahtlGkc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbgJHHqC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Oct 2020 03:46:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:33028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725899AbgJHHqC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 8 Oct 2020 03:46:02 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8AFB12184D;
        Thu,  8 Oct 2020 07:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602143162;
        bh=f7syuYxd7pSyhG15DMcL/MnkQd064/mINipKDjU5y24=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ziYjLr6LpIQL87bJTZ91Y2DWZOoxyDdn3yh6gWeueXlhh0cZ9gVORmNuEP6wn5plA
         c7Hkwa1jnzQ31SjOaZxxxsUUs3+PqtQDeArV0VnRt+lM3Dgtcg5joTROF0QbzWatrI
         pqfTR9i3LYEar4rLpG0vRF6OUtY+LXo1V6NFG1gk=
Date:   Thu, 8 Oct 2020 09:46:46 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Ivan Zaentsev <ivan.zaentsev@wirenboard.ru>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Akira Shimahara <akira215corp@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Colin Ian King <colin.king@canonical.com>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Evgeny Boger <boger@wirenboard.com>
Subject: Re: [PATCH] docs: w1: w1_therm: Fix broken xref, mistakes, clarify
 text
Message-ID: <20201008074646.GA247801@kroah.com>
References: <20201008054259.5461-1-ivan.zaentsev@wirenboard.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201008054259.5461-1-ivan.zaentsev@wirenboard.ru>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 08, 2020 at 08:42:59AM +0300, Ivan Zaentsev wrote:
> sysfs attribute names are mixed with the same normal text terms.
> Use ReST to distinguish.
> 
> Fix typos and mistakes.
> 
> Signed-off-by: Ivan Zaentsev <ivan.zaentsev@wirenboard.ru>

You forgot a "Reported-by:" line in here.  I'll go add that...

thanks,

greg k-h
