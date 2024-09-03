Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B75E18C90C
	for <linux-doc@vger.kernel.org>; Tue,  3 Sep 2024 18:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725386544; cv=none; b=tFljswfZMbsvfNBkRFyZ+DhsUITOKMKTMYVtKArSugTX39DIVGJpGEk9Obso+6BoInqz1LGgpA49aD9LT8YlW79iMqzMOPS7fQQfQarylPaGHiNJRB/gAtA7dVR+81DooydGoruJhRgBmjT0gVcpvvDH/F/5lpqO1c9D3OOMvH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725386544; c=relaxed/simple;
	bh=dN0jhISHYCsWr37/OtOK76vPxu9vJk7aNNoC4DNtVPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qR9zv7QhdXCy4SIvk+fJjskO+uGpE870ECZrlkocXZADjdVCH51DLVYWg+O/RaJO1nTZ8wQjzd0W2KH8BtRR6bz0mko23nOOU0y52/Yp2UmrbCOc17fJg4CZ8MzNZ7FO2XvhIhq645ICpnbvSXTPOlM4JVTxeaTaDHBV3OLFbuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iTr0pogF; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iTr0pogF"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3e0059dc06bso1263498b6e.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Sep 2024 11:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725386541; x=1725991341; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvGiNFbJVYVvUlbAp59wn+lmSLXIjtX8rqRd77LaWMc=;
        b=iTr0pogFSwIZqgt/7ZrmZxSB/5zVVAD//QQnY7OcQkdT6aXmLiw2kwXQ6eh9AouI1u
         44biO4Zk2Otj8wfGH0nAw+M9AKCjpZt2Njgwhm+9bpGsUyWn2AqGhBU56g0MW9iZ6Vxs
         l40jYf7hR+tIwwI+FTc2vTxIusz9Sb0gDtcJgHXcaajGHXSJDYkfyqq011ZwTgQlSVYD
         0fAhGm9EH9/fHc/qlU6VKI8SWJ4llH2vSMqbCBojdUzOnNURaSWFK/h7ZsHCbBIKbfua
         oTdY78tssGLYOJUlT0bIcaR5B1JilK8zi/bi1Y8jBBf4bPCst3J1CET/cFUemADqdOhi
         q+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725386541; x=1725991341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvGiNFbJVYVvUlbAp59wn+lmSLXIjtX8rqRd77LaWMc=;
        b=VVSIIapjK03qWzjlvECQEtNP7e7RZhMLAI19q39iOvY0PjnBYInV3H/GE37OsrY+sb
         MsaDejHhLZ3IQTxvZH2HI5cbeH3CsTWxkSoqa5O9DxR/EQCimERp9Q+5BljsG/PF8oEu
         iXO1Fv/WQ2JsevoEJKXecRSdijayod/3/J87Oy3/7/GdpjdZoBLtcp06zvmUBOQGy5Kj
         kk/2s6S+iJ9kN7LTZXKCc0WPNC0MRhw5JumAuQwCA8IOgFHMNyx+JuvMwSrqJoE6kM89
         fwT7OTOZ6NtBGRDddvFJaelSyCpo8fPH6twIAG4EyQM7QNAZeMWhHw0jIibCL5cI5aR/
         jmxA==
X-Forwarded-Encrypted: i=1; AJvYcCUCy7KzFtOXBmeqgY2QBKkdT++WXNgpzCpNVOHiosljoqwmi10yyPV+QaUwLrmV1AWQ5D/0MMv6D0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnoO3f2HUo5nZlggt8msMNpaMtIkDhj2ZCgBm304Q/yUMkfGtH
	Lu/iKAxwYC4nxgxDdARtwQCXReAsA9CU4rRPlPK/Orm6wN6CyhDsFvdFoLpZPeWaT7QAySAN9FU
	Rz9F6pYvuQgaq82i4K6IcxjJmgNDEhIfz9Ryt
