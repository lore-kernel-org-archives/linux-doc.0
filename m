Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA5D2737E0
	for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 19:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769627129; cv=none; b=FMwf3Ycqf8X+TWy2BTKGrEG89Y0E7K8FALSRqIJN7YV+VTklZq1GD3YqH71JjIwHXgJRMXg5nsuvQnBOQCZNiv2hwiTdJXtLzxNh3aoi8M6hn0K9AZ1MKQTvUiWWA2mK+L/Uivdr1tyt6mPsZ8k7GY56/x0nVJn2ldQUbm48PT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769627129; c=relaxed/simple;
	bh=HHUFN5MQ+j9kptAJiCh2rv+ffNUWwtnq5vUMbxhX+vo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GkZ4AyrtD8rSGPugymDz2QQL/EpGAJ+aBaa6XvDEeGMG1urqt1SmB1GaRS+e3KDsscC7G6jjm6suDL10uMsTfV3IzGdxo3Lp+TpBMDe16brlNhp9yFlCL3CgFkfGqCCjFym9Y+JJ8U5Zzgt370YcMtugMBzy/fvCAqogf2WDyvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com; spf=pass smtp.mailfrom=mihalicyn.com; dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b=eff8kwSl; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b="eff8kwSl"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fbc305914so224170f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 11:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1769627126; x=1770231926; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HHUFN5MQ+j9kptAJiCh2rv+ffNUWwtnq5vUMbxhX+vo=;
        b=eff8kwSlilBNPwGTkNZWXhMmbfXHkSGUcbO5tlSUqZGIrnVmeqQNLiv32f4qjNnXR9
         T85y3iqSiAIgGxr8skqAiv3CdavmPHcsu1WULTRs78vpzJqH3rbrYqvj8EeFcNfUFNJe
         uNsTmIgRrDkXtzDXqJGAZhm4FfQR0amyC0+D0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769627126; x=1770231926;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HHUFN5MQ+j9kptAJiCh2rv+ffNUWwtnq5vUMbxhX+vo=;
        b=QyWHsBaoQvIuRd2zY04NRcdWTTrDFyuhk2WKcyIM1ngMy4RpWkVK/GkiHDTp+0Lat4
         I3aAVSW7nzSvCLmkB3cf9QbrSmchKPUcAasy7yP8HRofbEUXSfRMzubU7w+RRAP2p6Yd
         qyU0FaQb7pl9HcOleuVq9MohFMaQNX53qLO0nExiK32S8aKr0l+MER5UfImKbr+u7eTw
         acaRLogv8lZ3OPbciDe9+PxZX4OajMwPP5sdJ1+5mJeLbFXcLv6nEJ0PZ5kMWmS8DaSK
         OlFiJdGPPud4rQRapkDCdgW5C6EPzEpfM1DKIVKu1SowYrru+wBDUemECnSS/ADMQxWP
         dE3w==
X-Forwarded-Encrypted: i=1; AJvYcCWey2yZ7FfsXfhlKxZe6hqOG0Yw3z2lZu0UZFjEZgioe8fWcAblVShRzM1ORN8V2bcTSNI9B9p2Bl8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxju3+lEW9VU+gmOCPbwsZW1fV8M9z4hGjbvfsYCUVMA3JyV77Q
	q7RMHeqMQPeVddGZI5sgqMmmdgObuyYDEJIe/MWnXtgjEJCeZNWDLQIYIM/pSu8PvLE=
X-Gm-Gg: AZuq6aJivx7KvnR9E+MjSOf6axPH+Si7YGQ6QzNCVXF5sx1/2Qlw806tkfAXqfptfLH
	xt/88XGivI1oSoaZiBL5UiLgB3oAC3ZXVZry32Kv3u1JHgGePu8xfQHHKoWAE1FXN0+58pfw83/
	jpHt0gWGr2hr6/KxYRYCcrv8IRqdbbq2wPgx/P+lx+338eIjD/Hw+waArMFJTmDvHDgvSQZ7oUF
	yqEHiew5MMBJR9zD9Yfer2gp461Qu0b7t5VM5S3WbsBF090JBuTF2SY2GQ+mQXwJhOXiGTTcSDD
	DxsF8BcZNBroFkvErKraAfE0Kt88FAC2ZpzQh0M6FV7N1qRuLXKeKaGmIE8UwC5Ie7S/RguGlaI
	pgrBHb4LxItFbfOmlkR0HK0Zv2l5Q7qYEbiVR/WMBjKYpGEY8cyykKy44CgJ5ROS4NNRRLuS7OW
	6M41tnTJ3x/YOoijssbgGY3ZIULKbi9cyKbLK12KNC2csitlhCAWEiKeOT1EZDxBzPz9EvFRG47
	h6+sjLajjAxr2jqDdegaR3bbHGaq7VSRJMJCf3MF2C4xGZUgQ==
X-Received: by 2002:a05:6000:2c08:b0:431:32f:3140 with SMTP id ffacd0b85a97d-435dd02be47mr9465896f8f.12.1769627126523;
        Wed, 28 Jan 2026 11:05:26 -0800 (PST)
Received: from ?IPv6:2003:cf:574b:cf00:f62e:8cab:c07c:593e? (p200300cf574bcf00f62e8cabc07c593e.dip0.t-ipconnect.de. [2003:cf:574b:cf00:f62e:8cab:c07c:593e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e46cesm8825497f8f.7.2026.01.28.11.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 11:05:26 -0800 (PST)
Message-ID: <a54303d478e4492977f8760b0f2d22894bfe604a.camel@mihalicyn.com>
Subject: Re: [PATCH v3 4/7] seccomp: mark first listener in the tree
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
To: Aleksa Sarai <cyphar@cyphar.com>, Alexander Mikhalitsyn
	 <alexander@mihalicyn.com>
Cc: kees@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,  Andy Lutomirski <luto@amacapital.net>, Will
 Drewry <wad@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan	
 <shuah@kernel.org>, Tycho Andersen <tycho@tycho.pizza>, Andrei Vagin	
 <avagin@gmail.com>, Christian Brauner <brauner@kernel.org>, 
 =?ISO-8859-1?Q?St=E9phane?= Graber	 <stgraber@stgraber.org>
Date: Wed, 28 Jan 2026 20:05:25 +0100
In-Reply-To: <2026-01-21-hectic-wriggly-dips-flags-EE541h@cyphar.com>
References: <20251211124614.161900-1-aleksandr.mikhalitsyn@canonical.com>
	 <20251211124614.161900-5-aleksandr.mikhalitsyn@canonical.com>
	 <2026-01-21-hectic-wriggly-dips-flags-EE541h@cyphar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-01-21 at 13:22 +0100, Aleksa Sarai wrote:
> On 2025-12-11, Alexander Mikhalitsyn
> <aleksandr.mikhalitsyn@canonical.com> wrote:
> > Let's note if listener was a first one installed in the seccomp
> > filters tree. We will need this information to retain old
> > quirk behavior (as before seccomp nesting introduced).
> >=20
> > Also, rename has_duplicate_listener() to
> > check_duplicate_listener(),
> > cause now this function is not read-only, but also modifies a state
> > of a new_child seccomp_filter.
> >=20
> > No functional change intended at this point.
>=20
> Ah sorry, I didn't notice the date of the mails -- this was sent
> before
> the LPC discussion! I'll wait for the v4 before reviewing further.

Hi Aleksa,

Yeah, I'm thinking about preparing a separate patches to address
a quirky seccomp behavior we discussed during LPC and then resend this
series.

Kind regards,
Alex
