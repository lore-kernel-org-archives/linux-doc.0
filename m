Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E915C3DA78
	for <linux-doc@archiver.kernel.org>; Sun, 15 Jan 2023 04:07:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbjAOEHq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 14 Jan 2023 23:07:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230003AbjAOEHo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 14 Jan 2023 23:07:44 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68A397289
        for <linux-doc@vger.kernel.org>; Sat, 14 Jan 2023 20:07:43 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id g23so11603115plq.12
        for <linux-doc@vger.kernel.org>; Sat, 14 Jan 2023 20:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1u/LKr8SKUU64Uq7mJueQ/ENJ3ZCxwdfkhzKDZCdJ8=;
        b=nPuPMiXnDpCHzuqOZjCFQu2HVDfi+uiCmzw3TSkT/IxOMOljxQMUNFSM0HCkMdEV/3
         9gpGkC6gRXAFPvxddfuIssu0dXF6JiTm/mbS6udT7z18SxIF2+WzcPHoyXgGlwe92Hpi
         gR7jsDzO5Fe1QIuNfmGpZyQ3FdMWeHKr0cX4hzGyLXRZAYDkqn4smFHHx+t9zP0HUCyW
         YcQLIetwNaBz73c+88I64eggW5cIhlm9lw+F+ioa/Pe+i4qCx35Oedlf0BaeEAc7NUgu
         obyxTBnw+kvG0ZfibyWliZ/qT50rDFJeBBs9TZipbA2/TyDXsyNTB8/UxYXyYmqJBbcB
         hXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1u/LKr8SKUU64Uq7mJueQ/ENJ3ZCxwdfkhzKDZCdJ8=;
        b=oJcv2yFlY2EacSj4dFE4UIMFclRXM19ugtErxkWA3kwJ9qLuifPg5r9DWb5UHyRCNZ
         e8U0dtAsYQgk1bCmjyUG0O9tJxB8xy9POBmdUnck2Lu8F3wJbDotu+YNYs2F4yUOxQWR
         gsEIbbNw2cCx9/QZZ74NGWih9bJRdq1A+5PD+lvTh0I8xahsfGwrqQfdxDY8bi0TQf7p
         iT+DJN3Aa6pA7y+G0tpjfwLuONvKNKwB7LS0bBosgeuVg3GpRySQIXQjb89iLVEtzDYF
         k5Fsv0VYyRkFvIjkFgxQrdOc+c0ucYISE+O/19XaZFPwbcxxrIKqKB2lGYF+Sh3bGVff
         LE5g==
X-Gm-Message-State: AFqh2krF7zuPZFHR9VJ5xNxkS/qGLu7rNCf/tUTChksI0Go0DohOkfEz
        +a+POYdnJR0CJAFUL9gJXpXy5OmALGFKoCx/XXPzymAmPlaVNA==
X-Google-Smtp-Source: AMrXdXvFgNMqw07AtVeMeOi99S7DjSub6m0kTK0OHPoWKgDyEcAmOwRR6YJwxSOsbMuHpPD3QtQ0IxPLpoeZ+E8a1tY=
X-Received: by 2002:a17:90a:5889:b0:225:bc87:5175 with SMTP id
 j9-20020a17090a588900b00225bc875175mr7032265pji.190.1673755662514; Sat, 14
 Jan 2023 20:07:42 -0800 (PST)
MIME-Version: 1.0
References: <20230112130355.696111-1-siyanteng@loongson.cn>
In-Reply-To: <20230112130355.696111-1-siyanteng@loongson.cn>
From:   Yizhou Tang <tangyeechou@gmail.com>
Date:   Sun, 15 Jan 2023 12:07:31 +0800
Message-ID: <CAOB9oOa0v5wAB5WX6-mgpVzdC4bGL+yzff8r+atFz0MWicfYaw@mail.gmail.com>
Subject: Re: [PATCH v2] docs/zh_CN: Add a glossary of Chinese translation terms
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        bobwxc@email.cn, chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        me@lirui.org, siyanteng01@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> =E4=BA=8E2023=E5=B9=B41=E6=9C=8812=E6=97=
=A5=E5=91=A8=E5=9B=9B 21:03=E5=86=99=E9=81=93=EF=BC=9A
>
> As more and more documents are translated and some English
> words are translated into different Chinese, it seems that
> we need a glossary of Chinese translation terms.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---

Reviewed-by: Tang Yizhou <tangyeechou@gmail.com>
