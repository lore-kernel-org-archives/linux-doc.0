Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F37543803F
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 16:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783529192; cv=pass; b=eilIAw5ehZQq7gfeMdLpt6xTquoQYj6aocOBAjZgTWwIGxiEl5iPYfZTAV73omtm7v/ip0YjYbRcrCcLZb8XPlzF2odFATcpo9zvQT5xDfcf+Rapvsi/8oPKJgv+2IgOtpfXqjpDZdgyT51o1wzlnYtK76UmV5mkO7yWUsoNK0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783529192; c=relaxed/simple;
	bh=veeuZJj+v71owbD0B/PLMuWmqCli2aSe1PH4cD/CAN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kyl7xav3rzUCBy8vnxYb0hVSmWUpr+4MMrNOJrwhUOA51FNhSFAMsmXf/dmV64Z89799OL9lSK6I3cecInxgg2YW5dhA4R1YnXPFIoId2yrDyOCBjv/F9jn5C1wCf5+vejEAcj9rbGwguzksSnwonl9+2wCNw3R89arO0Q/915c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B+p7oqZU; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B+p7oqZU"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c15a5b265so1231cf.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 09:46:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783529188; cv=none;
        d=google.com; s=arc-20260327;
        b=pkqlj1tyuX8hrOyW4XSh01E3pK8aNZmWlGHnNBkP9NUlNJjG3YWapIJiuNSXevptD2
         nvTWMR9PfldWl5UWn3A56dWs4kCHjJTGjioYhZegOI0i7EtHt0o3++UF/LTycg0c3LxB
         HvBM58Og07pxMgNaBQQdWKa+Lf+Xr5qGCdBEAjvsSiAfx1VXSXXgGk4E7MafOJzwtHoo
         PydWLONGq4rvDFZ8NYBXr2qG8nqMlP8l05OiFd8adfBi8shvX1wc6WT2G6ULToF2VrNN
         a6qCkSz6JCLt3dmu4mRE4gKy1XuED3zd00/BFRiqY6O/wALsD7G7qOs0zDCM8ZUllr/e
         PWdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3IZCtBnhcpmWhrAVR8iONqaT4sw22ll7ue/gnD3gzAo=;
        fh=lt42iJ4X4ARKJJs8OvjV0aGpupjkRsxbgLFl8Q4KDFE=;
        b=gXMwfJdNor26WhzkpQO7c1XvyuBfzqllw8+vcm24e7NhCSizsMUmVDJFxOtC0+vMzq
         sH0mXCTfcdh/sbHIh9qQ8CmPHnAN2UiPy6a0vw0MmhrfjLFF8CYaJ1QOr6UrE5+F+mEj
         JuxUzf+nnQbxxOaAxbwDzq+u2ssmVGCADMzKX2p7Wcs/GAsCUxTyqs+IRaoCW4B24hdm
         v3hMg8OGcIFeNO8Tr1A3z+haDx1dNi8yScNYIJgg0pzXwgckwgOrgnBTv+pGQpQwMptp
         X7o9G4a6yrASilPeRQZYfm6DWPNMY9QZi3XP/DkFYeHQIYkC04GpH6SbmHiXwWKCpcIN
         72Aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783529188; x=1784133988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3IZCtBnhcpmWhrAVR8iONqaT4sw22ll7ue/gnD3gzAo=;
        b=B+p7oqZUvqXjpsIPmFR7gBk2WVN0SkoADC6xoYFGuXB0U0mJWhRev6YQaU/DdYvuYB
         QfPvFgXdqA6z+v+CFhrRJRD2Zz709jlj6oq32Lgd1x1JKnTLNciA2tWzCLOWhli9lFmc
         z+apYz1oDz2QfWXyrBzm+HSicnOPUK2wzrv4xmoOCVKv5hIve5FbjIzB6uD5R3UzPmRD
         ETTlaLKihK0mf1gG9ts4QYH/hGoJUUUuO+I8QMeJCnrMbJRxg/Z/Tk2YEUwgiW5Yz/EN
         e2zyNvRf+Vf2YYB6vI/LvMRsCXHh9ohtUTvUxgkR/PhyFedajvOj9tDwx6yn0LOC1r9v
         WStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529188; x=1784133988;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3IZCtBnhcpmWhrAVR8iONqaT4sw22ll7ue/gnD3gzAo=;
        b=T6Heacy3izzIF0qgEk1Ki9R3nnY9diGxi9j5hS4xmBouFl0eAVacns1OH2mz/VfSqV
         AVQfhpoyweYbE/qcpDcbU8N3xtGNX8SBgsZth4DDJy3o4LaMwPCdGfa15ahhZxRuyxzi
         JRnF5KEt2ZNRwRTZHRu+j4Rtankn6y4dzT/erb8Nsb8Iu1Pyxq726T525xeDDpgcRkqL
         3zSwwfRTS7xj47f1YpgJ2174ehpOee/GDFt+ltpcKxfhrgbZTjc1KAizw9NebOh9CRak
         hIOjBfNmNwBCMFL2Vkesjlq3e+sKwUVXr2PFJDFV1F+yJQ1t8jaZZXwL7mSmpNKcVhT7
         E7kA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3a9ch6rKmcKdOY8fQx0wA5nuSCvJUu8H8oGNmkMpNzhGAQmMqXWc8A9JRxBVskwYag6u2NwnGxwk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrqIhqSPpgHHSQ4RW+cFfaQdb3PL7p+Udshnm+rInEueiH8WEG
	k6yp4m4f37wWRZ50uxDr2yGCe2Wdn4regvhp/+Mgb11rT8pFq1mwGIo9BwubA+Pu5ctl1nkqnUV
	rg7XMFoONeydlMbtuu2p1Jp6CaJu0Fnj9OwsYdf1F
