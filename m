Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EB745039
	for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 18:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785003493; cv=pass; b=jViUB4IX6/tFW3s9K3/L0Vzb6LAKGrZauDJwM5BUO6SX+4iAbaVx3qQw38xucV7cUl/3YQRj2pupmORwK+1iEqIeINrpzCnUdi/Wzz0gkTBzYnrI9+9drqRoX0MICVCWTOe3sBCFq+tKFNnuJHpDSVFPkJAojkPUB+5xCyJs8Gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785003493; c=relaxed/simple;
	bh=DoIwWmmTZMdHBD5C9WAoSL+2zRq1znThHQIJkyvGamc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kTp2sEW1ngOAC78g7km0hL86CQTfI3JQqMFTYTKAfheHVaYxYtE8+hsftUpXvQF06fmUAzO5COdeGkVpwkh8d/RW9dBYVclZHSnHuiw40TR59TftNYdHX2lZuzE3FvqA7LGWp1JPAO+xdnc63nZDjwv1SKNc5AeScBycFE4tqJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EkBjTyeM; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EkBjTyeM"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51c10e86e52so117511cf.1
        for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 11:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785003490; cv=none;
        d=google.com; s=arc-20260327;
        b=lKdXnf1e3d35gL8eIjElZqjZ8ku5m/SN+QrF9DtyiQQFWS6xHz6eWRLi2O9ZsvrtTb
         Ll30uulefIYh+hHiHWGWHPhD5Y8KQ8hkpZGWt9gkej4JXUo26PUSfbyLHNKWMK1WoLkL
         QBDlZibLQ9fiNCWQ0VCiHmDbexDi0uDXV1v51Yr07INT0WrehMLnMVbLEZstQykSIR7B
         qZ6wK4RaFGq9S3FpTv41ML9/791S18s0ElxTYcAjjhwGELq/mOnje6aDDU0NcCyV/dYF
         OUDh7YwLC9HkdAjGydxKK2kSMNxQtLBMdiUslC/q217mmNoNKZrZRXqxvN2NuQFMV14J
         KNWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ixVLAHRCO1Q0YANd6J3Qvx5KyOmIXzLJW15kkmWqcs4=;
        fh=ywGxKmRl7gEL4vAZ5xVT5G0LuddIh52Tx6yhs8ZcOQA=;
        b=BGFF0fOWNNF7rWFThEK1vyZhB5tlOb6z1fKVQj3rKL5Xz3lvhAvgQn4LKlMWw3Uqyd
         BoAsvxD6iXKA7lBzVfrU6r/pgs+tUKVGRpygDCuGULXEMEI8N2BvFmSmWwaT0tOrOP7F
         laygSFE2jwR0504iCaIPrjbBax89OSMuJ2uiNOpLNjkoTNn86FXasjErQtnVh8xekr6d
         PIWmiZNbzth5Vrpc3ggNsEEYwJ/E2GMNNXkpZ0IOSehBkGpuLWk/EVhT27jnEQtvkyeP
         akOnU2LoLOzt9lgLnK8tTvuZaOPxxZYIDaUwKJ+zNAopqx14TTxYpkf54LulZqh2Fgup
         tN1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785003490; x=1785608290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ixVLAHRCO1Q0YANd6J3Qvx5KyOmIXzLJW15kkmWqcs4=;
        b=EkBjTyeMZ8K6XsZgR6W2fdnUAp135do2KsMrgWdIvmtED1ASibuNLM+vJCuyTFg/BX
         gF3IbeTqriYNK4EvHNFwSA40s6BFkbBNDXaK9wKymM6Vl4BRExcQWx9xeXuUz/dJ6aoC
         7kcggdynpaCDCKF9GMrirjQlOz+xe3IyrZBGgZE3w/JRzNw3r4HobKbVUxV2DcVZXYyo
         qyYugRgCdFZ9+vO2Jb/airKZkq8wtldM97suX35MDJThjl65eToQgX8sZEXg4pKfkg8y
         qxDql4bbBZzsuHGOLC29QlWfNvtF+xi5ZfNFLX2hsmhECLmVK0sQ52ld4tyrdTG/TzZl
         v2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785003490; x=1785608290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ixVLAHRCO1Q0YANd6J3Qvx5KyOmIXzLJW15kkmWqcs4=;
        b=GQuaLZdzQ/KUyBmmsxkvfKH7nK53FLduQa83lBA+UHsq72N66tfOnBB46mUm+3ZOjU
         lK1zNvc0GHc4VTtkbL1DP6ArXBsfuUkd7M8VwDbqqmfOtgZOdez9QNXdbdHfqa9HGaWi
         zGVLlKFcmo+i7jYRoAsrWgIhMkOcZiKMC1agi9UOJkbl5jZYM7e+YnNIVAbznJEbTKSV
         dQ6TFxGidwxOreE3wW35QDSJBqRaGy0ZWELhxUmmbajklfXpTSc4NOx1MMxm8FEQjDOx
         Uwzy8CltrLjlwIwQVH9lU/lMOYwVYCL/1BViHtdgAoDTslsp0uNBmAnLyrjHKkbFmf6N
         KwhA==
