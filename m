Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2627C4321E
	for <linux-doc@archiver.kernel.org>; Tue, 19 Apr 2022 11:41:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345628AbiDSLoc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Apr 2022 07:44:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352183AbiDSLm6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Apr 2022 07:42:58 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A95A393F0
        for <linux-doc@vger.kernel.org>; Tue, 19 Apr 2022 04:38:35 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id z5-20020a17090a468500b001d2bc2743c4so1626642pjf.0
        for <linux-doc@vger.kernel.org>; Tue, 19 Apr 2022 04:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=czltG6L2KkzB298LugAHRvgCtEThwrsgoIBIYbL/lmc=;
        b=mW1t99Tzzl//v4S6OsIZ7O7aaZ27kcJSkc7NEWIWcO0Uoau39paOP9AC0VwPLHYRb5
         tpKKIw0Q9Nmgbw5YNVW6j3mXEoZ1v5iq1Bgy5gkuHL1FHL1Uv4VUqKmo8MMRyXLJ2s2l
         IYYWiiVAlhU9OPfjBfqRdaZgckD4p8CCtXeyKrG7KbHCtgElYH3AhBxRn1JZkLD5jWyt
         09iHSLgBekvpDrV/9nzTh0Fgf6N80F5g/WSS0Hy7JV+G/sjBma9yPQWpmegzyzShyB/D
         vg/aJ4mrOHhf4C64FGNVB5IXt59uRqACzfB15PihqDViFiC+8VikE3d7Ay7JTtA6YXKU
         r3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=czltG6L2KkzB298LugAHRvgCtEThwrsgoIBIYbL/lmc=;
        b=mGWy5uyNoHMl/d6zRGkLmtGIWnztvYEMfhrY8n8m+Rp9u8NEJtxGMEHZmHSowQlfNR
         GzoRSKAkpKoxNcsIbdEjQ5UTSa/KIeIi8dvDAyjaqC/NrLGkLS2TYPYVWeQIQIqxsAsg
         +arJ6Ori6wG2oQ45tHZGihVgEFF+R5Zny8mAhv7YaJSdAoPF46jrscVSc3u2188mefAV
         rL3UHvojZt9ttcLJLF2pAbhOoG8OH6XPSyzY6pw3JwA8LuAxGwF1kcHVJUGkDu69Kxy7
         kkRpAF2fcn2y3vCZYnVO8S3+pqOeCBTqbP4LtnKLUC193RJmlr56jkm1RAvgusG309Ol
         D3ZA==
X-Gm-Message-State: AOAM533h/zibsckC9bar64YpBJXTG/rip57ZjLtlxL8EE7N4B5WjgbM1
        VQI/EZPab2dLaKLaj+ywcpes4A==
X-Google-Smtp-Source: ABdhPJxPAhtfomWeKdsxGXDr3c7zmgNdpnPo++Q7ZHAGZztXONhhmeU6M+A+FPJddomQbcFHtuZPTg==
X-Received: by 2002:a17:903:22ce:b0:158:f809:3116 with SMTP id y14-20020a17090322ce00b00158f8093116mr10472507plg.159.1650368312542;
        Tue, 19 Apr 2022 04:38:32 -0700 (PDT)
Received: from [192.168.1.100] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id l15-20020a62be0f000000b005059cc9cc34sm16311856pff.92.2022.04.19.04.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 04:38:32 -0700 (PDT)
Message-ID: <77dd9800-041f-edee-4ab2-911dc311466b@kernel.dk>
Date:   Tue, 19 Apr 2022 05:38:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] Drop Documentation/ide/
Content-Language: en-US
To:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc:     patches@lists.linux.dev, Christoph Hellwig <hch@lst.de>,
        linux-ide@vger.kernel.org, linux-block@vger.kernel.org
References: <20220419011021.15527-1-rdunlap@infradead.org>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20220419011021.15527-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 4/18/22 7:10 PM, Randy Dunlap wrote:
> Drop all Documentation/ide/ since IDE support was deleted by
> Christoph Hellwig <hch@lst.de>, Jun 16 2021.

Acked-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

