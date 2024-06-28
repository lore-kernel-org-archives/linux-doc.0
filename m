Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF3F155756
	for <linux-doc@vger.kernel.org>; Fri, 28 Jun 2024 17:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719595517; cv=none; b=cvQ+21wsnG5jO5ZV6fJtErSxWYsoTnBoLj9uqQQj0iDzpaZof4SKmHmggkL1/yUMz0vQtw0zKdf1XO2L/anrXUClA9Eyt4EF8gfz/uGy7v8z/bGOKd72iUAi2wETl/Vie7hM+j3rkdNrO6pyWC2RO3HWeLa1oTQxHduy9B8AA04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719595517; c=relaxed/simple;
	bh=kq1fpL86p3CAakLQbNhpZmymFcmjyTTnrGV3h0AgDm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lVys5HjFH/d9bUd8WmNhGNIhgmyGHxqpJrzDQGTIM0DJOtf+HSnMvWF4d8ViQIzocjDkYqB8rV2Lf8xnaM0ANNM2F6xF1p18CMnGP84yxT1gOOjAxprtqi7tDPuK2R6vma84ezFadMGxWxgS9oGLK6Ba2vz0XtOZLjAZCexu6yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=blEU5tDu; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="blEU5tDu"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-362f62ae4c5so516161f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Jun 2024 10:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719595513; x=1720200313; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=caKA1ZLZy4Gxv4ZL6Bf0GGH+gpZqMfFYuX6KpD7fNlo=;
        b=blEU5tDu3IEAyIanTnVhuFKUcTpFJoNUgrSdcBP7RVXUBT7Nv1RIAEc1Afs9qgHWK2
         1jbhpH6b945m1sogPKGsS6wOtpIphtC6itawFslUnWQVF/pIUzArdwLPWAdFGXTFOCvJ
         sOYj1v0DIjWF+mIAXEOWXC6y5rKzRv9v04g2y0Ef3JjDuaGDOh4zgTSfV7Ldc5eSAPXx
         WGCOoIe/6DTe0i5AlRo5vfxBHn+ytaX9QyeZc6z4AxXXoA+0bLj7C5+p56WC/fOQ7zfw
         M6UE8gyseC9jjkWDnRyWQjPNblOo+JiB/tJV2frL77FPr8BeMO6kvAkjoBX9bTN3lUgd
         Nz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719595513; x=1720200313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=caKA1ZLZy4Gxv4ZL6Bf0GGH+gpZqMfFYuX6KpD7fNlo=;
        b=v8RdMLTQX2yEY1mG7NYM3xkFDLd6eyfcBifoMry9aqjxLtIfPwOZpdR/ynVrZR8eu1
         wUsAKHFI7tRY1GaRny2+xe86bMDqCMSJcDzfiFetKYgKEq5sxL0JU6S+hvmn0t4EQwVk
         ThjYSWwXICsM0F6IdIGkZ+Z2JwjQF/MthIJZiZV80W35WkJACGmOpsmiXnqfUlY5Hyyn
         zE3uOweUtG/C5St9jx6NC+FpYLBx9IGhGzBk73l4iyLlJtc4KvqCmbsRmgEyY87RvoPW
         vCdyqTca/7zRxH3IJx9hXthlH4w9MAdAC+Jj3gfYUqnvIuPWk9fhTv2pRbT2zbZyhBC6
         VDLA==
X-Forwarded-Encrypted: i=1; AJvYcCV3nTt9iep3ZzL+ew4MjmyRALqWgXfQA2C7Lidi5xDaNr11C2gAeVkoj5ojP1bck071T/iZbRYtC22weMArwgK45hBrfuhxnWKU
X-Gm-Message-State: AOJu0YwHn68Fye6yaUDjhxHea8Qg8d2672hZHgSXehLkrZMbZhWIpfez
	Q973JhwU2kzu2v6hfm9Iuk+zAmMPNVyCam5f+w5jgeMqHKhJ6L7cScjOD7GULAvc+18GRPGRIzJ
	KScD9QxiaLn/MWOadGD0U50LDiQMN+n2UHFSQ
X-Google-Smtp-Source: AGHT+IHaga+0HZwFoMa7vh1+QWpuNmbt+Pa/Udmt9iDW5i8J5dXuxOLSqkHGx+gHqUzkUgc64qZI0rblrxW0ml7XPRE=
X-Received: by 2002:a5d:648c:0:b0:367:42bc:b2dc with SMTP id
 ffacd0b85a97d-36760a6ab1fmr2440949f8f.7.1719595513311; Fri, 28 Jun 2024
 10:25:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626050818.2277273-1-jiaqiyan@google.com> <20240626050818.2277273-4-jiaqiyan@google.com>
 <0a28831c-b28e-6db5-0ef3-70940e75d4d2@huawei.com>
