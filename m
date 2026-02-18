Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF7C318BA6
	for <linux-doc@vger.kernel.org>; Wed, 18 Feb 2026 20:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771446855; cv=pass; b=NfaWchDaZv9yh8rRDp1LsCQcBbcfAWgSI6TwI5YFKTQ9oCrTJqiFgUl3M62tQfzwl9ipub15XWobyECQKvf2kjyNAQvg9xy5FrtLSIb1HlKLC77NlvVu6vZmThsqEWegPpVg98DJ+ObIy/bXmBnk040hr5LjVMDPPFT0C19S9t8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771446855; c=relaxed/simple;
	bh=7C5a/FWuVnB5cGwTAOV2Br2wE+JlZH1M0yzztc2OQnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YNss5VHtDkcLWQXZJVCfzpVy9IgxRehbvH1Ix/bgM0SjXPG/xOEyctdGIY/P4Q99ipfE0Bpk6IOpcb2c2DAPkC2k0GWkf6LWreMzI1nGBbqpsGCd3vec8K7CXP6C/AGvkwFq77+ItBKBhgaBnmseEtIVxfqV1E2EPGQziBHdJoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b=Z4MERPRO; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b="Z4MERPRO"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59e4989dacdso347318e87.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Feb 2026 12:34:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771446852; cv=none;
        d=google.com; s=arc-20240605;
        b=XJOLXqG9wQzel3UTeE7NjISZxFusFqdzo2bbXbcW6bL1upKNRRyJOH5b+xv8R4qQiD
         GqeIAfW8ieLpa35drQjGE09ZRseomnlFLZY8vnGGwnd/7lUEBIYePr0BRLf7b/mCoWHV
         PXJaUnovEPd5SU98/XfdFNKyoBUXBbIF2ualSWR8BXkKbUxegtBRBZXgl9FFoJWgDSJU
         I/0ml0jnGJjcJCgRabwVC6WlXIPfCuUVeztnejl8uLOs3MfNZmsXcLZ4ka/e47TbOB7X
         +8Us/r0Eh3J4YZXT/OT1VVb/wUA4oNhdaJ6g5sTKXxwYQGT0XEh660FTLjvCtP1qxDXo
         FZjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6AtdZqt2ARoYJJMPe919rNdJ3JohEndwFbHKNaMS4Pw=;
        fh=bUIwVzcidhAh75WiHcAcJa5sW0YSX/Fv4cQ3HpKgUDM=;
        b=KFfFYbCh6+h4lkq862+1w5bheV0d/t7sAlYhMNyS/g5Qd/3BGe3yYb3YyFmc1tjh8R
         yWL5Mhu9X2CXABYFj2n+kXv5eCjUJ3+EurvEYd+RyXgkIbjDtUx8DxFcJyNzWHkxG0Dm
         jaJGaq1wJOyx0ja2AZqYPcLym45c+pnA3Hp3j+P5Z2qmzPFrp2FYlrMRqaLb/t7P0m5+
         SV5Aa0lVuYuedtFIOnEJw8liCTpuyK0AnGZPon1hY0Y/XwjLe24y/IlBXmYW1SuZvmRY
         rH2L13NJb32JSb+oEKP8Htt/43uXorniAUhGx5BQhcYXDNYdAwVZppDXWC6oCROr6JWR
         Cl5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20230601.gappssmtp.com; s=20230601; t=1771446852; x=1772051652; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AtdZqt2ARoYJJMPe919rNdJ3JohEndwFbHKNaMS4Pw=;
        b=Z4MERPROgc9FSVfsG/kG3t98pIsPZiZa2ci+uYC8QxNYZkIennmepWfaiy7Su18KK4
         XL22ZPuUBe0n4IDEa5pCurRylazjGAVX1OmmoNEjfSxpevk9PQUIMFk5G6kXLbqdjiOO
         fqYt3arXfK+vc7SaJ/DL7BwDklV9pbrB8HHrXjb+oweXnLTx4Cdk5LXocPhK7369V3HC
         aBoWerMPnojZBqm+P7TfDpbyBsNBRPoofMPIJsdtWxi+ymZYmqEnYt2BJKtIS6s8nGkP
         h+gbveSCj6t3jiYDKFzSlZTqUuiFL/tNzrF6CYvIzH75E4v/8g0KMg91glEciuzyaGGt
         Ltkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771446852; x=1772051652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6AtdZqt2ARoYJJMPe919rNdJ3JohEndwFbHKNaMS4Pw=;
        b=ueSXbqQt/LIcwfHz8/b7cYN8i/+ZuTHEhahB3JGCXbzz4MnqyC8wgRDw0gOx8dbsdZ
         89Hwg6me0uQ06/Tut/hzpGqOnINHZYapCEEkKlpXYpoSv79OpFHyX3VPW2bMjKBN1JSQ
         ksNVFHinTQ3+G7OQpbRLZWhIVuiUUnZ9TbzBPHFl9Qnu5ubXDEhEZezjhuyv5EpEsJoq
         its+b8XuDFFEQCa/t4bqiqmsGEwb1nmCFu0JnZKqZCcp4sjRqe1rlm8XUF/2qxt1+HO9
         Kdllo5thtjZRenB9LmjCOzVd6N/fSscugZL67oazL8j+5rnrYln2sJwSPhiQERNJ5MPl
         QAgw==
