Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C991CEACB
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 17:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759511751; cv=none; b=M+vmqjTYGe0DvzcGYMZxNQHgRjCCFFnOTi1bcRdLSG7/qCnBo5J1rHg15QHsdqZ+poEjRcTxdTa0r3SzFx365zkoeXom7AhjpgGNTwWJVZyvPZX9sbNHq/b/xLVuDoWjA0ic9l+lSD/fHaI3FqaIepTXjYT3PVB/0VWlSDU1DBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759511751; c=relaxed/simple;
	bh=0NPoiZbcuTljKRE9IE9cfxsjid914W1BOeaB5B1MAWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CbRrGNnQU0PP0Ktz7DtBM7e7bEt4Jo0YwRboOzJA1iIry3VD3coSV0RkZp2cxuOGrBfD1eeY+BA4uBwMbdS/QVX5WVcFfnzee5X6TjwqiZLhAQXBQTk5hvSJHbR+cqs6L2r0sQ3lyoVexnN/aZQQB/w4WQLEG7RlaT6pqM2JkRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JmHnmAH3; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmHnmAH3"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-330631e534eso2732936a91.0
        for <linux-doc@vger.kernel.org>; Fri, 03 Oct 2025 10:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759511750; x=1760116550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQrIlPYCeDMFS6g0Xw3ObCA9wB0GS/RdHfZWbwbQfmg=;
        b=JmHnmAH3+dJvXRjVAyKivmPwC40LrbU/62b4pnMI+im1Dst/p5ZGPyvhu3x+Q3LMvD
         kpDG1PKVlslwRAoo3OOOSmoI/Whho2FqSb9kI1rISCgt1NZf2YS/Je2E7/yiqu1jNRg1
         UDWUjq7OfxyaB0aMMKX6DwYs3eS3rgDkXAHyaUR4dTWeoqrvq3o8Z3TLKgtc+W2Iuny0
         A0pJYBZ/DZJGOe7dpX6Nb6Jc5JZMTIKQbiH2RBTbA26+S/do5zx4Pqkw8DGZdmygvqMN
         ZWzsYml3WSAWh3BC2wN6ijtoQEh4ISv5JzZ21g1Z7s45k4BVvN6q1Zq7XyLb+tS3aDJZ
         d1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759511750; x=1760116550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQrIlPYCeDMFS6g0Xw3ObCA9wB0GS/RdHfZWbwbQfmg=;
        b=GqRLpTKHy6y03huaHnxLzCp5c6gXPJIbzs4TI/c5KA/73/egGVXRolghfujybX2HYi
         qW4+TlMjIjfBqZ+GJvlQDMtpFnGuSjgHtdtTcwaXoMsJvX0y4uLMipUNts8uepeftOf5
         ZDNhp/1FeF4BJ4gUMOMH/uK9hhJsupd3CigRJCGOHmLquMUuv8M2VmunF3se/VNjVUvx
         VNfoc4B7zGQuELQHZUxS2gnMRF+asR0rPSh27oBDw2Rr/0dI12hOPxAXXddO8s2IjoEv
         1V5HSCPz+U7zz8RmFXDAbjD7Y6bhVJLssVAAatyPnVt2Bmyw5xHFqX97Z1LvT/++0OtC
         rGtg==
X-Forwarded-Encrypted: i=1; AJvYcCXgiEjHyVSG/AOpjeg4kjXymZXeTElxjJl+prWGLVVV9Z5gVVywZA1BzZMIVuytQdgtcqyShFXOjws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhetammm90QoSzrBTt6GDAr4NW4qUeFHXG5oDRfm1foDYkeffq
	zthBgzhQ2QRzTreo1DjeDafbtIsgQQIgAXng0/MuVi1xx2yzJytUUtErkcyrmZBqY+T9AU8ZbIw
	StuSz86FejyGTLOq1Wxt8x7sfunQiZe0=
X-Gm-Gg: ASbGncuaeVGcNyu78ji6ZliTjx3Y3zi1UeBC0ufHXepbh/wQMEEqxYDKgcXbX4WF47N
	l4tcPf39qfHYIdcWFcjrJ1TG2UYdZzLATejh3JgPZtUT+wcYX40Be164wH5kbQKpAbXDbH31mgc
	BbIDEFicRYpCQ8i9Ptqcot5a7D41s6XY7yVv1il1b2BX9d7PZHVj8zFchNn2tfSh9ON1cmigYj6
	mjJyS++Uj9tXc98amFod6G1wpDACdYea0cU/U+3tw==
