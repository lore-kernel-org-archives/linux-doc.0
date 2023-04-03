Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4829C76188
	for <linux-doc@archiver.kernel.org>; Mon,  3 Apr 2023 22:14:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233523AbjDCWOc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Apr 2023 18:14:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231530AbjDCWOb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Apr 2023 18:14:31 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6775E1989
        for <linux-doc@vger.kernel.org>; Mon,  3 Apr 2023 15:14:30 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id h8so123166314ede.8
        for <linux-doc@vger.kernel.org>; Mon, 03 Apr 2023 15:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1680560069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2gU0xPDdb0K1FdwRxRILyU2Pj+Ds548w8HpDbFE5RI=;
        b=Z3NoYUpuN+51H4YiZ+UYdsc87GFYIQAyh0NSDMG3zS8LomdR8E6aRi5E3S2QdnrBb/
         kjJIHm4IDH/Dj6cbTU7p9/qUFM4kYQSdN5SVTjL+KqSXSUlNP7qimcsU97bKdXIY9Rs4
         vToz6xxm5tqyKeXovpsrjRyG1yGl5SHXsHE5QKphWSICeqHV56OBzlRXGs7E1S0heM+f
         xjGQ8RewuNiyTV2gBrN3/HoBEcGcYzZYUaIHUrynX5B6VqlRyO6ek4HhVE7BYnr53FbU
         4fG9hlG1x8/596/5W6OtaOCOH2VT3OrODJo0B4feYHD5cLkjOy+ZpxQXP5U0CEhveQBu
         XRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680560069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2gU0xPDdb0K1FdwRxRILyU2Pj+Ds548w8HpDbFE5RI=;
        b=2el3cNGD4x2o7B5+P97O0nEplfN8zrhu6K09h9It46FTrDvrFMj/dtYyNVSFXvPi3l
         UUioVvASk/G3TRHKyr4R0KA9X8piOaOtpHbh9ORVlxOjKFVcCp9upKTYurcCcfs2YTqC
         +tQJ9iN89nkoJkggE+xBYNAL53O1HE4SlRw9QOHMEQ8R3Q+kzijdellXMculfVW3AQrO
         nirNGatR7uYEr6SpUls9cmk/WR1z5T0sQifTswqTwn4tL0lFB2OwUnzCdfd3CoOsueQj
         /oND+fc/jlTL4WKb/Ww14reRJsXR/1ovAANOXFPpc4uCcHpDZVbbRuWhhbrvJWM7x9/l
         Falw==
X-Gm-Message-State: AAQBX9fKG45Cg2nl9kp817+4Bxg/Xue8QDYqI2Ud/slHGcYxpWAj6Fkx
        zuzBXZe8bR532WRYgIExbz2qcnf52b+4lW7c8Yfpb/CI85dH8YWCeOo=
X-Google-Smtp-Source: AKy350YZ1CZ0S5BzS52EaZnwqGrMGvgVImHG39BdJiwjlssHdwEMxh/stb+LlVhPZyYrsD8ZkSJhQYiO+WNXK1nF+ZI=
X-Received: by 2002:a17:906:b55:b0:93f:82cb:fe44 with SMTP id
 v21-20020a1709060b5500b0093f82cbfe44mr114553ejg.11.1680560068875; Mon, 03 Apr
 2023 15:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230401200651.1022113-2-joe@isovalent.com> <202304022107.IwHc05cs-lkp@intel.com>
 <ZCpK5wOI0ZEedhrr@debian.me> <ZCqTMq3sHMrx2boI@mail.gmail.com>
In-Reply-To: <ZCqTMq3sHMrx2boI@mail.gmail.com>
From:   Joe Stringer <joe@isovalent.com>
Date:   Mon, 3 Apr 2023 15:14:17 -0700
Message-ID: <CADa=Ryw2BNupx9GH8cMTKLbgTZD6sLLAHdsmwr0AiEwa9DOsZA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 2/2] docs/bpf: Add LRU internals description
 and graph
To:     Maxim Mikityanskiy <maxtram95@gmail.com>
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>,
        kernel test robot <lkp@intel.com>, bpf@vger.kernel.org,
        oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, ast@kernel.org, corbet@lwn.net,
        martin.lau@linux.dev, john.fastabend@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I can reproduce this issue, will fix it up.

$ dot -V
dot - graphviz version 2.43.0 (0

On Mon, Apr 3, 2023 at 1:49=E2=80=AFAM Maxim Mikityanskiy <maxtram95@gmail.=
com> wrote:
>
> On Mon, 03 Apr 2023 at 10:41:27 +0700, Bagas Sanjaya wrote:
> > On Sun, Apr 02, 2023 at 09:47:49PM +0800, kernel test robot wrote:
> > > All warnings (new ones prefixed by >>):
> > >
> > > >> Warning: Orthogonal edges do not currently handle edge labels. Try=
 using xlabels.
> > >
> >
> > Hi,
> >
> > I can't reproduce the warning above. My system has graphviz 2.42.2
> > installed (via Debian package). What graphviz version do kernel test
> > robot have?
>
> I have the same warning on Arch Linux.
>
> $ dot --version
> dot - graphviz version 7.1.0 (0)
