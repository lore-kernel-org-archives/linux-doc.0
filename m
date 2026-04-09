Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82554324B2D
	for <linux-doc@vger.kernel.org>; Thu,  9 Apr 2026 21:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775768812; cv=pass; b=bUwJo494np4i1XA9jo8EEuBO/qudT1VV3g8N0swXBe9gfSJqvv5z3EPtm98/v1r5OdipS9Jcw/++AaRYAz4t5XOrZukLHI/fdCDEFeQr2gWIdqbZR6q2bxJuO2uuf8adMQJemFUE8JpHh4xX1HRwyAlFQdofWsubVfNm+wCjjKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775768812; c=relaxed/simple;
	bh=Jh9WA8x2awad3lmAqYVpxS5VOwXt/AnG9yTjUz42fhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A4582g+f8xdIhR/Tg7a3AjsWTuqkzhb1VovtUsdIW4VMTUulOiBRvVwZdKL8dO5EkYutf7CK+E/apvUWrlOesdkO4+TEeARwfkJeE4tLkOHGeLoNB9qukTko5ZibJ8GHWFQFiCQi+InIEfWLbFptgsrSFTBWZsYmi37KisxHcfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N5q5gE5X; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N5q5gE5X"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67070d9ba4dso2761a12.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 14:06:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775768809; cv=none;
        d=google.com; s=arc-20240605;
        b=Ebokl9NEHv5WJOayavWd5N+67/oBiMzK+/W6H6VMJADrPvkhIMArZM3jGEQbXBDza/
         UMrR7+X8UBNYPjkaci7RXyJLfzMXhZ0zDeTEJVu5gII+LLLIy6pdjrcKZLuw0c5HKIkP
         KbMPgDzZQzYLEV7zOIrm5hUCT403XvJzqJ25540t77Cv3ijTjBQEGbINdTOoYLd6ohIJ
         DEhBBmabSCwraRCz+axVxkRu/kNyNUFdrAC3VN/e+6/ih7QmTC6aSP0TilJmkVJphIWH
         FxStJ+C5vzzpboixdpj4e7q0n6bZ7UJgTPRKkQKPDX1Bn/5TqZfGwBu0UedVOdnQ6xLt
         oB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T6Io+TbgEInBUXr2ZZvVAjzS0NzLS5bRjm9qTjcDPeU=;
        fh=u0e8DjAvOx6dmJYSU3Rg3jaEft/YCu0aUYyq+uOlBwI=;
        b=bQGUK5ydjA1FODBHyzB5cnx7dUrT1lynvTPku4hIt0vpPX6n0bKyRXhMQxhnFzDTNh
         FNTGb4s9GTIJFgiC/CdynMnJBaun3T7O8BfoUn8SLTCZ3ABPBI02RwZPiYQfu4z9tSnZ
         Wnhmq60o64UNVI/tGN9vEfQt7TcdKTR6ADgIBSUca1PkDdb+eoxqsUXBQwga5IYBd54S
         rzACeEERbk3MC494JFPuECKg4ufS31N292B6vjEAQ5YnpQrlnZKqz9+koq3s7JvpOKw1
         hOnZ6MlfQyfTBb3MKc6WGBP1UQ6GBsMv7Rd/qMePD34NJFoygjcegJwCr+CyVNIMyJlk
         g9pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775768809; x=1776373609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6Io+TbgEInBUXr2ZZvVAjzS0NzLS5bRjm9qTjcDPeU=;
        b=N5q5gE5XZJ2yYNIdmYor+kWbrOcd8iEX7Ctpi0F+2Md0qQnWSA1Afc6qFcTrN8C3bQ
         TF5cjdXy1H10yJhuvM49JQQD5ggH4ThQr6ROst0afwNDa5tk9hVE7bQ6YOPqls8O+yG6
         WcmtBfFUXP71se+/R5rvKaRbYDDP3wr8/XvgsNzrzIQUQrD2vtEPUdmJwD8J4ynqSZ/Z
         z28bPGk2F2WEJwUHoPvrl3Bme3bX1jvtfexjmhpFhE1j8zWe0BEO8AvBLugxl+CLDQ5N
         hHOa02rBVavtPIT1buOtLr7Lb297cN9XYXi1s4jDVHWnIv0whud0PZFG+TfBiAAJhZBf
         KpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775768809; x=1776373609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T6Io+TbgEInBUXr2ZZvVAjzS0NzLS5bRjm9qTjcDPeU=;
        b=H/3jgM+kp7gs+iER9iuEG49nbd/sV2dS/QIaYAgam8skNtXU7CNPbbUtrEAbgwst7j
         J3Mft3oKYqSNSU4xWWb1UcxV7h0oydWET/b5l2B/4dACl7AgZkP+jhcY1Tq43oYuflmf
         uUXk43Ik7hQdG8KKYudl4hleEEYfGUT3QOs8lsQxHm5QaCxkLG51BjHh+yuhOYTTjvHq
         D3HNYdDGLAgjRK+YSwnOf8wWMCPoaEpSlsPxz/qc/Mz8OtJmOLJBz7Re/wvnBXngPUXH
         gQzlXTIHj13hGzxQ2fCi1J1M5UTfa437WDNksa6Antz5UE5ZKL6ucUk3Az0obga4v2gr
         o19Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUD3KNOvu2SjwtKaJEst9Ped46QFTl8S7U8xC/E913XRw4rm5irkKJAkPxBp8VGMje3W+i1nzDJZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWCJ/9iyna+GL43BqRQdJFS4iYDMuzGIksUGWfdhntVUAVyiwD
	GmkFV5buEhJW9JVkL6EY7s0CgU6TtZU8TOCO93Cnb7e77VdGRLK9PRuRWeoW1NYeLQhmIhf4wBe
	BweNjKWM/wjlkXPEGLW751x/+zZxxYgOaeJPUS36Q
