Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173D73603C0
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 16:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780072146; cv=pass; b=rHdvFvYkNxgFrSq//V/9L9l0Mcl4yVD4C+AZCiVYaBLtYePccbRTVRo4zeOPoBlXe+O3PE1PogWE0z2pKbBDXn3SOyLe/LMxEC+9d9NEuZXXm9Tk7ndn96HOkkp4ix/9PYrvUyyffHsgH6mx7iMa0+LwYFs3CAvHFA1C7E6WLOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780072146; c=relaxed/simple;
	bh=PH/Z12wHsMq8SpuU56tCXSsJXXE208ciSwkYTY3S1Lw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bDTxFDoWKtC4eO/hTZKVtjrCCNI0riG9Hx4Jzh4CyVgMvYaEuYTDVYzck+XqMmwOwCeTVS60ZPASD+DSJyxn71os+u72TW7ygFtNuAoTHmi3Epth+R7UezlP6IF9N5PRkXjUKx2hB0sxRKKjQMonZPwNMjrK8bUjGqWKWzrRXLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MsDjvx0G; arc=pass smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MsDjvx0G"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-63319183a49so5390981137.2
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 09:29:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780072143; cv=none;
        d=google.com; s=arc-20240605;
        b=PCkxWLl0axkoRA95ZNaXB54C/7rTEJtKTjrzz8D1Z9XB3LNGz/GpVPbWCoL8Ml4qfh
         ZZGDlz/2GItOELQAOTiApYDKwJzoxVF4Rupe/hYq7qClb1QsxRREN3ry261ELKMmeWrZ
         HABZa1DXT4ZfAbTVwZ/lm/3zLOHeM4gKHzOhhSv8bAamjo/BEzOtikPL5BeiI4qr/uur
         KKY6cwQ50U0kcHfw60E7NWeK6SPprlnHzBxRxq4M+IpvqukqtPOG59ZHlXDBZ9gdFoVR
         i7D+7jOL47hd6b+Svaieo/kh2UvRiFKFhorziYoV2hOFdurDK1ezn8qT8Bl5GyMiplLW
         QXHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q7KOWJPsMTJrakS60eVOqCDfj+qeD6Xam4DgPMjjGsI=;
        fh=CZXS4O5gvx8HkWBtar+6m8U+m3ZdZk35JxzGnlnIe2o=;
        b=HiqasnL4ghowY2fxyk+Fbv92pWstXTDqwwdJOCQcdGoOKnW6lZivjgRqBndVzCczif
         8Hlt+DHEvkFyb+ltsDyzTxtAIcuuXT/VTfWOlpBuM0U5exO1mlUPBdkpuFlAF2bZCF6Y
         NzwvpKXW7jKLlvU1M2wU2fI7iO4mP/YJDgSWiS7eqXi4Q9couz4pbrF4YYYEKRfrtwW4
         JmqzgvSsmND2JO/5T6GtvST3rnqPcIdmbzI7VLXcj5oAyrGjeeIzEf4uzRS7PkL2494k
         1EsTnm/oX7XwLxeqBZ13t85n6p8zg4eFwmCaxoVVWpCPIaeBFzk1Qcc5MfQsp3aT/V5G
         bPAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780072143; x=1780676943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7KOWJPsMTJrakS60eVOqCDfj+qeD6Xam4DgPMjjGsI=;
        b=MsDjvx0Gbw8kkh++c34z8Q4CjJpxNXDMmHM7wCVT1tLzlOhuhknbhTIz9/nyhHMcXc
         yfEfnPkDscy/f85DvA3klXO/7K1ysW8C1tCdw7gKWxcuhAVS8FTVaQtipNCd+Fz1FiL+
         bfZqJ/QZCIHDLqnHnB3TlUjuISR6yk30Ws1YEP74mUr3fNd5mZ4cjcrsLpdvC/zy0cSK
         Y6QMDzkR/xqYAZOzV8eP65/ENqylIFJzuJvB0u90jYmzj8AGgI59LOewPJ/IDpWZ3IkY
         e1HKKCP6eJrb8IwHMTU7maHF93O03soO52E/gRSpHqjv3aRuDnYqDeS0Gzl+BZSmhP8n
         0Xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780072143; x=1780676943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q7KOWJPsMTJrakS60eVOqCDfj+qeD6Xam4DgPMjjGsI=;
        b=BbrZVH2bWJU5c941ROvBX4subIqhjOTmOFcCNPahyvy6ERRqhlXl2LH6xPXCACOpvk
         9dgmDgGCeJEW3ggYQMzpT2zd3l6KrzCptVwpLMM11h0pPwFtNfmatLiveiqWWarc/TXW
         +G5lyMAnE3ZtPSZcq+QBQ9rvKDNMJ/FnjcuJW80ypdGsnTj7EzJQQAHHMGYqKCW/OPVl
         0/vkiqfmngtxPuR7T9r/1RALPDSQqUsHaqVMxMDhYsHlqgyswjn+BAVSTF6v4uoaUzoC
         j0KKgl2GVUe+Ls4Qk7gJQijjesMn8I8y5uz+poga+cu6XintYT8pRyWIyUAK9VtBFZi8
         zudQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ivxVY2IfvkYnnMoRoINCH3D6gMuBuHY+LMEimukxf5e6WNzzmSZtalPMz6rWX0FGvlq+wANNoOCo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsnSJ97CqMKVr5Mtm3raM4rMy56bR3xQvkf1jQ2vcBEM8BUA2V
	1a1TRYi64D+Udk3p0jxFtIQewyQ9rON0fq0E7ZH6nCDMT3Sckdok4Sd3J+Yzem9+GYHnFDRLvfu
	SS8N5SKYNVhjasPl63QZwvhE/QI8hfzkMYUgQn6CR
