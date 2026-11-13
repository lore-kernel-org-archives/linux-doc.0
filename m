Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794547871;
	b=r0xLjwrfk44HhUlyhs6UYiSbWYdTaUoSJ38yYIvZPcszRKABtVdY3oyaKHJqKakSgstv
	 uYqTYeLKae5rV3HsoX4cpvxDfm0UnHO3UhUA+BR+ymjGqA8sXtGrJAyp39JEBj7wozktO
	 ynSqanlcFiO2lNVE+VzMU5Gj0raMKiSx3EFTeLeFnIvXi+Igq5VSJN+g7N2NwTTJGV8FS
	 6bs1puvYo/joCOyfqO/ZV78p+YiEo02rEMCCsbCIB55US8Q6q9LvmeX+ODlZ81MPcXbFy
	 MnaMlXVajgDYVWcqV9DGDU/E0Th1dV1frhgcaivyb28elGeK/+PyPhLpSRRmHG3GCrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w43UbU37I+5iOET4dygwr5SwGRkUmEoClUGG8OTjGgI=;
	b=Zw3purLEFIuPkZg+NXIFnE+r3Nk5gdgwCepb5m4VNrW6kqeqzzgvS88f64DvVsvYsWzm
	 2r00D4mwBInj6DBnIgtA+I1IO+GeTsMohViWJN2GNSqYJdj0kDbZOuHoLRG1MlEtmmpom
	 ne/xvX8EqdOx9rrdgWiJP0YWVjpdqahqxorbwuJ0zQYc38dborQMO/mFRU28JqDemjeL3
	 825uJgA9SBMo8Vo4/FPh/mDNey2To6+q30igs2XlbGkOmX7ECNqFnu6Z8sxn/xVdMB0Ac
	 OMWs0MBWgxIm88xwAhgmppH4bE06+ZZc865lsSTbWEkmTIb3glHUyB0UFVsi3tjvegQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="VTU/Umv/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBACC606A32D
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 05:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBACC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VTU/Umv/
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b571a45a2aso4586a12.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 21:31:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794547869; cv=none;
        d=google.com; s=arc-20260327;
        b=CUGQ4H1awnk4bn2sAz6oVixMGlp5ni0dp8NsxnJlUPDC7q49+58oMERwknwVcJEleq
         lNe5zJhm3Phz9pizj/59wWu6SxlR6EoXVajr+LYuNwwWA7meT7R0Q0wZqg7Sg2/u+nZN
         RLyClOCX7AWhQqrx0Kskz4YGo+C51k8xmUAWcC27c4enuHp08TBnckJraFte1Lt0EfAn
         z694X0wemti8aZYqlYw0Jd/xldmvV/dZip/ogphPSJLxpdm/r+BcnldP5kkm+7fAcHXc
         6Mj9RGbCsEaz1gaUSELFtVDqXQWhpU82xpCj+DpAKKxyr+/oRJD8yqdySZXWelxFm2x0
         nEHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w43UbU37I+5iOET4dygwr5SwGRkUmEoClUGG8OTjGgI=;
        fh=9gapX08GVnlHayeZLgsG37JFIP+5+62XMp/S+fOkLVY=;
        b=WO6GtTvLDHbzcZdBHqWZaT7Ah4+JRPUTotQkCDoKAD9hwXt9T24EYN9HDbnJrv8rdS
         T0CBewb9fdT17mm8P3KJshm9xGdDzknctnKwRtyKyoQZrW43WYGsCsHDy2zN4dhdoqjW
         f6eKeBp5kGRyOMgQjsdpkFtLhg3LzD/OUvrrzvkjl/BAKSZ979VlUOdWtwTDJ4lyWsMD
         7pTKT2JgqIhQlQnOdIAT+KutaOIYL48c+ReEWGcJrnh3P3WnyliosEXwgm+Gk/+QTtYc
         1xp37R1xyFORxyZRjiH9j6AiUzRvYDx1eao+To6DcC4zEyaMVTNR3jasVuL9QZ99ENPI
         6sDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794547869; x=1795152669; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w43UbU37I+5iOET4dygwr5SwGRkUmEoClUGG8OTjGgI=;
        b=VTU/Umv/XxRmtX3d/XSHHHzSkVNlCjGAiWWmvRpYtATJbDMspOvWRWvSyyqUeqeGeO
         Q8uCINspbjVgU1zSuH+9UnHcqxv8cjRjT4BNbJxmhaQFB8TeexUJIOYqLp4e6zCgNF7n
         GqWGMPJWmhxv2jXRWVtVDAZqa1EhqIWzuIWQ7K3QsEysQ+usM5G4CvZUur47OQUqnPpY
         PP7Up96FsigDTcgDAk4n7JTplwxHbQe689kspsrS0geT7o0ItGIgt0vez+TupVh2sN/m
         e+JFPSRT2SGGBWIOmeouwuXUS1RYlIiX34y+UZSFFdexoH4xWaCTbeVKnfpyGGT5KVCu
         Qs2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794547869; x=1795152669;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w43UbU37I+5iOET4dygwr5SwGRkUmEoClUGG8OTjGgI=;
        b=qQ+8k7nmi9+zgXmxrRSTTv9vXl3xemkjw7D0i7EdxXivJzsxF1zKgiq5jjK9825wI4
         fKfh7syJPmRNcPCh2HfJCX8MMs72OeJdZPde6zz1ePKyUwlPHRr5Q12Ixo8upo/o293E
         NzpH4OYX+YiLZBEkibtudLeMDAM6OxB1cQj79Pu3oeJ4xZt9lubxaE7VS1GgvQJt8Bs3
         moQCVPA41t+vqUbDYP0Vqdmy5QaMxSbbvUMt+O5m1dHSxX/aFx8E20BJ/Pc+GkMKXcT1
         S44tC8Sui0fzQK56pOY5d1K9vjrl/6+ACQVMyOiTBWJspzaO2az3CxqJF/wIRn8TdyM4
         Pf7Q==
