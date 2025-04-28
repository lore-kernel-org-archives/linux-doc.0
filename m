Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD4225DAED
	for <linux-doc@vger.kernel.org>; Mon, 28 Apr 2025 12:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745844867; cv=none; b=ti2hOmQ2AWcpbIiSua2HKPc+Qx/wc9loJmvX6eor2w51ZqR0l7F07tiuM4wXFLHArOtmDPjE7Kjq9RZwBhg8jlyaunM/24lL/EhcQd8be4+3x2yjCUK7uX1w+2CRKqpPJmz5TLPErF6P67EErxI8SI4kGypibKSoI6UxxsggkbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745844867; c=relaxed/simple;
	bh=UtaHAfdmSj4qXn5u8+vo9J5JBw9YwAKk1Lf6jvKCU28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jmOQ10DvetLp8rjg2ZwVWqlNb8myzh4hluG9i+NHN4zA0ggHx72CY4BKArq6NZfYWo4R01xixjqA4ggJho2PnZwnohTWVtOZjs13Jhmq59DL8YoKiUTW5gbYPW+gQkHCeEzl1Z/TYWzAfhza2lVzV8tc9eheCP7d2wJ/LVEnBl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T5ZCXIX7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T5ZCXIX7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745844864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ipeKwooPNECwWcnMizDPwSDiqiyokClUjBvMFkUD7nM=;
	b=T5ZCXIX7BqujPjfySq5xl8Kqnoa9eKpIKANfdyMUKMLRu9PeQWnGKeaNBcY5KH9zVMi0tJ
	+28e4of66gc3F04psIzlXfOzoVE4AH3Q92g4AgwJkLkkljqLulYFz6BqbNLitFI6iIbuGh
	XhCj2roxWZDuiux5dXbvB3aPFGz4D3Q=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-j_2O8Wv-NX2jEP_K_7OiGw-1; Mon, 28 Apr 2025 08:54:22 -0400
X-MC-Unique: j_2O8Wv-NX2jEP_K_7OiGw-1
X-Mimecast-MFC-AGG-ID: j_2O8Wv-NX2jEP_K_7OiGw_1745844861
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-acb8d1231ffso347221066b.2
        for <linux-doc@vger.kernel.org>; Mon, 28 Apr 2025 05:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745844861; x=1746449661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipeKwooPNECwWcnMizDPwSDiqiyokClUjBvMFkUD7nM=;
        b=S4ue8EB/VapRHRsiDJF5hgn9Dv8CuYbxuWLY7FR/PLwDyxq2zbh09b9KFOXkCWw/02
         oM0eD/h+2Fk1Mohyicegzvb7u3Sfut7iqHnRe01byka1crBpFEwgIVhT+s5AmD3f8pCQ
         ZV8UMOxiQMR6gec0BOB7YcmcypPVureZvcabTs0jf6WeZ/21cRWSOPF1lAePwrgtHCio
         64G2fEss6xaMVNj4uS46zrBIKsWtOLxf85lai9YYo+ayNhUD/yP/kQm3Jn2iNjHcITqJ
         09cCNMKW82p4aPk81RodxDRqM+RC4LQU0WlRupjujVAI3XLgFnfXrzpX4h9U0ftKO662
         k3Wg==
X-Forwarded-Encrypted: i=1; AJvYcCU1bC+/5u/rcJwdw3QJME4pc/H6X/Y75ZzyOsjvmFq5giYsFlKwBCux5Nn8AzDlD+gYyTjMSmGeFao=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHdTOTnTM5UlDYQhDLmoNNkaxmZ2VZyiTe8Ia8ZW1N0LAuUf4+
	0yT8AlWFVfQ/hZ7Ptmu4bzAy+ZsO8cYSMXS8eeF+SD0YhPA8CplBz6FRq8z46y9X2RL39O0Kbl3
	aWrYlRRpg7Sg8HulaFwh3NUcSWrTWM+qwUu2TqmAyQCGfGgHd9kVOBcHCbjN8IG3agCb1fhapSv
	SjmCydyRh160D3qnk9irZOKrB63XgFYOD2+IwkTLx3BjI=
