Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A34D39E6F1
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 15:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404643; cv=pass; b=L91D7rv8Cc/4gmRnT5gwuJTfj7muZeDiHYdtymUB824cklXQ5vgNN82zo2aQieb8Rj/QyKhwndSKOwJMeHgWYDX9vU8ziOaDkGAvxkGoGVoxps1XMddqolZr13i4twkVMHb6ut+26cqOZcbEqy7TK8yZieOpTJb99nLo7ko7LS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404643; c=relaxed/simple;
	bh=Wg7Ra893cXvrmX+cOKXGmKrYj1ftPIN+PQy9MIM9+iQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJlgPQzZIY8HxqXbXONO9xPT+YyrZ7czKFJ/oGmI09tAVPWKPbS0/e4BZ38K2j38aLSeDNbLU66xsnWNS1C38eNQmrwb686QsfVcEjP3N7LCcy+gtgzYVtNOP7/et494Vxcs8NFHVZ0gs7hmTpEn9Agnb7qjaYATsFEMXF/t7KA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MoVphDQg; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MoVphDQg"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-501511aa012so171501cf.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 07:30:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768404640; cv=none;
        d=google.com; s=arc-20240605;
        b=KIF0CuzR/O1j0WUw77VQ/QZJziQs4hEr3IAv4Sx5ZFoGpELhTOqsPFbdImivDaZPEc
         DbAbMPSIfXDtnRDHksdoXULBUAV3ltCfKiG6q1ruUIOV7yrUdJYVhYlvT1Jq7lmnzCtT
         +5jC6T1FoxCM5A4hjRXEyKIwOKEl4sQjEPQnz9TyXzLFtRwpV2/N4tcEgdqqNd1vpxGH
         nUStp9dpU3eh4HYYEgXKPShbDMYHW0wMhkQW/SAvnRk+iWAsLAok/UaUyPURVrCED0wM
         vRlqStROQyU0vZPdHaL3Cz2+7TOxkawP42LIv2Vz+JLLCsN2MlbIHUzZieERDc914RqL
         CxJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LHI4NLCuinMSMqSID/uXnOXOA3QVWgmhvFfo1463h8g=;
        fh=/t4jiz2lh5oXEZRXTWXoB8BWm0uYdz93CBhBCAbJg1k=;
        b=f0hVLC61EsKG3FkJ4CWWBnrSP8Jx6JeGKKYmFgemdxzbW+/Ki7HffCE4BITyHpCBcF
         cjtc1oGPxuQrd60DqTIMGEZDnhz5Jl/Z22bXtnXPkafscI4A954TvfZP/dZsB9J0uZYl
         9y04GGydWZNUxtHCbWuYEWvv2MDt2tzEEXmIuoSn+uHG2f5e9xZ1LSvsvE7yXVUzoTsj
         25hfI7OeOKBdcVNBrAY+0aIeBQJoI1uk0qfqbexMixDnSMKr8b7r0hLLcHwwRwQLwWve
         xcLia90ZwpudkTxFxedyz09lsHafz47r7uWaRqCc+l5e97Xx6O0QE0LcQhpH8LYZy8EY
         bLng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768404640; x=1769009440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LHI4NLCuinMSMqSID/uXnOXOA3QVWgmhvFfo1463h8g=;
        b=MoVphDQgLeOz7k45gYpOU0GiUpB60zsJ1ZOWIGxyVDwQbvTUfS+Y4dW5t/pp/Mbuyu
         LYxTHCBYu7ksR1wqC1LURtdOd2jldCJfGzrOMzq8FpcsQLJ1oc/kfL9rQCrPgj/eLjLo
         mD+S5RsqwyuoirGf/uAb50JGqIdu+j1ltlxA0AvDUmOZiQd+gJ6HdfxqINurTxFm+XfG
         b8p9p56vqv0y8ezDox9NXbIRIcaHpz/UdmWnqw8OEk9d5bkjhXU+4LfB5fD1D1Y7HGKu
         WY9KzK2i/SjvhWc+D4JSxYYQsxb2/uLsk3pWYW5sqC8B5ns3HEUv8u0yHfXa7phZgQqg
         Jn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404640; x=1769009440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LHI4NLCuinMSMqSID/uXnOXOA3QVWgmhvFfo1463h8g=;
        b=e/n7dJb8dHw0pCTgyRefHuaFyBnKkQ9QWbppN9fzoSMQpIgVLvISA1Ts8iITiGfSZc
         TX+dupkINsDPC6nd+DtKoRGYWD20LzgCUmCA/4xS0+GdcjGJX8ASnF8xlAIn2XMn62Ry
         vr8jtYXovrEvc0D6LHcABTd5atWtygcRGw86/FsVFYKtZ1tZpsdMNjM310kW2K7sYvVr
         voQ7Eu5NHEweNfuKzJPqwnKCDXnzS1dUdWFzEw9fKc4GBF4qR2WiF7m7AWHaSdzuaq2D
         LANdJxkFGxoO6gPcomKM+5y6kSW9yzj7Rg2F278XLDP+kkzr5W32gESNTu0t+Sa/5IUa
         HgcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc719pyfDkncvuPlFtcRO25xY1wXQtZjex1pFkekLdhLY1Jmz3mi9wB2iyhqh7zzPoBhbnO94slHE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoMYefe+pl+YdQdS+eZtVEYRAmFECG4S4M5NiltYm90vMVHbef
	WgxDKhrEEAXD7b9AJ35x1jQJXWbtzjVdYpOLQY+FfRrnHeCGSJiXdsgty7hCZW88wQQXrCp6EM/
	7dxaIECTT64QrVMLrQjb2RzRNi/Rcg68UAs8FLTX2
