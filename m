Return-Path: <SRS0=+dB3=DO=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B10C4363C
	for <linux-doc@archiver.kernel.org>; Wed,  7 Oct 2020 08:57:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E97120797
	for <linux-doc@archiver.kernel.org>; Wed,  7 Oct 2020 08:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602061033;
	bh=mt9j4ybMiuGqNcFFzY34J4q2E0XZfsLXB8bTZq+jQBE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=vBt2uFHIGg4zRGYkAItkBvTGuS1YXSP8S3uA57ITzpmG1pE3uCZKBLX6WP3H/na8t
	 ovLZFclJejsPifmRx9d9IaPllHCgbW8QM/zZ+mLpE6euFmJNHcvObnsIVbbMZg0VkH
	 t+9t2zd9NDAolnBHd4bcB/g5K625yHBR/wMROTFA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbgJGI5I (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Oct 2020 04:57:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:42380 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728050AbgJGI5I (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Oct 2020 04:57:08 -0400
Received: from coco.lan (ip5f5ad5a2.dynamic.kabel-deutschland.de [95.90.213.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8186720797;
        Wed,  7 Oct 2020 08:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602061027;
        bh=mt9j4ybMiuGqNcFFzY34J4q2E0XZfsLXB8bTZq+jQBE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FT9Orr+JhwM6Gzd+5NtrkIa2D7PFMrPstUC5EMjwJd8C9APLdYeFfrLopQdLFi6lG
         3WAt2J98Misru7PQY8zJlmABY3pQABYD8HBDoQAO61vX+38sPvGQO2ay7XHVVSUjxl
         VxxWv9U6AG1fHPDe5oRr7UXpfiJQ4Z1DxBvfZSZQ=
Date:   Wed, 7 Oct 2020 10:57:02 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Ivan Zaentsev <ivan.zaentsev@wirenboard.ru>
Cc:     Evgeniy Polyakov <zbr@ioremap.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Akira Shimahara <akira215corp@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Colin Ian King <colin.king@canonical.com>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Evgeny Boger <boger@wirenboard.com>
Subject: Re: [PATCH 2/2] w1: w1_therm: Add support for GXCAS GX20MH01
 device.
Message-ID: <20201007105702.67988846@coco.lan>
In-Reply-To: <1561045277.20201007103227@wirenboard.ru>
References: <20200904160004.87710-1-ivan.zaentsev@wirenboard.ru>
        <20200904160004.87710-2-ivan.zaentsev@wirenboard.ru>
        <20201006151915.77d044a4@coco.lan>
        <1561045277.20201007103227@wirenboard.ru>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Wed, 7 Oct 2020 10:32:27 +0300
Ivan Zaentsev <ivan.zaentsev@wirenboard.ru> escreveu:

> Tuesday, October 6, 2020, 4:19:15 PM, Mauro Carvalho Chehab wrote:
> 
> >> diff --git a/Documentation/w1/slaves/w1_therm.rst b/Documentation/w1/slaves/w1_therm.rst
> >> index f1148181f53e..00376501a5ef 100644
> >> --- a/Documentation/w1/slaves/w1_therm.rst
> >> +++ b/Documentation/w1/slaves/w1_therm.rst  
> 
> >>  
> >> @@ -130,4 +131,12 @@ conversion and temperature reads 85.00 (powerup value) or 127.94 (insufficient
> >>  power), the driver returns a conversion error. Bit mask ``2`` enables poll for
> >>  conversion completion (normal power only) by generating read cycles on the bus
> >>  after conversion starts. In parasite power mode this feature is not available.
> >> -Feature bit masks may be combined (OR).
> >> +Feature bit masks may be combined (OR). See accompanying sysfs documentation:
> >> +:ref:`Documentation/w1/slaves/w1_therm.rst <w1_therm>`
> >> +  
> 
> > As warned by Sphinx, this cross-reference is broken:  
> 
> >         .../Documentation/w1/slaves/w1_therm.rst:125: WARNING:
> > undefined label: w1_therm (if the link has no caption the label must precede a section header)  
> 
> Would this be ok?

Yeah, sure!

> 
> "More details in Documentation/ABI/testing/sysfs-driver-w1_therm"
> 
> > Not sure what you wanted to point here.  
> 
> A link to a driver's sysfs interface, but sysfs docs are text
> files and seem to not be included in Sphynx Docs.

I sent upstream sometime ago a patch series adding ABI to Sphinx, but I 
was not merged, not sure why:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=abi_patches_v5.6

Yet, the approach such series took were not to convert ABI files
to ReST, but, instead, to use a script that would do that.

The rationale were to avoid needing to touch all ABI files at
the same time[1]. 

In any case, with such approach a cross-reference won't work.

So, I guess that the next best thing to do is to just mention
the file like what you suggested.

[1] It would be easy to run the script I wrote to convert the
files to ReST directly.

Thanks,
Mauro
