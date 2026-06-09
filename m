Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DE5369D51
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 20:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781038308; cv=pass; b=CxTdW0ulq84GWwkLfD84aym6nh/hjLIDKQLOyqELUT8AvIHlXBLGMlfbCZO2VJWGj+mtWbMtxyHARZkQT5Pd+ddJj9lJtiTwnYHKs6sTb643XilEjPRKWAPJ28KKT0NzkEH2agXF31ghJr8/yHzu0McCsY/0nBjLz3KHagD2WxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781038308; c=relaxed/simple;
	bh=0MwB9uLtE4l9zvVx7M1HSepUmXVdLBU1Lwsr/gdgs50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UN2dZolDoqMQq2E+qxZNehknFp2RSOD5mjVhw4naSy5lu08/ttUnBHXm7nmkVSowBdlBUuPxpX0+xK0VK/xFUCq+wsldq/s2HGxn73fFaLgZWFNal3bmogC/+ilspYghY5gkqtDI/ruydF4LevKv8Pao9FNqOK3lyu1NTrY5+VU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qnRT/lo/; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qnRT/lo/"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2bf22c18ad3so5475ad.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 13:51:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781038306; cv=none;
        d=google.com; s=arc-20240605;
        b=lCiYniocPE3SHrQlAQVyFMJD/o/aTc+F1h7IaKE59KAj3Vhu0+m45JSQm06man4lgU
         rGNc6GOhP+WIVDZTCZNriX2l/ujgrLmDp2TQGpADIXARj/4R3Q/A8H6n619QjVfcb6gx
         IWXGCXGbUTAVBJxTxrLMWwft2wpfUwOsIdpkmr2SXTVhBFTeYrlLtfMtREtn/XMD4B+m
         vzCWRS/oq1WZkpN9NRgKPX+GVGswTNLxGgwukkZg1PCspUx38mkGi6ZtLCReZ3H/AZH0
         o9ADBMAHp7jaH9xLLiA6CcxR2/X7ZQeOcQw98qYIn9kmAxrSP3Ew7cJ8z20WqJ+CLt0d
         BOrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tq8XaLY6r1/voPI9M/ERgi4HZtRgir9eUgSsx7DpoMI=;
        fh=nN0XSRIu9yHoIxm/FECZoIz8qI6VKIX+qWLwQeqEM0U=;
        b=KUMN4tDAnGUKpyQ9t4xZQ9HCFEwxxbltI00auBbhRNFK7Y7OJbIn/aMO+pN7zHMMYa
         QlIJ6+razgdeKfM+/xvJqypDxqeTuwt90+hWUyqsGIkOZn5dnFH1FaIrMX4ud+uW4UDE
         KrmoYVc+N9YU+R/rs2KGhK5JQSkJ+9m66UMoqhloNeKVLwBcDhFvXhTA4KkLoe92KlAA
         Ww+VbG1NW7MSwAMKIFAE2ZqU1yK9ofsXETCXsB1YZkhn7QiyuWGC4hknLHJoUImcP8vm
         E7QWDkRACzZrRN7tGXEvjp27Pa7ssbUayq5WxPpusR2vvdpg1J1e+2PgEMaCdKe0SufE
         zA8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781038306; x=1781643106; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tq8XaLY6r1/voPI9M/ERgi4HZtRgir9eUgSsx7DpoMI=;
        b=qnRT/lo/o7vxJXfgIfJ3LRYqhwpJ+rrCtlvrSmR2N3LMZTMu1+w6+vBQAlSGKH+KoW
         G4Z2Va4Q8KV1wcwPz/I/UnGOwrQsyKX2gjRAZ2cwbhuMZU04D/8eFB2daYYTgfsGn2f5
         MDTuz1ZK41Kj08mliKU4gPablTZjtaK8k68bSePob1Ag8MmnIYg7/HOq9KPWpvdJ2d5h
         vyKSf+i9OOsjdV+9gYoLHM9alwE0n+aitBaTXRvAjUg8sXLT6jsQsKRuom42qOiOOVU4
         dB44ugn75kKlXMTQ8LJ/M1NoEh/CJVhzhe5orCQW24wWz7Q1+i1IRxX2Z6fKhcPimIfh
         teJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781038306; x=1781643106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tq8XaLY6r1/voPI9M/ERgi4HZtRgir9eUgSsx7DpoMI=;
        b=gcoCbHtLrBssPETovTouP5ESxnND8ifEhnwRugg0R1QhLxBN/102tHPGEBu3sAMjzR
         bfktgKw+/iaBHVJPc6s8W08pvt1qZnD1kZT3Q6XuIidHAeSwRhMf+CMbuRmr++uFWHz6
         dXu1op5HDobGnxzbrXztQnZfLur/mGR37yYmjOt4rudkHFeoHyAejQ2E3KfC0oUQQdZg
         Ucx+kLxvN6LXJ+uupkmk4dHsBrJ2gg1FCON1wDzo4UOG9Jmv1JFdGLioJ5mP8wnwR+7J
         7Z7/A447CTjuCWWtzPWGiXqxubQhMu7Vg2kGpuZxXf3WuZMejGXd9L51KptNwh45b8tI
         wLtA==