X-Gm-Gg: AfdE7cls5QBHDOajbamOrOr3BnyKXVCiLstwY4z9t5w7degNlsKGP3ASlLQDnn2UCBE
	Aju9uPuIJa6o7TXkB20pGVXYHLetvLRKgzMo2oosS/G2xVHNru4LYSrfExp3HIa5oxE4LOY9y/O
	teK0Ef25Ef1buzgiWO1gj80TBryLM8SrCea6zFVMHL4s3/Hkjk4jYGxoRljyggcAV2L5PP8I9JW
	7RAPNyOkHegSaR1ydtm2BdZ94GZyWyHW0pc2jEHP7IEjnkAY7UhhxHrOClI+ij2KNAxBo7XozJr
	lSjqC8uFwrYtq+qbUOhv1AUP
X-Received: by 2002:a05:622a:6684:b0:519:b655:235 with SMTP id
 d75a77b69052e-51c96d9ba2fmr219201cf.3.1783529187229; Wed, 08 Jul 2026
 09:46:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783361692.git.abhishekbapat@google.com>
 <f6bd1ff0257987dbb7512f93595eaa6962c6153b.1783361692.git.abhishekbapat@google.com>
 <4cc47988-49b3-4b73-90ed-a0a16a56a8dc@linux.dev> <CAL41Mv6SdpOd=oLp9ceBkR-q_Y73Fx6rYjFO-Zc0hiNJjCFzYA@mail.gmail.com>
In-Reply-To: <CAL41Mv6SdpOd=oLp9ceBkR-q_Y73Fx6rYjFO-Zc0hiNJjCFzYA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 8 Jul 2026 12:46:15 -0400
X-Gm-Features: AVVi8CfdW5a_6w9H4h8puTYyUWLIRYPykZWez8jFl1QFDheAElWManBZcW37izk
Message-ID: <CAJuCfpHaKRBDMPF7yHiCgimFmo6Z8kj78caEOF3vsYErv7WyLg@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] kselftest: alloc_tag: extend the allocinfo ioctl kselftest
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Hao Ge <hao.ge@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 12:59=E2=80=AFPM Abhishek Bapat <abhishekbapat@googl=
e.com> wrote:
>
> On Mon, Jul 6, 2026 at 8:28=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
> >
> > Hi Abhishek
> >
> >
> > On 2026/7/7 02:25, Abhishek Bapat wrote:
> > > Add the following 2 scenarios to the allocinfo ioctl kselftest:
> > > 1. Validate size based filtering
> > > 2. Validate lineno based filtering
> > >
> > > The first test uses "do_init_module" as the candidate function for th=
e
> > > test. This is because the associated site will only allocate memory w=
hen
> > > a kernel module is loaded. The return value of get_content_id() chang=
es
> > > every time modules are loaded or unloaded. Hence, as long as
> > > get_content_id() values at the start and the end of the test are the
> > > same, the memory allocated by the do_init_module call site should als=
o
> > > remain the same. Consequently, the test can assume consistency betwee=
n
> > > the value returned by the ioctl and the procfs resulting in less
> > > flakiness.
> > >
> > > Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> > > ---
> > >   .../alloc_tag/allocinfo_ioctl_test.c          | 216 +++++++++++++++=
++-
> > >   1 file changed, 215 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c=
 b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > > index 9ce7b53078b1..092348097204 100644
