Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922F8246788
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 06:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757486426; cv=none; b=oAzhuN6CpPCO1aaHeWqDFGTgVZxAa9h3YbjoY2ruYFBI4eyxpSCeD/AcXTrxZ9I5odJunR5vxijAftYX6PKdWvDzwGBBQKTOKIto7iimHEsjfRRpto37kLwdjR4gNp+mxBSxi/licZfk0/1nkVRhUp3VEVwiZig+/H/5KYq1CmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757486426; c=relaxed/simple;
	bh=hf11k3OBssHbcr2V1ojQSrD4Nw0awIhkcyvrlBqe8HY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BUo+bajBx/1oyP3aR/4Y0R5hXxizEu56RqJVjgEfYFnUQzTwF6B0gsi/p+aGGNDHcpyFg/Zvb7gxZS9l/gK8eFk8kP4BpcH3ydiYw2c372TCqiU47OBwCa7LBZ3rTZJ3T74QAs7zYamgO7VQM+LxKMTZPvhIo1d6+R7W3RvOl0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDhWDgiV; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDhWDgiV"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6228de28242so426921a12.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Sep 2025 23:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757486423; x=1758091223; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hf11k3OBssHbcr2V1ojQSrD4Nw0awIhkcyvrlBqe8HY=;
        b=DDhWDgiVkYO9f68Ri4O43kvkHLDXZjONnhJprmk51LgPvN3/Y9tTj4pSDAMWlNZzLT
         XXD/0MJh62GLqWDc89Q9WWjyx6M6DznpxV/Ih0IMhjYYc+RsJgT9DQ0mErSy27JYgUOq
         Q9gWjq5An6e9XRbSQk1IwvD8l9umVv42uyUufxynkkpzqWl8jE3RRk5ejA2P4PHYWIIe
         RmTw4TOK+TeTMb4BNHWQf7M7mSOquAeEbJpKAZvW9mhbJ0ONwmhFE89IJuBAz4VrPbNW
         ISaIzuKOVu0Zjfh2sFm0hsjfGVLsGbCX2xHVYHmFmBpaePpaHi4GPIvNxE3Louj2Ph+A
         62sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757486423; x=1758091223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hf11k3OBssHbcr2V1ojQSrD4Nw0awIhkcyvrlBqe8HY=;
        b=ITDiUeVGNzi2Tn79QqI3Mj/L3Ks0XDYACHZbWWaConMN264lCDBkEOEpPGogyAd4sw
         Md8ZjDeKfVZhTrFdKflY70ZDEJdE1kWISmXbO6A08XLRbyazvvRvG/dYxnIGAxCqjceU
         KrEgPjemTBvX6BRl3p3YQfbPL7gXTAGj6zOAGpoiUvlmNEz9RzqRN/H4tgxIDG1y0xcm
         p1EPNapn9keUFhaqB/J4N0j2+yHhUgmQVCLDC9vclFTQCxrO3rW6MlxUVh6Gxn6ruELZ
         gl8JqdS4MwquYkZMOi/ePni9Y1yp3tP1Sg4P66o97hkMy+N742DHOK+22UfvrDF4QBbO
         n/Ww==
X-Gm-Message-State: AOJu0YyV+aMOWpQfO/EwXPUhzG8ARmFR1ntuF7hRTp+jmGwCFHjD94iz
	znMVvVzVtAfIlkFgYEwB74gFWIJIMDl/eSoG6pEOlSFym/O2A5+B86FNT6sBDPUvmRdeQXqB7lm
	Lyv99+FQLIKDOC7TeH5C4cVdCqaUNOYZSlimsCxJ8Lw==
X-Gm-Gg: ASbGncsEjpulbdBosT2sA0bR/JQ72E79teJMv1/vEyVZGwJiBfuL/nHHk11oyMoL+Tv
	NsjxxUKNY2+0yZePTapSjKEv3enRFj3cqAbvyjWY+HBR+P8DPkzYpRH3fF3+fsWkm6xvjZkA3z2
	f0zuCmCmLAP+hNPkgT+VPKgPqJuAnbrvMRPNLEg7BYIYzDo/3bRWJxXzQATrqcWjZ0IxA01iBh2
	2Ujm5uKn8KF9t9j+FhQbaakvkEMCMW+ZxWwztzLj6mTBknSCMgKI0H9QkWbHcsO9dR/9fYbudg=
X-Google-Smtp-Source: AGHT+IFKb1oYZ+ybP2RYFHNiIG+Ja5VxfDg5EssCfKi2oQI3t1Ux4fscelrcRXOuTEoVtY6GHAJGAinzcJNGWxPwLOE=
X-Received: by 2002:a50:d4d2:0:b0:62d:411c:f6ab with SMTP id
 4fb4d7f45d1cf-62d411cfa14mr835834a12.15.1757486422773; Tue, 09 Sep 2025
 23:40:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALMA0xbOLkE8kUwrZA3FY=EFfV9ZCBdbFW5BTLbPM99E9TP+ng@mail.gmail.com>
 <87a53cx4r0.fsf@trenco.lwn.net> <CALMA0xYMNcD8UN5ykJALMskFGnNaau3cxJ1E5=bDE_mGS+bZBQ@mail.gmail.com>
 <87plbzv2x8.fsf@trenco.lwn.net>
In-Reply-To: <87plbzv2x8.fsf@trenco.lwn.net>
From: Zhixu Liu <zhixu.liu@gmail.com>
Date: Wed, 10 Sep 2025 14:39:46 +0800
X-Gm-Features: AS18NWCpcoafUhcfTXSJXIrsp_IEqWKbztP-kSB_re6dGs_rvXvXxn6nZOXlQZY
Message-ID: <CALMA0xaRpHXbpfQV3bFLgyhG+usg2c72ddPpYD5JU9r1AV=rZQ@mail.gmail.com>
Subject: Re: [PATCH v2] docs: sphinx: handle removal of utils.error_reporting
 in docutils 0.22
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 3:31=E2=80=AFAM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> (Incidentally, Sphinx has not caught up with this change, so how did you
> test your change?)

I see this problem on gentoo, someone else report it at
https://bugs.gentoo.org/962349 later.

Your patch is fine, I don't know (or didn't check) that we can remove
support for python <3.6.

Thanks.
--=20
Z. Liu
