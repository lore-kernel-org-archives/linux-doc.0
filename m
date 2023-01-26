Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82658C54E94
	for <linux-doc@archiver.kernel.org>; Thu, 26 Jan 2023 09:46:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjAZJql (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Jan 2023 04:46:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjAZJqk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Jan 2023 04:46:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7D99C17B
        for <linux-doc@vger.kernel.org>; Thu, 26 Jan 2023 01:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674726358;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2SYkSovMaW2XoSXHsrHI+434w+NAs7lDBuGn6R/cFfA=;
        b=DJGTPurvJVPDkKEbXMqCNeKjRGwXPWJ+ElC9P/Hism4aOhO4H6vRa9Qwx19WUj0MB5hYZ2
        A5HJE+F20iTT6Vtr3xTfbUEfZAsJj1GPyrbUA4RCnV2HqRuf3wWODKE8QWx645TaaRGlwS
        4vThQuC+S4DzB+eJcsESJorGtNAIOzE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-148-1NK8GMebOISV1r3YnzMa3Q-1; Thu, 26 Jan 2023 04:45:56 -0500
X-MC-Unique: 1NK8GMebOISV1r3YnzMa3Q-1
Received: by mail-qv1-f72.google.com with SMTP id e5-20020a056214110500b0053547681552so787469qvs.8
        for <linux-doc@vger.kernel.org>; Thu, 26 Jan 2023 01:45:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2SYkSovMaW2XoSXHsrHI+434w+NAs7lDBuGn6R/cFfA=;
        b=We8pmvcaMXszxgOqh41Tuggk0Fdk6psEpdgVyOwRKx4tn+0ehtWi/uUR8vLjM6lHNG
         Pbww7p+ofNdLhFSXLd7ylWWNrVfQW7p6PrZUfn/ZPKrE1RKY8hhZX/wn0d/r3P28AWyN
         aN6GRUet/ZvGo5JPS5Y1l1xsR6dkdLI6OkJB43vdN4OnncaM74LtimnpkIKlcptCDolz
         g4q80Zyhv5AkLmiWK4FdoSF/7D1/yf8NYQ/7sBnbwTqVvk391FB7WNz0420y4r890Fqw
         dEEmGHEnmLXvZ9snFQ4BC1xeCrViGPsovKyUxsdAsTvJM4sWeSmZF0nkSDYnATfGj0Dh
         qq1g==
X-Gm-Message-State: AFqh2krO4oZWbAHsG60oDBF7Gve4rJaTiSc3uI8fM7SHkEQu4NtL7YoD
        uUVIAWHW3kKk+eZtVzbVkTU/J5mRMVSqbNBU/nx51yLNprrGumr+QJSjSKN79bZAcX5JSmxDX9P
        tTC/qN8AKlt9YPBoswyEX
X-Received: by 2002:ac8:138c:0:b0:3b6:2be5:a2f7 with SMTP id h12-20020ac8138c000000b003b62be5a2f7mr50021931qtj.54.1674726356169;
        Thu, 26 Jan 2023 01:45:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtuGY6SKfeImfr/sz3V+kwZi70EAHbkkSoDj6gfrheVzh+xfVtlWKWYkwuXC5dTnUz5Rj/MrA==
X-Received: by 2002:ac8:138c:0:b0:3b6:2be5:a2f7 with SMTP id h12-20020ac8138c000000b003b62be5a2f7mr50021922qtj.54.1674726355827;
        Thu, 26 Jan 2023 01:45:55 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-113-28.dyn.eolo.it. [146.241.113.28])
        by smtp.gmail.com with ESMTPSA id 2-20020ac82082000000b003ad373d04b6sm441378qtd.59.2023.01.26.01.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 01:45:55 -0800 (PST)
Message-ID: <75f6e5d0e42a8b9895c1b2330c373da9ed7f41db.camel@redhat.com>
Subject: Re: [PATCH net-next v1 01/10] xfrm: extend add policy callback to
 set failure reason
