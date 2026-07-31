Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D8236D9E7
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 21:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785534118; cv=pass; b=TlOy87uFqGGNXtk7KWY+zP2GKAnPDG8epMnItNn89cSnkMwgDT2UVcbZsv9PTlbHixK68x/mCdFKggcoWVLXY858tNm57nrvSgZ0ADDWbT9EUz0E15WkN3ytlDjuEQDnrGN61de3FBkP9Oo9rqUMj1/JC17BLQ7Ivzk6/+dCBrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785534118; c=relaxed/simple;
	bh=6VTzGQIz6zviRvkOs5vBipRRlnWyI84qCaMk91dcrBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ex6yTVZ1kBLdLyYAtVF3OvDWIxVHsq6jpuoGRjmK+SKMa130ybJI5SmNeluonMpeFMJa/lCvU/PJZ3DII6PHe7GQr0PSldz7JiWfyTdIskP090txNOwTZ3oVr+EROtTpYNJek1vB8MSCnnINcMHHjND8UpfgVjKkKy6dzerPF/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sZ6/npVi; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sZ6/npVi"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c15a5b265so86791cf.0
        for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 14:41:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785534116; cv=none;
        d=google.com; s=arc-20260327;
        b=jOicPKb8+yBOnYZxUpNGW/CEm6NxwdmY52/lxTjNfUWc6k+w+b/Nk26Y7ICD2pVtM7
         RUTdCIow71e2fCIXYjHgaj3XaNlPcsVDiPwoCbmLh8Yr13C9ehQjKrJQdJC5AuQzCq6V
         pXo4pPBEcVkTO9Orf8BNYPYQ+7wHOUBGGx9w/ujRqckOzR0hmzOo89HoJ/nPv1XaTEoE
         YhTegWcKFxlePhaqCjuLXZKeAl7b6E6oNZqBuKEp5pmaaIefhvNjHaXDYB4rgpaMYjoF
         Qb4jUaIPhcYiVMhGlp0nmANNfVgQ5KTBEOn0njXMg2mGX/L6lgAkXrQ0W5SONp8QL7op
         /e8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rVBIwZIPgIDhLzcF7RXhpKO3wVpM4DEMhlKxrjF7g5k=;
        fh=aX5C1srBj1eHXAVL8XfDF/DSZDFRevIksdHXZVvauEI=;
        b=rM6m2YHu1dsynq0tmBC1jjX8oQ+c0aHfTf1Z56w/d/rzGjOETsjoiE1ezr+J47o2A1
         mdgXeqJY7FaF8H1kr6diVefjigUxcZ1iuGb5/lPsOeQkQ5rvlLNVlVRlo8BXyasCei3y
         j420WRSWS/zsiFx40M8CUD7FSx9oHp3qA1wQrqyyL+9sw7w+SUmzlbGpX0KuENoNkByH
         vz41iEMblJV0bi7wYW7wsKGQfW7JhkuJ6Joz35hgaw1lapSPA1KnRxkG9My2hQ0JlNbk
         1GOMJJ6D+thKiYPYsUpQOzlxlh6bEKsCnXYwSB+PNjnzAWQsz6UoAy3z5VMhKpixWZCg
         Rrwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785534116; x=1786138916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rVBIwZIPgIDhLzcF7RXhpKO3wVpM4DEMhlKxrjF7g5k=;
        b=sZ6/npVisl3h6f8ScYElmNfE89LOXOX/s4PG/2/aDOtAn8OKJTgiHzaotIJQjVchU9
         h20wY3p2uI1AkAFfzeZ2MJkOM1fAfaeYMMIeNEU4uCkB1n9ljSRswAP3ESOyDJJbhuzc
         R8iHe6RFJ94cIeGl8/6YSQhPvscoYhBmVi5pMRnM+98htYUpw5xz83SJ676HeqkKcrOk
         OY3NZqQRYDJK/J/YbZR4l2/H/vaSBra8f0aojhTdo5ryl4gAoynJLmGQAm9UZJ9pegCj
         xXz/dxB2z5K7Ip0TqFPMCCBtZRo5Vw1Z0jGF5du/8yCOwQVuItfBZlCax1B4B4pbPHmR
         NoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785534116; x=1786138916;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rVBIwZIPgIDhLzcF7RXhpKO3wVpM4DEMhlKxrjF7g5k=;
        b=LRXlF3BoAKaXDbnDQASgN53V3yJAL9+Uv0cw6XgT2wCAAdvkjZco08ZBA96LnH5KQ8
         lt62TFLfK5mCjZqKwSr3ZUW6Mz/zLSenIcIjofV3q4TYx1VK1iVp799r5M9xBPJepbFY
         v9hLjsR96UNulLG/JjGnjEvmQxRLTVmMoc9sgkw3dhrlXy5OjgOygObc8RgGNtyXjTLH
         XHat4eGWYfkiVFsskWMaXGCgMmNjZr+R2cNQdbRzFQNw/k4ZQv+YlMPTPB7UtXKA4G3V
         bCwqION23ZOjh6XL8hnMjCCYZ8Ouz6CzFvtbOyfMyU/WevOAn9TUdq98EQDY2atiOAnl
         L0oA==
