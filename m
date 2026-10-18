Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431CB3D903B
	for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 22:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792364195; cv=pass; b=DP/UtnddFJ7kivXpdTeQjlnliMV1qR5i8uWxw8RaCtKLeQnX2GSWzUge8VRMVZakKLMcZog+H9bmb2QmyTd9lhWr1C0OE/eSmXJ33mFLiQ2gBvV8Q1ndOHFSdnDwCmQDhXjHIvUl8Iq7h0rN+sq6irVXyiJAbz3zaevHmZILrGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792364195; c=relaxed/simple;
	bh=VOFkIvAigdspmltRsC5BPa5luOWcWKRWs14otyoXgFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PdM5xF7NfJKfBVBITmAvrbt9Ym75Gd3PF3oowF2bqPqfkMdU6KhmSJ9MdHnTLqe+KNJTQJXyLsiIFHA8xgik1C69RPsjVdMbfaHnUOAJz0B2svofvHZyR8yTfK7gnQPwqykFJd31W7g769/kiguHcPmF13WazdvOnqwPS75ytyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=loErZrPs; arc=pass smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="loErZrPs"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-81ae6aefdceso1371460a34.0
        for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 15:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792364193; cv=none;
        d=google.com; s=arc-20260327;
        b=XSncXMJEFVb2ZbVtLq7eI/WZ16RdR6do/gB4CVYdEkCq8UXfJ9f5l2KzlnN+z5X/q7
         mg3NvH85nXE7flaataXun8LvcsXU+YsCLLtnppU/F44Zq44ti+Ygoh2B+1ZpUZ+6yt+C
         zmHinqJWthloFMcLwsP4limfDCyYfTFNVyb1ja+AeXoXCAa4vxArUQ7OW2jG3pO/SvBH
         ZONkSRVVxvUwTMnKp3EKE2Pjlmw+fBZDm+3hoNMSlN5svpDXltXaSe8qjSqMOjeSq3ti
         EvxVMBOE0Uep5EV6IoR77e0o/8FJSldmOOHuluiGvYRBmAW1nW3xerxISw5aT25sRjI+
         KlFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ejS/LpjqoYagtCx8wF4IBCZ5sMYQJivNYsQq5fSIx44=;
        fh=ZARqXFHXY+xpR+XCNtwm4x330gncvHvkigeCOlqfLw8=;
        b=lh+g+hpyyPlXv5+idcNEAqphjmvluMbGsNe/dYqd1eVajU1Vbi8dwAOeJcFUdodcDf
         BbxDGvATjhvnN6Ge4kAErsmhKxOSWiUFjZPfzWGCAxG4NAZjxnLtPCNo9F463mXE6GUc
         uhEwjMEM5vxweN15SeAIGHmNLS98L/S9CobUcOfEByXi9R6aXI4ASnhHSJBARFn7alOa
         Iyhjx2CZskbKxkj8hNUXSj1gC5oZY+0ZLnkLnaCUkm1H6/+HSTorl/gYccHDzpl62VBi
         4raU2p8z3ZXhoMndBhEYFLYlM3hSPqgyGUmzAYl4Rm7e2QGIrHcUMHJbc6JaCYjDfoQd
         Iidg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792364193; x=1792968993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ejS/LpjqoYagtCx8wF4IBCZ5sMYQJivNYsQq5fSIx44=;
        b=loErZrPsVxfxTvLN3UWmgTs8Wtm6cLLzrYo6DywA4QFZniisWD9tcisU9w6WB23bVC
         XzRBNaWKDnmSg/rWBmzWe9W9urGOPIBIGq6gWH5t2wn43VQ/bRjsMqRGokNzRa0h97Yc
         IYx3BNEiElmqZuNM5Vo31V4W9Uq/mHPHFVIK4gxseI2QTfq8z6JPlR32XmvGiHxonzdt
         tiQz1PFgfw6dzDm99MosMlh9k7BCsQXxjToyYaMGxdm5DN07XLDy6ruljYKo8lc1dvdo
         VJ1lA5Z+dC6C+e8DPOEehRZTcLc/3y59ZzwLH7oJSEmqai/mrWVo/ASj/HXi6uI4II2F
         0gUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792364193; x=1792968993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ejS/LpjqoYagtCx8wF4IBCZ5sMYQJivNYsQq5fSIx44=;
        b=at0I3+dPe1XGFSy551bdSoQ234T/C21uFOPHXgSHdFeIaNQPMynKhQuP9TGTmVRpZQ
         fetmDHAfsXRg4wpdRcS7Al2+0US5zYvd4N17Fj40uobfN/qmv7B3ZD1Un4J/s+iyGjN2
         9IRrFwCT5wxlH6S354ATbwooesj13CqOptPv5ip/+EFxcHSOstLncdVofgneS+vV8fww
         O1yvSOrK/DVNDI78CiT5ROy/lqL9J5mqFMbmjioU/BvJV5Q2OUOtWKdqr7ESFJZbLkPn
         3kyKUj+OgDqFylHuSdO3+dYflC49iagPQCebjoY52Q/308x6Hcq5Va9eLymaMWL5aDJ2
         +WVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzd4asFN488wRQrlQ6YBvt4uOiEMgKnWLVWN8x+J7AX8PH8RbyPF957us/QyHbxtRieqIqbxvyAVJg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHp+ZkUpl4EB9bnzR546zF5YNGpj32Q/XjVG40RoIj2rXvunLC
	gvCXMI/gGp+8nrNoFYBMlLieRxV7XAh5+169b153364trvhreK/qJerTJUsafqEqzxvqo6Yi6cu
	fv+BHbx7qaNq2TtUxuzhvJ8WXyH8lBZU=
