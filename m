Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106C119539F
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 00:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780964374; cv=pass; b=UbwwX1a0KVtgwLxfjzRt7hH+6I00Bqnq8VzUpc0Mw4QaULti9BjYoRZ+Un6hY49WCg6C7PAClx3Q5jJ4ELvG9MNBMGALwQTpZ8cquLJ16imBd6G4sL5Mb+hIfzs0lyfiSLGQqIDkBHMRysUHdkZwYFYqwnY/iV18yhif4cfiYuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780964374; c=relaxed/simple;
	bh=CH769E3dKQ1h6xIcD2JHjiXJZtNB6o3PDhN8SGltY44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=prfnlaqGveaZdKbk+jeM+LdWeWDilj6vqBOZxMDMdJ+8zrfP+0QRjI4FpxaE0DR+vMCcTRjckSvgWvFVqMGCd7lDyFN2M8W6cFLuf1lbOg5ij+HM9tTpnlSowlprh2z9ctrc3dHbuzJ31eyvEvCSF1MUwUG+6PcxaR6avsiDqcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FaO+a6gg; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FaO+a6gg"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0b1a48855so452365ad.0
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 17:19:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780964370; cv=none;
        d=google.com; s=arc-20240605;
        b=E6BhuhMN8s+ZGkoSB8nallUKKz/wDn9p1szYG6LzsfwWvureBjwfJ6Z0fR8Wn4TwGE
         TkA6Ha9n9hUUw/luojG5kDDD3j3dAaykWBur8mU0JmkUSPzAJGWXO47tPJOzao2CWhSK
         l0OZBb40CnVoJq4z7xSADUBCQanfk7TdlC+7CGEu7dF7BMXOPHdN8yhdojMXQ2G42NoL
         B05+MzenxldVZHSEFuFDrF0Tc3sw14p6ltkKMPorOX3RY5I1vHooqqJyPC6H+n02wV8t
         6Qkr+MBE9UcN+Shrxaxmk3WnZm3X9xnhCoDr3blZQgz0b+EepdB5jt0qvw3g9eIU9ZeT
         0QwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ya4+fO9XzBWfdc4Ka8Bh+sYylF5sEr5adVMzLIQQnag=;
        fh=j6N+lbVFYiBQk+8tpyZN11nlVt1BgKFFWA1kP+HBjLM=;
        b=hmfLG+E2o6VxdklSQyHr94Y/kQ+vcdj4r4rqskO/IXykXuN6fNR8D8lohyQDFM6IOM
         RXdcqKD6Bkp4ErspDw2KSGPO5VzdbVznOnWvhGTM8AWs+o5/z23NZMxWSppB6zxce/P6
         SrDFbt5ejaci1PSSknbDJ+vrmUMz7pqjnY+GMOqwTXio8BtYH9NXWM7jBbBGf8OGXTLi
         TuOeyOCEXC4sxaBMu3idZZuWz5XLpsmVpAmV11O8zeyhfdVdC4x0PGS8QaZ6cnyUltDT
         IqIuaWgQsJWTHFPTXDBP4TmIBITFp8dS9xpQ5QML3lXMH7eZKsI7Y/diOcmd78JEVOcK
         e8rQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780964370; x=1781569170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ya4+fO9XzBWfdc4Ka8Bh+sYylF5sEr5adVMzLIQQnag=;
        b=FaO+a6ggAMbAneMBML7Kg4WtnGNhaDpcrdwq2aoHZnqsVB7T+NtWf6kMv1qW1wLu95
         idcIzwFgVDRbZiztxstUEbfsd/mX3GjV4dxUk7nAJbmetCvQI9dO1Wl7VLxGqD4AAg+t
         1EovWsKbZTyQfrrFXiJnKzu4AOrLHaxNkGBnxVpw+ZlFSdqvmvsUJ1GE5xi+rwRz2++3
         /E3uEnEArj+cV/Bv8+gX56TI66sC7otlUSFaFkykDQTs65GnjsUUHs2HWvrfY8GZp35E
         LBWDVBPhHq4gPaMKdsM0UZ9BJQe7WMi3eIkLuRuxbGGKwR5xsKn2Z4N07xa9ARLiI3t6
         RxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780964370; x=1781569170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ya4+fO9XzBWfdc4Ka8Bh+sYylF5sEr5adVMzLIQQnag=;
        b=NnnrxT8j3He9rvdDiRREPsAQ9csBOpeB5K4cjOti0SmEwenHp01RWL+aA26cHKvIyr
         KscfdM7a7W79j2zPuQ/OD2lYRWWukKHyU1McyTnYD8CV2rfpkrQXVJIYw5Qf5fjzm93F
         luehoT6jp4gB1+7QPSLBfsMIpEvK9vnHnUJRU/+JW5h3W6RE9LFolrGJqOrODVuY9rjN
         YOR2wrAFytXQB/xOfjtNt5bfN7TyzbOwTEYY9OGcNgfNp1SoPUcD6B7miFFvYO/3SF16
         z7ff2VzqrpTk0ahgr+M5+aVEJVcI4iVhX/jn75W1mQfsdRM9plL/1owi40rMdKGqFsjp
         pxrg==