X-Forwarded-Encrypted: i=1; AHgh+RpzQScqFK88Div4ucQc73/5CgHsQJoF0QzV5CD4IES4FW+ElEFcJ7+KcXSoc2zzOhBKRbZ5GzrH+6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvBGSxA52ob83FGr2W8Dd5k5GVNO/xgV826kAnAxA+TMueO5u0
	OYypEjYXQ5g5wzUttQIM/DhVzJ1nWsyI5YdPIRilYturB0+Sm18bPy24aRHH9coaP+m/aWST+um
	T2MiGOSnDEd2zHtJzKT4cWTKcHkUmtwyHBXt9nQcb
X-Gm-Gg: AR+sD134AywRMsyvRMnyyiKwqN9JOAg3mGdMDCHIHXbe4fM8sVn2MGRXs9edyyu0mAB
	zVCqdzNMVa2iHL3Fg49ptwnY8WLXQzg7yjiFrevStCoo+YCF9Dr6kriv182PsD5F0iv1uvjozRp
	f8yuaBuZmhNGT1i6+wtrYQRFPO76m/to2yhwKcltyDFsmKL86SxeLW/nsHQd4bO8YtJmTc2UHDr
	ZvZnq3lvJrgMt7hzwyx56w5q/jdvzXZkWZC6tpTw6Ec0GV7JxnSplxkkCFkvK5Ay3rFhbn536/3
	nAgp5xRqXRJ1UL8qwR2TQuFBjlUPHp2EmSBBLGMU5kh6ZH1SXkqHplmKRkm5OZ2B5rGGUbpju5j
	ts8rxIzdXUgrI
X-Received: by 2002:ac8:5752:0:b0:50f:af60:3496 with SMTP id
 d75a77b69052e-52b5af82a24mr2496091cf.1.1785534115622; Fri, 31 Jul 2026
 14:41:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731193705.2902728-1-pratmal@google.com> <20260731143420.0787387ce2ca120ecee15338@linux-foundation.org>
In-Reply-To: <20260731143420.0787387ce2ca120ecee15338@linux-foundation.org>
From: Pratyush Mallick <pratmal@google.com>
Date: Fri, 31 Jul 2026 14:41:43 -0700
X-Gm-Features: AUfX_mxONT7BUnCqEgoJ5gcgCngtoxjaOpE8s96ir9f1CQtwXRsj0be_zU_HCIo
Message-ID: <CALHaPKfeCqNUF_+_y=3_iqrDHK++aRNNeTCy1DUYdDOnzsXMxg@mail.gmail.com>
Subject: Re: [PATCH v4] mm/page_reporting: Add page_reporting_delay_ms module parameter
To: Andrew Morton <akpm@linux-foundation.org>
Cc: vbabka@kernel.org, david@kernel.org, sj@kernel.org, corbet@lwn.net, 
	ljs@kernel.org, skhan@linuxfoundation.org, anshuman.khandual@arm.com, 
	gthelen@google.com, surenb@google.com, mhocko@suse.com, jackmanb@google.com, 
	hannes@cmpxchg.org, ziy@nvidia.com, liam@infradead.org, rppt@kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry I forgot to update it in v4. Resolution looks good to me.