X-Forwarded-Encrypted: i=1; AHgh+RqcAUVgSFBMcrfOivF05xzW4aDVz63Vi3fdtIYbI0tZEgdZtF3SRl1M/Am8o59e8kV6AYaYe6ipnfA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Deg6kq0UJDBmpFvxVw/v+gccyghK4GEiJpxq5Mrl1FILQo6e
	s4Ql3jMRc/jnWMOiQRpS09LilzyJ6WByA/Efk3SHnhB9T+VOHR140r2yUURK9vnggOpPasX0Z0D
	CEDw2q0Zz1YcrZ1BrF9HVOMqXmr+Uzl1Sy0Ujb57F
X-Gm-Gg: AR+sD11NtT8Q75c+eu7dluaiV+JmSRQl92x3ABrxqDB/nOSilp0tRV0RwuPu2+kQhKq
	BsZkoCDup9BvZNCf/HnPsxPSwh4Kduz1hAtZiQxr6IXQSDHtYn9hKDsQER4adDeF92XEebnK5vN
	6nuAgK+yek8qhw4wyTLtKz5oIwNrRJCCb7wwuWUYgr8x+lZzmumBd7jnbQ3sStMZNa0v9TSdz/a
	WggZTcD6XDjuiVZrZMoFfpMIsrvlKiwpAkuh5IWYc4KrNFwksvwW4pihiBRU16uFMabRzjz/Ywk
	S/RRHb/Z3Zy+5mnwjBw=
X-Received: by 2002:a05:622a:8c03:b0:517:6010:7c71 with SMTP id
 d75a77b69052e-529a5db7b6dmr14935361cf.4.1785003489862; Sat, 25 Jul 2026
 11:18:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722211517.1898228-1-pratmal@google.com> <20260723000609.95657-1-sj@kernel.org>
In-Reply-To: <20260723000609.95657-1-sj@kernel.org>
From: Pratyush Mallick <pratmal@google.com>
Date: Sat, 25 Jul 2026 11:17:58 -0700
X-Gm-Features: AUfX_mx7laTIppjMuRwceZdhrzpXvPvGAkkLzCUREO5VEIVPMUl2xSPjO0AbX2U
Message-ID: <CALHaPKd_Ytknjg7GFBXeQK8kXvE7DhbyX_een7k5Fti-ahxL0A@mail.gmail.com>
Subject: Re: [PATCH v2] mm/page_reporting: Add page_reporting_delay_ms sysctl
To: SJ Park <sj@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, David Hildenbrand <david@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Greg Thelen <gthelen@google.com>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Why don't you make the lengths of the line and the section title same?
Will fix the RST underline length.

> So it is milliseconds. Why don't you add the unit to the name, like
> page_reporting_delay_ms?
Agreed, I'll rename the sysctl to page_reporting_delay_ms.
Also I think it would better to make this a module param to be consistent
with page_reporting_order.

> Also, coule you elaborate why there is 10 seconds maximum limit? What's t=
he
> problem of having no limit, and why 10 seconds is the reasonable one?
I don't have a strong justification for where the maximum limit should be s=
et.
The value is unsigned int, so it's bounded at UINT_MAX ms (~49.7 days)
So at worst the worker just schedules that far out and reporting
is effectively paused for that window.
I'll drop this in V3.

