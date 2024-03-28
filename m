Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CA5134723
	for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2024 18:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711650439; cv=none; b=mTYJTWWK2Gwkrtbwv+9wdDkhU4Jbz7r0x29stulCqooPgd/8+12WKm8TtsM6TNL1y08jtzv9Wg/YEPwshmxORziKkEu4NItmSUUINCrGGW5+iESacUt673KsAxujG+UuQTlTxbrkmB3Bhh4bprHc75oYvapNHYjO8/6A01I2NdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711650439; c=relaxed/simple;
	bh=gqw95WreaXzk3tMtnlHwBkwwBSkVdhBkoy3UNovDKa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b70gVPS60ErCoJihU92V99LeWXXpvSizy6MSk1B4ec9cO2IW8zeVSbjbSLQHmmfziyIPO3vSVgEfv4P2boeY+5L5jngbmx9F29VRBBU7yubvVb4yzBEbcPcp5NgEyZjP14Hwu5UL8McZwEizUfxIyijq1LfK8Wl8gBo+LKwE+90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z8LJgOgn; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z8LJgOgn"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56beb6e68aeso1252a12.1
        for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2024 11:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711650434; x=1712255234; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85okgPI5wmbRinylcWdySXAu6sDEJZPcZsliJr3EhXc=;
        b=z8LJgOgnrwMqle+GIquH01Fabr8jP4LsXvMPDVfpqJmtQbRVcAOmb9hi8P9DM2vYB/
         9/8aCRzvhIoEP7q8fVyjIXdY1G+NNDuZNNNErMi3NNzOz7nJmLHHkxD7p4GC7k3QxsMz
         NxQCOtPevO/USSxnjRQPzdpz6wSa2DF++8BepS++RKdAW9VhHBwmdMsTwJqZahvKUSGb
         A+IF244xSG0KKVMOeABtEFEvQ0AVoSsV9nUzKJCMTV86RiTdF9locAxPj4cDSevWKtUP
         9nuFRoD7/cC05LRDAMdBFP9U6dIANqfolcMfPReR2RpJN6923ZUZtVQlalah/H7za/lk
         4l+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711650434; x=1712255234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85okgPI5wmbRinylcWdySXAu6sDEJZPcZsliJr3EhXc=;
        b=akiC8m0dYpv7MEXbx1CyQuzWEfTnDT8bvr6TiAcrwHkfdYSxrwwhK0aSjMcjeQaYSC
         dEgiC0jy5vvIDQS2PjkaVkZ5pJc0z4t1hLuYFbq23Uqjcer+7MPusDL2gz1ZvTuG16Zn
         3uPNW5z3yAmH5nYsv83R5JxJ0CJATDyKBjOT2b29juOwgg15Cdh0XWGIMNdvapkLeCrL
         VoGgN72O6gBiW6rgMr5QS77lrbddQ9kIm7XO3Zni0QSwni2UVUIaAQyjIWeX8t6Zww35
         WITOE+eUMWIF2IN3zTqPuZNVyQrymrdMbloxN2MqxZlSYz7wiIRFyTpNv/ku6o1dbF4Q
         RKDg==
X-Forwarded-Encrypted: i=1; AJvYcCXWNqQoeYRzKs5UGf/9PlItG3U51235IAh69NxDVknDDeKUpJ0wB9dHoLV37A1i1eO19Jwqr+CyrSuoDQf3Tmry88FRZQHvLBu2
X-Gm-Message-State: AOJu0YxWt9cnl3kaVGMxwAN3g3BtiXBMKQLm7w68qblJUKuyi/Tf7/9l
	Iwo/7qBcE1SimiXA2NiZDOrEKHKSF4Nk1JHrpvE9K1xdj5y3GLinimkBS4eyBDBMpkofGPtfbUk
	PS5SmBmlyxHQ1EU9psBctsAWhSWUSIeql9UUr
X-Google-Smtp-Source: AGHT+IHv6+ovKmGeILX0PNxbWAx4gi+qItJhFc9E/82fPI5xJuf6KrzJPUedneSe7yPE7D3rJKz2FyvDSWy8TPjOzGc=
X-Received: by 2002:aa7:cd1a:0:b0:56c:53ac:b34 with SMTP id
 b26-20020aa7cd1a000000b0056c53ac0b34mr15774edw.1.1711650434337; Thu, 28 Mar
 2024 11:27:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240328142004.2144568-1-jackmanb@google.com>
In-Reply-To: <20240328142004.2144568-1-jackmanb@google.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Thu, 28 Mar 2024 11:27:01 -0700
Message-ID: <CAGS_qxr_vdix2mnoZve+L4EZv4wO-XdnJ1burnn7fM-at6EuEg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kunit: Clarify test filter format
To: Brendan Jackman <jackmanb@google.com>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Brendan Higgins <brendan.higgins@linux.dev>, davidgow@google.com, rmoar@google.com, 
	corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 7:20=E2=80=AFAM 'Brendan Jackman' via KUnit
Development <kunit-dev@googlegroups.com> wrote:
>
> It seems obvious once you know, but at first I didn't realise that the
> suite name is part of this format. Document it and add example.
>
> Signed-off-by: Brendan Jackman <jackmanb@google.com>
> ---
>  Documentation/dev-tools/kunit/run_wrapper.rst | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentatio=
n/dev-tools/kunit/run_wrapper.rst
> index 19ddf5e07013..e75a5fc05814 100644
> --- a/Documentation/dev-tools/kunit/run_wrapper.rst
> +++ b/Documentation/dev-tools/kunit/run_wrapper.rst
> @@ -156,13 +156,20 @@ Filtering tests
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  By passing a bash style glob filter to the ``exec`` or ``run``
> -commands, we can run a subset of the tests built into a kernel . For
> +commands, we can run a subset of the tests built into a kernel,
> +identified by a string like ``$suite_name.$test_name``. For

Apologies for the overly terse docs, that's my fault :)
I'm wondering if we can further improve it while we're here.

Note, the format for the glob is: $suite_name[.$test_name].

This current wording and examples (before and after this change) might
make the user think otherwise, i.e. that it works like
  effective_name =3D suite_name + '.' + test_name
  return glob_matches(effective_name, filter_glob)

E.g. given a test name like `suite.test_name` and glob=3D'suite*name'
they might expect it to match, but it does *not*.

The logic actually works like:
  suite_glob, test_glob =3D split(filter_glob)
  if not_glob_matches(suite_name, suite_glob):
     return False
  if test_glob and not glob_matches(test_name, test_glob):
     return False
  return True

Perhaps expanding the list of examples to cover more of the edge cases
could help get the right intuition?

E.g. perhaps these:
  kunit.py run <suite_name>  # runs all tests in a specific suite
  kunit.py run <suite_name>.<test_name>  # run a specific test

  kunit.py run suite_prefix*  # what the current example shows
  kunit.py run *.*test_suffix  # matches all suites, only tests w/ a
certain suffix
  kunit.py run suite_prefix*.*test_suffix # combined version of above

Thoughts?

Thanks,
Daniel