Thanks Again!

Regards,
Pratyush


On Fri, Jul 31, 2026 at 2:34=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Fri, 31 Jul 2026 19:37:05 +0000 pratmal@google.com wrote:
>
> > Free page reporting currently hardcodes a 2-second interval between
> > reports. This rigid delay cannot accommodate diverse guest workloads.
> >
> > This patch introduces a module parameter, page_reporting_delay_ms
> > (default: 2000), allowing users to tune the reporting rate:
> >  - Lower values enable aggressive memory reclamation by returning unuse=
d
> >    pages to the host immediately.
> >  - Higher values help batch pages during spiky allocation/free churn,
> >    reducing hypercalls and nested page fault overheads.
> >
> > Setting the delay to 0 is safe and execution is strictly gated by:
> >  - reporting is only triggered by high-order page frees.
> >  - expensive hypercalls are bounded by a slot capacity watermark check
> >    before proceeding.
>
> This conflcits with the just-upstreamed 0b45f6927a1
> ("mm/page_reporting: use system_freezable_wq to fix UAF during
> suspend")
> (https://lore.kernel.org/20260721005603.1710551-1-linkl@google.com).
>
> Please review my resolution:
>
> --- a/mm/page_reporting.c~mm-page_reporting-add-page_reporting_delay_ms-m=
odule-parameter
> +++ a/mm/page_reporting.c
> @@ -48,7 +48,11 @@ MODULE_PARM_DESC(page_reporting_order, "
>   */
>  EXPORT_SYMBOL_GPL(page_reporting_order);
>
> -#define PAGE_REPORTING_DELAY   (2 * HZ)
> +static unsigned int page_reporting_delay_ms =3D 2 * MSEC_PER_SEC;
> +module_param(page_reporting_delay_ms, uint, 0644);
> +MODULE_PARM_DESC(page_reporting_delay_ms,
> +                "Set page reporting delay in milliseconds");
> +
>  static struct page_reporting_dev_info __rcu *pr_dev_info __read_mostly;
>
>  enum {
> @@ -57,6 +61,13 @@ enum {
>         PAGE_REPORTING_ACTIVE
>  };
>
> +/* schedule work for page reporting */
> +static void page_reporting_schedule_work(struct page_reporting_dev_info =
*prdev)
> +{
> +       queue_delayed_work(system_freezable_wq, &prdev->work,
> +                             msecs_to_jiffies(page_reporting_delay_ms));
> +}
> +
>  /* request page reporting */
>  static void
>  __page_reporting_request(struct page_reporting_dev_info *prdev)
> @@ -77,12 +88,10 @@ __page_reporting_request(struct page_rep
>                 return;
>
>         /*
> -        * Delay the start of work to allow a sizable queue to build. For
> -        * now we are limiting this to running no more than once every
> -        * couple of seconds.
> +        * Delay the start of work to allow a sizable queue to build.
> +        * We limit this based on page_reporting_delay_ms.
>          */
> -       queue_delayed_work(system_freezable_wq, &prdev->work,
> -                          PAGE_REPORTING_DELAY);
> +       page_reporting_schedule_work(prdev);
>  }
>
>  /* notify prdev of free page reporting request */
> @@ -337,13 +346,12 @@ static void page_reporting_process(struc
>  err_out:
>         /*
>          * If the state has reverted back to requested then there may be
> -        * additional pages to be processed. We will defer for 2s to allo=
w
> -        * more pages to accumulate.
> +        * additional pages to be processed. We will defer by
> +        * page_reporting_delay_ms to allow more pages to accumulate.
>          */
>         state =3D atomic_cmpxchg(&prdev->state, state, PAGE_REPORTING_IDL=
E);
>         if (state =3D=3D PAGE_REPORTING_REQUESTED)
> -               queue_delayed_work(system_freezable_wq, &prdev->work,
> -                                  PAGE_REPORTING_DELAY);
> +               page_reporting_schedule_work(prdev);
>  }
>
>  static DEFINE_MUTEX(page_reporting_mutex);
> _
>