X-Google-Smtp-Source: AGHT+IFcEuKic+Tf8lUTRJaPEPEhT5Rl6gMjc2kZRCXF5TJDM1b458clM5LKQjmau6j6GSyui8n/y0pdq1kHCcaAE+w=
X-Received: by 2002:a17:90b:4d0b:b0:32e:43ae:e7e9 with SMTP id
 98e67ed59e1d1-339c27a50ffmr4890684a91.17.1759511749562; Fri, 03 Oct 2025
 10:15:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251003131959.23057-3-stephen.smalley.work@gmail.com>
In-Reply-To: <20251003131959.23057-3-stephen.smalley.work@gmail.com>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Fri, 3 Oct 2025 13:15:38 -0400
X-Gm-Features: AS18NWDnIjAoE56yw_HjZFFUH0XaIXMln7NGShezn1DAyMFjLswB1bLYS-dxnTg
Message-ID: <CAEjxPJ4bdDA4mcPcYv1wyfbvBOYjg0018Q8QwYcMUUZAbvoCRg@mail.gmail.com>
Subject: Re: [PATCH] include/uapi/linux/lsm.h,Documentation/userspace-api/lsm.rst:
 introduce LSM_ATTR_UNSHARE
To: paul@paul-moore.com
Cc: linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	john.johansen@canonical.com, casey@schaufler-ca.com, serge@hallyn.com, 
	corbet@lwn.net, jmorris@namei.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 3, 2025 at 9:23=E2=80=AFAM Stephen Smalley
<stephen.smalley.work@gmail.com> wrote:
>
> This defines a new LSM_ATTR_UNSHARE attribute for the
> lsm_set_self_attr(2) and lsm_get_self_attr(2) system calls. When
> passed to lsm_set_self_attr(2), the LSM-specific namespace for the
> specified LSM id is immediately unshared in a similar manner to the
> unshare(2) system call for other Linux namespaces. When passed to
> lsm_get_self_attr(2), the return value is a boolean (0 or 1) that
> indicates whether the LSM-specific namespace for the specified LSM id
> has been unshared and not yet fully initialized (e.g. no policy yet
> loaded).

Upon implementing the 2nd part for SELinux, it turns out that the
lsm_get_self_attr(2) call can't unambiguously return 0 or 1 due to the
current interface definition, so will be spinning a v2 that instead
sets the *size argument accordingly.

>
> Link: https://lore.kernel.org/selinux/20250918135904.9997-2-stephen.small=
ey.work@gmail.com/
> Link: https://lore.kernel.org/selinux/CAHC9VhRGMmhxbajwQNfGFy+ZFF1uN=3DUE=
BjqQZQ4UBy7yds3eVQ@mail.gmail.com/
>
> Signed-off-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> ---
>  Documentation/userspace-api/lsm.rst | 9 +++++++++
>  include/uapi/linux/lsm.h            | 1 +
>  2 files changed, 10 insertions(+)
>
> diff --git a/Documentation/userspace-api/lsm.rst b/Documentation/userspac=
e-api/lsm.rst
> index a76da373841b..93638c1e275a 100644
> --- a/Documentation/userspace-api/lsm.rst
> +++ b/Documentation/userspace-api/lsm.rst
> @@ -48,6 +48,15 @@ creating socket objects.
>  The proc filesystem provides this value in ``/proc/self/attr/sockcreate`=
`.
>  This is supported by the SELinux security module.
>
> +``LSM_ATTR_UNSHARE`` is used to unshare the LSM-specific namespace for
> +the process. When passed to ``lsm_set_self_attr(2)``, the LSM-specific
> +namespace for the specified LSM id is immediately unshared
> +in a similar manner to the ``unshare(2)`` system call for other
> +Linux namespaces. When passed to ``lsm_get_self_attr(2)``,
> +the return value is a boolean (0 or 1) that indicates whether the
> +LSM-specific namespace for the specified LSM id has been unshared
> +and not yet fully initialized (e.g. no policy yet loaded).
> +
>  Kernel interface
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> diff --git a/include/uapi/linux/lsm.h b/include/uapi/linux/lsm.h
> index 938593dfd5da..fb1b4a8aa639 100644
> --- a/include/uapi/linux/lsm.h
> +++ b/include/uapi/linux/lsm.h
> @@ -83,6 +83,7 @@ struct lsm_ctx {
>  #define LSM_ATTR_KEYCREATE     103
>  #define LSM_ATTR_PREV          104
>  #define LSM_ATTR_SOCKCREATE    105
> +#define LSM_ATTR_UNSHARE       106
>
>  /*
>   * LSM_FLAG_XXX definitions identify special handling instructions
> --
> 2.51.0
>
