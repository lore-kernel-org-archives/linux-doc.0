Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A4653FD54
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 14:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175404; cv=pass; b=mwrq1I2m98mNH2QwgCuIh4kaK207iF/Eknpnz00IzK1dB9tPdQkdmmqL4qelQdIVhWEJdWGgBc3ZUnoW2HrEelOhoO3nSbb8Gt0SO9CYNy61NwG4AzqZL+utKwqb8po/pySbP4koCVMR0I4KV6eHKHtXLuQYI6uxDOnTgQdDxmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175404; c=relaxed/simple;
	bh=KWjxpkS56vBdoY1mfq+LJ82QCdfp9oGXt1PZy19JPY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=otuRpcKDIiiXc+31bjGWfGsCF52KvknmrOX5K6QPydDX28GOB0uTbYAooFePIqBOB4MsZZo+xYKUqRX+C3L4exJLboSJvl3CYn8BokleJdOpltonY7Nz0KxYW5+wleq5rV2OvZGgatiJA9/kUt8SdoLiLI3UfZlIHBw7cQlHYCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iejodJny; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dyaw9YhE; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iejodJny";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dyaw9YhE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790175401;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mgl2fzrtLyoiFrBfNonxZVX3GZjaxX+KyLU7gYeHtiE=;
	b=iejodJnyID9u5TOT5LXICNL8o9nPiJ8LbMUyj41jD4U+qdRGIlqS5nZTZO4WOj0i6Agg6G
	hGoEDUpV2jJ653Nnsh8YkC/CMtk6X+2TCChMbL0aS2Eu6r77snzF2wcaiIN+UGdEuW3NKa
	MCmAF8V/wbSU3Vdkc1yfdu7pV75uu5U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-U7gCLiNVMSeTDy4bOF8ewQ-1; Wed, 23 Sep 2026 10:56:40 -0400
X-MC-Unique: U7gCLiNVMSeTDy4bOF8ewQ-1
X-Mimecast-MFC-AGG-ID: U7gCLiNVMSeTDy4bOF8ewQ_1790175399
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49e745d5dabso9821545e9.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 07:56:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790175398; cv=none;
        d=google.com; s=arc-20260327;
        b=YBcxRgX3azuB6tB7U85wxRzXCoZr6+doWSeYrY/aTa2hzZL4/CPGq5xHf1YuTTd26/
         oF5C3U52nb6bxmbpp1Kq5iatjwPiGWwsRfwJLQL4N8u4AWtCA1FfiwTp/K6OCR9LtidH
         StxAxdPJxSkc95aAcc1Vzdr758hpl+9XmS+3diaXEiNa7cYcx3mRuuE/EHGv9qaIg2Rg
         6ZkXzARNTGh959ahSdaJzt0B1kF9LbGnMTEsodwm4S6zFgdXZBae52xHTU/FDQ8c4xfi
         kIjX26eq7Oy2+RQw0FV0vY0ZxtXLw05OEM9C6OXxI7Fskx6UEZ8QrNF1u2VVcnfA8r6E
         Xp4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mgl2fzrtLyoiFrBfNonxZVX3GZjaxX+KyLU7gYeHtiE=;
        fh=flxub5ejidbkwLBHU07UP/G0jpmUhqV31wT1Oq+i1rY=;
        b=nVML/kr1USLqmBxfkkyNJ4qcIzhMmVZ0H2Ewban0spkptJOOC7J0ncGWUlJYL/J+2D
         k9oxMPAt4rJJqNm7lZikRGUXmB0jN2ZOgIPmyoQcPyQUNJD9+gK7uEg6OuBb1D6CaNQ2
         HJTX/IW3FCkCcfIked2avOpW8SSzWflZQ/VwpDqUp4n+MpKbkT3vhGYSjhP0ylHeceZ/
         BR4uoloaG411rf08kmsy2x6DU+mCLxdqWqBWHE4SPL5GlK01RSWUM52P+dRaDyTpKKrS
         /nDWe25mmW9aTY9FLijaN573J9XJI9LJ+Ed+q0J5q6WFNFGJSTECYVZyTVPfONXQ7wOy
         TewA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790175398; x=1790780198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mgl2fzrtLyoiFrBfNonxZVX3GZjaxX+KyLU7gYeHtiE=;
        b=dyaw9YhENt05h9pW/Q6M+sAqbYxPgldaMTjD8WUSm24b62Iy4kvuBPhDolyOhvBtmq
         o9MWhSL2Hi0eCVZ4aqKHacuZoIbINN/XY2CM30SLPKRc1NZOKYNaz4nKqbG9NyoCowz0
         WJfYoPtqiwVPEWmUhXKyj7p/huHrsH2gzzcvoInveruyaggmLDp702anEuMZsDgx37qo
         2nAA+RPSB4a3yhBCXPBWHUV2X7VaRELPT5ERs3ksJL1nHxALLtC3d60cQio34E+RhnPL
         A+CKjSh3SlbzhGXHEMXzXArzAqXpoobn3p3oO6Q+jvdmXbCXE7cJVsui8NrlCocr8Fka
         NaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175398; x=1790780198;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mgl2fzrtLyoiFrBfNonxZVX3GZjaxX+KyLU7gYeHtiE=;
        b=O0OvhnE4HJWGeiL40hWO5nMb3Wl+OdEihW/5aSkZpBvqcmFFIo/yFBzha7nQL/kles
         tIDrRmjmCm6NorfM8CAgvvCyHF4lpr+a0Y/O3B/pCYmpMJbW2j2c7n/GfKdMTy0YvKsN
         JV/p+V91CvGw8Uz0Hjjn9ftcsaNubmaGGf6QludINvNC7EQNmQlUwTXD6HoHlEqlCR08
         Wgw1BnEzRRS2gVJ163zm/wtmycEZFd+O1VGz7h2oFH4vbhXqsXJMkYn7454X3Z+zOhPA
         aZbwHAD+GgbP4WT7DjgGxdWwwOV5F56CZeYIeHAWvQg7L3mFqbcFD9tA0xcHHTZI/Sel
         wfHw==
