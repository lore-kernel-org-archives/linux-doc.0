Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560DFC6FA82
	for <linux-doc@archiver.kernel.org>; Thu, 15 Sep 2022 01:42:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbiIOBmb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Sep 2022 21:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiIOBma (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Sep 2022 21:42:30 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A56A58D3EE
        for <linux-doc@vger.kernel.org>; Wed, 14 Sep 2022 18:42:29 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id w20so4810163ply.12
        for <linux-doc@vger.kernel.org>; Wed, 14 Sep 2022 18:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=kn66pQDvdxEyGg2eyq2bg/i4C22SjnqUx1ymYf/e1Bc=;
        b=oGcUNBXUGQRKH/z/quKgelOnakF48QpvR0XRLu6K4xbCmb3OJx5B3Z5pZninvnMxGi
         Thvt2hkcIPwjZFLp/n7lCHq2Af51oDS8YX3zEHsbNaXFq/iZERruVkf7o3Xx9CX8KxJ6
         YciFes4NcD+d/a8xlPCKfn/qNF7d6oHa0tzRcIC7K63LB7qSsTxgDJTY9/PdjBTiy8IW
         45EEmZN42rwfz033B8eZUj9BNaqWcZ0tIa0qc33RRQ6W9cBErPDiRBC0eefsacmrUmb3
         D98lFQ/lFfNqeTa36jwlr91q0vfPl3xp8mgBsRkrqVUuiK+33aThwv7x5LeELmIy7lRU
         fuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=kn66pQDvdxEyGg2eyq2bg/i4C22SjnqUx1ymYf/e1Bc=;
        b=WQjFVFUfpHPomYEFKvxVumnyHIfP3U6vUZkauf0HaJtumdbN7lGC5fSEOBy5IXuvKw
         IBaEY+FsFshCPKs/lnQPwobm4OIWK9ysWZXmjishLFVCEpdA7TofI5qmSryYnKQj71zk
         veTdFv5CZ+PlXurkXLxAkrgPEuS1DJHkebKKWI5UVCL78Zo8WDBhjkRKiGj1h0RO4Wb8
         u9/PryF4AzNd6LegzvJoR1GDj9wrqIRvl1/qdJGKYhq3+tTxr35Eclv9TXXINytFgLIV
         AJfm6FMfdUG0DM6i4BRTEQ1ax/kJs/XvYblHY+KJDC3dbihKSF4yNNvKrFcLU69FDsws
         kUdw==
X-Gm-Message-State: ACrzQf2MQ/fU2WEx+HrRCRDpTMl8JOJ+Na7uATKqIufaA5l2C169fByy
        j2WkNyUral7jg6hP6gv/qbC6XhIZBps=
X-Google-Smtp-Source: AMsMyM5rmSHzOCxeZXRfbpauJr3LwPzjXcahmBB990Z/HC8ENgfSS7J+bfNCdQ4W0aEaHO7fTT6Utg==
X-Received: by 2002:a17:902:ea02:b0:176:afd7:3d1d with SMTP id s2-20020a170902ea0200b00176afd73d1dmr1877253plg.120.1663206149092;
        Wed, 14 Sep 2022 18:42:29 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-73.three.co.id. [180.214.232.73])
        by smtp.gmail.com with ESMTPSA id oj5-20020a17090b4d8500b0020263b7177csm197941pjb.3.2022.09.14.18.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Sep 2022 18:42:27 -0700 (PDT)
Message-ID: <b4b1610a-4ce8-dbff-4205-4478164dba31@gmail.com>
Date:   Thu, 15 Sep 2022 08:42:24 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] Documentation: kprobetrace: Improve readability
Content-Language: en-US
To:     Yoann CONGAL <yoann.congal@smile.fr>, linux-doc@vger.kernel.org
References: <20220822213732.2731429-1-yoann.congal@smile.fr>
 <CAMSfU+5Hg35RwXd1G+akXfbQ59Hbc5vdzQ5rDvuqBynfVdiH+g@mail.gmail.com>
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CAMSfU+5Hg35RwXd1G+akXfbQ59Hbc5vdzQ5rDvuqBynfVdiH+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/12/22 15:35, Yoann CONGAL wrote:
> Hi!
> 
> A gentle ping for this patch (I'm afraid it has fallen through the cracks)
> I've checked, it still applies cleanly on v6.0-rc5.
> 

You need to send to appropriate maintainers. See MAINTAINERS or run
scripts/get_maintainer.pl.

Also, DON'T top-post your reply.

-- 
An old man doll... just what I always wanted! - Clara
