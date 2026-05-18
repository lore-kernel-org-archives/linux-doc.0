Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCB83382F3
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 23:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779147675; cv=pass; b=VmNzFXmcbmYd++u8QqHaisRfKh4dWkOiFlsGQZYQiNgFATeiYzcSQArTD9NMubV9Ls/j9pRNMvDToFga4ZYaQjRBXGeoeRyashpDPC5FGL0CnOaxOG9IXmQF2bzNTqmkvN+pjQLUtUpTDLqaL+M5EEZ7RtxT0seYOCuJ95AJcV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779147675; c=relaxed/simple;
	bh=PU4MQADEhWH1xOQECaKm2ggORZ2WklbWnTEtF3vgZi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=II3l81uj8VnUUpZxXHi2fpgDKHGONDGfigoZYm/R++0gDW3AOIkXhNcmc61D5SqelIilnsBK8Z6xb53VGj37r2NcUh5K9GNlZmbQgKWwN9Ey2F0aeEpcWFtSYKH0OfDMewAvhTZQZILDl/JIaBPQvunBfAIkWWQqaTLB1PH4zW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QVIhjBWU; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QVIhjBWU"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso305ad.0
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 16:41:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779147672; cv=none;
        d=google.com; s=arc-20240605;
        b=JvldDFQXVkvstkorbP9Q0HzX95Vf8S45UuuUQUQEl3wfh44luEI6IY0KqeeUeFxDvZ
         KaPoQG5H0q7Q8jVIc5Ieh2Ma4ZyTM9xDwCam0+2IBDeMxKuILJFgyUHEzeYw/ufeY7Jv
         a3bB1gqHhWxspl/zDWIJ2Z8Za04rGvLFt0ibks82WTVZ6fihR+Ni5ZXup7+y3Dl4JJaw
         yWSDxcSYFDfhJhS87BqoT470Ll3xjbnM7nK+XCcxYSYuE1Hg5aYctyTPjhKjQz8kGAvR
         5/3Ql0FlA1+psAsAcKbxTt0+wqBVKPHlnUyj/i3L6wC8mzgzfxyQK0Bd5jkNMBZOUgcU
         vCMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IHRjlbIxx8xNGO6BZ+LZbmgJGbpCAmOWcnGBXVgqzb0=;
        fh=7rv33QRKTlsPH2xt6t0Xwt0F1IZqavlgoTMKea0MoAQ=;
        b=Jq25wHIX72I0qG69F8vsO/8JnZT3DvRXsigGy+GGet3QieZTAr3Ph6WUpNrrtwFJ2R
         bsJz9Q2BLn4LDR8nH6V/TXdmPGP6l0gLaoic+NWpZ3kAhQK5n2B1opiasXWIGbRsrP6i
         iUpuyZlJnDAVci/Qh+FI4VBqyauyuA6pMSF2tC3HgQvpddj5Webw7WmipToY8xO0cGEn
         m2uYdqG7HuDGhjoHJMIODQAyBb8O+HHG+foGGoGuD+SXLUo2HifK2eIZDLFq9JfcmGJg
         Js7AHI5yTBVYwlYXgexq0DDVX85fmp9SFmh8kfWsYVJji6QeWZm0euXo0hqaK8dVJFBP
         ZJdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779147672; x=1779752472; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHRjlbIxx8xNGO6BZ+LZbmgJGbpCAmOWcnGBXVgqzb0=;
        b=QVIhjBWUr+TTWYZkeGNYqKGiT0Fj5iSB91YvXWc1x44DLvlAUuLTuURs9K9mMI/gBh
         e/7W5t1mpZtVHojjBy3qoDSJ19AI+uH8TW8SUjv5EKWtyFcHlNKE3jwQ8a6J1s71jWjf
         MOMi9m1eJJTc3Qqqrs+SvTk8GQPjagcBT82IQca9u8OKK7lr7+ilsZg/h9cWVdhF0sb8
         cEJcUuQkeInuy2fU71f4ut+G5Sfr4JRrnI4i9tvjwvoLqT+qXonkSL/W+94Ml/Ewcgp4
         Sc2KGH5aEvsabw05j3sAi7ab7yLYjxCE78dO2UeUiM8VdEpShEi9CM7Aex8i8NXxMo1I
         gjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779147672; x=1779752472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IHRjlbIxx8xNGO6BZ+LZbmgJGbpCAmOWcnGBXVgqzb0=;
        b=gkMC4XXk6ec/uEgZYTwA0+tyzRBuMHz6cukP5IIpWnT3LMoJznFh9D9ILGv8bZbDkw
         UDIQID3/hyE2sWbO3KhUVwREzM9KcrhJ3KvYmVSJY70dayKiGEA8Dbvn7kIDaTrZEgzg
         0VndiKS0wIXOzjvSr3ks63Y9g4BPUgahVrcKPgy86rD6xn45a9saG0AW55cQArfsdl1v
         Sw90YLQAOsw5MCqfZP+WGDbRK0T5qpwA5r9CM2XlPlU4wO07zW8SNjisBtXSyPu8cHyk
         FesphwpFTU4i1S8CGJtttz7SVN9hRaP8H+AGbBSSy00f06R+vJ1eaxlcKgl5X4nkOBGo
         TViA==
