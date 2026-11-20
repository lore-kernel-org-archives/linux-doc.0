Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168071;
	b=hGSRJ9w8rLCvkYrhEIEUrm+ORwv6vXm2hY2Ks6MfLAJZN26bkIkeOdCRkUyUD/XZ3DrS
	 L4KstoG8IiaSb2P+gki2r+n5pAlImAvRZjACZsCvdNZwN3FZ3fV5K+L9pQqLc0vbs7y7o
	 z5UllC/y5HgulP+PRGsqFlJoLjM0pYaGiRdeQkkv4bXrIJJuIpGWBnqvrACV4Nh0Z/chy
	 fg5V4ciT4bysN2HLyZzjBqRRVlotyIM17qs/oobCRQQhMfTuAd1mU68l1mTEKBsM323yc
	 etjbtzKnI0VI8HzP6iNHr27scN+lSWJ6KsVz6hqyJGmCw9B/z7e2xJsgQXmm430YP8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168071;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YU5P8Wuc2M6bZTL3XK84wjuebJ0zvL/QXfNPgZyOqi0=;
	b=uEzQb0FYvgOqpJCpVCmoCcFmzc4cEtEVQnBYLvdNxqSEuqtudaZb4JQ8zlHn6RAFh3Gn
	 n6WUc6B+8s7MS7/OAYEBYU+eBFV+BbcZLnOli3RjbsMqNMM5wthBvB4f+nmmWJYFiNy3q
	 BpjbHjJErE6UjRF/843BnElmje83iA7jF3SjELV7N+yQStjcD5TT8h/BqO8/wBK20dW5/
	 qDLKXwiSgXEyhZiZEyY1ZDK4kME3rsevd/EDCwU7C+vQeeTuDLOg3cBcamOoiQHHM0arL
	 EtZnZjTrLTkzh9YthkBdDg9illUSnhj7WcQdzI/GI0JQ4jtAQzed2HUYG7OsO8DsyXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TTQIJQdF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C173A606A32A
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 09:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TTQIJQdF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D7F51F000E1
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 09:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795168071;
	bh=YU5P8Wuc2M6bZTL3XK84wjuebJ0zvL/QXfNPgZyOqi0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TTQIJQdFmsgcCJvZ5orSt7w0DatjFVZQwcM9IEaWaC+WjWprBbCupEHBw2ZEdEY5b
	 BIBCQ8gTLt9anGc3R+WoUEP/8X0wqmmRyUA0Is+/tDt6D0Coe+GssnIRmwyUztMzR9
	 n9c4oX6NDEhgWoC9wYM7VnNjMV3ikjcOOi9DiBzT4NUIQQANyKjVCwoQ9tX93LQ4Td
	 Wyq5vz3a4GnOFKlXnvezyfJNzLPLOgMgy6KV/q8eVLSgE7z+o4JrHPe3rMwYrkadWP
	 lboTcbWu9QSv9dLAlRzQXsDKcewPjqfaR/lq9p/AjBDOYgb+cEVXKzHr7WrFntR/Gm
	 Qp/UOxFXEysyQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso965681e87.3
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 01:47:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHrkAydwv7sS1xPjdhrMocwoNd88rjYEXtrDVkWsY93dpsa1ubalKYs9bOJyjLvJ9nN9QBGby+OQPM=@vger.kernel.org
X-Gm-Message-State: APuU4Z84pBw80/oJV2eUxmy2lon6pvfkHeCvzfcH24XlqoEEeODpyjOb
	nbOG+Kvv2S3dYdFtX+tXMzpwrKSMfcjVEUOnZ9sIoNmCgVffNPdXUeVKcDo3SGDtIwuLq6vioV2
	au7tlKShyEPRbKWYAtrhcuoNFFqlMIMI=
X-Received: by 2002:a05:6512:6d0:b0:5c0:463:7b4d with SMTP id
 2adb3069b0e04-5c1bc85f15fmr656116e87.46.1795168069914; Fri, 20 Nov 2026
 01:47:49 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015142552.4128028-1-ryan.roberts@arm.com> <20261015142552.4128028-2-ryan.roberts@arm.com>
In-Reply-To: <20261015142552.4128028-2-ryan.roberts@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Nov 2026 10:47:37 +0100
X-Gmail-Original-Message-ID: <CAD++jLkrWojU3FeTPGOCFHHsbmTGYG0Tz3b2nrn7mMfsDssCQw@mail.gmail.com>
X-Gm-Features: Aa3M54rOrfZtY95RmYFxRv97HUcFxeSdg2w3O8Cm90EYC1dabPW2gsgZ-nnS-cY
Message-ID: <CAD++jLkrWojU3FeTPGOCFHHsbmTGYG0Tz3b2nrn7mMfsDssCQw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/15] misc/arm-cla: Add driver skeleton and documentation
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean-Philippe Brucker <jpb@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 4:26=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com>=
 wrote:

> +Inter-Accelerator Communication
> +-------------------------------
> +
> +On some platforms, multiple accelerators, each attached to a separate CL=
A within
> +a cluster, are also directly connected to each other via a shared bus to
> +accelerate cooperation between accelerators. The accelerators sharing a =
bus
> +cannot be isolated from each other. When collaborative operations are la=
unched
> +on each of the participating accelerators, they synchronize over the bus=
,
> +stalling until all are ready.

What the patch series needs to do is tell us how this topology is discovere=
d.
I.e. will it be discoverable from the hardware itself, or will this topolog=
y be
described in device tree or ACPI for example?

The kernel must certainly know this topology to be able to synchronize
work across several cores? What happens if an asynchronous acceleration
task is running on some cores and no actual CPU load is on any of them
and the kernel want to put them to idle or shut them down? Same problem
on the cluster level?

Further since this appears to be hardware topology userspace must obtain
this information from the kernel, not the other way around: we cannot
have a situation where userspace "just knows" stuff about the hardware,
keeping the kernel in the dark.

I think this is a wider question about the discovery of these CLA:s:
there must be a coherent story about how userspace finds it and maps
it topology and that information must come from the kernel, so the
kernel and userspace have the same map of the world.

Right now IIUC the driver probes from discovery in the hardware from
CPU-specific registers so does this discovery also include the topology?

Yours,
Linus Walleij
