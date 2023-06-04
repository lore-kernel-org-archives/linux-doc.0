Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 867EDC7EE29
	for <linux-doc@archiver.kernel.org>; Sun,  4 Jun 2023 14:07:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbjFDOHn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 4 Jun 2023 10:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjFDOHn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 4 Jun 2023 10:07:43 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64BB1C4
        for <linux-doc@vger.kernel.org>; Sun,  4 Jun 2023 07:07:42 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-53fa455cd94so1781751a12.2
        for <linux-doc@vger.kernel.org>; Sun, 04 Jun 2023 07:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685887662; x=1688479662;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pkEw/KYBvgWhOLNM0awAyhWUoE1Lxhm/fdFvbR4InGY=;
        b=TP8zbZ3KR04MIaYz9HWE0kHE3zO0dC1OcjxIRDB155thkmNKD58/FDxuwlnDUCz76g
         UGt+0sLw4p08jTvEwgwN60OLNz0mooX7XxAAJnUDnm+nBTz4QtzOAbGilB/loDHmXULt
         PSqRiEJiF6td672GI5+T2YuqqMSI3cR7Hbw5ENjicjO8C16AfpMNcXMQMydExmySipXQ
         w+T0ZMDUBNnbyIYvIO4Fdnv9kbthdHg7pCaav+yf9HOSgHxoG1CADw8MlAgDk6ihv4sm
         /cCWIEQ1X6/HTTbm/qBtKoC6ezJMy3vm8jUbuYpxC1nVrRS7tCSU3eepGhY2FHawcFDy
         zOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685887662; x=1688479662;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pkEw/KYBvgWhOLNM0awAyhWUoE1Lxhm/fdFvbR4InGY=;
        b=l3boqflX3nUBxrun6ZS/FgTJfBz7JYeuysEAMjE4GbThDKRpLyk2grbUG6N0z0S318
         xyDX4M7FZ6qnURQfyZCF1Oz7mg5SZ/OnF6SBEltdU/PkPS7iQVx6XfogIn9Ghen8S/HH
         9kIWUEYS0N5bLwsEcB7uQVtyfh15vmGpPlb67tLV3/j5kXsvYuDByE6hC43mQO3o1Zkg
         0mRoywJ5sm9tj2s6zO0jSeZkut7QzgnNuISZYWa800ejVdYy/VL4gQqV0cBFqkEl7UfR
         GD+cFjKMK5BpA7iSnTA2uFnD5FI91XNPPKrsxbI7ZjNcitgzBtEB6ETgoth+OzpLyDDL
         sfHA==
X-Gm-Message-State: AC+VfDyKzCmFnsb7OYuaIYaBqO3R3bJG6JUB4iP/85a+IXthRiF4hRIf
        a1fb4ZE+ducoHSKytht9AI5yKU/pboI=
X-Google-Smtp-Source: ACHHUZ4m/5ASswOxVbMqoY93tfCOr0cytCR0d/Pt7IDfBW5yo80YfeKXNMg1Bi3YljOor5oTesOIew==
X-Received: by 2002:a17:903:2602:b0:1af:b049:b32e with SMTP id jd2-20020a170903260200b001afb049b32emr1855563plb.56.1685887661830;
        Sun, 04 Jun 2023 07:07:41 -0700 (PDT)
Received: from [192.168.43.80] (subs28-116-206-12-54.three.co.id. [116.206.12.54])
        by smtp.gmail.com with ESMTPSA id q3-20020a17090311c300b001b0f727bc44sm4703578plh.16.2023.06.04.07.07.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jun 2023 07:07:41 -0700 (PDT)
Message-ID: <65b7bc64-4a4b-c056-db65-cd77bcc3d1d9@gmail.com>
Date:   Sun, 4 Jun 2023 21:07:38 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] Improve the dm-integrity documentation.
Content-Language: en-US
To:     Russell Harmon <eatnumber1@gmail.com>
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org
References: <ZHs2BHGBrJ-YGd-v@debian.me>
 <20230603201525.9409-1-eatnumber1@gmail.com>
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20230603201525.9409-1-eatnumber1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/4/23 03:15, Russell Harmon wrote:
> Thanks for taking a look. Here's the multi-patch series plus the changes
> you suggested.
> 
> 

This is v2, right? Next reroll, remember to version your patches
(pass -v to git-format-patch(1)).

Also, I don't see description (that would be commit message
once applied by jon) in all patches on this series. I hope you
have a time reading Documentation/process/submitting-patches.rst
so that trivial mistakes like this shouldn't happen again. In
any case, when preparing patch series, always add cover letter
by passing --cover-letter to git-format-patch(1) then edit the
generated template (look for 0000-*-cover-letter.patch).

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

