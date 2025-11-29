Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5959A2144CF
	for <linux-doc@vger.kernel.org>; Sat, 29 Nov 2025 07:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764402456; cv=none; b=Z41hmjXnMDGbPtRebIjKTSgTHV547Y/MeMuV7pnU8RrynPyb98a6Et6/gQQa95bRgymk778p/YYAPu24+nmz7mLL67BAsE0zzw6V0CB9uNkWKAL4cdfJtZNNiQMUqHzGB/Yrj2IpDdsUxSdJ7On8C7CJSyWOfkBaOs01CF0W76o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764402456; c=relaxed/simple;
	bh=AKECNOQ6qbqlG2k1N06SzA+GRHfrRqWM099YEuuqKZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+mP4WDCiyNAK7fArxC4gbKOepgdohlV7d42QABoytNjtvMWGW9KCAgI1z/v3ilJV48NY/+Is+TwVJfakY/YsIO/zPlA8DW+qt2qzZ462Q6HrF7OZDgErW9QSFUhYmeay0vgqT4zYIvRBHs79CQIfKJTdyG0EusRVNiqAQSHiq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qKH6Ktuv; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qKH6Ktuv"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-88051279e87so26401936d6.3
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 23:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764402453; x=1765007253; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0hbwzlidk4m9G8AcSWmBN3INrW3hocsGQKXW1cJMfnw=;
        b=qKH6KtuvD/Bky4zhgQVkD8ev2qzUeFcZC2dp8oieR8WRRTa6Vg0GrVDU6xzHthMEvc
         9x4jTl4Ts6DLqMsR0DkagMaI0nRBPEeveAxqaRPO922tDaEaU+E7BmpWPRA5WNJi8T9/
         llmnDxPmJRo1jCW4e7B8FK7VXgclg4rfifVCzZy6qgFr0Zu/9z4vxifV+XX2Hw26jqwd
         MxmBe7Zyh6e3p15L8iJkcfCjAO05al6bNuVG59xkCjg0YFM12rPaxl6+shszX43DbnZt
         vOZQG7jOyIcLUKXT5vbpYPwbLnsYcrpSfEymU8lekbGO7la4R6tpIyhdaXFhJFwftDuE
         UfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764402453; x=1765007253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hbwzlidk4m9G8AcSWmBN3INrW3hocsGQKXW1cJMfnw=;
        b=rHMdS1mV6/zIACPNuuJkMaXe6htjbVLLLaHu+NVEKFOjXm1TnLLDNjmkEZ9DWtfwCa
         V8PstEi7q7iNFXEsGoQfHLPBusjrn16WZVwcVpmt8b0sKGQRMRYW0P5QW/BKnJhow6Z0
         C4G6R2UYwDr4kgiXZWsqAzHJIOO5VfuBjcQXqR2ZyXqEO92tvswxLaTjiNBk/Ont8b2W
         RpWEZ2Y9Refybs5fmkjxjqiO2Ks35gR7f9g9j9s58uRv9R0mSf7ZXyxO6VAqqae0HBqi
         8MYLtWLQl3WaiOuHLH18b2bjE4Kvm7Q5Nx6EmLgoKgzX702OZbTNWB869wf0gxu0lBwX
         NkOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwVfXoBynh0BGwiFQjVrZNX+CiD0nkAusIiVBo1Nh4gHUyhRR44ZhxHvfXNqP/uy7M1zvqPwAyy8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvywqN4ieN7hRKcg2pIKdhuJulKfNcWhHbFwQJuGz+s1loam5U
	zkYQKCStOBO8wXlmgOqQ6Gom1DmDwHsQOcbOgRkVQ47p6GYhCZVGYtaWSdOh1DAUfgacK5B+829
	uXHyyjmQX3nc9mAUjfg9UaSZFhutUCJR6IG+VvHTX
