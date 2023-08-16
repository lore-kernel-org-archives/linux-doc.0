Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F799C04E69
	for <linux-doc@archiver.kernel.org>; Wed, 16 Aug 2023 12:29:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234892AbjHPM2c (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Aug 2023 08:28:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245264AbjHPM2N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Aug 2023 08:28:13 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDA2D2706
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 05:27:49 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99bccc9ec02so904681666b.2
        for <linux-doc@vger.kernel.org>; Wed, 16 Aug 2023 05:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1692188867; x=1692793667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aaCcsSxEpyyqDlzbXB5HOjQbGizw0wp80mopcOcdi0M=;
        b=hMjB0UzncaxXwNyO/6mAQIWoL8eI9H/wuORRT+ykfvjKMRGhelkIBJ0FeOAK98QfFj
         6ugSNV9MPsdU+RvWFY3NcLCp8Cwe0cL1PvY/9OnmJm1kU9YIi4/r+79pmkAKx6NngaVj
         I/Qksm5+Ox7lTjTt+d7WbvJ0unewmIt4GL1kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692188867; x=1692793667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaCcsSxEpyyqDlzbXB5HOjQbGizw0wp80mopcOcdi0M=;
        b=QqPw0JKm1w++V3te+87WJ/SYAPaoxziy37/gQWFJkn3Vfh58FPFjsLS0vWuXabD0XF
         YHP/DrJvIDE7BuCvVHDr4l/9Vpfa/ku9tqG7QsMEAPLPYwK8Y7lt/fSBz7JzIAiKE65x
         CQZWbHntnnNvStWGaPn+iWRpTa4awnvZO3VSmq9ulWXGXR4Fj6z8eOeQG6FOpHskjT64
         P6Pg/h7iqM+GVDO9y4O7Jrgw6ffnSdouwTc1FuKBcPfOG5HoNMWm6hceHXnoojr9M8Ej
         13XMYqYu3f76RZYfOm5cXt/q7xw190UNIgEIFJwAfH4sKuhLnu1+wEdV5z6aYuAVX0nC
         2NcA==
X-Gm-Message-State: AOJu0YzROQUn+vSXLR6m09oOUNotClFismHNpUjmgo5tinuYW8fStsgg
        rJbbaGrF0UQkPTB2dVdkV7nOUsE/rj1nx1/YDurLcQ==
X-Google-Smtp-Source: AGHT+IFEJjQsMHwnxXfKTZ7htXSjeP5q0ZYCuaZN8uFVfqYiUPc7DgSetH5Qj6mp/A267t0Kgo6sMlUQkl9GXMvZHvk=
X-Received: by 2002:a17:906:ae88:b0:99c:6312:73ca with SMTP id
 md8-20020a170906ae8800b0099c631273camr1317797ejb.71.1692188867145; Wed, 16
 Aug 2023 05:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230711043405.66256-1-zhangjiachen.jaycee@bytedance.com> <20230711043405.66256-3-zhangjiachen.jaycee@bytedance.com>
In-Reply-To: <20230711043405.66256-3-zhangjiachen.jaycee@bytedance.com>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Wed, 16 Aug 2023 14:27:35 +0200
Message-ID: <CAJfpegtVQywX28=H+msmkcjaELpfQr6_UdvNZdCN3_B8KCfYTA@mail.gmail.com>
Subject: Re: [PATCH 2/5] fuse: invalidate dentry on EEXIST creates or ENOENT deletes
To:     Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        me@jcix.top
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 11 Jul 2023 at 06:36, Jiachen Zhang
<zhangjiachen.jaycee@bytedance.com> wrote:
>
> The EEXIST errors returned from server are strong sign that a local
> negative dentry should be invalidated. Similarly, The ENOENT errors from
> server can also be a sign of revalidate failure. This commit invalidates
> dentries on EEXIST creates and ENOENT deletes by calling
> fuse_invalidate_entry(), which improves the consistency with no
> performance degradation.

Applied, thanks.

Miklos
