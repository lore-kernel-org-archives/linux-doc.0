Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BF21DA23
	for <linux-doc@vger.kernel.org>; Fri, 15 Nov 2024 13:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731678832; cv=none; b=mDhPhpHVryH593eXqhCnCTAvN4kdU17cpeo7gpHSZFvRQDWP0afU88DACEwBcd0Y4HPtzoJl4mAy3uE+8ge7Xv3Or/CgEqF/10AtmSz1Js+wPfkuSPxslud0a8hqwZoyZxartBR7GFAhOq9T4FH/CLO+PAQytKNpQBg6LkiCvoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731678832; c=relaxed/simple;
	bh=4qumaI7ptH00McolFCVEKnaTAY+7DPmWzG7P062ShR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rEElTj/n5vP8njE70KHUQJAEHZ9B0L5CPipbH+GatabaMbItFGYspClzU7ZE3r3tOmLvfyDmuPxWf7mDXpy7O3FT1TPPvtL7O5F6ljcrhyDleEzJM7aGqUtW7bx0hHizhXV44dkwnKAKTg/OHPMj8xip/ISjMQc+M5DNVyQX5WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kOycL75T; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kOycL75T"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53b34ed38easo1863001e87.0
        for <linux-doc@vger.kernel.org>; Fri, 15 Nov 2024 05:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731678829; x=1732283629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0Zrfl7hfIDnjLVKBKJHLo1lv4aBeXmkkwaBhD0FEIQ=;
        b=kOycL75TdlaqbSaly3EPb8lgMleURVf3tfK4VIsmOzHqpoV9LowvWpYi/IEx3BVMNG
         8GK2TGDkL3tt+oGErGIl9cdKHceaM682tQAtYlK+K7ATVBbybt8TapuDtTAnSR1/D+61
         YaJ7w+uWVLBB6s+vAP2DNQXAsd/X9SF6/hmYQZOaXEk98nXhWo5A+fOZEZmvMyhBTwpj
         fsIzpcuTCsnEuveTXtHYpMVnHpao2740WRorZBETsenesp3618Q95x/uwU3bkVMIjPg+
         7XQV5Ja2qJyU7SCim2E/gbxIyCyeuj/tctSqj0v/RuH0QhscFqBAjfrM4aianljMg0gd
         395Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731678829; x=1732283629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0Zrfl7hfIDnjLVKBKJHLo1lv4aBeXmkkwaBhD0FEIQ=;
        b=O/SM6Jk4abr11cPLoKRHorzcEbcnaceJw+vfpRr2uJS7lv5av6U7k5G9HHVaSLK87q
         +jH25E3LN94Dn4tGNGbpOTBHZWlgBKHwMLgSqKx/YrJHR9dEIHN7aL30qOp2oVV3uuOF
         zfUSGBFituHPxsLb1dh/Nnrgan+CzWyRR8GvKa7eZolPx913Ns1gCZOOEEh7FL6UmQps
         W25ENTsL0Y5sFTrGaPAYhCV1/taxTpJavaKZCzi+P4ngaPJYIud6U7Z039nV+XQcgS5D
         zjKhBxvGZig77j+x4ITIL9UYvZNA+pnhrJVard8d0gH1TkciLIiSmhq+vuRgkWSJW9ZX
         Nkvg==
X-Forwarded-Encrypted: i=1; AJvYcCXIpgpedUhe8ZI2fW7OFvFH3+L8sqEAxi+pC7AfVKDi9HkbbZ5si2BxFTOtj/f4obuRN67PxqMiCao=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkBXW6h30cRzBcWRKJxowWbMBqpFkugjWKegiytDloUh03zbIB
	HfHC8C8yUGJHC02+hY3djRLD496Ky0VlZ3OptJa4ojmsP6xI38YQK4FXUP82zDRoZA8wwfwepbK
	MfBlSD/zi5Nw72u3Z5KTNV9r+DVYGt98V0vFD
