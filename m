Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025F13E316E
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 13:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778765724; cv=pass; b=siPhtgR718gpnjRGEHPVEAGWhUvBOYh/A6BFq53QhZ4csE8MdxtvFhmzFPwizzsVEBVuWCjGAbgZ8eehVbLEZRLalSaWBW1V6JGGg/OvxqRyqVMstdR9m/c9IwtLjRVdQ9PYHgYSAYm84iLVmWutA5Xlh067kU5z0Y4iarzQIHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778765724; c=relaxed/simple;
	bh=jfTb2qsWK506XAoCkoP52xxUlxrTeM08aZ0+VWQpZ84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHTNdoGzge2qxzCcqLNocozwW8xXazvKv3aPOG0zU9Kq2+LBB14DhzVr5X74dGlzEF4n1Q+bpqvpdXw1eSjPN7b6s2rDAV2rY8hEhdaqdxGooAyxnDhHvAn7bsj4C5c7lGc8/VFKmpOMJ6X7tPoB+d+JCdmx18FYn5dvJKov75Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p0MHHCn/; arc=pass smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p0MHHCn/"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4358c2cfde2so183477fac.2
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 06:35:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778765721; cv=none;
        d=google.com; s=arc-20240605;
        b=gKK9z/B90W8/HRfCrMWxKJTOzXAtNa/73nFbCNBdZNpsykEeIttsMiy999Az8+XYVo
         OvcI22cl8reeinVL4RR7mI6NygX7gkZevByFC4hWefamNygr0++E/v/v9HZOT14UyQqt
         gdQuRJPoADQzWQivynfna1tjHE/gSWaNK89Cp/dc2nG3R30A6eOqGpaDeh32KITMcmk8
         wu3H63Y7gE0ixYpuC7rofsWMarlbQbqTD2Sd1wr/amYYAHS1FBVExIPXEiu9tb3Po0FK
         FFw3sra47jEMFGBMgM+wkSOu7nmPkyMnTTmbCoqF+MfC6tCNKyBr8JEzA11SMHryaMDy
         X4Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fn96RXsZUp/bi1JJtkbYJsUUPos4PtLjLm4eTILDm5Q=;
        fh=jANY7k0ArlbgLfIZpWCwY9fHCqVcXM4DkyqV3Vt6KME=;
        b=B1efGyYQOXB0Xi/yS7S4EmeYIKBLlKOflf5/ve9ftI5kGy72xV6JoXoEkR48gWy95Y
         OFw5XSKcsF+YySYTchs34nVhUXYjRkb1/qCcZn+foegAT+vVHSdd1w2DGlShQoY0D+dS
         Vw2P/wG50mCpd/1V24a4xiJZsukcD8Z7z3qrlRhSeJBdiIY8h2ntpOqgkoTH/k0wCh+i
         oMldgK/a6mVjCTwJSOkJo43iSmDY7Ic2Cv+E3zByBrlkx4v8OFzDksfqKv7uVSOyHc4l
         EhsogRPRg7EUsH4LGPieYqStaI9V+B+WgM2xcR/pCVU8Sqk2cTB78heoVGFWtDZ7zh91
         YE2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778765721; x=1779370521; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fn96RXsZUp/bi1JJtkbYJsUUPos4PtLjLm4eTILDm5Q=;
        b=p0MHHCn/AZg0dSujaUV6gAjFU+d7Kd1DDLlk6VOVpxmmViXoHojKqHYjud5hsPruN/
         ZZJSs3QGf5lFzuu52J4aszYmRGYhHNoM1bjnVZTmBvoimTeZbAIKff22PULskPWIwikm
         VZc8cdF0YBbS/VDDmrM9e2aPXGAklAM1dsIE/A5hjFw6M+Fs86lQXYfBhxchLkMe9kCr
         lVcuysYSu+MZja28G2jFOUn2VJq+gizboZvtp8hm92vuoTSuKe+3C9PPNVR+Q+M/nTsi
         P8HQCRu06M6YRADWxilK67YIQM+SY3WF3Thvw2LBhMx0RWKXLDt4ohd9EXi38oxVHA6Z
         jKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778765721; x=1779370521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fn96RXsZUp/bi1JJtkbYJsUUPos4PtLjLm4eTILDm5Q=;
        b=Oq+IvAnTAPpINiXa+u/4/5vZlkwWqPmpX9GjSqokfVLPVubNQZWZU2qNtKN4Hso6e1
         Aq1JrTqFLT5BtcDz431LKIQDoY71UJx9lz2CiKjexKZNfTFmCNJWX28aEf56zVeuvVbA
         hk6i2Py++r0rTV+QYS+EIdqLjOLxhzQFqJyLRFn8orIgxdOn3++3zU22De8L2u1G9TLG
         vTu2TTo/43YdiPd6lNOVby83rkdupEfEis8nSGQUXkDjnpby2qmuxCYAgyzWzJ4tTaDN
         iPgWuFo50ZxyHR3FeaES5I8/IHg6xUWQBGYNoICwSH03f0W8FwvHCmUSBOCWTgsdkq5I
         UKCQ==