X-Forwarded-Encrypted: i=1; AFNElJ9sSoCeBiWwfnColWePdsGW+7oVwiH3nJU9zqywWeYv+T9JB0omnGQerWCP5SioUqYhiDEK3ehHNXY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVBFHfygRRvxL5Neqx1NuGW2NCktGX8Uqlf72CZlUrGXX9w5Y4
	3oArOi/QqNIxENIor+fEwUnbQURuUpMhyMqfjEhfLvY9qsvIqY8mcDK6IU3Xhe875p/MIO0cW1h
	xtCrArf8sPaPDNq3V/3wpTx96wn1J9Y6f87idP9iDeKpKatjizV5vC1PdV3c=
X-Gm-Gg: Acq92OFg7bFBlWbFJaNHEMy8ttpAgyydhtB90Pm7g4aDqcV/4lBbmdf5FnT5OqpHjDy
	NM8ClD4CMiav1XQ4K6pYiFGAwjGYN9te0/YH81gQFjEjGpNeHse8xRiWUdqyQnrjjHsoSSusI7L
	//X39HQDEdNouJCFN17Hdkyp5ZqdQEBPTpsXGznaxqwlqfdydhTU4ecUzX0qud6PXsjjwMQsMvZ
	7QBvt+kfx1zHdEOXEHiEKlD5vf//XqlnRnqet6SOTcscglUnMP77KZ+9FEPxMnBTh1/7VAW6XKn
	SLH1l3cenl4f3AyHKyxpqyMyugj/aelrF5WJZFwTvBrw8fTU
X-Received: by 2002:a17:902:ced0:b0:2c1:ee6e:be20 with SMTP id
 d9443c01a7336-2c1ee6ec4f3mr6353845ad.30.1780964369832; Mon, 08 Jun 2026
 17:19:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1780701922.git.abhishekbapat@google.com>
 <0e91fdd3a88dbe5220d15c4c8ff7b8f66e86af7c.1780701922.git.abhishekbapat@google.com>
 <41a7ebb9-1113-4f13-abbf-6f55d99d62f3@linux.dev>
In-Reply-To: <41a7ebb9-1113-4f13-abbf-6f55d99d62f3@linux.dev>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Mon, 8 Jun 2026 17:19:18 -0700
X-Gm-Features: AVVi8CfX0QyYbAeRHXTJeGRPllP0GCdLx4rHVaUYJ_oHiIiT8YRFTysM4ZblUVw
Message-ID: <CAL41Mv7jOJ0rtAEDZP2DEGa5d1GfTbK=DXg8k1BL5qjFuQjNuA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] alloc_tag: add ioctl to /proc/allocinfo
To: Hao Ge <hao.ge@linux.dev>
Cc: Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 7, 2026 at 6:53=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Suren and Abhishek
>
>
> Thanks for the new version.
>
>
> On 2026/6/6 07:36, Abhishek Bapat wrote:
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
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> > ---
> >   Documentation/mm/allocation-profiling.rst     |   5 +
> >   .../userspace-api/ioctl/ioctl-number.rst      |   2 +
> >   MAINTAINERS                                   |   1 +
> >   include/linux/codetag.h                       |   2 +
> >   include/uapi/linux/alloc_tag.h                |  54 ++++
> >   lib/alloc_tag.c                               | 232 +++++++++++++++++=
-
> >   lib/codetag.c                                 |  18 ++
> >   7 files changed, 312 insertions(+), 2 deletions(-)
> >   create mode 100644 include/uapi/linux/alloc_tag.h
> >
> > diff --git a/Documentation/mm/allocation-profiling.rst b/Documentation/=
mm/allocation-profiling.rst
> > index 5389d241176a..c3a28467955f 100644
> > --- a/Documentation/mm/allocation-profiling.rst
> > +++ b/Documentation/mm/allocation-profiling.rst
> > @@ -46,6 +46,11 @@ sysctl:
> >   Runtime info:
> >     /proc/allocinfo
> >
> > +  Profiling data can be retrieved either by reading `/proc/allocinfo` =
directly as
> > +  text or programmatically via `ioctl()` calls defined in `<uapi/linux=
/alloc_tag.h>`.
> > +  The ioctl interface supports structured binary data extraction as we=
ll as filtering
> > +  by module name, function, file, line number, accuracy, or allocation=
 size limits.
