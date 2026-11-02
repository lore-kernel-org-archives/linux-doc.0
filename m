Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793651509;
	b=TtW4NeyOfYy9CjsWVHPLCdlql25RQW8yFIadLqsqpOUPHOs7HBL42ENYC0m0tAf1nYXQ
	 ub0m9bgNW0YjIdwpBhghN9+k4MHXVoHrEYNMIqkPjMrnPaXYs/O/AQDLuH1dcs6JPnGFw
	 PS/1C99nm9E/VhYzAUJH4VySUYUeRnPcWXbdInRRhnFYofLvGqEE143lirN0PrPVbHk5u
	 yDkFM9SQjQzB1u8gXqGKSfffiSxi23RfIKrqwZuum8HhfRXCbTyLY3ETyLe8JHwptLoNo
	 Q055WJTHeO5KC82Uvmke7QEud33cBqTTcnJUcgfVfsCaCs6u1aB8+wKvOZ0dm9qmnRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793651509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VjG5TvEjkBjtEt0wy1VTgpSv3HtKBsr1B1mB8IreTGM=;
	b=JSKJjkKTVRTL3QIe+UtRq/w4+RyuTufkiNQecQS6Ql9DweL2fAzuLqsekriiJOuwYJpd
	 cBD1ogb2VQvL+rvsXxbtmcPaoTNIMlNGxE4ZH/ttbBUC6FkVkkzU61kON6hHyKOSSc3/b
	 DlM/dArUCIl+dimrdfJVwIrrpJfsEaFmJxplBKlHXLOXdBkgtFolM8jCbZXmqrzuw5aXx
	 q+v5EwwN1+wC9crt0Hpd4RQCnWPnI/1hXjzn0SfvQE+uOaHbzrOCHFR5fPktQmzoygyCT
	 9R3NUMqwBLifHN5uH7znZZimIPxzxuXO9CqymsWeQTZah8z2c9fyMGIYAqnW05vg4NA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AAJQnj1J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3D9606A326
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 20:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B3D9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AAJQnj1J
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so2090a12.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 12:31:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793651507; cv=none;
        d=google.com; s=arc-20260327;
        b=PIdfNg+sM8lv7EgfelYX6uWt/8pGUSmKQul5QJt9ySRWEPbJEIGTq/CQMj0CJxME1N
         KKpxAb5NgYCEebW4PylbZELzCZwqsIvMJeWFkpMQ4gLZ7c/x+yiaVz3sbT729Df4nDhW
         FKRz1imwp0/kmN5sUGN+1BP6q0SsM0YWfLgyIR/2XXlj82QnjPIMwL8c9mEyAawlku8r
         BeokJ9+uZXwR/H/RxU6jxjLkHEc/obr7RM0tFSQOiVEMxdKMIlgT8C5GDCOKqmuPEGqi
         gJAdlK9YKGX9M94OMJrR7TBksBcZcHa7XqnBL3wOaespeO2GCeYCdgnZ8dRIk6ATBO5q
         Cabw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VjG5TvEjkBjtEt0wy1VTgpSv3HtKBsr1B1mB8IreTGM=;
        fh=whzOs0Bq5LgJ4zSgiaLyJbxYVqjERI+Dl07q2AHlEH8=;
        b=rrBDi19p6VhYBGFks0UvlVPe89fyTrgGGeUw7uw4wj2C0Zq7dPaqOdJfGDX0V4QLan
         zgDIqFe5JCBWt+LnC16A/pZ7HnfXj57J791Cp50C6F00BZeeuvDzfw/uQk+8fljNE/f7
         XWPHI3T+GaAMV4PrJjBYKTSUkNlsm9aS8Kx5zZKn857GRSNQOCBtg4O75wBCBnSA0rdh
         jjUmB9C99hjvNNhAByVKQ9+vNugj2xaJoBde9NFcemmu7vFlyIOUPr52vngjoZQlOWWN
         0vqagyhw8tC9HtbsrJiebehBt/L5umHgaq8AxelPccdjI6jUdsEoq9X+0nq1YGR78Zzs
         V0jQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793651507; x=1794256307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VjG5TvEjkBjtEt0wy1VTgpSv3HtKBsr1B1mB8IreTGM=;
        b=AAJQnj1Ja11T23MVaTLcNycS+cUJrfMpwhSGmHetEgU0YRe4eRGM44pV2rGMMTbVSC
         vTj97Qw6X9pHx3UO3B/YV+Tt5TuvUx76pgo1Ha0VR/atoIse9D55YKYrUSVdYIMNktQW
         /KDFXZfnQ75dvbLD1S2Zsl3r6zjQhaBhJujHDe0GxmQcpzi4mVizJHSC8QnkB9ok0m+h
         uRGb22Jpp7sCGuFp/73CyZ9+yx1sxgJ412AnHSmAuh3TMXnpxkmncKRT254C1vRiFohY
         kQv7YfInJwo0rwgXpcvgCKtx4fLX/FS3PYMpYb+ZM8G4lbfc0fqQEEicCYIsiXPtDUkX
         8eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793651507; x=1794256307;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjG5TvEjkBjtEt0wy1VTgpSv3HtKBsr1B1mB8IreTGM=;
        b=t5CLe8FNBFdbMc17feFlumLn5HmECC7RurUtwkUvlz5FYGErSQmqprYnDyDveV4Nvz
         UkiwpiGrdQkaZn7b96AhXP5dLSQyvNlVAXyNGUY78OWEbVxrzmiy13UJIAeSLr014Y6P
         1im3Vk3qNNTGjcdq6KMe29/xz3R4nXIH8c6oHS2qiodUAhFPLaT2lCKG6yPKgOBn/61t
         Ukl3SV7OPe3OhNZB4vQe0cDbcVupN33lDgIdMNXsMZWnm943sarom3BKuS8JnaF8/JgE
         SoSL4IbjAap6wfekWe1rVTjest4miwWMrV0WJwPBiYURiEoms3PjF2BhGiuiMHU+pWzp
         legQ==