X-Gm-Gg: AY/fxX5CjV0xt3Qr3QVJjsCSJ0zcyp+8apPy3cfrCvp7r4Q4CkPTngUddS7jK6a0Hh3
	8LrdnsDBwG6JYjhs75Ui7Kn8scEAeOoiqyaumVUd0jqJLeEscZs9kxSJ4crz8QJzz9+NCYpNeB3
	L0QHpc35FcZj2LZBQNoHE5ledEwWneW3iCx96oJloO7CYozZpUsY/FO86wt2eEvIPpg+O6Frf5S
	8X4XDMZHHubtf5DdKgYa8L3DXXXAz1kZG8llE0wX8B5Bt3lulrUNhCen/tUmRXNMpstWnF9D2/Y
	Nnemqnq4zK9f6fU2DJgGO+1wbg==
X-Received: by 2002:ac8:7d44:0:b0:4ed:ff79:e678 with SMTP id
 d75a77b69052e-5014826ed12mr12371711cf.18.1768404639804; Wed, 14 Jan 2026
 07:30:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJuCfpFTJUowSAjNum1zecDJYuyUi84vUNkoNNf=CnUwpsTVeg@mail.gmail.com>
 <20260114072507.163364-1-ranxiaokai627@163.com>
In-Reply-To: <20260114072507.163364-1-ranxiaokai627@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 14 Jan 2026 07:30:28 -0800
X-Gm-Features: AZwV_Qg3oxN8zwRkmODCQEHZCf-5rb3Om5ZoPZ21CjCRt6TeEP_vWdO9jDrUyNU
Message-ID: <CAJuCfpHaHa=g35jVrB+NL6xwh266ohNv7GUekZxPU0qsribJwg@mail.gmail.com>
Subject: Re: [PATCH] alloc_tag: remove sysctl prefix from mem_profiling boot parameter
To: ranxiaokai627@163.com
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, corbet@lwn.net, 
	david@kernel.org, kent.overstreet@linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
	mhocko@suse.com, ran.xiaokai@zte.com.cn, rppt@kernel.org, vbabka@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 11:25=E2=80=AFPM <ranxiaokai627@163.com> wrote:
>
> >On Mon, Jan 12, 2026 at 7:50=E2=80=AFPM Kent Overstreet
> ><kent.overstreet@linux.dev> wrote:
> >>
> >> On Tue, Jan 13, 2026 at 03:27:35AM +0000, ranxiaokai627@163.com wrote:
> >> > >On Fri, Jan 09, 2026 at 06:24:19AM +0000, ranxiaokai627@163.com wro=
te:
> >> > >> From: Ran Xiaokai <ran.xiaokai@zte.com.cn>
> >> > >>
> >> > >> Boot parameters prefixed with "sysctl." are processed separately
> >> > >> during the final stage of system initialization via kernel_init()=
->
> >> > >> do_sysctl_args(). Since mem_profiling support should be parsed
> >> > >> in early boot stage, it is unsuitable for centralized handling
> >> > >> in do_sysctl_args().
> >> > >> Also, when CONFIG_MEM_ALLOC_PROFILING_DEBUG is enabled,
> >> > >> the sysctl.vm.mem_profiling entry is not writable and will cause
> >> > >> a warning. To prevent duplicate processing of sysctl.vm.mem_profi=
ling,
> >> > >> rename the boot parameter to "mem_profiling".
> >> > >>
> >> > >> Signed-off-by: Ran Xiaokai <ran.xiaokai@zte.com.cn>
> >> > >
> >> > >How was this observed/detected?
> >> >
> >> > Actually no kernel bug or funtional defect was observed through test=
ing.
> >> > Via code reading, i found after commit [1],
> >> > boot parameters prefixed with sysctl is processed redundantly.
> >
> >I was able to reproduce the warning by enabling
> >CONFIG_MEM_ALLOC_PROFILING,
> >CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT,
> >CONFIG_MEM_ALLOC_PROFILING_DEBUG, CONFIG_SYSCTL and setting
> >CONFIG_CMDLINE=3D"1".
> >The fix I posted eliminates that warning. Ran, you can post my
> >suggestion yourself with me as Suggested-by or I can post it with you
> >as Reported-by. Let me know your preference.
>
> I think this version is better.
>
> [PATCH] alloc_tag: fix rw permission issue when handling boot parameter
>
> Boot parameters prefixed with "sysctl." are processed
> during the final stage of system initialization via kernel_init()->
> do_sysctl_args(). When CONFIG_MEM_ALLOC_PROFILING_DEBUG is enabled,
> the sysctl.vm.mem_profiling entry is not writable and will cause
> a warning.
>
> Before run_init_process(), system initialization executes in kernel
> thread context. Use current->mm to distinguish sysctl writes during
> do_sysctl_args() from user-space triggered ones.
>
> And when the proc_handler is from do_sysctl_args(), always return success
> because the same value was already set by setup_early_mem_profiling()
> and this eliminates a permission denied warning.
>
> Signed-off-by: Ran Xiaokai <ran.xiaokai@zte.com.cn>
> Suggested-by: Suren Baghdasaryan <surenb@google.

Please fix the above tag, it should end with ">" instead of "." and
send a v2 as a separate email, not a reply to the original thread.
Otherwise LGTM. Feel free to add:

Acked-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  lib/alloc_tag.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index 846a5b5b44a4..00ae4673a271 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -776,8 +776,22 @@ EXPORT_SYMBOL(page_alloc_tagging_ops);
>  static int proc_mem_profiling_handler(const struct ctl_table *table, int=
 write,
>                                       void *buffer, size_t *lenp, loff_t =
*ppos)
>  {
> -       if (!mem_profiling_support && write)
> -               return -EINVAL;
> +       if (write) {
> +               /*
> +                * Call from do_sysctl_args() which is a no-op since the =
same
> +                * value was already set by setup_early_mem_profiling.
> +                * Return success to avoid warnings from do_sysctl_args()=
.
> +                */
> +               if (!current->mm)
> +                       return 0;
> +
> +#ifdef CONFIG_MEM_ALLOC_PROFILING_DEBUG
> +               /* User can't toggle profiling while debugging */
> +               return -EACCES;
> +#endif
> +               if (!mem_profiling_support)
> +                       return -EINVAL;
> +       }
>
>         return proc_do_static_key(table, write, buffer, lenp, ppos);
>  }
> @@ -787,11 +801,7 @@ static const struct ctl_table memory_allocation_prof=
iling_sysctls[] =3D {
>         {
>                 .procname       =3D "mem_profiling",
>                 .data           =3D &mem_alloc_profiling_key,
> -#ifdef CONFIG_MEM_ALLOC_PROFILING_DEBUG
> -               .mode           =3D 0444,
> -#else
>                 .mode           =3D 0644,
> -#endif
>                 .proc_handler   =3D proc_mem_profiling_handler,
>         },
>  };
> --
> 2.25.1
>
>
> >> When bcachefs was in the kernel, I spent an inordinate amount of time =
in
> >> code reviews trying to convince people that yes, they really do need t=
o
> >> be testing their code.
> >>
> >> Strangely enough, I have never had this issue with project contributor=
s
> >> who did not come to the project by way of the kernel community... :)
>
