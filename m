Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793253771;
	b=mClqXY4UchF0fLZkPT5hZX2qXVxD9cQEqxKmo5MsbWvjwL9+zuqduAvYql9+IhbvVnp2
	 wYk06kFrmkBHnKQ2oE3qyQ16vBmbr/fP6haKLPSsKJbkULsJ6EueDUMwVykZIZ00jIFRt
	 406BoazB7StzpZb2t/NGNLitbVnS0krDiBgY/HOENT3cgUm7mYcUjw9OfPisMOMTSWktq
	 RndaZ6tYzYp0kebzrQb97RcL4AOh1YCAafmXaMgXB2v38TT/gWBctqFzPe+i+ZcJNQMLV
	 gkKOCplyBNpwwaXsYh1nGxTLim/WUm96BHBj+HGQZigAymNFA8symcNKZLs447DDWqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793253771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hXQbAH9F+jWXJFIK38nCMq5VZ1dNb0WqnmInbL0EisU=;
	b=wjVEHQjWqCKlhyuWug4H1SpWyenCdjjxpU8aGcIscgUBZFnraX/zVNWr76knwuY1/Nyb
	 nmB8V3bv4L53lZ0RImbXK9P1GaXDuMV4+833PI0qShLzDK/VCnaTzhSWDiKOh87W05Ajh
	 kyO7fsm0T1nPA55t+eB6MPkh4FwhP301utU2OkX/bWgPuDrJ+AHv3QQ6xszd2YvxiPn9w
	 O89OUN6FRTwXVg3caS8dVBIjZMf79kg6PyrJ5SEyFS10civd/FQZ5lABJfW4Vzpi0ei7t
	 eNXCMgx11beRx2PB10UDgVmVZzV64mDSja5PP0X5VWWBeJfboe95Tdvormm4pxBWTgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=kTE3iHoy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CAC606A31C
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 06:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47CAC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=kTE3iHoy
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e20edd106so1328813f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 23:02:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793253770; cv=none;
        d=google.com; s=arc-20260327;
        b=AIGtb27U1UNX9rOcIFckCZELs3zFzQFLVu92+lNAg+IOSx2k7Js1+O6onChiJ1/S7R
         GYti+EsVWbvGVEcSqjop+W/OM1QdU9ZwMTcfMRMfXSV4cnN3aX4AIVS/0n9Pk304JcYe
         jafL6/JfONX/9XksNwiIoE1w92jXxp71l03b+XE6xQuPSCh3M0wS6oNkbJusRRPnGQIO
         c2NMaww7xScFbqnJaZGxuMlCaK6dVQyWfQgLu17HzG/Smqv/SX17W7NIjUUXTW0R3fNp
         lhcXNsXfcORujO+PcE1axwj/1qS6BFCPvImmNG2nEjN51iui6dNfX6uF4aNcqe+plM9n
         OjxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hXQbAH9F+jWXJFIK38nCMq5VZ1dNb0WqnmInbL0EisU=;
        fh=F10PRIC2hND4LS7fgo5v2eA7cS1S33+dDuGc3HYFb/A=;
        b=X12NXaKQiwJeA+JRk/SfQ5IjcrSUPU9XbojokJ52QiAsjib8Y49hyIrovIbb1uzYY8
         KPkdttwura1hFTIq/XL3gJCSu4wnorpKuR14U7STWd/Efx/Vui7fuiCB9LP64hMvIvG8
         0UMjI5Kfdi+IIau0BUm7fryVub/GMjlu5d0VD1kLUJAFHK7aj4ujh7H793+Uoma0hTym
         TCrp7Fi26jN6tuE+w6AjO5xdgGfe9ue5YJN/Aoe7zkCuiIiVW3jKCv2YcBk6hi9x3xkC
         S72hWXXoy3FsGZ2I67Mbu64u42s1ZlWyRFJG8HbDb77jufBPNPOdn4aItB97BiG4qPwD
         fIaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793253770; x=1793858570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hXQbAH9F+jWXJFIK38nCMq5VZ1dNb0WqnmInbL0EisU=;
        b=kTE3iHoyaRzExfvJwjm3Qk1IPu1w1InAhorCg4ASpedHH26Fp9iDN+GvZfOxn5B5jm
         /ZDwVvV2e+qmZcFCGy1OpMlWO+VOtnOsfLuGQeWpcUlvf5nRfaDhJKKnpQIoI/oj9Vfz
         MWYHDfyF2fGlrh4TCtsSldock76axkoPHWgRCNzXM/gbmKuPG3YZTYIUn8qDBUrvgHni
         k431nr018QL7Q9tp2X8sJwy+0gYd9QghdxthVLtWpeY7WF2LgRNFtjoEL1hsu2q4RO0M
         aor4Q8PIQS+DFqv03Kyi/hfHwI/8XBJSCEd3WdGqGC+NiWzt8bDu82tumIx+Og6GTSav
         XKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793253770; x=1793858570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXQbAH9F+jWXJFIK38nCMq5VZ1dNb0WqnmInbL0EisU=;
        b=pRekxAlGTOoz+Slb7bBcDu5S3TcrudYeqjaJnDyT1kZuylFC/UwO9buGrNV2xNmzrt
         RrhXku46ay1Sb9DZG9cecW7halTZ+0kELQoXTg2Vp8WhTcE8FGBZuQgkoktU/2Y5RfIo
         oWM3jYqiFXhCq0MDVayOZNn01sa5Om3/qrL6R6waBjCw8kaNq8LJ1LmQrszzWB8rwtCp
         Rh1lzKkG3wZU0/GjbYat8umWKK4LZdfD8Hq5PzJ33dRpmEehXPZFSkYLSEEMyvJ3fCWA
         ZxirXURlA0I0gtjTyzwSo7WWvb24TwBvzINeUfwmbasvB9evcRdAj++ZgRGNcToqmOyL
         BSIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzohaI/Gka15sXFjW3FQCTdG4lr6In4TvwLPTGJTviKIFdKPgD52KyQnCHDp79cKjOO+atqZuLV6EQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYa09Zx693/XHfNSjkzqtFOha7wVsbhneinoXFDtswarXu1RrY
	dhLTMiPr6O/gIrvZcIxtNyzQ6OYwiw4mwzS89X1Ro+3p5Vk5dsFpCu3zGez3vkccSJmPsA3LH0t
	PFxwrj2XX1O40+NV3pYVU5aSLmJ6mA+JosBPoL4LZ+Q==