X-Google-Smtp-Source: AGHT+IH7pmwvmIORwmvwTPIiQFITkvfZTDp4oI2Xd738aAjykgCVol9hSLyrQ/hDJAmRr1cV6D4CKI5iOFx/bG3D4Hk=
X-Received: by 2002:a05:6808:201b:b0:3da:a48b:d1e6 with SMTP id
 5614622812f47-3df220f2742mr11368929b6e.16.1725386541400; Tue, 03 Sep 2024
 11:02:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725174632.23803-1-tttturtleruss@hust.edu.cn>
 <a6285062-4e36-431e-b902-48f4bee620e0@hust.edu.cn> <CANpmjNOiMFUM8KxV8Gj_LTSbC_qLYSh+34Ma8gC1LFCgjtPRsA@mail.gmail.com>
 <bd647428-f74d-4f89-acd2-0a96c7f0478a@hust.edu.cn>
In-Reply-To: <bd647428-f74d-4f89-acd2-0a96c7f0478a@hust.edu.cn>
From: Marco Elver <elver@google.com>
Date: Tue, 3 Sep 2024 20:01:42 +0200
Message-ID: <CANpmjNMHsbr=1+obzwGHcHT86fqpdPXOs-VayPmB8f2t=AmBbA@mail.gmail.com>
Subject: Re: [PATCH] docs: update dev-tools/kcsan.rst url about KTSAN
To: Haoyang Liu <tttturtleruss@hust.edu.cn>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, hust-os-kernel-patches@googlegroups.com, 
	kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Sept 2024 at 19:58, Haoyang Liu <tttturtleruss@hust.edu.cn> wrote=
:
>
>
> =E5=9C=A8 2024/7/26 16:38, Marco Elver =E5=86=99=E9=81=93:
> > On Fri, 26 Jul 2024 at 03:36, Dongliang Mu <dzm91@hust.edu.cn> wrote:
> >>
> >> On 2024/7/26 01:46, Haoyang Liu wrote:
> >>> The KTSAN doc has moved to
> >>> https://github.com/google/kernel-sanitizers/blob/master/KTSAN.md.
> >>> Update the url in kcsan.rst accordingly.
> >>>
> >>> Signed-off-by: Haoyang Liu <tttturtleruss@hust.edu.cn>
> >> Although the old link is still accessible, I agree to use the newer on=
e.
> >>
> >> If this patch is merged, you need to change your Chinese version to
> >> catch up.
> >>
> >> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
> >>
> >>> ---
> >>>    Documentation/dev-tools/kcsan.rst | 3 ++-
> >>>    1 file changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/Documentation/dev-tools/kcsan.rst b/Documentation/dev-to=
ols/kcsan.rst
> >>> index 02143f060b22..d81c42d1063e 100644
> >>> --- a/Documentation/dev-tools/kcsan.rst
> >>> +++ b/Documentation/dev-tools/kcsan.rst
> >>> @@ -361,7 +361,8 @@ Alternatives Considered
> >>>    -----------------------
> >>>
> >>>    An alternative data race detection approach for the kernel can be =
found in the
> >>> -`Kernel Thread Sanitizer (KTSAN) <https://github.com/google/ktsan/wi=
ki>`_.
> >>> +`Kernel Thread Sanitizer (KTSAN)
> >>> +<https://github.com/google/kernel-sanitizers/blob/master/KTSAN.md>`_=
.
> >>>    KTSAN is a happens-before data race detector, which explicitly est=
ablishes the
> >>>    happens-before order between memory operations, which can then be =
used to
> >>>    determine data races as defined in `Data Races`_.
> > Acked-by: Marco Elver <elver@google.com>
> >
> > Do you have a tree to take your other patch ("docs/zh_CN: Add
> > dev-tools/kcsan Chinese translation") through? If so, I would suggest
> > that you ask that maintainer to take both patches, this and the
> > Chinese translation patch. (Otherwise, I will queue this patch to be
> > remembered but it'll be a while until it reaches mainline.)
>
> Hi, Marco.
>
>
> The patch "docs/zh_CN: Add dev-tools/kcsan Chinese translation" has been
> applied, but they didn't take this one. How about you take it into your
> tree?

I don't have a tree.

Since this is purely documentation changes, could Jon take it into the
Documentation tree?
Otherwise we have to ask Paul to take it into -rcu.

Thanks,
-- Marco