X-Google-Smtp-Source: AGHT+IE5r1M8lPK23nhZrFSkC0KnHUFhExjhrYeKILxAVz++Uu1eERvaqetOP5p6iE0686w8MVDqLqhr2kQswQHInhw=
X-Received: by 2002:a05:6512:3b23:b0:53d:9ff8:ea08 with SMTP id
 2adb3069b0e04-53dab2a0776mr1451926e87.16.1731678828533; Fri, 15 Nov 2024
 05:53:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114001712.80315-1-tony.luck@intel.com> <20241114001712.80315-5-tony.luck@intel.com>
In-Reply-To: <20241114001712.80315-5-tony.luck@intel.com>
From: Peter Newman <peternewman@google.com>
Date: Fri, 15 Nov 2024 14:53:37 +0100
Message-ID: <CALPaoCgFRFgQqG00Uc0GhMHK47bsbtFw6Bxy5O9A_HeYmGa5sA@mail.gmail.com>
Subject: Re: [PATCH v9 4/9] x86/resctrl: Compute memory bandwidth for all
 supported events
To: Tony Luck <tony.luck@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org, James Morse <james.morse@arm.com>, 
	Jamie Iles <quic_jiles@quicinc.com>, Babu Moger <babu.moger@amd.com>, 
	Randy Dunlap <rdunlap@infradead.org>, "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tony,