In-Reply-To: <0a28831c-b28e-6db5-0ef3-70940e75d4d2@huawei.com>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Fri, 28 Jun 2024 10:25:02 -0700
Message-ID: <CACw3F52DHhTM4M8GEURjft_Qx=kvzRvFxHp-pkYdpXAim7anMg@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] selftest/mm: test enable_soft_offline behaviors
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: jane.chu@oracle.com, rdunlap@infradead.org, ioworker0@gmail.com, 
	muchun.song@linux.dev, akpm@linux-foundation.org, shuah@kernel.org, 
	corbet@lwn.net, osalvador@suse.de, rientjes@google.com, duenwen@google.com, 
	fvdl@google.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, Naoya Horiguchi <nao.horiguchi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 8:29=E2=80=AFPM Miaohe Lin <linmiaohe@huawei.com> w=
rote:
>
> On 2024/6/26 13:08, Jiaqi Yan wrote:
> > Add regression and new tests when hugepage has correctable memory
> > errors, and how userspace wants to deal with it:
> > * if enable_soft_offline=3D1, mapped hugepage is soft offlined
> > * if enable_soft_offline=3D0, mapped hugepage is intact
> >
> > Free hugepages case is not explicitly covered by the tests.
> >
> > Hugepage having corrected memory errors is emulated with
> > MADV_SOFT_OFFLINE.
>
> Thanks for update.
>
> >
> > Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
> > ---
> >  tools/testing/selftests/mm/.gitignore         |   1 +
> >  tools/testing/selftests/mm/Makefile           |   1 +
> >  .../selftests/mm/hugetlb-soft-offline.c       | 228 ++++++++++++++++++
> >  tools/testing/selftests/mm/run_vmtests.sh     |   4 +
> >  4 files changed, 234 insertions(+)
> >  create mode 100644 tools/testing/selftests/mm/hugetlb-soft-offline.c
> ...
> > +static void test_soft_offline_common(int enable_soft_offline)
> > +{
> > +     int fd;
> > +     int expect_errno =3D enable_soft_offline ? 0 : EOPNOTSUPP;
> > +     struct statfs file_stat;
> > +     unsigned long hugepagesize_kb =3D 0;
> > +     unsigned long nr_hugepages_before =3D 0;
> > +     unsigned long nr_hugepages_after =3D 0;
> > +     int ret;
> > +
> > +     ksft_print_msg("Test soft-offline when enabled_soft_offline=3D%d\=
n",
> > +                    enable_soft_offline);
> > +
> > +     fd =3D create_hugetlbfs_file(&file_stat);
> > +     if (fd < 0)
> > +             ksft_exit_fail_msg("Failed to create hugetlbfs file\n");
> > +
> > +     hugepagesize_kb =3D file_stat.f_bsize / 1024;
> > +     ksft_print_msg("Hugepagesize is %ldkB\n", hugepagesize_kb);
> > +
> > +     if (set_enable_soft_offline(enable_soft_offline)) {
>
> Nit: should this be written as if (set_enable_soft_offline(enable_soft_of=
fline) !=3D 0) to keep consistent with below code?

for sure

>
> > +             close(fd);
> > +             ksft_exit_fail_msg("Failed to set enable_soft_offline\n")=
;
> > +     }
> > +
> > +     if (read_nr_hugepages(hugepagesize_kb, &nr_hugepages_before) !=3D=
 0) {
> > +             close(fd);
> > +             ksft_exit_fail_msg("Failed to read nr_hugepages\n");
> > +     }
> > +
> > +     ksft_print_msg("Before MADV_SOFT_OFFLINE nr_hugepages=3D%ld\n",
> > +                    nr_hugepages_before);
> > +
> > +     ret =3D do_soft_offline(fd, 2 * file_stat.f_bsize, expect_errno);
> > +
> > +     if (read_nr_hugepages(hugepagesize_kb, &nr_hugepages_after) !=3D =
0) {
> > +             close(fd);
> > +             ksft_exit_fail_msg("Failed to read nr_hugepages\n");
> > +     }
> > +
> ...
> > diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/=
selftests/mm/run_vmtests.sh
> > index 3157204b9047..781117fac1ba 100755
> > --- a/tools/testing/selftests/mm/run_vmtests.sh
> > +++ b/tools/testing/selftests/mm/run_vmtests.sh
> > @@ -331,6 +331,10 @@ CATEGORY=3D"hugetlb" run_test ./thuge-gen
> >  CATEGORY=3D"hugetlb" run_test ./charge_reserved_hugetlb.sh -cgroup-v2
> >  CATEGORY=3D"hugetlb" run_test ./hugetlb_reparenting_test.sh -cgroup-v2
> >  if $RUN_DESTRUCTIVE; then
> > +nr_hugepages_tmp=3D$(cat /proc/sys/vm/nr_hugepages)
> > +echo 8 > /proc/sys/vm/nr_hugepages
> > +CATEGORY=3D"hugetlb" run_test ./hugetlb-soft-offline
> > +echo "$nr_hugepages_tmp" > /proc/sys/vm/nr_hugepages
>
> Should we save and restore the value of /proc/sys/vm/enable_soft_offline =
too?

absolutely, thanks for catching.

>
> With above fixed, this patch looks good to me.
> Acked-by: Miaohe Lin <linmiaohe@huawei.com>

Thanks Miaohe, I will send out v7 with fixes.

> Thanks.
> .
>
