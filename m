Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365AB142E75
	for <linux-doc@vger.kernel.org>; Wed,  3 Apr 2024 12:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712146406; cv=none; b=HsplXc/RFlLHmZZSZv12vg1xU+k0YQlMm6fdoeLIAF63FtajVMB8X4VuN3R6SAgNpu91lCwUGs3FnQW8N1S15M5oN+oIJSBn+2yW9x5RVpXmtjp5qQwEb3FwRHi8KDey80bCMnIQtolP1YH64OIoK/ayAfFYic73rbA73YpbI/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712146406; c=relaxed/simple;
	bh=hPesv8A+iZqlRr7D/fKBzdPB01WTru5uB9GQT6XWXBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BEAfcGtQ8reZrvqEyl/MdxpyxbDKYGHnDK4Vud2Dq/73Yzr2Nf3J/a9wjummMgmUU5cgBBRxIktEZBSKQg8/tOm0SC2T6Nq+7RT1CAZzdHkYCWPDhY3zKeeT6ycj7f0dB8+0F4VB5M22Z4HpoAraFQVKdsdZmk0DiZf9h8zmfmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YX3rn5Gw; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YX3rn5Gw"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5a52c5c96feso2321218eaf.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Apr 2024 05:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712146403; x=1712751203; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjRKejsFXZQk8rarEOCmsLs+7H5bp8Y0BYC9TTvN18I=;
        b=YX3rn5GwaosHxCHilbTPQCORORsaR4ajnbYDhjFcP92Mkbg49O9Tk7I5KVy1WHDA42
         06nyR1r0pi4BIZ1b6bCH/WzefoX+i89NKjG2fbxRbf+xJ3NHT9UKA60TkOGNv0hYpWxK
         TsE2Or3IPL4+OFNWrQtTrMiuuVyMwTdph4sT+VnHsgV0O8tTwxZXJbLouyXx+vNiB1S+
         1MQpSkVUihGin50cZpGRHJqZ0lSNDyOkhOeiEbRJu/DD2T4CizsUB9lnJhYKvszcAIdQ
         +RSO+zY+DavmK+eV0BqFf2kYym4ErtHoEoFmePlhZwlQeXaxgmzlMZ2qtvaHMIrL5FOx
         Oz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712146403; x=1712751203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjRKejsFXZQk8rarEOCmsLs+7H5bp8Y0BYC9TTvN18I=;
        b=ptResZITpOnDzZ3FUocI9GtbwskHceM5ObYzTfM0uFQ07PXslxMcRKT7sQEzg5RMEK
         U2ZYHj1RKJA5ApVXTkN55qqajQFWIqbR9zIKbxdgawJ/7wFgDUu0lSbOMoAvsmrFsYDT
         b7o2R9P56J2riyhwbj99G+t2e+64SR/0/SpkF0+qweSPIcbC4NNu8RHtNtHzA85vlau8
         2T0uos1Ysx413I86PBRxECzWtu8YefSZ/Vk7HTem/ZrZ3Y4wfqaF4uQEO482kiTITZf5
         NSFnL804xQixRNYhBedFj2Yzh67K+3IPMPJ24z7WEHrSWfW9k0CTBfvXC38HpGiBjeQq
         xMUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPGDT+mxjMU3vZYgx9NU4iT9twTMO/u1jpuU42KVS8qAcejWgZX/TdO6wVSLWgf5vKEzea2WlSCKeXmRMEWA3+fADHVlFwnGzw
X-Gm-Message-State: AOJu0YzvBBIPvsLh7o9IpnyQQ7e6vihZ7B+b10twY0RHBih78kek/68b
	cT8HIPkasVpebyweiLEbpMK5Frks44RV8v8tnrBRq3WETgOigAx8Ao1LSbkcCfMt8cKP2tqXUyL
	QCTQZS+mDGb6bQFYX0F+1zlOLySDupn/ZVrsyiQ==
X-Google-Smtp-Source: AGHT+IFbaWK7QqXfEXj6KV33OwI/JaywKWSpgbqcwNxYrTYrdHmVOJ3P8JY85HhjUaZGh1s/c302EEresHr+B2qWtQg=
X-Received: by 2002:a05:6820:99b:b0:5a5:8b0a:60cb with SMTP id
 cg27-20020a056820099b00b005a58b0a60cbmr14955489oob.1.1712146403337; Wed, 03
 Apr 2024 05:13:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325151105.135667-1-balint.dobszay@arm.com>
In-Reply-To: <20240325151105.135667-1-balint.dobszay@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 3 Apr 2024 14:13:12 +0200
Message-ID: <CAHUa44H-7V8SjEt6Xj5+hW-nAVMkuRC=pwvsgyGyzcgVaOXTYw@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] TEE driver for Trusted Services
To: Balint Dobszay <balint.dobszay@arm.com>
Cc: op-tee@lists.trustedfirmware.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	sumit.garg@linaro.org, corbet@lwn.net, sudeep.holla@arm.com, 
	rdunlap@infradead.org, krzk@kernel.org, gyorgy.szing@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 4:11=E2=80=AFPM Balint Dobszay <balint.dobszay@arm.=
