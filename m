Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E46219FC
	for <linux-doc@vger.kernel.org>; Sun, 21 Jun 2026 00:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782000034; cv=pass; b=r9pNM7f0icaAiOo9C8mHodLpUsRR2aKwJPKgglCRA6nTq8idOFG4jqOqejTH4RuyG61PpgXtOcJTWFL9rsIRD4QLf+af2HxrvBwzYD8ONTd7xgyIVvYaIi7TcBoMMyfoUoTMsolV/R+lgZafaZYPkRcfh1tkmZ75KQfoBFBs9Ao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782000034; c=relaxed/simple;
	bh=AZdhpry1m3PmU80Oy55QCrhyhEyau6GLNhVk6mqOg3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VS49133d82mXRl6qeVYrHp5TX8podUl93D4GxBPetzN2yNiUxVFJOqymIaVCdJol40XMX868pttuLL/NVojMSodU4YiUsNRqDXllnYLet1yeLjdCpJkUo7H5y0TGrRNWex/J4CaR+BEXOPWQKQrspLm8GGDAVXq2zwQwTrLr6jM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qm81N+AY; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qm81N+AY"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51765331535so371661cf.1
        for <linux-doc@vger.kernel.org>; Sat, 20 Jun 2026 17:00:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782000031; cv=none;
        d=google.com; s=arc-20260327;
        b=lZOJQhaSOv7aMBSoT09U4wZtIcDFajMtvcFpqRu8SRt2n3LPOeUpWkKtDF1JQRBaG1
         6Of8X4DfeU2H0ahCDo+Q/3TaXq11cb/ylQdEws+DJ/hbQLv9L2GwmwS0ksdewUgbuIk+
         p5epCheayhBxtgeqY2GNDIaJyBhUcZwE/OXqrSMnZtSF6bc/tftydzM8UWGhTdA3lcQm
         v86Aml8U0xsPhqlRg9EHNFTC1xGGfeMYgTkQZt7nyuu4eUFohjk6QUmDiNoRBwtcU7I8
         9JNV8DuXge2p1/xw7f0FuPRmY1shS+3LIYTysDJ1IMUKBZ+XylU+US0JIHqxfH574gyu
         g3CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I7YVuvXThm0toGAM/4mpv9e/nJVFM7CnaeXRQvob9Js=;
        fh=Yd2MhObNG3lNACpCTaTRv/fHBvdIB5V047JFySH+2Ys=;
        b=SDc7OlOhcwSRaolMjhloonWWsrmK2LzqL2t4kxpE3a7c8huPuxnaAt5ZNqF9e2Gl+k
         4eZg3jJe2mmbDCgddn+SL2OiGZKIHpEIT+hhC8GSWnbSDQvvK6INMCcruNepSG5erM1n
         a/vRi4jQBzvTsGeWu2Y6S/hNXcUdV6ZH1D6dCP0GTrybX0Y9JYwFUqZk345eDaBA9OIB
         BGiwCIMGHjN2OEg9nWLlpScEDInZ3gy/1kP1iRxQgNbY5m5mi/Sf/CEwv0QTpmtPFKS+
         fHMghpYdzucVSxjFHfRMEe1JTPNLMh4+S23/N9BSPDTU42/0L8gA8FgvnuXghQvLLGRq
         Sirw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782000031; x=1782604831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I7YVuvXThm0toGAM/4mpv9e/nJVFM7CnaeXRQvob9Js=;
        b=qm81N+AYy2km/eui8WBDIKnrTwKJnPoHVjhRichdBeHYt8n60+9FpG86zEBtB8mrfB
         zRkAbRKdTStkIOFc4y3oUg8Jt2sLa41YVJ7c6bSdMLIjFRYlNpCc+ZqpBRqedqaPhfM5
         gGTBt+fWjRLFeDh9LsD1Rs1xIpk0Rtcn+/SH1eGKjTMs8fVILPjM2IvEj9Fd3ISDxz/N
         7wDY886DPFurmASUK5c+1ucRh/IZzzA4DgNLmaoVTtoyPq2GDHlFTrjTg2eLszNMunhU
         rJiHlakPq0J3e2gc1DiHZN53ttumXT9BHhhNczHCWIrlzbqyKm4/ViU2+hwxiXZ07JXB
         yZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782000031; x=1782604831;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I7YVuvXThm0toGAM/4mpv9e/nJVFM7CnaeXRQvob9Js=;
        b=Q90o0Xq/dkZqrZkO9nSed8t4Oo/g76DigeW6DBR8iA6VorkkMKfnMuhnnRC5V5Nh95
         FIfepO79DbG0Z2a6M+pUWFFZb8Dc1nqwySE3QWsBwEDlp3a/GHdntHFi+oQEXy6CDnGg
         JwCrA3w86SlcLh3dF5X1SsR9gPsGiYJUrIxsXQzHXJEo7LgTkYZwc5hjcuT9HZevzbOK
         wTIBJUudohzw+1GwD7OGziWkCzFuD+MfN62utKORwxA3e5cVXYUS5DNflE/YR7BiVKrQ
         7TTtSJDlEnTg/SSeqRSEi9s85ARBBtk63cmiIKBAMglhqBUQhxBA17ttfeQYcn/biUa6
         oR+g==