X-Gm-Gg: ASbGnctkQ7NyZYaWGWOM/OiEflHh/yg9wzCVkMA8Z/YId4WaDSpS+07quf1QP+kMfvH
	GkY7CHghzZw4xlIdNlCeUCalsNKTnsi/V/rSzbYh4+wwINcfj6zVTcgCBqrtnbok6KrWGgOpiXY
	mGVTuUl5JMpkoY2Sm0tUO87tXoUPEXRmotoVpt1X8wND6geFZNs4qD5hEgVw2MCakBt97a8vwKi
	jmPPcLGouqet+Owq+w+Q5TkN7Xv3BnkDWur54vjXOy0a/sfqigi2DB1jpusBDuOHeo4VnmuTlnx
	Ph4R
X-Google-Smtp-Source: AGHT+IHqyHjn7AALomnktzoYNEm9/A9wlGcSnLgrB4JI8VIUqoTfF1lZpox7S5wThvwjyCjojXcmc1ei2Mpc/s+knAU=
X-Received: by 2002:a05:6214:268b:b0:7ef:d35f:e1e3 with SMTP id
 6a1803df08f44-8847c53632fmr520653856d6.57.1764402453016; Fri, 28 Nov 2025
 23:47:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126185725.4164769-1-pasha.tatashin@soleen.com> <20251126185725.4164769-3-pasha.tatashin@soleen.com>
In-Reply-To: <20251126185725.4164769-3-pasha.tatashin@soleen.com>
From: David Gow <davidgow@google.com>
Date: Sat, 29 Nov 2025 15:47:20 +0800
X-Gm-Features: AWmQ_bkr2CL7aScN4z1mPIc1WdwRy0X8_T8UqP_lySmhm4v07IvSKU6QHltfcuI
Message-ID: <CABVgOSkPMugdzjRoL9-NyJFWM3KJbUhoTG3BswbAqjyod4NbOQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] list: add kunit test for private list primitives
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: corbet@lwn.net, nicolas.frattaroli@collabora.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, kees@kernel.org, pmladek@suse.com, 
	tamird@gmail.com, raemoar63@gmail.com, ebiggers@kernel.org, 
	diego.daniel.professional@gmail.com, rppt@kernel.org, pratyush@kernel.org, 
	jasonmiu@google.com, graf@amazon.com, dmatlack@google.com, 
	rientjes@google.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000007ca3d40644b6f5d2"

--0000000000007ca3d40644b6f5d2
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Nov 2025 at 02:57, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
>
> Add a KUnit test suite for the new private list primitives.
>
> The test defines a struct with a __private list_head and exercises every
> macro defined in <linux/list_private.h>.
>
> This ensures that the macros correctly handle the ACCESS_PRIVATE()
> abstraction and compile without warnings when acting on private members,
> verifying that qualifiers are stripped and offsets are calculated
> correctly.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---

Thanks -- I'm glad to see tests added with this!

I'd be okay with this living in the same config option as the other
list tests (LIST_KUNIT_TEST) if you'd prefer, but don't particularly
mind either way.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