com> wrote:
>
> This series introduces a TEE driver for Trusted Services [1].
>
> Trusted Services is a TrustedFirmware.org project that provides a
> framework for developing and deploying device Root of Trust services in
> FF-A [2] Secure Partitions. The project hosts the reference
> implementation of Arm Platform Security Architecture [3] for Arm
> A-profile devices.
>
> The FF-A Secure Partitions are accessible through the FF-A driver in
> Linux. However, the FF-A driver doesn't have a user space interface so
> user space clients currently cannot access Trusted Services. The goal of
> this TEE driver is to bridge this gap and make Trusted Services
> functionality accessible from user space.
>
> Changelog:
> v3[7] -> v4:
>   - Remove unnecessary callbacks from tstee_ops
>   - Add maintainers entry for the new driver
>
> v2[6] -> v3:
>   - Add patch "tee: Refactor TEE subsystem header files" from Sumit
>   - Remove unnecessary includes from core.c
>   - Remove the mutex from "struct ts_context_data" since the same
>     mechanism could be implemented by reusing the XArray's internal lock
>   - Rename tee_shm_pool_op_*_helper functions as suggested by Sumit
>   - Replace pr_* with dev_* as previously suggested by Krzysztof
>
> v1[5] -> v2:
>   - Refactor session handling to use XArray instead of IDR and linked
>     list (the linked list was redundant as pointed out by Jens, and IDR
>     is now deprecated in favor of XArray)
>   - Refactor tstee_probe() to not call tee_device_unregister() before
>     calling tee_device_register()
>   - Address comments from Krzysztof and Jens
>   - Address documentation comments from Randy
>   - Use module_ffa_driver() macro instead of separate module init / exit
>     functions
>   - Reformat max line length 100 -> 80
>
> RFC[4] -> v1:
>   - Add patch for moving pool_op helper functions to the TEE subsystem,
>     as suggested by Jens
>   - Address comments from Sumit, add patch for documentation
>
> [1] https://www.trustedfirmware.org/projects/trusted-services/
> [2] https://developer.arm.com/documentation/den0077/
> [3] https://www.arm.com/architecture/security-features/platform-security
> [4] https://lore.kernel.org/linux-arm-kernel/20230927152145.111777-1-bali=
nt.dobszay@arm.com/
> [5] https://lore.kernel.org/lkml/20240213145239.379875-1-balint.dobszay@a=
rm.com/
> [6] https://lore.kernel.org/lkml/20240223095133.109046-1-balint.dobszay@a=
rm.com/
> [7] https://lore.kernel.org/lkml/20240305101745.213933-1-balint.dobszay@a=
rm.com/
>
>
> Balint Dobszay (4):
>   tee: optee: Move pool_op helper functions
>   tee: tstee: Add Trusted Services TEE driver
>   Documentation: tee: Add TS-TEE driver
>   MAINTAINERS: tee: tstee: Add entry
>
> Sumit Garg (1):
>   tee: Refactor TEE subsystem header files
>
>  Documentation/tee/index.rst         |   1 +
>  Documentation/tee/ts-tee.rst        |  71 ++++
>  MAINTAINERS                         |  10 +
>  drivers/tee/Kconfig                 |   1 +
>  drivers/tee/Makefile                |   1 +
>  drivers/tee/amdtee/amdtee_private.h |   2 +-
>  drivers/tee/amdtee/call.c           |   2 +-
>  drivers/tee/amdtee/core.c           |   3 +-
>  drivers/tee/amdtee/shm_pool.c       |   2 +-
>  drivers/tee/optee/call.c            |   2 +-
>  drivers/tee/optee/core.c            |  66 +---
>  drivers/tee/optee/device.c          |   2 +-
>  drivers/tee/optee/ffa_abi.c         |   8 +-
>  drivers/tee/optee/notif.c           |   2 +-
>  drivers/tee/optee/optee_private.h   |  14 +-
>  drivers/tee/optee/rpc.c             |   2 +-
>  drivers/tee/optee/smc_abi.c         |  11 +-
>  drivers/tee/tee_core.c              |   2 +-
>  drivers/tee/tee_private.h           |  35 --
>  drivers/tee/tee_shm.c               |  66 +++-
>  drivers/tee/tee_shm_pool.c          |   2 +-
>  drivers/tee/tstee/Kconfig           |  11 +
>  drivers/tee/tstee/Makefile          |   3 +
>  drivers/tee/tstee/core.c            | 480 ++++++++++++++++++++++++++++
>  drivers/tee/tstee/tstee_private.h   |  92 ++++++
>  include/linux/tee_core.h            | 306 ++++++++++++++++++
>  include/linux/tee_drv.h             | 285 ++---------------
>  include/uapi/linux/tee.h            |   1 +
>  28 files changed, 1094 insertions(+), 389 deletions(-)
>  create mode 100644 Documentation/tee/ts-tee.rst
>  create mode 100644 drivers/tee/tstee/Kconfig
>  create mode 100644 drivers/tee/tstee/Makefile
>  create mode 100644 drivers/tee/tstee/core.c
>  create mode 100644 drivers/tee/tstee/tstee_private.h
>  create mode 100644 include/linux/tee_core.h
>
> --
> 2.34.1
>

I'm picking up this patch set.

Thanks,
Jens