X-Forwarded-Encrypted: i=1; AFNElJ9AGF/kgaKUq+M/BRelsXHa4PMzb7XjcxRyOVYvjbCR1ytNuxT5Xtgkf+dE5GqXaw5VNneod1Ia3kM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwbHCD1ra6sa8hgnfdHpDFJGctxUhfdF0HRLVLoHD0HYw6lInu
	IbFI/ZVSp8ge7oOinPtTVqu1EK9ICT2zpnTNxLT2FRBbugvBtr1Z8FWU3XPhIb+l32u/UGxf+B6
	gkhw2US9/gz/7ty06u4SgWgEwhAWnvda23pos3El+
X-Gm-Gg: AfdE7cn+DjyJDaIIGoh9FsbMgs0UpDdMCvmMqbXqhGbSolqwRU36yidP6z5eEf/7yDi
	T7cW1bRpJFCSTGxGHXoW766UMG/cbAwUky1O0X1MjkQJEDKrt0hY6tcFM0LNoj5jPZRTTo9EhdR
	xJPCD+e9SHKhdLxtu5bpxOELUgJSLCOlGq7sF0AmbxDw5FEmJs8Bai0FGbKvb4fGHzrOyBNEvld
	GgPn48SeXz71Wi1IZNcdOoECEiDl0Mk96R7M2QBGBptzJzSGzzFFhs33sAJKeMoBFX1hHw=
X-Received: by 2002:a05:622a:11c5:b0:516:ccc0:ee38 with SMTP id
 d75a77b69052e-519e891bc2bmr13237071cf.9.1782000029589; Sat, 20 Jun 2026
 17:00:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1781803482.git.abhishekbapat@google.com> <6944ab65167d8884ce0d856184730d06ead68cb5.1781803482.git.abhishekbapat@google.com>
In-Reply-To: <6944ab65167d8884ce0d856184730d06ead68cb5.1781803482.git.abhishekbapat@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 20 Jun 2026 17:00:18 -0700
X-Gm-Features: AVVi8CfHs4Muf6EinscyLyhahIerAJ8Wq3Zw_M8pDgJhxRBeKg_Tis_5NswmYtw
Message-ID: <CAJuCfpGCdHc8br0fdGw4cQYgXGCCsCuTkVF_19QWzmV8bSVuhA@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] alloc_tag: add size-based filtering to ioctl
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Hao Ge <hao.ge@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 10:36=E2=80=AFAM Abhishek Bapat
<abhishekbapat@google.com> wrote:
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