>  lib/Kconfig.debug             | 14 +++++++
>  lib/tests/Makefile            |  1 +
>  lib/tests/list-private-test.c | 76 +++++++++++++++++++++++++++++++++++
>  3 files changed, 91 insertions(+)
>  create mode 100644 lib/tests/list-private-test.c
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 42143686151f..fa9388726182 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2788,6 +2788,20 @@ config LIST_KUNIT_TEST
>
>           If unsure, say N.
>
> +config LIST_PRIVATE_KUNIT_TEST
> +       tristate "KUnit Test for Kernel Private Linked-list structures" if !KUNIT_ALL_TESTS
> +       depends on KUNIT
> +       default KUNIT_ALL_TESTS
> +       help
> +         This builds the KUnit test for the private linked-list primitives
> +         defined in include/linux/list_private.h.
> +
> +         These primitives allow manipulation of list_head members that are
> +         marked as private and require special accessors (ACCESS_PRIVATE)
> +         to strip qualifiers or handle encapsulation.
> +
> +         If unsure, say N.
> +
>  config HASHTABLE_KUNIT_TEST
>         tristate "KUnit Test for Kernel Hashtable structures" if !KUNIT_ALL_TESTS
>         depends on KUNIT
> diff --git a/lib/tests/Makefile b/lib/tests/Makefile
> index 601dba4b7d96..62a7f115f622 100644
> --- a/lib/tests/Makefile
> +++ b/lib/tests/Makefile
> @@ -25,6 +25,7 @@ obj-$(CONFIG_TEST_IOV_ITER) += kunit_iov_iter.o
>  obj-$(CONFIG_IS_SIGNED_TYPE_KUNIT_TEST) += is_signed_type_kunit.o
>  obj-$(CONFIG_KPROBES_SANITY_TEST) += test_kprobes.o
>  obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o
> +obj-$(CONFIG_LIST_PRIVATE_KUNIT_TEST) += list-private-test.o
>  obj-$(CONFIG_KFIFO_KUNIT_TEST) += kfifo_kunit.o
>  obj-$(CONFIG_TEST_LIST_SORT) += test_list_sort.o
>  obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
> diff --git a/lib/tests/list-private-test.c b/lib/tests/list-private-test.c
> new file mode 100644
> index 000000000000..3bd62939ae67
> --- /dev/null
> +++ b/lib/tests/list-private-test.c
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KUnit compilation/smoke test for Private list primitives.
> + *
> + * Copyright (c) 2025, Google LLC.
> + * Pasha Tatashin <pasha.tatashin@soleen.com>
> + */
> +#include <linux/list_private.h>
> +#include <kunit/test.h>
> +
> +/*
> + * This forces compiler to warn if you access it directly, because list
> + * primitives expect (struct list_head *), not (volatile struct list_head *).
> + */
> +#undef __private
> +#define __private volatile
> +
> +/* Redefine ACCESS_PRIVATE for this test. */
> +#undef ACCESS_PRIVATE
> +#define ACCESS_PRIVATE(p, member) \
> +       (*((struct list_head *)((unsigned long)&((p)->member))))
> +
> +struct list_test_struct {
> +       int data;
> +       struct list_head __private list;
> +};
> +
> +static void list_private_compile_test(struct kunit *test)
> +{
> +       struct list_test_struct entry;
> +       struct list_test_struct *pos, *n;
> +       LIST_HEAD(head);
> +
> +       INIT_LIST_HEAD(&ACCESS_PRIVATE(&entry, list));
> +       list_add(&ACCESS_PRIVATE(&entry, list), &head);
> +       pos = &entry;
> +
> +       pos = list_private_entry(&ACCESS_PRIVATE(&entry, list), struct list_test_struct, list);
> +       pos = list_private_first_entry(&head, struct list_test_struct, list);
> +       pos = list_private_last_entry(&head, struct list_test_struct, list);
> +       pos = list_private_next_entry(pos, list);
> +       pos = list_private_prev_entry(pos, list);
> +       pos = list_private_next_entry_circular(pos, &head, list);
> +       pos = list_private_prev_entry_circular(pos, &head, list);
> +
> +       if (list_private_entry_is_head(pos, &head, list))
> +               return;
> +
> +       list_private_for_each_entry(pos, &head, list) { }
> +       list_private_for_each_entry_reverse(pos, &head, list) { }
> +       list_private_for_each_entry_continue(pos, &head, list) { }
> +       list_private_for_each_entry_continue_reverse(pos, &head, list) { }
> +       list_private_for_each_entry_from(pos, &head, list) { }
> +       list_private_for_each_entry_from_reverse(pos, &head, list) { }
> +
> +       list_private_for_each_entry_safe(pos, n, &head, list)
> +               list_private_safe_reset_next(pos, n, list);
> +       list_private_for_each_entry_safe_continue(pos, n, &head, list) { }
> +       list_private_for_each_entry_safe_from(pos, n, &head, list) { }
> +       list_private_for_each_entry_safe_reverse(pos, n, &head, list) { }
> +}
> +
> +static struct kunit_case list_private_test_cases[] = {
> +       KUNIT_CASE(list_private_compile_test),
> +       {},
> +};
> +
> +static struct kunit_suite list_private_test_module = {
> +       .name = "list-private-kunit-test",
> +       .test_cases = list_private_test_cases,
> +};
> +
> +kunit_test_suite(list_private_test_module);
> +
> +MODULE_DESCRIPTION("KUnit compilation test for private list primitives");
> +MODULE_LICENSE("GPL");
> --
> 2.52.0.487.g5c8c507ade-goog
>

