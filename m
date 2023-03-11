Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6F53C61DA4
	for <linux-doc@archiver.kernel.org>; Sat, 11 Mar 2023 12:23:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbjCKMXz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 11 Mar 2023 07:23:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjCKMXx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 11 Mar 2023 07:23:53 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC1812CC6
        for <linux-doc@vger.kernel.org>; Sat, 11 Mar 2023 04:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678537390;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=z0ncK7kQPU4tM41Xw7Dto2fGmFTmgA/05JfWF548UL4=;
        b=dYiooBR2Sdu5dFshiJ9qC/T8ok4+mS7Q2S3r3zV+E1MyJ54xe6mLCEPWRaqjYZfjLjIp8I
        MxaudMgv2tL0f60UN4xoJhqFBXKcgwiPYnOzJlgbsSz1G7AP4r1tZR4VscCObBL2t2L/dC
        sbDBFflTRXJanvTwcRtY7x/WiC+s/js=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278--iKNL-M_PcGAepnQdfYBwg-1; Sat, 11 Mar 2023 07:23:08 -0500
X-MC-Unique: -iKNL-M_PcGAepnQdfYBwg-1
Received: by mail-qt1-f198.google.com with SMTP id c5-20020ac85185000000b003bfae3b8051so4481185qtn.0
        for <linux-doc@vger.kernel.org>; Sat, 11 Mar 2023 04:23:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678537388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0ncK7kQPU4tM41Xw7Dto2fGmFTmgA/05JfWF548UL4=;
        b=n/qimJHOID5/WbcKEWb6DpPMKo1P/416ryHUb0G4YeUi6s6bO0h3hrKx33EcmnG0nF
         79SCINKJPoQO3gp9lkoaausJKFjHwEKGhnAc7LwRaPpHehonI/vyx1MU9CwdmjhzmTjY
         h0KlcGGIeXBks5nb/aRihO6JtDtgAqX0kawwnlNVJOkVs87Gh1T18prjWXf3S7KAftc2
         JCmItHZ7dDknBiJsiO7li3zOgu1N/o+LLuV0KsX10fHy8nmndtP2vqXFGU75l+pnEyfa
         geAZGCjim7uvkBLQUWF/qCb3hwI85z17HGVJ+B88mMszvHh8OPqAG/rxmCMqEsYbZLSE
         pAYA==
X-Gm-Message-State: AO0yUKVKkCfjVRtNwWwkcxXWbdMCRzbbYR1wtTwW6gluLd/aJGYKNOz2
        lyFjGZKnpOi8x6BfceZtRV+wUnl/+G6Yq+cP7zMn6MeYrnTNS8tecqtCljmu9PWRqD7oJ+4JG/9
        cg7Ar4K+A1Edk08oQ4JB62X2CuW9g9PA3+Yxi
X-Received: by 2002:ae9:f00a:0:b0:742:6e03:4091 with SMTP id l10-20020ae9f00a000000b007426e034091mr1365171qkg.6.1678537387414;
        Sat, 11 Mar 2023 04:23:07 -0800 (PST)
X-Google-Smtp-Source: AK7set+ahdPUjKtqLXS4t/tIFiVrX+FhWFPj4c7AdJccBkphBZCKDMNyJB/8I64SarjmIvrKHtooaHXg7cKfznTu95I=
X-Received: by 2002:ae9:f00a:0:b0:742:6e03:4091 with SMTP id
 l10-20020ae9f00a000000b007426e034091mr1365155qkg.6.1678537387081; Sat, 11 Mar
 2023 04:23:07 -0800 (PST)
MIME-Version: 1.0
References: <20230310201525.2615385-1-eblake@redhat.com> <20230310201525.2615385-4-eblake@redhat.com>
In-Reply-To: <20230310201525.2615385-4-eblake@redhat.com>
From:   Nir Soffer <nsoffer@redhat.com>
Date:   Sat, 11 Mar 2023 14:22:51 +0200
Message-ID: <CAMRbyyv59L9GiLr5tJvnNdwnBNdNGw+xveG7S63WC9ycOuJYrA@mail.gmail.com>
Subject: Re: [PATCH 3/3] block nbd: use req.cookie instead of req.handle
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
> A good compiler should not compile this any differently, but it seems
> nicer to avoid memcpy() when integer assignment will work.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  drivers/block/nbd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 592cfa8b765a..672fb8d1ce67 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -606,7 +606,7 @@ static int nbd_send_cmd(struct nbd_device *nbd, struc=
t nbd_cmd *cmd, int index)
>                 request.len =3D htonl(size);
>         }
>         handle =3D nbd_cmd_handle(cmd);

This returns native u64 (likely little endian) but the new interface
specifies __be64. Should we swap the bytes if needed?

This will help tools like the wireshark plugin to display the right value
when checking traces from machines with different endianness. Or help
the nbd server to show the same *cooike* value in the logs. The value
is opaque but reasonable code can assume that __be64 can be safely
parsed as an integer.

> -       memcpy(request.handle, &handle, sizeof(handle));
> +       request.cookie =3D handle;
>
>         trace_nbd_send_request(&request, nbd->index, blk_mq_rq_from_pdu(c=
md));
>
> @@ -732,7 +732,7 @@ static struct nbd_cmd *nbd_handle_reply(struct nbd_de=
vice *nbd, int index,
>         u32 tag;
>         int ret =3D 0;
>
> -       memcpy(&handle, reply->handle, sizeof(handle));
> +       handle =3D reply->cookie;
>         tag =3D nbd_handle_to_tag(handle);
>         hwq =3D blk_mq_unique_tag_to_hwq(tag);
>         if (hwq < nbd->tag_set.nr_hw_queues)
> --
> 2.39.2
>

Also the same file has references to *handle* like:

static u64 nbd_cmd_handle(struct nbd_cmd *cmd)
{
    struct request *req =3D blk_mq_rq_from_pdu(cmd);
    u32 tag =3D blk_mq_unique_tag(req);
    u64 cookie =3D cmd->cmd_cookie;

    return (cookie << NBD_COOKIE_BITS) | tag;
}

static u32 nbd_handle_to_tag(u64 handle)
{
    return (u32)handle;
}

static u32 nbd_handle_to_cookie(u64 handle)
{
    return (u32)(handle >> NBD_COOKIE_BITS);
}

So this change is a little bit confusing.

I think we need to use a term like *nbd_cookie* instead of
*handle* to make this more clear.

Nir