X-Forwarded-Encrypted: i=1; AFNElJ9sDWSswKslhclYqMiDhm5j+LgNS+MSAMWO7qG5HNW5SP0d4kaKF0HoiA4Bgl1NYjsl+8WGvGptLmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbhAKXKMNpk7TepKNBF8nW9AfXv45d/iFeKR/Ion+g8iUMij3d
	Enu5EMmOEnBB/2yvp1wcFs3AuyMtW6TxWfsTo1SF7WRoWHOMinfUnaiX7MO4NR6COqzNJWigjWk
	a6nStDnjFHYNF7WEbmB5KeZf+lwErFHU=
X-Gm-Gg: Acq92OGjsl4f2OtrwlS9PQJixS0ETMgRNCvf9rv68yb+Jht0RKBaq+z1u5I9aMEf+5X
	YY6mV8/1D5sotMoyb0IUvUaZkhLEQXJNmb1TBGL64yeaX0N0tMvcBZCBlAOK6SK4U0pT2iBpHM1
	B8I2XGiPDA4YzEonvcwzlx/KqA57le/K0x7qM/GbvfaDQ6NYgFwbVKUdklp33Hr58pvu+Ndq0Cj
	rtPDubA0JB4g/l+hipXV6bpwHL3xRF9m7rfeoX15u/MYZok3c3yBFA7+rC9AhosmpwzGVc2Mwfu
	ZWc4UtLhv6s3rR08yDw=
X-Received: by 2002:a05:6808:3096:b0:479:fca7:4655 with SMTP id
 5614622812f47-482b2d709a4mr2750387b6e.6.1778765720618; Thu, 14 May 2026
 06:35:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514094955.76305-1-jianlv@ebay.com> <2026051443-exuberant-important-534f@gregkh>
In-Reply-To: <2026051443-exuberant-important-534f@gregkh>
From: Jianlin Lv <iecedge@gmail.com>
Date: Thu, 14 May 2026 21:35:08 +0800
X-Gm-Features: AVHnY4JpJ8WSGm574XlaZCuvUqTaRt41BFmoX4Xd01QZiwb3yvnh1k7vHB-QaDk
Message-ID: <CAFA-uR93Wf2ALpYnnU79kruv7XO=uFePqioaEXNNEfrUtRw2xQ@mail.gmail.com>
Subject: Re: [PATCH] driver core: Add cmdline option to force probe type
To: Greg KH <gregkh@linuxfoundation.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rafael@kernel.org, 
	dakr@kernel.org, jianlv@ebay.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 6:16=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, May 14, 2026 at 05:49:55PM +0800, Jianlin Lv wrote:
> > From: Jianlin Lv <iecedge@gmail.com>
> >
> > Device drivers that use asynchronous probing can cause non-deterministi=
c
> > device ordering and naming across reboots. A typical example is storage
> > drivers (like sd/nvme): asynchronous probing can lead to inconsistent d=
isk
> > logical names after reboot. In scenarios where disk naming consistency =
is
> > critical, the probe type should be set to synchronous.
> >
> > This patch introduces a driver_probe kernel parameter that overrides an=
y
> > driver's hard-coded probe type settings and allows runtime control with=
out
> > requiring kernel recompilation:
> >
> >   driver_probe=3DPROBE_TYPE_SYNC,nvme,sd      # Force specific drivers =
sync
> >   driver_probe=3DPROBE_TYPE_ASYNC,*,usb       # Force all async except =
usb
> >   driver_probe=3DPROBE_TYPE_SYNC,*            # Force all drivers synch=
ronous
> >
> > The implementation replaces the limited driver_async_probe parameter wi=
th
> > a more flexible interface that can force either synchronous or asynchro=
nous
> > probing as needed.
> >
> > Signed-off-by: Jianlin Lv <iecedge@gmail.com>
> > ---
> >  .../admin-guide/kernel-parameters.txt         | 27 +++++--
> >  drivers/base/dd.c                             | 71 ++++++++++++++-----
> >  2 files changed, 74 insertions(+), 24 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Document=
ation/admin-guide/kernel-parameters.txt
> > index 4d0f545fb3ec..b43a8bd20356 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -1377,12 +1377,27 @@ Kernel parameters
> >                       it becomes active and is searched during signatur=
e
> >                       verification.
> >
> > -     driver_async_probe=3D  [KNL]
> > -                     List of driver names to be probed asynchronously.=
 *
> > -                     matches with all driver names. If * is specified,=
 the
> > -                     rest of the listed driver names are those that wi=
ll NOT
> > -                     match the *.
> > -                     Format: <driver_name1>,<driver_name2>...
>
> You can not remove an existing user/kernel api, sorry, that is not
> allowed as you just broke all systems that were relying on this :(
>
Could you provide more suggestions on how to improve this patch?
If extend driver_async_probe to implement a 'force synchronous probe'
feature, that doesn=E2=80=99t really match the name driver_async_probe and
may feel ambiguous.
If  add a new 'driver_probe' parameter while keeping driver_async_probe,
then their functionality would partially overlap.

Regards,
Jianlin

> thanks,
>
> greg k-h
