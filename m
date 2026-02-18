Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0D334A76E
	for <linux-doc@vger.kernel.org>; Wed, 18 Feb 2026 21:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771448651; cv=none; b=U+kK4XpkDbMQPGB+rR8y6rjdhIkgGsK9W0MOUpoJ4Pza76YWCdYfsIm5GUSuGTV+RT4ENMqwIBT981EN88XtSoBs6oYugAbqQzikVfDVsnMuXBM/+/vLxG7Pkow0i1pxTsJzBAABQZMMVbLYsVBIHIZgFAaTfBvoFNmaej4z8Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771448651; c=relaxed/simple;
	bh=qBtd2CO59a+HKvdpME8+RXTr+DLTGtsE5jPI2nVtVKA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HFigcOhg2tasoTPInUUJ5kcQfaqLznbeSwEG5Zb2C00u6nnoonTR/9wq6Rslk520SIz3Py7q5LiIxFqmXV12XanKc5uFeAqxFI4vuUd0vD7aY16vjrM5gw6WOWIrCCoiIJUHWfwm0XfY0PAo/RD7MFbEUN4s66Cl+K6LBLJuLbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XUdB4z/2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=N5/oQMW7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XUdB4z/2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="N5/oQMW7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771448648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pPcRNxiA9VF/PkhlksjBanylvA2gRYuNpURfmKx7ewA=;
	b=XUdB4z/2ooGyyR1GFO/q6nUzsd6shssqEe5S3WTR+HSCOm61Tx+8x+4IZS7rhb5cFDHCcu
	2gV8+dDb+NWs11HPktnfXUporxv7KdST3HfRB0YR7aOlMraWCBdDipjxI50Ej0dm+wRC3C
	5Mtr0xNThT+0noB6uLqho2E84dOMc6Y=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-xatzwdMyPBC3CDQvM5kLpA-1; Wed, 18 Feb 2026 16:04:06 -0500
X-MC-Unique: xatzwdMyPBC3CDQvM5kLpA-1
X-Mimecast-MFC-AGG-ID: xatzwdMyPBC3CDQvM5kLpA_1771448646
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4817f3c8so138000985a.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Feb 2026 13:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771448646; x=1772053446; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pPcRNxiA9VF/PkhlksjBanylvA2gRYuNpURfmKx7ewA=;
        b=N5/oQMW77slCy5JJJssOVI61DoD9V2Vh5jAI0A0dy1ggfKFWmj7c7IzVs3r7hpZfoa
         TR07yOgyUIaNQAdEiOACUUr8lHyahS46iLIKE4X5/ShcXOa+H1xf5hqpUqE7uECij6Sq
         G9/Mkc4mtRVVSqPw64TQWf+nOLIWol9QOoxj+FoBVjE0lVP+TllAd+QlhjEuI2s+0Brd
         TR+yjGXWReX5vcEC60gwpahYdmldMBtgeT6GNlqeoKRgckcIB26ciiVPe3U7pCbKl3tv
         YDJw8TQ8VyMXtArM/M1Gj0sdeMnt3EkffcnAl6XyEH836KSsdVoFPnQrVHlsRVbwwqKd
         0G0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771448646; x=1772053446;
        h=mime-version:user-agent:content-transfer-encoding:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pPcRNxiA9VF/PkhlksjBanylvA2gRYuNpURfmKx7ewA=;
        b=HiNmYxft0aWZxW/gpaT2toLtDanx6w0lKjp8qhVoFsYKmUtb3Xl8QncapjhEOWspmz
         nWQZCTk50dZUs5At2bq/IAyiPqQzBoNPOtnn9/4jn14EjVPBBqe90qUIYhJ+zi9cSK1P
         3PM3IMXrF6iUt5n11eTy+NJfxBbuFlwIdSXFA5cRiAzo8cMd55i7EowQp3k4V11JPgsQ
         v1DIlEBILYPhItZE/DcCfckYnai6rDj2+GpHw1mf2ch6Omc2bIVTwnRSvlWrpk/r5gYe
         VdwVeQA6NgibWQfaeKdFskNSELn12TuxRPbjer483owjxYuTTuIEtAQqceSomTX1NSvw
         mU2A==
X-Forwarded-Encrypted: i=1; AJvYcCVq/AmdDmpm/ho2A6RvWjc9gJ//gHy+cF+C7ebeJzwwirwVHNichwZuuyAyttI6QPGHkenhgur36lc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyqVae7f4ehdNWy3s5XpexgRPCPd+0sD4PHCo19Z6OPwEqfDDn
	Orv9mdUjEA3wbtFDcIyKYAB+RSVsf8Yx5bTEwZa7u0j0m1hxZs6DcNlpdes/kL1sCsh5b30y9Br
	X4A6HZxm+HTaNGn5YB0aAQWeH50xc7Pd6QTwSKswEZfWqYt4hKTooCrzquj/q3w==
