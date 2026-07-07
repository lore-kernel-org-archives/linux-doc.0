Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091F1437846
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 16:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443543; cv=pass; b=fm/Kk//BgIgsHQwQ5n92g2wVDCuY/zRKHU+FIH6wpp8Q1E/xE/kPW0MRgq5D7RHsk4F0K4321IdtRknavhGRpGr60fmgRAEzUpaUir+hF2eYiUGtIa2UFQrLqxb4mDRaC/LGoiSGACo6HmYj+MQoMqSwGCuNOtcfYteo4YOr60Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443543; c=relaxed/simple;
	bh=VLk1mI2d3RuUEtkHGmhBjSWzr2xfgg9uJwQXuyR2DKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y9IKGx05gs+RbG2o/ZGcZqKylKO+t4XOOisqrVd4xT0PA2IvYup7VsbmfIaDCuRyZBuqiIuCjrfSgz/SDmcfIf3zHrOUFb+mbHNKeI/TaYLSITBm8BpNJ179cP6x/z0rc4839Ntryuy9Z5Jsi2xClGEAUcuaI8y/hRGjab0HceQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HKYKlWbI; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HKYKlWbI"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ccdf36f63dso35ad.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 09:59:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783443541; cv=none;
        d=google.com; s=arc-20260327;
        b=m5yJypfmHvzWQfoT5QRi70HGIMlyLMY88aueYkyQ/TlfqPG1T0c09akKxvhXVmVQy+
         JVUIM9gWSlYmjerr3P8w7Ipu0sdpeM+CVXH0Yf1+zs2LL+HJo+aIhjtrxZpwVsrbVlTm
         Nn3ZCTvOeLyq6MaKNqNsKMK6UaZbuumxlHLWiR6YIjD0z5JRYSz7tnc3QCSAsHENmsuT
         0PGOphQ5+q/qe7k7AgrsBAIgMjsLV7J9erhcR1dqD3BsmGFxWJbOJR+ejes+njKSkjsn
         7aWdoK1ctr54rYyYgFKK4YH+EO2iwlGUBr0xfyyu8d138fv2dPEqbp03FlV+083xfajS
         7ZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V+0pheG9ogqbrNNEmsLqS/R7/lxeP3J7M6TTyjZm7Es=;
        fh=rL4FPf0pGR8XP3635pv5DA2kI24q0qsO4R7GlMgU//s=;
        b=ld6Pnj5hx9B+HubnMhS+h8CTNdC56gbg2P0cbtOC/FBjL3oVSWbsn9QjZLcJTHELhi
         OT1PmDHjp55JxZLkWBezoR+nWJw+UEhPWw3oEm9x3OI2kcm+D9ads8zn08Z3ztkMJ7XE
         w9gS3SSptSzDOmlOUjl/PvR9ShrTIrphn3ML+n7VzvBiaAOjWyxFTRmwrEY5rwLm1PYd
         rpaUoZWSdy2Tz6NGfN7BT9J6yy+hqFDJJWUEceps3K0CuC75d3IeOy5akDhqqCd5PN6G
         tfZosWtzgB8u4ozWt8XS9kwTpPeWVcNdcXPyEaccAl9ulcjNo8OlRQ3UFqbLP2kpcnZt
         HSwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783443541; x=1784048341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V+0pheG9ogqbrNNEmsLqS/R7/lxeP3J7M6TTyjZm7Es=;
        b=HKYKlWbIY74SuInHFBKAMPizuEH3jYVYmRVeJymJRzgPUdRoEgGAvcFpimQWl6jrF5
         yArvbY1djj0esscxOX+9sYVGHWjNOV9BFJTg7OvJ9ISEEj+hlWj4U5k4ZcR0aJmy/0vW
         Wgj1eURJt32RWyL6z0dPJIl5Du8HK6BkfhcK8dLkqV/GOJIKf9CrAiP8UCqOzeHtqMRp
         gMsmu7dUPBVTR9oLA5PFxDPssu/1fEme7qklwhs6nQTYYQ+gphorSxDAYzgG5TO7DZAB
         LhDCeEVjpzA0KGxBZv0PjzSeMiDyVRfKPk0IFt7IRPBaV+DXK8LkO0s/SsnsWnFsCw9r
         CxOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443541; x=1784048341;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+0pheG9ogqbrNNEmsLqS/R7/lxeP3J7M6TTyjZm7Es=;
        b=UzEs7fE//Dn8wgxzyGXLchGBVDeUSdJXDuuBu6e3cyXoJW47V1kms+80QOcpSghEry
         pds362M8lFppnyu3SKtsPm8zHerCD1g4wWXe9Yb1REYtEFRk9NlE1XMGw8Mq1vhWfG2o
         4oYFshINh23dSl/DCmIcP7ntxRb8RT5seDMzJzCOz8EJgbPtMgHYmtIHAW3QjqlMTrwd
         o3h8yVxqZBMV8YLCVsKBtmO90NExqdlArcqtc3vjMz7thBEAXno/jxUqB5TAKclSG0KC
         QofXwBuLaQESM4BKcwktg9zbK6namT0FuzXnU4HhFKsOGggc/XRUUdAgX1Tk1RTwPQaL
         1Mpg==