X-Forwarded-Encrypted: i=1; AKwUvBxYHLObdXSyPKAhcArW9Ubigniz7HVcF7sPtp+KryL2pfwVnepEXh5LsNMrfzH+jG12+0E+d/pPCQI=@vger.kernel.org
X-Gm-Message-State: AFuF++nYFDxjVQ+nMrBEm3TJRKZqja6wfJ1KajSlcp0F7V1YPvYsOuio
	xAQ7qhykFyA73pHseKPvbWoSkj/eppJaXGZLPHeGBYyOWlatGx3e5JJALjZXVaLx3gHk2XmJtmz
	hykd/gXZ9aWO//dLWZWopY+ighaLLzVB8uWx7QEvYC1yk1qmrPWxsWkmsgcYwMgeBAkrCIKHeI6
	JihTB87N/tnQIsUyTdbIZU8q8IOYI3lKtzB6hY
X-Gm-Gg: AYBFou1rNPuDJCD48lq3tsRjSmMmtz0z0YMrMY8ID2QWBy0m5Eseg55Jrf+GEQQS2fq
	cNwnquHa8jpGav1Yeypfzx/KfER8lpqgPz3gLXyZuOH2OglWShKjdZmFWFhTq+epJUc0I99CUTS
	504Co+vjPOYwF19FO7h2ay+KFrGuyeHALG++tBDnk0pnAiEylQ+sZRFlWUdEzn84t3SHF1vm68+
	o75vEmL8Z8TgpDlDw==
X-Received: by 2002:a05:600c:3b21:b0:49f:bd3c:bc25 with SMTP id 5b1f17b1804b1-49fdf25486bmr41518155e9.32.1790175398659;
        Wed, 23 Sep 2026 07:56:38 -0700 (PDT)
X-Received: by 2002:a05:600c:3b21:b0:49f:bd3c:bc25 with SMTP id
 5b1f17b1804b1-49fdf25486bmr41517685e9.32.1790175398258; Wed, 23 Sep 2026
 07:56:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902200547.184734-1-jtaubepe@redhat.com> <20260902200547.184734-8-jtaubepe@redhat.com>
 <ab97f32b-31dd-4975-a8b2-b445110ae3a9@suse.de>
