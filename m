Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6393C61DA4
	for <linux-doc@archiver.kernel.org>; Sat, 11 Mar 2023 12:31:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbjCKMbx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 11 Mar 2023 07:31:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbjCKMbu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 11 Mar 2023 07:31:50 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA9C12E157
        for <linux-doc@vger.kernel.org>; Sat, 11 Mar 2023 04:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678537857;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6tJN+LOTi1Ma+P6eA0R3ApEkRj3LCEestZfzy3kbU+s=;
        b=FH1VjBXrMTQoMFCENTo2Fc471FfP+Vc8cYzwRH/rdBUzm2POydcOxKOJZUCCuNcnReOUkD
        i8jGrguHtaDbfi9zdWni3vtdWzn9SHICtXoOJ1CFKD9wprZpCDSfsrFsRVZRpYd5XB5Gd1
        +QRfj8iucodzZHuuiectPnEC+jt/PAw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-Q8Je7cQENiuQM-WaK2TS9w-1; Sat, 11 Mar 2023 07:30:56 -0500
X-MC-Unique: Q8Je7cQENiuQM-WaK2TS9w-1
Received: by mail-qk1-f198.google.com with SMTP id ea22-20020a05620a489600b00742cec04043so4564161qkb.7
        for <linux-doc@vger.kernel.org>; Sat, 11 Mar 2023 04:30:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678537855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6tJN+LOTi1Ma+P6eA0R3ApEkRj3LCEestZfzy3kbU+s=;
        b=WtzdJI3W0jDlqSbIsHdEf3dyP3R+79GZWHJRVV5b1fI5KZo3QejavItbZwt/2V9aCu
         XgnzKAxo4XyldHaumckfN0gQAJAHjwWycjfeuB8Xv/fyqSTQmdz6iRMbaL/FzGiHx8cC
         0jJ03aRwmB8JE3uHQdkmXm1u0v/JXBvSuXrpOhHzu5OTPOO0sKwJJY4WU83Fpefao0+U
         WaEQzmtsXegT0n58NXhff0+DU1Fdih6jUex7+wbtz1qKteD/KnzTTdjNw1/LVERYZrMm
         kuwBb5tlQOm19QBJpp8GYau48SovHirpIZXYqx0eycbUJbOoDN3QhiBTEL+sK6Yghmoz
         Fj6w==
X-Gm-Message-State: AO0yUKXeXjFBLpSCbcOYhU8BEHJ+sGm7doNYv9wzhRXVR/KiFVgI6TTk
        rVGvZnn/aT2Q+Fw0tN+UNpvi2Ve9gt2DT1k6pcrO4rFvyEelhl/tuvEaX19yHNfkxjj8SzF0UVU
        VSW7fgb1f1/PeuBRJ5itoHeHPYcz1JcFps9DA
X-Received: by 2002:a05:620a:b42:b0:742:86ba:13b9 with SMTP id x2-20020a05620a0b4200b0074286ba13b9mr1247852qkg.6.1678537855646;
        Sat, 11 Mar 2023 04:30:55 -0800 (PST)
X-Google-Smtp-Source: AK7set/TpnkKszZ6s4HZDKvVwUOaQa5hdplglcxvHLdzpgsai2DkB2eoJKprpykjHsivQAew4hdywCki2O4XJedO/Ys=
X-Received: by 2002:a05:620a:b42:b0:742:86ba:13b9 with SMTP id
 x2-20020a05620a0b4200b0074286ba13b9mr1247842qkg.6.1678537855362; Sat, 11 Mar
 2023 04:30:55 -0800 (PST)
MIME-Version: 1.0
References: <20230310201525.2615385-1-eblake@redhat.com> <20230310201525.2615385-3-eblake@redhat.com>
In-Reply-To: <20230310201525.2615385-3-eblake@redhat.com>
From:   Nir Soffer <nsoffer@redhat.com>
Date:   Sat, 11 Mar 2023 14:30:39 +0200
Message-ID: <CAMRbyysDE+v_D6Q3tCf_+86T0V57UE4Emw6zc_4vnUu0Yau23A@mail.gmail.com>
Subject: Re: [PATCH 2/3] uapi nbd: add cookie alias to handle
To:     Eric Blake <eblake@redhat.com>
Cc:     josef@toxicpanda.com, linux-block@vger.kernel.org,
        nbd@other.debian.org, philipp.reisner@linbit.com,
        lars.ellenberg@linbit.com, christoph.boehmwalder@linbit.com,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 10, 2023 at 10:16=E2=80=AFPM Eric Blake <eblake@redhat.com> wro=
te:
>
> The uapi <linux/nbd.h> header declares a 'char handle[8]' per request;
> which is overloaded in English (are you referring to "handle" the
> verb, such as handling a signal or writing a callback handler, or
> "handle" the noun, the value used in a lookup table to correlate a
> response back to the request).  Many client-side NBD implementations
> (both servers and clients) have instead used 'u64 cookie' or similar,
> as it is easier to directly assign an integer than to futz around with
> memcpy.  In fact, upstream documentation is now encouraging this shift
> in terminology: https://lists.debian.org/nbd/2023/03/msg00031.html
>
> Accomplish this by use of an anonymous union to provide the alias for
> anyone getting the definition from the uapi; this does not break
> existing clients, while exposing the nicer name for those who prefer
> it.  Note that block/nbd.c still uses the term handle (in fact, it
> actually combines a 32-bit cookie and a 32-bit tag into the 64-bit
> handle), but that internal usage is not changed the public uapi, since
> no compliant NBD server has any reason to inspect or alter the 64
> bits sent over the socket.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  include/uapi/linux/nbd.h | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/include/uapi/linux/nbd.h b/include/uapi/linux/nbd.h
> index 8797387caaf7..f58f2043f62e 100644
> --- a/include/uapi/linux/nbd.h
> +++ b/include/uapi/linux/nbd.h
> @@ -81,7 +81,10 @@ enum {
>  struct nbd_request {
>         __be32 magic;   /* NBD_REQUEST_MAGIC    */
>         __be32 type;    /* See NBD_CMD_*        */
> -       char handle[8];
> +       union {
> +               char handle[8];
> +               __be64 cookie;
> +       };
>         __be64 from;
>         __be32 len;
>  } __attribute__((packed));
> @@ -93,6 +96,9 @@ struct nbd_request {
>  struct nbd_reply {
>         __be32 magic;           /* NBD_REPLY_MAGIC      */
>         __be32 error;           /* 0 =3D ok, else error   */
> -       char handle[8];         /* handle you got from request  */
> +       union {
> +               char handle[8]; /* handle you got from request  */
> +               __be64 cookie;

Should we document like this?

    union {
        __be64 cookie; /* cookie you got from request */
        char handle[8]; /* older name */

I think we want future code to use the new term.

> +       };
>  };
>  #endif /* _UAPILINUX_NBD_H */
> --
> 2.39.2
>

Nir

