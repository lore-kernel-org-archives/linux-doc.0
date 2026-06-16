Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774644657F8
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 16:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781629024; cv=pass; b=uty8WA+wjBF8nJxhJAHSl22TfCNhaT2MEcJ2izHALCT4C32rZu3QMg41/Qdnv6ndkn2MQs5MxLn5Qw8xtgiJtT9Key1cAqVedgz+5rbMtuljVfH4uSxGZh60lGDCbzlCFL598nWX5HvQ4qlha0Z9To+HjPYqy2fojbOIEz8sdi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781629024; c=relaxed/simple;
	bh=UECSVhWYkP4sLWSR0R/9rKU98EXxfQJWTwIp6aHVf+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQw6PG4sUZ4WBs9sBuiPlKP0XsYy1RC41t1dTdPUHiHt4+5HOnAjSofrzKGY0TZC79+yoIQP3lDp9R8+jE9iN3s1ueu5NWc5FYQzL6iTa/QlyuBj8hXNpfwT5srBlTTo+MBeHW1Ez4P8MbbJZRXKBZLi8jSh9mOP3PLRVm2CD0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CsSwi0CM; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CsSwi0CM"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c6a4eccab1so1275ad.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 09:57:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781629022; cv=none;
        d=google.com; s=arc-20240605;
        b=aWx90IGfHvF5jqiRJt8RmMg7Mkj+8vsdKQfvBWB2kCJqBZ+t2Kem9G7ZhzpHWK6DMX
         lvlnTR7qcQ3IHgvhfrFcIyEfVqfgUoXlMzN1glpgzGRg0b0iWj/rZGCeGR0reU/YDnRy
         LLD/BPqe1sdVFueJNms7bTILZEBtiQYaHWL78DwBYRELGjYnQKzNOnG0TKUpLGmEfQ3j
         w9432750eKWO2BLUTsW0ERBCyuZiN689/EtbjtJtwtwI593Cfe6o8u2sgt2XZPvPtRwL
         hZYp2ZymPleZYXG5Q2TE46N5hwY1e8Av4O1ejIopkwaBT2go2OhYnxV4GVoIczCmI8tm
         dctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IMviEuCDkBMrPwRjrS65z+u0zLyVMty1GBcioAfFiHY=;
        fh=lZ6916tpVdfeij2gpLuSPkD4xVZsODsOIByDjmnhkZw=;
        b=YNrGDZI0PHdlqAbHgqtbMFpBFe5cPgVXiFlXGSYzx6ThXPjY8MuAxGte6i0TgdIJwZ
         5VFC8acCITExubQ083Aq2ikobz2E0cb+jGnh0KZe7Kgvzd1G29QnPbvZ5kZ0EiOOYYHi
         7mC3pyILp6G9Q+prNN0w0dCGKMwGbtyG8XSAhu84RMyWGH5WPSf7YhMdqUDj/Nv71nkL
         1C9YujkYMidjDn5cbFaJHsHRGWQxu0W/KmcGpH8DUu6LqDtNOX1kNakY2gIGW9htpTDw
         jD1jwjen06lQLDG/PQ0P9hl7gSvJSrrPsihJ/sUV8ow1WHL41O0vyYNSB7loH8+SDpCe
         XAbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781629022; x=1782233822; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IMviEuCDkBMrPwRjrS65z+u0zLyVMty1GBcioAfFiHY=;
        b=CsSwi0CMQ6ji2WJqnAFINkB64HRQ9rugEGg9g9m0HDM+2HOqMGaioDFLz5zj51lC70
         jyEVoUAV768cT0AGhthAdEyam8NbKzlB+I+j9umsdnsVL5sE3NKNOvTnrzAz8SwnM2e0
         rhO004ingIbAtEl+Dol1G89ilBIEKnYN7tWXfJHpvN6TUKrVXY8ukzyv2bcLptXWFM0n
         BgvDZ6vxpWWc2BDKtD4P7JcEMFicphl024f9P3Li2GUp+BTIEzIBIGBEFyfiI+PPVpen
         w5E8GUN74RwcpArzQMJsYqMgyVd3mJ1Z2n7eZbHr64ANilD5KZNw9A7JdqS+6uysbLP3
         R1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781629022; x=1782233822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IMviEuCDkBMrPwRjrS65z+u0zLyVMty1GBcioAfFiHY=;
        b=Thr0/YQgL1wjUC18Y8+KBq0CnPjqxoWLMumf76lONSrbLPZrDwMq+1Tv4drQIrF4y8
         b/lYSF+/azL7OzXuie6OjwNdgmnuc3Pai2Me+HvEI0mwFsO3XxZZsBiKzNMBktiTv/ye
         ub1ztiDUh1r7Jh/QarhuUfsgGOrcOSSsZ4I8LT6/rX79z2LiTcBY60qmosYUTP8G05qF
         qHnhfqyz4lWTHMyVa1F1xdMFjtzpSeFqHVEnrRUlt6mEems2iXTzC9Al1Jjkk/qv6fwB
         2ImhqmsNE23y1y+6kZeMheIC1J/G0TNaWfElLQHMzpOflz8+atnNipngxTN4k5KW9Cis
         to4w==
