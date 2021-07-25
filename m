Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556A9C4338F
	for <linux-doc@archiver.kernel.org>; Sun, 25 Jul 2021 20:41:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E75260EB4
	for <linux-doc@archiver.kernel.org>; Sun, 25 Jul 2021 20:41:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbhGYUA5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 25 Jul 2021 16:00:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbhGYUA5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Jul 2021 16:00:57 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51BBAC061757;
        Sun, 25 Jul 2021 13:41:27 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 110842E5;
        Sun, 25 Jul 2021 20:41:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 110842E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1627245687; bh=AuhhqkYY7OnGcrpg1OB2630RAaPyL1IJDNakrWhwTyw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=VNEfJ+Y3NQOfpiWuZTYmdA0En+a40u9nyba6yNebonAmR5OvUelEff4fFCru/+ju7
         RdzGnfsXx35zXDcnCVfpYM4gc2Ym/7RYFs7kQWyya6Vs7kPRaoWPmmP+FJKeOGKEHh
         FWnqrdZqRuDXbhb/gUK4mNawiZjTN7HX+4trfo3UFkCnfH2CSisge+UamTHgAd+06i
         b8yvvlYopPblBL7sity0qty0uduGAxxZCwdVuxF3CaT4BNWQcIMUydKrUtFhbf0MhC
         nOTFohLULIkN3Al7Abp0ajrar4CEJjTARyxhf+p1uxpPndPtXZ0nRnJT5hCQv+wGuA
         gNqP1qEdbTmiQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Akira Yokosawa <akiyks@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, SeongJae Park <sj38.park@gmail.com>
Cc:     Hu Haowen <src.res@email.cn>,
        Shinwoo Lee <shinwoo.lee.us@gmail.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [RFC PATCH v2 0/7] docs: pdfdocs: Improve font choice in CJK
 translations
In-Reply-To: <20ff8a65-6a5c-c062-fe1a-0f5c5ddc813c@gmail.com>
References: <20ff8a65-6a5c-c062-fe1a-0f5c5ddc813c@gmail.com>
Date:   Sun, 25 Jul 2021 14:41:26 -0600
Message-ID: <875ywyunwp.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Akira Yokosawa <akiyks@gmail.com> writes:

> Hi all,
>
> I'm calling this patch set "RFC PATCH v2", but the approach has changed
> a lot since "RFC PATCH 0/3 docs: pdfdocs: Improve alignment of CJK
> ascii-art" [1], hence the different title.

Given the RFC nature, I'm assuming you're not ready to have these
applied yet.  Please do let me know when that changes...

Thanks,

jon
