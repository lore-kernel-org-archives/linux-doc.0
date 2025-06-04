Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFAE149C64
	for <linux-doc@vger.kernel.org>; Wed,  4 Jun 2025 07:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749023277; cv=none; b=oAXKPcrqdERihJU0wFjFXUE7vCVXpCWzepWzCY/28Gd2Zs+JtAlR8GD2D3fSXUfrXEJhY33aX6efdf+NRzSjW+DF51Fbg9V6T32N5EKTjfEnWIZXNbPlH1kWUro0gVOhR9F2plN6XNeVUJfp98jFRdlkoZiXdUVmGx2/audKX/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749023277; c=relaxed/simple;
	bh=t2007AxeJCzN8DYFU1TDmOYxveSLIawRFTPoFEFfSlA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ehNNOSFKfA2taes69He0q1vpis0I7mQsyQ/jfDHpXq1NDcyH5OFk+cHa+17E7tVcqc3nCQSMb/FyB0u6ihlfp9qXJU97LJs+Semc543ANVLrVLBjvrpEGjwybNRehpjGW90HPwbPWl+2v95yKUCJ9Wm0H6E9B/zLZuDds9H9mFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-CpQ8g-iNOpGYCBRPpErmHQ-1; Wed, 04 Jun 2025 03:47:52 -0400
X-MC-Unique: CpQ8g-iNOpGYCBRPpErmHQ-1
X-Mimecast-MFC-AGG-ID: CpQ8g-iNOpGYCBRPpErmHQ_1749023272
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450cb902173so2996125e9.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Jun 2025 00:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023271; x=1749628071;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ygmWQWXbYd84BZ22kC3DM6odLW06NCGE4pAVf3jq5k=;
        b=ZEmnHNskYCliua/yrGtLUD9omxyfLPNZVFyScG+LF4hN6tsakMqJZpG1ioz6qS1Gm4
         Asw7cVCitI5HeoeipE0orUsUkikZWigi23nrOhNKMNABUGVO6RgqSmjY/Rg85YUgSz4e
         ozmPZjGTZQKZUC8nIXpPWzW1Bc1jthrTJmHj3jmfHzFKlfUdXkdcKgJaJure1zdZe0qq
         mjpa9/0Op6+wfquJ/v0uV1GhIK9FcLsRZj/S3g5ZHlEKUatxrlpquR4dc8p21sGMHAF4
         aOKqE2nI3DQwHeBq99a02Lr/OosHzBbXwE39CX4pKH0hYHK7nPKkgHdHac/d7usLmYc3
         OslQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy12njaqmen2hrOICvBpjdyJY72uRObR8kflK02EjZskSw+IsenDiwFBB85kxtRPcu0BdkpSJw+Co=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvNu49XSqOT6h0xBg3xHeaV2RiwRwvMHKGpWRRHw6L+6l/Nk4W
	AJiOZoQ7mNmWvJ9EDRKgH9aiud5QOcRi5MP3IWzCfleIbTLa4K1jZmFFn8oSY1Pcggm5oIjx5Cw
	TjIDmKQlNE0g1riouVylDNJgbqljuVE4z/pfARt6vCEXrXFmEOhp4eyVh0xa5YQ==
X-Gm-Gg: ASbGnctO2wotnT2P+3Go5yGdjumvGsxOQU4BROGrey2O/tur5GGjYQ2pFrg+a9ObMSG
	pnVEab8QE02g8w7unlmInEnh0TsDkzwur+kCzD65CYKDlEOFxK9lk64BYJ0++bAYz0b3h8Wurun
	WIbM5kJo35hdHa4tb3cnffsEHZvJ6KXYEx2kKUkeAjxgnoSgBa/3YHvwmSFV8TD12AgoONEDYgo
	0tvDNnNqQSPmDUp1S22ZaIavKb0wBBwac0qNWCy/JMoegKZ5fP0osUj/qvogb8BFl+K6aDlaWdT
	mY7oQNk=
X-Received: by 2002:a05:600c:4f46:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-451efeb62edmr16204995e9.13.1749023271484;
        Wed, 04 Jun 2025 00:47:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJk55eb8TjJoA47+XoMh9gAce9YiEwRtdQfUP3XiuiMssBNBDp3zfR4HUA5bIORLwXMaPKeQ==
X-Received: by 2002:a05:600c:4f46:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-451efeb62edmr16204515e9.13.1749023270973;
        Wed, 04 Jun 2025 00:47:50 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8000d8csm188712405e9.24.2025.06.04.00.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 00:47:50 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org,
 linux-modules@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>, David
 Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>, Luis
 Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Sami
 Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu
 <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn"
 <serge@hallyn.com>, Peter Jones <pjones@redhat.com>, Robert Holmes
 <robeholmes@gmail.com>, Jeremy Cline <jcline@redhat.com>, Coiby Xu
 <coxu@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH RFC 1/1] module: Make use of platform keyring for module
 signature verify
In-Reply-To: <d34555e2b0c4746fc01d5295959a434befcf8b18.camel@HansenPartnership.com>
References: <20250602132535.897944-1-vkuznets@redhat.com>
 <20250602132535.897944-2-vkuznets@redhat.com>
 <948f5567fe4d9ae39aa2528965f123e42bf82b46.camel@HansenPartnership.com>
 <87r001yzob.fsf@redhat.com>
 <d34555e2b0c4746fc01d5295959a434befcf8b18.camel@HansenPartnership.com>
