Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B634DA0C
	for <linux-doc@vger.kernel.org>; Tue, 27 Feb 2024 20:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709066326; cv=none; b=OVsvZydKvgYOEkl8Nn234F3heijTQ3xgutLM4Wf7f25S//sBTeVcfpeSqXyLST38laV4GF09H9g24WueBOyBGM638CGrwm6qFu53JFyVj02Im/LF1VWMasZu12bNFQiThUcgFGSM1jHFpN48+9ctvRc44rswlVaCLZOo/J1YZD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709066326; c=relaxed/simple;
	bh=CkZepzpM/VosvywX+NgP8wDx4GMNVToGsSybSS8jHno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eDZJ7RdQYnxADjm14czmlVdlu2reVYfL7xfqhWtgnY/cDTAU7yjp8+xIPPtY6To6IwnKXtUTnsI5lx1ng2c2HJo6DS300skhmKKd06O3veAJ+ym0+J2IsdoRXfOgss6PX89rjh3feZ0HzGR+mr1+AJAadgz+c9RidTLgflsPapc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G5VHXFd/; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G5VHXFd/"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5654ef0c61fso2977a12.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Feb 2024 12:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709066323; x=1709671123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKmzJcorTXGx6YBSA/lEZ9Y4CRB9OUfazxwO3lY1Y2E=;
        b=G5VHXFd/BfW00OZXqfB7fyESd0AgGkasc9NJJQkfIZTHgMIqjDDiFYfxu13tX1J5wR
         zjHGLgVKmHLkhZ9UxpM0338g8+1DWl6JxdHwosfukdYTVR0w/ffKL1uJNTPpBJd8SAgU
         G5JM5/vjv5u34ZfKdZ/b0Cx6PyPO0dFAkXuPXiTMoPgmNgoBC/3Md4+NQdGBryXi7Xd0
         GortOPZxtk7QG4uEpZMYik8nQ8k/bf7Kzfb++1g1URIBodoK0mGNS7wsp00WkvNRHQma
         hBG7xBiRZyZRSsZxSEaPjn+7Z9M7LuigZdgkDPcWxqago8qRsvEM40TfAJjS7kgJo9Cf
         wItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709066323; x=1709671123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKmzJcorTXGx6YBSA/lEZ9Y4CRB9OUfazxwO3lY1Y2E=;
        b=dAod5DQgzp7XRm3Qsy+dlw1kEMwaRUSUFf5Prn/sNZriZuGqXjpS+xsYhTWJrE78Nd
         eBqlVYhNbWWCD6HY9K7JWXKsq3WAimKW0Fjfd5ZVKGggEqrCATifRhxcDgWDu5ooUAKZ
         mZV4igM5n1qpfVNzjkLzb6RmSuS5UFfkS77Y2rB2I8vGajeAbLx4P5JZbnu6OQ+uw6FU
         ac8sHSUYu5SJe50PxFqwxf2kMujQahRTuu58d32CZDDv7/S230KFGF1b10UhaClJiz2w
         HXfgdFyZGO1yPbJK53DrRR2TnenegvGQ9BHu1QPlWisPDRaZ/dwZp2dtcIHsYl7JONDX
         DQTA==
X-Forwarded-Encrypted: i=1; AJvYcCVyJZSNfuXlG5g+A6Y1Cz1mwz0A7fhkrWrZku8DjMpUaghGNSt+vMweEzKadC8KYeNAhTLjsysL+Jo6Pz0rtPWgdS4prP0e3MTn
X-Gm-Message-State: AOJu0YxJWWasK+yGjelPoPHukkuydc5qxyVFU5Vijt/lXmopQDmiNXD7
	udHlppK1iVvrslC/7E+QuV61JndOmzOudlbK4RgCBM3aJ2lWfPFmPI/63mCV3grV0LLIRV/gh9Z
	TpsfdswVYXzoItSLK/BAY+YW0RjZ6qX60EoQC
X-Google-Smtp-Source: AGHT+IGDJH8gnZSClW/CxZ9poeP9c5CGVKgIi1nVGctIXngEUbUoLI/1USJmcsUnG9KZ8K+rqBZefiL7ZjbT0rn04Io=
X-Received: by 2002:a50:8711:0:b0:565:4b98:758c with SMTP id
 i17-20020a508711000000b005654b98758cmr353143edb.4.1709066323359; Tue, 27 Feb
 2024 12:38:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226022452.20558-1-adamli@os.amperecomputing.com>
In-Reply-To: <20240226022452.20558-1-adamli@os.amperecomputing.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 27 Feb 2024 21:38:29 +0100
Message-ID: <CANn89iLbA4_YdQrF+9Rmv2uVSb1HLhu0qXqCm923FCut1E78FA@mail.gmail.com>
Subject: Re: [PATCH] net: make SK_MEMORY_PCPU_RESERV tunable
To: Adam Li <adamli@os.amperecomputing.com>
Cc: corbet@lwn.net, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	willemb@google.com, yangtiezhu@loongson.cn, atenart@kernel.org, 
	kuniyu@amazon.com, wuyun.abel@bytedance.com, leitao@debian.org, 
	alexander@mihalicyn.com, dhowells@redhat.com, paulmck@kernel.org, 
	joel.granados@gmail.com, urezki@gmail.com, joel@joelfernandes.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, patches@amperecomputing.com, 
	cl@os.amperecomputing.com, shijie@os.amperecomputing.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 3:25=E2=80=AFAM Adam Li <adamli@os.amperecomputing.=
com> wrote:
>
> This patch adds /proc/sys/net/core/mem_pcpu_rsv sysctl file,
> to make SK_MEMORY_PCPU_RESERV tunable.
>
> Commit 3cd3399dd7a8 ("net: implement per-cpu reserves for
> memory_allocated") introduced per-cpu forward alloc cache:
>
> "Implement a per-cpu cache of +1/-1 MB, to reduce number
> of changes to sk->sk_prot->memory_allocated, which
> would otherwise be cause of false sharing."
>
> sk_prot->memory_allocated points to global atomic variable:
> atomic_long_t tcp_memory_allocated ____cacheline_aligned_in_smp;
>
> If increasing the per-cpu cache size from 1MB to e.g. 16MB,
> changes to sk->sk_prot->memory_allocated can be further reduced.
> Performance may be improved on system with many cores.

This looks good, do you have any performance numbers to share ?

On a host with 384 threads, 384*16 ->  6 GB of memory.

With this kind of use, we might need a shrinker...
