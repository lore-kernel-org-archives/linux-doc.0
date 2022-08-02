Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2BFC19F2C
	for <linux-doc@archiver.kernel.org>; Tue,  2 Aug 2022 13:32:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236220AbiHBNcJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Aug 2022 09:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236752AbiHBNcH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Aug 2022 09:32:07 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E6A91707C
        for <linux-doc@vger.kernel.org>; Tue,  2 Aug 2022 06:32:06 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id x10so12750478plb.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Aug 2022 06:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=6E8dgeqFXisHJAtxbbiozbqMc4opXeGFqWkpiV7iN80=;
        b=coM/lCSJe2ueRlRyMmn5xsfkNPvFJjF6FxbksV+Of2SNmIm5zz3OmH9UvuWqyiuJQl
         VGrFMTFBTttqTvdd5mpKmb2x56nlLmbeHhA1ugG2Zwzvm4tNBoGDJ7RXE2xj9GkV168w
         VfWYwYIiRe+bQCn8hjN5zgTX74guBWNSU3wQHrmCfwAXPf+uX5+EbkpMqyJ9608Q3YoR
         wWkzwYqUEjQKRLOOE2Et0gvDuvIHjokBjAMV65WjpUPCY1aD+4v7NxRXmVCCYIbeTlz7
         PHyzjLPwDzOYP40Bdda3vTtVcESuNb/k1Y83saB3oGjSfB8fz8+jlFN8IKwRWbAZJGEy
         VQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=6E8dgeqFXisHJAtxbbiozbqMc4opXeGFqWkpiV7iN80=;
        b=R6LqWMQU0WzTZkaDFVMPSTvML6YfViIhNDYweJAqYJPjDqxWGgj65OOxyl/5vyPl7m
         ue/a+pii72PEeJxVg6XAoNJSX9/iTsb1pxiJbW38/BidLNus2Jmr70K+9Vv3iHkgOte5
         +pQqW2kzdxudd0mmGcjgT0OrHV4y60ei58nccQrd3R4ZGbSI0FgY/4st9z9hrfJRqlnO
         EHxSOiYGvoYf++2uQTb+QZZpROQGvtKJio0F/xk5SESuR74CZslyXViT4ATeBCogpYNc
         hRzfYQk5cRkTkU8EofFFHGv+lBAeNfHtnhkfRvPh1PVf+XZ/GZrB2+MYawWNmSV0lWkG
         SCEg==
X-Gm-Message-State: ACgBeo2bqF+GP/k4lsQlA+08XZuUIHjW7N7TMA3Jh5i/ts3AgEJDXo9A
        YeY6l6ECaz11J6JHYFGlUq26hvssdsY=
X-Google-Smtp-Source: AA6agR4chN9XrjIT1OPpMfiXgdI8+DLN9pcscY9rhHiuZx5WxiRgCOaDQ5ygVVApHXbT8Kqgeenxtg==
X-Received: by 2002:a17:90b:3a82:b0:1f2:18ea:90e5 with SMTP id om2-20020a17090b3a8200b001f218ea90e5mr25359073pjb.199.1659447125787;
        Tue, 02 Aug 2022 06:32:05 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-30.three.co.id. [180.214.232.30])
        by smtp.gmail.com with ESMTPSA id jb5-20020a170903258500b0016ef87334aesm3596282plb.162.2022.08.02.06.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 06:32:05 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 47331103A10; Tue,  2 Aug 2022 20:32:02 +0700 (WIB)
Date:   Tue, 2 Aug 2022 20:32:01 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Cc:     linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, mst@redhat.com,
        jasowang@redhat.com, kernel@collabora.com
Subject: Re: [PATCH] docs: driver-api: virtio: virtio on Linux
Message-ID: <YuknUeDjmtgKHB0M@debian.me>
References: <20220802124222.3563378-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220802124222.3563378-1-ricardo.canuelo@collabora.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 02, 2022 at 02:42:22PM +0200, Ricardo Cañuelo wrote:
> Basic doc about Virtio on Linux and a short tutorial on Virtio drivers.
> Minor fixes to existing virtio kerneldocs.
> 

Hi,

I can't apply this patch on top of mainline. On what commit (and what
tree) was it based from?

-- 
An old man doll... just what I always wanted! - Clara
