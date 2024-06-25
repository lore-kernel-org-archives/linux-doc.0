Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D641135A7F
	for <linux-doc@vger.kernel.org>; Tue, 25 Jun 2024 23:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719359855; cv=none; b=fYcd7tf0zCW2htfbNPjQnOYTGBpzAB6DICE9c4u4VFgP3OM0Yaffj5m8Lw0sEpjltK98UbVzNfuRLAveXXMHfiL67t34Q6iZcFUwPbb+plgb6SqgrPA6DGaECj2qfvK8bFS8TYuLD3HwOzr16Kr+hKLbSTtEShacqfBym7YIlgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719359855; c=relaxed/simple;
	bh=Bf9Y7oEFFhtvmeORml+RSGqddvm0/CJjvC4+D1bcBfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=np8n9nJPEXSfsCtVxcffDoy22C6Mj7Sj5AC5mTGGeK9pEOj9ZR+mCUFEDlIUJz07a1dRqda4sqHCHCDPyt7zbEgduC0w8I3+q45MRlWVxNpB11NpMdXJMvAqoF6wmHzs/zBC+8D7roYzkF5KDVME+1FUnVbPsU92vlcgxsfStfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qjGh7tZm; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qjGh7tZm"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4217c7eb6b4so49775515e9.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Jun 2024 16:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719359852; x=1719964652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2JcOUDnCt+svS7zGz52ySaRQIEG8KgIWnA1lxR6tik=;
        b=qjGh7tZmCaukZ6THX5r1/rm/pcvPo86iU/28KFiajMbmQxDPCYoqey9+IOehCYaQVU
         QwLSIUYeourMi9DX1RuVNZcnuUd8/D5uro5PEVSJxB8SCNl8Hb0WCHwusWm7wo8+nFio
         GSJKiBR+272RmaeSzQPHM8D1Q8oj21KE2mWOMUj1xdgxaobgGjHFt8ozBZam89q06vdQ
         1lumIM07dE21HD9HZgRFtYbl8KFsmM14v84JEiMIJJx9R+sIls5MDIiR5m/zVFTEzDIG
         fVSqiL46/y82cViewyCW7pTCfaf6J5JohYfkkD8CNWIIG4sLFRs7FPMZVzDw1zS+cVO5
         fJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719359852; x=1719964652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2JcOUDnCt+svS7zGz52ySaRQIEG8KgIWnA1lxR6tik=;
        b=H6EdRY0V5Z3P7K28665nqcJRDRg9AgYQ54CNWxLTNf/1klCJIBZW+HNj+qFJ65OPlr
         3jrbnHFNbUJHkTj85Fj7sVjMAneCDqB9ikxs5wC8MWuTz8yzmrTGgWH1Z+FGSelHmQg2
         Tq5C/PgRouMmWR72ahnADHBXeHB2xukoeFYnyaQq6Vwr0VkGsjnynH45s6Y0jCsWL1m/
         +Pa7PDyzUNq/Qd1/cFeheCAd+UIgDiIhM13irjCNv+ic3FF3u3wet6pziMEI5vYt4pg4
         OT0WGy2WmQ13opngJuMrf5lKVYM7mmFnhD+aujoLnM3PZE2xoUdy1r4rD13ylnjIXTyj
         gR9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUM/+9SYFeKw3l2731gU4ffkq9SmYyaEExrOHtA2PEZDEXfR1UGklM9QnB3ZR5fstAddTDeG1PDiqyjV4rFlrG8eUEMwV97Nopc
X-Gm-Message-State: AOJu0YzY2vJTXm4gUa13/H4+LwRlbdriS/DsrfjflObOn3j3sVZliQhD
	4DjMR6tuwjaIwVtGeHV7qBSwdOPtk3XsfuMxXJjzU8Wjw4j0FAfZmR6nnvcOT0FFVD36ANYWpho
	hsmH1RHwyVGsIfpwmg5hE3XdRM4PZXZBzhxCd
X-Google-Smtp-Source: AGHT+IFFJb7WJm7kVvr/YsNNI6PVICNxN4RmhAT6PXUxbvWObAnOWcBp6wVtH/m42umgYY2SNNQ1OS8CJRAvJEgtHSU=
X-Received: by 2002:a05:600c:4a99:b0:421:29e1:998 with SMTP id
 5b1f17b1804b1-4248cc67376mr54381265e9.39.1719359852154; Tue, 25 Jun 2024
 16:57:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624163348.1751454-1-jiaqiyan@google.com> <20240624163348.1751454-4-jiaqiyan@google.com>
 <609062d2-977c-4229-8c66-d15bb8e47eb8@huawei.com>
