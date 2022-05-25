Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184FDC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 25 May 2022 16:02:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238290AbiEYQCo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 25 May 2022 12:02:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236553AbiEYQCn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 May 2022 12:02:43 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1652C93993
        for <linux-doc@vger.kernel.org>; Wed, 25 May 2022 09:02:42 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id gh17so29557904ejc.6
        for <linux-doc@vger.kernel.org>; Wed, 25 May 2022 09:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lb8jI+HgCwwCo9V7MBgxPMSbhS6L6pVhhain2dWQdfw=;
        b=SrcSxh5jk6TjzFY/hFo4GziSI+tKwhTA+Bvj+vAZBzjRzoe5Yq5yUQ8S6OgM7ow5UA
         I1rF2QLtzS87ewjkBnw11tZEocdxf3LdCJ+RmmexCCKPZsRw7wjUq4DXjoL498yjLWPZ
         rYUCkLMUhIDW61u3uDHvosCrwx9NoPonecdyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lb8jI+HgCwwCo9V7MBgxPMSbhS6L6pVhhain2dWQdfw=;
        b=CsBMq4qdd/b8+6K+eqgGpK502FrIQectFUUu2pTTSK3flRATCTEm0Wp/rxXMEgo4uj
         uXPH/6cOaCSZ4nzeQPj+s35rvLQ2XdSUHLFm+HfII2XzApN97CQnBLMeCdgXu/3LEtVl
         DfPI3Zac6m/hOi0C1bUzJJ2fzZvnMClDwRYtH9eN3MdAcz+y5Xae0TiJIhWbli7/jqNI
         gzOMp6bI8yCiplSV6GH1bQpqkcgVwEnZJkOLWd2qBVx0Zc8JsyJUFsullhruGYOBKG01
         XRBKR2Ilf248ZSavS6GDB9Kh1fWltPI257BG2ANl2euHau/t4t8HJZsVosvNGx/9KgyZ
         XDrA==
X-Gm-Message-State: AOAM531WPBIHMgHR/Mx2Rwm/XEOT1Tp3aVRRtUs5jzyQ2SuNenoyV/8Y
        mh3Ok03HEbSuZ7Tfzuvu3RdtsHqkSMMk461m
X-Google-Smtp-Source: ABdhPJy79YuOWOZyqekbPF3tbbtshLIyuDA5UUo4wOKyMK/IZkjhvXmvNYAEV/TTCfRcV2SXTrM15g==
X-Received: by 2002:a17:907:7e90:b0:6fe:c5bc:d391 with SMTP id qb16-20020a1709077e9000b006fec5bcd391mr17521983ejc.747.1653494560177;
        Wed, 25 May 2022 09:02:40 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id z20-20020aa7c654000000b0042ae4dea360sm10798944edr.63.2022.05.25.09.02.36
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 May 2022 09:02:37 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id z15so6923114wrg.11
        for <linux-doc@vger.kernel.org>; Wed, 25 May 2022 09:02:36 -0700 (PDT)
X-Received: by 2002:a5d:59ac:0:b0:20e:6fd6:88c1 with SMTP id
 p12-20020a5d59ac000000b0020e6fd688c1mr25406709wrr.442.1653494556145; Wed, 25
 May 2022 09:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220525144638.293934-1-helgaas@kernel.org>
In-Reply-To: <20220525144638.293934-1-helgaas@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 25 May 2022 09:02:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=whk=ygWsxt=1HhndCwjtXdga9sPmkxFGby5PJWRk5yx9Q@mail.gmail.com>
Message-ID: <CAHk-=whk=ygWsxt=1HhndCwjtXdga9sPmkxFGby5PJWRk5yx9Q@mail.gmail.com>
Subject: Re: [PATCH] Revert "linux/types.h: remove unnecessary __bitwise__"
To:     Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "Michael S . Tsirkin" <mst@redhat.com>, llvm@lists.linux.dev,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 25, 2022 at 7:46 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> This reverts commit c724c866bb70cb8c607081a26823a1f0ebde4387.
>
> Jiri Slaby reported that c724c866bb70 ("linux/types.h: remove unnecessary
> __bitwise__") broke userspace, including open-iscsi, because it uses
> __bitwise__.
>
> Restore the __bitwise__ definition.

Hmm.

Presumably it's only the uapi case that actually wants to re-instate it.

And I'd rather make that "__bitwise__" case explicitly special, with a
comment about why it exists when the kernel itself doesn't use it.

IOW, rather than the revert, maybe something like the below
(whitespace-damaged) instead?

Jiri, does something like this work for you?

                 Linus

---
 include/uapi/linux/types.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/linux/types.h b/include/uapi/linux/types.h
index c4dc597f3dcf..308433be33c2 100644
--- a/include/uapi/linux/types.h
+++ b/include/uapi/linux/types.h
@@ -26,6 +26,9 @@
 #define __bitwise
 #endif

+/* The kernel doesn't use this legacy form, but user space does */
+#define __bitwise__ __bitwise
+
 typedef __u16 __bitwise __le16;
 typedef __u16 __bitwise __be16;
 typedef __u32 __bitwise __le32;
