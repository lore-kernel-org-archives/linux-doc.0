Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E85B306480
	for <linux-doc@vger.kernel.org>; Thu, 23 Oct 2025 10:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761216130; cv=none; b=OUHVNfVj7q8iqnFmWCRO8g+HvRREifeEaVPqImmIof3RT4PLdhBDl9yU+jWoJOZ2UsH2t5dmqGFvlj/vrATc6LgeXZ5PU7SYxcqD5PNn1gdvJZlWH8JmyjQQtNGWm2TQgYun5hV0AxMhkny+9GehkxOQI8s/loz2fn7hJL3UlOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761216130; c=relaxed/simple;
	bh=jyg2eZ/1XdoAlTqduehdddaNsDWPY2qdFBzk6zBgRik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c845/g2wkOa3FkHwXMab9lZAc+ct7PieWx6w3QmqfPEkUcrR0RMRZnQxinBjvVgjoPSyItveYCQ57898ZNUa/qT5zEfjr4qWMI1aXFRkShFr9fRwMoh2qLBOgYxm9B+quslc4SeTwOj3gMTem+HIIcUpDa3pSeWDOvJCDR4Uhb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMZmyn7B; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMZmyn7B"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-637e9f9f9fbso1208052a12.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Oct 2025 03:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761216127; x=1761820927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNwYeVe3zrzgI77kfJc6mmnbUyU3J+W0mAD5mBv2bvM=;
        b=KMZmyn7B/WFxXkWm30Gzod9FYX4imYKhDQ9n1mJTerhcsgny+cgqDx+hERs+OAOARl
         j9j5G0crdnySPQ0Tuv7uzQkUTF6OaFlYnvKyzM4BzQAq4w0DOUxGTwVD5dzewb8DajjA
         NfH5APIxlzWnR3+FoRyz67FRmy7k4mtHcfxlTM0TFbOn+G52nu0pPdcWyvTTKw0BIPpM
         Mp6Cp2v+WWHTERxkowt5/9tOkSaorOxci/ahr5N+pC2w/lUua6eEjg6bKgR658/nxFE2
         ffjOM/9n7vSEYkTvjkSH4Wsabm3gcHPe5YBtV2VwoOK/UX3Yq8pidgxPDkUwIKcGkSnb
         H2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761216127; x=1761820927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNwYeVe3zrzgI77kfJc6mmnbUyU3J+W0mAD5mBv2bvM=;
        b=SE4l8FHoEmhfhCQaPKThTnEwtx4EEnDfWcmdy49LFrHx/gGDBMyKrdOGWlov0Oh7QA
         2XJjq2oaaCH/xEBmhL/osfeCT3RmjfFwIfJ66hyyKKRGSOQMy/0BYqXoWft2LiBMvChf
         x6JjPLV/eLbi8S17mOuNl5W+2YW+WUldDsF5/FDuLcl8a0KZIqffuY6xBORojguBSAGx
         IJfK4gqwHZbTkSPrbpooSYKgMUGsrXE30kyds3nmnrbmELv6IvxajMQTQbg0PJQhYUC2
         JnRnQuFJQdAV760VKGD1LKHro/ORVtdKIXWHdSq349fdd9eyYNU1LMgSYMTCEYNAN+dk
         j/Bg==
X-Forwarded-Encrypted: i=1; AJvYcCX7GSq+vS1VH9TYOaSfRp6KVczRaWz1GRqtc1VjcbbdEgeLFDQOpw2a4n8VCPWLtESHHOqtfvxRCZo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykt1baMSaB+9pPwE8EaeQfkK4X0WWti/JMVkFGnbGYBXVlYBxz
	E/WYRLGIxm3KR90NOKVKUgpa9R9xRz4krJE1kzDQuGPQTJVJjSk0pXTmxd3lsGIz+qZUiGrRuRB
	xKOidzs78ff+jxl2ugsSMVfRVcgNrPmQ=
X-Gm-Gg: ASbGncuAXVWowpuasv7KGqXkaZ6vOnSkrnfNOb94TGa3Q+D0+vEHiRMKWZ3rq6l/rlA
	AjpTZmZUjoQiYGxHAyI8pyB0L7ID2J6tVBVjrdG6XaxUc/MEnCU3HXqhZVV5HQKgDjzjMU5C278
	ZB1cU3opEzYKgjbYMlSqY0CDKVsq+hbxBd9wnNmXAJwxy9knKZg2QoWg/2NLfvEUi0+ApAxjx2d
	VZpPeV7poylMuLLfbSzlftZRqh0RTddr5iAX0sfs19NF0n3NhCFuJsbBvvdwo8SqZ6JhLoC2fZN
	KGi6atwcReRHIk8UeEs7UWmxD/BwtA==