X-Forwarded-Encrypted: i=1; AHgh+RreIYSy3ZHAHAh2N24JqsRkuCvzRZ42GWr/cNpA6zHQ00ADnCinE2bIUPPCwmH2gJLUpWMfIYsR/G0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnWAYUogP3/3ThiGCyoqLRT+0d7Wa+0rDppdLTU/MhH+qlQK4C
	RgnIU1ENmcKHyMjaRKSZT31Nfjn0RmAlvEPy74sDs7mCNZ43EIJJUj4M8MDvAQ4g+3/qMpEVr8I
	QzybBJb20xF5iazObJQsdXEHa3TVr1jQ/OEY6Ij1M8Zuk4iIsgrmRAgcx
X-Gm-Gg: AfdE7cncaMDyBmXGJTqyUIQRgRBvg3UrXWDqZWkJat+IUf3hYqlZpf7ZahwZblQpySf
	CNj7VhgSqAtUbQBZhU8vubSgRCervfyHIal2aMgf7Q8oPqwOt+G2kw9BNluf3Z9bigGqpPggFZC
	a9UIKeGSQfrpr//hNSTjTGWJkWIyj14vl4zo1BtWewKH35WbFNZy1YMQWToDIjcVB2YcqnENghh
	0FmyvoLdTFOGMsAiIcCviM5jW+fXV6DSjv0TbaNpcUc8TUf8myb0lSKpqNIUWWaACZCl0HSNBJ/
	cAjtPeI2MQ/8t5yEdRsjZzmBUDc=
X-Received: by 2002:a17:903:32d2:b0:2ca:6bf:5bac with SMTP id
 d9443c01a7336-2ccc9c2e544mr3390245ad.8.1783443540658; Tue, 07 Jul 2026
 09:59:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783361692.git.abhishekbapat@google.com>
 <f6bd1ff0257987dbb7512f93595eaa6962c6153b.1783361692.git.abhishekbapat@google.com>
 <4cc47988-49b3-4b73-90ed-a0a16a56a8dc@linux.dev>
