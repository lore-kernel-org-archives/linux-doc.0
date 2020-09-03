Return-Path: <SRS0=8YJ4=CM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52214C433E9
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 15:47:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2740120786
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 15:47:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728354AbgICPrS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Sep 2020 11:47:18 -0400
Received: from ms.lwn.net ([45.79.88.28]:58412 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726368AbgICPrS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Sep 2020 11:47:18 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D39B27DA;
        Thu,  3 Sep 2020 15:47:17 +0000 (UTC)
Date:   Thu, 3 Sep 2020 09:47:16 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Drew DeVault <sir@cmpwn.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/4] Documentation/process: expand plain-text advice
Message-ID: <20200903094716.5ca6f7d6@lwn.net>
In-Reply-To: <20200902155759.55895-3-sir@cmpwn.com>
References: <20200902155759.55895-1-sir@cmpwn.com>
        <20200902155759.55895-3-sir@cmpwn.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed,  2 Sep 2020 11:57:57 -0400
Drew DeVault <sir@cmpwn.com> wrote:

> This adds a link to https://useplaintext.email to email-clients.rst,
> which is a more exhaustive resource on configuring various mail clients
> for plain text use. submitting-patches.rst is also updated to direct
> readers to email-clients.rst to equip new contributors with the
> requisite knowledge to become a good participant on the mailing lists.
> 
> Signed-off-by: Drew DeVault <sir@cmpwn.com>

This one seems good to me; it doesn't quite apply without patch 1, but
it's otherwise ready to go, I think.

Thanks,

jon
