Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFA2C433E0
	for <linux-doc@archiver.kernel.org>; Tue, 26 Jan 2021 02:42:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FD9622D58
	for <linux-doc@archiver.kernel.org>; Tue, 26 Jan 2021 02:42:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728378AbhAYQAE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jan 2021 11:00:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730597AbhAYP7X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jan 2021 10:59:23 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E58DC061793
        for <linux-doc@vger.kernel.org>; Mon, 25 Jan 2021 07:58:43 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id g3so7881404plp.2
        for <linux-doc@vger.kernel.org>; Mon, 25 Jan 2021 07:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ydjA7lxNDcY9m5HH4n1Isbc66o3HKVgUPIygbXwoUMM=;
        b=bI02x67oVJOucPOxKOB9n3X6KcNxCqIpxk5n0fxC4X/uFlQaaUy+xP+qcDK0qgJA7t
         mWFK2tKkiqtuWxZJvB44mpmemEF/S+YGxTW9vjz8KWnzcutGYJEs+vjezSfpdlvaat30
         NrMsLYnxAPDb/60yNPxEjnOGe2XeZLZa2qteFs3BDDpQq8v+NYEA0j27JKKvD8Jo9hGB
         m1FubjB+dKRDuIvGoJ5Krq3haj3y4rnOv+TQTyR+lsKZVtOzTkhokVPN9B3vqb9Kf/tF
         OgnBEzoTN7wXg3qcCOF4/ajnPQb9aZOpN8ShjkT8r+GX28FyVyVD2Nsgv5WX9h7sZf9A
         iVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ydjA7lxNDcY9m5HH4n1Isbc66o3HKVgUPIygbXwoUMM=;
        b=R4KY85Mmqm0eBTV1slCMp3W0syAJcDux70P7nxuWsFN9BfwcX06oJFC5t6sa4NGPnP
         oo2bSmnJv/QjybKS1o74Fy9QS8u2J1WrmAYTTReL1m8+mEg8FI173F2q7IihO2c0i1nB
         ykkgeY0jdOKPFCcOGxK8/4O9DwDUKmVHqlr84A1q1UriEhwAHadFURj4HSJUn2pL9lzQ
         /jWlj4VEGEKdt3a0i8gaIZcm9tdEq1PeTKWbk56eDZrMFopTqsVHwM0NImq7gWqcz482
         eTWxrY3SI/bDkYkDDLtWlmG5a3L0hk+S2etGajZ1cuhuygqkbitD4aEr9pnDeMoqC8UN
         7VUw==
X-Gm-Message-State: AOAM530Yg/ZPsSR54xfXNCgcSczPen/MLK0NyVGOW3dVQIY1koHicvfg
        +adzgJzHlgNWX8PZuPM8YtGPrCJIkkyBdw==
X-Google-Smtp-Source: ABdhPJxvYFudM0/t7uvN4OEM1XLPVgOQbMzfZischKww36TwjmQpcH3dkzLr1QJ1pvzT7oKrjCpfaw==
X-Received: by 2002:a17:90a:6f05:: with SMTP id d5mr843071pjk.145.1611590322691;
        Mon, 25 Jan 2021 07:58:42 -0800 (PST)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
        by smtp.gmail.com with ESMTPSA id i25sm16942011pgb.33.2021.01.25.07.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 07:58:41 -0800 (PST)
Subject: Re: [PATCH v3 0/7] no-copy bvec
To:     Pavel Begunkov <asml.silence@gmail.com>,
        linux-block@vger.kernel.org
Cc:     Christoph Hellwig <hch@infradead.org>,
        Matthew Wilcox <willy@infradead.org>,
        Ming Lei <ming.lei@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        "Darrick J . Wong" <darrick.wong@oracle.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-xfs@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org,
        linux-kernel@vger.kernel.org, target-devel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-doc@vger.kernel.org
References: <cover.1610170479.git.asml.silence@gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <b1d0ae2a-a4ca-2b41-b8df-4c8036afe781@kernel.dk>
Date:   Mon, 25 Jan 2021 08:58:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cover.1610170479.git.asml.silence@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 1/9/21 9:02 AM, Pavel Begunkov wrote:
> Currently, when iomap and block direct IO gets a bvec based iterator
> the bvec will be copied, with all other accounting that takes much
> CPU time and causes additional allocation for larger bvecs. The
> patchset makes it to reuse the passed in iter bvec.

Applied, thanks.

-- 
Jens Axboe