From:   Paolo Abeni <pabeni@redhat.com>
To:     Leon Romanovsky <leon@kernel.org>, Jakub Kicinski <kuba@kernel.org>
Cc:     "David S . Miller" <davem@davemloft.net>,
        Steffen Klassert <steffen.klassert@secunet.com>,
        Andy Gospodarek <andy@greyhouse.net>,
        Ayush Sawal <ayush.sawal@chelsio.com>,
        Eric Dumazet <edumazet@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        intel-wired-lan@lists.osuosl.org,
        Jay Vosburgh <j.vosburgh@gmail.com>,
        Jesse Brandeburg <jesse.brandeburg@intel.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org, oss-drivers@corigine.com,
        Raju Rangoju <rajur@chelsio.com>,
        Saeed Mahameed <saeedm@nvidia.com>,
        Simon Horman <simon.horman@corigine.com>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        Veaceslav Falico <vfalico@gmail.com>
Date:   Thu, 26 Jan 2023 10:45:50 +0100
In-Reply-To: <Y9Irgrgf3uxOjwUm@unreal>
References: <cover.1674560845.git.leon@kernel.org>
         <c182cae29914fa19ce970859e74234d3de506853.1674560845.git.leon@kernel.org>
         <20230125110226.66dc7eeb@kernel.org> <Y9Irgrgf3uxOjwUm@unreal>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 2023-01-26 at 09:28 +0200, Leon Romanovsky wrote:
> On Wed, Jan 25, 2023 at 11:02:26AM -0800, Jakub Kicinski wrote:
> > On Tue, 24 Jan 2023 13:54:57 +0200 Leon Romanovsky wrote:
> > > -	err =3D dev->xfrmdev_ops->xdo_dev_policy_add(xp);
> > > +	err =3D dev->xfrmdev_ops->xdo_dev_policy_add(xp, extack);
> > >  	if (err) {
> > >  		xdo->dev =3D NULL;
> > >  		xdo->real_dev =3D NULL;
> > >  		xdo->type =3D XFRM_DEV_OFFLOAD_UNSPECIFIED;
> > >  		xdo->dir =3D 0;
> > >  		netdev_put(dev, &xdo->dev_tracker);
> > > -		NL_SET_ERR_MSG(extack, "Device failed to offload this policy");
> >=20
> > In a handful of places we do:
> >=20
> > if (!extack->msg)
> > 	NL_SET_ERR_MSG(extack, "Device failed to offload this policy");
> >=20
> > in case the device did not provide the extack.
> > Dunno if it's worth doing here.
>=20
> Honestly, I followed devlink.c which didn't do that, but looked again
> and found that devlink can potentially overwrite messages :)
>=20
> For example in this case:
>     997         err =3D ops->port_fn_state_get(port, &state, &opstate, ex=
tack);
>     998         if (err) {
>     999                 if (err =3D=3D -EOPNOTSUPP)
>    1000                         return 0;
>    1001                 return err;
>    1002         }
>    1003         if (!devlink_port_fn_state_valid(state)) {
>    1004                 WARN_ON_ONCE(1);
>    1005                 NL_SET_ERR_MSG_MOD(extack, "Invalid state read fr=
om driver");
>    1006                 return -EINVAL;
>    1007         }
>=20
>=20
> So what do you think about the following change, so we can leave
> NL_SET_ERR_MSG_MOD() in devlink and xfrm intact?=20
>=20
> diff --git a/include/linux/netlink.h b/include/linux/netlink.h
> index 38f6334f408c..d6f3a958e30b 100644
> --- a/include/linux/netlink.h
> +++ b/include/linux/netlink.h
> @@ -101,7 +101,7 @@ struct netlink_ext_ack {
>                                                         \
>         do_trace_netlink_extack(__msg);                 \
>                                                         \
> -       if (__extack)                                   \
> +       if (__extack && !__extack->msg)                 \
>                 __extack->_msg =3D __msg;                 \
>  } while (0)
>=20
> @@ -111,7 +111,7 @@ struct netlink_ext_ack {
>  #define NL_SET_ERR_MSG_FMT(extack, fmt, args...) do {                   =
      \
>         struct netlink_ext_ack *__extack =3D (extack);                   =
        \
>                                                                          =
      \
> -       if (!__extack)                                                   =
      \
> +       if (!__extack || __extack->msg)                                  =
      \
>                 break;                                                   =
      \
>         if (snprintf(__extack->_msg_buf, NETLINK_MAX_FMTMSG_LEN,         =
      \
>                      "%s" fmt "%s", "", ##args, "") >=3D                 =
        \
>=20

I think it makes sense. With the above patch 3/10 should be updated to
preserve the 'catch-all' error message, I guess.

Let's see what Jakub thinks ;)

Cheers,

Paolo