X-Gm-Gg: AYBFou37u0D9JE3FVQudbOuO2igMRyNqrGNjYw4BVxdJ+5D2fvdaziPcF1RkIzT78sO
	GO7VAItASZzWoPAU/nyyVizE79VAI1bYolWfkYj5a3wtm0/6TPV77r+1Tf15TBO0fFy4g1JELI7
	IpuzR23cQ3jRtDLXzpOsdx3odkGl5V8hhWxJ/Q07qYtLK+nEGgCXyKHhKGc2u2uibaTBHHbVtAJ
	E/kfy32qJQ2S/xjDoXvXy3bSJmrYHu6KN2fyplljy1Rftml3s0acF046AjKJ+784gkl+c65kYeZ
	Wg6+GujPx93l3lrQXJbTNvRRNtz/ZcPf+qrJrg9wJysyEMWff79QqnM=
X-Received: by 2002:a05:6830:4128:b0:81d:8057:9b7f with SMTP id
 46e09a7af769-84500f4d898mr5770027a34.28.1792364193081; Sun, 18 Oct 2026
 15:56:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726212812.89266-1-shijujose2008@gmail.com>
 <20260726212812.89266-3-shijujose2008@gmail.com> <20261017055852.GBatMOnEl66YObvU5k@fat_crate.local>
In-Reply-To: <20261017055852.GBatMOnEl66YObvU5k@fat_crate.local>
From: Shiju Jose <shijujose2008@gmail.com>
Date: Sun, 18 Oct 2026 23:56:22 +0100
X-Gm-Features: AclHuK-FL-g-dxxplQ9WjTqpUo6LUA2zDPurgO-FQV-GA5RtzvuribE1sLlFWfg
Message-ID: <CAG4KcR+NOKHNzg6FN-oLLHgUxeitZHKXg9cN7dz24+Ap=RrwSA@mail.gmail.com>
Subject: Re: [PATCH v23 2/2] ras: mem: Add ACPI RAS2 memory driver
To: Borislav Petkov <bp@alien8.de>
Cc: rafael@kernel.org, akpm@linux-foundation.org, rppt@kernel.org, 
	dferguson@amperecomputing.com, linux-edac@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	tony.luck@intel.com, lenb@kernel.org, Yazen.Ghannam@amd.com, 
	mchehab@kernel.org, ashok.raj@oss.qualcomm.com, jic23@kernel.org, 
	linuxarm@huawei.com, rientjes@google.com, jiaqiyan@google.com, 
	Jon.Grimm@amd.com, dave.hansen@linux.intel.com, naoya.horiguchi@nec.com, 
	james.morse@arm.com, jthoughton@google.com, somasundaram.a@hpe.com, 
	erdemaktas@google.com, pgonda@google.com, duenwen@google.com, 
	gthelen@google.com, wschwartz@amperecomputing.com, wbs@os.amperecomputing.com, 
	nifan.cxl@gmail.com, tanxiaofei@huawei.com, prime.zeng@hisilicon.com, 
	roberto.sassu@huawei.com, kangkang.shen@futurewei.com, 
	wanghuiqiang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 6:59=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Sun, Jul 26, 2026 at 10:28:12PM +0100, shijujose2008@gmail.com wrote:
> > From: Shiju Jose <shijujose2008@gmail.com>
> >
> > ACPI 6.5 Specification, section 5.2.21, defined RAS2 feature table (RAS=
2).
> > Driver adds support for RAS2 feature table, which provides interfaces f=
or
> > platform RAS features, e.g., for HW-based memory scrubbing, and logical=
 to