X-Gm-Gg: AZuq6aKApwOsoq2XxLhNxsblHUdNjER/8kZ5NRLXNgapqg+UWVR2fA1ZflxQRQgU0ED
	pZoEsIx3RC09HHe/xLycEsM7cIizld+ga5YmPrX6YbxkoUfIJG0PfACqVx2iG7Qp/KHeb+3727r
	JZFBUUdGjfw/UqESqj2CToXzzH35aiOAIUllfLUnDIOuEjpPXFRMsfE2TfvtyeKEr2a1E6YVYgh
	r6kq/FkTl2P4ZH6KD++eJEHcb+cz7hD5htCbvB7PoTgxjcKXRxUxc1+KoVBpLj0OXeHYsbu99PR
	xbh6nkYyWiEKD3Jpte0E5wJJEQyyXkEaVP3Q0CxJEAeXC/jc8TC+3yOA1dwUZ0CrhBaamVdnM4O
	9BcJwB8eTJwS2ODWc
X-Received: by 2002:a05:620a:4689:b0:8cb:4dc4:61be with SMTP id af79cd13be357-8cb4dc46babmr1909604085a.49.1771448646112;
        Wed, 18 Feb 2026 13:04:06 -0800 (PST)
X-Received: by 2002:a05:620a:4689:b0:8cb:4dc4:61be with SMTP id af79cd13be357-8cb4dc46babmr1909597185a.49.1771448645565;
        Wed, 18 Feb 2026 13:04:05 -0800 (PST)
