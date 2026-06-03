Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CCD2609EE
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 01:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780451910; cv=none; b=j/5u4nzzh6VPCg+aK6aDROs+cE4wYJzSpw63t7fGkKKRbqSbctDdXO29iRRhcQR/OF6EoLOE+K/AQ1XnOSRtfBkgrAiTWRFOX6Zq59bo9UDkPe9UmSe6oS8e8L/aqfmRETYsYaW9EeiRxGoAdZFGHkhhc2hpkZrjVcFOJd54OHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780451910; c=relaxed/simple;
	bh=3Is7N/1s9kesTV6NifnE11ZTm6dK8ik8AnUdJpZ9u1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4Ftuyz6UK4eEY8gNN/KOZDChFcO0Q90ZpcbIWNp8G8MEN5XLEXPdL2dRtox4JJ+JwLGv/t1ZDhWTSFTj4TgqIAH8zTA4+7UHKzRjT+ivCLv1NpCvF4MU1A+F31BeXn588+PRHeHObcZ0o054IGnTR38Oerm26MqRKmc224QxDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=manifault.com; spf=pass smtp.mailfrom=manifault.com; dkim=pass (2048-bit key) header.d=manifault-com.20251104.gappssmtp.com header.i=@manifault-com.20251104.gappssmtp.com header.b=0rtbFtby; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=manifault.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manifault.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manifault-com.20251104.gappssmtp.com header.i=@manifault-com.20251104.gappssmtp.com header.b="0rtbFtby"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e6b5dfde3cso1563234a34.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 18:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=manifault-com.20251104.gappssmtp.com; s=20251104; t=1780451908; x=1781056708; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Is7N/1s9kesTV6NifnE11ZTm6dK8ik8AnUdJpZ9u1I=;
        b=0rtbFtbyTZCAASKL658vuOyYHFETjKUckuuC2re5PG2Fru/V85370HXX2kZ3n9S++k
         k/gNHyWItfPtExbP9ylsPLpXCXPWqI+zv5tnqpnbM2z9kYvV1P8wi+KL5MW4M0HPwP7x
         juz8bubVq+CpHjOzc/zihGM+Yj4ECo25An5Ng6PJrVn03RMGWGzF7YDzLF9oMlpytzOI
         BsMmvofEurvgUlMDON6JjhxA66sNAGfyHlyIbl2fU9F/bvNMaUMB61P8Jt0NVgZGcrPn
         lA52kePFAsEe9+MOsX+PRABI9dyWZ2vgkWhz7LlFkjl9IPC3Hme5osEHssU5YIjmRM1q
         FcgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780451908; x=1781056708;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3Is7N/1s9kesTV6NifnE11ZTm6dK8ik8AnUdJpZ9u1I=;
        b=jkZUTphdF7RSZUXWAhldCKszww7L79mejs0Nt+DfwbJQV87ZzRKHKMkYCrOGgdPqnM
         8axAv0DdMNCGHJBbmRXy8McQhkXGp9dRxor8ulJ+9oKqZaz5Vb6VgTlbkMDA+zfmK60E
         ZUg5rW8TnC1us2Uf5LfqdEEmAY6GBbeLhEx6sSy3HwUBySeMeaepNmXR1U6HWFaZbCZN
         3WZwMlq/BXd0hrp0ALXnwZYdptbdDIzA35W1SqZJsxOfVpsb2f6ilaPALK2Q1OGS0WLr
         EoJGnq44ftlhdE6KkPB+ML+sX5G2OiBZhcLVeC5ldrJ4YDXJOL4nv7qahEVp4t/Zk05/
         c1ZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ez0+p2ydZBr09cnu3/M1stbyT1kOP4VZaqItz7ZfTQeu4zqF9iZLc9zLSWA9sr9IEWwxT4ucu0EY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrzFbkdfGUba7VLivZr/0sZvJKKarVwlVFtXQ2hrKUphyy98qD
	3KiSC/qLMRcS33kbmNzd+fUVVB0/mxxAiMrAWGCXNtWY3/E8CiWqv1A9MRUVpnhmtORE