X-Forwarded-Encrypted: i=1; AFNElJ99q2HG9kZfcQaEXml1cGbRUUOLXSIO/VAeGweeIq+ECwbwFV+WZ5ShLVSd7wVSl7ldcvKEZZIPpf8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw98ecyBmUs86dP6Se8xRTwBauy2baA8PP9GIbGyMAGMRnTb/54
	8Ob0QizaLTjhV1HUtO3qp7BQeUYXyhk5A3h7yVHTF5KVO8C0Xkm4uMYCEU5DPNPZBwwMscRA9hW
	SSDa51hIgMwLWt32b5eb5JuocWfLpQTwrM/t9b6ad
X-Gm-Gg: Acq92OGjvBryrCpjOwmV0B4SXXoCH6BmxGpv1IKNd66r8cdPxSFYC250M9dCcmWnVHj
	PfhxRkDvxCmZvB/cfmFBP54IEuH+ed4iTXVAKUu0ENZWP/zmzR7USEg/oPeHxJFo/CJk6dyIU9p
	r/mSdJU/iSlDxhUZ4BdOilypQRHQRgsU4yAYsCs2/tfpA+A9C0dI0Ni2Izll0SLwxM228JhakRw
	X2ueFzWrC+q53pkDVIibyusmGPrbxCgOP22p7YCLrRxK/nu/dGWx5QR4hV5olfEUO7opoiYuapf
	8MWpLldhsqEWz0ShqXTA3n3MX+Cp2GK+d36bThcBYgqCNbLHeoq/UEd1xqs=
X-Received: by 2002:a17:903:910:b0:2c1:4a67:5f31 with SMTP id
 d9443c01a7336-2c1eb0c6c40mr7710645ad.9.1781038305257; Tue, 09 Jun 2026
 13:51:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1780701922.git.abhishekbapat@google.com>
 <0e91fdd3a88dbe5220d15c4c8ff7b8f66e86af7c.1780701922.git.abhishekbapat@google.com>
 <41a7ebb9-1113-4f13-abbf-6f55d99d62f3@linux.dev> <CAL41Mv7jOJ0rtAEDZP2DEGa5d1GfTbK=DXg8k1BL5qjFuQjNuA@mail.gmail.com>
 <2b7fa423-c721-4157-96ba-93bee5010044@linux.dev>
