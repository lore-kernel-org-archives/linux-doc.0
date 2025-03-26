Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3504086A
	for <linux-doc@vger.kernel.org>; Wed, 26 Mar 2025 01:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742954307; cv=none; b=XhqQ/97tEAdsFtp+k8y+DCzAu9j3ge1X9l76gbqm25sHg1hB+hbNV8kBJG5a3txxRGbqy382xwmR0wpyz9VUbbBKVGLaiPO95wHUMv/KxiccIkF7XHG1MHo+lD2YV5mifwC9PeVzWBKL6DNta8LFGtrvNhfD9d2ILDHSXslWjb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742954307; c=relaxed/simple;
	bh=0aLnimB4ySLBG7mQRswkcTNo6b7RL/ZMJ/w4Acp4Ugk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBnpk7jZEgO262CVf+cHDheC4MjwjrjftDoaZ8+50yD3YWQd0Nm7lXaMxL8tMRgpEAYz5rr2KR5tPKomcZUtImXi8ugTwFo/n4Ya36fwkO67D+YawR1xd79tUpDB1fyaPfEvR0cJ+Fl4dABC519IiG011mh5meFKF4vx0o9KDs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0e5Y+Do; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0e5Y+Do"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ff694d2d4dso10371467a91.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Mar 2025 18:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742954305; x=1743559105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AeXFszc7HISwc/6qx4eotMeyW2rrTjB9ur7q0g6J/Ko=;
        b=Q0e5Y+DoNtbeyTOeje8oEEvQU3VxVMvDd6t+4mxG0YeBFJWbsEpZKtpq5O2UrUmQiO
         69Vykj5PgRz0j4SUj0nd9nvihmJ+fvbFFH2eTQ4+cjdoTUZ7d7xUyijMMBO0in9+ocFz
         zcsBhJ+QL6hL06cacC1Kq+iQtWZwjgtvNOftT4+rEbgcohw6dRfE6yv079s6+CJLhRXD
         ec1nWrpURPL0VRjDj08moYYTK2lsjkvpklOH1NdY/Z42sINV7GK1L3u5icb2rXeZZFZy
         n+uM32bIxvc0sYLkOiq/R2YkV5JGjIfeOEzJu1rcix95bO71Bm62kcGnV9m8mnfubMBw
         aSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742954305; x=1743559105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AeXFszc7HISwc/6qx4eotMeyW2rrTjB9ur7q0g6J/Ko=;
        b=uu45o1WOJy8Ea76x4KOpBvqbJqwpcBsfTxYpQX+BewtEnkSt78aRs10OfYnPuLFsvD
         o5Fj4G8MAuqqNPOdraB9Kc1gRb/krsg9lxinBy2gpAnSLNWcrRYZNymRc2Y8anW8gZOM
         UKRggWr/QqeThOWuMiMJklOHH270fW9gpGQIApxqXGWiTZ2OEcbNS4bbdyml036doVRm
         n62U9QpmcIYWCZHhivkXOIDNAVHNHoXtznoTBDiqh+NQoSvJDRZ5YEMpvLuw0CPH7eWS
         MmNEgMO3mIj665LklpiHvS4erspG8T2Xcqg8x/DHLdIaKWami0bxJLI3AL8OlnBSWpwM
         17Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUg2sbxCknAn7jDnHjBfNzmsOhjZYvqQnsjAcwpb3uwBy31ia24GonCYojof1n9wzweSBpcQqfGLpc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2jOWf+9A2zt3DlC3v8yGiZepew0uRhSzaK9sx3PJBgPPpZVGE
	N5dIP/AjNLTQEIet5b8ulBcf1VLFrNXc2s/5quEPxbzO5eXqZS72
X-Gm-Gg: ASbGncuDakJLLyX6OiKDgnefBol6btJRb6VlWccDjRuu9AFvxo4NDhpObfoE2F2gkkN
	w/IUNGEh1ZMaWNfd6JQ0bWiT2X7iyrPjZ+L1L4ymu/Jo5Npw+pZ75NrP6bqQSrhxQvsSa13z1Sg
	RMjHxaqmX/RvasqLUa75hsFs0iwzxFlKTNIQiLczhWYPtiY2LUmElozupuUlI8uGQz0ZDh9LCRv
	sIKVep864zcHyCn6qayDJlYxPZjMAQpzZcFfVJz6MyPC5JFtNoR4O4/wnkQWQSiqAR4H/DOissc
	P5HMzey1kYa6oon/gSI9qd1hpZL20H9xLvQPeWoNSX1a
