Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8F9C433DB
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jan 2021 20:00:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1AFD2054F
	for <linux-doc@archiver.kernel.org>; Mon, 11 Jan 2021 20:00:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391277AbhAKUA0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Jan 2021 15:00:26 -0500
Received: from ms.lwn.net ([45.79.88.28]:59842 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391252AbhAKUAZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 11 Jan 2021 15:00:25 -0500
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 291FC728;
        Mon, 11 Jan 2021 19:59:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 291FC728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1610395185; bh=XxFewXu61LUMETyFHIkWQGnRUKIhqZyZgujI+om5BzU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bmC9J1INqHz3s4h1ao5FOQfuvx8s2vUOJXayNTAyL1Dg9LOZ2VPUNGRVFmnnM+9Y4
         E+HvJvMIFY2ZOp/qW+o1NBIXisLmij/VHlWGejMOOy4N9YdL+Tbms07L5VoYu2iox2
         eFmlSkDk4cnuUK/W4VCLqGBQi/j+zz5XKQgi4zZm3Fp41tdG3HYHw9t7Lcsv91nu9w
         ERn2kFRLCLwvZDnjrJTJUS2tuCA1BYSjlW/3BGuazs7blBulUif9vlaMUk4gUynTpa
         eIANkGDkkwYzNPc3mXcExFp34TBi7rVDa4TGfU0Zu7K0uw0UILbRlp+xYlxF1sZdcd
         KFSWqbnwqRF3A==
Date:   Mon, 11 Jan 2021 12:59:44 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Ira Weiny <ira.weiny@intel.com>
Cc:     Hao Li <lihao2018.fnst@cn.fujitsu.com>, davem@davemloft.net,
        gregkh@linuxfoundation.org, alexander.deucher@amd.com,
        mchehab+huawei@kernel.org, lee.jones@linaro.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation/dax: Update description of DAX policy
 changing
Message-ID: <20210111125944.13f93eb7@lwn.net>
In-Reply-To: <20210106054541.GR3097896@iweiny-DESK2.sc.intel.com>
References: <20210106015000.5263-1-lihao2018.fnst@cn.fujitsu.com>
        <20210106054541.GR3097896@iweiny-DESK2.sc.intel.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 5 Jan 2021 21:45:41 -0800
Ira Weiny <ira.weiny@intel.com> wrote:

> On Wed, Jan 06, 2021 at 09:50:00AM +0800, Hao Li wrote:
> > After commit 77573fa310d9 ("fs: Kill DCACHE_DONTCACHE dentry even if
> > DCACHE_REFERENCED is set"), changes to DAX policy will take effect
> > as soon as all references to this file are gone.
> > 
> > Update the documentation accordingly.
> > 
> > Signed-off-by: Hao Li <lihao2018.fnst@cn.fujitsu.com>  
> 
> LGTM
> 
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>

Applied, thanks.

jon