X-Forwarded-Encrypted: i=1; AJvYcCXwPI+KsuOlM01Sf4EYyFRLVOIzpkhKnFyfTpXtYOpLb0caoadu9p3KX+RzJQS5HiBRa9m12945ZNg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrjR/Gjbcc8ndeXvDE3K/2bx+EV1QBnjyGtlcynNhP1o7FCaWf
	TuLEvRIdxR99NtCCB20ZqnrZtUNF742gldPsOSsAvkliG93HaIePBcod/V+RNCxLBMn0gD4z67A
	NNm4MgpPhOqL0w4dOR7yse5ZzeDumzHtY432JTK9b
X-Gm-Gg: AZuq6aK0cY5M7xKRCFRzZmzmkWWtFlAZkqLmhcgtaEVN8CmMnOA4klU4jNe86olLsrZ
	b3bDXfD6sQZgCy7oDsE4ycnKWYAxMqWIgQzMEl9co4eMBM/HCIv9NpbEt5X/PWLc1fBrOEHEniG
	hxB0jZZmYFsDaB05E9s/No3dPY9EEi4ze2E/1cLDXanF4lArAUk3J0Ndy3hrF0HOkKOzmXI5Lw+
	VxkXKxg7slta2tixATyjbeRhPVneV2sDQ7mHxX/OdrIAD10WS2/qS+VShYl3vnoADh5bsLznLZj
	YHms
X-Received: by 2002:a05:6512:1284:b0:59e:63b7:585e with SMTP id
 2adb3069b0e04-59f69c68122mr5099221e87.36.1771446852112; Wed, 18 Feb 2026
 12:34:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215233316.1076248-1-ross.philipson@oracle.com>
 <b5f2b5a5-b984-4ed3-a023-c06d634f9146@app.fastmail.com> <1ffd3cb5-2c76-4371-a067-3e4849907d80@apertussolutions.com>
 <49d169bf-0ad2-49be-b7d7-fceb9e7f831a@app.fastmail.com> <CALCETrUE8c-dxRWhtHKz_PojwZuWMXJSzOsFQf2vt5LS3ATwpA@mail.gmail.com>
 <1BBD7449-8420-43FD-930B-A4E1BA38FFC6@zytor.com>
In-Reply-To: <1BBD7449-8420-43FD-930B-A4E1BA38FFC6@zytor.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 18 Feb 2026 12:34:00 -0800
X-Gm-Features: AaiRm52O5CUthtEuekouveR3oQDy41lsj_ZjT1TsYC4xSgI6Vkc6OZxoV-XcGok
Message-ID: <CALCETrWzG1Mjb-RcwLQ5-tGFZ15WKHjZbqtLvyif+UPuVKJ_5g@mail.gmail.com>
Subject: Re: [PATCH v15 00/28] x86: Secure Launch support for Intel TXT
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	Ross Philipson <ross.philipson@oracle.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-integrity@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, kexec@lists.infradead.org, 
	linux-efi@vger.kernel.org, iommu@lists.linux.dev, dave.hansen@linux.intel.com, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	mjg59@srcf.ucam.org, James.Bottomley@hansenpartnership.com, peterhuewe@gmx.de, 
	Jarkko Sakkinen <jarkko@kernel.org>, jgg@ziepe.ca, nivedita@alum.mit.edu, 
	Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net, corbet@lwn.net, 
	ebiederm@xmission.com, dwmw2@infradead.org, baolu.lu@linux.intel.com, 
	kanth.ghatraju@oracle.com, andrew.cooper3@citrix.com, 
	trenchboot-devel@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 12:29=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wro=
