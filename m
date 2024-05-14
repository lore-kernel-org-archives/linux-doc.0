Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACD917BB2F
	for <linux-doc@vger.kernel.org>; Tue, 14 May 2024 15:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715702220; cv=none; b=E8w1YpGtESht9YpRPgmjGSlUj12ph1G6BaxteJADhMRoEIy4NLEYgGQX/kLNq3HlJJGUSLM89u/tKxgX4UNv3aEC00fc10iGIFDg5HQnOvmWbWldUUvrd0UrK27QtsTuyy12PcdpfblryOx1K+ml48sVBby6e7UK1B+mspalH8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715702220; c=relaxed/simple;
	bh=YA6pyQiLLslarUnTKZZJMUBTQqHbLA/4c4NUOUNEKQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G3MdD6AIji2urKyz++uqhaRc/48Y49wZ/1gFZe1fir5f++sTHhCWc9vklKagpKDNAH0z6X50KWKsIhah/oOVoBOtYWQg5C9FNdbVarbB3pRgpXrdO+JeGmcGFPBGopvTzqpvuFOfZtOZCRdXAsHlzdIMEicUjzswK8vT3/0D7Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=BEZfi27Z; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="BEZfi27Z"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-23bd61fbd64so3400990fac.0
        for <linux-doc@vger.kernel.org>; Tue, 14 May 2024 08:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1715702218; x=1716307018; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6MGF0tcuYUW8jKv8L9+C0X+Q6Jb+20y5kn9DK3CWgc=;
        b=BEZfi27ZDNKXrOlGC6H4b2KBKrmFzURdAkcRuh/XjsLwUc1u/nlgbuHz1XLw2voJs8
         gl1DyRl9q+MqTFU8WdiJwQitgc7JBW7qOdDnrqNK+Y3drR53XdeiODHqylIMO/GizBNx
         6Qjr8mB05vCGnwWxfu6D4tUt/Za8dNP2ahsacSmufIedPFfL18JkC9Ps9DjHuEMgndZc
         DIAbaA+JjLP65q3yxB/JSy/wY1fud3CtylOUudGF0Aw00l5vlsHgxSxMD6bvVi8ANvBS
         Xwh1OMp6EcqBxbK448NnZ/7iHF6dhq1j9+03QmiyK1N9TVfl5ZXRDXgUuk1rDGxm2Thh
         TwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715702218; x=1716307018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6MGF0tcuYUW8jKv8L9+C0X+Q6Jb+20y5kn9DK3CWgc=;
        b=ZgNNURO6Vj2nYLcoCp68s+i9eWmomTtB80d83txrAQpCQJAs3OmIfsIaGAZwIO/nF5
         BhJQXMfTfYM6F2md1oAvUJulwRLoMCW4CQCclbB+W0uIhISu45uANV6dfX8ipZ4M5SVW
         sqSRKX60ICt30bcji2bNWTzc+lkM63TAUyFD3QvpE/KhR/lhIbBrLEhzXX8EjdkSnS3h
         jeJNPKPM+sMhGEAgsJorQn62Q/0yWFeashKOob09e9RFf5wvNV+wLmlP49SgAMttLF7m
         UhF2WZAhTQ1FZFeKb6JcPSu+0EMYa2A57lQBwitzUGKCjpJMtRvEBbKM5Dy8EMZV8eYY
         vIXw==
X-Forwarded-Encrypted: i=1; AJvYcCVJsxMVIonulcnuQm69FwmSVyd96y1zCzGnIo4EpFsHX7BF+s2P2c4/1Au2h0/Kum2qbqmDclecKRPyqSeaLKGmBT+ZN8IXIE/S
X-Gm-Message-State: AOJu0YzWXW95DQihenxsIDNHAwJRsFhYlqOLIPKH4Ic6322U8pon0Eix
	7FONZfusM+QiZVvvN3HePXLkpaC1UBGihJz5h35XJ34OwyZSu8hIEa1qqmzPwSLktIZujyHx/ju
	LcFsvvkja/stBAgqGALwTmwlkHWwsBG4+iTV9AA==
X-Google-Smtp-Source: AGHT+IEQ/4e3Xdlw5o+oGBoYc/qjPodJ1x+HDfCTQwbUcL2+yeysXxIOfH8cuC7q3IN5+SY5krebRZTNRqtrnD1+EdY=
X-Received: by 2002:a05:6870:9722:b0:22e:8ca0:36ba with SMTP id
 586e51a60fabf-24172bd7029mr15691437fac.22.1715702217977; Tue, 14 May 2024
 08:56:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240514153532.3622371-1-surenb@google.com>
In-Reply-To: <20240514153532.3622371-1-surenb@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 14 May 2024 09:56:20 -0600
Message-ID: <CA+CK2bCmy1PhDgDvEX2Pg=_HvLLD2msJmTV_rgMxifbd-y1wRA@mail.gmail.com>
Subject: Re: [PATCH 1/1] lib: add version into /proc/allocinfo output
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, vbabka@suse.cz, 
	keescook@chromium.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 9:35=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> Add version string at the beginning of /proc/allocinfo to allow later
> format changes. Exampe output:
>
> > head /proc/allocinfo
> allocinfo - version: 1.0
>            0        0 init/main.c:1314 func:do_initcalls
>            0        0 init/do_mounts.c:353 func:mount_nodev_root
>            0        0 init/do_mounts.c:187 func:mount_root_generic
>            0        0 init/do_mounts.c:158 func:do_mount_root
>            0        0 init/initramfs.c:493 func:unpack_to_rootfs
>            0        0 init/initramfs.c:492 func:unpack_to_rootfs
>            0        0 init/initramfs.c:491 func:unpack_to_rootfs
>          512        1 arch/x86/events/rapl.c:681 func:init_rapl_pmus
>          128        1 arch/x86/events/rapl.c:571 func:rapl_cpu_online

It would be also useful to add a header line:

$ head /proc/allocinfo
allocinfo - version: 1.0
# <size> <calls> <tag>
            0        0 init/main.c:1314 func:do_initcalls
            0        0 init/do_mounts.c:353 func:mount_nodev_root
            0        0 init/do_mounts.c:187 func:mount_root_generic
            0        0 init/do_mounts.c:158 func:do_mount_root
...

This would be the same as in /proc/slabinfo:
$ sudo head /proc/slabinfo
slabinfo - version: 2.1
# name            <active_objs> <num_objs> <objsize> <objperslab>
<pagesperslab> : tunables <limit> <batchcount> <sharedfactor> :
slabdata <active_slabs> <num_slabs> <sharedavail>
pid_3               2730   2730    192   42    2 : tunables    0    0
  0 : slabdata     65     65      0
..

Pasha