In-Reply-To: <ab97f32b-31dd-4975-a8b2-b445110ae3a9@suse.de>
From: Jesse Taube <jtaubepe@redhat.com>
Date: Wed, 23 Sep 2026 10:56:27 -0400
X-Gm-Features: AclHuK-DXEgf8h50oy37YCFQPiuZykx03xaAenYlWJQtQSO7dJcvZ7KWpU5nfJA
Message-ID: <CADRr4bePoiDnWX_XrMWtQe=1g4Yrw1_dK86EV2k9XZR0HnL+UQ@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] nvme: fcloop: Add set_marginal_rport to sysfs
To: Hannes Reinecke <hare@suse.de>
Cc: linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Justin Tee <justin.tee@broadcom.com>, 
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>, Paul Ely <paul.ely@broadcom.com>, 
	Chaitanya Kulkarni <kch@nvidia.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Nilesh Javali <njavali@marvell.com>, 
	GR-QLogic-Storage-Upstream@marvell.com, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, John Meneghini <jmeneghi@redhat.com>, 
	Bryan Gurney <bgurney@redhat.com>, Chris Leech <cleech@redhat.com>, 
	"Ewan D . Milne" <emilne@redhat.com>, shinichiro.kawasaki@wdc.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 10:03=E2=80=AFAM Hannes Reinecke <hare@suse.de> wro=
