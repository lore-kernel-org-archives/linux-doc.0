Received: from mail-oo1-f98.google.com (mail-oo1-f98.google.com [209.85.161.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E19D253951
	for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 23:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789772433; cv=none; b=BKntQSIW4a9wxRiuM+VOopauiEXEmrGEcB4Ayj7znz947bpjRS+PxCu3c3eRO/tNjt//PM1ufomxDEKFrFNTFZQuBq0vA7HRxjHXq689Bw7wiyk0k9899N8Md0qVvG4TiNgD5xJYpL1D0sIZIiEkPtfB9avIWvN5zl7Q26z5N8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789772433; c=relaxed/simple;
	bh=fEMxC05dulBBzaa3yawFl8qEq6BGbKfE/sjwt0iyWLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V2dK40+mTVX9258Yq0jvPjsgj8ckRlK0qOIY3k82Vth/8dQTkYoGy/iJP7fXJ8Kql1PTtbHote4gNlSB2qAPx1LgB2cTimAz+lG8JAQBo74D/okV+n81m3AqdcIFAnWSwBokSjhEwmmGeHPgqTWsKguAzQA9osK9XREPAomCqYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=aLhqd5Bv; arc=none smtp.client-ip=209.85.161.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="aLhqd5Bv"
Received: by mail-oo1-f98.google.com with SMTP id 006d021491bc7-6b1b3d7f10eso240759eaf.3
        for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 16:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789772431; x=1790377231;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3KMfRrKt1f9vrOU12c5wtkxGOvY6nJDylHuduYaPWGk=;
        b=ds/5WrDrIdXZVojPDd8FiDG07YXQ44ufxTQPAJcfLC2/sGH9C688aOGc51BSG192yR
         wTOAQJ/1Ae8dRPs6vWf/wYdhfJCy+EQroZ5GIXro7w62LKn1z/PQlnoq2pMIu7h2B6sm
         DKozI/Jm0ytDYxrTa8zbeqEXnu4egUIsYEIUE6SN10e7Ilmr0E9Bvb4NmsVBQx23PJUR
         F3Tp5GpaKfJDL76jruHk8CMdublc8M7qDhWhuXd3Lpjrzq96Awgv1eHf8anKVgzSPNxw
         OuDX7WMEAztKFFy8MKow3T/6Nf9jm/d9uBrNR2YuGH7XH+iMskEICv4BrM50/MXre+8o
         sjfg==
X-Forwarded-Encrypted: i=1; AKwUvBz07pCosTlw0S1esMEqLl5tXGrcX3U7Klf+X75JbbyFDcxvFYskg+2hjuULJDwJ3aDvKeEJxAEtOPk=@vger.kernel.org
X-Gm-Message-State: AFuF++kJshdQ+HX5pyUIEkL3jAbmE8QsJ9sHsMI/EulQY6qT8obWQGj/
	mQEEyoAWweS4N0hBBi4Viw/ic4E2HQBuwwng0OfMJ/kGiJrKnhldWyjggLkN0mf8jAJOvmhFLOn
	7qQfSs8bPW7+noq4d+vqesWy4ijbJGdQ8+aFpmdAZxTiRI2cnNogE3uNasEsbKAsSjxkmUA8ahK
	E9CSDtTdp4yK0R+kGgYo/md8JQrIHG8L2ckh4KC+EupQ3X8gAUz9SrGA53sW3Xj0IIoTx4SJMdA
	vM7nxoRiJvS
X-Gm-Gg: AYBFou224hvbzGDvn9kIP62dd1jv8qEmLM2qvnWUwsRIfSyZrlaHfThW5zUMkrrmo/8
	n9+Cb3IPTNCcA68infL9GCraYlJ4BvdBEwJn1VYsTflMwC/zdpGqVVptqR7RjlqCT1GOT4GiJuB
	SL+FwbrqQMxyJOKLHmXiDsm/oP/nHpPhBCpAjcOR/b8tu3eAuWrPTBbCgf6zHLRI7BqFK/2eLqG
	xpz2J1Nf7aUpsNkOiVnZDSyhDo2apBSr8aVc5xZRfzAgJdJ/DXkIYqBGAH1q7FqxufmvUliLtr/
	+GTo7Mswszd19qlKLb1StIp52VUfoCVAt2A8WEG9Q2uCdxR2fx6hq1h88rXcDUm7+aQSft8zeSp
	bhK+luu59EObYHsF1fhvSwwE54MHEr08AJmqC629U3Zm8M2FByu+o/NN9WrhxbPuKAo4gtzOivK
	aBNhbjR9gRPlSRxMTRgV0t8Z+YeUgHMcX5tMk=
X-Received: by 2002:a05:6820:1990:b0:6b7:8415:d77f with SMTP id 006d021491bc7-6ca9c059093mr3514230eaf.42.1789772431018;
        Fri, 18 Sep 2026 16:00:31 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4881cca1a4dsm23687fac.0.2026.09.18.16.00.30
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Sep 2026 16:00:31 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-3a1fa5bb969so5852501fa.0
        for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 16:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789772429; x=1790377229; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3KMfRrKt1f9vrOU12c5wtkxGOvY6nJDylHuduYaPWGk=;
        b=aLhqd5BvGQu7t0QdGnjEDdTD3DTyB5A9Cse+jVpfoH2B9KBKThbgN2f/85MiAraX1Z
         NPS7QyD5dqP/tP3uIvDyx5SWtFVc2EfrOm3WM8j9e+EKlw3AjkhdLSAZrDK9OIZEynxS
         24PeITu6bUgsF0mfBbeWpfeLLVVkRt9FSrOnU=
X-Forwarded-Encrypted: i=1; AKwUvBzyT+ESF58bJJLb4iDwZkq8Yb0KQcAGAl98bgiJoVrL1slCnGJLCySdIgicEdGXC1C2glaSR7kXng0=@vger.kernel.org
X-Received: by 2002:a05:6512:159d:b0:5b6:4ad:77b3 with SMTP id 2adb3069b0e04-5b8c184fdb1mr1253422e87.27.1789772428856;
        Fri, 18 Sep 2026 16:00:28 -0700 (PDT)
X-Received: by 2002:a05:6512:159d:b0:5b6:4ad:77b3 with SMTP id
 2adb3069b0e04-5b8c184fdb1mr1253406e87.27.1789772428354; Fri, 18 Sep 2026
 16:00:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788414671.git.zack.rusin@broadcom.com> <7487011dfb95aadda9515b22a5852680df1982c5.1788414671.git.zack.rusin@broadcom.com>
 <aquttpMVKX8e6zGB@pathway.suse.cz> <CABQX2QPJVg-dZB9f4ydRU_5W7nyWwVCQtDoRGoe1+9cA7wyUDw@mail.gmail.com>
 <bc0bdd14-5e6a-0676-cd04-14fb0bb93cd5@igalia.com>
In-Reply-To: <bc0bdd14-5e6a-0676-cd04-14fb0bb93cd5@igalia.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 18 Sep 2026 19:00:13 -0400
X-Gm-Features: AcwNN1W9lMhxZ0Ag7iI_GI8G3SXomYGHl4Cl2Mrq5Z0118EogNv41H5NqksNg5M
Message-ID: <CABQX2QMDNHcKotEa_t9Y37L+uHhV-CfqSR2vcRpNT1c2O9C_2Q@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] x86/vmware: Run panic diagnostics before kdump by default
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Petr Mladek <pmladek@suse.com>, Borislav Petkov <bp@alien8.de>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org, 
	Joel Granados <joel.granados@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	virtualization@lists.linux.dev, bcm-kernel-feedback-list@broadcom.com, 
	linux-kernel@vger.kernel.org, John Ogness <john.ogness@linutronix.de>, 
	Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Kees Cook <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Dave Young <ruirui.yang@linux.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Bo Gan <bo.gan@broadcom.com>, 
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>, kexec@lists.infradead.org, 
	linux-doc@vger.kernel.org, Stephen Brennan <stephen.s.brennan@oracle.com>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000dfa03c065bc9dd02"

--000000000000dfa03c065bc9dd02
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 10:26=E2=80=AFAM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> Hi Petr, Zack - thanks for CCing me!
> Some comments below:

Hi, Guilherme.

Thanks for looking at this and for adding Stephen. I'll keep you both copie=
d.

> On 18/09/2026 00:23, Zack Rusin wrote:
> >> [...]
> >> Maybe, we should start with something simple, and introduce
> >> one more panic notifier as a start. It might be called either:
> >>
> >>   + "panic_hypervisor_list" because "crash_kexec_post_notifiers =3D tr=
ue"
> >>     seems to be primary set on hypervisors.
> >>
> >> But I would rather make it more generic and call it
> >>
> >>   + panic_pre_crash_kexec or panic_pre_kdump because there might be
> >>     more notifiers which are either 100% safe and useful or are worth
> >>     the risk before calling crash dump.
> >>
> >> We could put there x86/vmware notifiers as a start. And we could later
> >> move there other important notifiers.
> >>
> >> How does that sound, please?
> >
>
> It's a good idea, IMO. We could start with this, Zach commented some
> implementation details below...and after it gets merged, we could move
> other hypervisors that currently set "crash_kexec_post_notifiers" to
> this list and eventually, unexport this symbol. We should avoid having
> code forcing this parameter, as Petr said, many notifiers are executed
> if that is set.

Agreed. The v2 I'm working on drops VMware's assignment to
crash_kexec_post_notifiers and leaves the existing setting unchanged.

> (I'm CCing Stephen Brennan here, I recall he had problems with this
> being auto-set, we talked about that in the panic notifiers big
> discussions in the past heh)
>
> The only thing I'd like to suggest: I think we should have a parameter
> that disables running this list, which would be the opposite of
> "crash_kexec_post_notifiers".
>
> I would implement it as something like: "postpone_pre_kexec_notifiers"
> or something like that. The parameter would basically "move" this list
> execution to the same time as the current notifiers, gating them to
> "crash_kexec_post_notifiers". This way, we'd allow users to debug kexec
> failures maybe related to the "early" notifiers. WDYT?

I'm happy to add that as a separate patch if Petr agrees. With it set,
the new list would follow ordinary panic-notifier ordering relative to
kdump: it would run before a successful transition only when
crash_kexec_post_notifiers is also set. If panic reaches the late
site, the list would remain eligible to run there. I'd keep that site
after sys_info() and before the kmsg dumpers so the log includes the
additional notifier and panic_print output available at that point.

I've called it panic_pre_kdump_postpone after the list, but I'm fine
with whatever name you and Petr prefer.

> > [...]
> > I think that without that default though, x86 oops_end() can enter
> > crash_kexec(regs) before reaching panic(), for example with
> > panic_on_oops=3D1. To cover that path too, I'd call the chain from
> > __crash_kexec() after the image check and register capture, under the
> > existing kexec lock. A second call in vpanic(), immediately before
> > kmsg_dump_desc(), would cover the fallback path. And I think a
> > set-once guard would prevent duplicate or recursive dispatch.
> >
>
> Regarding this, 2 things:
>
> a) I think you could change kexec_should_crash() to "return 0" also in
> case the new list is set to run, the same is done currently for
> "crash_kexec_post_notifiers". Makes sense?

