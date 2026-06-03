Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6223A6412
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 20:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780516810; cv=pass; b=JMaRsbEkyyF8N3wAdnHpQhoYjt4ygDKPWvcB9gvvAxSj2E7j52oObGLsjkB/yH3En768zfpiNgkD7NGqk1lYlX3qULYk4EH1jPTjexQCThzQFaLk7e/RIpA0K9aZkhitYVoUVeW857P91utspT7F1fCx2r631pIKgLC9s0DBMGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780516810; c=relaxed/simple;
	bh=QUYeyOOxwJKCMRtLcncO56F6f9tBRf1pUy+HkA9GzyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LEstRbIOyjkYIHC05Yu9zr+n23M0UTcFLDvB0+JvbwF7qVbHjs0KgnLaPABXapKQ3LnU0po9L8gPgd+Q8Co/xsW96W6+upYsi9VI+k8u8cu668lDCtxVrbvIyVHTN+ptS7c2fsWfzKsLrDqBFG1r5ot7+g7A6t1W0XEgQLnRpTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nOxHF67J; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nOxHF67J"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5177d1ff061so8371cf.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 13:00:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780516806; cv=none;
        d=google.com; s=arc-20240605;
        b=PpRJcczA0uEQy/LveISAhJi10SqUNdUmiobgxEw2e4/m3RAxfywxWNSkATgzxYBh79
         xTSQx9QsYhmUnPD3QWsFp4IHJB0eqpqV4y1k4/Io8aCCiVpgg1OM3h73wKYgJw9rNL47
         Tsfj9Z0e3OSXilYw/lzIIyEgoiHIECzpFVWWcKAV9yXcDveQ7kK7Eti9erEKh2tnG/bm
         4jav8eMfAzYLJItGScrQs4F24sWRbRfF0B3qdvnHlq2rx5CRlqPKMFG/3W914s1vxpW3
         oHN6/pb2B+GCI191diRCSPt1pbpzFAavD8YMbB3Hky2IMPkzo+VwfOlvgz671u0R4LcG
         wjaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BGEGhqbJr0UQdpre59XDkwkfoQYT/lQN8Ps8dBqJ1/w=;
        fh=KcWu5BjwGsuzpOmYeMmm9i9DKnACnVsHgsKlZH41v/U=;
        b=Qd0wBvqvFqQ0iiEciJsk37v845Ea0XtKq/CDvOlEwQr1VanxKkdcS0ls2KSZVxB24H
         X6UoJ0hjzC4K+jfDfO0/+/USsEBnqJbIz2jasRFYmPoF90R3yE2NRtADIY6yh4CLM9iY
         q5k+1qQWCqIRaUNLl3vUQhO6ndE09TyS6Uy1Aj9EVMjkQzcFFxHc7aUOORW4xffl3GqK
         lT2yXLvH7ZAgoH7OuxkaExXDwPz7SMiVJi40zYNi4+efEvLZRrEvwzEUovNenKukzxvM
         ltG5QAVNVZOmgZl4CM7GlgA02Ac3BC0D28oDPPd+ENRfaeRepENrBKrvbHs0mden3HsP
         t5yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780516806; x=1781121606; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGEGhqbJr0UQdpre59XDkwkfoQYT/lQN8Ps8dBqJ1/w=;
        b=nOxHF67J5oI1cIJMs4VEQbTGnQzf1dU3yIWGMdB5/pHZpnAax4rZUpIKs4cWQyGNFu
         0HPDnn8ltjEfy3lDMmnyNMdBB3V8VNUZvoXCk8e1yFkQ0g/Z14nK/m4kHKuHVkPV9kA7
         j604ufqIsmyl8FW4h12NsZdz6gZ+AvtubkLG4GO8S5bBWB9NvFCpAXbi63CIaGnbvx0c
         P6ZbofKw27AIq+cssJL8+juIaaLoeAjEB0iws2N4sks4n/7giyTaJCtFDpUPulv69xi4
         BfIUv0jnhvZkrOdzXyQjDqTASlVFpOKBAJbuI83lNaBU9gewZLPxcAeVyFgow6of0Ib9
         wvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780516806; x=1781121606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BGEGhqbJr0UQdpre59XDkwkfoQYT/lQN8Ps8dBqJ1/w=;
        b=nH6kbTjm7x7lxFi4VsaBMfC1h7wwTVM2TIc3NEh5eMBT/gwjc8gFk8uqjsz4RGbWwy
         vOf+WC2rmSw90ivc8+dch9DlMFtqR+AHvuQq/LU4GROp+rb3EwncOKa6DJtURKIkcfZa
         g31do0BVuwCODuBKtx2Z5mdyBe82STnELsEqvHw3CgQ4QW6jPQ8TJneuN2YspK0ZBydg
         BTw0apdLW1/fGU2tCXzmNIFenSJS8MKA7TZ9aKJwZQbDsA8KxYXmVkgeuFh9A7Lw5QaA
         5NiLzWtShs7J+UF8WBL12EP1njFKjWFeIcAcK3FoZlAnMrvDsG4eCKje4ppBzmNZNaRM
         cI8w==
