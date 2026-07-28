Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B87392821
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 04:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785212250; cv=pass; b=nKY1zXnt8YYpAwu3Dmn06mLqAV7DGZNviAwZeOw3e2tXJzhOR4xyuFQCDDk/JDtmGDNzLs7DQbQYDHvIjwlXSULlYZfYJiOQcV1c84vGVrFbWIySE8kQfgoZ8vLVOVsZUy231fmYL6IQ2cMctiMjrfTm95tY6U1FibECvjJr1mo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785212250; c=relaxed/simple;
	bh=CAR01W71WcvD8/n5oOkAazxvC6La3bFh0um7uRwjp2s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n2mhxiGTQmTWssW558YizksYHyRy0IyEWCi3OmjDEq1LbieV++dRxzQ2RfKoUIaBxrYdrvH5CyyzE9yDW8Rz6Wsvu1LputNe+HgZGQTnX5tbHoUtEi15apZeqA7IEexkhah3wvz2I98KVZYW7SQpJdI6AoI02fMzQ27lI7kblPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Iyb3gwva; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Iyb3gwva"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51c01c79467so176171cf.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 21:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785212244; cv=none;
        d=google.com; s=arc-20260327;
        b=cjG6DIG5SWV0e/zdIzmVPupcIIUTEKVPfSMGJUEXcs+CCmIrUGVDeFPZFm4A1zSp/n
         1Z8bLBYoPkN4tOF/NemX/uqo2ZSjJ+e3OJEUSoy7NAkY9HW7iuEMHZJVIg29LecYWufn
         SOb1vlKXiOckendbU6J4UlrUEiyVamxEn+KYVQDxwN+0y8ktIBrsZBpJrNfFjYzNox7F
         1/77/md6JS0X3GfUfhf9vMgoUHKasS45B3tokps4+zBp5jh13vzPkj9KzM1NbPvIfMc4
         U3DkvAUtqLch6FMrm5IyWM5hR4Fy7YXnFwy+5a5ShjD5u+ztKFBF3YYRb5WC2Rb33QiB
         cvrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X7owlsROYEO2ppqcE5JktBXE7Y99zhEA6b9SfNDEP5w=;
        fh=ptnuhOPbYDsEgEVdmuBGCKmUDj8T7DHXVpfIXsBpQes=;
        b=Ht2bQnKWWSeaykYWJGen0jhebqoS3wnzNpiE1zYz91slaiiKjvAMz5jcYJo4OR8Jdz
         YXKPxEijePooInA23VsPs7sDYxmmgLBWQL6AHcQegavC8ITkM9YH+XrVJsV26/sg6hml
         8hcM/ZHJaCMaODfEaAyW27R4Weop7yQESAGfgjN1uN1TbRZ8QJPnSJxM+qdW/cgFq7Pj
         jPi6IuGM0OXvV52MARKKaJfXVpj2uRtdNRct3JYFB7B8y/sqVTx2VXec79sIS/lWAZup
         cZ1p+M4jRfG61/jqIOSdiIGEOS6bxOw9g6a6t3KNK71zl36XAf2jwA4QU+gio/iWrebK
         TWhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785212244; x=1785817044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X7owlsROYEO2ppqcE5JktBXE7Y99zhEA6b9SfNDEP5w=;
        b=Iyb3gwvafCs5BxyBe+pKy/tTBmJhABK2VNqrybL7AySKYxtNW8e0dEO3UPtzJZV58+
         G360hjfwIieuCU08Y42vzzW7IgdiPSk/XoUJ7eomb/UgGZEGqPw4NhXdDn/lnL+L4s65
         fCs9UNrSNBCU3EKxemjZatUNjXFVgbbrOhWauWRmI6e5YXlTNIylS1vvN4J0CdMY03r9
         8Yg0e/eKtugbL6+TnD42AKdQhmxz/Vw8mWDMiVvf/pd2sfKxNACB7lckDdIm26SKd0HK
         VzFNWfh5qQLFqb1Uw4YcAzeABbeeOzWsGZdWhOc8ywTEcyahW8/DeHZ+FeSlpz6MvxnZ
         YAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785212244; x=1785817044;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7owlsROYEO2ppqcE5JktBXE7Y99zhEA6b9SfNDEP5w=;
        b=Fvx4qCXqT3A6YUvHLlEQoFO6+F/Vccj6WZRo3KItKPtgEez4gsm3a7IBiFVPXCFi54
         e0yURABB0VOHlpzdiq2I7c9NAoc+D5bGosJT/4TvQpsg8Y62LbruILy+AFoW3TYkC+cd
         qLRndMvifDL0Jo/9J0SJGf4yon8JOaZKKjwKN5kWKun2VYfe2jO9Kn3lUp/LR8FlWOmA
         ku7zsBS5yF7TV0W/xl11TqNma8UhoUnYE0lScsK/71YRib4viDsXq/0n7w4qBoCkPiQv
         CmKkkD9KidtTUs5/TKbbISoLQfUe2vHw43dgluF4uk84HvJ31noT0RLShbCQe5SmdB/6
         u37A==
