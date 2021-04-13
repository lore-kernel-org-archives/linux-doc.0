Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84425C433B4
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 08:54:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 540416135C
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 08:54:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbhDMIyw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 04:54:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243739AbhDMIyu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Apr 2021 04:54:50 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AAEDC061574
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 01:54:30 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so10334694pjb.4
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 01:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Xkz5uUpAAcU6d5fPF+y3iD35efm4VhQXx2TE2jqDQUo=;
        b=TBPATlV4FQ7TvJmp18Yf2Re3GLbnFi+eUEZEaQeddqR7CLGkS00eynVxlWoLxp4M0y
         PU9t8LnJ5jZR504O5I7jrpJud2ArWi9jVI7z/MQo76bEiCQhDsJO6mW99x8HZv7tD/kj
         EcM29lK0yYRwNo57HG18jWbqHTsmeddb/yEsvW7lh5CCj5lsbiy/IKp5/QwTp3EDBB05
         WaSChJIKjWPvDRXyptPLIWn8R3O9WhR+/OC7eg3zXyJ2PLrUOUlF7D9LRnODSwsNHMPJ
         oYAQHJyyKi1Cx4DdQnyS67szPj+YSQC1967Oz4SdjN2XWfT3sO/XAXdihCbI52no5WRc
         vm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Xkz5uUpAAcU6d5fPF+y3iD35efm4VhQXx2TE2jqDQUo=;
        b=d8HxqkPat+ww1r5SrvX5sBl50rYFbvDcWrNaNmg2Tj/g/H0YdcinAEV0yC2N7UvNW4
         +z4OpR09LfZn+q3Fciv5NpTuiHZepJrfcQo6U9+mDy313M0AMZLkwyjMbOFUyl/wDTDP
         AOMmjA+/ThDVONDT11K4pc57tr97wSeZeMiv9hruOm1EbJxTFDBuWWTTv/yZvJw4WGV0
         SSwmj30//hQ8v2bePiM27nJ/GBlvTFt49vOKuaqEiSl2gk1FSwihK2Kv7ivqqVi5kizR
         brw8vMWnfstf3a5jnwfi+Z5pnRpTOpu36ifRk5u17+33aKNvcLgyoA2QGvarM5byySiv
         YZiA==
X-Gm-Message-State: AOAM531ri+BBVzRukXVyDeFwmg6eKkbHJSVZMIM14zTDMHsyRRXka95K
        8QxT+hsn34LrLlC6EvpwScULW3JrM0Vu1w==
X-Google-Smtp-Source: ABdhPJzVK23DAa51k4OSE3UoKk0/JjJRWLdD0/JRz+kXBXG7zhc2F0Wme7uRmtTviu2y9cxI8nPhcA==
X-Received: by 2002:a17:90a:5884:: with SMTP id j4mr3910372pji.33.1618304069509;
        Tue, 13 Apr 2021 01:54:29 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id d4sm1654777pjs.1.2021.04.13.01.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Apr 2021 01:54:29 -0700 (PDT)
Subject: Re: [PATCH v5 3/7] docs/zh_CN: Add translation
 zh_CN/doc-guide/parse-headers.rst
To:     Wu XiangCheng <bobwxc@email.cn>, Alex Shi <alexs@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
References: <cover.1618295149.git.bobwxc@email.cn>
 <81d98cf80325ff3b1c4145965bc7d05ddb2b3c49.1618295149.git.bobwxc@email.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <c58093b4-9baf-99c4-d192-e8e75ab6f2f6@gmail.com>
Date:   Tue, 13 Apr 2021 16:54:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <81d98cf80325ff3b1c4145965bc7d05ddb2b3c49.1618295149.git.bobwxc@email.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/4/13 下午3:12, Wu XiangCheng wrote:
> +
> +版权所有 (c) 2016 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> +
> +许可证 GPLv2：GNU GPL version 2 <https://gnu.org/licenses/gpl.html>
> +
> +这是自由软件：你可以自由地修改和重新发布它。
> +在法律允许的范围内，**没有任何保证**。

Though, the last words is correct in grammar, but if the following better in
Chinese custom? 在法律许可的范围内， **不提供任何保证**。
