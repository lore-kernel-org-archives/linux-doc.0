Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830F3CD68E0
	for <linux-doc@archiver.kernel.org>; Tue, 10 Oct 2023 00:37:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379165AbjJJAhZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 Oct 2023 20:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379139AbjJJAhZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Oct 2023 20:37:25 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E8D0A3
        for <linux-doc@vger.kernel.org>; Mon,  9 Oct 2023 17:37:23 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-536ef8a7dcdso25096a12.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Oct 2023 17:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696898242; x=1697503042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Drda+y33XdGAEUOBvxGHem+aMQjGpAHViuUNurHBjyw=;
        b=ZZuUvMwXRR7r0CtDY8tlTiBb+R4ATG5C4ak0Ha5akrPo1CyNgHpiXYsrM7Bl5Bn+dZ
         +o3d/kyPLfOXa+Pah5J06CnKGep5UOT+osEpyM8HvPaAW2kR1K5qp9hBpAn2rpGP/PyT
         yqVh9+Og4bxmmx00+QCqrUkuyUvqtzhuIrtusRyIRX8sPhijKIDVHUCl/MRoQEqh2YSI
         gOi8mUKZyZCZvJtGbeN7W9w3AjkU5VS8SoVmc1kdIZ7EtNdNsKP0YCfztjkRxItSVrnv
         KYOxqsVnzjdvUMyob6HyeMRS+kGmiriGZhAmTaWw0G6WpVv+XqFMuNCbuCT4qsSbfuox
         hSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696898242; x=1697503042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Drda+y33XdGAEUOBvxGHem+aMQjGpAHViuUNurHBjyw=;
        b=IyhDCeJHCWcfTgjDRdc/eskENhTmMcbz43Ux31y5Jqev3k4VfwjQcFubOddSpuROWJ
         2S0wqCe16Ppv2n3fEY0JCRu9x2+9CpqN7JhCV5+T7smsd3m6OWcFS42fOrSlkWubGBnw
         6sTkTTiRiq26kkLuwijjcichhMiRhReTqtdTmG9LyZvTg5AJqZKMZ9JjS9vr48RwD56l
         yCVT83dAQL/ImT19Pw4KBlPsevsWzd1hlcnhyd9tV79edUuLxQSR458xoFnWHhIea5Mp
         fnTX4HWC6Hm4Qi8sZBpUC9J+yt7Kue6iRpQ4OOUzKnplsfR6hO7jcdrwDYI2PgRU+OtE
         WFiA==
X-Gm-Message-State: AOJu0YyDWFUDrvOAJPt0MZk+Sw8r3bKVN7MxjAwF66qcGpma7w1cV3UV
        c30+0Q5WcO4S7suJFy2wF/2QKpzeS+9WqcQh2sdAMQ==
X-Google-Smtp-Source: AGHT+IHXTrcmyPFitEmbdf7UwBczlXzLmfG+sZKBuqZbC8yA460539RaEyc30nV5L1JJ9FFjsFTppRZS9xao6/JTlE4=
X-Received: by 2002:a50:d0d7:0:b0:538:1d3b:172f with SMTP id
 g23-20020a50d0d7000000b005381d3b172fmr471689edf.3.1696898241782; Mon, 09 Oct
 2023 17:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <20231009142005.21338-1-quic_kriskura@quicinc.com>
 <20231009142005.21338-2-quic_kriskura@quicinc.com> <CANP3RGfEk2DqZ3biyN78ycQYbDxCEG+H1me2vnEYuwXkNdXnTA@mail.gmail.com>
 <CANP3RGcCpNOuVpdV9n0AFxZo-wsfwi8OfYgBk1WHNHaEd-4V-Q@mail.gmail.com>
In-Reply-To: <CANP3RGcCpNOuVpdV9n0AFxZo-wsfwi8OfYgBk1WHNHaEd-4V-Q@mail.gmail.com>
From:   =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date:   Mon, 9 Oct 2023 17:37:04 -0700
Message-ID: <CANP3RGdY4LsOA6U5kuccApHCzL0_jBnY=pLOYrUuYtMZFTvnbw@mail.gmail.com>
Subject: Re: [PATCH 2/2] usb: gadget: ncm: Add support to update
 wMaxSegmentSize via configfs