X-Gm-Gg: Acq92OErJWD1ASsP8ciCStUH1wMlaZmQ9xX58qPMDFUvWfyUksO35dM7VGk3Ung0t+F
	9ZmeB2+EEje3mUvFbtQQqhFb1P56UMrIhnR5kOuIWddS5HOLm9oRrLTdWryBiETWZxqAMzt9X67
	zAoSW6zpTrHcuHThgxQQ34j/NX/46yXSAfnSqfBSiMlwO0uOC8AqVB5mLLIcTtYaK3qOsGcktT0
	Or22ztADUOGyE0rHAlLRjQ8+/c2eeKHoVbApyb4aPAeuFtfwZejcwGvzUHFVOVfB4HshUmfsJRy
	IE3fktUUR9OgWr77PA==
X-Received: by 2002:a05:6102:3ece:b0:631:8665:3511 with SMTP id
 ada2fe7eead31-6bf422b40eemr1931039137.30.1780072142599; Fri, 29 May 2026
 09:29:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528-im_back_baby-v1-1-25d355efdbae@google.com>
In-Reply-To: <20260528-im_back_baby-v1-1-25d355efdbae@google.com>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 29 May 2026 09:28:51 -0700
X-Gm-Features: AVHnY4Jr6H03OfHaWFJtqrsbD1DMvlU60lxKSdJGu2BseUWECJcMyHSM0OqmjvQ
Message-ID: <CAFhGd8pOWHnZHH7R5KBspj+o1Bfrbk9sXeNj2X48VB+nYPBAnw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update ndesaulniers
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, Will Deacon <will@kernel.org>, 
	Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, llvm@lists.linux.dev, 
	gosst-kernel <gosst-kernel@google.com>, 
	android-kernel-team <android-kernel-team@google.com>, 
	kernel-dynamic-tools <kernel-dynamic-tools@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 28, 2026 at 2:38=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> I'm coming back.  I will return.  I will possess your body, and I'll
> make LKML burn.

:0

>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  .mailmap                                                               |=
 1 -
>  Documentation/process/embargoed-hardware-issues.rst                    |=
 2 +-
>  Documentation/translations/sp_SP/process/embargoed-hardware-issues.rst |=
 2 +-
>  MAINTAINERS                                                            |=
 2 +-
>  4 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/.mailmap b/.mailmap
> index a009f73d7ea5..f863781b0102 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -634,7 +634,6 @@ Nicholas Piggin <npiggin@gmail.com> <npiggin@kernel.d=
k>
>  Nicholas Piggin <npiggin@gmail.com> <npiggin@suse.de>
>  Nicholas Piggin <npiggin@gmail.com> <nickpiggin@yahoo.com.au>
>  Nicholas Piggin <npiggin@gmail.com> <piggin@cyberone.com.au>
> -Nick Desaulniers <nick.desaulniers+lkml@gmail.com> <ndesaulniers@google.=
com>
>  Nicolas Ferre <nicolas.ferre@microchip.com> <nicolas.ferre@atmel.com>
>  Nicolas Pitre <nico@fluxnic.net> <nicolas.pitre@linaro.org>
>  Nicolas Pitre <nico@fluxnic.net> <nico@linaro.org>
> diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Docume=
ntation/process/embargoed-hardware-issues.rst
> index 34e00848e0da..d07f16c3c7b8 100644
> --- a/Documentation/process/embargoed-hardware-issues.rst
> +++ b/Documentation/process/embargoed-hardware-issues.rst
> @@ -308,7 +308,7 @@ an involved disclosed party. The current ambassadors =
list:
>
>    Google       Kees Cook <keescook@chromium.org>
>
> -  LLVM         Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> +  LLVM         Nick Desaulniers <ndesaulniers@google.com>
>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  If you want your organization to be added to the ambassadors list, pleas=
e
> diff --git a/Documentation/translations/sp_SP/process/embargoed-hardware-=
issues.rst b/Documentation/translations/sp_SP/process/embargoed-hardware-is=
sues.rst
> index 9d444b9c46d3..7d4d694967c7 100644
> --- a/Documentation/translations/sp_SP/process/embargoed-hardware-issues.=
rst
> +++ b/Documentation/translations/sp_SP/process/embargoed-hardware-issues.=
rst
> @@ -287,7 +287,7 @@ revelada involucrada. La lista de embajadores actuale=
s:
>
>    Google       Kees Cook <keescook@chromium.org>
>
> -  LLVM         Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> +  LLVM         Nick Desaulniers <ndesaulniers@google.com>
>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  Si quiere que su organizaci=C3=B3n se a=C3=B1ada a la lista de embajador=
es, por
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 461a3eed6129..2f06cc2e463c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6259,7 +6259,7 @@ F:        .clang-format
>
>  CLANG/LLVM BUILD SUPPORT
>  M:     Nathan Chancellor <nathan@kernel.org>
> -R:     Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> +R:     Nick Desaulniers <ndesaulniers@google.com>
>  R:     Bill Wendling <morbo@google.com>
>  R:     Justin Stitt <justinstitt@google.com>
>  L:     llvm@lists.linux.dev
>
> ---
> base-commit: 8fde5d1d47f69db6082dfa34500c27f8485389a5
> change-id: 20260528-im_back_baby-1ade32dc049e
>
> Best regards,
> --
> Nick Desaulniers <ndesaulniers@google.com>
>

Justin