> > +
> >   Example output::
> >
> >     root@moria-kvm:~# sort -g /proc/allocinfo|tail|numfmt --to=3Diec
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
> > index a31f6f207afd..77f3fc487691 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16711,6 +16711,7 @@ S:    Maintained
> >   F:  Documentation/mm/allocation-profiling.rst
> >   F:  include/linux/alloc_tag.h
> >   F:  include/linux/pgalloc_tag.h
> > +F:   include/uapi/linux/alloc_tag.h
> >   F:  lib/alloc_tag.c
> >
> >   MEMORY CONTROLLER DRIVERS
> > diff --git a/include/linux/codetag.h b/include/linux/codetag.h
> > index ddae7484ca45..a25a085c2df1 100644
> > --- a/include/linux/codetag.h
> > +++ b/include/linux/codetag.h
> > @@ -77,6 +77,8 @@ struct codetag_iterator {
> >   void codetag_lock_module_list(struct codetag_type *cttype);
> >   bool codetag_trylock_module_list(struct codetag_type *cttype);
> >   void codetag_unlock_module_list(struct codetag_type *cttype);
> > +unsigned long codetag_get_content_id(struct codetag_type *cttype);
> > +unsigned int codetag_get_count(struct codetag_type *cttype);
> >   struct codetag_iterator codetag_get_ct_iter(struct codetag_type *ctty=
pe);
> >   struct codetag *codetag_next_ct(struct codetag_iterator *iter);
> >
> > diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_=
tag.h
> > new file mode 100644
> > index 000000000000..901199bad514
> > --- /dev/null
> > +++ b/include/uapi/linux/alloc_tag.h
> > @@ -0,0 +1,54 @@
> > +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > +/*
> > + *  include/linux/alloc_tag.h
>
> nit: it should be include/uapi/linux/alloc_tag.h
>
> (I guess you may have missed the comment I brought up before. It is not
> a critical problem though.)
>
Apologies, I missed that comment earlier. Included in the v4 patchset.
Thanks for bringing this up.

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
> > +/* The alignment ensures 32-bit compatible interfaces are not broken *=
/
> > +struct allocinfo_counter {
> > +     __u64 bytes;
> > +     __u64 calls;
> > +     __u8 accurate;
> > +} __attribute__((aligned(8)));
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
> > index d9be1cf5187d..a0577215eb3d 100644
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
> > @@ -47,6 +49,10 @@ struct allocinfo_private {
> >       struct codetag_iterator iter;
> >       struct codetag_iterator reported_iter;
> >       bool print_header;
> > +     /* ioctl uses a separate iterator not to interfere with reads */
> > +     struct codetag_iterator ioctl_iter;
> > +     bool positioned; /* seq_open_private() sets to 0 */
> > +     struct mutex ioctl_lock;
> >   };
> >
> >   static void *allocinfo_start(struct seq_file *m, loff_t *pos)
> > @@ -130,6 +136,229 @@ static const struct seq_operations allocinfo_seq_=
op =3D {
> >       .show   =3D allocinfo_show,
> >   };
> >
> > +/*
> > + * Initializes seq_file operations and allocates private state when op=
ening
> > + * the /proc/allocinfo procfs entry.
> > + */
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
> > +/*
> > + * Cleans up the seq_file state and frees up the private state allocat=
ed in
> > + * allocinfo_open() when closing the /proc/allocinfo file descriptor.
> > + */
> > +static int allocinfo_release(struct inode *inode, struct file *file)
> > +{
> > +     return seq_release_private(inode, file);
> > +}
> > +
> > +/*
> > + * Returns a pointer to the suffix of a string so that its length fits=
 within
> > + * ALLOCINFO_STR_SIZE, preserving the trailing characters.
> > + */
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
> > +     strscpy_pad(dest, allocinfo_str(src), ALLOCINFO_STR_SIZE);
> > +}
> > +
> > +/*
> > + * Populates the UAPI allocinfo_tag_data structure with active runtime
> > + * profiling counters extracted from the given kernel codetag.
> > + */
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
> > +/*
> > + * Retrieves the unique content ID representing the current allocation=
 tag module
> > + * layout, allowing userspace to detect if modules were loaded / unloa=
ded.
> > + */
> > +static int allocinfo_ioctl_get_content_id(struct seq_file *m, void __u=
ser *arg)
> > +{
> > +     struct allocinfo_content_id params;
> > +
> > +     codetag_lock_module_list(alloc_tag_cttype);
> > +     params.id =3D codetag_get_content_id(alloc_tag_cttype);
> > +     codetag_unlock_module_list(alloc_tag_cttype);
> > +     if (copy_to_user(arg, &params, sizeof(params)))
> > +             return -EFAULT;
> > +
> > +     return 0;
> > +}
> > +
> > +/*
> > + * Seeks the ioctl iterator to the specified 0-indexed tag position, r=
eads its
> > + * profiling data and returns it to userspace.
> > + */
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
> > +     priv =3D m->private;
> > +     pos =3D params.pos;
> > +
> > +     mutex_lock(&priv->ioctl_lock);
> > +     codetag_lock_module_list(alloc_tag_cttype);
> > +
> > +     if (pos >=3D codetag_get_count(alloc_tag_cttype)) {
> > +             codetag_unlock_module_list(alloc_tag_cttype);
> > +             mutex_unlock(&priv->ioctl_lock);
> > +             return -ENOENT;
> > +     }
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
> > +     codetag_unlock_module_list(alloc_tag_cttype);
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
> > +/*
> > + * Advances the ioctl iterator to the next allocation tag in the seque=
nce and
> > + * returns its profiling data to userspace.
> > + */
> > +static int allocinfo_ioctl_get_next(struct seq_file *m, void __user *a=
rg)
> > +{
> > +     struct allocinfo_private *priv;
> > +     struct codetag *ct;
> > +     struct allocinfo_tag_data params;
> > +     int ret =3D 0;
> > +
> > +     memset(&params, 0, sizeof(params));
> > +     priv =3D m->private;
> > +
> > +     mutex_lock(&priv->ioctl_lock);
> > +     codetag_lock_module_list(alloc_tag_cttype);
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
> > +     codetag_unlock_module_list(alloc_tag_cttype);
> > +     mutex_unlock(&priv->ioctl_lock);
> > +
> > +     if (ret =3D=3D 0) {
> > +             if (copy_to_user(arg, &params, sizeof(params)))
> > +                     return -EFAULT;
> > +     }
> > +     return ret;
> > +}
> > +
> > +/*
> > + * Entry point ioctl function for /proc/allocinfo routing requests to =
fetch the
> > + * layout content ID, seek to a specific tag, or read sequential tags.
> > + */
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
> > @@ -993,8 +1222,7 @@ static int __init alloc_tag_init(void)
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
> > index 4001a7ea6675..a9cda4c962a3 100644
> > --- a/lib/codetag.c
> > +++ b/lib/codetag.c
> > @@ -19,6 +19,8 @@ struct codetag_type {
> >       struct codetag_type_desc desc;
> >       /* generates unique sequence number for module load */
> >       unsigned long next_mod_seq;
> > +     /* bumped on every module load and unload */
> > +     unsigned long content_id;
> >   };
> >
> >   struct codetag_range {
> > @@ -50,6 +52,20 @@ void codetag_unlock_module_list(struct codetag_type =
*cttype)
> >       up_read(&cttype->mod_lock);
> >   }
> >
> > +unsigned long codetag_get_content_id(struct codetag_type *cttype)
> > +{
> > +     lockdep_assert_held(&cttype->mod_lock);
> > +
> > +     return cttype->content_id;
> > +}
> > +
> > +unsigned int codetag_get_count(struct codetag_type *cttype)
> > +{
> > +     lockdep_assert_held(&cttype->mod_lock);
> > +
> > +     return cttype->count;
> > +}
> > +
> >   struct codetag_iterator codetag_get_ct_iter(struct codetag_type *ctty=
pe)
> >   {
> >       struct codetag_iterator iter =3D {
> > @@ -204,6 +220,7 @@ static int codetag_module_init(struct codetag_type =
*cttype, struct module *mod)
> >
> >       down_write(&cttype->mod_lock);
> >       cmod->mod_seq =3D ++cttype->next_mod_seq;
> > +     ++cttype->content_id;
>
> I have a comment on the content_id bump placement.
>
> ++cttype->content_id is placed before idr_alloc and the module_load
>
> callback. If idr_alloc fails or module_load returns an error
>
> (While the chance of this occurring is very low.), the idr entry gets
>
> rolled back but content_id has already been bumped. The actual
>
> content didn't change in this case, so userspace would see a
>
> different content_id and assume the data is inconsistent when it
>
> isn't.
>
>
> Thanks
>
> Best Regards
>
> Hao

While I agree with your comment, I decided to place the counter
increment there because the chance of failure is low. Furthermore,
even if it falsely invalidates user data, the user will simply query
the content again. This placement also aligns with where the
previously used field (cttype->next_mod_seq) was incremented. Let me
know if you still think I should move it. Thanks!

>
> >       mod_id =3D idr_alloc(&cttype->mod_idr, cmod, 0, 0, GFP_KERNEL);
> >       if (mod_id >=3D 0) {
> >               if (cttype->desc.module_load) {
> > @@ -368,6 +385,7 @@ void codetag_unload_module(struct module *mod)
> >                       cttype->count -=3D range_size(cttype, &cmod->rang=
e);
> >                       idr_remove(&cttype->mod_idr, mod_id);
> >                       kfree(cmod);
> > +                     ++cttype->content_id;
> >               }
> >               up_write(&cttype->mod_lock);
> >               if (found && cttype->desc.free_section_mem)
