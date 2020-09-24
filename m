Return-Path: <SRS0=A0dr=DB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EC2C4363D
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 16:24:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C36312311B
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 16:24:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727227AbgIXQYn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Sep 2020 12:24:43 -0400
Received: from ms.lwn.net ([45.79.88.28]:59068 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726516AbgIXQYn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 24 Sep 2020 12:24:43 -0400
X-Greylist: delayed 2466 seconds by postgrey-1.27 at vger.kernel.org; Thu, 24 Sep 2020 12:24:43 EDT
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D08AF2CB;
        Thu, 24 Sep 2020 16:24:42 +0000 (UTC)
Date:   Thu, 24 Sep 2020 10:24:39 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] docs: cdomain.py: add support for two new Sphinx
 3.1+ tags
Message-ID: <20200924102439.18f95779@lwn.net>
In-Reply-To: <64f6f8bc4c416bcf1a6439529346ec6cbcf34ac1.1600963096.git.mchehab+huawei@kernel.org>
References: <cover.1600963096.git.mchehab+huawei@kernel.org>
        <64f6f8bc4c416bcf1a6439529346ec6cbcf34ac1.1600963096.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 24 Sep 2020 18:21:45 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> As part of changing the documentation subsystem to properly
> build with Sphinx 3.1+, add support for two tags:
> 
> 	- :c:expr:`foo`
> 	- .. c:namespace::"

So is there a reason we need :c:expr: ?  What does it add for us?

Thanks,

jon
