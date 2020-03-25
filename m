Return-Path: <SRS0=dTg4=5K=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8C0C54FD3
	for <linux-doc@archiver.kernel.org>; Wed, 25 Mar 2020 02:42:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3627620753
	for <linux-doc@archiver.kernel.org>; Wed, 25 Mar 2020 02:42:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H4706YZq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727339AbgCYCm1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Mar 2020 22:42:27 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:55409 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727249AbgCYCm0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Mar 2020 22:42:26 -0400
Received: by mail-pj1-f65.google.com with SMTP id mj6so395096pjb.5
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2020 19:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=tJVGZmmA1bFjoevn7/qDYyyvIJ/eyc0u4ubgnC7ziTY=;
        b=H4706YZqf8/zScGoFg12vybnR9M2VsIQVJgSz3rS1dHY9dQHDGFEdxDFbUd7d1zTgX
         a1SAGpNqJGQq66/k++qcyoET2sxmyH3emD3uXnYHai1yW2TdH35PONdQL7aDm0PfPzyp
         tYlxhgWpkpR2jgcSCMS6Pg5GkhF65IhQxffKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=tJVGZmmA1bFjoevn7/qDYyyvIJ/eyc0u4ubgnC7ziTY=;
        b=iVph8KhZMdJpAeQv5cJkhsnva7iWw8ojO526Im3dMnmzmmWWpamBi2e1WsxkdkFuh2
         f5zTH9gtoUwfhIDPzK53xw8MPYjLAn7Nwu9q6yqDM/L1/tN2cAbAPT7PMA+AHI+U3C+z
         QO7D+oT8hXmKRwg6abyIIh5guGCqDaIk2uAa60IbrDdikiJYo7ZHwziFNTO510ISuedp
         +oERcWttOb4w0EnjHOv9XVlUwhmWsk0N+i9s/ar2bSmt8fpalXhO/JSdXIQNbn+cYkB7
         4lcGZpjgtyvbVrh7qF0yq8Y0rZGYNLnO1rtSACTjGPDhVdjxNtJXYREtvG1jnP+QIrJk
         4/+w==
X-Gm-Message-State: ANhLgQ1a8qPXUFgt8ehTGk32TAQQBbUCMXw7SA4TJnpsz2JbW8zcILBd
        NjTHDICMuybF48zz1HzodosIKw==
X-Google-Smtp-Source: ADFU+vtS5LbLrzS1jhzDwYVrTj6A9lZWX06g/Mga4Nlp7aFIrRyOCBB7aq2FIo/kyw4uUBQ1+JG/MQ==
X-Received: by 2002:a17:90a:33d1:: with SMTP id n75mr1033588pjb.167.1585104145832;
        Tue, 24 Mar 2020 19:42:25 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x4sm858194pgr.9.2020.03.24.19.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 19:42:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5cfeed6df208b74913312a1c97235ee615180f91.1582361737.git.mchehab+huawei@kernel.org>
References: <cover.1582361737.git.mchehab+huawei@kernel.org> <5cfeed6df208b74913312a1c97235ee615180f91.1582361737.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH 3/7] docs: fix broken references to text files
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arch@vger.kernel.org, linux-nfs@vger.kernel.org,
        kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        netdev@vger.kernel.org, linux-unionfs@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linux-mm@kvack.org,
        dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvmarm@lists.cs.columbia.edu,
        linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date:   Tue, 24 Mar 2020 19:42:24 -0700
Message-ID: <158510414428.125146.17397141028775937874@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Mauro Carvalho Chehab (2020-02-22 01:00:03)
> Several references got broken due to txt to ReST conversion.
>=20
> Several of them can be automatically fixed with:
>=20
>         scripts/documentation-file-ref-check --fix
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/hwtracing/coresight/Kconfig                  |  2 +-
>=20
> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/core=
sight/Kconfig
> index 6ff30e25af55..6d42a6d3766f 100644
> --- a/drivers/hwtracing/coresight/Kconfig
> +++ b/drivers/hwtracing/coresight/Kconfig
> @@ -107,7 +107,7 @@ config CORESIGHT_CPU_DEBUG
>           can quickly get to know program counter (PC), secure state,
>           exception level, etc. Before use debugging functionality, platf=
orm
>           needs to ensure the clock domain and power domain are enabled
> -         properly, please refer Documentation/trace/coresight-cpu-debug.=
rst
> +         properly, please refer Documentation/trace/coresight/coresight-=
cpu-debug.rst
>           for detailed description and the example for usage.
> =20
>  endif

I ran into this today and almost sent a patch. Can you split this patch
up into more pieces and send it off to the respective subsystem
maintainers?
