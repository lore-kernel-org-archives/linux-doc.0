Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2726C22FDE6
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 19:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780516418; cv=pass; b=jne0miM8fNX/h0p2gjSdjKNfH09xJk4Co1Dpj2jY9IQ0u0ufm60xtDGOUPYU1KYTsJQVtohtZE3CQUa7VAWqc7/ovNVU3+M1Sk+gaBNMeVktTNznNn2U2OzpEFiNqOUqTmNjkEjeAQvhCgUGyjOYJ1WZRSfgau274G+rR8JHEnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780516418; c=relaxed/simple;
	bh=/9XGnnWa7LS/DwxlipygHDBsth/HdTRWZN1wCsQO0vQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QyTW+/yIToCADrxsJ4TyKdaRX40X1xadvrpLN+DqtTmZqfBLjT86kjeDNgIyTPlU7lufUGM70tQp2rGO2qCGt876cKpxmsPPbRB0+iwYiZwIYRcDEh1EnOLL+R2j5ML2kFt89YmdX5Y1wUD+shAGMSvb/7OiygT8tNBsl7WzhIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=evmj0Pzf; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="evmj0Pzf"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51765531803so152441cf.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 12:53:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780516414; cv=none;
        d=google.com; s=arc-20240605;
        b=fsz9+R7Tk5hsfkgjjahXBN4KkmnSVtcld5yiI2WpZxd6S47QvRqnYqriZMV+q95kyW
         lge4mKwYdfofE3oNRzT3AyoE4fPzBNelhQYx93T8cHyssuluuQbZkUSZY6uYzh3H3LSR
         SeKl6UvQVWcjzwq7ByaO6TA33RfzwieF6b4J4xA8dwno8swArVx6nwkKQ21kYaCtDIg/
         CqC2i7vYjelXQLSJlPEZ0sTlAs2fNwim7bNKe90YTPCFK67IVJvM9s9YwvxklFyHUVoF
         vXiDvO3MjrJfnUpAKZ5FxxmIEfdzKQinD5hEU26SfRsQGrzwiZP7D7+U3gIPaOCf0pGW
         3pZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TXQvxZ2LmE81OCzVVkvyEWBN/pTRupWk2i/hhQaPOgg=;
        fh=qZ4GfDRMerjBF+70EvvX5nADErSBV40IZS++wbOc4c4=;
        b=OcDx5u1tG6q28MuOBcH10fg57sFrrx2BcOAyORjG8VyyF1+j2JRhaXYEBdcWOQoZ50
         8RIXsnfu5dcR9laOXBQxS+AKN4iarBEKtVpf5oToQiceNwaHJy02iTksh7esuqSgPOha
         0WMJONthtWgaq0MFI1vz9nEyM0vQW4U9y2n7rQKaii9FFeqQngO9B+mdEZEU38eki59g
         jSFVXRVGEWCcMk3ZNm7CqI1ElTcWf08BXCQ5hKe3dGEzl5WK05E+vt6HCH0z4HK6cx2s
         z6SfoxlGoMeCCnWcI0gRF3+Ho/efYGV/sgEBs5rjr1fLcZp+dpF+prL7KFE5kpBffI7p
         gVvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780516414; x=1781121214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXQvxZ2LmE81OCzVVkvyEWBN/pTRupWk2i/hhQaPOgg=;
        b=evmj0Pzf9yqJWciffnWE/Mai1MfoQym5FnP0FV/3B28FeTHoMtvg7NxpSR/XcbtoFL
         ODtImZ8/tfK0AhqqPY2HVkyPAN6T9H/VV6S1ANiV3RRdNxO9CCNM2osSIxvK9X6pvn0P
         fCiwdJDPvU/8lqYV6y5i8JvWqH5FipOPm7IWQyFMVPS2tCWx75ar15TLV7ISrHkUCYFf
         xk7I6TrdN3laWrUJX4dW+iF0v2+OxvIAfL/JWdRoe5qj41nahJNP9wBDD4V91swJ4g5w
         9p5eOyddLfD/ipgh7YQjGH5e7o0XwY+d/CuvY/+Ti9/OPYS57d58+vXKm7XJzOko7vbC
         vm/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780516414; x=1781121214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TXQvxZ2LmE81OCzVVkvyEWBN/pTRupWk2i/hhQaPOgg=;
        b=lGOdVACr+G2TPHP4ZbG6HjYxtBdjc6EPjHBoOpBnsFEXZcK3nf2IwnQMT/xV7cDxkW
         9+qFEOYzVthYY4IfkNpa3g+fJ8fcPQN++adyR4ZmGAUNzg4IZTUwx0betCXJNkZuHls6
         Ni0ThOdmeB/IdmOlGYQZxZRw/MW7t8L8Pn8utS8rXNpup9QWIlOtKTdxXQEmRrFNlBU0
         AN0S7ceJjchHIMl9eNVWLTyF2we5S117yG6HYJ2ObJ6U8IOpEh17RU0IC+rQxNxgOTOq
         TN2x2wBS9vMiOM7xFdXAtbV1u+QsuGe6oewDIPBZHbh6LFLcA3KA/EHt7GxgRuud3t8Z
         oWwA==