X-Google-Smtp-Source: AGHT+IFQmS5IKC7gUJXuWGe/8tEO3Kw/TUAAHpJS3gqgq+OXBI+mLKukwUA6BCV1ZiMphA4EHjNxPQ==
X-Received: by 2002:a17:90b:1c0d:b0:2ee:f076:20f1 with SMTP id 98e67ed59e1d1-3030fb216b9mr36885227a91.0.1742954305071;
        Tue, 25 Mar 2025 18:58:25 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f5b782esm11157741a91.2.2025.03.25.18.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 18:58:24 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id A04E54230C05; Wed, 26 Mar 2025 08:58:21 +0700 (WIB)
Date: Wed, 26 Mar 2025 08:58:21 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	'Christian =?utf-8?Q?K=C3=B6nig'?= <christian.koenig@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Melissa Wen <mwen@igalia.com>,
	=?utf-8?Q?'Andr=C3=A9?= Almeida' <andrealmeid@igalia.com>,
	'Timur =?utf-8?B?S3Jpc3TDs2Yn?= <timur.kristof@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org,
	kernel-dev@igalia.com
Subject: Re: [PATCH 6/6] Documentation/gpu: Add an intro about MES
Message-ID: <Z-NfPeUP5g2TdWy5@archie.me>
References: <20250325172623.225901-1-siqueira@igalia.com>
 <20250325172623.225901-7-siqueira@igalia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T7r84Huw4Mg6PNRy"
Content-Disposition: inline
In-Reply-To: <20250325172623.225901-7-siqueira@igalia.com>


--T7r84Huw4Mg6PNRy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 11:18:47AM -0600, Rodrigo Siqueira wrote:
> diff --git a/Documentation/gpu/amdgpu/gc/mes.rst b/Documentation/gpu/amdg=
pu/gc/mes.rst
> new file mode 100644
> index 000000000000..b99eb211b179
> --- /dev/null
> +++ b/Documentation/gpu/amdgpu/gc/mes.rst
> @@ -0,0 +1,38 @@
> +.. _amdgpu-mes:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> + MicroEngine Scheduler (MES)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +.. note::
> +   Queue and ring buffer are used as a synonymous.
> +
> +.. note::
> +   This section assumes that you are familiar with the concept of Pipes,=
 Queues, and GC.
> +   If not, check :ref:`GFX, Compute, and SDMA Overall Behavior<pipes-and=
-queues-description>`
> +   and :ref:`drm/amdgpu - Graphics and Compute (GC) <amdgpu-gc>`.
> +
> +Every GFX has a pipe component with one or more hardware queues. Pipes c=
an
> +switch between queues depending on certain conditions, and one of the
> +components that can request a queue switch to a pipe is the MicroEngine
> +Scheduler (MES). Whenever the driver is initialized, it creates one MQD =
per
> +hardware queue, and then the MQDs are handed to the MES firmware for map=
ping
> +to:
> +
> +1. Kernel Queues (legacy): This queue is statically mapped to HQDs and n=
ever
> +   preempted. Even though this is a legacy feature, it is the current de=
fault, and
> +   most existing hardware supports it. When an application submits work =
to the
> +   kernel driver, it submits all of the application command buffers to t=
he kernel
> +   queues. The CS IOCTL takes the command buffer from the applications a=
nd
> +   schedules them on the kernel queue.
> +
> +2. User Queues: These queues are dynamically mapped to the HQDs. Regardi=
ng the
> +   utilization of User Queues, the userspace application will create its=
 user
> +   queues and submit work directly to its user queues with no need to IO=
CTL for
> +   each submission and no need to share a single kernel queue.
> +
> +In terms of User Queues, MES can dynamically map them to the HQD. If the=
re are
> +more MQDs than HQDs, the MES firmware will preempt other user queues to =
make
> +sure each queues get a time slice; in other words, MES is a microcontrol=
ler
> +that handles the mapping and unmapping of MQDs into HQDs, as well as the
> +priorities and oversubscription of MQDs.

The doc LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--T7r84Huw4Mg6PNRy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ+NfPQAKCRD2uYlJVVFO
o6UAAP9lsXJ6l4cqF7vmeIBW9n4YJ2zC41NH/uOp6yO5dvxAzgD/WuufE/4Enb/F
3EDZtK7z4NvrYU2wMCsKX+SSFoHxUAs=
=xTf7
-----END PGP SIGNATURE-----

--T7r84Huw4Mg6PNRy--