X-Forwarded-Encrypted: i=1; AFNElJ8hHV+KDWy2PXfCaSVyXlr+u4bw5CS0ZVbl0ybpFX1oAf9/hJmnnpsqbAR8bRGDY+nGikpls00xzac=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXqBQXGYEb97xTqt6xU6uq/OehuZHBBitASK/xigqQUET15gFr
	Tt/Wsr0Z76WpNwP31kZkFCeTehy9+yC4u/CVoHEZUYGIzGlv996APlYyf9uqE4wAjIrmZuHK1ul
	FKZDhshC6T61KkeVgYJ4WEV9YAigIFL3eWiUiLV4bypN9IIn0vwlN1WzLrhk=
X-Gm-Gg: Acq92OEuzftfR9COd213/66CgWskJB3+t8PqbRG3fBTGRWQzlIa/h66kCMawDiNB4ec
	ofMHJKmmNCQ8s0/Y9b05J293KhyS0+ORuTyKMaTQsz+bUlbxqLjdZigfbQHEa/UxHv7wZq9sFXJ
	b/PaHlnzd2a8nOik+cteEU1qvbGInE99zgrdWhD13jEHflSSzLVDqJc6cQKL5254F8ly7GSTgyP
	tG7TkLxmCeoEviqG3fOWjpHTqoIi40h2VUhExu/G6boi06Vuv3Nlgrkgk5I+J5IHy5rO+IH0nzp
	nMU8ZSsVrsIClXBmNnOGTWmBD/1omnDJFhD7GJRyA8FCweLG
X-Received: by 2002:a05:622a:30e:b0:517:6488:904a with SMTP id
 d75a77b69052e-5178789c190mr641731cf.20.1780516804688; Wed, 03 Jun 2026
 13:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779471082.git.abhishekbapat@google.com>
 <8ffa0cef49b10026f2171d41b963c39201c9bd5b.1779471082.git.abhishekbapat@google.com>
 <e878da5b-6426-4bc0-924c-ecda72e08813@linux.dev>