Received: from m8.users.ipa.redhat.com ([2603:7000:9400:fe80::7a7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b1c7ef7sm2079117785a.28.2026.02.18.13.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 13:04:04 -0800 (PST)
Message-ID: <32e62cef7b89d9691bdd4120388ce752fd041230.camel@redhat.com>
Subject: Re: [PATCH v15 00/28] x86: Secure Launch support for Intel TXT
From: Simo Sorce <simo@redhat.com>
To: Andy Lutomirski <luto@amacapital.net>, "H. Peter Anvin" <hpa@zytor.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, "Daniel P. Smith"	
 <dpsmith@apertussolutions.com>, Ross Philipson <ross.philipson@oracle.com>,
 	linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-integrity@vger.kernel.org, 	linux-doc@vger.kernel.org,
 linux-crypto@vger.kernel.org, 	kexec@lists.infradead.org,
 linux-efi@vger.kernel.org, iommu@lists.linux.dev, 
	dave.hansen@linux.intel.com, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar	 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 mjg59@srcf.ucam.org, 	James.Bottomley@hansenpartnership.com,
 peterhuewe@gmx.de, Jarkko Sakkinen	 <jarkko@kernel.org>, jgg@ziepe.ca,
 nivedita@alum.mit.edu, Herbert Xu	 <herbert@gondor.apana.org.au>,
 davem@davemloft.net, corbet@lwn.net, 	ebiederm@xmission.com,
 dwmw2@infradead.org, baolu.lu@linux.intel.com, 	kanth.ghatraju@oracle.com,
 andrew.cooper3@citrix.com, 	trenchboot-devel@googlegroups.com
Date: Wed, 18 Feb 2026 16:04:03 -0500
In-Reply-To: <CALCETrWzG1Mjb-RcwLQ5-tGFZ15WKHjZbqtLvyif+UPuVKJ_5g@mail.gmail.com>
References: <20251215233316.1076248-1-ross.philipson@oracle.com>
	 <b5f2b5a5-b984-4ed3-a023-c06d634f9146@app.fastmail.com>
	 <1ffd3cb5-2c76-4371-a067-3e4849907d80@apertussolutions.com>
	 <49d169bf-0ad2-49be-b7d7-fceb9e7f831a@app.fastmail.com>
	 <CALCETrUE8c-dxRWhtHKz_PojwZuWMXJSzOsFQf2vt5LS3ATwpA@mail.gmail.com>
	 <1BBD7449-8420-43FD-930B-A4E1BA38FFC6@zytor.com>
	 <CALCETrWzG1Mjb-RcwLQ5-tGFZ15WKHjZbqtLvyif+UPuVKJ_5g@mail.gmail.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-02-18 at 12:34 -0800, Andy Lutomirski wrote:
> On Wed, Feb 18, 2026 at 12:29=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> w=
rote:
> >=20
> > On February 18, 2026 12:03:27 PM PST, Andy Lutomirski <luto@amacapital.=
net> wrote:
> > > On Thu, Feb 12, 2026 at 12:40=E2=80=AFPM Ard Biesheuvel <ardb@kernel.=
org> wrote:
> > > >=20
> > > > On Thu, 12 Feb 2026, at 20:49, Daniel P. Smith wrote:
> > > > > On 2/9/26 09:04, Ard Biesheuvel wrote:
> > > > ...
> > > > > > Surprisingly, even when doing a secure launch, the EFI runtime =
services still work happily, which means (AIUI) that code that was excluded=
 from the D-RTM TCB is still being executed at ring 0? Doesn't this defeat =
D-RTM entirely in the case some exploit is hidden in the EFI runtime code? =
Should we measure the contents of EfiRuntimeServicesCode regions too?
> > > > >=20
> > > > > Yes, in fact in the early days I specifically stated that we shou=
ld
> > > > > provide for the ability to measure the RS blocks. Particularly if=
 you
> > > > > are not in an environment where you can isolate the calls to RS f=
rom the
> > > > > TCB. While the RS can pose runtime corruption risks, the larger c=
oncern
> > > > > is integrating the D-RTM validation of the Intel System Resources
> > > > > Defense (ISRD), aka SMI isolation/SMM Supervisor, provided by the=
 Intel
> > > > > System Security Report (ISSR). Within the ISSR is a list of memor=
y
> > > > > regions which the SMM Policy Shim (SPS) restricts a SMI handler's=
 access
> > > > > when running. This allows a kernel to restrict what access a SMI =
handler
> > > > > are able to reach, thus allowing them to be removed from the TCB =
when
> > > > > the appropriate guards are put in place.
> > > > >=20
> > > > > If you are interested in understanding these further, Satoshi Tan=
da has
> > > > > probably the best technical explanation without Intel market spea=
k.
> > > > >=20
> > > > > ISRD: https://tandasat.github.io/blog/2024/02/29/ISRD.html
> > > > > ISSR: https://tandasat.github.io/blog/2024/03/18/ISSR.html
> > > > >=20
> > > >=20
> > > > Thanks, I'll take a look at those.
> > > >=20
> > > > But would it be better to disable the runtime services by default w=
hen doing a secure launch? PREEMPT_RT already does the same.
> > >=20
> > > So I have a possible way to disable EFI runtime service without losin=
g
> > > the ability to write EFI vars.  We come up with a simple file format
> > > to store deferred EFI var updates and we come up with a place to put
> > > it so that we find it early-ish in boot the next time around.  (This
> > > could be done via integration with systemd-boot or shim some other
> > > boot loader or it could actually be part of the kernel.)  And then,
> > > instead of writing variables directly, we write them to the deferred
> > > list and then update them on reboot (before TXT launch, etc).  [0]
> > > This would be a distincly nontrivial project and would not work for
> > > all configurations.
> > >=20
> > > As a maybe less painful option, we could disable EFI runtime services
> > > but have a root-writable thing in sysfs that (a) turns them back on
> > > but (b) first extends a PCR to say that they're turned back on.
> > >=20
> > > (Or someone could try running runtime services at CPL3...)
> > >=20
> > > [0] I have thought for years that Intel and AMD should do this on
> > > their end, too.  Keep the sensitive part of SMI flash entirely locked
> > > after boot and, instead of using magic SMM stuff to validate that
> > > write attempts have the appropriate permissions and signatures, queue
> > > them up as deferred upates and validate the signatures on the next
> > > boot before locking flash.
> > >=20
> >=20
> > *If* a physical EFI partition exists there is a lot to be said for this=
 approach.
> >=20
> > The only issue with this that I can see is for things like network or C=
D/DVD booting where there isn't necessarily any EFI boot partition, it migh=
t not be writable, or it might not be persistent (e.g. http booting typical=
ly uses a ramdisk, like the old Linux initrd.)
>=20
> Hmm, I guess my approach is a 100% complete nonstarter for installing
> Linux from a CD, and it's really not awesome for installing Linux from
> a USB stick.

Doing any of this on a removable device feels generally like a trap.
You get your USB disk in, try to boot, and it saves vars, but reboot
fails for whatever reason, you plug it in another machine ... and it
tries to "continue" from there? The amount of validation needed and
testing for failure modes across reboots sounds really painful.


--=20
Simo Sorce
Distinguished Engineer
RHEL Crypto Team
Red Hat, Inc

