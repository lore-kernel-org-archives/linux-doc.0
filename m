Return-Path: <SRS0=0Efk=7P=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E5E4C433E1
	for <linux-doc@archiver.kernel.org>; Tue,  2 Jun 2020 14:30:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08C1E20757
	for <linux-doc@archiver.kernel.org>; Tue,  2 Jun 2020 14:30:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kK7I4XWx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbgFBOaB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Jun 2020 10:30:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbgFBOaB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Jun 2020 10:30:01 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E460CC08C5C0
        for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2020 07:29:59 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id p15so1837765qvr.9
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2020 07:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BRMN3iW+oQWPEGyzG/UpcFySwPI4120k+UQlkFdg484=;
        b=kK7I4XWxI7j45Cc5kvmTaPzrHmDCP25WmNaXinU+Azay3c4ZdKP+5IlDrppnIqoHoc
         bqx76b84raNpQM4UaYsRcS0J7wNeC6ej+9ZUmF823/bQ5RC7KIzeoAMqneKVHOVAX8+Z
         spHi4PsiPQTDcxjflrqcaA+EGr7RNld40CvgCxnmDQPFHWrWSvEQ5f4qImmLZeFdd2cj
         mTCxrfvK5BVe62c3aBe3Qf/iTVvKm20u+dw8oPAtogsOupBpZfx7idE7We/YPdBYHgxb
         C+TJLkS3Uz47iw6JB1LwjFLtxygGGJMtRadxYUUbU5RGPbDim9jUnY9SPzxaQiMkAnQR
         UXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BRMN3iW+oQWPEGyzG/UpcFySwPI4120k+UQlkFdg484=;
        b=pIz0S3xHQ2YbgPOHkcz2bLttpkIR2GslHLrH/ijYepTADaUGw59ZLsa5XpHDBtaOxn
         kUvEqYVz8qoOB6khEMd/YgwYFsiJlK1vuxxmCp74evsA8pdrvmMg6csmV8uS+FauOims
         XglY4t3mmhvqwAzXsxJlN/pf3KhWLaqSMOB/BCAmtmLDYUl4ktg8Qoodm5sypvfqUC6X
         4X7NuSTxISC+/a1LVVAPg4UYVQjbX7xJfIfe5JeVX50BBbbbBE1JGEo7jU51n4+Z7OUl
         6G7so0egihMUERtJSGwmHlrOMDmaEGt3yR9jj3cX4h12pNbpy9+0uWqva2lr3oAt+qP0
         ec+g==
X-Gm-Message-State: AOAM530BO8k0bOVQQkMi8X8DM4S4qxT8rGFl/SNTeeG3tQGY6aDhMMsT
        6H/4MDnD1vLVoagC3npdwSQWeOyO
X-Google-Smtp-Source: ABdhPJza6UVkh5IRpfcnkWOPuqYAX4rtxzM0q1CW3EyrVvXb6fwmdVl/AKNin6OOwB4ClrUYOMjtBQ==
X-Received: by 2002:a05:6214:589:: with SMTP id bx9mr1230287qvb.127.1591108198438;
        Tue, 02 Jun 2020 07:29:58 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id x13sm2469281qkj.36.2020.06.02.07.29.56
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2020 07:29:56 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id y13so5024075ybj.10
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2020 07:29:56 -0700 (PDT)
X-Received: by 2002:a25:aa70:: with SMTP id s103mr17445033ybi.492.1591108195719;
 Tue, 02 Jun 2020 07:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200602080535.1427-1-victor@inliniac.net>
