Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60246C54EE9
	for <linux-doc@archiver.kernel.org>; Tue, 20 Sep 2022 18:45:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbiITSpT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Sep 2022 14:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbiITSpM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Sep 2022 14:45:12 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5FEC1EEE5
        for <linux-doc@vger.kernel.org>; Tue, 20 Sep 2022 11:45:10 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id b23so2379359qtr.13
        for <linux-doc@vger.kernel.org>; Tue, 20 Sep 2022 11:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=pQHr3Qv8GYXihSN7w7x7jZh0+9kTj1uMD3qJYaWV/Fo=;
        b=H8B+bgGspxkcn7NautVkPXGuXiwFlueAsvJBxPMUGUFlrUAC5F7vHDQFJE0LuRVpan
         XUD9jkBOyR20Wh8759EfO7ygcyvnJNZ2BcupaMt+xoweNRS5U/jppKMtYB4IPELOEB6s
         JSuARe6rjQt5i0pAq/2fNwRo69Qz+ErV3Fswk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=pQHr3Qv8GYXihSN7w7x7jZh0+9kTj1uMD3qJYaWV/Fo=;
        b=x+x3hMpetAMFP4ZySfos3TCoJDzMxg/pr3UW5lDUp9HO/4a+CINmdRGt6IdT9qOs3k
         viQO2+yjxib7dJ97xPaDf0nuehkXHJyyWUmAvNl/YuHBeO5t7hlyMg7KlY0MxkzHVuIA
         zNpzyuD5+bu03vT/YLuPAn5oxoXAAgGThnQC16fOZ98TPZiIRXIYAI2YWtPzsuFr3nUw
         J+cRSJvjtgOYhj/9X3QZFPOJ8iTy/trdCizO4bf/3Vb5YmMQydcGSGWOT6iVmzHSohWz
         ionEdJVWBcUgR/78K14/1+T4JOaZ1L1xFzx55uMBLC3pnSz0WFm3N0F7kxPfHdUwwtoF
         3pHw==
X-Gm-Message-State: ACrzQf3+f8Yf2n+AqkVCivBAi6lQfmX9vSOiBvtCbg8cXNFLxrwfu2T9
        hJkloVbrdyq+MWcYGpBqbYwhaw==
X-Google-Smtp-Source: AMsMyM4w2hcW0qBRIuHTM6NIpXDXYAMbTKVvpQ+lA7t6jdLB7zKHNJvXiziu9m93D5YQ4Wzi6A/ytQ==
X-Received: by 2002:ac8:5a93:0:b0:35c:bdcd:c340 with SMTP id c19-20020ac85a93000000b0035cbdcdc340mr20546085qtc.509.1663699509889;
        Tue, 20 Sep 2022 11:45:09 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id m17-20020a05620a291100b006cdd0939ffbsm316378qkp.86.2022.09.20.11.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 11:45:09 -0700 (PDT)
Date:   Tue, 20 Sep 2022 14:45:07 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: Overriding kernel version in built docs
Message-ID: <20220920184507.gs4xtfyuzevdcbgz@meerkat.local>
References: <20220919210403.jxvql3lwpeyhz7h4@meerkat.local>
 <de7b2ac7-f61c-76e6-9c2b-f5e24f494a14@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <de7b2ac7-f61c-76e6-9c2b-f5e24f494a14@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 20, 2022 at 01:35:36PM +0900, Akira Yokosawa wrote:
> How about:
> 
>     make SPHINXOPTS="-D version=next-20220919 -q" htmldocs
> 
> ?
> "version" is a variable in Documentation/conf.py.

Thank you, that worked!
https://docs.kernel.org/next/

Cheers,
-K
