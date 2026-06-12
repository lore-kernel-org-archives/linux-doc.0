Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3492D1913
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 00:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781223843; cv=pass; b=LFiquEV3ri7hoEDd9s6zY7BeqApTGFbp9yxYOIraSkoMhjfV4I3c+fauUub3JiLSeCnElZbtg3entVKSCVtpVi6nZwWtOVMTs4Y/j0/eFjQuOY/NHJx1giVZJvoLw53OOmu9CBs3oNlf2bWlpQanGHkjzKiabgkqnt2Mj8l6r8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781223843; c=relaxed/simple;
	bh=cJlzdbdrKQFHeJd3rx15bsCh3W/wO0tSboOZVdhYDlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c3Gbm+u2GBIwLaKoR4MXaHr4+rEjN1YtgFNxuDqtaiJOUYawrXVanhSbvzGJhv+PpSv/onehzyAiyWHn1lK8F+gOM0fvVFUYxgnD7NitvqEgShbK0QszojKex61w/NexU/NEFrkahG9fb4F8ZKcGLX4tkiRiaRdearhwqLYTFKM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KUniAkuU; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KUniAkuU"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf22c18ad3so48885ad.0
        for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 17:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781223841; cv=none;
        d=google.com; s=arc-20240605;
        b=gSnDiEL1r7MZt2CbbtYSXkrV9zYB8D8SZObW4LIRJlU2+UL9kpoJUT/oNCnWgl/5CS
         fJRburq0HU/k8oJZq7ImAoy5KjPPzAcntX9E4VC8aa/GTz8sQGPCQoTUPUIv7pkHTuVs
         pP0n1KuocdgO8AfX0NAX0ZoO0Tvw11I4oZHZ9nS69AS4sPPsgAaO6l8enkw+S4MQJy/e
         TPXdhzKg2ee9g7LXfOk68PSGJy/Podfu+mB4Pauwa+AeqK1VYlzyd6ICLPggWHPZmHdr
         6ECOWJQkihuYH3GeoDHD5nOZ3rYDC0bBNXf8el2bcW8gin0fOscdWBEAK0OB7XeHHANH
         Io6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jyXrMUC0RjTC8nbXHDAOeHanWGsmOWhzs5+AVdeqrmM=;
        fh=N28x4pkj1sYVd6UWxoNMciRwYKCLgkrJ4pCKloeo/7I=;
        b=ImKzSsQYe1XHEMgn3iLr9MpUqRFRUn3jQhKNq7NUSOBay1wF9oJfkKGTMesvsKOiX1
         qPQYW3LJM1CyuwlOzVP+jmdsa7AyQxyJjjOIEY/y/mt76+br4o9PQj8vuh3uGtKJ38L5
         ja2TEIMSuUasn6aTvu7sE+3QDnCa25W5NApfex0ADiXeMdTUQAXy6jG5ziG4ibOe6L8l
         bsVWBPTW2BlgWVqjmaEDB90sFHrIa3f3pwzI5RlXNM7pNGgnzKXqzCZlEP4DsJAQKCZr
         cFgyU/KkrlCnSkYEvgMCCtjaH3BKNaJglQSvFNVvdiWW+ybYcKwYHXgaKcpPehfiD5wy
         7e4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781223841; x=1781828641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyXrMUC0RjTC8nbXHDAOeHanWGsmOWhzs5+AVdeqrmM=;
        b=KUniAkuUP04sMZ7AZLJSXNEMPmdZD4AnhpLsA4t1W8j3JcKjkJ5vBSzkEnqnPOCN4d
         wjO7olV4ymWiBZk3upo1YDi5SqtA22dXtg05xrnbcSnWuMCpoHJz9q62I8DOsBJU2Fiv
         cG7UIsc+tpJWFgSzvneRaE/pOUgKnxlkicD3kEx0eDMDnQ6Jvd3MLdXhQplCnOjWQueF
         OoMHvg077riCI7VUphGOzpeTeHf+R5BCFki4YsGPxIk/PSpeI09tdYtSMKnmUrg80Y/B
         T5coMkz6XXG2ZBIE9UsT0m1kXar2m78WeEcFmw/28JKJ8niAaTt8ZjYcXXNwl0r3ILAV
         pO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781223841; x=1781828641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jyXrMUC0RjTC8nbXHDAOeHanWGsmOWhzs5+AVdeqrmM=;
        b=FadR9EjxuCRLz9fsnqAPh68LEdLLAHXEK7Ins41Pk7U9Xrju1VR0V+AmauVUs/qzan
         f4tshkwoakbkyguzvvnIbMDK1Dpsp+N3MqINsg1BRsjiNZ4SVaW7Ge/a9i7rsxxoEZ8S
         /3o0ia2phs5IpubBZTWlS+9nDVSdBCgM0iuShpn88Zp728RTnIh4Nz1LAfDrA1RnTa3w
         XqDZpa381Tnijw+pJ/VFCkyDonXK7W9ERssYBGUOig9SxSKiGksNciLW8v0hYgL85fZ6
         WHcZU+XC9pY4hS/0XtOI+0iinQ3Bz7ifOUKHHys/R6B6SrOigKpChJdp76Xh/A2E9XNW
         vHjA==