Date: Wed, 04 Jun 2025 09:47:48 +0200
Message-ID: <8734cgosm3.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

James Bottomley <James.Bottomley@HansenPartnership.com> writes:

> On Tue, 2025-06-03 at 10:52 +0200, Vitaly Kuznetsov wrote:
>> James Bottomley <James.Bottomley@HansenPartnership.com> writes:
> [...]
>> > Also, are you sure a config option is the right thing?=C2=A0 Presumably
>> > Red Hat wants to limit its number of kernels and the design of just
>> > linking the machine keyring (i.e. MoK) was for the use case where
>> > trust is being pivoted away from db by shim, so users don't want to
>> > trust the db keys they don't control.=C2=A0 If the same kernel gets us=
ed
>> > for both situations (trusted and untrusted db) you might want a
>> > runtime means to distinguish them.
>>=20
>> I was not personally involved when RH put the patch downstream (and
>> wasn't very successful in getting the background story) but it
>> doesn't even have an additional Kconfig, e.g.:
>> https://gitlab.com/redhat/centos-stream/src/kernel/centos-stream-10/-/co=
mmit/03d4694fa6511132989bac0da11fa677ea5d29f6
>> so apparently there's no desire to limit anything, basically,
>> .platform is always trusted on Fedora/RHEL systems (for a long time
>> already).
>
> It sounds like that's just distro politics:  RH wants to enable binary
> modules (by allowing them to be signed) but doesn't want to be seen to
> be signing them (so they can't be signed with the embedded RH key) so
> that gamers can have performant graphics drivers and the like.  Thus it
> mixes in the db keyring, which usually contains several Microsoft
> certificates and also one from the ODM manufacturer, so now it can send
> would be shippers of binary modules to those groups to get them signed.
> If you only have the built in and MoK keyrings, the only possible
> signers are either RH or the machine owner ... who isn't a single
> entity to deal with.  Personally I think this is a bit daft: Debian
> manages an out of tree module infrastructure using DKMS and MoK
> signing, so I can't see why RH can't get it to work in the same way.
>

I guess such approach can be used with some limitations: the out-of-tree
module must be open source, the vendor of the module must commit to
fixing (inevitable) module build issues when the distro updates its
kernel and so on. It, however, doesn't help the users which want to
build and sign their own modules themselves.

>> As part of the RFC, I'd like to try to understand under which
>> conditions people may not want to trust 'db'. In the most common use
>> case, 'db' is used to authorize shim and the kernel is signed by a
>> cert from shim's vendor_db, not trusting 'db' for modules after that
>> seems somawhat silly. Maybe we can detect the fact that the user took
>> control over the system with MOK and untrust .platform only then
>> (while trusting it by default)?
>
> Well, I think it's pretty obvious that in a standard secure boot system
> most people wouldn't want either Microsoft or the ODM manufacturer
> being in a position to sign module code for their systems.  Indeed,
> when this was first mooted by Red Hat years ago, I thought Microsoft
> refused to be the CA for our modules anyway.  From a security point of
> view, it's separation of concerns: the standard secure boot database
> guards access to the UEFI boot time before ExitBootServices.  The
> kernel is a completely separate security domain and should be guarded
> by different keys.
>
>> A runtime toggle is not something I thought much about: the sole
>> purpose of this part of 'lockdown' (limitimg unsigned modules load)
>> seems to be to prevent someone who already has 'root' on the system
>> to gain kernel level access to e.g. hide its activities. In case root
>> can decide which keys are trusted, isn't it all in vain?
>
> Not exactly, the purpose of lockdown is to make root less privileged
> than ring 0 (the kernel), so that a user space privilege escalation
> does less damage.  The gold standard for all of this is supposed to be
> to foil an Evil Maid attack (physical access) but I don't think we're
> quite there yet.  From the point of view of the keyrings a lot of
> others (like .ima) have trusted signing requirements meaning root can't
> simply add keys, they have to be signed by keys in the existing trusted
> keyring as well.
>
>>  Or maybe if the toggle is to just trust/not trust .platform (and not
>> e.g. disable signatures verification completely, inject a new
>> key,...) this is acceptable? Another option is to have a kernel
>> command line parameter but this is complicated for users.
>
> I was thinking that if the goal is simply to enable cloud db then the
> toggle could be detecting the presence of the MoK variables.  However,
> if the distro politics thought above is correct, that won't work for
> the RH use case of enabling additional binary modules by getting others
> to sign them.  Until we have UKI signing of the kernel command line,
> it's not such a safe vector to use for switches like this because it
> makes the Evil Maid problem worse (and they're hard for users to manage
> anyway as you say).

(FWIW, RH-signed UKI is already present in RHEL/Fedora/derivatives along
with a set of good known UKI cmdline extentions ('fips=3D1',
'crashkernel=3D...',...) so adding e.g. 'platform_is_trusted=3D1' extension
*is* possible).

So if we consider trusting/not trusing platform to be a distro choice
("politics"), then I guess the suggested Kconfig approach may make
sense? I, however, quite like the idea to complement it with an
automatic toggle based on the MOK status: we can make the Kconfig a
tristate:
- Platform is never trusted (current approach)
- Platform is always trusted
- Platform is trused when MOK is not used
To me, this third option makes sense: if a user wants to take ownership
over the system, they can use MOK and sign the kernel itself and/or
out-of-tree modules with it. If the user doesn't care, then there's no
reason to not trust 'db'.

--=20
Vitaly