On Thu, Nov 14, 2024 at 1:17=E2=80=AFAM Tony Luck <tony.luck@intel.com> wro=
te:
>
> Computing the bandwidth for an event is cheap, and only done once
> per second. Doing so simplifies switching between events and allows
> choosing different events per ctrl_mon group.
>
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Tony Luck <tony.luck@intel.com>
> ---
>  arch/x86/kernel/cpu/resctrl/monitor.c | 72 ++++++++++++---------------
>  1 file changed, 33 insertions(+), 39 deletions(-)
>
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/=
resctrl/monitor.c
> index 2176e355e864..da4ae21350c8 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -663,9 +663,12 @@ static int __mon_event_count(u32 closid, u32 rmid, s=
truct rmid_read *rr)
>   */
>  static void mbm_bw_count(u32 closid, u32 rmid, struct rmid_read *rr)
>  {
> -       u32 idx =3D resctrl_arch_rmid_idx_encode(closid, rmid);
> -       struct mbm_state *m =3D &rr->d->mbm_local[idx];
>         u64 cur_bw, bytes, cur_bytes;
> +       struct mbm_state *m;
> +
> +       m =3D get_mbm_state(rr->d, closid, rmid, rr->evtid);
> +       if (WARN_ON_ONCE(!m))
> +               return;
>
>         cur_bytes =3D rr->val;
>         bytes =3D cur_bytes - m->prev_bw_bytes;
> @@ -826,54 +829,45 @@ static void update_mba_bw(struct rdtgroup *rgrp, st=
ruct rdt_mon_domain *dom_mbm)
>         resctrl_arch_update_one(r_mba, dom_mba, closid, CDP_NONE, new_msr=
_val);
>  }
>
> -static void mbm_update(struct rdt_resource *r, struct rdt_mon_domain *d,
> -                      u32 closid, u32 rmid)
> +static void mbm_update_one_event(struct rdt_resource *r, struct rdt_mon_=
domain *d,
> +                                u32 closid, u32 rmid, enum resctrl_event=
_id evtid)
>  {
>         struct rmid_read rr =3D {0};
>
>         rr.r =3D r;
>         rr.d =3D d;
> +       rr.evtid =3D evtid;
> +       rr.arch_mon_ctx =3D resctrl_arch_mon_ctx_alloc(rr.r, rr.evtid);
> +       if (IS_ERR(rr.arch_mon_ctx)) {
> +               pr_warn_ratelimited("Failed to allocate monitor context: =
%ld",
> +                                   PTR_ERR(rr.arch_mon_ctx));
> +               return;
> +       }
> +
> +       __mon_event_count(closid, rmid, &rr);
>
>         /*
> -        * This is protected from concurrent reads from user
> -        * as both the user and we hold the global mutex.
> +        * If the software controller is enabled, compute the
> +        * bandwidth for this event id.
>          */
> -       if (is_mbm_total_enabled()) {
> -               rr.evtid =3D QOS_L3_MBM_TOTAL_EVENT_ID;
> -               rr.val =3D 0;
> -               rr.arch_mon_ctx =3D resctrl_arch_mon_ctx_alloc(rr.r, rr.e=
vtid);
> -               if (IS_ERR(rr.arch_mon_ctx)) {
> -                       pr_warn_ratelimited("Failed to allocate monitor c=
ontext: %ld",
> -                                           PTR_ERR(rr.arch_mon_ctx));
> -                       return;
> -               }
> -
> -               __mon_event_count(closid, rmid, &rr);
> +       if (is_mba_sc(NULL))
> +               mbm_bw_count(closid, rmid, &rr);
>
> -               resctrl_arch_mon_ctx_free(rr.r, rr.evtid, rr.arch_mon_ctx=
);
> -       }
> -       if (is_mbm_local_enabled()) {
> -               rr.evtid =3D QOS_L3_MBM_LOCAL_EVENT_ID;
> -               rr.val =3D 0;
> -               rr.arch_mon_ctx =3D resctrl_arch_mon_ctx_alloc(rr.r, rr.e=
vtid);
> -               if (IS_ERR(rr.arch_mon_ctx)) {
> -                       pr_warn_ratelimited("Failed to allocate monitor c=
ontext: %ld",
> -                                           PTR_ERR(rr.arch_mon_ctx));
> -                       return;
> -               }
> -
> -               __mon_event_count(closid, rmid, &rr);
> +       resctrl_arch_mon_ctx_free(rr.r, rr.evtid, rr.arch_mon_ctx);
> +}
>
> -               /*
> -                * Call the MBA software controller only for the
> -                * control groups and when user has enabled
> -                * the software controller explicitly.
> -                */
> -               if (is_mba_sc(NULL))
> -                       mbm_bw_count(closid, rmid, &rr);
> +static void mbm_update(struct rdt_resource *r, struct rdt_mon_domain *d,
> +                      u32 closid, u32 rmid)
> +{
> +       /*
> +        * This is protected from concurrent reads from user
> +        * as both the user and we hold the global mutex.
> +        */
> +       if (is_mbm_total_enabled())
> +               mbm_update_one_event(r, d, closid, rmid, QOS_L3_MBM_TOTAL=
_EVENT_ID);
>
> -               resctrl_arch_mon_ctx_free(rr.r, rr.evtid, rr.arch_mon_ctx=
);
> -       }
> +       if (is_mbm_local_enabled())
> +               mbm_update_one_event(r, d, closid, rmid, QOS_L3_MBM_LOCAL=
_EVENT_ID);
>  }
>
>  /*
> --
> 2.47.0
>

I experimented with all-groups, per-domain counter aggregation files
prototype using this change as a starting point.

I'm happy to report that the values reported looked fairly reasonable.

Tested-by: Peter Newman <peternewman@google.com>

I also did a quick experiment to see how close to 1 second apart the
readings were:

@@ -664,6 +664,7 @@ static int __mon_event_count(u32 closid, u32 rmid,
struct rmid_read *rr)
 static void mbm_bw_count(u32 closid, u32 rmid, struct rmid_read *rr)
 {
        u64 cur_bw, bytes, cur_bytes;
        struct mbm_state *m;
+       u64 ts;

        m =3D get_mbm_state(rr->d, closid, rmid, rr->evtid);
@@ -680,6 +681,10 @@ static void mbm_bw_count(u32 closid, u32 rmid,
struct rmid_read *rr)
        cur_bw =3D bytes / SZ_1M;

        m->prev_bw =3D cur_bw;
+
+       ts =3D jiffies;
+       m->latency =3D ts - m->last_update_jiffies;
+       m->last_update_jiffies =3D ts;
 }

On an AMD EPYC 7B12 64-Core Processor, I saw a consistent 1.021-1.026
second period. Is this enough error that you would want to divide by
the actual period instead of assuming a denominator of 1 exactly?
We're mainly concerned with the relative bandwidth of jobs, so this
error isn't much concern as long as it doesn't favor any group.

The only thing I'd worry about is if the user is using setitimer() to
keep a consistent 1 second period for reading the bandwidth rate, the
window of the resctrl updates would drift away from the userspace
consumer over time.

Thanks!
-Peter