X-Forwarded-Encrypted: i=1; AFNElJ9dOytSI8bN0Sl84Odn+KzIYx+0aqHdQhtaoOXGdxPdoUrj5vAxASJyPA8UVh1IM79Qjav1H2ulVTc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjdH79qoVpkSCydFi9mD4tFaL2rH/UWpRiiMCvuPHu8MZp6KD1
	CCK8GP8FIGWqKto1fyUkcD5nbwkrRrD/peS8ubOXiP43kw+zobGJxIpytFu5cMo5948ZqnDv30M
	lXUm3gh+DwiHc1vPM00fsBT+TY84Glb5Fn/URdHRp
X-Gm-Gg: Acq92OHjl3yeoKFBrl28FYwW1TrK46SX7+w83HE/N2f+oeB4urCrPqBuHQT2piQ91s5
	y12YDGygSOYUxx3um/sLNlLzxoyEeM3eGAFJQopIvmvhwyxE8cmC3n50K01H/2r9xHSi5MziAm0
	+jQcpmpbdFVcwSVaQKyjhbU4x+RJvLnkohW3bR/Ng0V5gzPjz0Kwbb3cZPUTX7vGvsvIv1JVuno
	zga5GyVp4/8nujL9/G9R1AWEWSgrpyhPGe54Aj/R/8k7J11V6x4pZTHYSn1yiAEkRtc2fxt2qos
	AWrWfw6CXCDfT56L106mV3cA2zyrVr6HkRVLeg==
X-Received: by 2002:a17:903:2b03:b0:2bd:6727:d689 with SMTP id
 d9443c01a7336-2c3e10657b2mr1140345ad.12.1781223840341; Thu, 11 Jun 2026
 17:24:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1781042698.git.abhishekbapat@google.com>
 <d0a8308b4d0799876d24461a8ed9b5a71d3e1e89.1781042698.git.abhishekbapat@google.com>
 <c7ae2aa9-a1fb-4965-a213-f9cfb2aa101e@linux.dev>
In-Reply-To: <c7ae2aa9-a1fb-4965-a213-f9cfb2aa101e@linux.dev>
From: Abhishek Bapat <abhishekbapat@google.com>
Date: Thu, 11 Jun 2026 17:23:48 -0700
X-Gm-Features: AVVi8CfF5CHgoW_9yOQmI4p_7KWANitzcX4FWUhUywKGZOQVl_gGnfRVD-S8jvU
Message-ID: <CAL41Mv5eoi=ms-x8roBnuxj4pzYKQjsSthzom_wzCM39JAXe+Q@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] kselftest: alloc_tag: extend the allocinfo ioctl kselftest
To: Hao Ge <hao.ge@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Sourav Panda <souravpanda@google.com>, Suren Baghdasaryan <surenb@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026 at 2:34=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Abhishek
>
>
> On 2026/6/10 08:12, Abhishek Bapat wrote:
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
> >   .../alloc_tag/allocinfo_ioctl_test.c          | 204 +++++++++++++++++=
-
> >   1 file changed, 203 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c b=
/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > index cd9cf229ae1f..5d2f13900a47 100644
> > --- a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > +++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> > @@ -311,11 +311,201 @@ static int test_function_filter(void)
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
> > +             ksft_exit_skip("Failed to open " ALLOCINFO_PROC ": %s\n",=
 strerror(errno));
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
> > +             if (get_filtered_procfs_entries(procfs_entries, &filter, =
fd)) {
> > +                     ksft_print_msg("Error retrieving entries from " A=
LLOCINFO_PROC "\n");
> > +                     ret =3D KSFT_FAIL;
> > +                     goto exit;
> > +             }
> > +
>
>
> As I mentioned for patch 5, the retry loop in test_size_filter calls
>
> get_filtered_procfs_entries() which reads fd to EOF via fdopen/fgets.
>
> If a module load triggers a retry, the second call to
> get_filtered_procfs_entries() gets EOF
>
> immediately.
>
> And Sashiko has also reported several minor issues.
>
>
> Thanks
>
> Best Regards
>
> Hao
>
Hi All,

Please note that I am moving the file descriptor definitions inside
each of the functions. That makes the code much cleaner and avoids the
weird scenarios related to using the same file descriptor everywhere.
I will include this change along with fixes for some of the other
issues Sashiko identified.

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
> > +     int fd;
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
> > +             goto freemem;
> > +     }
> > +
> > +     fd =3D open(ALLOCINFO_PROC, O_RDONLY);
> > +     if (fd < 0) {
> > +             ksft_exit_skip("Failed to open " ALLOCINFO_PROC ": %s\n",=
 strerror(errno));
> > +             ret =3D KSFT_FAIL;
> > +             goto freemem;
> > +     }
> > +
> > +     memset(&filter, 0, sizeof(filter));
> > +
> > +     if (get_filtered_procfs_entries(procfs_entries, &filter, fd)) {
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
> > +     ioctl_status =3D get_filtered_ioctl_entries(tags, &filter, fd, 0)=
;
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
> > +     close(fd);
> > +freemem:
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
> > @@ -329,5 +519,17 @@ int main(int argc, char *argv[])
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