To:     Krishna Kurapati <quic_kriskura@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        onathan Corbet <corbet@lwn.net>,
        Linyu Yuan <quic_linyyuan@quicinc.com>,
        linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_ppratap@quicinc.com,
        quic_wcheng@quicinc.com, quic_jackp@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 9, 2023 at 5:20=E2=80=AFPM Maciej =C5=BBenczykowski <maze@googl=
e.com> wrote:
>
> On Mon, Oct 9, 2023 at 5:17=E2=80=AFPM Maciej =C5=BBenczykowski <maze@goo=
gle.com> wrote:
> >
> > On Mon, Oct 9, 2023 at 7:20=E2=80=AFAM Krishna Kurapati
> > <quic_kriskura@quicinc.com> wrote:
> > >
> > > Currently the NCM driver restricts wMaxSegmentSize that indicates
> > > the datagram size coming from network layer to 1514. However the
> > > spec doesn't have any limitation. For P2P connections over NCM,
> > > increasing MTU helps increasing throughput.
> > >
> > > Add support to configure this value before configfs symlink is
> > > created. Also since the NTB Out/In buffer sizes are fixed at 16384
> > > bytes, limit the segment size to an upper cap of 15014. Set the
> > > default MTU size for the ncm interface during function bind before
> > > network interface is registered allowing MTU to be set in parity
> > > with wMaxSegmentSize.
> > >
> > > Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> > > ---
> > >  drivers/usb/gadget/function/f_ncm.c | 51 +++++++++++++++++++++++++++=
++
> > >  drivers/usb/gadget/function/u_ncm.h |  2 ++
> > >  2 files changed, 53 insertions(+)
> > >
> > > diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget=
/function/f_ncm.c
> > > index feccf4c8cc4f..eab297b22200 100644
> > > --- a/drivers/usb/gadget/function/f_ncm.c
> > > +++ b/drivers/usb/gadget/function/f_ncm.c
> > > @@ -103,6 +103,8 @@ static inline struct f_ncm *func_to_ncm(struct us=
b_function *f)
> > >  /* Delay for the transmit to wait before sending an unfilled NTB fra=
me. */
> > >  #define TX_TIMEOUT_NSECS       300000
> > >
> > > +#define MAX_DATAGRAM_SIZE      15014
> > > +
> > >  #define FORMATS_SUPPORTED      (USB_CDC_NCM_NTB16_SUPPORTED |  \
> > >                                  USB_CDC_NCM_NTB32_SUPPORTED)
> > >
> > > @@ -1408,6 +1410,7 @@ static int ncm_bind(struct usb_configuration *c=
, struct usb_function *f)
> > >         ncm_opts =3D container_of(f->fi, struct f_ncm_opts, func_inst=
);
> > >
> > >         if (cdev->use_os_string) {
> > > +               ncm_opts->net->mtu =3D (ncm_opts->max_segment_size - =
ETH_HLEN);
> > >                 f->os_desc_table =3D kzalloc(sizeof(*f->os_desc_table=
),
> > >                                            GFP_KERNEL);
> > >                 if (!f->os_desc_table)
> > > @@ -1469,6 +1472,8 @@ static int ncm_bind(struct usb_configuration *c=
, struct usb_function *f)
> > >
> > >         status =3D -ENODEV;
> > >
> > > +       ecm_desc.wMaxSegmentSize =3D ncm_opts->max_segment_size;
> >
> > I think you need byte swap here.
> >
> > > +
> > >         /* allocate instance-specific endpoints */
> > >         ep =3D usb_ep_autoconfig(cdev->gadget, &fs_ncm_in_desc);
> > >         if (!ep)
> > > @@ -1569,11 +1574,56 @@ USB_ETHERNET_CONFIGFS_ITEM_ATTR_QMULT(ncm);
> > >  /* f_ncm_opts_ifname */
> > >  USB_ETHERNET_CONFIGFS_ITEM_ATTR_IFNAME(ncm);
> > >
> > > +static ssize_t ncm_opts_max_segment_size_show(struct config_item *it=
em,
> > > +                                             char *page)
> > > +{
> > > +       struct f_ncm_opts *opts =3D to_f_ncm_opts(item);
> > > +       u32 segment_size;
> > > +
> > > +       mutex_lock(&opts->lock);
> > > +       segment_size =3D opts->max_segment_size;
> > > +       mutex_unlock(&opts->lock);
> > > +
> > > +       return sprintf(page, "%u\n", segment_size);
> > > +}
> > > +
> > > +static ssize_t ncm_opts_max_segment_size_store(struct config_item *i=
tem,
> > > +                                              const char *page, size=
_t len)
> > > +{
> > > +       struct f_ncm_opts *opts =3D to_f_ncm_opts(item);
> > > +       int ret;
> > > +       u32 segment_size;
> > > +
> > > +       mutex_lock(&opts->lock);
> > > +       if (opts->refcnt) {
> > > +               ret =3D -EBUSY;
> > > +               goto out;
> > > +       }
> > > +
> > > +       ret =3D kstrtou32(page, 0, &segment_size);
> > > +       if (ret)
> > > +               goto out;
> > > +
> > > +       if (segment_size > MAX_DATAGRAM_SIZE) {
> > > +               ret =3D -EINVAL;
> > > +               goto out;
> > > +       }
> > > +
> > > +       opts->max_segment_size =3D segment_size;
> > > +       ret =3D len;
> > > +out:
> > > +       mutex_unlock(&opts->lock);
> > > +       return ret;
> > > +}
> > > +
> > > +CONFIGFS_ATTR(ncm_opts_, max_segment_size);
> > > +
> > >  static struct configfs_attribute *ncm_attrs[] =3D {
> > >         &ncm_opts_attr_dev_addr,
> > >         &ncm_opts_attr_host_addr,
> > >         &ncm_opts_attr_qmult,
> > >         &ncm_opts_attr_ifname,
> > > +       &ncm_opts_attr_max_segment_size,
> > >         NULL,
> > >  };
> > >
> > > @@ -1616,6 +1666,7 @@ static struct usb_function_instance *ncm_alloc_=
inst(void)
> > >                 kfree(opts);
> > >                 return ERR_CAST(net);
> > >         }
> > > +       opts->max_segment_size =3D cpu_to_le16(ETH_FRAME_LEN);
> >
> > and not here.  ie. max_segment_size should be native endian
> >
> > >         INIT_LIST_HEAD(&opts->ncm_os_desc.ext_prop);
> > >
> > >         descs[0] =3D &opts->ncm_os_desc;
> > > diff --git a/drivers/usb/gadget/function/u_ncm.h b/drivers/usb/gadget=
/function/u_ncm.h
> > > index 5408854d8407..d3403cf13f17 100644
> > > --- a/drivers/usb/gadget/function/u_ncm.h
> > > +++ b/drivers/usb/gadget/function/u_ncm.h
> > > @@ -31,6 +31,8 @@ struct f_ncm_opts {
> > >          */
> > >         struct mutex                    lock;
> > >         int                             refcnt;
> > > +
> > > +       u32                             max_segment_size;
> > >  };
> > >
> > >  #endif /* U_NCM_H */
> > > --
> > > 2.42.0
> > >
> >
> > That said, I don't really follow what this is doing...
>
> Also
>
> static struct usb_cdc_ether_desc ecm_desc =3D {
> ...
> .wMaxSegmentSize =3D cpu_to_le16(ETH_FRAME_LEN),
>
> ^ I think this should be deleted now, right?  since it's always overwritt=
en?
> And if it isn't always overwritten, that would be a bug I think, cause
> what happens if you bring up 2 ncm devices and only change the setting
> on the 1st?

One last thing...

static int ncm_unwrap_ntb(struct gether *port,
...
unsigned frame_max =3D le16_to_cpu(ecm_desc.wMaxSegmentSize);

^ is this a problem now if we have >1 gadget?
how does it work then?
