Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700DBC47092
	for <linux-doc@archiver.kernel.org>; Mon, 31 May 2021 03:11:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A5FE61074
	for <linux-doc@archiver.kernel.org>; Mon, 31 May 2021 03:11:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbhEaDM4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 30 May 2021 23:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbhEaDMz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 30 May 2021 23:12:55 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AABB6C061574
        for <linux-doc@vger.kernel.org>; Sun, 30 May 2021 20:11:15 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id z4so4487651plg.8
        for <linux-doc@vger.kernel.org>; Sun, 30 May 2021 20:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8ZdCod5NYsr8dVsOvbkDf9U/+WLfkvua+bmP/+bQ8ZA=;
        b=N1/mwhfK/ke85K3/FFPHyZ/EoKd34eX4M8W1xNzwcSbls+mbbKctj92rU27dh429PY
         gJneeVTKrBmuEG43B7F6F3Ntz618q6w099Bsvd1Zdc5f76PqEyxvdopOLDtKV7ggXzOC
         pDJ8fRgB5DQvdew1ofbJVyxdILBga97hTfEu/1IqaqZkjQoJXUwjgwrPYBoocd45Clg6
         LwMmzbOTPdM7zjddXwRaj8e6sk3ctUG115oMnmY0OHmG5IdD5VSIi3zlKQFI3TWF0Bru
         k6WkUg7vefMHIqcnVqlaT9V1pN9EILrMCx+elsr6MO7xBR4WN3j7ETum2Uj7ANjeCBpl
         H39A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8ZdCod5NYsr8dVsOvbkDf9U/+WLfkvua+bmP/+bQ8ZA=;
        b=Kq7nLHoyJGz2UJCShTDXswidQIry5sx77/4MRsdda42zuXF8V/f5Nm5mePdTCpe2XN
         ajDJmKqy9DOF4q+nV3SqNgOutipCVDZj3lrV9BcVaSaLJ8cQCCwumNX98g0de1jk8agf
         3xWx1mavL9H4xA7NPc8KxlBtyYEJfScFlOKlN7E26Ph96hCXSMu8YME8aiMhDyWaweOJ
         bEHrRwIWJtvtg/gvnUsP+5o2IiZngHkXoRGkycjhkwOyun4odBG0Fhn73Dn8/3VMdUJD
         lLtBcE53ZI4Kk3pjNctgda8FyxMj85suRcM014AUF/7kaOpIS6mJHlStWNZek8VKU+CJ
         IzSw==
X-Gm-Message-State: AOAM530mc5cePu/aBVXvfsNb9SDc7dnSk+vxYb5bUFCWkNtqvkJ3qjrH
        bMd2jr59KybTZjPUvCvHCFc=
X-Google-Smtp-Source: ABdhPJwLlFDAL3yOKlZ08neCbc2lqRnHV8jUc+XVbfHZiOVnMTMk5IrUx40CpNvGVu7BBQH9gvTGKA==
X-Received: by 2002:a17:90a:be12:: with SMTP id a18mr16593950pjs.187.1622430675088;
        Sun, 30 May 2021 20:11:15 -0700 (PDT)
Received: from [172.28.99.179] ([119.28.155.243])
        by smtp.gmail.com with ESMTPSA id t14sm8914963pfg.168.2021.05.30.20.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 May 2021 20:11:14 -0700 (PDT)
Subject: Re: [PATCH] docs/zh_CN: add core api cachetlb translation
To:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        alexs@kernel.org, bobwxc@email.cn
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
References: <20210527043118.3835070-1-siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <4fed765c-b2c0-5cb5-8d7a-5b3dec3cd3f0@gmail.com>
Date:   Mon, 31 May 2021 11:11:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527043118.3835070-1-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/5/27 下午12:31, Yanteng Si wrote:
> diff --git a/Documentation/translations/zh_CN/core-api/cachetlb.rst b/Documentation/translations/zh_CN/core-api/cachetlb.rst
> new file mode 100644
> index 000000000000..9568c15f4139
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/cachetlb.rst
> @@ -0,0 +1,319 @@
> +======================
> +Linux下的缓存和TLB冲洗
> +======================
> +

Guys,

I don't insist on the 'flush' translation, although it is used to be translated
as 刷新. I just never see it was translated as ‘冲洗’ in computer area.

Any more comments or suggestions for this?

Thanks
Alex
