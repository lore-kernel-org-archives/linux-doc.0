Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24606C001DF
	for <linux-doc@archiver.kernel.org>; Fri, 28 Jul 2023 23:23:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231279AbjG1XXC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 28 Jul 2023 19:23:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbjG1XWz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 28 Jul 2023 19:22:55 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 735D13AB4
        for <linux-doc@vger.kernel.org>; Fri, 28 Jul 2023 16:22:54 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-686b879f605so1858609b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Jul 2023 16:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690586574; x=1691191374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3J02gGPlZbZHgOQ6syHZQDMbL88svEYL3WquPy69jjU=;
        b=OyOMvsiUoVcZVoxz3S3mVRqlkP5ItPBXfoVU508M21VmJ77cghHo71kcfTxpCTQr9B
         +KOdpAXL278mjK4gvNLkJMvHfGwSCGkxz2J2FM+sOO/PUx5qle6t7qqrHwT7HnwRvPri
         h9Eb9Y0/mCIbT3eADa8OM2kGwHE+NsJRA1EnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690586574; x=1691191374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3J02gGPlZbZHgOQ6syHZQDMbL88svEYL3WquPy69jjU=;
        b=F2LI2R0syfwJgyTAPiEulcvVZscALSKx5fK9VwJg+AtRmt3e+pRWor3Vbq/zN37ApG
         Uutnl9dEZ1LrIQsmZHoMEUpOhRCJWjCcXtlmnsct75AyKa81f7kKz2a36F2/joy4bSo6
         fSNEbVpl8RsRhEbiJ/zfD8fobGST+iChqsKY0TuF6smndXX5Y5gByE1hheNvSa9sVXy7
         +dWLmKgLcG3rXBUWJPHQP03ah8h4JUCFlrwzIv2gO1GUThawwC01NL/pcdOmnAnjQVK2
         Qm7vnvMwJHsm3O0t2i0FPwjaA7qIZ8+ihaVqYUlJwJidlWgGo02d9uYD3gkD8IuDrFog
         eaug==
X-Gm-Message-State: ABy/qLYo3WROn5ywyotcnYy5HMYr9QHRQipXQer6wjzpwFSMbhvVRR7D
        823l3i0uCIP380oJpk89oDduxg==
X-Google-Smtp-Source: APBJJlGQfZLVQNgsEv0pXXb81+pMSf6XgrCMsILXZO2g0C5yTNhAizbBghrn9UMk6Jj4XjQAIKBtQw==
X-Received: by 2002:a05:6a00:138f:b0:686:9385:4644 with SMTP id t15-20020a056a00138f00b0068693854644mr3518683pfg.2.1690586573930;
        Fri, 28 Jul 2023 16:22:53 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a10-20020a62bd0a000000b005d22639b577sm3615689pff.165.2023.07.28.16.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 16:22:53 -0700 (PDT)
Date:   Fri, 28 Jul 2023 16:22:52 -0700
From:   Kees Cook <keescook@chromium.org>
To:     SeongJae Park <sj@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Docs/process/changes: Consolidate NFS-utils update
 links
Message-ID: <202307281622.CF15DDB@keescook>
References: <20230728211616.59550-1-sj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728211616.59550-1-sj@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 28, 2023 at 09:16:15PM +0000, SeongJae Park wrote:
> Two update links for NFS-utils are in two duplicate sessions.
> Consolidate.
> 
> Signed-off-by: SeongJae Park <sj@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