In-Reply-To: <609062d2-977c-4229-8c66-d15bb8e47eb8@huawei.com>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Tue, 25 Jun 2024 16:57:19 -0700
Message-ID: <CACw3F51yApRGaKcKmeEo-SYbt-nxULCwe2imCnsaPP8m4UBW6g@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] selftest/mm: test enable_soft_offline behaviors
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: muchun.song@linux.dev, akpm@linux-foundation.org, shuah@kernel.org, 
	corbet@lwn.net, osalvador@suse.de, rientjes@google.com, duenwen@google.com, 
	fvdl@google.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, nao.horiguchi@gmail.com, jane.chu@oracle.com, 
	ioworker0@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 12:05=E2=80=AFAM Miaohe Lin <linmiaohe@huawei.com> =
wrote:
>
> On 2024/6/25 0:33, Jiaqi Yan wrote:
> > Add regression and new tests when hugepage has correctable memory
> ...
> > diff --git a/tools/testing/selftests/mm/hugetlb-soft-offline.c b/tools/=
testing/selftests/mm/hugetlb-soft-offline.c
> > new file mode 100644
> > index 000000000000..16fe52f972e2
> > --- /dev/null
> > +++ b/tools/testing/selftests/mm/hugetlb-soft-offline.c
> > @@ -0,0 +1,227 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Test soft offline behavior for HugeTLB pages:
> > + * - if enable_soft_offline =3D 0, hugepages should stay intact and so=
ft
> > + *   offlining failed with EINVAL.
>
> s/failed with EINVAL/failed with EOPNOTSUPP/g

To be fixed in v6.

>
> > + * - if enable_soft_offline =3D 1, a hugepage should be dissolved and
> > + *   nr_hugepages/free_hugepages should be reduced by 1.
> > + *
> > + * Before running, make sure more than 2 hugepages of default_hugepage=
sz
> > + * are allocated. For example, if /proc/meminfo/Hugepagesize is 2048kB=
:
> > + *   echo 8 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
> > + */
> > +
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
> > +     if (fd < 0) {
> > +             ksft_exit_fail_msg("Failed to create hugetlbfs file\n");
> > +             return;
> > +     }
> > +
> > +     hugepagesize_kb =3D file_stat.f_bsize / 1024;
> > +     ksft_print_msg("Hugepagesize is %ldkB\n", hugepagesize_kb);
> > +
> > +     if (set_enable_soft_offline(enable_soft_offline)) {
> > +             ksft_exit_fail_msg("Failed to set enable_soft_offline\n")=
;
>
> Call destroy_hugetlbfs_file() in error path?

As the counterpart of destroy_hugetlbfs_file, I think the test only
needs to close(fd). Will add it in v6.

>
> > +             return;
> > +     }
> > +
> > +     if (read_nr_hugepages(hugepagesize_kb, &nr_hugepages_before) !=3D=
 0) {
> > +             ksft_exit_fail_msg("Failed to read nr_hugepages\n");
> > +             return;
> > +     }
> > +
> > +     ksft_print_msg("Before MADV_SOFT_OFFLINE nr_hugepages=3D%ld\n",
> > +                    nr_hugepages_before);
> > +
> > +     ret =3D do_soft_offline(fd, 2 * file_stat.f_bsize, expect_errno);
> > +
> > +     if (read_nr_hugepages(hugepagesize_kb, &nr_hugepages_after) !=3D =
0) {
> > +             ksft_exit_fail_msg("Failed to read nr_hugepages\n");
> > +             return;
> > +     }
> > +
> > +     ksft_print_msg("After MADV_SOFT_OFFLINE nr_hugepages=3D%ld\n",
> > +             nr_hugepages_after);
> > +
> > +     if (enable_soft_offline) {
> > +             if (nr_hugepages_before !=3D nr_hugepages_after + 1) {
> > +                     ksft_test_result_fail("MADV_SOFT_OFFLINE should r=
educed 1 hugepage\n");
> > +                     return;
> > +             }
> > +     } else {
> > +             if (nr_hugepages_before !=3D nr_hugepages_after) {
> > +                     ksft_test_result_fail("MADV_SOFT_OFFLINE reduced =
%lu hugepages\n",
> > +                             nr_hugepages_before - nr_hugepages_after)=
;
> > +                     return;
> > +             }
> > +     }
> > +
> > +     ksft_test_result(ret =3D=3D 0,
> > +                      "Test soft-offline when enabled_soft_offline=3D%=
d\n",
> > +                      enable_soft_offline);
>
> Call destroy_hugetlbfs_file() when test finished ?

Test can just close(fd) once nr_hugepages_after is read.

>
> Thanks.
> .
>
>
>