In-Reply-To: <2b7fa423-c721-4157-96ba-93bee5010044@linux.dev>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Tue, 9 Jun 2026 13:51:32 -0700
X-Gm-Features: AVVi8CcydlHi9L58ERvcwpxq-zlqEB6BT52BTK5SDgSKXzZA2uE9TkzyiPOBnUM
Message-ID: <CAL41Mv5ZzuVRy5cjp_Ozn=9QCpCe1mFS36o25Z1dnbYCvNs9+Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] alloc_tag: add ioctl to /proc/allocinfo
To: Hao Ge <hao.ge@linux.dev>
Cc: Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 6:44=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Abhishek
>
>
> On 2026/6/9 08:19, Abhishek Bapat wrote:
> > On Sun, Jun 7, 2026 at 6:53=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
> >> Hi Suren and Abhishek
> >>
> >>
> >> Thanks for the new version.
> >>
> >>
> >> On 2026/6/6 07:36, Abhishek Bapat wrote:
> >>> From: Suren Baghdasaryan <surenb@google.com>
> >>>
> >>> Add the following ioctl commands for /proc/allocinfo file:
> >>>
> >>> ALLOCINFO_IOC_CONTENT_ID - gets content identifier which can be used
> >>> to check whether the file content has changed specifically due to mod=
ule
> >>> load/unload. Every time a module is loaded / unloaded, the returned
> >>> value will be different. By comparing the identifier value at the
> >>> beginning and at the end of the content retrieval operation, users ca=
n
> >>> validate retrieved information for consistency.
> >>>
> >>> ALLOCINFO_IOC_GET_AT - gets the record at the specified position. Thi=
s
> >>> is the position of a record in /proc/allocinfo.
> >>>
> >>> ALLOCINFO_IOC_GET_NEXT - gets the record next to the last retrieved
> >>> one. If no records were previously retrieved, returns the first
> >>> record.
> >>>
> >>> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> >>> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> >>> ---
> >>>    Documentation/mm/allocation-profiling.rst     |   5 +
> >>>    .../userspace-api/ioctl/ioctl-number.rst      |   2 +
> >>>    MAINTAINERS                                   |   1 +
> >>>    include/linux/codetag.h                       |   2 +
> >>>    include/uapi/linux/alloc_tag.h                |  54 ++++
> >>>    lib/alloc_tag.c                               | 232 ++++++++++++++=
+++-
> >>>    lib/codetag.c                                 |  18 ++
> >>>    7 files changed, 312 insertions(+), 2 deletions(-)
> >>>    create mode 100644 include/uapi/linux/alloc_tag.h
> >>>
> >>> diff --git a/Documentation/mm/allocation-profiling.rst b/Documentatio=
n/mm/allocation-profiling.rst
> >>> index 5389d241176a..c3a28467955f 100644
> >>> --- a/Documentation/mm/allocation-profiling.rst
> >>> +++ b/Documentation/mm/allocation-profiling.rst
> >>> @@ -46,6 +46,11 @@ sysctl:
> >>>    Runtime info:
> >>>      /proc/allocinfo
> >>>
> >>> +  Profiling data can be retrieved either by reading `/proc/allocinfo=
` directly as
> >>> +  text or programmatically via `ioctl()` calls defined in `<uapi/lin=
ux/alloc_tag.h>`.
> >>> +  The ioctl interface supports structured binary data extraction as =
well as filtering
> >>> +  by module name, function, file, line number, accuracy, or allocati=
on size limits.
> >>> +
> >>>    Example output::
> >>>
> >>>      root@moria-kvm:~# sort -g /proc/allocinfo|tail|numfmt --to=3Diec
> >>> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Doc=
umentation/userspace-api/ioctl/ioctl-number.rst
> >>> index 331223761fff..84f6808a8578 100644
> >>> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> >>> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> >>> @@ -349,6 +349,8 @@ Code  Seq#    Include File                       =
                      Comments
> >>>                                                                      =
     <mailto:luzmaximilian@gmail.com>
> >>>    0xA5  20-2F  linux/surface_aggregator/dtx.h                       =
     Microsoft Surface DTX driver
> >>>                                                                      =
     <mailto:luzmaximilian@gmail.com>
> >>> +0xA6  00-0F  uapi/linux/alloc_tag.h                                 =
   Memory allocation profiling
> >>> +                                                                    =
   <mailto:surenb@google.com>
