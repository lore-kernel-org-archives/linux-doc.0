Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A253E266C9
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 12:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mCD2FoVp"
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2479BE
	for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 05:32:43 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51e24210395so13247a12.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Oct 2023 05:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697113962; x=1697718762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tkwRjlYkcEjaX7ZtkQRjZiJVYqkPB3IbpRi2aMlfPI=;
        b=mCD2FoVpTdj261rfKgwlzoC761ftFnnoaye89kmQpJ5EQ+u2L5YzeZerqFdoKmudZK
         IWHuCDxhCbUDOT3wkkQ9DyQOqg0NWYI8XGp7Ydm/gqfX78RZ97TdOZmvy0XO0igNKURN
         Dl+/PtvD8/gJIC5l4OltgVlN+obblW2wMxpORTWqgNK5I6gVxD5cPNoy7bwS1sVo9Vzl
         PKSTEQMTRzp52xFgBMHmvwK+eUanLpssWupXQJqhIShDgvVk3jqC0zC8BFEwIZr1fLCB
         NZFlpB1Gei2IaFX/G/Hv7DCMsJYLu2PXe7hi/cDvSWDJ7Wk5HD3zXr7FDfIDQiy5Jkro
         Ep3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697113962; x=1697718762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1tkwRjlYkcEjaX7ZtkQRjZiJVYqkPB3IbpRi2aMlfPI=;
        b=pA2m28/22Bqnz29stEGw4tnohI/kaNYARuALns51a9McravYf5N2X7MddIDq1AgWRe
         0smdnWDZwjnqIl9j3laprYw/JGJ+u70LlMz7GoDospNoyU/9NKkT7ndNymJGdpn3K07D
         kxD7u1ilBbyPbq8eVudP7770uiNtJ4WHQxWbkK5uLSqzz4PIEiLJsTcRcicHuAWTXpuG
         2FRtoI9xB9wjHSfrW8334t0pH31M8/AL55lc5epN1wMp2HgEasPFufkDoedKf7B1Hzt0
         JbdKbTKBS/zRxSQXHEBGF5cjjfTPblGF97iw3kevDTeR4Y+PTCiQVayU1bjUXg6kjN+W
         3/KQ==
X-Gm-Message-State: AOJu0YziavC7NDJQ0EUa4OO/Gf+MQLnRRf0ZntiwJoR4YzGJ/iDxnuV6
	cI1lu2UWfl7w5l2FR92yP2Ldd+/JFfRXKZxl4ehc4w==
X-Google-Smtp-Source: AGHT+IEcUNfDN8SZcbcaIRWbxtyn/WNReXnvZO9j+g6zzk1Nl0XLUUcJYYeOax7WrQZcOy4167LxdOXQ86gqe0hIOPo=
X-Received: by 2002:a50:c355:0:b0:52e:f99a:b5f8 with SMTP id
 q21-20020a50c355000000b0052ef99ab5f8mr244799edb.7.1697113961951; Thu, 12 Oct
 2023 05:32:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231009142005.21338-1-quic_kriskura@quicinc.com>
 <20231009142005.21338-2-quic_kriskura@quicinc.com> <CANP3RGfEk2DqZ3biyN78ycQYbDxCEG+H1me2vnEYuwXkNdXnTA@mail.gmail.com>
 <CANP3RGcCpNOuVpdV9n0AFxZo-wsfwi8OfYgBk1WHNHaEd-4V-Q@mail.gmail.com>
 <CANP3RGdY4LsOA6U5kuccApHCzL0_jBnY=pLOYrUuYtMZFTvnbw@mail.gmail.com>
 <d19d9d08-c119-4991-b460-49925f601d15@quicinc.com> <fad5a7fb-cce1-46bc-a0af-72405c76d107@quicinc.com>
In-Reply-To: <fad5a7fb-cce1-46bc-a0af-72405c76d107@quicinc.com>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Thu, 12 Oct 2023 05:32:22 -0700
Message-ID: <CANP3RGcqWBYd9FqAX47rE9pFgBTB8=0CGdwkScm-OH1epHcVWQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: gadget: ncm: Add support to update
 wMaxSegmentSize via configfs
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, onathan Corbet <corbet@lwn.net>, 
	Linyu Yuan <quic_linyyuan@quicinc.com>, linux-usb@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_ppratap@quicinc.com, quic_wcheng@quicinc.com, quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Oct 12, 2023 at 1:48=E2=80=AFAM Krishna Kurapati PSSNV