X-Forwarded-Encrypted: i=1; AHgh+RqKCRUtfNORlGoC3MmxbRaHHr+mwXkjkhFiDMS833QS40P6H3TsGKSt20FlQnJ8hr0Wyw3tC/YGRos=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiGb7GePwIK3zz2FVU5Jq/4dlvr1i/JqiCH6UNqFKPyhe/v8id
	LpRVx9oHGtmNG/Bx32UtIZ9fj5r5FYTCxU29n2HdVQD7jZweDoeQEdenCz6rkX5C+/1bX2TQoen
	6kgVZZciGj6ta4hXl9Bl15oETgburDgrtUH67ufYW
X-Gm-Gg: AR+sD13iykjbg4ihj9801Ek+jrXF1Xg+PXW+5h++NOVCMUzSbV6apYnf/2W8H5rbRft
	CX00hqTii8jPSsNANsmRJKe+/sSz1wHbEVJckL7xQ6Y84dCgxWhtE33D7662c7kx1OTlHD8Gu57
	zr6/Ub1AY1TI5Tc0QOJTucuiq8AKSZMC5ZjR7EcnuWZdJqtNRcarhJ4LNL0w3f4srbSAYoN4FH/
	/OnFlGexHFKHuCnYTxD13jX6tpKNHAomHkaBg8L299WeRcdZy0tGBVeUPHrBOv00JJFqEynBoCw
	OGmpZ2gY0hgtwdzz8P8p4O7b1shE
X-Received: by 2002:a05:622a:a918:b0:51c:ad5:93be with SMTP id
 d75a77b69052e-529a5e72857mr44867761cf.8.1785212243268; Mon, 27 Jul 2026
 21:17:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727230545.262579-1-pratmal@google.com> <20260727181355.481ebbe3b56425a760583f39@linux-foundation.org>
In-Reply-To: <20260727181355.481ebbe3b56425a760583f39@linux-foundation.org>
From: Pratyush Mallick <pratmal@google.com>
Date: Mon, 27 Jul 2026 21:17:12 -0700
X-Gm-Features: AUfX_my12pzfxR6i1DbR2p-Q0yOHOYoNyurKaQ5wnjrkhicLdqFaVTbd0DtjdxM
Message-ID: <CALHaPKf84wq3E3ZKa1YwO4W-ZP7wO+StaYEiZieTPMwS8cCvvA@mail.gmail.com>
Subject: Re: [PATCH v3] mm/page_reporting: Add page_reporting_delay_ms module parameter
To: Andrew Morton <akpm@linux-foundation.org>, sj@kernel.org
Cc: vbabka@kernel.org, david@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, anshuman.khandual@arm.com, gthelen@google.com, 
	surenb@google.com, mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org, 
	ziy@nvidia.com, ljs@kernel.org, liam@infradead.org, rppt@kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Link Lin <linkl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Of course we'd prefer some sort of self-tuning so the kernel