X-Gm-Gg: AYBFou3ZKSQLmTGtjCfua05GyfQA3Auy01PVYk0q1pJFDY3WObet3z0vRNedBnOE9xQ
	bTVex/YY2Ln81+uMC6x8ToanF489AWtW9jC8IVN2LDf7IOBUBpUQ9yaHTXCiv4dgnef2ICPeJAx
	ELLArddWQzzqdOUYpYblObaApzL5BlCUCpd6vzuy+pEUSfvyNulD0DKIyPRTP8s6Z93ZxT02DoG
	4655rFVClfml/hvKBvdAwZ4ix3Mc/fs2GQNHTBmSCuQLlE3Uwysn+LwViHUnIf74GlAq2t8d5ml
	91bEna3QiZGKxN2DDG44Cs04EAp0E6uA6/zhOVEHom7Ao7Vcb1T3s06H7zphXRY8wwT6EcH95hx
	oD8xVYkqiomgUa95kjqxGg/iZ3u/zt2/5AHTeVZKtQW/d7Pxatc73LlXvpkD4KbsZsY2GwJAxZF
	5LVe2E5X+eRyEhUysIgtFTp4KS/8yOhTrV0hyHYHvt8AnWITWiaYus/hKs
X-Received: by 2002:a05:6000:41c5:b0:48d:f3f8:f910 with SMTP id
 ffacd0b85a97d-48e5d5a45c0mr10372553f8f.34.1793253769206; Wed, 28 Oct 2026
 23:02:49 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028165531.940336-1-anup.patel@oss.qualcomm.com>
 <CACnXVncwzQiUN9CO8_Ds7UQJEKzEF29vagsTFrC0WbRZXt7aLw@mail.gmail.com>
 <CAAhSdy1u4Tme=cv7pSyYeahh1BQhQOnsnWBn3D4yxTnfzrApPA@mail.gmail.com> <CACnXVndt7Rm3UqZH=T3xYjQ+1H-zPMgU29FcCOjJ2mtu=avoWg@mail.gmail.com>
In-Reply-To: <CACnXVndt7Rm3UqZH=T3xYjQ+1H-zPMgU29FcCOjJ2mtu=avoWg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 29 Oct 2026 11:32:36 +0530
X-Gm-Features: AclHuK_p0hCRo8pr_WRUDjy07skD9Um-9_bl0z2ojXK9jzlo0dDOGwVfM7SiBGw
Message-ID: <CAAhSdy3WVmzEkG4fgTuXENcys_cWX8h6Hag_fYSkyOdu++iBBQ@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] riscv: add SBI Supervisor Software Events support
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Paul Walmsley <pjw@kernel.org>, Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>, 
	Anup Patel <anup.patel@oss.qualcomm.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti <alex@ghiti.fr>, 
	Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atish.patra@linux.dev>, Yuanzhu <yuanzhu@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 9:10=E2=80=AFAM Zhanpeng Zhang