X-Forwarded-Encrypted: i=1; AFNElJ9UB8q/UpvR7b73wI/i0MGssSXOh4JUerGd60WiypVPDYdCC1+aO0yX1tXIJIAQJ8B5z8X/gEQb1VE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/jDnuUdVWjamzMmlgx7aa0TENTV7yfSTSCNqfn+fue4evNoa5
	tCdeTIpDKDvfbV53Pof2bz/mQ9oP98gri6jQgzPTSem51up1iHSKVxwo6nbyKJ0VYCAKJ2e4nqH
	FSDCgXGI8eJeJTRAOEhuqth+bYO5bqGQgGpGHfldr
X-Gm-Gg: Acq92OGIadCypofuBAxzuTSmkQ6iZ4mLZGdAk2eBT7+T8J09q+grRFJDoleBDLehvSo
	lqqUCHvlqCenkiAuJvDDrpTsaypFSXcN1V0b69SNLgSnnhnWHgZAmdsjv+GUcUhNSR633OXm/3r
	2mIuIXmfVWBVwXW0H9NfmH2zB/m+c8qkeYaqzDHJhJxQgGpSTmMAwFS1h+oYSUrKB0iSbGKMuqt
	GZxdvr2S0LllKU51F4n+IzWsaKPn0QbJh4OVsmXFrJi+RKafJs/02vgAjGwE6QPjohhyKmkVYdA
	PNUf1BP/qTeIgt/ENKsxlLvFmHiT5aWCdo+mcAxnn3crE3ei
X-Received: by 2002:ac8:5d8b:0:b0:516:4f62:85e8 with SMTP id
 d75a77b69052e-5178796f263mr587881cf.19.1780516413225; Wed, 03 Jun 2026
 12:53:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779471082.git.abhishekbapat@google.com>
 <8ffa0cef49b10026f2171d41b963c39201c9bd5b.1779471082.git.abhishekbapat@google.com>
 <20260522131148.059d7589666e4a35af1430e5@linux-foundation.org>
