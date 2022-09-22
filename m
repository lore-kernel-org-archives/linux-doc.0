Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C93EC6FA8B
	for <linux-doc@archiver.kernel.org>; Thu, 22 Sep 2022 05:41:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbiIVFlV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Sep 2022 01:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbiIVFlR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Sep 2022 01:41:17 -0400
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F01967C777;
        Wed, 21 Sep 2022 22:41:16 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1663825274;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3o5jnHwQWCGnKdAACfGC/dEXqfoHhsVb5vQTbV0mozg=;
        b=e9CSu7xsoCLhIqAEWsdYCpQ+AwZ7FgnQqI2SuOS3peJmrJ32AduWPYpEn3P8K6WR29fHYy
        yTNpD4YHd9ve8cALB5CH0W7d2CzTQHYBNqVQ3gmSpkHxPxj50/79ZR2oK9TFjotF+bpFVx
        s3RiyXU/X037qI2WbaZI17TmwQw0Z4g=
MIME-Version: 1.0
Subject: Re: [PATCH] docs: hugetlbpage.rst: fix a typo of hugepage size
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20220922030645.9719-1-wuhoipok@gmail.com>
Date:   Thu, 22 Sep 2022 13:41:09 +0800
Cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux MM <linux-mm@kvack.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <CAE3E1D4-E2FD-411B-A815-4B95A161316B@linux.dev>
References: <20220922030645.9719-1-wuhoipok@gmail.com>
To:     Hoi Pok Wu <wuhoipok@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> On Sep 22, 2022, at 11:06, Hoi Pok Wu <wuhoipok@gmail.com> wrote:
> 
> should be kB instead of Kb
> 
> Signed-off-by: Hoi Pok Wu <wuhoipok@gmail.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.