> Too trivial nit, but, why don't you put the sysctl.h at the end of the li=
st?
Apologies. Will fix this.

> A trivial comment again. Why don't you wrap the above line for 80 columns
> limit? [...] seems most lines of this file is still keeping the 80 column=
s limit?
Apologies. I will fix this as well.

Thanks for the feedback.

Thanks,
Pratyush

On Wed, Jul 22, 2026 at 5:06=E2=80=AFPM SJ Park <sj@kernel.org> wrote:
>
> get_maintainer.pl suggests adding below to the recipients list of this pa=
tch.
> Let me add them.  I show you already Cc-ed David, but with his old email
> address.
>
> - David Hildenbrand <david@kernel.org>
> - Lorenzo Stoakes <ljs@kernel.org>
> - "Liam R. Howlett" <liam@infradead.org>
> - Mike Rapoport <rppt@kernel.org>
> - Jonathan Corbet <corbet@lwn.net>
> - Shuah Khan <skhan@linuxfoundation.org>
> - linux-doc@vger.kernel.org
>
> On Wed, 22 Jul 2026 21:15:17 +0000 pratmal@google.com wrote:
>
> > From: Pratyush Mallick <pratmal@google.com>
> >
> > Currently, the free page reporting daemon uses a hardcoded delay of
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
> > This patch refactors the delay into a dynamically tunable sysctl,
> > /proc/sys/vm/page_reporting_delay_ms, measured in milliseconds. The val=
ue
> > defaults to 2000ms to precisely match the original (2 HZ) behavior.
> >
> > Signed-off-by: Pratyush Mallick <pratmal@google.com>
> > ---
> > v2:
> >  - Documented page_reporting_delay_ms in Documentation/admin-guide/sysc=
tl/vm.rst.
> >  - v1: https://lore.kernel.org/linux-mm/20260722192935.1646848-1-pratma=
l@google.com/T/#u
> > v1: Fixed feedback from RFC.
> >  - Added lower and upper cap to sysctl value.
> >  - Reverted the reordering on page_reporting_delay_ms.
> >  - Dropped the mod_delayed_work() change.
> >  - RFC: https://lore.kernel.org/linux-mm/20260714171456.2350037-1-pratm=
al@google.com/T/#u
> >  Documentation/admin-guide/sysctl/vm.rst | 13 +++++++++++
> >  mm/page_reporting.c                     | 30 ++++++++++++++++++++++---
> >  2 files changed, 40 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/ad=
min-guide/sysctl/vm.rst
> > index b9b0c218bfb4..6efa460b4547 100644
> > --- a/Documentation/admin-guide/sysctl/vm.rst
> > +++ b/Documentation/admin-guide/sysctl/vm.rst
> > @@ -66,6 +66,7 @@ Currently, these files are in /proc/sys/vm:
> >  - overcommit_ratio
> >  - page-cluster
> >  - page_lock_unfairness
> > +- page_reporting_delay
> >  - panic_on_oom
> >  - percpu_pagelist_high_fraction
> >  - stat_interval
> > @@ -896,6 +897,18 @@ stolen from under a waiter. After the lock is stol=
en the number of times
> >  specified in this file (default is 5), the "fair lock handoff" semanti=
cs
> >  will apply, and the waiter will only be awakened if the lock can be ta=
ken.
> >
> > +page_reporting_delay
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Why don't you make the lengths of the line and the section title same?
>
> > +
> > +This value determines the delay in milliseconds between free page
> > +reporting intervals. A lower delay allows aggressive memory
> > +reclamation by returning unused pages to the host quickly, while a
> > +higher delay helps to batch free pages over a longer window, absorbing
> > +allocation/free churn without hypercall and re-fault overhead.
> > +
> > +The default value is 2000 (2 seconds). The minimum allowed value is
> > +0 (immediate reporting) and the maximum allowed value is 10000 (10 sec=
onds).
>
> So it is milliseconds.  Why don't you add the unit to the name, like
> page_reporting_delay_ms?
>
> Also, coule you elaborate why there is 10 seconds maximum limit?  What's =
the
> problem of having no limit, and why 10 seconds is the reasonable one?
>
> > +
> >  panic_on_oom
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > diff --git a/mm/page_reporting.c b/mm/page_reporting.c
> > index 942e84b6908a..805da4bc1101 100644
> > --- a/mm/page_reporting.c
> > +++ b/mm/page_reporting.c
> > @@ -6,6 +6,7 @@
> >  #include <linux/export.h>
> >  #include <linux/module.h>
> >  #include <linux/delay.h>
> > +#include <linux/sysctl.h>
> >  #include <linux/scatterlist.h>
>
> Too trivial nit, but, why don't you put the sysctl.h at the end of the li=
st?
>
> >
> >  #include "page_reporting.h"
> > @@ -47,7 +48,10 @@ MODULE_PARM_DESC(page_reporting_order, "Set page rep=
orting order");
> >   */
> >  EXPORT_SYMBOL_GPL(page_reporting_order);
> >
> > -#define PAGE_REPORTING_DELAY (2 * HZ)
> > +#define PAGE_REPORTING_DELAY_MS_MAX  (10 * MSEC_PER_SEC)
> > +
> > +static unsigned int page_reporting_delay_ms =3D 2 * MSEC_PER_SEC;
> > +static unsigned int page_reporting_delay_ms_max =3D PAGE_REPORTING_DEL=
AY_MS_MAX;
> >  static struct page_reporting_dev_info __rcu *pr_dev_info __read_mostly=
;
> >
> >  enum {
> > @@ -56,6 +60,19 @@ enum {
> >       PAGE_REPORTING_ACTIVE
> >  };
> >
> > +
> > +static struct ctl_table page_reporting_sysctls[] =3D {
> > +     {
> > +             .procname       =3D "page_reporting_delay",
> > +             .data           =3D &page_reporting_delay_ms,
> > +             .maxlen         =3D sizeof(unsigned int),
> > +             .mode           =3D 0644,
> > +             .proc_handler   =3D proc_douintvec_minmax,
> > +             .extra1         =3D SYSCTL_ZERO,
> > +             .extra2         =3D &page_reporting_delay_ms_max,
> > +     },
> > +};
> > +
> >  /* request page reporting */
> >  static void
> >  __page_reporting_request(struct page_reporting_dev_info *prdev)
> > @@ -80,7 +97,7 @@ __page_reporting_request(struct page_reporting_dev_in=
fo *prdev)
> >        * now we are limiting this to running no more than once every
> >        * couple of seconds.
> >        */
> > -     schedule_delayed_work(&prdev->work, PAGE_REPORTING_DELAY);
> > +     schedule_delayed_work(&prdev->work, msecs_to_jiffies(page_reporti=
ng_delay_ms));
> >  }
>
> A trivial comment again.  Why don't you wrap the above line for 80 column=
s
> limit?  I know that's not a hard limit anymore and I show a few lines of =
this
> file already exceeds 80 columns.  But seems most lines of this file is st=
ill
> keeping the 80 columns limit?
>
> >
> >  /* notify prdev of free page reporting request */
> > @@ -340,7 +357,7 @@ static void page_reporting_process(struct work_stru=
ct *work)
> >        */
> >       state =3D atomic_cmpxchg(&prdev->state, state, PAGE_REPORTING_IDL=
E);
> >       if (state =3D=3D PAGE_REPORTING_REQUESTED)
> > -             schedule_delayed_work(&prdev->work, PAGE_REPORTING_DELAY)=
;
> > +             schedule_delayed_work(&prdev->work, msecs_to_jiffies(page=
_reporting_delay_ms));
>
> Ditto.
>
> >  }
> >
> >  static DEFINE_MUTEX(page_reporting_mutex);
> > @@ -416,3 +433,10 @@ void page_reporting_unregister(struct page_reporti=
ng_dev_info *prdev)
> >       mutex_unlock(&page_reporting_mutex);
> >  }
> >  EXPORT_SYMBOL_GPL(page_reporting_unregister);
> > +
> > +static int __init page_reporting_sysctl_init(void)
> > +{
> > +     register_sysctl_init("vm", page_reporting_sysctls);
> > +     return 0;
> > +}
> > +late_initcall(page_reporting_sysctl_init);
> > --
> > 2.55.0.229.g6434b31f56-goog
>
>
> Thanks,
> SJ
