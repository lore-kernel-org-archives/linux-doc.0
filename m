Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F75C433ED
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 05:11:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09000613A9
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 05:11:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243005AbhDMFLV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 01:11:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242475AbhDMFLU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Apr 2021 01:11:20 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA8E2C061574
        for <linux-doc@vger.kernel.org>; Mon, 12 Apr 2021 22:11:01 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id u11so4195977pjr.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Apr 2021 22:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zgISC4+DlFGOcmW26d7devj3OsxV6DzlEId02I4LgDE=;
        b=hfPCMtvSkyi7MnsLNmK2Z2dTWx/H3VtFgh8jipc8oYvb+ykMDUKYj/saQ6q5Wuxw5E
         lcdCAkorm3lo+qdfvjyOHFgM7RbQH1GF8WAvMIp3ogpMp1KvUsu31wRRdOOZvFHrHzPQ
         LmGyj8bBJiKRVYnhtllTyf/y6FoUc3mSWCvegxls68thXcGBOLDUM6CwScJc/ifPKTfQ
         qetwKWEqBI0YVqfhZvt7M0rpOC95X8Ui3E/+crt6iSSmau5IcH4Z9UF+APjZNuUDVyIZ
         jaBjxNDZ/qM0OFKGwkcHAKCCj1edIiiIvwVSZ6Jq/4ZRCglBLbnsX83VnoTI4Tr3K+p+
         ouGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zgISC4+DlFGOcmW26d7devj3OsxV6DzlEId02I4LgDE=;
        b=FHSlVJDSlmwdj77VNF/r5Vqg5vfsAfCGbgtMuP3sDA1yb5Fwc21HMENHM5PvKpE810
         A3PK+JGq6WAadCejgef9/PvJqIZR26oUgkLdOo8Xkn50tRFL3CedFHT2t5LyGN5uVC2P
         jQOIlwIS7HKWFu3iHlU4I2T+IriAJ9Wzfj3STrqEOdsKY477gqbqMsMdfd+PGZ5XF7uY
         fXPc/MaePPgkxjl2H37vGcFRqPMylTRho+6so5K9gt28Ry/1eAnXeIV/GE4I04z4HKsB
         4Ji5SHD3Z4tl0T+3uloe10Sp3eSIqPXWQ48rjP7RR3AIYVJwHp47qi5RSfpF2fg72mNy
         2ebA==
X-Gm-Message-State: AOAM533ytxGsdeDiN1/YOw5sOJoAB0ucl3YC7vTCc4tqfVnr/dm24LtA
        eo8wRLbw8nC1jGX8Ov6PSIuwSjSp3RmBIg==
X-Google-Smtp-Source: ABdhPJxIXEFcfynEJz+akvLCaN9+fYv4FWU6SVt2D+KZnL4aM2fSSgDYAVLVrGn8d0Ew9bxSPnfz8A==
X-Received: by 2002:a17:902:6b8c:b029:ea:f54f:c330 with SMTP id p12-20020a1709026b8cb02900eaf54fc330mr9245568plk.10.1618290661199;
        Mon, 12 Apr 2021 22:11:01 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id q19sm2868343pfk.143.2021.04.12.22.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Apr 2021 22:11:00 -0700 (PDT)
Subject: Re: [PATCH v3 5/8] docs/zh_CN: Add translation
 zh_CN/doc-guide/contributing.rst
To:     Wu XiangCheng <bobwxc@email.cn>, Alex Shi <alexs@kernel.org>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
References: <cover.1617699755.git.bobwxc@email.cn>
 <6b0eeced74f21696fd15edea9f24ef1f20736652.1617699755.git.bobwxc@email.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <09477ecd-4964-01a1-b521-308aaa1ceda0@gmail.com>
Date:   Tue, 13 Apr 2021 13:10:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6b0eeced74f21696fd15edea9f24ef1f20736652.1617699755.git.bobwxc@email.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/4/7 下午3:51, Wu XiangCheng wrote:
> +C代码编译器发出的警告常常会被视为误报，从而导致旨在让编译器闭嘴的补丁。文档
> +构建中的警告几乎总是指向真正的问题；要消除这些警告，需要理解问题并从源头上
> +解决问题。因此，修复文档警告的补丁不应在标题中直接写“修复警告”；它们应该指明

Since all the patches are write in English, we'd better to keep
'fix a warning' in English, or give a extra comment here.

Thanks!
 
> +真正修复的问题。