X-Forwarded-Encrypted: i=1; AKwUvByZmZIVVPIEgtlDlOsP68dAqUba9UTZB9rUdFOcvBvrD3mZaD/AOzX483qKb3OhJaDAaDOkbGgtSg4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/k+kJ9WozIyB5oFYKbFBYBg9derqysx6HyS5pB9fu674hFwdyj
	NMaBWrHKVGbdDdh8EmWNNyQA2kbjE7+RelMCQVSWTrGFlBI0uFutIwhLdV7M473aa4/k81RDUss
	RRlQDMnn7wo7LJDm/ViVDz+aM9WkxmuxVEy5J3vxe
X-Gm-Gg: AYBFou2PUzABacCLmjj83knr+69bexewfLPhDlEDmAZ8xIBScoFoXB3I+kt+B4wDgRB
	D2oeQTD7Iz5zrAGB00yE2n0GQ9qIBthmoAykyJgFlq9OUoRgSL9UInVv1mb6wYduwEH/oUUONM2
	4rgn7J1oalJd/6IqdVJgtLufeV9KUCmA0jUG/3ez5GUly+vxzkXeu0q3oUNtYnBOHfzTbxnreC2
	4IOigoeI0OyuGk/wuWu3niUhFNtXp3qFrNL+H+LHu7wH4JxKcLH1+9NysT2bTM6kCBj6VdtUY+K
	7zoS++GM2TjR7mMSMIow0Dhc/8Ls0MtzNDhXovH2Csp+GCJUgkmm7uJIJD/DXWxEcv/obhf5wAu
	dRraxoCXtBBP0pPUIJgzCvfKzeGjO1ZlZZVyH/9PtOxpgnKRfDcES5Tlmm9dFvXadYVQ=
X-Received: by 2002:aa7:d794:0:b0:6b4:2188:97d0 with SMTP id
 4fb4d7f45d1cf-6b539d22220mr5389a12.6.1793651506561; Mon, 02 Nov 2026 12:31:46
 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102191438.1059771-1-sdf@fomichev.me> <20261102191438.1059771-6-sdf@fomichev.me>
In-Reply-To: <20261102191438.1059771-6-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 12:31:35 -0800
X-Gm-Features: AclHuK-pAzMpwpW_Jh3vV_sTtL85J3_WyWyUrIfAoS4gpBHVCa9xsaWfoYFzl4A
Message-ID: <CAHS8izM49sjB7QMv6eD_vws3D-JvR=vi9U=g5_tb-t70hJ=MWw@mail.gmail.com>
Subject: Re: [PATCH net-next 5/7] bnxt_en: limit netmem TX frags to 32KB
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	edumazet@kernel.org, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, sdf@fomichev.me, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, daniel@iogearbox.net, razor@blackwall.org, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 11:14=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> The TX BD length field is 16 bits wide. Limit netmem TX frags to the
> largest power of 2 which fits, which keeps 4K aligned frags 4K aligned.
>
> With 64K pages this already applies to PAGE_SIZE net_iovs, whose 64KB
> frags would otherwise wrap the BD length to 0 with BIG TCP.
>
> Tested on a 50Gb/s NIC: devmem TX from a 2MB hugepage-backed udmabuf
> runs at line rate with 2-3 frags per 64KB skb, none above 32KB.
>
> kperf output (sender side, 1 flow):
>
>   client: =3D=3D Source <sender>
>   client:   Tx 46.358 Gbps (174483046400 bytes in 30110590 usec)
>   client:   Rx  0.000 Gbps (0 bytes in 30110590 usec)
>   client:   TCP retrans reord rtt rttvar d_ce snd_wnd cwnd
>   client:           729   153 599     48    0 13893632 3147
>   client:   net CPU 71: usr: 0.03% sys: 0.06% idle:67.62% iow: 0.00% irq:=
 1.12% sirq:31.14%
>   client:   app CPU 72: usr: 0.16% sys: 6.01% idle:90.66% iow: 0.00% irq:=
 0.83% sirq: 2.32%
>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

Acked-by: Mina Almasry <almasrymina@google.com>


--=20
Thanks,
Mina
