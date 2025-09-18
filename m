Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BEF23184F
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 10:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758189837; cv=none; b=XuWDFEcRWXmNz8AnYd818Rdth5RPQDnPFwHjLhAnUuZvmdDF3GFWBGy2lX6Ip79DyMgYNI8MvtCdoDwKe0qVmaaE9SwzPIyS7rtuPk4795uhl1CKQm6DOnzskpXWuuYw9SRXuJVqUpE+FUr99a3pzQPYKQS2OJ+Z7FOerMF9vrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758189837; c=relaxed/simple;
	bh=ByoR0cEGZmt0U5yHB5jQZmZ+RqLPgIYZYhgl1JFL/9k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=koGjfoOHNg5IK1EKzURNvNfQ9Q83ikY3ozyz4E94njM6XFNh9HgrKr62Xk1T1+CIpzu+pNtNVaAjrFSYgiNeMNJk9T86F3KRxQDmXr5vF8f69HhLABU2L9Z5Ojj5N6Z+/n25gVVIpYHfUC5lUEhMM/rYcqlm/xsAfBwWFDN+0tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HiemgmDr; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HiemgmDr"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-571a58b385aso1024543e87.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 03:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758189833; x=1758794633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYCwkNUkEu1XT0gLNt7N//elymkdc3M3C0TwfgGszbA=;
        b=HiemgmDriJrtiUc6x6Z7M/ID2tZGsZimBYbrD0//RX01sKzaWuGPBgdlv9jM/mH4J3
         ya50pFzLfthv3sRUyf96wKLHEIkGnB9a2lylgVVoWM0btPWSuXz4IYsK0TwP7fbYaMJh
         2OMhijyZvnXH/hjlNaF3n5K3AOn5pR+xe25RybqlyN1sco3PfXYwLCfUAWCw23vajAI8
         2V9KEyzdLaRRkYCZcnstNsudEkbJJnPJexXJrdrjZfvMvjXqXCgjGFU1iX0kir7nvhJb
         KjhEI+VbF2ifWpQeopxMyrk2rROGU0CFjVCmRm8lEyqgEY+k8at0Zj1NWwf4xcjPZt/I
         WNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189833; x=1758794633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYCwkNUkEu1XT0gLNt7N//elymkdc3M3C0TwfgGszbA=;
        b=QqrhEazWBSym4vInGhQyeETDQ4a0soWMIpiuukhFCC6pY0KSh7OPSGiFKxKlVHfM4G
         gQdtNn5JmRYYOmTz/XWi0wDnhfsihQ+MrXUcGGk590QlkJQWCAQjE3f2zBVxoq12wwyz
         hNUmV/HX9UI0sUdU84wKq1I9dOJWSov1TN9THtitg3fxInyJgtjJNoTtGVoWll/aytER
         q3oVejGP49aoV32oBa2oc2JJLy1BazXty8ftX0dKATvDGXXvfY5XRVsb092+GttWVD9r
         guj8pSEIYPcBbaaq3T5Vp1hyko0kU+Dh/BxEeCGPoF3zOKqr2/DOje6CnHbQ2hpAr1FD
         n1wg==
X-Forwarded-Encrypted: i=1; AJvYcCXDC/1cxMm2T6g+4o3BQsnkyYxsqF0U+AN5ZaX0KozlYwPg9DpOpO0L4p0D1DxoFK03EXcbGALd+tU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcRO/zGJlJ3gdsp7PmbsGWGGfghtfJykaghPdR6RZLSrNVbZss
	WqbIHcl05AeHHXOfkEKa95XP17kjbuClgv8HGTby6FPTRkyfxvbwPshXYh2C7LMfMQHnB5+WMxa
	HRqhr63+S5oj9ijddo3LrLNOLQHlvfiM=
X-Gm-Gg: ASbGncsOkFztVkU2fTX6fANUViOzcPJEsTxKmwe0gjOe/cKtE98EXi+NnW1/3EN26jv
	TiWOoRr6dDX3xRzFEhocXCSBep58ahGG18wfsn4Rwm0Tc82dOg8xW8UXycWv8rT+zJEv/StCwJJ
	7KvFp4Xyl/CSMU0Ze4xlbNZTng8lHi+Ty7H5JwqbAzGO+9L2iHY+HmCO8qfXR9Fma6f4QRYnBkC
	Kik22z7AUZzCDVpiMEOXrLfV/c=