X-Gm-Gg: Acq92OHDbNqRzjps7szI3UWv4jT7Q/3psTI86w+muAbt8piv+zbiSNdOsqa7Z5cQ9hP
	6sNTeAZkhP3+JbO/clnH6SarGXKFLSxP+JFJn8JyRWDFXgCXWXhdcNQx0s2cJq/e5CNhlOpdXlY
	SjJY7Ko8aMrbsymyvtdp07K389jHlE2i2ArXwKThBiYDJGt4aG8MkohtPQ1PGhomxHTJn7tCF8d
	i5hi50d3ZSOw9BMx45FEcBlaMls1MvTc2qvUSrBAHaPRZH4499Thz56PdRBrmXXz+KoLqaFlqzH
	/1+Hqde+VLpflGM4GvYDq2Z6bE4vCVmIg2XueE+cq85MfZ/iV2maIMCBDHMgbyiU0Xm2W6S0I6M
	VnbHzxUi/upkySmjnkELVb3lN12H33UlhMmLSZV/IrILEOi5vDTcsx+JCvtlc10AUrTi8D+G29G
	6QSAyX6W3RPkLzyiCgQsKwpsuxA8bFdxgmwkDQTjbGltKnvfWj2bsPXmLu+jIH4bYhF4DOsw==
X-Received: by 2002:a05:6830:6ae6:b0:7d7:419a:7ac8 with SMTP id 46e09a7af769-7e6e9d3b2b0mr631893a34.15.1780451907761;
        Tue, 02 Jun 2026 18:58:27 -0700 (PDT)
Received: from localhost (c-76-141-129-107.hsd1.il.comcast.net. [76.141.129.107])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6e75c5495sm791076a34.10.2026.06.02.18.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 18:58:27 -0700 (PDT)
Date: Tue, 2 Jun 2026 20:58:25 -0500
From: David Vernet <void@manifault.com>
To: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, ebpf@linuxfoundation.org, 
	Bastien Curutchet <bastien.curutchet@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	bpf@vger.kernel.org, bpf@ietf.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2] bpf, docs: add LOAD_ACQUIRE and
 STORE_RELEASE instructions
Message-ID: <ah-KCqA0FgLcX4NQ@maniforge>
References: <20260521-bpf-insn-doc-v2-1-8c43c037d599@bootlin.com>
 <iulf7fwwvfrvvspg4e5xyx3tcxe2yonfjllnze2phgfgpynrlh@kodf3fy3l32q>
 <DIP2GAUG3O18.29B8U0FOVEVET@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ezldfm6trmndxdd2"
Content-Disposition: inline
In-Reply-To: <DIP2GAUG3O18.29B8U0FOVEVET@bootlin.com>
User-Agent: NeoMutt/20260105


--ezldfm6trmndxdd2
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH bpf-next v2] bpf, docs: add LOAD_ACQUIRE and
 STORE_RELEASE instructions
MIME-Version: 1.0

On Fri, May 22, 2026 at 10:35:20AM +0200, Alexis Lothor=E9 wrote:

[...]

> I don't know how heavy/long the process is to submit this kind of RFC
> update, but your point makes it sound like it makes more sense to just
> go directly for the proper way, ie adding the conformance group and then
> adding those new ops in there, rather than updating the kernel doc as my
> series is proposing, and then later reverting to a proper conformance
> group.

Hey Alexis,

Apologies for the delay. My email filter was broken so I only just saw
this. Yes, this would be my suggestion. I can send out a patch that gets
this started later this week.

Thanks,
David

--ezldfm6trmndxdd2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRBxU1So5MTLwphjdFZ5LhpZcTzZAUCah+KQQAKCRBZ5LhpZcTz
ZB68AP0XZVyPSmVl/+Ql+/VELqAYsqSL+Iq1Wkure4rdMn3Y5wEAwxbBaowMElWS
MSr9V7Fqms8AHBV4LXZ24XslYEAK4ww=
=MHgJ
-----END PGP SIGNATURE-----

--ezldfm6trmndxdd2--