> >>>    0xAA  00-3F  linux/uapi/linux/userfaultfd.h
> >>>    0xAB  00-1F  linux/nbd.h
> >>>    0xAC  00-1F  linux/raw.h
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index a31f6f207afd..77f3fc487691 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -16711,6 +16711,7 @@ S:    Maintained
> >>>    F:  Documentation/mm/allocation-profiling.rst
> >>>    F:  include/linux/alloc_tag.h
> >>>    F:  include/linux/pgalloc_tag.h
> >>> +F:   include/uapi/linux/alloc_tag.h
> >>>    F:  lib/alloc_tag.c
> >>>
> >>>    MEMORY CONTROLLER DRIVERS
> >>> diff --git a/include/linux/codetag.h b/include/linux/codetag.h
> >>> index ddae7484ca45..a25a085c2df1 100644
> >>> --- a/include/linux/codetag.h
> >>> +++ b/include/linux/codetag.h
> >>> @@ -77,6 +77,8 @@ struct codetag_iterator {
> >>>    void codetag_lock_module_list(struct codetag_type *cttype);
> >>>    bool codetag_trylock_module_list(struct codetag_type *cttype);
> >>>    void codetag_unlock_module_list(struct codetag_type *cttype);
> >>> +unsigned long codetag_get_content_id(struct codetag_type *cttype);
> >>> +unsigned int codetag_get_count(struct codetag_type *cttype);
> >>>    struct codetag_iterator codetag_get_ct_iter(struct codetag_type *c=
ttype);
> >>>    struct codetag *codetag_next_ct(struct codetag_iterator *iter);
> >>>
> >>> diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/allo=
c_tag.h
> >>> new file mode 100644
> >>> index 000000000000..901199bad514
> >>> --- /dev/null
> >>> +++ b/include/uapi/linux/alloc_tag.h
> >>> @@ -0,0 +1,54 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> >>> +/*
> >>> + *  include/linux/alloc_tag.h
> >> nit: it should be include/uapi/linux/alloc_tag.h
> >>
> >> (I guess you may have missed the comment I brought up before. It is no=
t
> >> a critical problem though.)
> >>
> > Apologies, I missed that comment earlier. Included in the v4 patchset.
> > Thanks for bringing this up.
> >
> >>> + */
> >>> +
> >>> +#ifndef _UAPI_ALLOC_TAG_H
> >>> +#define _UAPI_ALLOC_TAG_H
> >>> +
> >>> +#include <linux/types.h>
> >>> +
> >>> +#define ALLOCINFO_STR_SIZE   64
> >>> +
> >>> +struct allocinfo_content_id {
> >>> +     __u64 id;
> >>> +};
> >>> +
> >>> +struct allocinfo_tag {
> >>> +     /* Longer names are trimmed */
> >>> +     char modname[ALLOCINFO_STR_SIZE];
> >>> +     char function[ALLOCINFO_STR_SIZE];
> >>> +     char filename[ALLOCINFO_STR_SIZE];
> >>> +     __u64 lineno;
> >>> +};
> >>> +
> >>> +/* The alignment ensures 32-bit compatible interfaces are not broken=
 */
> >>> +struct allocinfo_counter {
> >>> +     __u64 bytes;
> >>> +     __u64 calls;
> >>> +     __u8 accurate;
> >>> +} __attribute__((aligned(8)));
> >>> +
> >>> +struct allocinfo_tag_data {
> >>> +     struct allocinfo_tag tag;
> >>> +     struct allocinfo_counter counter;
> >>> +};
> >>> +
> >>> +struct allocinfo_get_at {
> >>> +     __u64 pos;      /* input */
> >>> +     struct allocinfo_tag_data data;
> >>> +};
> >>> +
> >>> +#define _ALLOCINFO_IOC_CONTENT_ID    0
> >>> +#define _ALLOCINFO_IOC_GET_AT                1
> >>> +#define _ALLOCINFO_IOC_GET_NEXT              2
> >>> +
> >>> +#define ALLOCINFO_IOC_BASE           0xA6
> >>> +#define ALLOCINFO_IOC_CONTENT_ID     _IOR(ALLOCINFO_IOC_BASE, _ALLOC=
INFO_IOC_CONTENT_ID,     \
> >>> +                                          struct allocinfo_content_i=
d)
> >>> +#define ALLOCINFO_IOC_GET_AT         _IOWR(ALLOCINFO_IOC_BASE, _ALLO=
CINFO_IOC_GET_AT,        \
> >>> +                                           struct allocinfo_get_at)
> >>> +#define ALLOCINFO_IOC_GET_NEXT               _IOR(ALLOCINFO_IOC_BASE=
, _ALLOCINFO_IOC_GET_NEXT,       \
> >>> +                                          struct allocinfo_tag_data)
> >>> +
> >>> +#endif /* _UAPI_ALLOC_TAG_H */
> >>> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> >>> index d9be1cf5187d..a0577215eb3d 100644
> >>> --- a/lib/alloc_tag.c
> >>> +++ b/lib/alloc_tag.c
> >>> @@ -5,6 +5,7 @@
> >>>    #include <linux/gfp.h>
> >>>    #include <linux/kallsyms.h>
> >>>    #include <linux/module.h>
> >>> +#include <linux/mutex.h>
> >>>    #include <linux/page_ext.h>
> >>>    #include <linux/pgalloc_tag.h>
> >>>    #include <linux/proc_fs.h>
> >>> @@ -14,6 +15,7 @@
> >>>    #include <linux/string_choices.h>
> >>>    #include <linux/vmalloc.h>
> >>>    #include <linux/kmemleak.h>
> >>> +#include <uapi/linux/alloc_tag.h>
> >>>
> >>>    #define ALLOCINFO_FILE_NAME         "allocinfo"
> >>>    #define MODULE_ALLOC_TAG_VMAP_SIZE  (100000UL * sizeof(struct allo=
c_tag))
> >>> @@ -47,6 +49,10 @@ struct allocinfo_private {
> >>>        struct codetag_iterator iter;
> >>>        struct codetag_iterator reported_iter;
> >>>        bool print_header;
> >>> +     /* ioctl uses a separate iterator not to interfere with reads *=
/
> >>> +     struct codetag_iterator ioctl_iter;
> >>> +     bool positioned; /* seq_open_private() sets to 0 */
> >>> +     struct mutex ioctl_lock;
> >>>    };
> >>>
> >>>    static void *allocinfo_start(struct seq_file *m, loff_t *pos)
> >>> @@ -130,6 +136,229 @@ static const struct seq_operations allocinfo_se=
q_op =3D {
> >>>        .show   =3D allocinfo_show,
> >>>    };
> >>>
> >>> +/*
> >>> + * Initializes seq_file operations and allocates private state when =
opening
> >>> + * the /proc/allocinfo procfs entry.
> >>> + */
> >>> +static int allocinfo_open(struct inode *inode, struct file *file)
> >>> +{
> >>> +     int ret;
> >>> +
> >>> +     ret =3D seq_open_private(file, &allocinfo_seq_op,
> >>> +                            sizeof(struct allocinfo_private));
> >>> +     if (!ret) {
> >>> +             struct seq_file *m =3D file->private_data;
> >>> +             struct allocinfo_private *priv =3D m->private;
> >>> +
> >>> +             mutex_init(&priv->ioctl_lock);
> >>> +     }
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +/*
> >>> + * Cleans up the seq_file state and frees up the private state alloc=
ated in
> >>> + * allocinfo_open() when closing the /proc/allocinfo file descriptor=
.
> >>> + */
> >>> +static int allocinfo_release(struct inode *inode, struct file *file)
> >>> +{
> >>> +     return seq_release_private(inode, file);
> >>> +}
> >>> +
> >>> +/*
> >>> + * Returns a pointer to the suffix of a string so that its length fi=
ts within
> >>> + * ALLOCINFO_STR_SIZE, preserving the trailing characters.
> >>> + */
> >>> +static const char *allocinfo_str(const char *str)
> >>> +{
> >>> +     size_t len =3D strlen(str);
> >>> +
> >>> +     /* Keep an extra space for the trailing NULL. */
> >>> +     if (len >=3D ALLOCINFO_STR_SIZE)
> >>> +             str +=3D (len - ALLOCINFO_STR_SIZE) + 1;
> >>> +     return str;
> >>> +}
> >>> +
> >>> +/* Copy a string and trim from the beginning if it's too long */
> >>> +static void allocinfo_copy_str(char *dest, const char *src)
> >>> +{
> >>> +     strscpy_pad(dest, allocinfo_str(src), ALLOCINFO_STR_SIZE);
> >>> +}
> >>> +
> >>> +/*
> >>> + * Populates the UAPI allocinfo_tag_data structure with active runti=
me
> >>> + * profiling counters extracted from the given kernel codetag.
> >>> + */
> >>> +static void allocinfo_to_params(struct codetag *ct,
> >>> +                             struct allocinfo_tag_data *data)
> >>> +{
> >>> +     struct alloc_tag *tag =3D ct_to_alloc_tag(ct);
> >>> +     struct alloc_tag_counters counter =3D alloc_tag_read(tag);
> >>> +
> >>> +     if (ct->modname)
> >>> +             allocinfo_copy_str(data->tag.modname, ct->modname);
> >>> +     else
> >>> +             data->tag.modname[0] =3D '\0';
> >>> +     allocinfo_copy_str(data->tag.function, ct->function);
> >>> +     allocinfo_copy_str(data->tag.filename, ct->filename);
> >>> +     data->tag.lineno =3D ct->lineno;
> >>> +     data->counter.bytes =3D counter.bytes;
> >>> +     data->counter.calls =3D counter.calls;
> >>> +     data->counter.accurate =3D !alloc_tag_is_inaccurate(tag);
> >>> +}
> >>> +
> >>> +/*
> >>> + * Retrieves the unique content ID representing the current allocati=
on tag module
> >>> + * layout, allowing userspace to detect if modules were loaded / unl=
oaded.
> >>> + */
> >>> +static int allocinfo_ioctl_get_content_id(struct seq_file *m, void _=
_user *arg)
> >>> +{
> >>> +     struct allocinfo_content_id params;
> >>> +
> >>> +     codetag_lock_module_list(alloc_tag_cttype);
> >>> +     params.id =3D codetag_get_content_id(alloc_tag_cttype);
> >>> +     codetag_unlock_module_list(alloc_tag_cttype);
> >>> +     if (copy_to_user(arg, &params, sizeof(params)))
> >>> +             return -EFAULT;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +/*
> >>> + * Seeks the ioctl iterator to the specified 0-indexed tag position,=
 reads its
> >>> + * profiling data and returns it to userspace.
> >>> + */
> >>> +static int allocinfo_ioctl_get_at(struct seq_file *m, void __user *a=
rg)
> >>> +{
> >>> +     struct allocinfo_private *priv;
> >>> +     struct codetag *ct;
> >>> +     __u64 pos;
> >>> +     struct allocinfo_get_at params =3D {0};
> >>> +
> >>> +     if (copy_from_user(&params, arg, sizeof(params)))
> >>> +             return -EFAULT;
> >>> +
> >>> +     priv =3D m->private;
> >>> +     pos =3D params.pos;
> >>> +
> >>> +     mutex_lock(&priv->ioctl_lock);
> >>> +     codetag_lock_module_list(alloc_tag_cttype);
> >>> +
> >>> +     if (pos >=3D codetag_get_count(alloc_tag_cttype)) {
> >>> +             codetag_unlock_module_list(alloc_tag_cttype);
> >>> +             mutex_unlock(&priv->ioctl_lock);
> >>> +             return -ENOENT;
> >>> +     }
> >>> +
> >>> +     /* Find the codetag */
> >>> +     priv->ioctl_iter =3D codetag_get_ct_iter(alloc_tag_cttype);
> >>> +     ct =3D codetag_next_ct(&priv->ioctl_iter);
> >>> +     while (ct && pos--)
> >>> +             ct =3D codetag_next_ct(&priv->ioctl_iter);
> >>> +     if (ct) {
> >>> +             allocinfo_to_params(ct, &params.data);
> >>> +             priv->positioned =3D true;
> >>> +     }
> >>> +
> >>> +     codetag_unlock_module_list(alloc_tag_cttype);
> >>> +     mutex_unlock(&priv->ioctl_lock);
> >>> +
> >>> +     if (!ct)
> >>> +             return -ENOENT;
> >>> +
> >>> +     if (copy_to_user(arg, &params, sizeof(params)))
> >>> +             return -EFAULT;
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +/*
> >>> + * Advances the ioctl iterator to the next allocation tag in the seq=
uence and
> >>> + * returns its profiling data to userspace.
> >>> + */
> >>> +static int allocinfo_ioctl_get_next(struct seq_file *m, void __user =
*arg)
> >>> +{
> >>> +     struct allocinfo_private *priv;
> >>> +     struct codetag *ct;
> >>> +     struct allocinfo_tag_data params;
> >>> +     int ret =3D 0;
> >>> +
> >>> +     memset(&params, 0, sizeof(params));
> >>> +     priv =3D m->private;
> >>> +
> >>> +     mutex_lock(&priv->ioctl_lock);
> >>> +     codetag_lock_module_list(alloc_tag_cttype);
> >>> +
> >>> +     if (!priv->positioned) {
> >>> +             priv->ioctl_iter =3D codetag_get_ct_iter(alloc_tag_ctty=
pe);
> >>> +             priv->positioned =3D true;
> >>> +     }
> >>> +
> >>> +     ct =3D codetag_next_ct(&priv->ioctl_iter);
> >>> +     if (ct)
> >>> +             allocinfo_to_params(ct, &params);
> >>> +
> >>> +     if (!ct) {
> >>> +             priv->positioned =3D false;
> >>> +             ret =3D -ENOENT;
> >>> +     }
> >>> +     codetag_unlock_module_list(alloc_tag_cttype);
> >>> +     mutex_unlock(&priv->ioctl_lock);
> >>> +
> >>> +     if (ret =3D=3D 0) {
> >>> +             if (copy_to_user(arg, &params, sizeof(params)))
> >>> +                     return -EFAULT;
> >>> +     }
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +/*
> >>> + * Entry point ioctl function for /proc/allocinfo routing requests t=
o fetch the
> >>> + * layout content ID, seek to a specific tag, or read sequential tag=
s.
> >>> + */
> >>> +static long allocinfo_ioctl(struct file *file, unsigned int cmd,
> >>> +                         unsigned long __arg)
> >>> +{
> >>> +     void __user *arg =3D (void __user *)__arg;
> >>> +     int ret;
> >>> +
> >>> +     switch (cmd) {
> >>> +     case ALLOCINFO_IOC_CONTENT_ID:
> >>> +             ret =3D allocinfo_ioctl_get_content_id(file->private_da=
ta, arg);
> >>> +             break;
> >>> +     case ALLOCINFO_IOC_GET_AT:
> >>> +             ret =3D allocinfo_ioctl_get_at(file->private_data, arg)=
;
> >>> +             break;
> >>> +     case ALLOCINFO_IOC_GET_NEXT:
> >>> +             ret =3D allocinfo_ioctl_get_next(file->private_data, ar=
g);
> >>> +             break;
> >>> +     default:
> >>> +             ret =3D -ENOIOCTLCMD;
> >>> +             break;
> >>> +     }
> >>> +
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +#ifdef CONFIG_COMPAT
> >>> +static long allocinfo_compat_ioctl(struct file *file, unsigned int c=
md,
> >>> +                                unsigned long arg)
> >>> +{
> >>> +     return allocinfo_ioctl(file, cmd, (unsigned long)compat_ptr(arg=
));
> >>> +}
> >>> +#endif
> >>> +
> >>> +static const struct proc_ops allocinfo_proc_ops =3D {
> >>> +     .proc_open              =3D allocinfo_open,
> >>> +     .proc_read_iter         =3D seq_read_iter,
> >>> +     .proc_lseek             =3D seq_lseek,
> >>> +     .proc_release           =3D allocinfo_release,
> >>> +     .proc_ioctl             =3D allocinfo_ioctl,
> >>> +#ifdef CONFIG_COMPAT
> >>> +     .proc_compat_ioctl      =3D allocinfo_compat_ioctl,
> >>> +#endif
> >>> +
> >>> +};
> >>> +
> >>>    size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t coun=
t, bool can_sleep)
> >>>    {
> >>>        struct codetag_iterator iter;
> >>> @@ -993,8 +1222,7 @@ static int __init alloc_tag_init(void)
> >>>                return 0;
> >>>        }
> >>>
> >>> -     if (!proc_create_seq_private(ALLOCINFO_FILE_NAME, 0400, NULL, &=
allocinfo_seq_op,
> >>> -                                  sizeof(struct allocinfo_private), =
NULL)) {
> >>> +     if (!proc_create(ALLOCINFO_FILE_NAME, 0400, NULL, &allocinfo_pr=
oc_ops)) {
> >>>                pr_err("Failed to create %s file\n", ALLOCINFO_FILE_NA=
ME);
> >>>                shutdown_mem_profiling(false);
> >>>                return -ENOMEM;
> >>> diff --git a/lib/codetag.c b/lib/codetag.c
> >>> index 4001a7ea6675..a9cda4c962a3 100644
> >>> --- a/lib/codetag.c
> >>> +++ b/lib/codetag.c
> >>> @@ -19,6 +19,8 @@ struct codetag_type {
> >>>        struct codetag_type_desc desc;
> >>>        /* generates unique sequence number for module load */
> >>>        unsigned long next_mod_seq;
> >>> +     /* bumped on every module load and unload */
> >>> +     unsigned long content_id;
> >>>    };
> >>>
> >>>    struct codetag_range {
> >>> @@ -50,6 +52,20 @@ void codetag_unlock_module_list(struct codetag_typ=
e *cttype)
> >>>        up_read(&cttype->mod_lock);
> >>>    }
> >>>
> >>> +unsigned long codetag_get_content_id(struct codetag_type *cttype)
> >>> +{
> >>> +     lockdep_assert_held(&cttype->mod_lock);
> >>> +
> >>> +     return cttype->content_id;
> >>> +}
> >>> +
> >>> +unsigned int codetag_get_count(struct codetag_type *cttype)
> >>> +{
> >>> +     lockdep_assert_held(&cttype->mod_lock);
> >>> +
> >>> +     return cttype->count;
> >>> +}
> >>> +
> >>>    struct codetag_iterator codetag_get_ct_iter(struct codetag_type *c=
ttype)
> >>>    {
> >>>        struct codetag_iterator iter =3D {
> >>> @@ -204,6 +220,7 @@ static int codetag_module_init(struct codetag_typ=
e *cttype, struct module *mod)
> >>>
> >>>        down_write(&cttype->mod_lock);
> >>>        cmod->mod_seq =3D ++cttype->next_mod_seq;
> >>> +     ++cttype->content_id;
> >> I have a comment on the content_id bump placement.
> >>
> >> ++cttype->content_id is placed before idr_alloc and the module_load
> >>
> >> callback. If idr_alloc fails or module_load returns an error
> >>
> >> (While the chance of this occurring is very low.), the idr entry gets
> >>
> >> rolled back but content_id has already been bumped. The actual
> >>
> >> content didn't change in this case, so userspace would see a
> >>
> >> different content_id and assume the data is inconsistent when it
> >>
> >> isn't.
> >>
> >>
> >> Thanks
> >>
> >> Best Regards
> >>
> >> Hao
> > While I agree with your comment, I decided to place the counter
> > increment there because the chance of failure is low. Furthermore,
> > even if it falsely invalidates user data, the user will simply query
> > the content again. This placement also aligns with where the
> > previously used field (cttype->next_mod_seq) was incremented. Let me
> > know if you still think I should move it. Thanks!
>
> Sorry, I should have marked this as a nit when I raised the comment.
>
> Given its low probability of occurring, it doesn't block anything for now=
.
>
> The reason I raised this comment was just in case someone adds new logic
>
> in the feature  that could fail. But if that happens, we can move both
> next_mod_seq
>
> and content_id down together.
>
>
> Thanks
>
> Best Regards
>
> Hao
>

Sounds good, so for now I am not touching this patch and keeping it as
is other than the file path nit inside the UAPI header file.
> >>>        mod_id =3D idr_alloc(&cttype->mod_idr, cmod, 0, 0, GFP_KERNEL)=
;
> >>>        if (mod_id >=3D 0) {
> >>>                if (cttype->desc.module_load) {
> >>> @@ -368,6 +385,7 @@ void codetag_unload_module(struct module *mod)
> >>>                        cttype->count -=3D range_size(cttype, &cmod->r=
ange);
> >>>                        idr_remove(&cttype->mod_idr, mod_id);
> >>>                        kfree(cmod);
> >>> +                     ++cttype->content_id;
> >>>                }
> >>>                up_write(&cttype->mod_lock);
> >>>                if (found && cttype->desc.free_section_mem)
