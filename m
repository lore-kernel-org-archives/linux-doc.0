Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883BFC77B61
	for <linux-doc@archiver.kernel.org>; Mon,  1 May 2023 04:39:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbjEAEjP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 May 2023 00:39:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjEAEjN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 May 2023 00:39:13 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1F9110C4
        for <linux-doc@vger.kernel.org>; Sun, 30 Apr 2023 21:39:12 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-24e09c5613cso206996a91.0
        for <linux-doc@vger.kernel.org>; Sun, 30 Apr 2023 21:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682915952; x=1685507952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3qHmKPomambAjv03+PV0+HpTIJixJ0aA3DQYnWl03xo=;
        b=GR9yHGWUIdtC0u15dHsw/fpS5fHfBUyAkjwNwHL+ZyYtpwMzsdNoN4KbL7A7KDCAu+
         xi9IHl8oq7YHNrnIQlCqPiGcsYL4O59sjobBROI9Q9++a//g7JeLcDaDYiq6fb0G2kJm
         zz5QwI0nTLoOFcswG+FJalnE4F12HBMvacqyNxuNd7yNcB6OEeXc3l4qjX2GtBeGVMaI
         r53GC1GLKCBYSkssr4b8zrchrYfM50azbuNN92Gx8XFor+/yO6P7bmi0RIaX8ts50Jk0
         me887PDHAMpw8ypG6lpZ9NLD4NrzzQlCTXFgXYz5+5V02PszO7zIg3zzMh5Fr0IUYjaI
         EenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682915952; x=1685507952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qHmKPomambAjv03+PV0+HpTIJixJ0aA3DQYnWl03xo=;
        b=UL4CvWrdYCu/4LhJrKoGFnofHqBlpbC7Ky5741/FauSL3mgPrhj5PZavVELGx02SZm
         XB29Q5dc8m1zmhprqjwZ2VAxK/ncYxOMrrnZywSmSh4+q8QL+MjRQtyCWku9QYicxcd4
         g/Mq3S4dZodmyETX0Li0+7Qcs4Z58hYzTyvFreEYrX+b9OV5F/+0Rb5iyi7br7loobnJ
         JF5/DeL7K6accCkskaAhdBg1KMCifU2jEiZtP/PICMn1nGOHS8IMsC9C0DIV+Mu7VNvn
         ZDkYwgjYZQrYDleD8uzNcJ/ia1thyCpZZp/GwI0BH5QTkRXSq2yu9jGPLC1ppcglPrYj
         RGSg==
X-Gm-Message-State: AC+VfDywa1QYHvQ52xs4alWsODgAWpcR7r7mmD+HjmYVzFclsyccZ51l
        Brk33rIdPorsG8hs9udU1Qo=
X-Google-Smtp-Source: ACHHUZ4iH/AX62ZEUi11TVmHU2js+efynuZaPriN7aib5Hgwo+1tIYSky0+RKcMF0lu1spFWrskYew==
X-Received: by 2002:a17:90b:17c1:b0:247:862d:a224 with SMTP id me1-20020a17090b17c100b00247862da224mr13947517pjb.27.1682915952196;
        Sun, 30 Apr 2023 21:39:12 -0700 (PDT)
Received: from yoga ([2400:1f00:13:800:3db1:32cb:395f:fa57])
        by smtp.gmail.com with ESMTPSA id q10-20020a65624a000000b00524b02ff569sm16081607pgv.64.2023.04.30.21.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 21:39:11 -0700 (PDT)
From:   Anup Sharma <anupnewsmail@gmail.com>
X-Google-Original-From: Anup Sharma <AnupSharma>
Date:   Mon, 1 May 2023 10:09:07 +0530
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: fix 'make htmldocs' warning in trace
Message-ID: <ZE9CayZ6ClPN9gvX@yoga>
References: <ZE7JRVqg8MoeO73e@yoga>
 <ZE81nDjXfdyjvaeE@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZE81nDjXfdyjvaeE@debian.me>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 01, 2023 at 10:44:28AM +0700, Bagas Sanjaya wrote:
> On Mon, May 01, 2023 at 01:32:13AM +0530, Anup Sharma wrote:
> > Fix following 'make htmldocs' warnings:
> > Documentation/trace/histogram-design.rst:
> > WARNING: document isn't included in any toctree
> > 
> 
> Already fixed by f2ea95289a79b8 ("docs: trace/index.rst: add
> histogram-design.rst"), so obviously this patch doesn't apply.

Thanks, for letting me know. 

> Thanks.
> 
> -- 
> An old man doll... just what I always wanted! - Clara