> > PA translation service. RAS2 uses PCC channel subspace for communicatin=
g
> > with the ACPI compliant HW platform.
> >
> > ACPI RAS2 auxiliary driver for the memory features binds to the auxilia=
ry
> > device, which is added by the RAS2 table parser in the ACPI RAS2 driver=
.
> >
> > Given the address range provided to the userspace may be the lowest scr=
ub
> > address range in the presence of disjoint address ranges, skipping addr=
ess
> > ranges that are from other NUMA nodes but happen to lie within this ran=
ge.
> >
> > Driver retrieves the PA range of the NUMA domain and use it as the
> > 'Requested Address Range', when send RAS2 command GET_PATROL_PARAMETERS
> > to get parameters that apply to all addresses in the NUMA domain.
> >
> > Device with ACPI RAS2 scrub feature registers with EDAC device driver,
> > which retrieves the scrub descriptor from EDAC scrub and exposes
> > the scrub control attributes for RAS2 scrub instance to userspace in
> > /sys/bus/edac/devices/acpi_ras_memX/scrub0/.
> >
> > Add 'enable_demand' attribute to the EDAC scrub interface to start/stop
> > the demand scrub, which is used in the RAS2 demand scrub control.
> > When a demand scrub is started, any background scrub currently in progr=
ess
> > will be stopped and then automatically restarted at the beginning when =
the
> > demand scrub has completed.
> >
> > Co-developed-by: Jonathan Cameron <jic23@kernel.org>
> > Signed-off-by: Jonathan Cameron <jic23@kernel.org>
> > Tested-by: Daniel Ferguson <danielf@os.amperecomputing.com>
> > Signed-off-by: Shiju Jose <shijujose2008@gmail.com>
> > ---
> >  Documentation/ABI/testing/sysfs-edac-scrub |  20 +-
> >  Documentation/edac/scrub.rst               |  70 +++
> >  drivers/edac/scrub.c                       |  12 +
> >  drivers/ras/Kconfig                        |  13 +
> >  drivers/ras/Makefile                       |   1 +
> >  drivers/ras/acpi_ras2.c                    | 624 +++++++++++++++++++++
> >  include/acpi/ras2.h                        |  29 +
> >  include/linux/edac.h                       |   4 +
> >  8 files changed, 768 insertions(+), 5 deletions(-)
> >  create mode 100644 drivers/ras/acpi_ras2.c
>
> Was this supposed to build on x86?
>
> drivers/ras/acpi_ras2.c: In function =E2=80=98ras2_update_patrol_scrub_pa=
rams_cache=E2=80=99:
> drivers/ras/acpi_ras2.c:68:9: error: implicit declaration of function =E2=
=80=98iowrite64=E2=80=99; did you mean =E2=80=98iowrite32=E2=80=99? [-Werro=
r=3Dimplicit-function-declaration]
>    68 |         iowrite64(ras2_ctx->mem_base, &ps_sm->params.req_addr_ran=
ge[0]);
>       |         ^~~~~~~~~
>       |         iowrite32
> drivers/ras/acpi_ras2.c:99:34: error: implicit declaration of function =
=E2=80=98ioread64=E2=80=99; did you mean =E2=80=98ioread32=E2=80=99? [-Werr=
or=3Dimplicit-function-declaration]
>    99 |                 ras2_ctx->base =3D ioread64(&ps_sm->params.actl_a=
ddr_range[0]);
>       |                                  ^~~~~~~~
>       |                                  ioread32
> cc1: some warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:290: drivers/ras/acpi_ras2.o] Error =
1
> make[4]: *** Waiting for unfinished jobs....
> make[3]: *** [scripts/Makefile.build:551: drivers/ras] Error 2
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [scripts/Makefile.build:551: drivers] Error 2
> make[2]: *** Waiting for unfinished jobs....
>
> .config attached.

Hi Boris,

I have got an arm64 setup only, did not try to build for X86 recently
after adding the following change
of using iowrite64 and ioread64 as suggested by
https://sashiko.dev/#/patchset/20260325165714.294-1-shiju.jose%40huawei.com

Following change is required to build for X86_64 build when using
iowrite64 and ioread64, while it was
fine for the ARM64 build.
Note: I'm not sure whether RAS2 is needed for the 32 bit build or not
and the result of the 32 bit build.

diff --git a/drivers/ras/acpi_ras2.c b/drivers/ras/acpi_ras2.c
index 51adfcddfa99..cb389ae6a3fa 100644
--- a/drivers/ras/acpi_ras2.c
+++ b/drivers/ras/acpi_ras2.c
@@ -12,6 +12,7 @@
 #include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/edac.h>
+#include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/kthread.h>
 #include <linux/platform_device.h>
 #include <acpi/ras2.h>

Thanks,
Shiju

>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