X-Gm-Gg: AeBDietLH0HGHCp/n+wOyfsPo7Kn4TGPgLXoXZfDQBhyP+l44NMoxuEYQZWhawxSzve
	BHsm/lKddUntfYweHe9oAkakYrN5XqGbbG4mz/NQPUB1IZwF6au4HiyOSK8mTZzmXvm4tQMDPCe
	JCbW5KOaxz5U9kmC1b5sDDF7c7SB+oCuukTdIn/XTR6/SOdnpwAFxJgBvC4KGptoeEWJnPnDIRP
	MrPTKBRERBIX7QEwVNAXJwNEKKe3eB4D0zVcDvoynQ946PHDJvXlXuHDKdBFVUtdO+MwgpGCKCY
	GH9ffNOMtVkDFtiT5w==
X-Received: by 2002:a05:6402:26cc:b0:664:eadc:7262 with SMTP id
 4fb4d7f45d1cf-6701e2ad1e6mr79997a12.13.1775768808382; Thu, 09 Apr 2026
 14:06:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260404002149.wtayv6a64vzuppgp@desk> <CALMp9eSqgL5q-MY1xpjqR5oRn5_cb=mfEhNFWusNneS=Mx8UMg@mail.gmail.com>
 <20260404034954.t7iapenzvhdpagxp@desk> <CALMp9eR70eE2U63gzNzTiic0PqJVGv3CBBuVUOVbi3nqbWKZkQ@mail.gmail.com>
 <20260407163943.y6tkh26z2rfktn3y@desk> <CALMp9eTA3cXxuOT4dq=6y1hx52gPH1ywwTEmPQ5-fA-vz6r3VQ@mail.gmail.com>
 <20260407171151.2gf2idjbmph35ypb@desk> <CALMp9eRNVGFpzk_-ajQTuXadMtoY9H-ndUaz78wTT1zDYbTrPQ@mail.gmail.com>
 <20260407191128.b2hr2ttkdpyunhrr@desk> <CALMp9eTK0o7Z7-oTB8ohvmoh-vy-Y2qjdUvbqD6HaEhOEPZmhw@mail.gmail.com>
 <20260407222738.lrartp6evfp7yhti@desk> <CALMp9eQjSqwnvJz4JVzYpMkkTiucSJtW48zC4Hj9GBiUhOH-Eg@mail.gmail.com>
 <a605fb45-f8e3-45ad-8924-1da43b9a9e05@intel.com> <CALMp9eRfNsghM_RnDXOs=SJYObfPa5A1aOVDZno_zJ=XotfmRw@mail.gmail.com>
 <410df9f6-69ec-483f-9009-0a9b8c9162a9@intel.com>
In-Reply-To: <410df9f6-69ec-483f-9009-0a9b8c9162a9@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 9 Apr 2026 14:06:36 -0700
X-Gm-Features: AQROBzDpN1eCOiQJSVX_bZO_GJCCAd5QpgFXMhi42CoW97OvabZocFA88ATO2hY
Message-ID: <CALMp9eQx3H+n3V3dQh+ZafQZ6uNBjSYk8tZsvG6ffcY43YTrnQ@mail.gmail.com>
Subject: Re: [PATCH v9 02/10] x86/bhi: Make clear_bhb_loop() effective on
 newer CPUs