X-Gm-Gg: ASbGncv1Tv7uuJIrxqsNZUlyKqGdLTs4uRs5LfT2jiSm83tdJ5+f47Jb6TZcphcm+lC
	UGxkKzsZaVL/2ZkR1DJwiYEYBLp93TgPW8Jc+6w7sFWhCrNM0j78Qu+19r7M5vfUKpuQOcrLxJM
	5trDB4ntYgrriAE8DDVl5HYsA=
X-Received: by 2002:a17:906:7955:b0:ac4:2ac:3c2e with SMTP id a640c23a62f3a-ace713fd1dbmr1194511666b.54.1745844860685;
        Mon, 28 Apr 2025 05:54:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7hWtsOC3o5eLo49dSK3X+xHJwtfut3oGlCL9XaN9FVlEPi2hqQyJZ2wXe1HY2/7Ad2vT8cba5dnAHOhcLcBY=
X-Received: by 2002:a17:906:7955:b0:ac4:2ac:3c2e with SMTP id
 a640c23a62f3a-ace713fd1dbmr1194510266b.54.1745844860372; Mon, 28 Apr 2025
 05:54:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421161723.1138903-1-jsavitz@redhat.com>
In-Reply-To: <20250421161723.1138903-1-jsavitz@redhat.com>
From: Joel Savitz <jsavitz@redhat.com>
Date: Mon, 28 Apr 2025 08:54:03 -0400
X-Gm-Features: ATxdqUGuFUEGLu9q6K3lucxpUjLuWYmBdAh3jsxIQYw3BSz__RLVI95M0qJ3C9A
Message-ID: <CAL1p7m6enT=5Hyh3e0Frf_faWLTXjChOYiuJr61zBg5sy0PdeA@mail.gmail.com>
Subject: Re: [PATCH v3] docs: namespace: Tweak and reword resource control doc
To: linux-kernel@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 12:17=E2=80=AFPM Joel Savitz <jsavitz@redhat.com> w=
rote:
>
> Fix the document title and reword the phrasing to active voice.
>
> Signed-off-by: Joel Savitz <jsavitz@redhat.com>
> ---
> Changes since v2:
> - Fix another typo
> Changes since v1:
> - Fix spelling of resource
>
>  .../namespaces/resource-control.rst           | 24 +++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/Documentation/admin-guide/namespaces/resource-control.rst b/=
Documentation/admin-guide/namespaces/resource-control.rst
> index 369556e00f0c..553a44803231 100644
> --- a/Documentation/admin-guide/namespaces/resource-control.rst
> +++ b/Documentation/admin-guide/namespaces/resource-control.rst
> @@ -1,17 +1,17 @@
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> -Namespaces research control
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +User namespaces and resource control
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> -There are a lot of kinds of objects in the kernel that don't have
> -individual limits or that have limits that are ineffective when a set
> -of processes is allowed to switch user ids.  With user namespaces
> -enabled in a kernel for people who don't trust their users or their
> -users programs to play nice this problems becomes more acute.
> +The kernel contains many kinds of objects that either don't have
> +individual limits or that have limits which are ineffective when
> +a set of processes is allowed to switch their UID. On a system
> +where the admins don't trust their users or their users' programs,
> +user namespaces expose the system to potential misuse of resources.
>
> -Therefore it is recommended that memory control groups be enabled in
> -kernels that enable user namespaces, and it is further recommended
> -that userspace configure memory control groups to limit how much
> -memory user's they don't trust to play nice can use.
> +In order to mitigate this, we recommend that admins enable memory
> +control groups on any system that enables user namespaces.
> +Furthermore, we recommend that admins configure the memory control
> +groups to limit the maximum memory usable by any untrusted user.
>
>  Memory control groups can be configured by installing the libcgroup
>  package present on most distros editing /etc/cgrules.conf,
> --
> 2.45.2
>

Hi,

Just a quick follow up on this. Are the changes acceptable?

Best,
Joel Savitz

