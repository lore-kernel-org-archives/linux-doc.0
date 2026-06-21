Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAE3F9C0
	for <linux-doc@vger.kernel.org>; Sun, 21 Jun 2026 00:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782001907; cv=pass; b=bRYsSzxSbN1h34xruqzHhR4XVkyQcQX1Cj/pzuKixuyz4j9fw3LLN0yeO9/mYT0nRf5H98HPfIkCmS5IRtBe+gTik1rrMtAq9OE+D2uAkFa4d8nCOVApdtcbEyBze+EiEXxYGRY1wCLKvz2LpY8fqxo9hI68B5jx4Ow7ipyzRDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782001907; c=relaxed/simple;
	bh=EIU1t5nkNn2FTCQSfpksRzLqmc7sOJiWNrfPb2hEAHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JnkoJKi/2EsnzRi75lrUdYSiP9rjDhmd/Nnse0ewqZGNVl01uh6IoWajY6vKkiz5WU/I9pNkd26rgH4V+HBabwaSpS3y5f6kZJHRKmHq3B8U9ugOFYU80si9vTHSkMxp0ZYadbb0TiFu0sYv2pDIQLKuuSDohLDpXa6+F5PHwhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h0r31lru; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h0r31lru"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51765531803so465891cf.0
        for <linux-doc@vger.kernel.org>; Sat, 20 Jun 2026 17:31:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782001905; cv=none;
        d=google.com; s=arc-20260327;
        b=KnIjqcMc1yCcN0nb/Qgj8VrD2kSjKfAv9Ziihpt6YrHp0Y42hFCwpANw/rv9T1Z390
         d7/I3pPQIz+UTWcG0alCvUBEtftqr3L2Wx7OUowC06Hj3QoHxu78ulWuZTzt9w9ha6k7
         icSx+zlc5AvY+iAg/e0A56siCakZy9ngiX6Cn8S35inzdgg8Z8wDdwN/VdrkWf+YkR5O
         HLc9GYuQ/Z4ReTK2XhNWdRMrH0kBOFGp1Wb4vPqH4gxJMJGr+MUu6pNeSR9ZKwaUBXB4
         y5bLwrgY6XBJ+7lqT3FkDeqUO7TF5xRUe1KFz3AfDcctUVrS6UoIOTiyxnfNtPTV6trp
         tuNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t/7avvu3JxmkKSpM0Bw3iOtaoASVcC0L8AdB5HzPvqM=;
        fh=t5sbNORfvA8X+sigs4fD9E6/7LEHjeeIPLwkW4xubww=;
        b=O9K9u/IEZy3LWD4dVljhl/Z2mo3RbG9YrqyPNt1hnuzOszYdizec425bBgj/Re5ALr
         uArIKDKwGKcSGtEWgUpRf9UrfakyoVbfEPOwvEYpN3L+h07Nw9mHH5E86AXFTKm/Tvd0
         aCdqDoT2qg2ZevwqQQjzsmIN7AedprnfDDdPbiit3YjItaW9FCg6FiI4kXwXQvSbtpK9
         LQeHx6uOPz7CF300yWQ0lKM19EAYKDKnxnOI66NVu6Fi0uZfWrtii2HWfuNl+EK+L7Kq
         OsaDdw7BtBijsMNU4YVqUACdZ0eVQ6O3MLJIX8BfKyVsrTNX/qseia7YfebYACCD6wqh
         O4ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782001905; x=1782606705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t/7avvu3JxmkKSpM0Bw3iOtaoASVcC0L8AdB5HzPvqM=;
        b=h0r31lruTu7HwbUsdNIk69dLcqAT4TVm6vARzoqnP7HEpk21f5gdin3tLWg+S//cit
         gVJR1Nnh7t+7mixpMTX3iykHvGgCIDHs3GsgtyzTdsTaVkSMsnM0h65p0VZfqbQ2h8rC
         hTYj5uC4dMxe/KtsIJEC9+fj2FBvnPw/yaUESLkeA77Mcpc6K/YmmHKTJAaYMT/N3Kle
         wBA/xYvZ8A08hcS5HRZW30sCdCmlnBI0l93n6/Q5RksWqOMmazXDP8ItBHkmJY9R7uM2
         PfrZcZEyWyaRofVVfAqLdBIm0/gBeOPEu6oqv1/t+IepmwPOvUXlV+kZxxj0/3fQmE2R
         Ih3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782001905; x=1782606705;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t/7avvu3JxmkKSpM0Bw3iOtaoASVcC0L8AdB5HzPvqM=;
        b=DHUzYYyZvbKg1FzgU3WyW4/ixvCFiY94kS82ChiOF5Jk5yWoabo8uGtDmzCergMhmQ
         SBSETO8gNLMoLzVPi4LzOSFyAFt+bm4YRnKl3vvwf+FRMR8Vt7dSMMhaj5D5/Km5hHQS
         UHaDqSMBq+Vi7aXX26XsdAUIZRsM9i8BCsJorhfE+2EGDvCYGIA9D52iyEVIjD8WAHb+
         wmUDNZiHRGwSj1vSGw9MfYLW8PqYIQ3UEeGsEo1/uKNk9hGlf8elPmolVJJ2mveq2Y0m
         un5njXB1f++/KzXi+0Y1Kj8wcD/tH7FLR/HFoO6TSDYpS3R0zfajvwrBSRbjJVAfvfzn
         MLBw==
