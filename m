Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8E9C433B4
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 17:54:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E1776113C
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 17:54:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233440AbhDSRyy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Apr 2021 13:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233434AbhDSRyx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Apr 2021 13:54:53 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3443C06174A
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 10:54:23 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id a9so24905757ioc.8
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 10:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2kDM0fgGyB9RRtlgo+0xmmMadRCicE3KFp34CZHihIk=;
        b=W1WwIjE10PGf3qOUnKeXZycFQ84a5JgvUry4zLG7RnxoaCkJdkwzMmsYonIVUHea31
         EbHN9/l/HExOv5DypJd5eNmW+dfOhK4eaN2TfSPNQXCDW2STxpCp33opk70YyiNDK0NS
         Lr+BfAnalyscv8VbQ32AhfPZtWh4tscVSIr2jT7ZaKAEH1TZsCAR506N9EkFvCsvUKGZ
         xcFz3x1mi7gP/6gRMMNsFXgHhohoW14l5tvrIZ8WWPkWZQWKekJd6Wu1o8eN7MQOlpWg
         uW9uNdhwlIQiOD1L2N5QfUlqctrczxM2vawYMeZfdPoWa91pg4rhlI7gktV4MC2PahkV
         17sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2kDM0fgGyB9RRtlgo+0xmmMadRCicE3KFp34CZHihIk=;
        b=fJ92WALVr4yJePC+kUsyPicxq+++75KPXgNJ+F1mEsSaWlFB9NusJiao9K0N0FrppJ
         OLVBw1KVqQzuvrzScR3YQr0jQlFxSbS4OGcdDAOi8UHL7CNGZsG4NySW7is0kTB32aSA
         7SUcNSGFasfKuInZXVQtjoJjsfmGmTL92omcaIZojsL9E8QR8gMwTKIVKc4MNRWFqT5+
         JruG7NM44jttRje4la1kwxfe7LJ3W+h2pKsTKNsZ/LjAOZQnDCpInaWfOjvo/K7+x+J3
         u3y4F9B5sfVTAs/LNXQqWMFCatmSzC8rXnc67pddhnEBb1UoCFySlOY3sRLwBSm2Sicm
         hNPg==
X-Gm-Message-State: AOAM532XSwl2c4ixMc0vEeawysYmAypfhmx4XKHVLrBTLbj9CSAAOrqX
        vHTS7F0LKy4JUMwVTSGdclf81w==
X-Google-Smtp-Source: ABdhPJxGv4JukYDk79e+4TCFMwG9GTaZhgpPQ7ZC37gQVIlHNaSq5lFGX52mILl2W33gHp6VwImXCA==
X-Received: by 2002:a5d:9659:: with SMTP id d25mr15863944ios.146.1618854863408;
        Mon, 19 Apr 2021 10:54:23 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id v13sm79291iol.41.2021.04.19.10.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 10:54:22 -0700 (PDT)
Subject: Re: [PATCHv5 for-next 00/19] Misc update for rnbd
To:     Gioh Kim <gi-oh.kim@ionos.com>, linux-block@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     akinobu.mita@gmail.com, corbet@lwn.net, hch@infradead.org,
        sagi@grimberg.me, bvanassche@acm.org, haris.iqbal@ionos.com,
        jinpu.wang@ionos.com
References: <20210419073722.15351-1-gi-oh.kim@ionos.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <cffb1b7d-9ebd-ea79-dbbc-07b9a5a1e392@kernel.dk>
Date:   Mon, 19 Apr 2021 11:54:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210419073722.15351-1-gi-oh.kim@ionos.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/19/21 1:37 AM, Gioh Kim wrote:
> Hi,
> 
> This is the misc update for rnbd. It inlcudes:
> - Change maintainer
> - Change domain address of maintainers' email: from cloud.ionos.com to ionos.com
> - Add polling IO mode and document update
> - Fix memory leak and some bug detected by static code analysis tools
> - Code refactoring

Applied, thanks.

-- 
Jens Axboe

