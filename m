Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CF826868B
	for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 13:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740489692; cv=none; b=uJqrqRnpvmpg+YDYEE3DIndWcqEXS1MsWbDLuotfDN6bToboS0s0mhX9dmWg3PTNfSeUiU17fQt0nYeHBYs5nAcCagv1c0rPl5avnqKf/1CNHab/02Bzf2210ujVxMKP7IaevVd1/c0yvwKDTZRC2hjR90Ygh5MU1GuSnSC3dkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740489692; c=relaxed/simple;
	bh=EKfvaWu2ka37WW8F0h2KYY49IMP3AggspE68tEh5NyU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jeCNlby0kbX49T4kSRw0w0oUPQiysUiL29micxwEc0SQPz5z9/E9Vzs6sd+07L6ZkZXW8AV3Ifi+CdgIUfqr/wEhMNh8eRmK3qOj2E/07YT6R8sq3CvVChvS3WIxRTqPws1zKRhdKSmWexKI0HHlifYs3/SBPa4iiDzO87MCwew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=XYb+W9mW; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="XYb+W9mW"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e05780509dso7884917a12.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 05:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740489689; x=1741094489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQVKtrjGZwLtff10MUIe65eAbx+c/HuPXdtieDwyBWE=;
        b=XYb+W9mW5/XiFovow1zsn3pgOqbgVxXlDt1R4P9Jc45eCzJTmY3MDIAUnvW5SBJh2I
         dI/ctEYQBXycve0KTRIieD6oCB31Ws5J1bOHAzAN7hfZ4rQOMIoLjjSVsGDfN9IxWbfx
         ow1rZqg1mxMUc+NZEjLZzdO3YL5mGd6/ruRMlZQpcXZXJ020TsO6hTsXAk6upWPe0mvl
         coP97WPldBizCEbq2IhTthtzh0F5bhHfP7BhK67TFPM/57EyX7wYHsgym0+9xnxqCq3w
         YnP3z9125KELvzFNGMNo+wvkfaBhUqArJNmsrPrzsTY4lyJhmvhG+uSAoyRryulCgjyS
         dAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740489689; x=1741094489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQVKtrjGZwLtff10MUIe65eAbx+c/HuPXdtieDwyBWE=;
        b=qNTymOY9VkfRYGYPTjEs1Ldu0cFMXtk2fikjr2g3lhE0Y6E9zg1N8At1HZ0rPQm7Xu
         njwr10D2bmIffeNCdHYvIFdTNWzj/FoUBenuMgWk33BJIBDApxnWt25BdgZ7udVdnNXb
         9omTs/dXHXJ1VAYP4m6iAKPQOYh3BuTTGTCeMQULj/yfoLwro43+U/69l/gjBEqjhwAJ
         eI2d7FxVuwedb9BFStRAEMGqCwUPzOfi3+y6miDveHptQ+bIP3hBZez+ecOX6OnNaE5T
         lirhDkRXwut0Cf5RF5bFpxyO/VoTIbBF0Q1leJZ46uSya3KCK+kwXDuQICk+yJTldtnh
         QzBA==
X-Forwarded-Encrypted: i=1; AJvYcCVR+gJgzFALezZlQTpXMpI87F4jS4Sf5+EQs6g3v6lGGg3+XQimh64P10GU8FUeU17H7T1+yIjXRH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCyvktzbAEfeAsygzypVu5Cmnj25yWzN+St3B3/XiLf1gfmMgu
	bxF6D2gc8Cbxvz41iwzWWeC25MCmKz7wDbJ30e1fNwdhN7sTMlFVmYXBYJ5+NHBcYa31a9m32nv
	ExWLUl41Rgriopf13m/sRmQDTt/Avy332WzsUiA==
X-Gm-Gg: ASbGnctjYZV1c2mOdhRs0LXTmEHdi79XLihfp785NpGzRdjF5UTb3Th7lxEXCDW04Dz
	WeaPo/qyOewALtpV94HhjA8Tbd7faFweRdZmOMhi92PiHgtWbRzWSoYL8zhleEKptX9hgAZb72S
	ccneEOk8s=
X-Google-Smtp-Source: AGHT+IHJkGd46dH3GhCaZutb0iaa6Lqsb3O4IVtqX+tibBa3OYAt9wbckem9uhCu/SR6U7PagHj5+YL5qKc1+qd4mo0=
X-Received: by 2002:a05:6402:520d:b0:5dc:7fbe:7310 with SMTP id
 4fb4d7f45d1cf-5e44448119amr3305792a12.6.1740489688864; Tue, 25 Feb 2025
 05:21:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115024024.84365-1-cuiyunhui@bytedance.com>
In-Reply-To: <20250115024024.84365-1-cuiyunhui@bytedance.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 25 Feb 2025 14:21:17 +0100
X-Gm-Features: AQ5f1JrDelDcQ-WOsXduy79VlvN3oYPWPp4dCnEMKBs6m15M4RAQ60--X73WfXY
Message-ID: <CAHVXubhapunBD_+cZ=WeEp9GPJec795xOWSnMKmh_iSH09r2Yw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Enable Zicbom in usermode
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: ajones@ventanamicro.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, samuel.holland@sifive.com, 
	shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yunhui,

On Wed, Jan 15, 2025 at 3:40=E2=80=AFAM Yunhui Cui <cuiyunhui@bytedance.com=
> wrote:
>
> v1/v2:
> There is only the first patch: RISC-V: Enable cbo.clean/flush in usermode=
,
> which mainly removes the enabling of cbo.inval in user mode.
>
> v3:
> Add the functionality of Expose Zicbom and selftests for Zicbom.
>
> v4:
> Modify the order of macros, The test_no_cbo_inval function is added
> separately.
>
> v5:
> 1. Modify the order of RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE in hwprobe.rst
> 2. "TEST_NO_ZICBOINVAL" -> "TEST_NO_CBO_INVAL"
>
> Yunhui Cui (3):
>   RISC-V: Enable cbo.clean/flush in usermode
>   RISC-V: hwprobe: Expose Zicbom extension and its block size
>   RISC-V: selftests: Add TEST_ZICBOM into CBO tests
>
>  Documentation/arch/riscv/hwprobe.rst        |  6 ++
>  arch/riscv/include/asm/hwprobe.h            |  2 +-
>  arch/riscv/include/uapi/asm/hwprobe.h       |  2 +
>  arch/riscv/kernel/cpufeature.c              |  8 +++
>  arch/riscv/kernel/sys_hwprobe.c             |  6 ++
>  tools/testing/selftests/riscv/hwprobe/cbo.c | 66 +++++++++++++++++----
>  6 files changed, 78 insertions(+), 12 deletions(-)
>
> --
> 2.39.2
>

So a v6 needs to be sent with:

- the fix for hwprobe_ext0_has() reported by kernel test robot
- a rebase on top of 6.14 since patch 2 will conflict with
RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0

Do you think you can do that soon so that it gets merged in 6.15? The
patchset received a lot of RB so it would be too bad to miss this
release.

Thanks,

Alex
