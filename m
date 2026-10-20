Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.62.234.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533199;
	b=Z6RAkSp81z4jz03zAHAFAAaDcolOHhEjnNSMG/BHaj4BDviufvkr9A3QtEfLzn7EbY/m
	 ttJPxBB+3v5HKYX4PecO5brOeCHbwCQiyjl+MAFt1W74X473HuP02s/fC3vTuXi6nGzwn
	 qF+dih/wGcw2NQlVgIGQ6c+uJ997ixFHPx7gW3zrBxLwIDMn5C7MLndv5K61thFMljhVc
	 fVAx/7VT0cSP+51YSOXSTPNeYabMWx7gQh4vYfR3AqmnQ6TCUFTZ6odxW6fAt/WrEIS9d
	 49ekdnn159d5MDRiGOmBLyVAEzauIINhx6qH046oURFihPyrYV3Wzc68EgTm3W1KqZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533199;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding:X-PPP-Message-ID:X-PPP-Vhost:
	 X-Virus-Scanned:X-Virus-Status;
	bh=Q36YX3yioX5PhNiWAlX2IMcnnOhUaYruhBYCSPIOZgE=;
	b=Y9UuTIjUXnR/huwy55g4i2XtQ/BxLOvSKBRpN6tQZFdtyJYLuNd98bXVsuh0Tto01Zqk
	 3fJ5oJv3i6Hl42iO7ybd9zR6Kfy0iRxp9WfGUJ5iZSkfWCkr9o3J3mBotQF97XnKdq1Jf
	 aUBRwzzVBRWD3rCjWzP0h/gOYTDxgQVk8LPXtvst+iFUX/PccSrdjFKOUT0Vw6d8VWAjt
	 yUzG+V2JPWu+9hL1+Q40AMxrzwYJG9L7chU7IlA9ctWIBU+/2ogiZ3emcH/zCwhPj85x7
	 JFi9mOg8goak66BZAKb+IhWYJhYZU1Y1bWq1l5OvO04uBHkUOp+q9dB1CVUfprcrNpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=Gc2nMWGp;
	arc=none smtp.remote-ip=46.62.234.254
Received: from relay15.grserver.gr (relay15.grserver.gr [46.62.234.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73142606A31C
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 21:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73142606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=Gc2nMWGp
Received: from relay15 (localhost [127.0.0.1])
	by relay15.grserver.gr (Proxmox) with ESMTP id E09CB3EAE4
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 21:53:09 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay15.grserver.gr (Proxmox) with ESMTPS id 8498A3EE05
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 21:53:08 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 7AA1C1FF9F6
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 00:53:07 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1792533187;
	bh=Q36YX3yioX5PhNiWAlX2IMcnnOhUaYruhBYCSPIOZgE=;
	h=Received:From:Subject:To;
	b=Gc2nMWGpohOVyyFBUXHCGXMc2z1W3QJ3yQ36XWYUvL3sgkFpXKXqdCdTNvQDUBnqE
	 0NzThRcsIinntxtNiLPB7uQ6W5dNQmDcdCqfyE9VGj26P7nlQlc828vda2a3uRAwRA
	 z0s1r8BXJidl6Iux4el3C/7xD1iSNpfA7JYqBmktgW40f0lnT6O7ITXsWWZOc1SVqH
	 D1VotD23e9pdu+nydtfBbVoJyHZ1IFpY4YyuCKxRdN61hSpY32coANsLe7xGuOIuAI
	 46n4xnDS1VaLTouNJ84SoS1Jbb9Kp3tVzs0C0+uTIos7QDW0+i7PkkwHaftcR89OFP
	 T771WtUtmCu/A==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.177) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f177.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2e987b4a710so5947445ad.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 14:53:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBxBLk+/IkUNS5F3IqvDSgne7ZKGCz5Sn3JjOOg3y0CWcTsytadRzaLGCC8sRqCp7ZVfdy8Jquo69lw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzIYmxTNAGk65TyCmVzLTnBPwbs9tcbV2NwquN5OIf9Fny2zjx
	zEfWPYWeKb4wB64cxU9W6wKd4nnvPK25pk3X8OC02jmR6oUsYaEWg/HCxZNB4+fVBVGUVBgaxFr
	e5rH88i8LKPJC3fXyT7zZYjvK+tTIlZo=
X-Received: by 2002:a17:902:e548:b0:2e9:4f49:111c with SMTP id
 d9443c01a7336-2ea1dd04761mr22807325ad.27.1792533185889; Tue, 20 Oct 2026
 14:53:05 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260803221614.59324-1-derekjohn.clark@gmail.com>
 <20260803221614.59324-2-derekjohn.clark@gmail.com>
 <f8b2c85a-2800-c9a3-4e56-7af4c53823e5@linux.intel.com>
 <58a9c644-98c2-47ee-b083-0d5b19fa5053@roeck-us.net>
 <CAGwozwGdwhE6Sm6oa2uxx_sHfFNQ6fHYnAhYHkEPQcp_Yb=Z6w@mail.gmail.com>
In-Reply-To: 
 <CAGwozwGdwhE6Sm6oa2uxx_sHfFNQ6fHYnAhYHkEPQcp_Yb=Z6w@mail.gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 20 Oct 2026 23:52:53 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwFUTagam+dr0SXyziAMz1MJKcYMYUgrogFcmvEaE1X0UQ@mail.gmail.com>
X-Gm-Features: AclHuK9jLmnj5XD9NNmx0ULw93cvry9tRRHsfv7i6vb3Lkle29Ysvo4RB4szGUU
Message-ID: 
 <CAGwozwFUTagam+dr0SXyziAMz1MJKcYMYUgrogFcmvEaE1X0UQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] platform/x86: msi-wmi-platform: Move guard out of
 switch in platform_write()
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>, W_Armin@gmx.de, corbet@lwn.net,
	jdelvare@suse.com, kuurtb@gmail.com, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <179253318779.1186827.16011814333504729687@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 18 Aug 2026 at 17:26, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> On Tue, 18 Aug 2026 at 16:42, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > On 8/18/26 07:12, Ilpo J=C3=A4rvinen wrote:
