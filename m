Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBBEDC74A5B
	for <linux-doc@archiver.kernel.org>; Thu, 30 Mar 2023 00:11:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231147AbjC3ALg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 29 Mar 2023 20:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231139AbjC3ALd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Mar 2023 20:11:33 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AE2B61AC
        for <linux-doc@vger.kernel.org>; Wed, 29 Mar 2023 17:11:08 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id y4so70061464edo.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Mar 2023 17:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680135059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zS7IQPDMiW/+hW+Ioye+W55SPe8UpMOLvNbr97Z2oxM=;
        b=MtcLTgzXeaOaGjVyhZXXnEZhyKHbd/mszjzjeBuOS7ayzlKN4JbJRb6qAhRpwKCUC9
         WI98oqReLXyzvL8wl+U6rTPzz0Il0jUjFlHCEBSWvbX5zpWc4988i5PJtbzkGvV/gFCL
         CxA9EzhGU4PzCncX/CrN2IxyXYFghWaV7Kh9MVlW+Nu9SExQsscjwKIXIABkji1j7lMY
         jmKNzVu89DjiNc18Y6iLXcPz1SewEhn/SeDhLJpaMr4pnX78Gc/pij8HbFcFgH8wFnkv
         nt/8JHRKbYf8Ra0C3AdoBtMSKjCbRGxOo1/QzcoXKe1jzyZMcbd2TseVaIohEie11Xt0
         Tgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680135059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zS7IQPDMiW/+hW+Ioye+W55SPe8UpMOLvNbr97Z2oxM=;
        b=MkrdqggeyEFak4bEZ1nfYP4Bh61Xj7+HYoci0BOn4j1EzupSYywUfOoBDoa09HVvFU
         9BxUymj1g3hJ2j7F7bd53Gd1LBpzYei9UeratltHGRku03MqtOx1OUaNWl+OB4kSRLWF
         1JyCWQ//fNa3rSMMqMN+4ceMGYbWzR9xW4Vx+5rIdgaUJvFHF/1tE1r+I8DSd2pbi70A
         LkAlJ7Yx10WvUgbdKmx1VLCDTCA4m0/UgfobgMfxfqWJKT8mW5xjeftEkS7MYKrPyyHD
         cH4Qq3hihZWmQYpwLGSpuyznrZ59RxL5mEvvh6fcBmlwFVXrgD8Z3LZ0G0NMte3HnnOF
         3luA==
X-Gm-Message-State: AAQBX9fzbRRjSqtNp5ovZMn3TbWZFzPv2o8h1NZ9CggD6rG4dB06DXF+
        u0vOoSVeUCa3owkdpsCbRT938cV6dTEFeix7oXZ7Zw==
X-Google-Smtp-Source: AKy350aQi/2VkOWBIHQZFz8KEl/mv/orzkh9EkbmeOwUKSG+CmSGY34HyXENmyU1zGl0l4nRBuJygVcksv+wRoXFGZw=
X-Received: by 2002:a17:907:c281:b0:8b1:7682:3181 with SMTP id
 tk1-20020a170907c28100b008b176823181mr9849398ejc.9.1680135059084; Wed, 29 Mar
 2023 17:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230329110723.3458843-1-sadiyakazi@google.com>
In-Reply-To: <20230329110723.3458843-1-sadiyakazi@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 29 Mar 2023 20:10:47 -0400
Message-ID: <CAFd5g45kEm2Kmwac3DTYVgWOcXLfp3b8_59euXOiJW8RVxRX0Q@mail.gmail.com>
Subject: Re: [PATCH v1] list: test: Test the klist structure
To:     Sadiya Kazi <sadiyakazi@google.com>
Cc:     davidgow@google.com, skhan@linuxfoundation.org, corbet@lwn.net,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 29, 2023 at 7:07=E2=80=AFAM Sadiya Kazi <sadiyakazi@google.com>=
 wrote:
>
> Add KUnit tests to the klist linked-list structure.
> These perform testing for different variations of node add
> and node delete in the klist data structure (<linux/klist.h>).
>
> Limitation: Since we use a static global variable, and if
> multiple instances of this test are run concurrently, the test may fail.
>
> Signed-off-by: Sadiya Kazi <sadiyakazi@google.com>

Looks good!

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
