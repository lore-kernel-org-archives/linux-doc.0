Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15345C7EE2D
	for <linux-doc@archiver.kernel.org>; Tue, 23 May 2023 17:06:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237948AbjEWRGR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 May 2023 13:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237943AbjEWRGQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 May 2023 13:06:16 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18B258F
        for <linux-doc@vger.kernel.org>; Tue, 23 May 2023 10:06:15 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-64d293746e0so6479444b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 23 May 2023 10:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684861574; x=1687453574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5D4jJBdsw8v5z1Hj7e4NkWHnBQGpeGcsx2kEbP6mIWQ=;
        b=ln4dCoJzG69l0bBJ66KX8uAKPONQc33WsyrsJD2qkfoU+XgCrb4Ky7e2c7ejfR3RfW
         OF/9Ad54Mh6U0/dlwSmvD15AmN5ad11ggoJYfdYnbUxhiAh6J+yB8V92GYw9uJsD9CJT
         GZ8P1zrI7yzwZfchnshDFmU/ZUIQplyuqIV/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684861574; x=1687453574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5D4jJBdsw8v5z1Hj7e4NkWHnBQGpeGcsx2kEbP6mIWQ=;
        b=aWPg+Xvsegiua+gKXhQyKHoUfurDMW737xq8vqhAw1O0p2Fp0BajZBO9X7Y1A6+ntV
         2eyLwfm7QdLbKj5WyqoeYF4qyKCs6rVrjQE8ePLmz55KH1zWMq2KZHtGkX8rbkZmJRox
         dkig0KDpqsqsKh9R1oAxoIrVaqfqbQ8rvq87UrF7cQvCfTBJ3bpIoOu7DJv0dKBQ3Rdu
         MDhJbt+vWgKfwoeCNjZdlqObMxgOVI+CKe4Cv88xKl0AJPsOxYmw8xwRURGeMAxXlH1K
         0kONPuZi1avqtpyBbCsZluVdMMy94kCulWAR0ltqNFoWokIR2o8rg4Gb0GWoZ/SO0vXB
         hycg==
X-Gm-Message-State: AC+VfDx8/mRg7cw49b39+9lSzgJbxeI0nlp7Dtg5nV2sp/L4CUMJ6wZb
        g+HHVQ2kM0ocU/frrRCV4/hIgA==
X-Google-Smtp-Source: ACHHUZ6Iu7uTc8qj06melcElk4wG/mkYt9xsoFCNr5WU4few+n4Wb1U5B20HKwwiuBR+NHUrnMzvlg==
X-Received: by 2002:a05:6a00:14c4:b0:647:e45f:1a49 with SMTP id w4-20020a056a0014c400b00647e45f1a49mr19188735pfu.4.1684861574564;
        Tue, 23 May 2023 10:06:14 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id i9-20020aa79089000000b0064559b58eb8sm6035544pfa.154.2023.05.23.10.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 10:06:14 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     raven@themaw.net, arnd@kernel.org
Cc:     Kees Cook <keescook@chromium.org>, stable@vger.kernel.org,
        autofs@vger.kernel.org, linux-kernel@vger.kernel.org,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] autofs: use flexible array in ioctl structure
Date:   Tue, 23 May 2023 10:06:10 -0700
Message-Id: <168486156843.2168554.9330529184813281577.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230523081944.581710-1-arnd@kernel.org>
References: <20230523081944.581710-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 23 May 2023 10:19:35 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Commit df8fc4e934c1 ("kbuild: Enable -fstrict-flex-arrays=3") introduced a warning
> for the autofs_dev_ioctl structure:
> 
> In function 'check_name',
>     inlined from 'validate_dev_ioctl' at fs/autofs/dev-ioctl.c:131:9,
>     inlined from '_autofs_dev_ioctl' at fs/autofs/dev-ioctl.c:624:8:
> fs/autofs/dev-ioctl.c:33:14: error: 'strchr' reading 1 or more bytes from a region of size 0 [-Werror=stringop-overread]
>    33 |         if (!strchr(name, '/'))
>       |              ^~~~~~~~~~~~~~~~~
> In file included from include/linux/auto_dev-ioctl.h:10,
>                  from fs/autofs/autofs_i.h:10,
>                  from fs/autofs/dev-ioctl.c:14:
> include/uapi/linux/auto_dev-ioctl.h: In function '_autofs_dev_ioctl':
> include/uapi/linux/auto_dev-ioctl.h:112:14: note: source object 'path' of size 0
>   112 |         char path[0];
>       |              ^~~~
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] autofs: use flexible array in ioctl structure
      https://git.kernel.org/kees/c/e6d6886d469f

-- 
Kees Cook