> > > On Mon, 3 Aug 2026, Derek J. Clark wrote:
> > >
> > >> The ML patch set uses a guard within a switch case that violates cle=
anup
> > >> rules. Move the guard outside the switch so all return paths are cov=
ered.
> > >>
> > >> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > >> ---
> > >>   drivers/platform/x86/msi-wmi-platform.c | 2 +-
> > >>   1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platf=
orm/x86/msi-wmi-platform.c
> > >> index dfb65ac8fbf6..33acd448f674 100644
> > >> --- a/drivers/platform/x86/msi-wmi-platform.c
> > >> +++ b/drivers/platform/x86/msi-wmi-platform.c
> > >> @@ -675,11 +675,11 @@ static int msi_wmi_platform_write(struct devic=
e *dev, enum hwmon_sensor_types ty
> > >>      u8 buffer[32] =3D { };
> > >>      int ret;
> > >>
> > >> +    guard(mutex)(&data->wmi_lock);
> > >>      switch (type) {
> > >>      case hwmon_pwm:
> > >>              switch (attr) {
> > >>              case hwmon_pwm_enable:
> > >> -                    guard(mutex)(&data->wmi_lock);
> > >
> > > While I cannot see the code easily, one could also add braces to insi=
de
> > > the case to avoid this problem.
> > >
> >
> > I don't see the code either, but wouldn't this be a use case for
> > scoped_guard() ?
>
> Hi, not explicitly stated in the cover letter, but this is essentially
> a series on top of the series I sent last year but I did not clean up
> due to a variety of issues with MSI firmware that would have made the
> driver unsuitable for upstreaming (to my standards at least). These
> issues span Intel driver problems, HID controller instability, and
> varying WMI implementations esp. in regards to PLx setting between AMD
> / Intel variants, shift mode behavior not acting correctly, and fan
> curve application / resetting being weird (the fan curve on off bit
> does not seem to change whether an automatic curve is used but how
> close the device alings to the set curve? requiring us to back up and
> restore the original curve? half of the devices keep the curve during
> sleep and half don't? but if the fan curve is so finicky do we really
> want a resume handler for it? Perhaps we can kick the timing quirks to
> userspace)
>
> For this reason, I focused on other manufacturers such as Ayaneo and
> OneXPlayer. I will revisit this series per request from Derek as he
> seems to want this for steamos and hid-msi is already queued for 7.3?
> Although, to be honest, compared to the controller firmware issues,
> the WMI implementation is pristine.
>
> So I will need to go through these issues 1 by 1 and see which can be
> fixed and either drop certain features in the beginning.
>
> Particularly for the fan curves, if we say that resume handlers are
> required to be in the kernel moving forward, I do not know how
> realistic it is to make those reliable for this WMI device family.

This driver still needs work. I am getting bug reports about
inconsistent TDP application on the EX. A8 is broken as well. Even
with your patches Derek. I need to grab a new version of center M and
see what they are doing.

Does this driver work in your experience? What is that SMT toggle you added

Antheas

> Best,
> Antheas
>
>
> > Guenter
> >
> > >>
> > >>                      buffer[0] =3D MSI_PLATFORM_AP_SUBFEATURE_FAN_MO=
DE;
> > >>                      ret =3D msi_wmi_platform_query_unlocked(
> > >>
> > >
> >
> >