X-Forwarded-Encrypted: i=1; AFNElJ/AUBl9Ijw5xaEIrD3OXWpdS8QZp9si2eYfFCEfWeUxgdLkhpsbu2wzq08/+/MFfPXcDeDltqYngN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG0+FaAgYaLlP3J68KUsVD0IddLtTi/3FOrdwRBryFBscaKE4N
	ZkJxjk5FC0mxpk4xZ9tVz+4FgYjrCucO1cpcWBXxNpDCuwXJF9GDDS6QZc+K86kdmA9Porxzos5
	RdYlImS1ZHj0iPZXZ7DxVx+zO28ZI3vdVgr3bQrmcu7SSaLwGtpnfYf1UTvQ=
X-Gm-Gg: AfdE7cnx8YhDZ3ThTEAktVmcaC3EU6AKKGWMiMzJ1AxSJJBfGNwY9wVF9vayNCEoOae
	eOCGqIFQbrEdPg4gA1K/wzv8QQ78sshRvGVR7M4zLllRac3oA3abaopXnKaKzuhpII9W9YU9c4R
	XIyc4P5lZuMrPRxJzpDbfG2zEB0cZThqbTTaNoFfensplfJfE31dmqr2kx9vcQ+HdE7GBzNxSAI
	R1ifKq85+Taa7Igym72F1Ki+ijIqv/LRTsT6rMczBEuS0+Es9i9TgCbdxoGguoepz+asow=
X-Received: by 2002:ac8:5810:0:b0:50e:41f3:6467 with SMTP id
 d75a77b69052e-519e48d14d6mr16859591cf.12.1782001904596; Sat, 20 Jun 2026
 17:31:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1781803482.git.abhishekbapat@google.com> <5a485adaa95f8bdce7d29ddab30238b34e949f28.1781803482.git.abhishekbapat@google.com>
In-Reply-To: <5a485adaa95f8bdce7d29ddab30238b34e949f28.1781803482.git.abhishekbapat@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 20 Jun 2026 17:31:33 -0700
X-Gm-Features: AVVi8CeJ2bjOzYmP-W27RQlWiULWjVex-vrgUwPzqXYZ3HL8Z1E95q9kptgOpXE
Message-ID: <CAJuCfpEg6jqMbTP4ZEec_gCtaLAA6hHW0hmSsXf6hujB6sVODQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] kselftest: alloc_tag: extend the allocinfo ioctl kselftest
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Hao Ge <hao.ge@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Sourav Panda <souravpanda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 10:36=E2=80=AFAM Abhishek Bapat
<abhishekbapat@google.com> wrote:
>
> Add the following 2 scenarios to the allocinfo ioctl kselftest:
> 1. Validate size based filtering
> 2. Validate lineno based filtering
>
> The first test uses "do_init_module" as the candidate function for the
> test. This is because the associated site will only allocate memory when
> a kernel module is loaded. The return value of get_content_id() changes
> every time modules are loaded or unloaded. Hence, as long as
> get_content_id() values at the start and the end of the test are the
> same, the memory allocated by the do_init_module call site should also
> remain the same. Consequently, the test can assume consistency between
> the value returned by the ioctl and the procfs resulting in less
> flakiness.
>
> Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>

Couple of improvement suggestions, but otherwise LGTM.

