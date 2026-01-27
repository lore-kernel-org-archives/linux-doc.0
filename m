Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F12032F747
	for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 20:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769545068; cv=none; b=rd5pp2flxOOXuzSITOpg421pbpRv1CY/ZqO7qprEHP8egToWefXzn2ETAgGfQ9g5o0BcE+qInDNHZszSmwe2IhBHi9XM7rhmaoIaTpswZNjBQLaaenaYJGa+7KXL83WBLB5Lr+XD34m21G8bpqDhk8K+5uVDHJonqcgnZPJpvJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769545068; c=relaxed/simple;
	bh=a33Hqp1gxCbHs3ozHKcUQHsfvseir6CgyC/3r5RJM6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dwdu1Ss8SowfYdPtayQ0+78y2SRH+x9iSdgCGCujMemOXWLbvyq8oX0f58aQ7lI//7TFBSAJ9n4/ZJAKqaNIm9mdE1IkZb8tKjL7m3LtQS+oRAjgsbPjVuPs/NcgZe7qcDhtv07/r9P66LlOri3DHjbjxPxg6/QSmLro6bql5T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nw3yWgHy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nw3yWgHy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE34C116C6
	for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 20:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769545067;
	bh=a33Hqp1gxCbHs3ozHKcUQHsfvseir6CgyC/3r5RJM6I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nw3yWgHyzslUWO31fG8tyWF8HSNP6kfBov7h/YP4DTGsmiP7vXeEs3ZA6WLxnZ83V
	 pl/A7AiHUb3PtenajNdiSKXRDutlqjqURqIDFme29dzXkuuGmxu7JN3uF1jktGbark
	 7N4UVJAgHp+20lhrHWoq7Z+74IrYr8CIXNaLal58qYNTpO/jJAacTiQ01rfVtAAoQO
	 /8CRrnfrYfkAA5vZO+9uB8wSzv1+BfBysA8MkGypor6MG7T/V9ZXcmOg0mPqKf2bun
	 C6Dw4qu0adtBoCgWI5HAwIZ9y8JhBjgfcoDmkX7H42IKnLXtBzQ35eHogydEoddw8s
	 FtA39LGOfHPLg==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-662f9aeb782so132858eaf.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 12:17:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXIRJ/VMxe2M+MkyTVSIj88UDMCM/vmXFci04rjGf4Dc2WoaEGXAGrVgNonTl4oc+eeA5MAvEEoOoc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0bfE3MmT/1VeDcIT0lO8fjHQlOits50WJcGDkv4K5CO0a+635
	NjxLP825MZV9Yce4E2XiREOTNqRQE/IvwBnJzObEKKHQSB9GSHEckULklf9Nm1xIqlv63PXyh6v
	dtx6E9iI4uSxFrJq7JamVgGAPrgn8ev4=
X-Received: by 2002:a4a:cf16:0:b0:662:f6b4:8c4e with SMTP id
 006d021491bc7-662f6b48e48mr773192eaf.80.1769545062036; Tue, 27 Jan 2026
 12:17:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120145623.2959636-1-sumitg@nvidia.com> <20260120145623.2959636-2-sumitg@nvidia.com>
 <CAJZ5v0ipgGt7tetY6p0CW0jyOh9TVeWxgXpFzveTa2CaGB8ZpA@mail.gmail.com> <6be02e54-dd4a-4d8f-b2ee-291da63b0bf2@nvidia.com>
In-Reply-To: <6be02e54-dd4a-4d8f-b2ee-291da63b0bf2@nvidia.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 27 Jan 2026 21:17:31 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0j8Z3dUZUuUUZPiGthN7yg03yDpWARGJLE8U2fCeUK8Qw@mail.gmail.com>
X-Gm-Features: AZwV_QhFFimFgohPagii-2LtTrRkBzebBcIWZn4w-qFlB50tTtELmDGXQrkWWSI
Message-ID: <CAJZ5v0j8Z3dUZUuUUZPiGthN7yg03yDpWARGJLE8U2fCeUK8Qw@mail.gmail.com>
Subject: Re: [PATCH v6 1/9] cpufreq: CPPC: Add generic helpers for sysfs show/store
To: Sumit Gupta <sumitg@nvidia.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, viresh.kumar@linaro.org, pierre.gondois@arm.com, 
	zhenglifeng1@huawei.com, ionela.voinescu@arm.com, lenb@kernel.org, 
	robert.moore@intel.com, corbet@lwn.net, rdunlap@infradead.org, 
	ray.huang@amd.com, gautham.shenoy@amd.com, mario.limonciello@amd.com, 
	perry.yuan@amd.com, zhanjie9@hisilicon.com, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org, 
	acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, treding@nvidia.com, jonathanh@nvidia.com, 
	vsethi@nvidia.com, ksitaraman@nvidia.com, sanjayc@nvidia.com, 
	nhartman@nvidia.com, bbasu@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 8:01=E2=80=AFPM Sumit Gupta <sumitg@nvidia.com> wro=
te:
>
>
> On 27/01/26 21:54, Rafael J. Wysocki wrote:
> > External email: Use caution opening links or attachments
> >
> >
> > On Tue, Jan 20, 2026 at 3:57=E2=80=AFPM Sumit Gupta <sumitg@nvidia.com>=
 wrote:
> >> Add generic helper functions for u64 sysfs attributes that follow the
> >> common pattern of calling CPPC get/set APIs:
> >> - cppc_cpufreq_sysfs_show_u64(): reads value and handles -EOPNOTSUPP
> >> - cppc_cpufreq_sysfs_store_u64(): parses input and calls set function
> >>
> >> Add CPPC_CPUFREQ_ATTR_RW_U64() macro to generate show/store functions
> >> using these helpers, reducing boilerplate for simple attributes.
> >>
> >> Convert auto_act_window and energy_performance_preference_val to use
> >> the new macro.
> >>
> >> No functional changes.
> >>
> >> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> >> ---
> >>   drivers/cpufreq/cppc_cpufreq.c | 69 ++++++++++++--------------------=
--
> >>   1 file changed, 25 insertions(+), 44 deletions(-)
> >>
> >> diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpu=
freq.c
> >> index 36e8a75a37f1..c95dcd7719c3 100644
> >> --- a/drivers/cpufreq/cppc_cpufreq.c
> >> +++ b/drivers/cpufreq/cppc_cpufreq.c
> >> @@ -863,73 +863,54 @@ static ssize_t store_auto_select(struct cpufreq_=
policy *policy,
> >>          return count;
> >>   }
> >>
> >> -static ssize_t show_auto_act_window(struct cpufreq_policy *policy, ch=
ar *buf)
> >> +static ssize_t cppc_cpufreq_sysfs_show_u64(unsigned int cpu,
> >> +                                          int (*get_func)(int, u64 *)=
,
> >> +                                          char *buf)
> >>   {
> >>          u64 val;
> >> -       int ret;
> >> -
> >> -       ret =3D cppc_get_auto_act_window(policy->cpu, &val);
> >> +       int ret =3D get_func((int)cpu, &val);
> >>
> >> -       /* show "<unsupported>" when this register is not supported by=
 cpc */
> >>          if (ret =3D=3D -EOPNOTSUPP)
> >>                  return sysfs_emit(buf, "<unsupported>\n");
> >> -
> >>          if (ret)
> >>                  return ret;
> >>
> >>          return sysfs_emit(buf, "%llu\n", val);
> >>   }
> >>
> >> -static ssize_t store_auto_act_window(struct cpufreq_policy *policy,
> >> -                                    const char *buf, size_t count)
> >> +static ssize_t cppc_cpufreq_sysfs_store_u64(unsigned int cpu,
> >> +                                           int (*set_func)(int, u64),
> >> +                                           const char *buf, size_t co=
unt)
> >>   {
> >> -       u64 usec;
> >> +       u64 val;
> >>          int ret;
> >>
> >> -       ret =3D kstrtou64(buf, 0, &usec);
> >> +       ret =3D kstrtou64(buf, 0, &val);
> >>          if (ret)
> >>                  return ret;
> >>
> >> -       ret =3D cppc_set_auto_act_window(policy->cpu, usec);
> >> -       if (ret)
> >> -               return ret;
> >> +       ret =3D set_func((int)cpu, val);
> >>
> >> -       return count;
> >> +       return ret ? ret : count;
> >>   }
> >>
> >> -static ssize_t show_energy_performance_preference_val(struct cpufreq_=
policy *policy, char *buf)
> >> -{
> >> -       u64 val;
> >> -       int ret;
> >> -
> >> -       ret =3D cppc_get_epp_perf(policy->cpu, &val);
> >> -
> >> -       /* show "<unsupported>" when this register is not supported by=
 cpc */
> >> -       if (ret =3D=3D -EOPNOTSUPP)
> >> -               return sysfs_emit(buf, "<unsupported>\n");
> >> -
> >> -       if (ret)
> >> -               return ret;
> >> -
> >> -       return sysfs_emit(buf, "%llu\n", val);
> >> +#define CPPC_CPUFREQ_ATTR_RW_U64(_name, _get_func, _set_func)        =
  \
> >> +static ssize_t show_##_name(struct cpufreq_policy *policy, char *buf)=
  \
> >> +{                                                                    =
  \
> >> +       return cppc_cpufreq_sysfs_show_u64(policy->cpu, _get_func, buf=
);\
> >> +}                                                                    =
  \
> >> +static ssize_t store_##_name(struct cpufreq_policy *policy,          =
  \
> >> +                            const char *buf, size_t count)           =
  \
> >> +{                                                                    =
  \
> >> +       return cppc_cpufreq_sysfs_store_u64(policy->cpu, _set_func,   =
  \
> >> +                                           buf, count);              =
  \
> >>   }
> >>
> >> -static ssize_t store_energy_performance_preference_val(struct cpufreq=
_policy *policy,
> >> -                                                      const char *buf=
, size_t count)
> >> -{
> >> -       u64 val;
> >> -       int ret;
> >> +CPPC_CPUFREQ_ATTR_RW_U64(auto_act_window, cppc_get_auto_act_window,
> >> +                        cppc_set_auto_act_window)
> >>
> >> -       ret =3D kstrtou64(buf, 0, &val);
> >> -       if (ret)
> >> -               return ret;
> >> -
> >> -       ret =3D cppc_set_epp(policy->cpu, val);
> >> -       if (ret)
> >> -               return ret;
> >> -
> >> -       return count;
> >> -}
> >> +CPPC_CPUFREQ_ATTR_RW_U64(energy_performance_preference_val,
> >> +                        cppc_get_epp_perf, cppc_set_epp)
> >>
> >>   cpufreq_freq_attr_ro(freqdomain_cpus);
> >>   cpufreq_freq_attr_rw(auto_select);
> >> --
> > It looks like this patch could be applied independently of the other
> > patches in the series.
> >
> > Do you want me to do so?
>
> Yes, this patch is independent and can be applied.

Applied as 6.20 material, thanks!