te:
>
> On 9/2/26 10:05 PM, Jesse Taube wrote:
> > To allow testing of multipath failover, add a sysfs attribute to set a
> > remote port as marginal. This will allow the fcloop LLDD to set the
> > marginal flag on a remote port, simulating a marginal link.
> >
> > Example:
> > Turn on marginal for a remote port matching wwnn and wwpn:
> > `echo 'wwnn=3D0x200000109b5f2956,wwpn=3D0x100000109b5f2956,marginal=3D1=
' >
> > /sys/class/fcloop/ctl/set_marginal_rport`
> >
> > Turn off marginal for a remote port matching wwnn and wwpn:
> > `echo 'wwnn=3D0x200000109b5f2956,wwpn=3D0x100000109b5f2956,marginal=3D0=
' >
> > /sys/class/fcloop/ctl/set_marginal_rport`
> >
> > Suggested-by: John Meneghini <jmeneghi@redhat.com>
> > Signed-off-by: Jesse Taube <jtaubepe@redhat.com>
> > V10 -> V1:
> >   - New patch
> > V1 -> V2:
> >   - Fix reference count leak in error path
> > ---
> >   drivers/nvme/target/fcloop.c | 50 +++++++++++++++++++++++++++++++++++=
+
> >   1 file changed, 50 insertions(+)
> >
> > diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.=
c
> > index b63af3b643a6..9977c2a71bd5 100644
> > --- a/drivers/nvme/target/fcloop.c
> > +++ b/drivers/nvme/target/fcloop.c
> > @@ -6,6 +6,7 @@
> >   #include <linux/module.h>
> >   #include <linux/parser.h>
> >   #include <uapi/scsi/fc/fc_fs.h>
> > +#include <uapi/scsi/fc/fc_els.h>
> >
> >   #include "../host/nvme.h"
> >   #include "../target/nvmet.h"
> > @@ -21,6 +22,7 @@ enum {
> >       NVMF_OPT_FCADDR         =3D 1 << 3,
> >       NVMF_OPT_LPWWNN         =3D 1 << 4,
> >       NVMF_OPT_LPWWPN         =3D 1 << 5,
> > +     NVMF_OPT_MARGINAL       =3D 1 << 6,
> >   };
> >
> >   struct fcloop_ctrl_options {
> > @@ -31,6 +33,7 @@ struct fcloop_ctrl_options {
> >       u32                     fcaddr;
> >       u64                     lpwwnn;
> >       u64                     lpwwpn;
> > +     u32                     marginal;
> >   };
> >
> >   static const match_table_t opt_tokens =3D {
> > @@ -40,6 +43,7 @@ static const match_table_t opt_tokens =3D {
> >       { NVMF_OPT_FCADDR,      "fcaddr=3D%x"     },
> >       { NVMF_OPT_LPWWNN,      "lpwwnn=3D%s"     },
> >       { NVMF_OPT_LPWWPN,      "lpwwpn=3D%s"     },
> > +     { NVMF_OPT_MARGINAL,    "marginal=3D%d"   },
> >       { NVMF_OPT_ERR,         NULL            }
> >   };
> >
> > @@ -120,6 +124,13 @@ fcloop_parse_options(struct fcloop_ctrl_options *o=
pts,
> >                       }
> >                       opts->lpwwpn =3D token64;
> >                       break;
> > +             case NVMF_OPT_MARGINAL:
> > +                     if (match_int(args, &token)) {
> > +                             ret =3D -EINVAL;
> > +                             goto out_free_options;
> > +                     }
> > +                     opts->marginal =3D token;
> > +                     break;
> >               default:
> >                       pr_warn("unknown parameter or missing value '%s'\=
n", p);
> >                       ret =3D -EINVAL;
> > @@ -199,6 +210,9 @@ fcloop_parse_nm_options(struct device *dev, u64 *nn=
ame, u64 *pname,
> >
> >   #define TGTPORT_OPTS        (NVMF_OPT_WWNN | NVMF_OPT_WWPN)
> >
> > +#define MARGINAL_OPTS        (NVMF_OPT_WWNN | NVMF_OPT_WWPN | \
> > +                      NVMF_OPT_MARGINAL)
> > +
> >
> >   static DEFINE_SPINLOCK(fcloop_lock);
> >   static LIST_HEAD(fcloop_lports);
> > @@ -1663,6 +1677,40 @@ fcloop_set_cmd_drop(struct device *dev, struct d=
evice_attribute *attr,
> >       return count;
> >   }
> >
> > +static ssize_t
> > +fcloop_set_marginal_rport(struct device *dev, struct device_attribute =
*attr,
> > +             const char *buf, size_t count)
> > +{
> > +     struct fcloop_nport *nport;
> > +     struct fcloop_ctrl_options opts =3D {};
> > +     unsigned long flags;
> > +     int ret;
> > +
> > +     ret =3D fcloop_parse_options(&opts, buf);
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* everything there ? */
> > +     if ((opts.mask & MARGINAL_OPTS) !=3D MARGINAL_OPTS)
> > +             return -EINVAL;
> > +
> > +     nport =3D fcloop_nport_lookup(opts.wwnn, opts.wwpn);
> > +     if (!nport)
> > +             return -ENOENT;
> > +
> > +     spin_lock_irqsave(&fcloop_lock, flags);
> > +     if (!nport->rport || !nport->rport->remoteport) {
> > +             spin_unlock_irqrestore(&fcloop_lock, flags);
> > +             fcloop_nport_put(nport);
> > +             return -ENOENT;
> > +     }
> > +
> > +     nvme_fc_set_remoteport_fpin(nport->rport->remoteport, opts.margin=
al);
> > +     spin_unlock_irqrestore(&fcloop_lock, flags);
> > +     fcloop_nport_put(nport);
> > +
> > +     return count;
> > +}
> >
> >   static DEVICE_ATTR(add_local_port, 0200, NULL, fcloop_create_local_po=
rt);
> >   static DEVICE_ATTR(del_local_port, 0200, NULL, fcloop_delete_local_po=
rt);
> > @@ -1671,6 +1719,7 @@ static DEVICE_ATTR(del_remote_port, 0200, NULL, f=
cloop_delete_remote_port);
> >   static DEVICE_ATTR(add_target_port, 0200, NULL, fcloop_create_target_=
port);
> >   static DEVICE_ATTR(del_target_port, 0200, NULL, fcloop_delete_target_=
port);
> >   static DEVICE_ATTR(set_cmd_drop, 0200, NULL, fcloop_set_cmd_drop);
> > +static DEVICE_ATTR(set_marginal_rport, 0200, NULL, fcloop_set_marginal=
_rport);
> >
> >   static struct attribute *fcloop_dev_attrs[] =3D {
> >       &dev_attr_add_local_port.attr,
> > @@ -1680,6 +1729,7 @@ static struct attribute *fcloop_dev_attrs[] =3D {
> >       &dev_attr_add_target_port.attr,
> >       &dev_attr_del_target_port.attr,
> >       &dev_attr_set_cmd_drop.attr,
> > +     &dev_attr_set_marginal_rport.attr,
> >       NULL
> >   };
> >
> Please don't make it a fabrics option.

What do you mean by fabrics option? How should I fix this?

Thanks,
Jesse Taube

> Setting is via sysfs is
> sufficient seeing it's for testing only.
>
> Cheers,
>
> Hannes
> --
> Dr. Hannes Reinecke                  Kernel Storage Architect
> hare@suse.de                                +49 911 74053 688
> SUSE Software Solutions GmbH, Frankenstr. 146, 90461 N=C3=BCrnberg
> HRB 36809 (AG N=C3=BCrnberg), GF: I. Totev, A. McDonald, W. Knoblich
>