X-Forwarded-Encrypted: i=1; AFNElJ9DWMNykK5m5VP/5q/LCpqFPtGIHrnkAQWp/YTvMWNKWXIQBW8wXraTGCpQOZcMizCw3SpfJdRtCLM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVrEljECjJGOWvwodaXSAzKwGx0wnHfDusxTAaR7ESaOKvNOfH
	v5MLDLyKHvqvMUF9/QPwBCgOkyTINA5vaLq6pAmZWZCFI2vp8zN88NbmA7r9yTH+O21j9xNgdWO
	wWSEuDiRzhh0oOBPNP8wCismwCN4EK/Eum7/d4cDu
X-Gm-Gg: Acq92OELCXYUgWCTUugzn3wxBMHt6+afEVuYB0ZUz3TZBta+R6G0xU0I3BMmdZv+UrX
	kB+jp7B9X0F81X525iGiPZ17wVkEuDqxPkFWK3Ds85xD7/sf95Hr3L6kyg2LFaBwd9YjvhUhU4h
	gviQLfIm9F1FjzD24x+KmE3S93JimLXnqWwDPk0AygZQ0s7tOqvQeSAAL6/4Omx8UrxMdwyCtyj
	v7ORok99S4agBsJ1A3yO02ouY7aATDG9pKc1qhw/3JtPwq5Odj2utd08AObOI5oawy+AFwX8qZz
	bj82SWzRUsINctfsGzmHtRXjJvXAT4kzgGztbudmGBLMWEYO
X-Received: by 2002:a17:903:37d0:b0:2b7:b03d:9dce with SMTP id
 d9443c01a7336-2bdb041671dmr4491685ad.18.1779147671779; Mon, 18 May 2026
 16:41:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777936301.git.abhishekbapat@google.com>
 <d064a1a8de127c0e321f675a9966e533a0917e7e.1777936301.git.abhishekbapat@google.com>
 <2f546525-8ff6-4bbe-86ae-6f474f7cefe3@linux.dev>