> automatically avoids the situation.  But the user's expectation that
> reporting occurs at a fixed frequency messes up that concept.

That's definitely a good direction to ponder for future iterations. :')
Thanks for handling the merge resolution.

Regards,
Pratyush

On Mon, Jul 27, 2026 at 6:13=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Mon, 27 Jul 2026 23:05:45 +0000 pratmal@google.com wrote:
>
> > From: Pratyush Mallick <pratmal@google.com>
> >
> > Currently, the free page reporting uses a hardcoded delay of
> > (2 HZ) between reporting intervals. While this is a reasonable
> > default, it lacks the flexibility to adapt to varying guest workloads.
> >
> > A low delay allows aggressive memory reclamation, returning unused
> > pages to the host as quickly as possible. However, during spiky
> > allocation/free churn, this immediate reporting can lead to a severe
> > performance penalty (nested page faults) as the guest re-allocates memo=
ry
> > that the host has just unmapped. In these scenarios, there is benefit
> > from increasing the delay to batch free pages over a longer window,
> > absorbing the churn without hypercall and re-fault overhead.
> >
> > This patch exposes the delay as a module parameter:
> > /sys/module/page_reporting/parameters/page_reporting_delay_ms, measured
> > in milliseconds and defaults to 2000ms.
>
> Of course we'd prefer some sort of self-tuning so the kernel
> automatically avoids the situation.  But the user's expectation that
> reporting occurs at a fixed frequency messes up that concept.
>
>
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Document=
ation/admin-guide/kernel-parameters.txt
>
> lgtm.  It conflicts with Link Lin's "mm/page_reporting: use
> system_freezable_wq to fix UAF during suspend".  Easy resolution:
>
>
>  Documentation/admin-guide/kernel-parameters.txt |    6 ++++
>  mm/page_reporting.c                             |   19 ++++++++------
>  2 files changed, 17 insertions(+), 8 deletions(-)
>
> --- a/Documentation/admin-guide/kernel-parameters.txt~mm-page_reporting-a=
dd-page_reporting_delay_ms-module-parameter
> +++ a/Documentation/admin-guide/kernel-parameters.txt
> @@ -4813,6 +4813,12 @@ Kernel parameters
>                         Adjust the minimal page reporting order. The page
>                         reporting is disabled when it exceeds MAX_PAGE_OR=
DER.
>
> +       page_reporting.page_reporting_delay_ms=3D
> +                       [KNL] Free page reporting delay in milliseconds
> +                       Format: <unsigned integer>
> +                       Adjust the delay in milliseconds between free pag=
e
> +                       reporting intervals. Default is 2000 (2 seconds).
> +
>         panic=3D          [KNL] Kernel behaviour on panic: delay <timeout=
>
>                         timeout > 0: seconds before rebooting
>                         timeout =3D 0: wait forever
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
> @@ -77,12 +81,11 @@ __page_reporting_request(struct page_rep
>                 return;
>
>         /*
> -        * Delay the start of work to allow a sizable queue to build. For
> -        * now we are limiting this to running no more than once every
> -        * couple of seconds.
> +        * Delay the start of work to allow a sizable queue to build.
> +        * We limit this based on page_reporting_delay_ms.
>          */
>         queue_delayed_work(system_freezable_wq, &prdev->work,
> -                          PAGE_REPORTING_DELAY);
> +                          msecs_to_jiffies(page_reporting_delay_ms));
>  }
>
>  /* notify prdev of free page reporting request */
> @@ -337,13 +340,13 @@ static void page_reporting_process(struc
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
>                 queue_delayed_work(system_freezable_wq, &prdev->work,
> -                                  PAGE_REPORTING_DELAY);
> +                                  msecs_to_jiffies(page_reporting_delay_=
ms));
>  }
>
>  static DEFINE_MUTEX(page_reporting_mutex);
> _
>
