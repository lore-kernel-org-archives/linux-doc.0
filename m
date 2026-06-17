Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCEF4ADD8E
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 16:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781713775; cv=pass; b=nuLzCCanpHzniPb5xg7Vp1CmatxS9BLDjyCNe4+VWeUVH+vhWyhO67Pyh4v9Fskk+ZbEi6d3ssmr5KxqAV76ftZ1bnF1kWcUG7yGr4NmdJxeNkXZRttHfBhmUVk2fGeO2+3be0UCMsEzj8QwaIMfHZaNFsmbGhxjdOHTLGW/zOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781713775; c=relaxed/simple;
	bh=6gixY1Rh6oTEEpGrqitvaAMcgcu5XQXbgTcla1HKCKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Br0J1OocwvKYUWmxd+t/LbMGWQf60Niq6m2hSoX9gOPObtvOb9ZpVne/0xlqabCed3DK/kBSfL5mhpz63QctlWnG2sOZXhM1T/2elFETZn2s3eIrbIWf9qWch+ZJRurntt2UbKEfGmwl4n7HiSsyn5lVLJrZN5joKLKGIUaZn04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ekNnnZtJ; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ekNnnZtJ"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5177d1ff061so312651cf.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 09:29:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781713769; cv=none;
        d=google.com; s=arc-20240605;
        b=bTXNYeKdSixyBr5ysrAxFSEtE/Tk9KXIy/pZkoVi2u5RUuxtRCNrtTy7jCsGS1TXnV
         +tJqWblV0LMyTw16yYKv0IWiSJNeXoi5pLSLqpQWg8K/0ZBmRtPkfAmkiyLTc186Ni+C
         FJiUX4VeaNzcBXIJU3+6Fh65oJbQPtuNcO6ydiHCpUxsi54yhS3g6T6G23ctAiUwYLUH
         BsyGta5EZxVj9olYEnUzkO28lAdvEfsryv8QPZtv9Sq71UOPR/0F5SHAuR7Eb6Xa8wiY
         AwzoKH+tNxn4cR1wCek8bi140YXwGmGJnDV0j16Upg+3K2sQjWCE78yem0lC/OqsqN5q
         8MGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j3ViCNINWU1ApHw0TpbKMpVstUJu6vw+UuDtJWe3ZJE=;
        fh=T4ZMMNzvIslOwauotoMHaTXJSUH9+k/RK6dgJBKODp4=;
        b=haKXIlb0M/i6OrY3iIA/EME+MXLStYcM/2fWIB5aH3XwkqsFkE661pZzAoWYebTBuy
         +DYzMCzUlG6eg6XbmeTJLRVwcTdZECb55YnJb71xk9r63Jjxin/5BYWnFdfSTQbw7F0I
         pXVWwPz5VKitsfzgFc7+sfT+RSKFI6uxLuJbocS/SS3s7sDPmZqCSV3oEIsLIn0q73HG
         /yQRSVg2bbovvolA7vM4/i93sviY1p3qmhOWaM71xscwZofEpBgI/len0RKIyKtfC1Gp
         PxNTvJ5VdOr/nhBo/Sw8UEg2hYEnWK2PskY2JCcHva2GNxtY7FMr0smYyVsPm9KJQQpG
         zO6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781713769; x=1782318569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j3ViCNINWU1ApHw0TpbKMpVstUJu6vw+UuDtJWe3ZJE=;
        b=ekNnnZtJwKVjjH10wVoy0wYoUIv+kpyjYmRzQm72I9aB26Kkv9DjQ78eVfDQWcPdq7
         Q4iz7lGB9rgJLmsBuLGrLmGUplYoOMsEN44sTDeXGF4JP2lUxvmCyBcZ2g0wBnVYeqfT
         g7R2KpMqwLgfOn3dzxCqAoGHJo6GvHd8sSUVVzeYZykRHu2ocTFeC1GzAlo6IiRug8X1
         /0RtW58TV4kNyJaiCrj5VklJ+BeYGUSZoamTupYRzqzo4rkcSiiu9I2dM0vJW+NL1zFM
         pvOnfSrJI38pRK8dMhceXbNIozuLIwYas5lYLS4vQYYuwZ5xwYy6Pot9tVl/G4X1Z8sN
         XuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781713769; x=1782318569;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j3ViCNINWU1ApHw0TpbKMpVstUJu6vw+UuDtJWe3ZJE=;
        b=EMZs0AKr5HFAsPQDJ6Sgf8uTCRSy7DKqWCMmqwdWdTB7g0yN130WRXnrYrNYl5OxLW
         tqeAU0a7AiscTy7BCfPB0zbaxvC8m/18489oGEG5GEoSe86RyLArdpISCkQA8SemGF8/
         Jr/UF5mhaomPrmaQXiWHAeBtg4M2slkFGdn1IsEKUqaRGwdvw+Z9S1lq0ewun6hxhscq
         hLRMxL8b0l0nlszEy2kpjsxWJGbzppxn0YFpk1KVdhbil3AQEPqsmHsm4gqcei42011E
         wz82JNAuX9vOOLFf23XNsMj1OsnhWmPRlIQVz/9VTmpX6YlQzOXsv/Fliqj8JmVYludy
         liJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Gb+PddsvBE3zINsb7lkak9j8VtI+83pcB+kdmo+j6zuPPZzW7TiQvTDGXMQnT5uWb0PaKll90KVk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1oRB3g1mA52N19OWqFBIHa8APPlN1o5NC9Ix3Jrl+AplJXiKv
	BgLHMLXJCLuZd7t6M4jwR3LFGHHBMeb4k55JNftyb5VniWehlyQMBkoQZWoiGJHU0bNwIedxmHq
	4uNudTiMsyb6gY8emjvKrxgYc05ZXmO7g25WVuHps