In-Reply-To: <e878da5b-6426-4bc0-924c-ecda72e08813@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 3 Jun 2026 12:59:52 -0700
X-Gm-Features: AVHnY4IaViECioomxUtioUIAG6IE5up_of-F-UE9IldQSZ5wP0R8Jn7vIhrbOwY
Message-ID: <CAJuCfpGUEUVprws-VQ0xWWeFSSMTeRv5MKtQ5BVH3HN9=mOcjg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] alloc_tag: add ioctl to /proc/allocinfo
To: Hao Ge <hao.ge@linux.dev>
Cc: Abhishek Bapat <abhishekbapat@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 24, 2026 at 7:21=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Abhishek
>
>
> Thanks for this patch. I had a few questions/comments after going
>
> through it.
>
>
> On 2026/5/23 01:45, Abhishek Bapat wrote:
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
>
> codetag_get_content_id() does not reflect module unload
>
> codetag_get_content_id() returns cttype->next_mod_seq:
>
> unsigned long codetag_get_content_id(struct codetag_type *cttype)
>
> {
>
>      return cttype->next_mod_seq;
>
> }
>
> However, next_mod_seq is only bumped in codetag_module_init(),
>
> i.e.the module load path:
>
> https://elixir.bootlin.com/linux/v7.1-rc4/source/lib/codetag.c#L204
>
> codetag_unload_module() does not increment next_mod_seq. This means
>
> that if only a module unload happens (without a subsequent load),
>
> content_id stays the same, so users comparing the id before and after
>
> won't detect that the content has changed. The commit message says
>
> "Every time a module is loaded / unloaded" -- I was wondering if this
>
> is intentional? If not, would it make sense to also bump next_mod_seq
>
> in the unload path?

Good point. I overlooked that when I wrote the prototype for this patch.
We should not bump next_mod_seq in the unload path but instead use a
separate seq_count that gets bumped every time
codetag_load_module/codetag_unload_module is called.

>
>
> >
> > ALLOCINFO_IOC_GET_AT - gets the record at the specified position. This
> > is the position of a record in /proc/allocinfo.
> >
> > ALLOCINFO_IOC_GET_NEXT - gets the record next to the last retrieved
> > one. If no records were previously retrieved, returns the first
> > record.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> > ---
> >   .../userspace-api/ioctl/ioctl-number.rst      |   2 +
> >   MAINTAINERS                                   |   1 +
> >   include/linux/codetag.h                       |   1 +
> >   include/uapi/linux/alloc_tag.h                |  54 +++++
> >   lib/alloc_tag.c                               | 193 +++++++++++++++++=
-
> >   lib/codetag.c                                 |  11 +
> >   6 files changed, 260 insertions(+), 2 deletions(-)
> >   create mode 100644 include/uapi/linux/alloc_tag.h
> >
> > diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Docum=
entation/userspace-api/ioctl/ioctl-number.rst
> > index 331223761fff..84f6808a8578 100644
> > --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> > +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> > @@ -349,6 +349,8 @@ Code  Seq#    Include File                         =
                    Comments
> >                                                                        =
  <mailto:luzmaximilian@gmail.com>
> >   0xA5  20-2F  linux/surface_aggregator/dtx.h                          =
  Microsoft Surface DTX driver
> >                                                                        =
  <mailto:luzmaximilian@gmail.com>
> > +0xA6  00-0F  uapi/linux/alloc_tag.h                                   =
 Memory allocation profiling
> > +                                                                      =
 <mailto:surenb@google.com>