> ---
>  .../alloc_tag/allocinfo_ioctl_test.c          | 198 +++++++++++++++++-
>  1 file changed, 197 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c b/t=
ools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> index 1ae0291f2245..50755a45d3fe 100644
> --- a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> +++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2026 Google, Inc.
>   */
>
> +#include <errno.h>
>  #include <fcntl.h>
>  #include <stdio.h>
>  #include <stdlib.h>
> @@ -313,11 +314,194 @@ static int test_function_filter(void)
>         return run_filter_test(&filter);
>  }
>
> +static int test_size_filter(void)
> +{
> +       int fd;
> +       struct allocinfo_tag_data_vec *tags =3D malloc(sizeof(*tags));
> +       struct allocinfo_tag_data_vec *procfs_entries =3D malloc(sizeof(*=
procfs_entries));
> +       struct allocinfo_filter filter;
> +       int ret =3D KSFT_PASS;
> +       __u64 target_size, i, pos;
> +       bool found;
> +       const char *target_function =3D "do_init_module";
> +       struct allocinfo_content_id start_cont_id, end_cont_id;
> +       int retry =3D 0;
> +       const int max_retries =3D 10;
> +
> +       if (!tags || !procfs_entries) {
> +               ksft_print_msg("Memory allocation failed.\n");
> +               ret =3D KSFT_FAIL;
> +               goto freemem;
> +       }
> +
> +       fd =3D open(ALLOCINFO_PROC, O_RDONLY);
> +       if (fd < 0) {
> +               ksft_print_msg("Failed to open " ALLOCINFO_PROC ": %s\n",=
 strerror(errno));
> +               ret =3D KSFT_FAIL;
> +               goto freemem;
> +       }
> +
> +       do {
> +               found =3D false;
> +               pos =3D 0;
> +
> +               if (__allocinfo_get_content_id(fd, &start_cont_id)) {
> +                       ksft_print_msg("allocinfo_get_content_id failed\n=
");
> +                       ret =3D KSFT_FAIL;
> +                       goto exit;
> +               }
> +
> +               memset(&filter, 0, sizeof(filter));
> +               filter.mask |=3D ALLOCINFO_FILTER_MASK_FUNCTION;
> +               strncpy(filter.fields.function, target_function, ALLOCINF=
O_STR_SIZE);
> +
> +               if (get_filtered_procfs_entries(procfs_entries, &filter))=
 {
> +                       ksft_print_msg("Error retrieving entries from " A=
LLOCINFO_PROC "\n");
> +                       ret =3D KSFT_FAIL;
> +                       goto exit;
> +               }
> +
> +               if (procfs_entries->count =3D=3D 0) {
> +                       ksft_print_msg("Function %s not found in procfs\n=
", target_function);
> +                       ret =3D KSFT_SKIP;
> +                       goto exit;
> +               }
> +
> +               target_size =3D procfs_entries->tag[0].counter.bytes;
> +
> +               memset(&filter, 0, sizeof(filter));
> +               filter.mask |=3D ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCIN=
FO_FILTER_MASK_MAX_SIZE;
> +               filter.min_size =3D target_size;
> +               filter.max_size =3D target_size;
> +
> +               while (1) {
> +                       struct allocinfo_get_at get_at_params;
> +
> +                       memset(&get_at_params, 0, sizeof(get_at_params));
> +                       memcpy(&get_at_params.filter, &filter, sizeof(fil=
ter));
> +                       get_at_params.pos =3D pos;
> +
> +                       if (__allocinfo_get_at(fd, &get_at_params))
> +                               break;
> +
> +                       tags->count =3D 0;
> +                       memcpy(&tags->tag[tags->count++], &get_at_params.=
data,
> +                              sizeof(get_at_params.data));
> +
> +                       while (tags->count < VEC_MAX_ENTRIES &&
> +                              __allocinfo_get_next(fd, &tags->tag[tags->=
count]) =3D=3D 0)
> +                               tags->count++;
> +
> +                       for (i =3D 0; i < tags->count; i++) {
> +                               if (strcmp(tags->tag[i].tag.function, tar=
get_function) =3D=3D 0) {
> +                                       found =3D true;
> +                                       break;
> +                               }
> +                       }
> +
> +                       if (found || tags->count < VEC_MAX_ENTRIES)
> +                               break;
> +
> +                       pos +=3D tags->count;
> +               }
> +
> +               if (__allocinfo_get_content_id(fd, &end_cont_id)) {
> +                       ksft_print_msg("allocinfo_get_content_id failed\n=
");
> +                       ret =3D KSFT_FAIL;
> +                       goto exit;
> +               }
> +
> +               if (start_cont_id.id =3D=3D end_cont_id.id)
> +                       break;
> +
> +               ksft_print_msg("Module load detected during size verifica=
tion, retrying...\n");
> +       } while (retry++ < max_retries);
> +
> +       if (start_cont_id.id =3D=3D end_cont_id.id && !found) {
> +               ksft_print_msg("Entry with function %s not found in IOCTL=
 results\n",
> +                              target_function);
> +               ret =3D KSFT_FAIL;
> +       } else if (start_cont_id.id !=3D end_cont_id.id) {
> +               ksft_print_msg("Failed to match content_ids for procfs an=
d IOCTL, skipping...\n");
> +               ret =3D KSFT_SKIP;
> +       }

I know we found the tag filtering by target_size and this might be
seen as unnecessary, but let's take one more final verification step
and check that tag.counter.bytes of the tag we found indeed equals
target_size. For that check you can replace "found" boolean with
"found_tag" pointer and the rest becomes trivial.

> +
> +exit:
> +       close(fd);
> +freemem:
> +       free(tags);
> +       free(procfs_entries);
> +       return ret;
> +}
> +
> +static int test_lineno_filter(void)
> +{
> +       struct allocinfo_tag_data_vec *tags =3D malloc(sizeof(*tags));
> +       struct allocinfo_tag_data_vec *procfs_entries =3D malloc(sizeof(*=
procfs_entries));
> +       struct allocinfo_filter filter;
> +       enum ioctl_ret ioctl_status;
> +       int ret =3D KSFT_PASS;
> +       __u64 target_lineno, i;
> +
> +       if (!tags || !procfs_entries) {
> +               ksft_print_msg("Memory allocation failed.\n");
> +               ret =3D KSFT_FAIL;
> +               goto exit;
> +       }
> +
> +       memset(&filter, 0, sizeof(filter));
> +
> +       if (get_filtered_procfs_entries(procfs_entries, &filter)) {
> +               ksft_print_msg("Error retrieving entries from " ALLOCINFO=
_PROC "\n");
> +               ret =3D KSFT_FAIL;
> +               goto exit;
> +       }
> +       if (procfs_entries->count =3D=3D 0) {
> +               ksft_print_msg("Could not retrieve procfs entries\n");
> +               ret =3D KSFT_SKIP;
> +               goto exit;
> +       }
> +       /*
> +        * We depend on the result of procfs entries to create the ioctl_=
filter. Hence we
> +        * cannot recycle the run_filter_test function here.
> +        */

The above comment is a bit unclear. What do you mean by "recycle the
run_filter_test function"? Also there is no variable called
ioctl_filter. I would change it to "filter later used in ioctl".

> +       target_lineno =3D procfs_entries->tag[0].tag.lineno;
> +
> +       filter.mask |=3D ALLOCINFO_FILTER_MASK_LINENO;
> +       filter.fields.lineno =3D target_lineno;
> +
> +       ioctl_status =3D get_filtered_ioctl_entries(tags, &filter, 0);
> +       if (ioctl_status =3D=3D IOCTL_INVALID_DATA) {
> +               ksft_print_msg("Trouble retrieving valid IOCTL entries, s=
kipping.\n");
> +               ret =3D KSFT_SKIP;
> +               goto exit;
> +       }
> +       if (ioctl_status =3D=3D IOCTL_FAILURE) {
> +               ksft_print_msg("Error retrieving IOCTL entries.\n");
> +               ret =3D KSFT_FAIL;
> +               goto exit;
> +       }
> +
> +       for (i =3D 0; i < tags->count; i++) {
> +               if (tags->tag[i].tag.lineno !=3D target_lineno) {
> +                       ksft_print_msg("IOCTL entry %llu has incorrect li=
neno %llu.\n",
> +                                      i, tags->tag[i].tag.lineno);
> +                       ret =3D KSFT_FAIL;
> +                       goto exit;
> +               }

You can improve the test to also check if the filtered collection you
retrieved contains the original tag you used to record target_lineno.

> +       }
> +
> +exit:
> +       free(tags);
> +       free(procfs_entries);
> +       return ret;
> +}
> +
>  int main(int argc, char *argv[])
>  {
>         int ret;
>
> -       ksft_set_plan(2);
> +       ksft_set_plan(4);
>
>         ret =3D test_filename_filter();
>         if (ret =3D=3D KSFT_SKIP)
> @@ -331,5 +515,17 @@ int main(int argc, char *argv[])
>         else
>                 ksft_test_result(ret =3D=3D KSFT_PASS, "test_function_fil=
ter\n");
>
> +       ret =3D test_size_filter();
> +       if (ret =3D=3D KSFT_SKIP)
> +               ksft_test_result_skip("Skipping test_size_filter\n");
> +       else
> +               ksft_test_result(ret =3D=3D KSFT_PASS, "test_size_filter\=
n");
> +
> +       ret =3D test_lineno_filter();
> +       if (ret =3D=3D KSFT_SKIP)
> +               ksft_test_result_skip("Skipping test_lineno_filter\n");
> +       else
> +               ksft_test_result(ret =3D=3D KSFT_PASS, "test_lineno_filte=
r\n");
> +
>         ksft_finished();
>  }
> --
> 2.55.0.rc0.786.g65d90a0328-goog
>
