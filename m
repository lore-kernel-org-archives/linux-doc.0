Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8363B376BD0
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 17:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768237218; cv=pass; b=SsOOaec2meswn3JmNO+mR3jIYcDXW8Vecn8+nDt2M+aTA6aLmfMwrn3dB6R/x496vrkxyGs9TqQlyAzWaa1SNe11J+ggjUyByH4y3mRySb+PZm9c9vm4im7hgZSMQcSvMfm+dBAE5xDQn2TUkwzQLLp13buJVpl/QZjJ/CabfCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768237218; c=relaxed/simple;
	bh=lGUDAyvTaj+GQ9RpVriBlFVnLQ/zNjAchEg+PHcU0w0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s64wFqxi0pHW9yd1dXqnL55vDM+oa7Gru5qbJUFDDwkMaVcYQDUw+mgrWzaXNvR/inq3xlk8tQYZBRj5MV5G9sCf1/bVc92bNhFj9aowDWmsEuD4/PCEvK7bicLm963InczDAqFUxH+O8iAfe30fU7u74Xy95vUtBrL9Hz/OxyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p0TKrcsl; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p0TKrcsl"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ee243b98caso1007991cf.1
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 09:00:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768237215; cv=none;
        d=google.com; s=arc-20240605;
        b=QbeIH02ASNrUzZA+3lxRqh64FvEANxwyjO0oPtp8OdsjyrupMm4zGKNA+vKBdWBXtA
         7XraY4U7Zv8Ib7EogOc+xO9J6Dd2+FiUy5e1wJfoXkIbdAkFiVkvBVt9+1JVjs41UIYC
         lgDLr7oVy9q5buuyWJo1CFlojAjWCCVGZhPX8yHzlx4ZBEsAmVCs5Hawf6hx1jjwexJQ
         ER0bRqJhFY5axM5sm0y3RvvuRdMFwcyfuWZR3wArmW7in42M0yalOlB1z9mJyIAIPy39
         e6TWz3dbIU8GDDi1ZwP/6s0j5MKIo4OWDPibH13q/pdDYPZ3Fvld/gf4AQ7cFlm2oYUT
         moFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=foR6hNjRvW1f03mtiXi331ioQ5S2XdjdkFQrMcL1TXY=;
        fh=C6KrSD8adUoqvQYVaeMFunQ3PjxPk26AwVSgtqY2jOU=;
        b=DDCLhOFsyORMgRqqdltM6chJs+qHY+398U8CRLAGnSuCppK2gT0KK3rsiLWWbb3Ij/
         HhzNGJ7vb69uBk0ZmaBvbivau76QLpk3G/FfsjXp0OBXSbpV1xMQTA9oPbtBPU0pipQz
         nYC7RrGY+v3EYTBx4UBoUlMWlueCIOJ6bgQZa/CZJOBFINEkXV2tQg1dcG0ZEraT/d/a
         CRXfo5qu1tlqnzpONBY/2fobGcd4z1eWHUIbkucw9WGBLAPXP1Zj/R2l//ML8CqvKENU
         YO1K2zCvC28nAkhXJJmeZPdibiXaJCxLBguvw4DLxpIr1U4qXtqAeJBDSILgdut8UNB4
         /oBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768237215; x=1768842015; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foR6hNjRvW1f03mtiXi331ioQ5S2XdjdkFQrMcL1TXY=;
        b=p0TKrcslKs/VuuE2K1uVwwNSQyr+Gd1ZimW36031tH5rcgYpuzYvb+QxDblpYNpkw+
         ENlHvyfELH15wwj7mgCxjACs+7Z3mId7JQbKBqm+5MutG65TaR8/L4l9OlOAe96v6iBH
         h2iLqHn2S6m+gzn/ClgXIZSivtxMd3hpP6v6jana+XoweYcfw2TcNZ7a+iyXI3U6wWhE
         g2HuH1NiWkPMXPeDOwQxu0RL7ZXNtOCwKHrcoagV/eKyVArPWGCc0RKJfVR7BuODSAg5
         Ip8wtalMKjwCBB9esfm3g93vAL0XXrpx4ckoTpNiuCxBuzcYjYA2FOJ79RYokowY5FCF
         CGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768237215; x=1768842015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=foR6hNjRvW1f03mtiXi331ioQ5S2XdjdkFQrMcL1TXY=;
        b=TF2h/bo2KSaeOLUVDFOUb1rWvS0Dhe6FflNqeSJ+b7RKmKB0dlo4ezSGvHTx1MJzGb
         gRll2aS1DQdPMyqNKqVH8LEFvCE6uyB4zkHLzPdXHXifFbAOfGvsVJp217kFaKDEuG5b
         XTTNZz598/aX5pB6tunb5o87iNOW+9fTm1+eQqwuOOGI0+T1cUTk9Wn+NO6HyG1J5Tdz
         rqZQo3TXIDGKB+lMyUdowvoFdK3HFOlnqKtuIIg9AwClq1loAWSVTMGynKStkeBBt9ON
         eXfX/HMj75HMMis0/hciLA2u0JBmjwzdGcxG3pZaDJ2CCrFP1gY5UI4DnwprgZSI4/Tt
         hLoA==
X-Forwarded-Encrypted: i=1; AJvYcCWPhjQPHJ49CpbXkhMK7a8ktoHWB8lqC2g1gdm7MGf7gyHwzEzoXo73lt2wzNwPZsHPuS0f7h/Yeew=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdIyFFgxKJlQl/3TGtEW4vdcOOdMrOuMGFIXREE2RewFGoNJjF
	vlQIQ2wqJXBxXToH135A5ubM4MCbZXy04k5FmIix7J0E1PvpEm6EvIk5UJtLcTNlSemU+IrwcIv
	tgzMlU2qq6JxfwUu1TixsOm8YuyoY2lq9Fi8iE5ra
