Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8096BC433B4
	for <linux-doc@archiver.kernel.org>; Tue, 11 May 2021 15:21:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43E4761400
	for <linux-doc@archiver.kernel.org>; Tue, 11 May 2021 15:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231761AbhEKPWX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 May 2021 11:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231461AbhEKPWX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 May 2021 11:22:23 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0880DC061574
        for <linux-doc@vger.kernel.org>; Tue, 11 May 2021 08:21:17 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id q2so16261138pfh.13
        for <linux-doc@vger.kernel.org>; Tue, 11 May 2021 08:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=V4LMkvrniJAvXU5xBJtPWHipHjdbSyBWhYEiZ+dOod0=;
        b=y4/MogwDmaORtiOLwmXGVcCfVM0eb+52pG4AdHLjv5KE5RBUJET+oKZl2pvuxXOHlk
         LLryLjnhfquSTGLYfA1kdDzV37qrFBQP6sF121xXPeKIjVaame/IW8MXvsEkVOyYuSvV
         Qp5JuQpg/OFsYLOJmYd+Sokowdahqc8Wr+zCTMRJk/wcigaE3LWMQhWyMxKqBQPFdxq2
         FKKCTmCf7iAyWjxknBb5tyrtVJ8WDU8/sIoJjR5MEKPk0foLgLzLTt9ANKOJIYTeCw2Z
         SlDaw1t7FRtafqC2YXckhVoj7PVtBefsDz9ve/C77nPKfTGL2Cfwxh0qY1tD5TObSE4n
         kKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V4LMkvrniJAvXU5xBJtPWHipHjdbSyBWhYEiZ+dOod0=;
        b=ONQDMESG2pVHHJYuTTOKNqTLItWgOgNpsJxGaKltUVhR1CKZI7y2LfOveSAUjerKtn
         xt91jSt90cN9h9eyIX9nySo9AEzJSGGmd52HXGr7FCQNAPRicBY85OI00j/ODwUlIsKw
         pCXoCEy8zmCMbzufMdrSdLM+LWWA38Ge1sUgIUCiuoKhr04t3dA4Btx9KZum9WdZft8t
         +E/TGvhJ2vr4S5HrJ+lrl+rnvEbRS5kTtALtPVyEDd68FDLxpJVp3laeMdW04Ujkyc1E
         jH41O3kdgqUFRS1YAMUMeHqyhlSCQKmBCy1PtJJVPrwa6epAAZH2ea4OQRKgtHo9TKDf
         uubA==
X-Gm-Message-State: AOAM530CPRGvvgKsxC6wjiYFdOLFEnF1hblPvxwQBawcLwcKCAcu6GwO
        jPCOlhxSwQPrBbg6LJPn30IS+Q==
X-Google-Smtp-Source: ABdhPJxN0Um6faHA1gCmqjavnQ6o8dzaaki7KNEEljFxMpvN8az3x681fvXJa8AgcZP2A/WSLcqHmw==
X-Received: by 2002:a63:4f4a:: with SMTP id p10mr31279585pgl.432.1620746476541;
        Tue, 11 May 2021 08:21:16 -0700 (PDT)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
        by smtp.gmail.com with ESMTPSA id o4sm14004075pfk.15.2021.05.11.08.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 08:21:15 -0700 (PDT)
Subject: Re: [PATCH 1/5] docs: cdrom-standard.rst: get rid of uneeded UTF-8
 chars
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
References: <cover.1620744606.git.mchehab+huawei@kernel.org>
 <79c3f482da17ea48d69b6e6ad1b7fb102b9dd7bf.1620744606.git.mchehab+huawei@kernel.org>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <11b486e5-f663-e530-7b70-84563a92fb02@kernel.dk>
Date:   Tue, 11 May 2021 09:21:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <79c3f482da17ea48d69b6e6ad1b7fb102b9dd7bf.1620744606.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/11/21 9:01 AM, Mauro Carvalho Chehab wrote:
> This file was converted from a LaTeX one. The conversion used
> some UTF-8 characters at the literal blocks. Replace them
> by normal ASCII characters.

Acked-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