In-Reply-To: <20260522131148.059d7589666e4a35af1430e5@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 3 Jun 2026 12:53:22 -0700
X-Gm-Features: AVHnY4J8cx2VK2pXgcXhgnS0vt6Z_FGY7b56TffQZAGDeePrvGdeOKpmxgXbiOw
Message-ID: <CAJuCfpFqEQA4EMgdF=vbbctcz8BQxVMVxojaRz25k-Mfm5mXKw@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] alloc_tag: add ioctl to /proc/allocinfo
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Abhishek Bapat <abhishekbapat@google.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Hao Ge <hao.ge@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 1:11=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Fri, 22 May 2026 17:45:33 +0000 Abhishek Bapat <abhishekbapat@google.c=
om> wrote:
>
> > From: Suren Baghdasaryan <surenb@google.com>
> >
> > Add the following ioctl commands for /proc/allocinfo file:
> >
> > ALLOCINFO_IOC_CONTENT_ID - gets content identifier which can be used
> > to check whether the file content has changed specifically due to modul=
e
> > load/unload. Every time a module is loaded / unloaded, the returned
> > value will be different. By comparing the identifier value at the
> > beginning and at the end of the content retrieval operation, users can
> > validate retrieved information for consistency.
> >
> > ALLOCINFO_IOC_GET_AT - gets the record at the specified position. This
> > is the position of a record in /proc/allocinfo.
> >
> > ALLOCINFO_IOC_GET_NEXT - gets the record next to the last retrieved
> > one. If no records were previously retrieved, returns the first
> > record.
> >
> > index 000000000000..e9a5b55fcc7a
> > --- /dev/null
> > +++ b/include/uapi/linux/alloc_tag.h
> > @@ -0,0 +1,54 @@
> > +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > +/*
> > + *  include/linux/alloc_tag.h
> > + */
> > +
> > +#ifndef _UAPI_ALLOC_TAG_H
> > +#define _UAPI_ALLOC_TAG_H
> > +
> > +#include <linux/types.h>
> > +
> > +#define ALLOCINFO_STR_SIZE   64
> > +
> > +struct allocinfo_content_id {
> > +     __u64 id;
> > +};
> > +
> > +struct allocinfo_tag {
> > +     /* Longer names are trimmed */
> > +     char modname[ALLOCINFO_STR_SIZE];
> > +     char function[ALLOCINFO_STR_SIZE];
> > +     char filename[ALLOCINFO_STR_SIZE];
> > +     __u64 lineno;
> > +};
> > +
> > +struct allocinfo_counter {
> > +     __u64 bytes;
> > +     __u64 calls;
> > +     __u8 accurate;
> > +     __u8 pad[7]; /* Add alignment to not break the 32-bit compatible =
interface */
>
> This seems rather fragile, and makes assumptions about compiler layout?
>
> Can't we use __attribute__((aligned)) in some fashion?

Ack. I think we can.

>
> > +};
> > +
> > +struct allocinfo_tag_data {
> > +     struct allocinfo_tag tag;
> > +     struct allocinfo_counter counter;
> > +};
> > +
> > +struct allocinfo_get_at {
> > +     __u64 pos;      /* input */
> > +     struct allocinfo_tag_data data;
> > +};
> > +
> > +#define _ALLOCINFO_IOC_CONTENT_ID    0
> > +#define _ALLOCINFO_IOC_GET_AT                1
> > +#define _ALLOCINFO_IOC_GET_NEXT              2
> > +
> > +#define ALLOCINFO_IOC_BASE           0xA6
> > +#define ALLOCINFO_IOC_CONTENT_ID     _IOR(ALLOCINFO_IOC_BASE, _ALLOCIN=
FO_IOC_CONTENT_ID,     \
> > +                                          struct allocinfo_content_id)
> > +#define ALLOCINFO_IOC_GET_AT         _IOWR(ALLOCINFO_IOC_BASE, _ALLOCI=
NFO_IOC_GET_AT,        \
> > +                                           struct allocinfo_get_at)
> > +#define ALLOCINFO_IOC_GET_NEXT               _IOR(ALLOCINFO_IOC_BASE, =
_ALLOCINFO_IOC_GET_NEXT,       \
> > +                                          struct allocinfo_tag_data)
> > +
> > +#endif /* _UAPI_ALLOC_TAG_H */
> > diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> > index b9ca95d1f506..3598735b6c93 100644
> > --- a/lib/alloc_tag.c
> > +++ b/lib/alloc_tag.c
> > @@ -5,6 +5,7 @@
> >  #include <linux/gfp.h>
> >  #include <linux/kallsyms.h>
> >  #include <linux/module.h>
> > +#include <linux/mutex.h>
> >  #include <linux/page_ext.h>
> >  #include <linux/pgalloc_tag.h>
> >  #include <linux/proc_fs.h>
> > @@ -14,6 +15,7 @@
> >  #include <linux/string_choices.h>
> >  #include <linux/vmalloc.h>
> >  #include <linux/kmemleak.h>
> > +#include <uapi/linux/alloc_tag.h>
> >
> >  #define ALLOCINFO_FILE_NAME          "allocinfo"
> >  #define MODULE_ALLOC_TAG_VMAP_SIZE   (100000UL * sizeof(struct alloc_t=
ag))
> > @@ -46,6 +48,10 @@ int alloc_tag_ref_offs;
> >  struct allocinfo_private {
> >       struct codetag_iterator iter;
> >       bool print_header;
> > +     /* ioctl uses a separate iterator not to interfere with reads */
> > +     struct codetag_iterator ioctl_iter;
> > +     bool positioned; /* seq_open_private() sets to 0 */
> > +     struct mutex ioctl_lock;
> >  };
> >
> >  static void *allocinfo_start(struct seq_file *m, loff_t *pos)
> > @@ -125,6 +131,190 @@ static const struct seq_operations allocinfo_seq_=
op =3D {
> >       .show   =3D allocinfo_show,
> >  };
> >
> > +static int allocinfo_open(struct inode *inode, struct file *file)
> > +{
> > +     int ret;
> > +
> > +     ret =3D seq_open_private(file, &allocinfo_seq_op,
> > +                            sizeof(struct allocinfo_private));
> > +     if (!ret) {
> > +             struct seq_file *m =3D file->private_data;
> > +             struct allocinfo_private *priv =3D m->private;
> > +
> > +             mutex_init(&priv->ioctl_lock);
> > +     }
> > +     return ret;
> > +}
>
> Generally, the commenting in here is very thin.  Add some explanations
> of what the various functions do and, especially, why they do it?