X-Gm-Gg: AY/fxX6nuI9N6U+Ih1DdeTVbBeM052BME+GsdxFwDvmTRCB6B3nQGl+5M9MjM2W91am
	vkb8az/p3esrJlBMixb1mxHhJLjyaVHLkXgq8HQJnb5h/nBFJvur8cQ85TV+P8SJsM0QrvXWYuy
	lucnUZTPZ0zZfFMAhg13f+3+Ch8hXB9XRYbEbNtD9UphEVeOuFbPd/R1IThlNsWajnd5xksJs3w
	mTR5W6kwl4M7G3+0+gplfNNOicKXVm3zWYV/q6qugMynNu6PGHYq+DTX+d81bSCi9tetwUr+OPX
	XCNC
X-Received: by 2002:a05:622a:1213:b0:4f3:5474:3cb9 with SMTP id
 d75a77b69052e-501183f4374mr20963631cf.14.1768237213719; Mon, 12 Jan 2026
 09:00:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109062419.157284-1-ranxiaokai627@163.com>
 <aWMLQkvushKidjQQ@moria.home.lan> <CAJuCfpGo4wYcMChX_xJJ04pHYKJ8vMPrkN9GFxXhW-1xQEmfiQ@mail.gmail.com>
In-Reply-To: <CAJuCfpGo4wYcMChX_xJJ04pHYKJ8vMPrkN9GFxXhW-1xQEmfiQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 12 Jan 2026 09:00:01 -0800
X-Gm-Features: AZwV_QiFJHurWcb7A73sgj96qzQLR2zt7kbsog28kwSnjsSGuH6xCsTcbR_i9sM
Message-ID: <CAJuCfpGABfhi+KiZ9X1pcjby+YZW+FfMfGgc0pfXvUBN88xdGw@mail.gmail.com>
Subject: Re: [PATCH] alloc_tag: remove sysctl prefix from mem_profiling boot parameter
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: ranxiaokai627@163.com, vbabka@suse.cz, akpm@linux-foundation.org, 
	david@kernel.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, 
	rppt@kernel.org, mhocko@suse.com, corbet@lwn.net, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ran.xiaokai@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 11, 2026 at 11:50=E2=80=AFAM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Sat, Jan 10, 2026 at 6:34=E2=80=AFPM Kent Overstreet
> <kent.overstreet@linux.dev> wrote:
> >
> > On Fri, Jan 09, 2026 at 06:24:19AM +0000, ranxiaokai627@163.com wrote:
> > > From: Ran Xiaokai <ran.xiaokai@zte.com.cn>
> > >
> > > Boot parameters prefixed with "sysctl." are processed separately
> > > during the final stage of system initialization via kernel_init()->
> > > do_sysctl_args(). Since mem_profiling support should be parsed
> > > in early boot stage, it is unsuitable for centralized handling
> > > in do_sysctl_args().
> > > Also, when CONFIG_MEM_ALLOC_PROFILING_DEBUG is enabled,
> > > the sysctl.vm.mem_profiling entry is not writable and will cause
> > > a warning. To prevent duplicate processing of sysctl.vm.mem_profiling=
,
> > > rename the boot parameter to "mem_profiling".
> > >
> > > Signed-off-by: Ran Xiaokai <ran.xiaokai@zte.com.cn>
> >
> > How was this observed/detected?
> >
> > My reading of early_param() would seem to indicate that
> > setup_early_mem_profiling() is getting called at the appropriate time -
> > and then additionally a second time by do_sysctl_args(), which then
> > becomes a noop.
> >
> > So the only bug would seem to be that the sysctl is not writeable in
> > debug mode? There's an easier fix for that one...
>
> Sorry for the delay.
> That's not a bug. We want this sysctrl to be read-only when the debug
> option is enabled. Otherwise if user toggles mem_profiling sysctrl off
> and then on again, all allocations that were made between these events
> will be missing their tags and our debug mechanism will generate
> warnings for each such occurrence when freeing these allocations.
> I'll look closer into this warning. Maybe we can suppress it when the
> read-only sysctrl is already set to the value being assigned to it?

I think the easiest way to fix this warning is to detect when the
modification is being done by do_sysctl_args() and return success, as
it's a no-op anyway (the same value was already assigned via
early_param). Something like this:

 static int proc_mem_profiling_handler(const struct ctl_table *table, int w=
rite,
                                       void *buffer, size_t *lenp, loff_t *=
ppos)
 {
-        if (!mem_profiling_support && write)
-                return -EINVAL;
+        if (write) {
+#ifdef CONFIG_MEM_ALLOC_PROFILING_DEBUG
+                /* User can't toggle profiling while debugging */
+                if (current->mm)
+                        return -EACCES;
+
+                /*
+                 * Call from do_sysctl_args() which is a no-op since the s=
ame
+                 * value was already set by setup_early_mem_profiling.
+                 * Return success to avoid warnings from do_sysctl_args().
+                 */
+                return 0;
+#endif
+                if (!mem_profiling_support)
+                        return -EINVAL;
+        }

         return proc_do_static_key(table, write, buffer, lenp, ppos);
 }
@@ -787,11 +801,7 @@ static const struct ctl_table
memory_allocation_profiling_sysctls[] =3D {
         {
                 .procname        =3D "mem_profiling",
                 .data                =3D &mem_alloc_profiling_key,
-#ifdef CONFIG_MEM_ALLOC_PROFILING_DEBUG
-                .mode                =3D 0444,
-#else
                 .mode                =3D 0644,
-#endif
                 .proc_handler        =3D proc_mem_profiling_handler,
         },
 };

WDYT?
