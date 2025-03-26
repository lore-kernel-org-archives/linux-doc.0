Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC5B2192F5
	for <linux-doc@vger.kernel.org>; Wed, 26 Mar 2025 17:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743011837; cv=none; b=gsAEDO5IRTSwtDyeLZc49Ul6nWyyB/kdKBRd2tJkgS3skEY8mh0u7gPixkB3kM2ZBykVxwFzrUe2ut5NN7p/I7RLXtJ5UzEAtbrTQF0DzpiY350DSgeVrw8LdJO8soxf+tg7qvn2BBEQfQ3RSOhOEsq/FvgzqrWCXHp059bUCLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743011837; c=relaxed/simple;
	bh=ggI4Yw9WDJXzBuhHjhpn6e5Xa2NwdDTKh/aOPTDmNMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F9CazipPkbGRZpdsRxxIUTl2yaNi03HYPEKVuanK5HVlARPfMLnwu6brRwAtzKoZn87P+7sGX8xFrclsv/dKwsud2P3PRt7EWGcPmRmYkGfrucX7eIgbsjobDZ0M4afFvTNkHKg3+VpWGOED6HmQEPxA0bRohQXlejcoRBmAvU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hu1ZTnOE; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hu1ZTnOE"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff7255b8c6so15080a91.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Mar 2025 10:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743011835; x=1743616635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63fjjrVzZF7U9nA12lUfHyh6yrdFiEzR4qrxstyzVz8=;
        b=hu1ZTnOE7avG7nbKBghk/IhGiGKRVnAa5+l8gVeqriYYC1iVtm60UJUwEG3imfwbbL
         mRAFFya4vN7N/Ez9JA8dPKAMHBunq7KAoLRcW4kP6SHhG+l2KYCZrE+jno/C2ROE11l1
         Tp+CRyVAj5DMZxYOEhuHz6wJbvfeC83MbCyXgOvmhlx2iw8oLhekM6zbc2ufz+WdIRgn
         sOCrpckXzONwYHSP0M/BIERu1u8q0kymMSG2ucqfeyju3hcTgPQ1QKLyQVDYSkydes6f
         5zz5DDezkOszex2ruorTV3+ktbu/fYVTmJfrP2YHBGgZWhvC+3mgTLJNlrKo4ib2W/Uq
         6ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743011835; x=1743616635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63fjjrVzZF7U9nA12lUfHyh6yrdFiEzR4qrxstyzVz8=;
        b=qD+d3j3qq9Xr63c7rcGgmbZceek1ET/UnD8E5cK64Mgocf2JhXZQXXbsD72kKXk5dH
         R8T8myi8vH/fhK6a5jQNbgvwObbDobFF/ke2sP88LiuKrhTm2ju8bAPrKF4J4xnLb+W+
         gExEGh5ARmDsTc1TeE7wpbGIOrKuwQJ+GZ6SNP4QLW+AhFFzAtkfwMYQXMkeguBHe2Fw
         bi6a3gjcnckbywnMMQLFFkFDGWPfjRmVD4pjWkOAUhnNBWQY6IxCwQULUlGHzWwlv0oF
         cONDmjm+xZ9/zJCCijtWTMFFhMA3D0qaxmxP6dRFjfbiiP12320Fn3fb4RxrDvJwIeof
         RNKA==
X-Forwarded-Encrypted: i=1; AJvYcCW8MNDIUJHyp2MHmxKrNY9fE+/XxGCbevnM2guk7qLYbtmm3wOxAxSEwYmUpZKRe+1vIH+wE0JHoKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YynGVhS5iK2roUwrXzhXwfGHiPpCXe755UNn8zs/49QVpR53ult
	wosP45b85nMxkLepN3PWZy9GiZh5e/um/u/5SR10gonOANXc3F+2jDr4bdgw7Rm8hXB4vx5r8rd
	LZgO4mncaNOASbsWREfs45rSzlv0=
X-Gm-Gg: ASbGncuX9E2jnYfQnPTSCnud/G1/88xxSzmeSgMzoMVKyBjUhlIY8jJBh8ab2/8XG8Y
	72xDm0MpRg9y7Q9rBSrEw0M1IvjGL8ScsPK6RvUhnRRHoZMEw+2nHtOlUXnM2doECAuP77e+AN3
	Jyz2Z9M93lfWxybSzYWj8kGeXAPQ==