te:
>
> On February 18, 2026 12:03:27 PM PST, Andy Lutomirski <luto@amacapital.ne=
t> wrote:
> >On Thu, Feb 12, 2026 at 12:40=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org=
> wrote:
> >>
> >> On Thu, 12 Feb 2026, at 20:49, Daniel P. Smith wrote:
> >> > On 2/9/26 09:04, Ard Biesheuvel wrote:
> >> ...
> >> >> Surprisingly, even when doing a secure launch, the EFI runtime serv=
ices still work happily, which means (AIUI) that code that was excluded fro=
m the D-RTM TCB is still being executed at ring 0? Doesn't this defeat D-RT=
M entirely in the case some exploit is hidden in the EFI runtime code? Shou=
ld we measure the contents of EfiRuntimeServicesCode regions too?
> >> >
> >> > Yes, in fact in the early days I specifically stated that we should
> >> > provide for the ability to measure the RS blocks. Particularly if yo=
u
> >> > are not in an environment where you can isolate the calls to RS from=
 the
> >> > TCB. While the RS can pose runtime corruption risks, the larger conc=
ern
> >> > is integrating the D-RTM validation of the Intel System Resources
> >> > Defense (ISRD), aka SMI isolation/SMM Supervisor, provided by the In=
tel
> >> > System Security Report (ISSR). Within the ISSR is a list of memory
> >> > regions which the SMM Policy Shim (SPS) restricts a SMI handler's ac=
cess
> >> > when running. This allows a kernel to restrict what access a SMI han=
dler
> >> > are able to reach, thus allowing them to be removed from the TCB whe=
n
> >> > the appropriate guards are put in place.
> >> >
> >> > If you are interested in understanding these further, Satoshi Tanda =
has
> >> > probably the best technical explanation without Intel market speak.
> >> >
> >> > ISRD: https://tandasat.github.io/blog/2024/02/29/ISRD.html
> >> > ISSR: https://tandasat.github.io/blog/2024/03/18/ISSR.html
> >> >
> >>
> >> Thanks, I'll take a look at those.
> >>
> >> But would it be better to disable the runtime services by default when=
 doing a secure launch? PREEMPT_RT already does the same.
> >
> >So I have a possible way to disable EFI runtime service without losing
> >the ability to write EFI vars.  We come up with a simple file format
> >to store deferred EFI var updates and we come up with a place to put
> >it so that we find it early-ish in boot the next time around.  (This
> >could be done via integration with systemd-boot or shim some other
> >boot loader or it could actually be part of the kernel.)  And then,
> >instead of writing variables directly, we write them to the deferred
> >list and then update them on reboot (before TXT launch, etc).  [0]
> >This would be a distincly nontrivial project and would not work for
> >all configurations.
> >
> >As a maybe less painful option, we could disable EFI runtime services
> >but have a root-writable thing in sysfs that (a) turns them back on
> >but (b) first extends a PCR to say that they're turned back on.
> >
> >(Or someone could try running runtime services at CPL3...)
> >
> >[0] I have thought for years that Intel and AMD should do this on
> >their end, too.  Keep the sensitive part of SMI flash entirely locked
> >after boot and, instead of using magic SMM stuff to validate that
> >write attempts have the appropriate permissions and signatures, queue
> >them up as deferred upates and validate the signatures on the next
> >boot before locking flash.
> >
>
> *If* a physical EFI partition exists there is a lot to be said for this a=
pproach.
>
> The only issue with this that I can see is for things like network or CD/=
DVD booting where there isn't necessarily any EFI boot partition, it might =
not be writable, or it might not be persistent (e.g. http booting typically=
 uses a ramdisk, like the old Linux initrd.)

Hmm, I guess my approach is a 100% complete nonstarter for installing
Linux from a CD, and it's really not awesome for installing Linux from
a USB stick.