X-Gm-Gg: Acq92OFUZ2c0wlS9m6kZ0Ru7jqqLrXTVZ54RTnFux8kXv5A8BiS8p2yqD/YvRMQIi1t
	/WcWbpB39DivG/W8klXw6IRJlNOLzVGdKIMSJDDXNz1rsLlT2YnKIOjLakG2j40qjM1ynKCKgFj
	5YFys2fHHI/LUhiJSfz06q3ZFSHtBXeGBQpO86aAwEi49lXGPzRHZaICvX3SBxsST4PFn67Zx+1
	jrpbxV/FYS6LTXgi2MxkgL8RbqGmL+4VMbMjfckn89336n2Gg7yZeR8sJYp6IDbgl1lYUeiFGtg
	RHQApZCeQdv1H4HgPbMbsBBgmV0=
X-Received: by 2002:ac8:59d4:0:b0:50f:b69a:f4a8 with SMTP id
 d75a77b69052e-519ad98f5c4mr9857921cf.7.1781713768155; Wed, 17 Jun 2026
 09:29:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1781564384.git.abhishekbapat@google.com> <7d98db60ab0fddab230b1a7a32140f3361ab42cf.1781564384.git.abhishekbapat@google.com>
In-Reply-To: <7d98db60ab0fddab230b1a7a32140f3361ab42cf.1781564384.git.abhishekbapat@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 17 Jun 2026 09:29:16 -0700
X-Gm-Features: AVVi8CeKwui872F-kOLXNptMWCgfxo-c2VZxjkZFlkeHAc29MMPClekmD4MDk_Y
Message-ID: <CAJuCfpFbCKc7FR3tbeCzexCzyfiP+Ab2fJ7Vd1Q76MKTvqC2XA@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] alloc_tag: add size-based filtering to ioctl
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Hao Ge <hao.ge@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 4:04=E2=80=AFPM Abhishek Bapat <abhishekbapat@googl=
e.com> wrote:
>
> Extend the allocinfo filtering mechanism to allow users to filter tags
> based on the total number of bytes allocated [min_size, max_size]. The
> size range is inclusive.
>
> Filtering by size involves retrieving allocinfo per-CPU counters, which
> is an expensive operation. Hence, the performance of size-based
> filtering will be worse than other filters.
>
> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> Acked-by: Hao Ge <hao.ge@linux.dev>
> ---
>  include/uapi/linux/alloc_tag.h |  8 ++++-
>  lib/alloc_tag.c                | 63 ++++++++++++++++++++++++++++------
>  2 files changed, 59 insertions(+), 12 deletions(-)
>
> diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_ta=
g.h
> index 3b11877955b9..7f5acbb44c14 100644
> --- a/include/uapi/linux/alloc_tag.h
> +++ b/include/uapi/linux/alloc_tag.h
> @@ -45,13 +45,17 @@ enum {
>         ALLOCINFO_FILTER_FUNCTION,
>         ALLOCINFO_FILTER_FILENAME,
>         ALLOCINFO_FILTER_LINENO,
> -       __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_LINENO
> +       ALLOCINFO_FILTER_MIN_SIZE,
> +       ALLOCINFO_FILTER_MAX_SIZE,
> +       __ALLOCINFO_FILTER_LAST =3D ALLOCINFO_FILTER_MAX_SIZE
>  };
>
>  #define ALLOCINFO_FILTER_MASK_MODNAME          (1 << ALLOCINFO_FILTER_MO=
DNAME)
>  #define ALLOCINFO_FILTER_MASK_FUNCTION         (1 << ALLOCINFO_FILTER_FU=
NCTION)
>  #define ALLOCINFO_FILTER_MASK_FILENAME         (1 << ALLOCINFO_FILTER_FI=
LENAME)
>  #define ALLOCINFO_FILTER_MASK_LINENO           (1 << ALLOCINFO_FILTER_LI=
NENO)
> +#define ALLOCINFO_FILTER_MASK_MIN_SIZE         (1 << ALLOCINFO_FILTER_MI=
N_SIZE)
> +#define ALLOCINFO_FILTER_MASK_MAX_SIZE         (1 << ALLOCINFO_FILTER_MA=
X_SIZE)
>
>  #define ALLOCINFO_FILTER_MASKS \
>         ((1 << (__ALLOCINFO_FILTER_LAST + 1)) - 1)
> @@ -59,6 +63,8 @@ enum {
>  struct allocinfo_filter {
>         __u64 mask; /* bitmask of the filter fields used */
>         struct allocinfo_tag fields;
> +       __u64 min_size;
> +       __u64 max_size;
>  };
>
>  struct allocinfo_get_at {
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index 5feb61d9fb92..b3d21834b61e 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -195,15 +195,26 @@ static int allocinfo_cmp_str(const char *str, const=
 char *template)
>         return strncmp(allocinfo_str(str), template, ALLOCINFO_STR_SIZE);
>  }
>
> +/* Fetch the per-CPU counters */
> +static inline struct alloc_tag_counters allocinfo_prefetch_counters(stru=
ct codetag *ct)
> +{
> +       return alloc_tag_read(ct_to_alloc_tag(ct));
> +}
> +
>  /*
>   * Populates the UAPI allocinfo_tag_data structure with active runtime
>   * profiling counters extracted from the given kernel codetag.
>   */
>  static void allocinfo_to_params(struct codetag *ct,
> -                               struct allocinfo_tag_data *data)
> +                               struct allocinfo_tag_data *data,
> +                               struct alloc_tag_counters *counters)
>  {
> -       struct alloc_tag *tag =3D ct_to_alloc_tag(ct);
> -       struct alloc_tag_counters counter =3D alloc_tag_read(tag);
> +       struct alloc_tag_counters local_counters;
> +
> +       if (!counters) {
> +               local_counters =3D allocinfo_prefetch_counters(ct);
> +               counters =3D &local_counters;
> +       }
>
>         if (ct->modname)
>                 allocinfo_copy_str(data->tag.modname, ct->modname);
> @@ -212,9 +223,9 @@ static void allocinfo_to_params(struct codetag *ct,
>         allocinfo_copy_str(data->tag.function, ct->function);
>         allocinfo_copy_str(data->tag.filename, ct->filename);
>         data->tag.lineno =3D ct->lineno;
> -       data->counter.bytes =3D counter.bytes;
> -       data->counter.calls =3D counter.calls;
> -       data->counter.accurate =3D !alloc_tag_is_inaccurate(tag);
> +       data->counter.bytes =3D counters->bytes;
> +       data->counter.calls =3D counters->calls;
> +       data->counter.accurate =3D !alloc_tag_is_inaccurate(ct_to_alloc_t=
ag(ct));
>  }
>
>  /*
> @@ -238,7 +249,9 @@ static int allocinfo_ioctl_get_content_id(struct seq_=
file *m, void __user *arg)
>   * Verifies whether a given codetag satisfies the active filtering crite=
ria by
>   * matching its characteristics against the specified filter.
>   */
> -static bool matches_filter(struct codetag *ct, struct allocinfo_filter *=
filter)
> +static bool matches_filter(struct codetag *ct, struct allocinfo_filter *=
filter,
> +                          struct alloc_tag_counters *counters,
> +                          bool *fetched_counters)
>  {
>         if (!filter || !filter->mask)
>                 return true;
> @@ -265,6 +278,19 @@ static bool matches_filter(struct codetag *ct, struc=
t allocinfo_filter *filter)
>             ct->lineno !=3D filter->fields.lineno)
>                 return false;
>
> +       if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FI=
LTER_MASK_MAX_SIZE)) {
> +               if (!*fetched_counters) {
> +                       *counters =3D allocinfo_prefetch_counters(ct);
> +                       *fetched_counters =3D true;
> +               }
> +               if ((filter->mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
> +                   counters->bytes < filter->min_size)
> +                       return false;
> +               if ((filter->mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
> +                   counters->bytes > filter->max_size)
> +                       return false;
> +       }
> +
>         return true;
>  }
>
> @@ -278,6 +304,8 @@ static int allocinfo_ioctl_get_at(struct seq_file *m,=
 void __user *arg)
>         struct codetag *ct;
>         struct allocinfo_get_at params =3D {0};
>         __u64 skip_count;
> +       struct alloc_tag_counters counters;
> +       bool fetched_counters;
>
>         if (copy_from_user(&params, arg, sizeof(params)))
>                 return -EFAULT;
> @@ -285,6 +313,11 @@ static int allocinfo_ioctl_get_at(struct seq_file *m=
, void __user *arg)
>         if (params.filter.mask & ~ALLOCINFO_FILTER_MASKS)
>                 return -EINVAL;
>
> +       if ((params.filter.mask & ALLOCINFO_FILTER_MASK_MIN_SIZE) &&
> +           (params.filter.mask & ALLOCINFO_FILTER_MASK_MAX_SIZE) &&
> +           params.filter.min_size > params.filter.max_size)
> +               return -EINVAL;
> +
>         priv =3D m->private;
>
>         mutex_lock(&priv->ioctl_lock);
> @@ -308,7 +341,8 @@ static int allocinfo_ioctl_get_at(struct seq_file *m,=
 void __user *arg)
>         ct =3D codetag_next_ct(&priv->ioctl_iter);
>
>         while (ct) {
> -               if (matches_filter(ct, &priv->filter)) {
> +               fetched_counters =3D false;
> +               if (matches_filter(ct, &priv->filter, &counters, &fetched=
_counters)) {

Do we really need this "fetched_counters" parameter? Here are the
possible cases:
1. If the filter does not include ALLOCINFO_FILTER_MASK_MIN_SIZE |
ALLOCINFO_FILTER_MASK_MAX_SIZE then counters would not be fetched.
2. If the filter includes ALLOCINFO_FILTER_MASK_MIN_SIZE |
ALLOCINFO_FILTER_MASK_MAX_SIZE and
2.1. matches_filter() returns true then we know counters were fetched
because they had to be validated.
2.2. matches_filter() returns false then we don't care if the counters
were fetched. We do not report that tag anyway.

So, instead of passing fetched_counters to matches_filter() we could do thi=
s:

bool filter_by_size =3D (params.filter.mask &
(ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_MASK_MAX_SIZE)) !=3D
0;
while (ct) {
           if (matches_filter(ct, &priv->filter, &counters)) {
...
}
if (ct) {
           allocinfo_to_params(ct, &params.data, filter_by_size ?
&counters : NULL);
...
}

Wouldn't that work?

>                         if (skip_count =3D=3D 0)
>                                 break;
>                         skip_count--;
> @@ -317,7 +351,7 @@ static int allocinfo_ioctl_get_at(struct seq_file *m,=
 void __user *arg)
>         }
>
>         if (ct) {
> -               allocinfo_to_params(ct, &params.data);
> +               allocinfo_to_params(ct, &params.data, fetched_counters ? =
&counters : NULL);
>                 priv->positioned =3D true;
>         }
>
> @@ -343,6 +377,8 @@ static int allocinfo_ioctl_get_next(struct seq_file *=
m, void __user *arg)
>         struct codetag *ct;
>         struct allocinfo_tag_data params;
>         int ret =3D 0;
> +       struct alloc_tag_counters counters;
> +       bool fetched_counters;
>
>         memset(&params, 0, sizeof(params));
>         priv =3D m->private;
> @@ -356,10 +392,15 @@ static int allocinfo_ioctl_get_next(struct seq_file=
 *m, void __user *arg)
>         }
>
>         ct =3D codetag_next_ct(&priv->ioctl_iter);
> -       while (ct && !matches_filter(ct, &priv->filter))
> +       while (ct) {
> +               fetched_counters =3D false;
> +               if (matches_filter(ct, &priv->filter, &counters, &fetched=
_counters))
> +                       break;
>                 ct =3D codetag_next_ct(&priv->ioctl_iter);
> +       }
> +
>         if (ct)
> -               allocinfo_to_params(ct, &params);
> +               allocinfo_to_params(ct, &params, fetched_counters ? &coun=
ters : NULL);
>
>         if (!ct) {
>                 priv->positioned =3D false;
> --
> 2.54.0.1136.gdb2ca164c4-goog
>