<zhangzhanpeng.jasper@bytedance.com> wrote:
>
> Hi all,
>
> On 10/29/26 11:17 AM, Anup Patel wrote:
> > On Thu, Oct 29, 2026 at 8:36=E2=80=AFAM Zhanpeng Zhang
> > <zhangzhanpeng.jasper@bytedance.com> wrote:
> >>
> >> Hi Anup, Paul, Himanshu,
> >>
> >> On 10/29/26 12:55 AM, Anup Patel wrote:
> >>
> >>> [...]
> >>>
> >>> Changes in v11
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>
> >>> Rebased on latest for-next branch of linux-riscv tree (commit a5ae1bf=
65cee).
> >>> Also, tested PMU driver with both PMU irqs and PMU SSE events.
> >>>
> >>
> >> Thanks for rebasing and testing the series. I was a little surprised
> >> to see v11 posted, as I am still working through Himanshu's v10 review
> >> and validating the fixes on hardware. It would have been helpful to
> >> coordinate before reposting so that those changes could be included.
> >>
> >> I guess this follows Paul's request to rebase onto riscv/for-next.
> >> However, there is one change beyond the rebase that I would like to
> >> clarify: why does patch 4 remove the scoped_guard(preempt) sections
> >> from the CPU hotplug paths? These were present in v10 RESEND, and
> >> the local helpers still retain their preemption-disabled assertions.
> >> Is there a reason this protection is no longer needed?
> >
> > Yes, this is based on discussion with Paul yesterday.
> >
> > This series is blocking the whole RAS ACPI support.
> >
> >>
> >> The changes discussed on the v10 threads are still outstanding in
> >> this posting:
> >>
> >> - Preserve TASK_TI_A0/A1/A2 across nested exceptions.
> >> - Replace the temporary GUP-based perf user-stack copy with nofault
> >>     uaccess, following the x86 approach.
> >> - Address the per-CPU initialization/preemption concern.
> >> - Split the MAINTAINERS updates into a separate patch.
> >
> > There is always going to be new updates since it will take
> > time to harden the SSE implementation. All these changes
> > can be done as separate follow-on patches.
> >
> >>
> >> Additional fixes from Sashiko review, the kernel test robot report,
> >> and our follow-up debugging are also being consolidated:
> >>
> >> - NMI-safe entry and lockdep irqflags tracking.
> >> - The unused-function warning reported by the kernel test robot.
> >> - RV32 vmalloc synchronization before nofault fixup.
> >> - Faulting-PC validation in the kprobe single-step fault path.
> >> - Per-counter STOP handling in SSE error paths.
> >> - Ordinary IRQ CPU-PM notifier ordering and IRQ cleanup tracking.
> >
> > Same comment as above, please do this as separate series.
> > No point in holding all other dependent work endlessly.
> >
>
> I agree that we should unblock the dependent work. However, I would
> not characterize addressing a known, reproduced issue as holding things
> up endlessly.
>
> >>
> >> In particular, Himanshu identified the missing preservation of
> >> TASK_TI_A0/A1/A2 across nested exceptions [1]. Following his review,
> >> I validated the fix with hardware A/B testing: removing it reproduced
> >> corruption, while the fixed kernel completed the same test sequence.
> >> This also gives us a solid basis for replacing the temporary GUP
> >> workaround with nofault uaccess.
> >>
> >> Paul, please hold off on taking this version into for-next until
> >> these fixes are included. The rebase and PMU testing are useful, but
> >> there are still outstanding correctness issues.
> >>
> >> I will consolidate the changes and post v12 against riscv/for-next,
> >> with an updated changelog and validation results. Let's coordinate
> >> the next posting to keep everything together.
> >>
> >> Thanks,
> >> Zhanpeng
> >>
> >> [1] https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm=
.com/
> >
> > Regards,
> > Anup
>
> I'll post a focused v12 before this weekend with the immediate
> correctness fixes. Further improvements can follow separately.

Linux-7.4 merge window closes end-of this week so your v12
will be too late for it hence I suggest sending incremental fixes
separately.

Regards,
Anup