Acked-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  include/uapi/linux/alloc_tag.h |  8 ++++-
>  lib/alloc_tag.c                | 64 +++++++++++++++++++++++++++-------
>  2 files changed, 58 insertions(+), 14 deletions(-)
>
> diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_ta=
g.h
> index 13e9b5916bf5..0de5fc180790 100644
> --- a/include/uapi/linux/alloc_tag.h
> +++ b/include/uapi/linux/alloc_tag.h
> @@ -50,13 +50,17 @@ enum {
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
> @@ -64,6 +68,8 @@ enum {
>  struct allocinfo_filter {
>         __u64 mask; /* bitmask of the filter fields used */
>         struct allocinfo_tag fields;
> +       __u64 min_size;
> +       __u64 max_size;
>  };
>
>  struct allocinfo_get_at {
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index f00d731b81cf..ad33d63ef7b4 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -198,16 +198,20 @@ static int allocinfo_cmp_str(const char *str, const=
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
> -
>         if (ct->modname)
>                 allocinfo_copy_str(data->tag.modname, ct->modname);
>         else
> @@ -215,9 +219,9 @@ static void allocinfo_to_params(struct codetag *ct,
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
> @@ -241,7 +245,9 @@ static int allocinfo_ioctl_get_content_id(struct seq_=
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
> @@ -268,6 +274,19 @@ static bool matches_filter(struct codetag *ct, struc=
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
> @@ -281,6 +300,8 @@ static int allocinfo_ioctl_get_at(struct seq_file *m,=
 void __user *arg)
>         struct codetag *ct;
>         struct allocinfo_get_at params =3D {0};
>         __u64 skip_count;
> +       struct alloc_tag_counters counters;
> +       bool fetched_counters;
>
>         if (copy_from_user(&params, arg, sizeof(params)))
>                 return -EFAULT;
> @@ -288,6 +309,11 @@ static int allocinfo_ioctl_get_at(struct seq_file *m=
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
> @@ -311,7 +337,8 @@ static int allocinfo_ioctl_get_at(struct seq_file *m,=
 void __user *arg)
>         ct =3D codetag_next_ct(&priv->ioctl_iter);
>
>         while (ct) {
> -               if (matches_filter(ct, &priv->filter)) {
> +               fetched_counters =3D false;
> +               if (matches_filter(ct, &priv->filter, &counters, &fetched=
_counters)) {
>                         if (skip_count =3D=3D 0)
>                                 break;
>                         skip_count--;
> @@ -320,7 +347,9 @@ static int allocinfo_ioctl_get_at(struct seq_file *m,=
 void __user *arg)
>         }
>
>         if (ct) {
> -               allocinfo_to_params(ct, &params.data);
> +               if (!fetched_counters)
> +                       counters =3D allocinfo_prefetch_counters(ct);
> +               allocinfo_to_params(ct, &params.data, &counters);
>                 priv->positioned =3D true;
>         }
>
> @@ -346,6 +375,8 @@ static int allocinfo_ioctl_get_next(struct seq_file *=
m, void __user *arg)
>         struct codetag *ct;
>         struct allocinfo_tag_data params;
>         int ret =3D 0;
> +       struct alloc_tag_counters counters;
> +       bool fetched_counters;
>
>         memset(&params, 0, sizeof(params));
>         priv =3D m->private;
> @@ -359,11 +390,18 @@ static int allocinfo_ioctl_get_next(struct seq_file=
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
> -       if (ct)
> -               allocinfo_to_params(ct, &params);
> +       }
>
> +       if (ct) {
> +               if (!fetched_counters)
> +                       counters =3D allocinfo_prefetch_counters(ct);
> +               allocinfo_to_params(ct, &params, &counters);
> +       }
>         if (!ct) {
>                 priv->positioned =3D false;
>                 ret =3D -ENOENT;
> --
> 2.55.0.rc0.786.g65d90a0328-goog
>
