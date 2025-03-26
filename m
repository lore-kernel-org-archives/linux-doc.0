Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B807E74040
	for <linux-doc@vger.kernel.org>; Wed, 26 Mar 2025 01:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742954029; cv=none; b=VhwDXVCk1LUKV8ZMkYiN2/Xmig0sFwPlx2G+S5P3GCVfTcJ0Vlq6W7NKTtbJlqqKzlyaWN/GTuwD++Ih5bu8ZLzAWXnVd1syFjpH7rNMB9kwO/BMuxkZdaZ5y9dQrNlCyzT0d23PAGUob0+aRJ+c5Ljc1Z+Onr/L4B+gkGRzkyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742954029; c=relaxed/simple;
	bh=bHUdmQyO2BpdhwAwvhp39Sm8OM9BEkdjoS919AZ2eZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZ2rOJ8DwWGpYSd+8koQiO44ZvZB3b9bZjLfb8s9U8eFKQzohqOb4QFy/hIXCzgBK+uKF6HWAY3QZAJqdU7HShhXxZkHo8Jgu9fxSoe2VKYqCO+pduYgCVgCWFOvKSWFSMgtPdRp5QGCB5SgUrcr4fG/8xFHNuV34yCkWq8B2wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ag/Z/n+a; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ag/Z/n+a"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2255003f4c6so121853715ad.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Mar 2025 18:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742954027; x=1743558827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bHUdmQyO2BpdhwAwvhp39Sm8OM9BEkdjoS919AZ2eZ4=;
        b=Ag/Z/n+agymy7suQ86faAUNHg3calWprCQ447h719YT9LOerbNMYm2bCZu6zxWMQrE
         YpNna1gbIONKsufouRyI9kcNXUfpjVe3WHh9DnxcNMgdn/UkKUH5rLKZh+e04esLNmoz
         ZrzT6IacKYAb4ulOg8Maqn7L+rwBgIv6aKx5Um5gjImazqljUpTWxwIRQ570Vxftjg53
         jubgCCwjh8qslOKotF0zad7BIQGVFPvS/BezmDj50/gZH/FCOv8G/+xYFowDG7b96JHW
         yZLLfRUtOIkXydGetaW6EGhdSX8yXQDfM7E6CkluifxjifVdaXBZ+CTy2HGkwb4yPGD8
         Ey2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742954027; x=1743558827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHUdmQyO2BpdhwAwvhp39Sm8OM9BEkdjoS919AZ2eZ4=;
        b=MFuWQHGu30gSeV14yaTc+HIoWLf2a3Ik1eoOejhe0VQMiJucdaN0sJvzkV2yMU10VE
         X3xoAA7PwTeQCXOwIosFCREMa+VbKdpOjGMBjMIGdwRXWG+wPZIwpW0al8LyTgVAn8LX
         m/dKXz6KHExrrqaATFBDoZA/eJyU/VAY+URPsX7a9kff0XU8I/ZChALJL8XMvNlIn0hZ
         J90it9IXObhflcqcygmZ+30UD8HgyLeu4jNug2RKVKKtrrVfB38Xb5b268y+wORQSnTt
         Ki8ouTWfKcjdhHo4P/LMf91FvkjriKdVKutHfwgRVqVSfppqqjuJDW/n6bGgF/du/UW1
         p1SQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiWV5fncFvBQfop8NcIR6rOUfnrYRVCzonmi8O1w2zuD+Z9uT35wDZcMFI8uNZlRHGqYnI3EqBc/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhzFL90bBftwnXaPZgS56K/t4rNDIPI3Ci3PE25FzC8r7E4R+p
	0AVuN2kkWM+IO+zDrj6BSqx8LRg8RIRaC0m1OroLtkvlGOKHdRFk