X-Google-Smtp-Source: AGHT+IHj9sqZlFAd6qPNTa4C/OpRKo92Gcn6zexlmgF4iPE+98wHJzEkw8o+T+JQbLSjLVQOB0m1KT0oZjfCmtuivL8=
X-Received: by 2002:a05:6402:90c:b0:63c:489f:df5 with SMTP id
 4fb4d7f45d1cf-63e3e10eee3mr2179427a12.16.1761216127196; Thu, 23 Oct 2025
 03:42:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021-aheev-checkpatch-uninitialized-free-v1-1-18fb01bc6a7a@gmail.com>
 <aPiG_F5EBQUjZqsl@stanley.mountain>
In-Reply-To: <aPiG_F5EBQUjZqsl@stanley.mountain>
From: ally heev <allyheev@gmail.com>
Date: Thu, 23 Oct 2025 16:11:55 +0530
X-Gm-Features: AS18NWBdMh0RmpDPGmhjn_SnwsO6o_RPLnVM52wrjLiLq5epUawW0vv-w1GvPEY
Message-ID: <CAMB6jUGhcJ=W3s96jRBHHTyPfBm+-+d6-VQQ3mXft7=fBJ0jvg@mail.gmail.com>
Subject: Re: [PATCH] checkpatch: add uninitialized pointer with __free
 attribute check
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Hunter <david.hunter.linux@gmail.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-pm@vger.kernel.org, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 12:55=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> I made a list of the warnings this generates (on Monday's linux-next).
>
> None of the warnings are real bugs.  Every single one of these has the
> assignment as the first statement after the declaration block.  We have
> had bugs because of this before but Smatch and (I think) Clang detect
> them so they don't last for long.
>
> regards,
> dan carpenter
>
> arch/powerpc/platforms/82xx/km82xx.c:30:
> crypto/asymmetric_keys/x509_cert_parser.c:63:
> crypto/asymmetric_keys/x509_public_key.c:151:
> drivers/firmware/arm_scmi/shmem.c:199:
> drivers/net/ethernet/intel/ice/ice_flow.c:1576:
> drivers/net/ethernet/intel/idpf/idpf_virtchnl.c:1015:
> drivers/net/ethernet/microsoft/mana/gdma_main.c:1508:
> drivers/net/wireless/intel/iwlwifi/fw/uefi.c:821:
> drivers/net/wireless/intel/iwlwifi/mld/d3.c:1788:
> drivers/opp/core.c:1413:
> drivers/opp/core.c:1480:
> drivers/opp/core.c:1797:
> drivers/opp/core.c:1888:
> drivers/opp/core.c:2874:
> drivers/opp/core.c:2935:
> drivers/opp/core.c:2989:
> drivers/opp/core.c:3065:
> drivers/opp/core.c:3085:
> drivers/opp/core.c:3104:
> drivers/opp/core.c:312:
> drivers/opp/core.c:330:
> drivers/opp/core.c:412:
> drivers/opp/core.c:450:
> drivers/opp/core.c:608:
> drivers/opp/cpu.c:157:
> drivers/opp/cpu.c:204:
> drivers/opp/cpu.c:59:
> drivers/opp/of.c:1272:
> drivers/opp/of.c:1331:
> drivers/opp/of.c:1428:
> drivers/opp/of.c:1469:
> drivers/opp/of.c:149:
> drivers/opp/of.c:1505:
> drivers/opp/of.c:174:
> drivers/opp/of.c:276:
> drivers/opp/of.c:352:
> drivers/opp/of.c:409:
> drivers/opp/of.c:48:
> drivers/opp/of.c:98:
> drivers/scsi/scsi_debug.c:2964:
> drivers/tee/qcomtee/call.c:648:
> fs/overlayfs/params.c:451:

Thanks for reporting these. I will try to get to these in later
patches. But, how do we test the changes?
KTODO: run checkpatch with uninitialized pointer with __free attribute
check and fix the errors