<quic_kriskura@quicinc.com> wrote:
>
>
>
> On 10/10/2023 10:08 AM, Krishna Kurapati PSSNV wrote:
> >
>
> >>
> >> ^ is this a problem now if we have >1 gadget?
> >> how does it work then?
> >
> >
> > You are right. This would effect unwrap call and the wMaxSegmentSize is
> > used directly. Thanks for the catch. I didn't test with 2 NCM interface=
s
> > and hence I wasn't able to find this bug. Perhaps changing this to
> > opts->max_segment_size would fix the implementation as unwrap would
> > anyways be called after bind.
>
> Hi Maciej,
>
>   How about the below diff:
>
> ---------
>
> +/*
> + * Allow max segment size to be in parity with max_mtu possible
> + * for the interface.
> + */
> +#define MAX_DATAGRAM_SIZE      GETHER_MAX_ETH_FRAME_LEN
> +
>   #define FORMATS_SUPPORTED      (USB_CDC_NCM_NTB16_SUPPORTED |  \
>                                   USB_CDC_NCM_NTB32_SUPPORTED)
>
> @@ -194,7 +200,6 @@ static struct usb_cdc_ether_desc ecm_desc =3D {
>          /* this descriptor actually adds value, surprise! */
>          /* .iMACAddress =3D DYNAMIC */
>          .bmEthernetStatistics =3D cpu_to_le32(0), /* no statistics */
> -       .wMaxSegmentSize =3D      cpu_to_le16(ETH_FRAME_LEN),
>          .wNumberMCFilters =3D     cpu_to_le16(0),
>          .bNumberPowerFilters =3D  0,
>   };
> @@ -1180,10 +1185,15 @@ static int ncm_unwrap_ntb(struct gether *port,
>          struct sk_buff  *skb2;
>          int             ret =3D -EINVAL;
>          unsigned        ntb_max =3D
> le32_to_cpu(ntb_parameters.dwNtbOutMaxSize);
> -       unsigned        frame_max =3D le16_to_cpu(ecm_desc.wMaxSegmentSiz=
e);
> +       unsigned int    frame_max;
>          const struct ndp_parser_opts *opts =3D ncm->parser_opts;
>          unsigned        crc_len =3D ncm->is_crc ? sizeof(uint32_t) : 0;
>          int             dgram_counter;
> +       struct f_ncm_opts *ncm_opts;
> +       const struct usb_function_instance *fi =3D port->func.fi;
> +
> +       ncm_opts =3D container_of(fi, struct f_ncm_opts, func_inst);
> +       frame_max =3D ncm_opts->max_segment_size;
>
>          /* dwSignature */
>          if (get_unaligned_le32(tmp) !=3D opts->nth_sign) {
> @@ -1440,6 +1450,7 @@ static int ncm_bind(struct usb_configuration *c,
> struct usb_function *f)
>           */
>          if (!ncm_opts->bound) {
>                  mutex_lock(&ncm_opts->lock);
> +               ncm_opts->net->mtu =3D (ncm_opts->max_segment_size -
> ETH_HLEN);
>                  gether_set_gadget(ncm_opts->net, cdev->gadget);
>                  status =3D gether_register_netdev(ncm_opts->net);
>                  mutex_unlock(&ncm_opts->lock);
> @@ -1484,6 +1495,8 @@ static int ncm_bind(struct usb_configuration *c,
> struct usb_function *f)
>
>          status =3D -ENODEV;
>
> +       ecm_desc.wMaxSegmentSize =3D (__le16)ncm_opts->max_segment_size;

this looks wrong. pretty sure this should be some form of cpu_to_le16

> +
>
> ------
>
> I can limit the max segment size to (Max MTU + ETH_HELN) and this would
> be logical to do. Also we can set the frame_max from ncm_opts itself
> while initializing it to 1514 (default value) during alloc_inst callback
> and nothing would break while still being backward compatible.
>
> Let me know your thoughts on this.
>
> Regards,
> Krishna,

Could you paste the full patch?
This is hard to review without looking at much more context then email
is providing
(or, even better, send me a link to a CL in gerrit somewhere - for
example aosp ACK mainline tree)