X-Google-Smtp-Source: AGHT+IGWZd43JlKEWN+6I3rADVYp29++tuAbpqU7PxhYsMZJEVGNUvfnGTLsMFkPHV6lU3pTyYHqYCeJcd9azkwT2OY=
X-Received: by 2002:a05:6512:32cc:b0:571:f077:d96f with SMTP id
 2adb3069b0e04-57798756ae8mr1625467e87.37.1758189832455; Thu, 18 Sep 2025
 03:03:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACKMdfmZo0520HqP_4tBDd5UVf8UY7r5CycjbGQu+8tcGge99g@mail.gmail.com>
 <CACYkzJ7X2uU=c7Qd+LUKnQbzSMyypnUu_WCMZ=8eX6ThXn_L6g@mail.gmail.com>
In-Reply-To: <CACYkzJ7X2uU=c7Qd+LUKnQbzSMyypnUu_WCMZ=8eX6ThXn_L6g@mail.gmail.com>
From: Ariel Silver <arielsilver77@gmail.com>
Date: Thu, 18 Sep 2025 13:03:40 +0300
X-Gm-Features: AS18NWC1YY66Iv1oonE3FepE-UmRLhzM1gqFCSI5l7KKoA-asGkp7gFlZKHvA10
Message-ID: <CACKMdfkPsemrUMPXNO5OR9Y2y70xNVVY9ss-3hX9NtGXFJxyQg@mail.gmail.com>
Subject: Re: [PATCH v2] docs/bpf: clarify ret handling in LSM BPF programs
To: KP Singh <kpsingh@kernel.org>
Cc: bpf@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mattbobrowski@google.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, sdf@fomichev.me, haoluo@google.com, 
	jolsa@kernel.org, corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just so I understand.
1) The docs are indeed wrong, correct?
2) Any idea why I get an automatic response of "CONFLICTS" when I send
my patch? Even though im 1000% sure there are no conlicts

On Wed, Sep 17, 2025 at 12:31=E2=80=AFPM KP Singh <kpsingh@kernel.org> wrot=
e:
>
> On Thu, Sep 11, 2025 at 12:52=E2=80=AFPM Ariel Silver <arielsilver77@gmai=
l.com> wrote:
> >
> > v2: Fixed trailing whitespace (reported by checkpatch.pl)
> >
> > Docs currently suggest that all attached BPF LSM programs always run
> > and that ret simply carries the previous return code. In reality,
> > execution stops as soon as one program returns non-zero. This is
> > because call_int_hook() breaks out of the loop when RC !=3D 0, so later
> > programs are not executed.
> >
> > Signed-off-by: arielsilver77@gmail.com <arielsilver77@gmail.com>
> > ---
> >  Documentation/bpf/prog_lsm.rst | 12 ++++--------
> >  1 file changed, 4 insertions(+), 8 deletions(-)
> >
> > diff --git a/Documentation/bpf/prog_lsm.rst b/Documentation/bpf/prog_ls=
m.rst
> > index ad2be02f3..92bfb64c2 100644
> > --- a/Documentation/bpf/prog_lsm.rst
> > +++ b/Documentation/bpf/prog_lsm.rst
> > @@ -66,21 +66,17 @@ example:
> >
> >     SEC("lsm/file_mprotect")
> >     int BPF_PROG(mprotect_audit, struct vm_area_struct *vma,
> > -            unsigned long reqprot, unsigned long prot, int ret)
> > +            unsigned long reqprot, unsigned long prot)
> >     {
> > -       /* ret is the return value from the previous BPF program
> > -        * or 0 if it's the first hook.
> > -        */
> > -       if (ret !=3D 0)
> > -           return ret;
> > -
>
> This is correct as of today, the return value is checked implicitly by
> the generated trampoline and the next program in the chain is only
> called if this is zero as BPF LSM programs use the modify return
> trampoline:
>
> in invoke_bpf_mod_ret:
>
> /* mod_ret prog stored return value into [rbp - 8]. Emit:
> * if (*(u64 *)(rbp - 8) !=3D 0)
> * goto do_fexit;
> */
> /* cmp QWORD PTR [rbp - 0x8], 0x0 */
> EMIT4(0x48, 0x83, 0x7d, 0xf8); EMIT1(0x00);
>
> Acked-by: KP Singh <kpsingh@kernel.org>