> >   0xAA  00-3F  linux/uapi/linux/userfaultfd.h
> >   0xAB  00-1F  linux/nbd.h
> >   0xAC  00-1F  linux/raw.h
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 46ed0f0e76d8..d176bde8fbfc 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16709,6 +16709,7 @@ S:    Maintained
> >   F:  Documentation/mm/allocation-profiling.rst
> >   F:  include/linux/alloc_tag.h
> >   F:  include/linux/pgalloc_tag.h
> > +F:   include/uapi/linux/alloc_tag.h
> >   F:  lib/alloc_tag.c
> >
> >   MEMORY CONTROLLER DRIVERS
> > diff --git a/include/linux/codetag.h b/include/linux/codetag.h
> > index 8ea2a5f7c98a..2bcd4e7c809e 100644
> > --- a/include/linux/codetag.h
> > +++ b/include/linux/codetag.h
> > @@ -76,6 +76,7 @@ struct codetag_iterator {
> >
> >   void codetag_lock_module_list(struct codetag_type *cttype, bool lock)=
;
> >   bool codetag_trylock_module_list(struct codetag_type *cttype);
> > +unsigned long codetag_get_content_id(struct codetag_type *cttype);
> >   struct codetag_iterator codetag_get_ct_iter(struct codetag_type *ctty=
pe);
> >   struct codetag *codetag_next_ct(struct codetag_iterator *iter);
> >
> > diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_=
tag.h
> > new file mode 100644
> > index 000000000000..e9a5b55fcc7a
> > --- /dev/null
> > +++ b/include/uapi/linux/alloc_tag.h
> > @@ -0,0 +1,54 @@
> > +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > +/*
> > + *  include/linux/alloc_tag.h
> nit: it should be include/uapi/linux/alloc_tag.h
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
> >   #include <linux/gfp.h>
> >   #include <linux/kallsyms.h>
> >   #include <linux/module.h>
> > +#include <linux/mutex.h>
> >   #include <linux/page_ext.h>
> >   #include <linux/pgalloc_tag.h>
> >   #include <linux/proc_fs.h>
> > @@ -14,6 +15,7 @@
> >   #include <linux/string_choices.h>
> >   #include <linux/vmalloc.h>
> >   #include <linux/kmemleak.h>
> > +#include <uapi/linux/alloc_tag.h>
> >
> >   #define ALLOCINFO_FILE_NAME         "allocinfo"
> >   #define MODULE_ALLOC_TAG_VMAP_SIZE  (100000UL * sizeof(struct alloc_t=
ag))
> > @@ -46,6 +48,10 @@ int alloc_tag_ref_offs;
> >   struct allocinfo_private {
> >       struct codetag_iterator iter;
> >       bool print_header;
> > +     /* ioctl uses a separate iterator not to interfere with reads */
> > +     struct codetag_iterator ioctl_iter;
> > +     bool positioned; /* seq_open_private() sets to 0 */
> > +     struct mutex ioctl_lock;
> >   };
> >
> >   static void *allocinfo_start(struct seq_file *m, loff_t *pos)
> > @@ -125,6 +131,190 @@ static const struct seq_operations allocinfo_seq_=
op =3D {
> >       .show   =3D allocinfo_show,
> >   };
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
> > +
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
> > +
> > +static void allocinfo_to_params(struct codetag *ct,
> > +                             struct allocinfo_tag_data *data)
> > +{
> > +     struct alloc_tag *tag =3D ct_to_alloc_tag(ct);
> > +     struct alloc_tag_counters counter =3D alloc_tag_read(tag);
> > +
> > +     if (ct->modname)
> > +             allocinfo_copy_str(data->tag.modname, ct->modname);
> > +     else
> > +             data->tag.modname[0] =3D '\0';
> > +     allocinfo_copy_str(data->tag.function, ct->function);
> > +     allocinfo_copy_str(data->tag.filename, ct->filename);
> > +     data->tag.lineno =3D ct->lineno;
> > +     data->counter.bytes =3D counter.bytes;
> > +     data->counter.calls =3D counter.calls;
> > +     data->counter.accurate =3D !alloc_tag_is_inaccurate(tag);
> > +}
> > +
> > +static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __u=
ser *arg)
> > +{
> > +     struct allocinfo_content_id params;
> > +
> > +     codetag_lock_module_list(alloc_tag_cttype, true);
> > +     params.id =3D codetag_get_content_id(alloc_tag_cttype);
> > +     codetag_lock_module_list(alloc_tag_cttype, false);
> > +     if (copy_to_user(arg, &params, sizeof(params)))
> > +             return -EFAULT;
> > +
> > +     return 0;
> > +}
> > +
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
>
> No upper bound check on pos in ALLOCINFO_IOC_GET_AT:
>
> pos comes straight from userspace (__u64) with no validation.
>
> If the system has 10000 tags and someone passes pos=3D10001,
>
> the loop will still walk all 10000 tags just to return ENOENT
>
> -- all while holding ioctl_lock and mod_lock. It might be worth
>
> checking pos against the total tag count early. struct codetag_type
>
> is not exposed outside codetag.c though, so this would need a small helpe=
r.