To: Dave Hansen <dave.hansen@intel.com>
Cc: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, x86@kernel.org, 
	Jon Kohler <jon@nutanix.com>, Nikolay Borisov <nik.borisov@suse.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, David Kaplan <david.kaplan@amd.com>, 
	Sean Christopherson <seanjc@google.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, KP Singh <kpsingh@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, David Laight <david.laight.linux@gmail.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	David Ahern <dsahern@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Asit Mallick <asit.k.mallick@intel.com>, Tao Zhang <tao1.zhang@intel.com>, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, chao.gao@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 9, 2026 at 1:36=E2=80=AFPM Dave Hansen <dave.hansen@intel.com> =
wrote:
>
> On 4/7/26 17:47, Jim Mattson wrote:
> > On Tue, Apr 7, 2026 at 4:41=E2=80=AFPM Dave Hansen <dave.hansen@intel.c=
om> wrote:
> >> On 4/7/26 16:27, Jim Mattson wrote:
> >>> What is your proposed BHI_DIS_S override mechanism, then?
> >> Let me make sure I get this right. The desire is to:
> >>
> >> 1. Have hypervisors lie to guests about the CPU they are running on (f=
or
> >>    the benefit of large/diverse migration pools)
> >> 2. Have guests be allowed to boot with BHI_DIS_S for performance
> >> 3. Have apps in those guests that care about security to opt back in t=
o
> >>    BHI_DIS_S for themselves?
> > I just want guests on heterogeneous migration pools to properly
> > protect themselves from native BHI when running on host kernels at
> > least as far back as Linux v6.6.
> >
> > To that end, I would be satisfied with using the longer BHB clearing
> > sequence when HYPERVISOR is true and BHI_CTRL is false.
>
> If the guests can't get mitigation information from model/family because
> the hypervisor is lying (or may lie), then it's on the hypervisor to
> figure it out.
>
> I'm not sure we want to just assume that all hypervisors are going to
> lie all the time about this.

Without any information, that is exactly what we must assume. There is
precedent for this.

In vulnerable_to_its():

        /*
         * If a VMM did not expose ITS_NO, assume that a guest could
         * be running on a vulnerable hardware or may migrate to such
         * hardware.
         */
        if (boot_cpu_has(X86_FEATURE_HYPERVISOR))
                return true;


In cpu_set_bug_bits():

        /*
         * Intel parts with eIBRS are vulnerable to BHI attacks. Parts with
         * BHI_NO still need to use the BHI mitigation to prevent Intra-mod=
e
         * attacks.  When virtualized, eIBRS could be hidden, assume vulner=
able.
         */
        if (!cpu_matches(cpu_vuln_whitelist, NO_BHI) &&
            (boot_cpu_has(X86_FEATURE_IBRS_ENHANCED) ||
             boot_cpu_has(X86_FEATURE_HYPERVISOR)))
                setup_force_cpu_bug(X86_BUG_BHI);

...and...

        if (c->x86_vendor =3D=3D X86_VENDOR_AMD) {
                if (!cpu_has(c, X86_FEATURE_TSA_SQ_NO) ||
                    !cpu_has(c, X86_FEATURE_TSA_L1_NO)) {
                        if (cpu_matches(cpu_vuln_blacklist, TSA) ||
                            /* Enable bug on Zen guests to allow for
live migration. */
                            (cpu_has(c, X86_FEATURE_HYPERVISOR) &&
cpu_has(c, X86_FEATURE_ZEN)))
                                setup_force_cpu_bug(X86_BUG_TSA);
                }
        }


In check_null_seg_clears_base():

        /*
         * CPUID bit above wasn't set. If this kernel is still running
         * as a HV guest, then the HV has decided not to advertize
         * that CPUID bit for whatever reason. For example, one
         * member of the migration pool might be vulnerable. Which
         * means, the bug is present: set the BUG flag and return.
         */
        if (cpu_has(c, X86_FEATURE_HYPERVISOR)) {
                set_cpu_bug(c, X86_BUG_NULL_SEG);
                return;
        }

The hypervisor could provide more information so that the guest can
determine when it's safe to use the short sequence, but that's just
icing on the cake. The default, out-of-the-box configuration must be
safe.