> > > --- a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > > +++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > > @@ -5,6 +5,7 @@
> > >    * Copyright (C) 2026 Google, Inc.
> > >    */
> > >
> > > +#include <errno.h>
> > >   #include <fcntl.h>
> > >   #include <stdio.h>
> > >   #include <stdlib.h>
> > > @@ -312,11 +313,212 @@ static int test_function_filter(void)
> > >       return run_filter_test(&filter);
> > >   }
> > >
> > > +static int test_size_filter(void)
> > > +{
> > > +     int fd;
> > > +     struct allocinfo_tag_data_vec *tags =3D malloc(sizeof(*tags));
> > > +     struct allocinfo_tag_data_vec *procfs_entries =3D malloc(sizeof=
(*procfs_entries));
> > > +     struct allocinfo_filter filter;
> > > +     int ret =3D KSFT_PASS;
> > > +     __u64 target_size, i, pos;
> > > +     struct allocinfo_tag_data *found_tag =3D NULL;
> > > +     const char *target_function =3D "do_init_module";
> > > +     struct allocinfo_content_id start_cont_id, end_cont_id;
> > > +     int retry =3D 0;
> > > +     const int max_retries =3D 10;
> > > +
> > > +     if (!tags || !procfs_entries) {
> > > +             ksft_print_msg("Memory allocation failed.\n");
> > > +             ret =3D KSFT_FAIL;
> > > +             goto freemem;
> > > +     }
> > > +
> > > +     fd =3D open(ALLOCINFO_PROC, O_RDONLY);
> > > +     if (fd < 0) {
> > > +             ksft_print_msg("Failed to open " ALLOCINFO_PROC ": %s\n=
", strerror(errno));
> > > +             ret =3D KSFT_FAIL;
> > > +             goto freemem;
> > > +     }
> > > +
> > > +     do {
> > > +             found_tag =3D NULL;
> > > +             pos =3D 0;
> > > +
> > > +             if (__allocinfo_get_content_id(fd, &start_cont_id)) {
> > > +                     ksft_print_msg("allocinfo_get_content_id failed=
\n");
> > > +                     ret =3D KSFT_FAIL;
> > > +                     goto exit;
> > > +             }
> > > +
> > > +             memset(&filter, 0, sizeof(filter));
> > > +             filter.mask |=3D ALLOCINFO_FILTER_MASK_FUNCTION;
> > > +             strncpy(filter.fields.function, target_function, ALLOCI=
NFO_STR_SIZE);
> > > +
> > > +             if (get_filtered_procfs_entries(procfs_entries, &filter=
)) {
> > > +                     ksft_print_msg("Error retrieving entries from "=
 ALLOCINFO_PROC "\n");
> > > +                     ret =3D KSFT_FAIL;
> > > +                     goto exit;
> > > +             }
> > > +
> > > +             if (procfs_entries->count =3D=3D 0) {
> > > +                     ksft_print_msg("Function %s not found in procfs=
\n", target_function);
> > > +                     ret =3D KSFT_SKIP;
> > > +                     goto exit;
> > > +             }
> > > +
> > > +             target_size =3D procfs_entries->tag[0].counter.bytes;
> > > +
> > > +             memset(&filter, 0, sizeof(filter));
> > > +             filter.mask |=3D ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOC=
INFO_FILTER_MASK_MAX_SIZE;
> > > +             filter.min_size =3D target_size;
> > > +             filter.max_size =3D target_size;
> > > +
> > > +             while (1) {
> > > +                     struct allocinfo_get_at get_at_params;
> > > +
> > > +                     memset(&get_at_params, 0, sizeof(get_at_params)=
);
> > > +                     memcpy(&get_at_params.filter, &filter, sizeof(f=
ilter));
> > > +                     get_at_params.pos =3D pos;
> > > +
> > > +                     if (__allocinfo_get_at(fd, &get_at_params))
> > > +                             break;
> > > +
> > > +                     tags->count =3D 0;
> > > +                     memcpy(&tags->tag[tags->count++], &get_at_param=
s.data,
> > > +                            sizeof(get_at_params.data));
> > > +
> > > +                     while (tags->count < VEC_MAX_ENTRIES &&
> > > +                            __allocinfo_get_next(fd, &tags->tag[tags=
->count]) =3D=3D 0)
> > > +                             tags->count++;
> > > +
> > > +                     for (i =3D 0; i < tags->count; i++) {
> > > +                             if (strcmp(tags->tag[i].tag.function, t=
arget_function) =3D=3D 0) {
> > > +                                     found_tag =3D &tags->tag[i];
> > > +                                     break;
> > > +                             }
> > > +                     }
> > > +
> > > +                     if (found_tag || tags->count < VEC_MAX_ENTRIES)
> > > +                             break;
> > > +
> > > +                     pos +=3D tags->count;
> > > +             }
> > > +
> > > +             if (__allocinfo_get_content_id(fd, &end_cont_id)) {
> > > +                     ksft_print_msg("allocinfo_get_content_id failed=
\n");
> > > +                     ret =3D KSFT_FAIL;
> > > +                     goto exit;
> > > +             }
> > > +
> > > +             if (start_cont_id.id =3D=3D end_cont_id.id)
> > > +                     break;
> > > +
> > > +             ksft_print_msg("Module load detected during size verifi=
cation, retrying...\n");
> > > +     } while (retry++ < max_retries);
> > > +
> > > +     if (start_cont_id.id =3D=3D end_cont_id.id && !found_tag) {
> > > +             ksft_print_msg("Entry with function %s not found in IOC=
TL results\n",
> > > +                            target_function);
> > > +             ret =3D KSFT_FAIL;
> > > +     } else if (start_cont_id.id !=3D end_cont_id.id) {
> > > +             ksft_print_msg("Failed to match content_ids for procfs =
and IOCTL, skipping...\n");
> > > +             ret =3D KSFT_SKIP;
> > > +     } else if (found_tag && found_tag->counter.bytes !=3D target_si=
ze) {
> > > +             ksft_print_msg("IOCTL entry size %llu does not match ta=
rget size %llu\n",
> > > +                            found_tag->counter.bytes, target_size);
> > > +             ret =3D KSFT_FAIL;
> > > +     }
> > > +
> > > +exit:
> > > +     close(fd);
> > > +freemem:
> > > +     free(tags);
> > > +     free(procfs_entries);
> > > +     return ret;
> > > +}
> > > +
> > > +static int test_lineno_filter(void)
> > > +{
> > > +     struct allocinfo_tag_data_vec *tags =3D malloc(sizeof(*tags));
> > > +     struct allocinfo_tag_data_vec *procfs_entries =3D malloc(sizeof=
(*procfs_entries));
> > > +     struct allocinfo_filter filter;
> > > +     enum ioctl_ret ioctl_status;
> > > +     int ret =3D KSFT_PASS;
> > > +     __u64 target_lineno, i;
> > > +     struct allocinfo_tag_data *target_tag;
> > > +     bool found =3D false;
> > > +
> > > +     if (!tags || !procfs_entries) {
> > > +             ksft_print_msg("Memory allocation failed.\n");
> > > +             ret =3D KSFT_FAIL;
> > > +             goto exit;
> > > +     }
> > > +
> > > +     memset(&filter, 0, sizeof(filter));
> > > +
> > > +     if (get_filtered_procfs_entries(procfs_entries, &filter)) {
> > > +             ksft_print_msg("Error retrieving entries from " ALLOCIN=
FO_PROC "\n");
> > > +             ret =3D KSFT_FAIL;
> > > +             goto exit;
> > > +     }
> > > +     if (procfs_entries->count =3D=3D 0) {
> > > +             ksft_print_msg("Could not retrieve procfs entries\n");
> > > +             ret =3D KSFT_SKIP;
> > > +             goto exit;
> > > +     }
> > > +     /*
> > > +      * We depend on the procfs results to determine the line number=
 for the filter before
> > > +      * making the ioctl query. Hence, we cannot reuse run_filter_te=
st here.
> > > +      */
> > > +     target_tag =3D &procfs_entries->tag[0];
> > > +     target_lineno =3D target_tag->tag.lineno;
> > > +
> > > +     filter.mask |=3D ALLOCINFO_FILTER_MASK_LINENO;
> > > +     filter.fields.lineno =3D target_lineno;
> > > +
> > > +     ioctl_status =3D get_filtered_ioctl_entries(tags, &filter, 0);
> > > +     if (ioctl_status =3D=3D IOCTL_INVALID_DATA) {
> > > +             ksft_print_msg("Trouble retrieving valid IOCTL entries,=
 skipping.\n");
> > > +             ret =3D KSFT_SKIP;
> > > +             goto exit;
> > > +     }
> > > +     if (ioctl_status =3D=3D IOCTL_FAILURE) {
> > > +             ksft_print_msg("Error retrieving IOCTL entries.\n");
> > > +             ret =3D KSFT_FAIL;
> > > +             goto exit;
> > > +     }
> > > +
> > > +     for (i =3D 0; i < tags->count; i++) {
> > > +             if (tags->tag[i].tag.lineno !=3D target_lineno) {
> > > +                     ksft_print_msg("IOCTL entry %llu has incorrect =
lineno %llu.\n",
> > > +                                    i, tags->tag[i].tag.lineno);
> > > +                     ret =3D KSFT_FAIL;
> > > +                     goto exit;
> > > +             }
> > > +
> > > +             if (strncmp(tags->tag[i].tag.function, target_tag->tag.=
function,
> > > +                         ALLOCINFO_STR_SIZE) =3D=3D 0 &&
> > > +                 strncmp(tags->tag[i].tag.filename, target_tag->tag.=
filename,
> > > +                         ALLOCINFO_STR_SIZE) =3D=3D 0)
> > > +                     found =3D true;
> > > +     }
> > > +
> > > +     if (!found) {
> > > +             ksft_print_msg("Original procfs entry not found in IOCT=
L lineno filter results.\n");
> > > +             ret =3D KSFT_FAIL;
> > > +     }
> > > +
> > > +exit:
> > > +     free(tags);
> > > +     free(procfs_entries);
> > > +     return ret;
> > > +}
> > > +
> > >   int main(int argc, char *argv[])
> > >   {
> > >       int ret;
> > >
> > > -     ksft_set_plan(2);
> > > +     ksft_set_plan(4);
> > >
> > >       ret =3D test_filename_filter();
> > >       if (ret =3D=3D KSFT_SKIP)
> > > @@ -330,5 +532,17 @@ int main(int argc, char *argv[])
> > >       else
> > >               ksft_test_result(ret =3D=3D KSFT_PASS, "test_function_f=
ilter\n");
> > >
> > > +     ret =3D test_size_filter();
> > > +     if (ret =3D=3D KSFT_SKIP)
> > > +             ksft_test_result_skip("Skipping test_size_filter\n");
> > > +     else
> > > +             ksft_test_result(ret =3D=3D KSFT_PASS, "test_size_filte=
r\n");
> > > +
> > > +     ret =3D test_lineno_filter();
> > > +     if (ret =3D=3D KSFT_SKIP)
> > > +             ksft_test_result_skip("Skipping test_lineno_filter\n");
> > > +     else
> > > +             ksft_test_result(ret =3D=3D KSFT_PASS, "test_lineno_fil=
ter\n");
> > > +
> > >       ksft_finished();
> > >   }
> >
> >
> > https://sashiko.dev/#/patchset/cover.1783361692.git.abhishekbapat%40goo=
gle.com
> >
> > Sashiko is really strict, but its warnings are legitimate. I ran the
> > test program on a kernel built without
> >
> > CONFIG_MEM_ALLOC_PROFILING, and here are the results:
> >
> >
> > [root@localhost alloc_tag]# ./allocinfo_ioctl_test
> > 1..4
> > # Failed to open /proc/allocinfo for reading
> > # Error retrieving entries from /proc/allocinfo
> > ok 1 # SKIP Skipping test_filename_filter
> > # Failed to open /proc/allocinfo for reading
> > # Error retrieving entries from /proc/allocinfo
> > ok 2 # SKIP Skipping test_function_filter
> > # Failed to open /proc/allocinfo: No such file or directory
> > not ok 3 test_size_filter
> > # Failed to open /proc/allocinfo for reading
> > # Error retrieving entries from /proc/allocinfo
> > not ok 4 test_lineno_filter
> > # 2 skipped test(s) detected. Consider enabling relevant config options
> > to improve coverage.
> > # Totals: pass:0 fail:2 xfail:0 xpass:0 skip:2 error:0
> > [root@localhost alloc_tag]#
> >
> >
> > Looking at the test log above, some tests that ought to be skipped are
> > flagged as failures.
> >
> > Would it make sense for us to go through all relevant test cases in the
> > codebase,
> >
> > and check if we've missed any logic to skip tests when /proc/allocinfo
> > is missing
> >
> > due to CONFIG_MEM_ALLOC_PROFILING being disabled?
> >
> >
> > BTW,  when merging this series into the latest mm-new branch, there wil=
l
> > be a minor header file conflict.
> >
> > This is because the series at
> > https://lore.kernel.org/all/20260703-alloc-trylock-v5-15-c87b714e19d3@g=
oogle.com
> > was merged ahead of this change.
> >
> > We might want to consider rebasing this series to resolve the header
> > conflict.
> >
> >
> > Thanks
> >
> > Best Regards
> >
> > Hao
> >
> >
>
> Hi Hao,
>
> Thanks for bringing this up, I discussed it with Andrew as well and
> will fix it in the next version. Waiting for Suren's comments before
> posting another version.

I went over the series and it LGTM. Please post the new version and
please use "git format-patch --base=3Dauto" when formatting the patches
to send so that we know which branch the patchset was based on.
Thanks,
Suren.

>
> Thanks!