In-Reply-To: <2f546525-8ff6-4bbe-86ae-6f474f7cefe3@linux.dev>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Mon, 18 May 2026 16:41:00 -0700
X-Gm-Features: AVHnY4ImPLsbds7akkX1H341x9cN6owK86NVv2eBmbeDXBcUDJajU37sLzNZjmA
Message-ID: <CAL41Mv7zCEFUAD43wBRo+rno2AK-teUUaVSdx2Pd7qDU0uNwsg@mail.gmail.com>
Subject: Re: [PATCH 1/6] alloc_tag: add ioctl to /proc/allocinfo
To: Hao Ge <hao.ge@linux.dev>
Cc: Suren Baghdasaryan <surenb@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 9:38=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Suren and Abhishek
>
>
> Thanks for the patch! A couple of minor comments below.
>
>
> On 2026/5/5 07:36, Abhishek Bapat wrote:
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
> >   .../userspace-api/ioctl/ioctl-number.rst      |   2 +
> >   include/linux/codetag.h                       |   1 +
> >   include/uapi/linux/alloc_tag.h                |  54 ++++++
> >   lib/alloc_tag.c                               | 178 +++++++++++++++++=
-
> >   lib/codetag.c                                 |  11 ++
> >   5 files changed, 244 insertions(+), 2 deletions(-)
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
> > index ed1bdcf1f8ab..5c24d2f954d4 100644
> > --- a/lib/alloc_tag.c
> > +++ b/lib/alloc_tag.c
> > @@ -14,6 +14,7 @@
> >   #include <linux/string_choices.h>
> >   #include <linux/vmalloc.h>
> >   #include <linux/kmemleak.h>
> > +#include <uapi/linux/alloc_tag.h>
> >
> >   #define ALLOCINFO_FILE_NAME         "allocinfo"
> >   #define MODULE_ALLOC_TAG_VMAP_SIZE  (100000UL * sizeof(struct alloc_t=
ag))
> > @@ -46,6 +47,9 @@ int alloc_tag_ref_offs;
> >   struct allocinfo_private {
> >       struct codetag_iterator iter;
> >       bool print_header;
> > +     /* ioctl uses a separate iterator not to interfere with reads */
> > +     struct codetag_iterator ioctl_iter;
> > +     bool positioned; /* seq_open_private() sets to 0 */
> >   };
> >
> >   static void *allocinfo_start(struct seq_file *m, loff_t *pos)
> > @@ -125,6 +129,177 @@ static const struct seq_operations allocinfo_seq_=
op =3D {
> >       .show   =3D allocinfo_show,
> >   };
> >
> > +static int allocinfo_open(struct inode *inode, struct file *file)
> > +{
> > +     return seq_open_private(file, &allocinfo_seq_op,
> > +                             sizeof(struct allocinfo_private));
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
>
> Minor nit about allocinfo_to_params():
>
> When modname is NULL (built-in kernel code), the current code sets it
>
> to an empty string:
>
>      if (ct->modname)
>
>          allocinfo_copy_str(data->tag.modname, ct->modname);
>
>      else
>
>          data->tag.modname[0] =3D '\0';
>
> This is of course workable in userspace by checking for an empty
>
> string, but I was wondering if it would be cleaner to use "vmlinux"
>
> as a default:
>
> else
>
>            allocinfo_copy_str(data->tag.modname, "vmlinux");
>
>
> For some context, in our memory analysis workflow we often group
>
> allocations by module to get a quick overview of where memory goes,
>
> for example:
>
> vmlinux:    2.1 GB    (kernel core)
>
> nvidia:     1.2 GB    (GPU driver)
>
> iwlwifi:    800 MB    (WiFi driver)
>
> ext4:       500 MB    (filesystem)
>
> Having a consistent identifier for kernel built-in allocations would
>
> avoid each userspace tool needing to handle the empty string as a
>
> special case. Totally fine if this is intentional though.
>
Thanks for bringing this up, I can certainly make this change.
However, the information is not currently exposed this way through
/proc/allocinfo. /proc/allocinfo does not categorize kernel non-module
allocations as vmlinux, so there will a delta between how IOCTL and
/proc/allocinfo behave. Suren, could you comment on whether this
recommendation is fine by you?

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
> > +     codetag_lock_module_list(alloc_tag_cttype, true);
> > +
> > +     /* Find the codetag */
> > +     priv->ioctl_iter =3D codetag_get_ct_iter(alloc_tag_cttype);
> > +     ct =3D codetag_next_ct(&priv->ioctl_iter);
> > +     while (ct && pos--)
> > +             ct =3D codetag_next_ct(&priv->ioctl_iter);
>
> I noticed that codetag_next_ct(&priv->ioctl_iter) and
>
> priv->positioned are accessed without serialization in the ioctl
>
> path. Concurrent ioctl calls on the same fd could race on these
>
> fields. Just something I spotted while reading the code.
>
>
> Thanks
>
> Best Regards
>
> Hao
>
I believe this should be prevented by `codetag_lock_module_list`; am I
wrong in my understanding?

> > +     if (ct) {
> > +             allocinfo_to_params(ct, &params.data);
> > +             priv->positioned =3D true;
> > +     }
> > +
> > +     codetag_lock_module_list(alloc_tag_cttype, false);
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
> > @@ -946,8 +1121,7 @@ static int __init alloc_tag_init(void)
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

Note, I will be following up with a v2 patchset with your feedback
included. Please bring up any other points you'd want to clarify so
that I can include all the changes in the v2 patchset. Thanks for
reviewing!