In-Reply-To: <4cc47988-49b3-4b73-90ed-a0a16a56a8dc@linux.dev>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Tue, 7 Jul 2026 09:58:48 -0700
X-Gm-Features: AVVi8CfFdUMm1gAhA1nAbBcUBxXzhWfJGOy58ezcRxCaUnQUCzGM3HR43Ps1Zgw
Message-ID: <CAL41Mv6SdpOd=oLp9ceBkR-q_Y73Fx6rYjFO-Zc0hiNJjCFzYA@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] kselftest: alloc_tag: extend the allocinfo ioctl kselftest
To: Hao Ge <hao.ge@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Sourav Panda <souravpanda@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 8:28=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Abhishek
>
>
> On 2026/7/7 02:25, Abhishek Bapat wrote:
> > Add the following 2 scenarios to the allocinfo ioctl kselftest:
> > 1. Validate size based filtering
> > 2. Validate lineno based filtering
> >
> > The first test uses "do_init_module" as the candidate function for the
> > test. This is because the associated site will only allocate memory whe=
n
> > a kernel module is loaded. The return value of get_content_id() changes
> > every time modules are loaded or unloaded. Hence, as long as
> > get_content_id() values at the start and the end of the test are the
> > same, the memory allocated by the do_init_module call site should also
> > remain the same. Consequently, the test can assume consistency between
> > the value returned by the ioctl and the procfs resulting in less
> > flakiness.
> >
> > Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
> > ---
> >   .../alloc_tag/allocinfo_ioctl_test.c          | 216 +++++++++++++++++=
-
> >   1 file changed, 215 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c b=
/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > index 9ce7b53078b1..092348097204 100644
> > --- a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > +++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > @@ -5,6 +5,7 @@
> >    * Copyright (C) 2026 Google, Inc.
> >    */
> >
> > +#include <errno.h>
> >   #include <fcntl.h>
> >   #include <stdio.h>
> >   #include <stdlib.h>
> > @@ -312,11 +313,212 @@ static int test_function_filter(void)
> >       return run_filter_test(&filter);
> >   }
> >
> > +static int test_size_filter(void)
> > +{
> > +     int fd;
> > +     struct allocinfo_tag_data_vec *tags =3D malloc(sizeof(*tags));
> > +     struct allocinfo_tag_data_vec *procfs_entries =3D malloc(sizeof(*=
procfs_entries));
> > +     struct allocinfo_filter filter;
> > +     int ret =3D KSFT_PASS;
> > +     __u64 target_size, i, pos;
> > +     struct allocinfo_tag_data *found_tag =3D NULL;
> > +     const char *target_function =3D "do_init_module";
> > +     struct allocinfo_content_id start_cont_id, end_cont_id;
> > +     int retry =3D 0;
> > +     const int max_retries =3D 10;
> > +
> > +     if (!tags || !procfs_entries) {
> > +             ksft_print_msg("Memory allocation failed.\n");
> > +             ret =3D KSFT_FAIL;
> > +             goto freemem;
> > +     }
> > +
> > +     fd =3D open(ALLOCINFO_PROC, O_RDONLY);
> > +     if (fd < 0) {
> > +             ksft_print_msg("Failed to open " ALLOCINFO_PROC ": %s\n",=
 strerror(errno));
> > +             ret =3D KSFT_FAIL;
> > +             goto freemem;
> > +     }
> > +
> > +     do {
> > +             found_tag =3D NULL;
> > +             pos =3D 0;
> > +
> > +             if (__allocinfo_get_content_id(fd, &start_cont_id)) {
> > +                     ksft_print_msg("allocinfo_get_content_id failed\n=
");
> > +                     ret =3D KSFT_FAIL;
> > +                     goto exit;
> > +             }
> > +
> > +             memset(&filter, 0, sizeof(filter));
> > +             filter.mask |=3D ALLOCINFO_FILTER_MASK_FUNCTION;
> > +             strncpy(filter.fields.function, target_function, ALLOCINF=
O_STR_SIZE);
> > +
> > +             if (get_filtered_procfs_entries(procfs_entries, &filter))=
 {
> > +                     ksft_print_msg("Error retrieving entries from " A=
LLOCINFO_PROC "\n");
> > +                     ret =3D KSFT_FAIL;
> > +                     goto exit;
> > +             }
> > +
> > +             if (procfs_entries->count =3D=3D 0) {
> > +                     ksft_print_msg("Function %s not found in procfs\n=
", target_function);
> > +                     ret =3D KSFT_SKIP;
> > +                     goto exit;
> > +             }
> > +
> > +             target_size =3D procfs_entries->tag[0].counter.bytes;
> > +
> > +             memset(&filter, 0, sizeof(filter));
> > +             filter.mask |=3D ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCIN=
FO_FILTER_MASK_MAX_SIZE;
> > +             filter.min_size =3D target_size;
> > +             filter.max_size =3D target_size;
> > +
> > +             while (1) {
> > +                     struct allocinfo_get_at get_at_params;
> > +
> > +                     memset(&get_at_params, 0, sizeof(get_at_params));
> > +                     memcpy(&get_at_params.filter, &filter, sizeof(fil=
ter));
> > +                     get_at_params.pos =3D pos;
> > +
> > +                     if (__allocinfo_get_at(fd, &get_at_params))
> > +                             break;
> > +
> > +                     tags->count =3D 0;
> > +                     memcpy(&tags->tag[tags->count++], &get_at_params.=
data,
> > +                            sizeof(get_at_params.data));
> > +
> > +                     while (tags->count < VEC_MAX_ENTRIES &&
> > +                            __allocinfo_get_next(fd, &tags->tag[tags->=
count]) =3D=3D 0)
> > +                             tags->count++;
> > +
> > +                     for (i =3D 0; i < tags->count; i++) {
> > +                             if (strcmp(tags->tag[i].tag.function, tar=
get_function) =3D=3D 0) {
> > +                                     found_tag =3D &tags->tag[i];
> > +                                     break;
> > +                             }
> > +                     }
> > +
> > +                     if (found_tag || tags->count < VEC_MAX_ENTRIES)
> > +                             break;
> > +
> > +                     pos +=3D tags->count;
> > +             }
> > +
> > +             if (__allocinfo_get_content_id(fd, &end_cont_id)) {
> > +                     ksft_print_msg("allocinfo_get_content_id failed\n=
");
> > +                     ret =3D KSFT_FAIL;
> > +                     goto exit;
> > +             }
> > +
> > +             if (start_cont_id.id =3D=3D end_cont_id.id)
> > +                     break;
> > +
> > +             ksft_print_msg("Module load detected during size verifica=
tion, retrying...\n");
> > +     } while (retry++ < max_retries);
> > +
> > +     if (start_cont_id.id =3D=3D end_cont_id.id && !found_tag) {
> > +             ksft_print_msg("Entry with function %s not found in IOCTL=
 results\n",
> > +                            target_function);
> > +             ret =3D KSFT_FAIL;
> > +     } else if (start_cont_id.id !=3D end_cont_id.id) {
> > +             ksft_print_msg("Failed to match content_ids for procfs an=
d IOCTL, skipping...\n");
> > +             ret =3D KSFT_SKIP;
> > +     } else if (found_tag && found_tag->counter.bytes !=3D target_size=
) {
> > +             ksft_print_msg("IOCTL entry size %llu does not match targ=
et size %llu\n",
> > +                            found_tag->counter.bytes, target_size);
> > +             ret =3D KSFT_FAIL;
> > +     }
> > +
> > +exit:
> > +     close(fd);
> > +freemem:
> > +     free(tags);
> > +     free(procfs_entries);
> > +     return ret;
> > +}
> > +
> > +static int test_lineno_filter(void)
> > +{
> > +     struct allocinfo_tag_data_vec *tags =3D malloc(sizeof(*tags));
> > +     struct allocinfo_tag_data_vec *procfs_entries =3D malloc(sizeof(*=
procfs_entries));
> > +     struct allocinfo_filter filter;
> > +     enum ioctl_ret ioctl_status;
> > +     int ret =3D KSFT_PASS;
> > +     __u64 target_lineno, i;
> > +     struct allocinfo_tag_data *target_tag;
> > +     bool found =3D false;
> > +
> > +     if (!tags || !procfs_entries) {
> > +             ksft_print_msg("Memory allocation failed.\n");
> > +             ret =3D KSFT_FAIL;
> > +             goto exit;
> > +     }
> > +
> > +     memset(&filter, 0, sizeof(filter));
> > +
> > +     if (get_filtered_procfs_entries(procfs_entries, &filter)) {
> > +             ksft_print_msg("Error retrieving entries from " ALLOCINFO=
_PROC "\n");
> > +             ret =3D KSFT_FAIL;
> > +             goto exit;
> > +     }
> > +     if (procfs_entries->count =3D=3D 0) {
> > +             ksft_print_msg("Could not retrieve procfs entries\n");
> > +             ret =3D KSFT_SKIP;
> > +             goto exit;
> > +     }
> > +     /*
> > +      * We depend on the procfs results to determine the line number f=
or the filter before
> > +      * making the ioctl query. Hence, we cannot reuse run_filter_test=
 here.
> > +      */
> > +     target_tag =3D &procfs_entries->tag[0];
> > +     target_lineno =3D target_tag->tag.lineno;
> > +
> > +     filter.mask |=3D ALLOCINFO_FILTER_MASK_LINENO;
> > +     filter.fields.lineno =3D target_lineno;
> > +
> > +     ioctl_status =3D get_filtered_ioctl_entries(tags, &filter, 0);
> > +     if (ioctl_status =3D=3D IOCTL_INVALID_DATA) {
> > +             ksft_print_msg("Trouble retrieving valid IOCTL entries, s=
kipping.\n");
> > +             ret =3D KSFT_SKIP;
> > +             goto exit;
> > +     }
> > +     if (ioctl_status =3D=3D IOCTL_FAILURE) {
> > +             ksft_print_msg("Error retrieving IOCTL entries.\n");
> > +             ret =3D KSFT_FAIL;
> > +             goto exit;
> > +     }
> > +
> > +     for (i =3D 0; i < tags->count; i++) {
> > +             if (tags->tag[i].tag.lineno !=3D target_lineno) {
> > +                     ksft_print_msg("IOCTL entry %llu has incorrect li=
neno %llu.\n",
> > +                                    i, tags->tag[i].tag.lineno);
> > +                     ret =3D KSFT_FAIL;
> > +                     goto exit;
> > +             }
> > +
> > +             if (strncmp(tags->tag[i].tag.function, target_tag->tag.fu=
nction,
> > +                         ALLOCINFO_STR_SIZE) =3D=3D 0 &&
> > +                 strncmp(tags->tag[i].tag.filename, target_tag->tag.fi=
lename,
> > +                         ALLOCINFO_STR_SIZE) =3D=3D 0)
> > +                     found =3D true;
> > +     }
> > +
> > +     if (!found) {
> > +             ksft_print_msg("Original procfs entry not found in IOCTL =
lineno filter results.\n");
> > +             ret =3D KSFT_FAIL;
> > +     }
> > +
> > +exit:
> > +     free(tags);
> > +     free(procfs_entries);
> > +     return ret;
> > +}
> > +
> >   int main(int argc, char *argv[])
> >   {
> >       int ret;
> >
> > -     ksft_set_plan(2);
> > +     ksft_set_plan(4);
> >
> >       ret =3D test_filename_filter();
> >       if (ret =3D=3D KSFT_SKIP)
> > @@ -330,5 +532,17 @@ int main(int argc, char *argv[])
> >       else
> >               ksft_test_result(ret =3D=3D KSFT_PASS, "test_function_fil=
ter\n");
> >
> > +     ret =3D test_size_filter();
> > +     if (ret =3D=3D KSFT_SKIP)
> > +             ksft_test_result_skip("Skipping test_size_filter\n");
> > +     else
> > +             ksft_test_result(ret =3D=3D KSFT_PASS, "test_size_filter\=
n");
> > +
> > +     ret =3D test_lineno_filter();
> > +     if (ret =3D=3D KSFT_SKIP)
> > +             ksft_test_result_skip("Skipping test_lineno_filter\n");
> > +     else
> > +             ksft_test_result(ret =3D=3D KSFT_PASS, "test_lineno_filte=
r\n");
> > +
> >       ksft_finished();
> >   }
>
>
> https://sashiko.dev/#/patchset/cover.1783361692.git.abhishekbapat%40googl=
e.com
>
> Sashiko is really strict, but its warnings are legitimate. I ran the
> test program on a kernel built without
>
> CONFIG_MEM_ALLOC_PROFILING, and here are the results:
>
>
> [root@localhost alloc_tag]# ./allocinfo_ioctl_test
> 1..4
> # Failed to open /proc/allocinfo for reading
> # Error retrieving entries from /proc/allocinfo
> ok 1 # SKIP Skipping test_filename_filter
> # Failed to open /proc/allocinfo for reading
> # Error retrieving entries from /proc/allocinfo
> ok 2 # SKIP Skipping test_function_filter
> # Failed to open /proc/allocinfo: No such file or directory
> not ok 3 test_size_filter
> # Failed to open /proc/allocinfo for reading
> # Error retrieving entries from /proc/allocinfo
> not ok 4 test_lineno_filter
> # 2 skipped test(s) detected. Consider enabling relevant config options
> to improve coverage.
> # Totals: pass:0 fail:2 xfail:0 xpass:0 skip:2 error:0
> [root@localhost alloc_tag]#
>
>
> Looking at the test log above, some tests that ought to be skipped are
> flagged as failures.
>
> Would it make sense for us to go through all relevant test cases in the
> codebase,
>
> and check if we've missed any logic to skip tests when /proc/allocinfo
> is missing
>
> due to CONFIG_MEM_ALLOC_PROFILING being disabled?
>
>
> BTW,  when merging this series into the latest mm-new branch, there will
> be a minor header file conflict.
>
> This is because the series at
> https://lore.kernel.org/all/20260703-alloc-trylock-v5-15-c87b714e19d3@goo=
gle.com
> was merged ahead of this change.
>
> We might want to consider rebasing this series to resolve the header
> conflict.
>
>
> Thanks
>
> Best Regards
>
> Hao
>
>

Hi Hao,

Thanks for bringing this up, I discussed it with Andrew as well and
will fix it in the next version. Waiting for Suren's comments before
posting another version.

Thanks!