X-Forwarded-Encrypted: i=1; AFNElJ/Yaw6LcIsGrDGUcL28fwB/oJhlW3jbNGDQTtk8GXiiwYNM6+ZaSfc/2Co8T9dGdJlgUngkot0rtG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVDKju73i5LMlOvLUn8vm464HKHqbPSa99nEcrauWqI1on50yb
	Ll87XOIWE7zpiTiXBb/INFQbxixI61R7rXY4IgZjZq+dDaqMylnyDLr6ltzxMyMrivinbLyzDq0
	KcCoZb1lYwP+ndOO3soGpabMYG1l+GEJazGVK0uTO
X-Gm-Gg: Acq92OHmkCUnzpXUp/CbR+tUhUL+zfZCkdLCy9hoq2Owe31xnCexE+QifkzMzaImjpv
	BH1W0QN1WTISxa7gIpnq0quvIPHtQ28aU01ivobR232ZRiSgagSQ8Xx/+DTw0PrcrURj2J8HFKb
	dBIdM63KYUzZUMgzM4lk+zMvjZ8BziBS27iaACBC+T4UUm+P2iIHkCNczqeEYXR/L5HKgzVpYOw
	KjK1Zo83E0CRJCkYS7GPN1fUD0N3acc5l6yIkbzmN7/HDn3jZIQy19Lh01nNpKzGIHycF5VxjA9
	Tv/jPF2yG0mxj69u2ZGfg1qQss1ljRxWFqVttQ==
X-Received: by 2002:a17:903:4b47:b0:2ba:6518:e4d8 with SMTP id
 d9443c01a7336-2c69a30be19mr2222665ad.20.1781629021114; Tue, 16 Jun 2026
 09:57:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1781564384.git.abhishekbapat@google.com>
 <1a68864b1493528abed0e9e3489688fc6287c37e.1781564384.git.abhishekbapat@google.com>
 <8e554bce-bd66-4481-bc53-fa4cbaf0c0b9@linux.dev>
In-Reply-To: <8e554bce-bd66-4481-bc53-fa4cbaf0c0b9@linux.dev>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Tue, 16 Jun 2026 09:56:48 -0700
X-Gm-Features: AVVi8CdGEXAE7f78CwWc3jRhOwC0BnHsvEC3kawu3AF1rMOPeiKHwo4utET_39k
Message-ID: <CAL41Mv7By-q-dXwFbDzrqqWeCh-CR8UdPpmcgfdsUX+xNZsH_Q@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] kselftest: alloc_tag: extend the allocinfo ioctl kselftest
To: Hao Ge <hao.ge@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Sourav Panda <souravpanda@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 11:19=E2=80=AFPM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Abhishek
>
>
> On 2026/6/16 07:04, Abhishek Bapat wrote:
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
> >   .../alloc_tag/allocinfo_ioctl_test.c          | 197 +++++++++++++++++=
-
> >   1 file changed, 196 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c b=
/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > index 62d5a488a04d..041fee1a3d74 100644
> > --- a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > +++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > @@ -309,11 +309,194 @@ static int test_function_filter(void)
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
> > +     bool found;
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
>
>
> I see. The #include <errno.h> you added in patch 5 is meant for this
> spot, right?
>
> If that's the case, I'd prefer moving the #include <errno.h>
>
> addition into this patch, though this is a trivial detail either way.
>
>
> Thanks
>
> Best Regards
>
> Hao
>
>
Ack, will do.
> > +             ret =3D KSFT_FAIL;
> > +             goto freemem;
> > +     }
> > +
> > +     do {
> > +             found =3D false;
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
> > +                                     found =3D true;
> > +                                     break;
> > +                             }
> > +                     }
> > +
> > +                     if (found || tags->count < VEC_MAX_ENTRIES)
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
> > +     if (start_cont_id.id =3D=3D end_cont_id.id && !found) {
> > +             ksft_print_msg("Entry with function %s not found in IOCTL=
 results\n",
> > +                            target_function);
> > +             ret =3D KSFT_FAIL;
> > +     } else if (start_cont_id.id !=3D end_cont_id.id) {
> > +             ksft_print_msg("Failed to match content_ids for procfs an=
d IOCTL, skipping...\n");
> > +             ret =3D KSFT_SKIP;
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
> > +      * We depend on the result of procfs entries to create the ioctl_=
filter. Hence we
> > +      * cannot recycle the run_filter_test function here.
> > +      */
> > +     target_lineno =3D procfs_entries->tag[0].tag.lineno;
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
> > @@ -327,5 +510,17 @@ int main(int argc, char *argv[])
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