Ack. Will add.

>
> > +static int allocinfo_release(struct inode *inode, struct file *file)
> > +{
> > +     return seq_release_private(inode, file);
> > +}
> > +
> > +static const char *allocinfo_str(const char *str)
> > +{
> > +     size_t len =3D strlen(str);
> > +
> > +     /* Keep an extra space for the trailing NULL. */
> > +     if (len >=3D ALLOCINFO_STR_SIZE)
> > +             str +=3D (len - ALLOCINFO_STR_SIZE) + 1;
> > +     return str;
> > +}
> > +
> > +/* Copy a string and trim from the beginning if it's too long */
> > +static void allocinfo_copy_str(char *dest, const char *src)
> > +{
> > +     strscpy(dest, allocinfo_str(src), ALLOCINFO_STR_SIZE);
> > +}
>
> See, even these two little functions are unnecessarily difficult to
> review when one doesn"t know what they are setting out to do.  One has
> to first reverse engineer their intent from the implementation, then
> check that the implementation implements that intent.

Ack.

>
> > +static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *arg=
)
> > +{
> > +     struct allocinfo_private *priv;
> > +     struct codetag *ct;
> > +     __u64 pos;
> > +     struct allocinfo_get_at params =3D {0};
> > +
> > +     if (copy_from_user(&params, arg, sizeof(params)))
> > +             return -EFAULT;
> > +
> > +     priv =3D (struct allocinfo_private *)m->private;
>
> Unneeded cast.

Ack.

>
> > +     pos =3D params.pos;
> > +
> > +     mutex_lock(&priv->ioctl_lock);
> > +     codetag_lock_module_list(alloc_tag_cttype, true);
> > +
> > +     /* Find the codetag */
> > +     priv->ioctl_iter =3D codetag_get_ct_iter(alloc_tag_cttype);
> > +     ct =3D codetag_next_ct(&priv->ioctl_iter);
> > +     while (ct && pos--)
> > +             ct =3D codetag_next_ct(&priv->ioctl_iter);
> > +     if (ct) {
> > +             allocinfo_to_params(ct, &params.data);
> > +             priv->positioned =3D true;
> > +     }
> > +
> > +     codetag_lock_module_list(alloc_tag_cttype, false);
> > +     mutex_unlock(&priv->ioctl_lock);
> > +
> > +     if (!ct)
> > +             return -ENOENT;
> > +
> > +     if (copy_to_user(arg, &params, sizeof(params)))
> > +             return -EFAULT;
> > +
> > +     return 0;
> > +}
> > +
> > +static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *a=
rg)
> > +{
> > +     struct allocinfo_private *priv;
> > +     struct codetag *ct;
> > +     struct allocinfo_tag_data params =3D {0};
> > +     int ret =3D 0;
> > +
> > +     priv =3D (struct allocinfo_private *)m->private;
>
> Ditto.

Ack.

>
> > +     mutex_lock(&priv->ioctl_lock);
> > +     codetag_lock_module_list(alloc_tag_cttype, true);
> > +
> > +     if (!priv->positioned) {
> > +             priv->ioctl_iter =3D codetag_get_ct_iter(alloc_tag_cttype=
);
> > +             priv->positioned =3D true;
> > +     }
> > +
> > +     ct =3D codetag_next_ct(&priv->ioctl_iter);
> > +     if (ct)
> > +             allocinfo_to_params(ct, &params);
> > +
> > +     if (!ct) {
> > +             priv->positioned =3D false;
> > +             ret =3D -ENOENT;
> > +     }
> > +     codetag_lock_module_list(alloc_tag_cttype, false);
> > +     mutex_unlock(&priv->ioctl_lock);
> > +
> > +     if (ret =3D=3D 0) {
> > +             if (copy_to_user(arg, &params, sizeof(params)))
> > +                     return -EFAULT;
> > +     }
> > +     return ret;
> > +}
> >
> > ...
> >