In-Reply-To: <20200602080535.1427-1-victor@inliniac.net>
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date:   Tue, 2 Jun 2020 10:29:19 -0400
X-Gmail-Original-Message-ID: <CA+FuTSfD2-eF0H=Qu09=JXK6WTiWKNtcqRXqv3TfMfB-=0GiMg@mail.gmail.com>
Message-ID: <CA+FuTSfD2-eF0H=Qu09=JXK6WTiWKNtcqRXqv3TfMfB-=0GiMg@mail.gmail.com>
Subject: Re: [PATCH net-next v2] af-packet: new flag to indicate all csums are good
To:     Victor Julien <victor@inliniac.net>
Cc:     Network Development <netdev@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Eric Dumazet <edumazet@google.com>,
        Mao Wenan <maowenan@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
        Neil Horman <nhorman@tuxdriver.com>, linux-doc@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Alexander Drozdov <al.drozdov@gmail.com>,
        Tom Herbert <tom@herbertland.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 2, 2020 at 4:05 AM Victor Julien <victor@inliniac.net> wrote:
>
> Introduce a new flag (TP_STATUS_CSUM_UNNECESSARY) to indicate
> that the driver has completely validated the checksums in the packet.
>
> The TP_STATUS_CSUM_UNNECESSARY flag differs from TP_STATUS_CSUM_VALID
> in that the new flag will only be set if all the layers are valid,
> while TP_STATUS_CSUM_VALID is set as well if only the IP layer is valid.

transport, not ip checksum.

But as I understand it drivers set CHECKSUM_COMPLETE if they fill in
skb->csum over the full length of the packet. This does not
necessarily imply that any of the checksum fields in the packet are
valid yet (see also skb->csum_valid). Protocol code later compares
checksum fields against this using __skb_checksum_validate_complete and friends.

But packet sockets may be called before any of this, however. So I wonder
how valid the checksum really is right now when setting TP_STATUS_CSUM_VALID.
I assume it's correct, but don't fully understand where the validation
has taken place..

Similar to commit 682f048bd494 ("af_packet: pass checksum validation
status to the user"), please update tpacket_rcv and packet_rcv.

Note also that net-next is currently closed.




>  for convenience there are also the following defines::
>
> diff --git a/include/uapi/linux/if_packet.h b/include/uapi/linux/if_packet.h
> index 3d884d68eb30..76a5c762e2e0 100644
> --- a/include/uapi/linux/if_packet.h
> +++ b/include/uapi/linux/if_packet.h
> @@ -113,6 +113,7 @@ struct tpacket_auxdata {
>  #define TP_STATUS_BLK_TMO              (1 << 5)
>  #define TP_STATUS_VLAN_TPID_VALID      (1 << 6) /* auxdata has valid tp_vlan_tpid */
>  #define TP_STATUS_CSUM_VALID           (1 << 7)
> +#define TP_STATUS_CSUM_UNNECESSARY     (1 << 8)
>
>  /* Tx ring - header status */
>  #define TP_STATUS_AVAILABLE          0
> diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
> index 29bd405adbbd..94e213537646 100644
> --- a/net/packet/af_packet.c
> +++ b/net/packet/af_packet.c
> @@ -2215,10 +2215,13 @@ static int tpacket_rcv(struct sk_buff *skb, struct net_device *dev,
>
>         if (skb->ip_summed == CHECKSUM_PARTIAL)
>                 status |= TP_STATUS_CSUMNOTREADY;
> -       else if (skb->pkt_type != PACKET_OUTGOING &&
> -                (skb->ip_summed == CHECKSUM_COMPLETE ||
> -                 skb_csum_unnecessary(skb)))
> -               status |= TP_STATUS_CSUM_VALID;
> +       else if (skb->pkt_type != PACKET_OUTGOING) {
> +               if (skb->ip_summed == CHECKSUM_UNNECESSARY)
> +                       status |= TP_STATUS_CSUM_UNNECESSARY | TP_STATUS_CSUM_VALID;
> +               else if (skb->ip_summed == CHECKSUM_COMPLETE ||
> +                        skb_csum_unnecessary(skb))
> +                       status |= TP_STATUS_CSUM_VALID;
> +       }
>
>         if (snaplen > res)
>                 snaplen = res;
> --
> 2.17.1
>
