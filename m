Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8398C7D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 27 Feb 2019 16:27:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbfB0Q1f (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 27 Feb 2019 11:27:35 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:34702 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726223AbfB0Q1f (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Feb 2019 11:27:35 -0500
Received: by mail-ua1-f65.google.com with SMTP id a42so15915611uad.1
        for <linux-doc@vger.kernel.org>; Wed, 27 Feb 2019 08:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UxgEDS2CX/CMq20ylO8bSwgapXjZEgLgnN1+iXxgyB4=;
        b=m9W2RWrPGFU0kTqTwPbx+GS/q5Mx8/SrZWVqVUu8C80Blg3WUbNfEUbf5tZ6PRLnMC
         O157XHAgGDDe8lGhsXAz+Hq29Jh0lmImXqs6fp3BvDHfZGg+zNIZw6kkCZGkf1ZnirI9
         87XHcUujeiVyLzHMNcf3c+icWB7F6nxC2SD30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UxgEDS2CX/CMq20ylO8bSwgapXjZEgLgnN1+iXxgyB4=;
        b=tY7x+73e4cZ5dde/T1yOu1yeNQ4K8soBzhUFKqc4CbtP/rOk9vLfH9ilpRPeTjo0LQ
         IHPjXuVTyz0Nd7Gk2I2z2H6zAIu2WjgcHM9EVqhmxiYxz4s/ynJA0/C0cBePHkvtbU3L
         4YB613NHs72Awem2hJWQ04JkAovV9Y3Vqm/3h/Drkz14yWa97y/xRflf0k8zAqZHsxZr
         eL8IZmYpQXUhumut5GCuNKd+hmrDlx0CSt71WmrZzSPSFpwN662qgQpX4o8goXDR0Apt
         Joimtf8A4vPBE0iiFaceLYPjbz7/MhI7l/1ZKE97UGZOWUJUNeFwqsM9kCcMeMjA33T2
         11NQ==
X-Gm-Message-State: AHQUAuY8/dObyRXDBwgcLGvW9wrnN6a1tTgFtAEv8F3vQZBDmGXKpXLE
        9ncGdaKr8Eig/jMYpuqFLw7y/dGs5M4=
X-Google-Smtp-Source: APXvYqwhm0f0so7vEowW+b8FFuE8hOX3FD+fSYGRbc7tRc4I2/pyxkXMCLputpwjbh0lfOHd7gfuZg==
X-Received: by 2002:ab0:2c04:: with SMTP id l4mr2481233uar.9.1551284853470;
        Wed, 27 Feb 2019 08:27:33 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id n194sm2314541vke.8.2019.02.27.08.27.31
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Feb 2019 08:27:31 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id j8so15852979uae.13
        for <linux-doc@vger.kernel.org>; Wed, 27 Feb 2019 08:27:31 -0800 (PST)
X-Received: by 2002:ab0:2712:: with SMTP id s18mr2507403uao.114.1551284851047;
 Wed, 27 Feb 2019 08:27:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1551213058.git.efremov@ispras.ru> <CAGXu5jKzDi42Hazh7JsPQpzH-xdQQTQ+oD06Bb1N6tbYzB3uuA@mail.gmail.com>
 <35a7a5dd-4478-1dc2-5966-c974196f8c7a@ispras.ru>
In-Reply-To: <35a7a5dd-4478-1dc2-5966-c974196f8c7a@ispras.ru>
From:   Kees Cook <keescook@chromium.org>
Date:   Wed, 27 Feb 2019 08:27:18 -0800
X-Gmail-Original-Message-ID: <CAGXu5j+s7k=nai-ZaMo_526OBBmzNosZ2Dxmjk5LXNP06XJ4Rg@mail.gmail.com>
Message-ID: <CAGXu5j+s7k=nai-ZaMo_526OBBmzNosZ2Dxmjk5LXNP06XJ4Rg@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] LSM documentation update
To:     Denis Efremov <efremov@ispras.ru>
Cc:     Casey Schaufler <casey@schaufler-ca.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Eric Paris <eparis@parisplace.org>,
        John Johansen <john.johansen@canonical.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Paul Moore <paul@paul-moore.com>,
        Kentaro Takeda <takedakn@nttdata.co.jp>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 27, 2019 at 7:10 AM Denis Efremov <efremov@ispras.ru> wrote:
> The rest of the warnings are about undocumented hooks. This patchset
> fixes the existing documentation. I will try to document the hooks from
> warnings in a separate patch. Some of the hooks are trivial enough, but
> others require me digging into the code and mailing lists. Can't promise
> to do it quickly.

No worries! What you've added already helps a lot. :)

-- 
Kees Cook