Ack.

>
>
> Thanks
>
> Best Regards
>
> Hao
>
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
> > +
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
> > +
> > +static long allocinfo_ioctl(struct file *file, unsigned int cmd,
> > +                         unsigned long __arg)
> > +{
> > +     void __user *arg =3D (void __user *)__arg;
> > +     int ret;
> > +
> > +     switch (cmd) {
> > +     case ALLOCINFO_IOC_CONTENT_ID:
> > +             ret =3D allocinfo_ioctl_get_content_id(file->private_data=
, arg);
> > +             break;
> > +     case ALLOCINFO_IOC_GET_AT:
> > +             ret =3D allocinfo_ioctl_get_at(file->private_data, arg);
> > +             break;
> > +     case ALLOCINFO_IOC_GET_NEXT:
> > +             ret =3D allocinfo_ioctl_get_next(file->private_data, arg)=
;
> > +             break;
> > +     default:
> > +             ret =3D -ENOIOCTLCMD;
> > +             break;
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +#ifdef CONFIG_COMPAT
> > +static long allocinfo_compat_ioctl(struct file *file, unsigned int cmd=
,
> > +                                unsigned long arg)
> > +{
> > +     return allocinfo_ioctl(file, cmd, (unsigned long)compat_ptr(arg))=
;
> > +}
> > +#endif
> > +
> > +static const struct proc_ops allocinfo_proc_ops =3D {
> > +     .proc_open              =3D allocinfo_open,
> > +     .proc_read_iter         =3D seq_read_iter,
> > +     .proc_lseek             =3D seq_lseek,
> > +     .proc_release           =3D allocinfo_release,
> > +     .proc_ioctl             =3D allocinfo_ioctl,
> > +#ifdef CONFIG_COMPAT
> > +     .proc_compat_ioctl      =3D allocinfo_compat_ioctl,
> > +#endif
> > +
> > +};
> > +
> >   size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count, =
bool can_sleep)
> >   {
> >       struct codetag_iterator iter;
> > @@ -989,8 +1179,7 @@ static int __init alloc_tag_init(void)
> >               return 0;
> >       }
> >
> > -     if (!proc_create_seq_private(ALLOCINFO_FILE_NAME, 0400, NULL, &al=
locinfo_seq_op,
> > -                                  sizeof(struct allocinfo_private), NU=
LL)) {
> > +     if (!proc_create(ALLOCINFO_FILE_NAME, 0400, NULL, &allocinfo_proc=
_ops)) {
> >               pr_err("Failed to create %s file\n", ALLOCINFO_FILE_NAME)=
;
> >               shutdown_mem_profiling(false);
> >               return -ENOMEM;
> > diff --git a/lib/codetag.c b/lib/codetag.c
> > index 304667897ad4..93aa30991563 100644
> > --- a/lib/codetag.c
> > +++ b/lib/codetag.c
> > @@ -48,6 +48,17 @@ bool codetag_trylock_module_list(struct codetag_type=
 *cttype)
> >       return down_read_trylock(&cttype->mod_lock) !=3D 0;
> >   }
> >
> > +unsigned long codetag_get_content_id(struct codetag_type *cttype)
> > +{
> > +     lockdep_assert_held(&cttype->mod_lock);
> > +
> > +     /*
> > +      * next_mod_seq is updated on every load, so can be used to ident=
ify
> > +      * content changes.
> > +      */
> > +     return cttype->next_mod_seq;
> > +}
> > +
> >   struct codetag_iterator codetag_get_ct_iter(struct codetag_type *ctty=
pe)
> >   {
> >       struct codetag_iterator iter =3D {