I'd prefer to leave kexec_should_crash() unchanged. The direct oops
path supplies the exception registers to crash_kexec(regs), while
routing it through panic() would capture later state instead. In my
early v2 tests, the vmcores from the direct-oops path retain the
original fault registers in the crash notes. Some crash callers, for
example uv_nmi_kdump(), also bypass kexec_should_crash(). Calling the
chain from __crash_kexec() after register capture covers those paths
without changing their routing, and the shared once-only guard
prevents duplicate or recursive dispatch.

> b) Well, does this whole panic diag thing you're implementing here aims
> only at x86 guests ? Or would it be possible to run, for example, arm64
> guests? Asking this because in x86 and some other architectures (but not
> arm64[0]), it's possible to override machine_crash_shutdown() handler,
> and run things prior to a kexec. Take a look on how Hyper-V does that on
> arch/x86 - this could be just what you need, except if you plan to have
> it for all architectures heh

I'd like to support arm64 guests in the near future, but I figured
especially for review sake to limit our client in this series to x86.
So I prefer the common chain Petr proposed: as the thread you linked
shows, arm64 deliberately has no such override, and the chain gives
other clients a place to migrate away from forcing
crash_kexec_post_notifiers.

Would keeping the two call sites, with postponement in a separate
patch, work for you and Petr?

z

--000000000000dfa03c065bc9dd02
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIHOa
+0IiCwwqnpfl7/PL0BKXpAwBhOY+sEXiwrhDo2quMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MDkxODIzMDAyOVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBACRzkdS8PBtfkVAgw6esLlajTHbCJvKmZJkRVr58
TKwTOIDnizhMQX39ryHLEz+SD1ex6VhUZ3JiKyRUL1SJ7P4UVMLEIJcdr6WKlCjDYvghmJpxYTBS
tEL4YpMckbVF3ueneBELQ6o/FvKAZeB5wDLvfV88Pj4CHC5CbEMnvy9cIO7sugP6SY5OwMSFQwIB
WEHEFaFC8YuqXJokyOP2NTzPjRbUG7DBVMRnZC0BVS+3LSKsM+5Q+lDG2xUjlY0wg/BpHPk2SoSd
FPIpzt8SkrUErXBxGvoOMo9Kp8r9U8yDRO2moS2l0o7zLg7Ent/3yYT1uwTb/xy2hiHK1wAToAE=
--000000000000dfa03c065bc9dd02--