X-Gm-Gg: ASbGncvhA/cpF0d33o9h/dDmYLtJqy5PDgK3fkXgNQycqM6/hbmA1uuuV2/dtCw5N1k
	zv9rwngbHIorBgBjkU9Qp+ay27vulzDGsAZqzeQ5G2l2StoZkkNOABD00XIiDGdqQWnZ9yJEXNK
	FANlXqIELSoDqo3nurUpAzYQFTMf4LNhvfMXn+lsbfZTEa++sWdGJ59g2vvopUy//hDpDw3bwxs
	oPl+WcUaGD2Vpjle9AoHXjEV/Gd/ZWWKuGyCIYWt+4Ik36FRHoiWsW+tcK1Ccb4kp7kn673tsZZ
	tRrkr7UUNckK7VXcgnXp01Zke2xTxqKDRBhHkjxi2BPqLhEW9h7hIsc=
X-Google-Smtp-Source: AGHT+IHD8Vo8UwujuN7hNNDBusTP3KjsT+y+ccOlwpD/9Ek/nB8mPA7Mfk+LlbXQbxCuUDQpKgy6fw==
X-Received: by 2002:a05:6a20:729e:b0:1f5:6abb:7cbb with SMTP id adf61e73a8af0-1fe42f585c0mr33547160637.23.1742954026671;
        Tue, 25 Mar 2025 18:53:46 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739061560d6sm11307073b3a.148.2025.03.25.18.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 18:53:45 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id AD0C54230C05; Wed, 26 Mar 2025 08:53:43 +0700 (WIB)
Date: Wed, 26 Mar 2025 08:53:43 +0700
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
Subject: Re: [PATCH 4/6] Documentation/gpu: Add explanation about AMD Pipes
 and Queues
Message-ID: <Z-NeJwfu1Gyx_CeX@archie.me>
References: <20250325172623.225901-1-siqueira@igalia.com>
 <20250325172623.225901-5-siqueira@igalia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/mnH3a2A936fTjj8"
Content-Disposition: inline
In-Reply-To: <20250325172623.225901-5-siqueira@igalia.com>


--/mnH3a2A936fTjj8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 11:18:45AM -0600, Rodrigo Siqueira wrote:
> +.. kernel-figure:: pipe_and_queue_abstraction.svg
> +
> +In the central part of this figure, you can see two elements, one called
Did you mean hardware block?
> +**Pipe** and another named **Queues**; it is important to highlight that=
 Queues
> +must be associated with a Pipe and vice-versa. Every specific hardware m=
ay have
> +a different number of Pipes and, in turn, a different number of Queues; =
for
> +example, GFX 11 has two Pipes and two Queues=C2=A0per Pipe.
> +
> +Pipe is the hardware that processes the instructions available in the Qu=
eues;
> +in other words, it is a thread executing the operations inserted in the =
Queue.
> +One crucial characteristic of Pipes is that they can only execute one Qu=
eue at
> +a time; no matter if the hardware has multiple Queues in the Pipe, it on=
ly runs
> +one Queue per Pipe. When a queue is running in the Pipe, it is said that=
 the
> +Queue is **Active**.
> +
> +Pipes have the mechanics of swapping between queues at the hardware leve=
l.
> +Nonetheless, they only make use of Queues that are considered mapped. Pi=
pes can
> +switch between queues based on any of the following inputs:
> +
> +1. Command Stream;
> +2. Packet by Packet;
> +3. Other hardware requests the change (e.g., MES).
> +
> +Queues within Pipes are defined by the Hardware Queue Descriptors (HQD).
> +Associated with the HQD concept, we have the Memory Queue Descriptor (MQ=
D),
Related to HQD, we have MQD?
> +which is responsible for storing information about the state of each of =
the
> +available Queues in the memory. The state of a Queue contains informatio=
n such
> +as the GPU virtual address of the queue itself, save areas, doorbell, et=
c. The
> +MQD also stores the HQD registers, which are vital for activating or
> +deactivating a given Queue.
> +

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--/mnH3a2A936fTjj8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ+NeGQAKCRD2uYlJVVFO
oye9AP4iR8Vfseiyzk8xEC38+vn4Jm0SA+1phHuaBIUg4JgxTAEA0b0qh5O2KT7G
AqtO7nxuNxNoBeaZD1kAxX4AszF8DQA=
=TdVl
-----END PGP SIGNATURE-----

--/mnH3a2A936fTjj8--