X-Forwarded-Encrypted: i=1; AL+hErEAMHbk4IyDGdPaNT14fWkYsHonF94+Aia3jeYgzKLPnpmk7SPMQ7ceszeB3vTw/QLIphzyph7tGqo=@vger.kernel.org
X-Gm-Message-State: APuU4Z82eSEEG9WkzlZ76VI7aIHnRPeZoTjkr4GE/jjnB7h827iaULes
	JG23L7sCKvhDthDjGMSpCutu/+e67sy35zwGazCP+R35xNQy9gv0lFq4AK6igDoJQKGycRvqdGV
	0ymIInTx6XxGq3fTOSytr1vaEwFDPb6GUYN44cP7v
X-Gm-Gg: AYBFou12cMiW7/LTx1MYMBUf/xQU+LyW5DGOjVE8fcDTCO+sYkLejpuSG9zsaz/K2YC
	X7i4aCNV/WXGJb/uO8ADiDXaSdZ0SFMqatqa2GDjDTZ7/E3TjJR8dMUtksJVlOgkmZ2+hBRkEIU
	krma5jaTlcQT/H7gGmr875DofuPGsicwxtB/ubAPWda7DsFDr2Q0Cp+Ux3tprbO0j3EAM8dq8QE
	WQ9O6mAFnZ1GhNvvTPvj8BmbglX0sy+pQbS1NQpSrvO8ngXSs3ZiYyxSW7OpIFj4lOCtmBQS+UD
	8azSmCrzOS7U4hyB3yrIBD7cIQAcujFpoSMYxDYcYrwGLUUOS/Btot7T9qKpMy/9bO6g1OQTaQs
	DCh0oim9+LRLLwy3fO8pn5hf6CWh4339q5T0=
X-Received: by 2002:a05:6402:50c:b0:6b1:bce6:1220 with SMTP id
 4fb4d7f45d1cf-6b7c82ccc67mr31403a12.12.1794547868632; Thu, 12 Nov 2026
 21:31:08 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-3-bjorn@kernel.org>
In-Reply-To: <20261110102039.1002605-3-bjorn@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 12 Nov 2026 21:30:57 -0800
X-Gm-Features: AclHuK8G8jI-cBJtcQSxvGp_Bq701GaxLVhNUpqBJGdSCTN97QaxO6J0E1uIQ_U
Message-ID: <CAHS8izMaAv6gX1NeJR+QCf43CL+DC4DgePRNNxSLoE31jxHU0g@mail.gmail.com>
Subject: Re: [PATCH net-next v1 02/11] net: Add memory provider capabilities
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, io-uring@vger.kernel.org, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stuart Clark <stuclar@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:21=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kernel=
.org> wrote:
>
> The core treats every memory provider as unreadable: installing one
> needs header split and no XDP program, and any page pool that allows
> unreadable netmem takes it. An AF_XDP UMEM provider is readable, needs
> XDP, and hands out whole buffers.
>
> Describe providers by MP_CAP_READABLE and MP_CAP_FRAG; devmem and
> io_uring keep their behavior with MP_CAP_FRAG. A page pool takes a
> readable provider only with the new PP_FLAG_MEM_PROVIDER:

Why do we need this? I thought whatever creates the pool actually
shouldn't get to pick whether the pool picks up the memory provider. I
thought if core has configured the rxq for a memory provider then the
pool is forced to take it.