--0000000000007ca3d40644b6f5d2
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUnQYJKoZIhvcNAQcCoIIUjjCCFIoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghIEMIIGkTCCBHmgAwIBAgIQfofDAVIq0iZG5Ok+mZCT2TANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNDdaFw0zMjA0MTkwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFI2IFNNSU1FIENBIDIwMjMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYydcdmKyg
4IBqVjT4XMf6SR2Ix+1ChW2efX6LpapgGIl63csmTdJQw8EcbwU9C691spkltzTASK2Ayi4aeosB
mk63SPrdVjJNNTkSbTowej3xVVGnYwAjZ6/qcrIgRUNtd/mbtG7j9W80JoP6o2Szu6/mdjb/yxRM
KaCDlloE9vID2jSNB5qOGkKKvN0x6I5e/B1Y6tidYDHemkW4Qv9mfE3xtDAoe5ygUvKA4KHQTOIy
VQEFpd/ZAu1yvrEeA/egkcmdJs6o47sxfo9p/fGNsLm/TOOZg5aj5RHJbZlc0zQ3yZt1wh+NEe3x
ewU5ZoFnETCjjTKz16eJ5RE21EmnCtLb3kU1s+t/L0RUU3XUAzMeBVYBEsEmNnbo1UiiuwUZBWiJ
vMBxd9LeIodDzz3ULIN5Q84oYBOeWGI2ILvplRe9Fx/WBjHhl9rJgAXs2h9dAMVeEYIYkvW+9mpt
BIU9cXUiO0bky1lumSRRg11fOgRzIJQsphStaOq5OPTb3pBiNpwWvYpvv5kCG2X58GfdR8SWA+fm
OLXHcb5lRljrS4rT9MROG/QkZgNtoFLBo/r7qANrtlyAwPx5zPsQSwG9r8SFdgMTHnA2eWCZPOmN
1Tt4xU4v9mQIHNqQBuNJLjlxvalUOdTRgw21OJAFt6Ncx5j/20Qw9FECnP+B3EPVmQIDAQABo4IB
ZTCCAWEwDgYDVR0PAQH/BAQDAgGGMDMGA1UdJQQsMCoGCCsGAQUFBwMCBggrBgEFBQcDBAYJKwYB
BAGCNxUGBgkrBgEEAYI3FQUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUM7q+o9Q5TSoZ
18hmkmiB/cHGycYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwewYIKwYBBQUHAQEE
bzBtMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vcm9vdHI2MDsGCCsG
AQUFBzAChi9odHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9yb290LXI2LmNydDA2
BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMBEG
A1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQwFAAOCAgEAVc4mpSLg9A6QpSq1JNO6tURZ4rBI
MkwhqdLrEsKs8z40RyxMURo+B2ZljZmFLcEVxyNt7zwpZ2IDfk4URESmfDTiy95jf856Hcwzdxfy
jdwx0k7n4/0WK9ElybN4J95sgeGRcqd4pji6171bREVt0UlHrIRkftIMFK1bzU0dgpgLMu+ykJSE
0Bog41D9T6Swl2RTuKYYO4UAl9nSjWN6CVP8rZQotJv8Kl2llpe83n6ULzNfe2QT67IB5sJdsrNk
jIxSwaWjOUNddWvCk/b5qsVUROOuctPyYnAFTU5KY5qhyuiFTvvVlOMArFkStNlVKIufop5EQh6p
jqDGT6rp4ANDoEWbHKd4mwrMtvrh51/8UzaJrLzj3GjdkJ/sPWkDbn+AIt6lrO8hbYSD8L7RQDqK
C28FheVr4ynpkrWkT7Rl6npWhyumaCbjR+8bo9gs7rto9SPDhWhgPSR9R1//WF3mdHt8SKERhvtd
NFkE3zf36V9Vnu0EO1ay2n5imrOfLkOVF3vtAjleJnesM/R7v5tMS0tWoIr39KaQNURwI//WVuR+
zjqIQVx5s7Ta1GgEL56z0C5GJoNE1LvGXnQDyvDO6QeJVThFNgwkossyvmMAaPOJYnYCrYXiXXle
A6TpL63Gu8foNftUO0T83JbV/e6J8iCOnGZwZDrubOtYn1QwggWDMIIDa6ADAgECAg5F5rsDgzPD
hWVI5v9FUTANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBS
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
Dxz3AgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFHZtY3XkWtC2
e2Idfk+0JyK7BLzzMFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQBo
hqjbVaHxZoT6HHUuwQcTlbgXpuVi59bQPrSwb/6Pn1t3h3SLeuUCvOYpoQjxlWy/FexsPW+nWS0I
PUmWpt6sxbIRTKPfb7cPk32XezfnA0jexucybiXzkZKTrbI7zoMOzDIWpTKYZAonB9Zzi7Dso4An
ZOtz/E3yhdR/q1MK30d5fiCS0vorEd0Oy8Jzcc7TJ2HGMzEEXiFFvVrJYJHvfYOeXE4ywAG6YWO0
x78+bXeB9vkeWHhOYKyYXuAXrnHASddEICg1QlJCHDAISMC1Wn/tjqTMTt3sDAe+dhi9V1FEGTbG
g9PxPVP4huJEMIBu/MWNMzHfiW4E7eCHVPrmtX7CFDlMik7qsgQBbO5h6EcxBamhIflfMgoISsRJ
Vyll2E5BNVwkNstMgU3WMg5yIaQcuGFgFnMTrQcaLEEFPV3cCP9pgXovYDirnB7FKNdCZNHfeBY1
HEXJ2jIPDP6nWSbYoRry0TvPgxh5ZeM5+sc1L7kY75C8U4FV3t4qdC+p7rgqfAggdvDPa5BJbTRg
KAzwyf3z7XUrYp38pXybmDnsEcRNBIOEqBXoiBxZXaKQqaY921nWAroMM/6I6CVpTnu6JEeQkoi4
IgGIEaTFPcgAjvpDQ8waLJL84EP6rbLW6dop+97BXbeO9L/fFf40kBhve6IggpJSeU9RdCQ5czGC
Al0wggJZAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAYQLf/BIzLow9kWqD8My
PzANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg1o2DmCVondT2xt7lk4l9XAW+Q56C
7FCLfv0myzFwV/4wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUx
MTI5MDc0NzMzWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAO+yirCFHXTaG90tRQKVZ2Ktr88moXARp8c/bSB1/lQBp2IMlD5k71axPJrkAZzWD
NXbn4VKq0pZ/0C7eXZeYrwdmZfZy5ihWN0cCyKknZRm+fo+erNMh3hlXEM9sa7nnMPOq7vu1s1ZY
Gi/aIo/HrPcHS21vL3Vg2Qn4sSxKInHVC68Ly+ShbpiM1BJT1tobUegJos8hRFuQk626xTgiUh3X
FUpNrIO8GHfd7ZuYbg6YvUvdX7uRVv10hF/J2D36SkbJysmA7Nope+FGnwsF08+wv3851uZnZ+aI
LbpcYtBhKlhv/KMuH3KotmcdQpc7ghSKkobOz5RfIKki2CeElg==
--0000000000007ca3d40644b6f5d2--
