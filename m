Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q28rMezC"
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A50E6BD
	for <linux-doc@vger.kernel.org>; Fri,  8 Dec 2023 10:26:17 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d0b40bb704so10525ad.0
        for <linux-doc@vger.kernel.org>; Fri, 08 Dec 2023 10:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702059977; x=1702664777; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75zio9oghTkUElUZUVPQLES5Kw5emjlawW+mI0eiLfs=;
        b=q28rMezCcPtRMa56QW+O2YFjtrVIezvWd0PlN5IELBdx6Qoc6lBjG+tG8yxKCXTNKm
         qR20DY8hoUu+cIAiUatPbRhg6AuazGWNCvNpp9iGQI/ualX2Vh0X1L/nN9h/FGxBj8iP
         HnS3xS8bdLcTpYuAR0rdGJNLYwVddVtjLnlU48xp0sGJm/pMxUnDgbtT9iKEbH4HRR2b
         GTy3VmMOPKogjYiBEU65GRXtvUoagI7o9QucyUQH2oWBWKL3tCDDYBeseHgpEqMkLlzR
         vl5fuAX/KiWEqzNk1xf67ygRQWkPtsmoUGtcBhLIkcQK79Xz5EuygGHhZUnrOKLvgyH6
         8xZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702059977; x=1702664777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75zio9oghTkUElUZUVPQLES5Kw5emjlawW+mI0eiLfs=;
        b=UD/vqVtE2t9NlAtS/SdVQecR3N311ho0Ke/feK+jUJ30FKUzQZomj0bY1e4DnpvTOf
         tfi15T3sRVcB6O1BBUEZfkrKsrR1uaEzL84wmBZ6XAHki+2/ITie1uWjWTAKaMVS7Oge
         pmsZKDmGTmptKiJ6qRTydKNCLBb9USYoZfB8bQWc7YjGYZFvjJSnMthmj92TCKuX8Cc4
         Q1ccftVuOwu376/I0vjP9Qzd3IHBS+EkZ6eyXtcfBC5h5p4IeNYh4oets6rlYwWT3fKG
         3bfwc9yMNQeBLUKW9jy/DrIDQCz9Z5UXMtNaaq03I9VDpOU1moiHPxWOt6O9wogGYDZ5
         uVDw==
X-Gm-Message-State: AOJu0YwxqNkz+gjtv6zuK5VpwJhh8+ozMasH4+70QyDPkQj5G6LFXcp1
	XWgh1h1DFMif4tYOLtBKUI7WZaENRn1EP6cwgx/uqA==
X-Google-Smtp-Source: AGHT+IG1AfEt/Tw51pB1tsGJgVQsx5i9xByxbif3lqRSlA8jKdPIkrRKdier/oxRIv+d1qmJOHXgkvTs0WvAfHdNXkE=
X-Received: by 2002:a17:903:244f:b0:1cf:9f0e:9524 with SMTP id
 l15-20020a170903244f00b001cf9f0e9524mr175431pls.27.1702059976843; Fri, 08 Dec
 2023 10:26:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201214737.104444-1-tony.luck@intel.com> <20231207195613.153980-1-tony.luck@intel.com>
 <20231207195613.153980-3-tony.luck@intel.com>
In-Reply-To: <20231207195613.153980-3-tony.luck@intel.com>
From: Peter Newman <peternewman@google.com>
Date: Fri, 8 Dec 2023 10:26:06 -0800
Message-ID: <CALPaoCgR5qNsSegKLzg2g2eE8EgQB9vixAdDOryQOr8HQ+CPAw@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] x86/resctrl: Use total bandwidth for mba_MBps
 option when local isn't present
To: Tony Luck <tony.luck@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, x86@kernel.org, 
	Shaopeng Tan <tan.shaopeng@fujitsu.com>, James Morse <james.morse@arm.com>, 
	Jamie Iles <quic_jiles@quicinc.com>, Babu Moger <babu.moger@amd.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 11:56=E2=80=AFAM Tony Luck <tony.luck@intel.com> wro=
te:
>
> On Intel systems the memory bandwidth monitoring events are
> independently enumerated. It is possible for a system to support
> total memory bandwidth monitoring, but not support local bandwidth
> monitoring. On such a system a user could not enable mba_sc mode.
> Users will see this highly unhelpful error message from mount:
>
>  # mount -t resctrl -o mba_MBps resctrl /sys/fs/resctrl
>  mount: /sys/fs/resctrl: wrong fs type, bad option, bad superblock on
>  resctrl, missing codepage or helper program, or other error.
>  dmesg(1) may have more information after failed mount system call.
>
> dmesg(1) does not provide any additional information.
>
> Modify the existing "mba_MBps" mount option to switch to total bandwidth
> monitoring if local monitoring is not available.
>
> Signed-off-by: Tony Luck <tony.luck@intel.com>
> ---
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu=
/resctrl/rdtgroup.c
> index 5f64a0b2597c..7410513db45a 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -2725,6 +2725,8 @@ static int rdt_parse_param(struct fs_context *fc, s=
truct fs_parameter *param)
>                         return -EINVAL;
>                 if (is_mbm_local_enabled())
>                         ctx->enable_mba_mbps_local =3D true;
> +               else if (is_mbm_total_enabled())
> +                       ctx->enable_mba_mbps_total =3D true;
>                 else
>                         return -EINVAL;
>                 return 0;
> --
> 2.41.0
>

Reviewed-by: Peter Newman <peternewman@google.com>