X-Google-Smtp-Source: AGHT+IFb4SEstX+/J9aVa/lak6Q1K8so67eSN72VztIppG579APDLZXb+PxCLyLaLw/Nuz0xYqGAsd80iPddj13PKM8=
X-Received: by 2002:a17:90b:4b92:b0:2ff:7b15:8138 with SMTP id
 98e67ed59e1d1-303a91b2681mr267988a91.7.1743011834466; Wed, 26 Mar 2025
 10:57:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325172623.225901-1-siqueira@igalia.com>
In-Reply-To: <20250325172623.225901-1-siqueira@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 26 Mar 2025 13:57:02 -0400
X-Gm-Features: AQ5f1JrJXGbs8Sb8S_t305FOfs8CojJkoSogqnVNxQIYA3I5rXe3UQiJK8no14s
Message-ID: <CADnq5_MEfXnGtGNbBxj-WFZce0Dyf0ikmXqxre+UeFgvoVjozg@mail.gmail.com>
Subject: Re: [PATCH 0/6] Documentation/gpu/amdgpu: Add documentation about
 Pipes, Queues, MES, and others
To: Rodrigo Siqueira <siqueira@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Melissa Wen <mwen@igalia.com>, 
	=?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	=?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
	amd-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	kernel-dev@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied the series with some minor clarifications per the comments and
my proof reading.

Thanks!

Alex

On Tue, Mar 25, 2025 at 1:27=E2=80=AFPM Rodrigo Siqueira <siqueira@igalia.c=
om> wrote:
>
> Hi,
>
> This patchset came from my endeavor to understand better how some of the
> amdgpu components operate; in particular, I was focused on the ideas
> behind Pipes, Hardware Queues, MES, and Ring Buffers. In some way, this
> series is an attempt to put multiple pieces of information spread around
> many different places in an organized way in the amdgpu kernel-doc. In
> particular, the following links were crucial to create this series:
>
> * https://lore.kernel.org/amd-gfx/CADnq5_Pcz2x4aJzKbVrN3jsZhD6sTydtDw=3D6=
PaN4O3m4t+Grtg@mail.gmail.com/T/#m9a670b55ab20e0f7c46c80f802a0a4be255a719d
> * https://gitlab.freedesktop.org/mesa/mesa/-/issues/11759
> * https://www.x.org/docs/AMD/old/R5xx_Acceleration_v1.5.pdf
> * https://gpuopen.com/videos/graphics-pipeline/
>
> The first part of this series just updates the amdgpu-glossary with some
> new acronyms (some of them useful for other patches). The next two
> patches are just some basic organization to improve the documentation
> flow. The last part describes pipes, hardware queues, ring buffers, and
> MES.
>
> Thanks
> Siqueira
>
> Rodrigo Siqueira (6):
>   Documentation/gpu: Add new acronyms
>   Documentation/gpu: Change index order to show driver core first
>   Documentation/gpu: Create a documentation entry just for hardware info
>   Documentation/gpu: Add explanation about AMD Pipes and Queues
>   Documentation/gpu: Create a GC entry in the amdgpu documentation
>   Documentation/gpu: Add an intro about MES
>
>  .../gpu/amdgpu/amd-hardware-list-info.rst     |   23 +
>  Documentation/gpu/amdgpu/amdgpu-glossary.rst  |   36 +
>  Documentation/gpu/amdgpu/driver-core.rst      |   77 +-
>  Documentation/gpu/amdgpu/driver-misc.rst      |   17 -
>  Documentation/gpu/amdgpu/gc/index.rst         |   53 +
>  Documentation/gpu/amdgpu/gc/mes.rst           |   38 +
>  Documentation/gpu/amdgpu/index.rst            |    4 +-
>  .../gpu/amdgpu/pipe_and_queue_abstraction.svg | 1279 +++++++++++++++++
>  8 files changed, 1485 insertions(+), 42 deletions(-)
>  create mode 100644 Documentation/gpu/amdgpu/amd-hardware-list-info.rst
>  create mode 100644 Documentation/gpu/amdgpu/gc/index.rst
>  create mode 100644 Documentation/gpu/amdgpu/gc/mes.rst
>  create mode 100644 Documentation/gpu/amdgpu/pipe_and_queue_abstraction.s=
vg
>
> --
> 2.49.0
>
