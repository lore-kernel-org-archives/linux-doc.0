Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794860007;
	b=bkA5M5cFZ9fqHU43RG+Zybu1wzLL+r150WL5DP9+QyjcObxBpYDYDc8l5wLOSxQC8TNQ
	 4PFWKK6FaxeBfHBErHNFeGxXtB/J4/yIBMA+eld+SPg13LpQeK1EAd6FehXuorK/jwqX5
	 p44MJTPALVVfwJEM8/cONB2XJBjS2qDi9fIjQdzxUqnIqxL+k/s8OovYutISsIMwFhXMr
	 EgbHWCsGT1WwtkKxBYm1celyO/npnpfO/VcbXoTOlQPd2Jvq9uSyev89IBBQdzKg7ehDm
	 T7aQNBGTGhWvLtpDLILZOJGzV8lHl/D4aVS+cCqNQ0cMJci4oDU2Wp+Syu/3LsI6EuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=BDGAdzVguqNy0JEZoxyPcMqb3hE97RGPZcChbfGjrxc=;
	b=jvmTxeuDzULWSq83UcWdUiu+pMy5hGsQB2oIDGKsXrCq27bIVMkdEqCgkTdT0G1wpGxd
	 TPMiudnS2/9VLERNrvm21S5MzvyQigVvgrLNHqZdIgSb1P3YVvXnizvRGRP1JmFKJ+r+M
	 jzuBRmmKBpGMevk+wrOJAMho1DxG+NivHT5iKVesEIb333e+BFj+50zj6Obt0GerdiFDj
	 jJS4JUwiLH+TXfDl5cYDjN/P/LznuZA+CQW6G8+shVCYzaLLbnbqZk4j9Rnq8EJPuy1zR
	 MwQMbE0Y+KkSY3jaEnhU4cQBTXlHYXslfGeTMlMyMDWreNa05VXBZH9QbsKsB0TpHLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=XHjrS7sS;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38033606A32C
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 20:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38033606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=XHjrS7sS
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5ea969fafeeso1206173e0c.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 12:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794860005; x=1795464805; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BDGAdzVguqNy0JEZoxyPcMqb3hE97RGPZcChbfGjrxc=;
        b=XHjrS7sSi2aqtED+FVb0XnW5wGyB8px/TKyLxVErtD3ox/FRWwyDCJ7jml5uSMAvu4
         uU/iCNmdaNfMlSE0iz4MepKlSU1k4cdIi3KFDdQeK1xdRJ1i+2Di3a88QzJVc8TpT2eU
         p/0jI2fPQPmmmIkwmqi64abnaQSYKKoMVxWMyiP3dppxD6JK8DSfpQGHQwFKPB/5nFs5
         vasUkWbpzxx0i/SQDIQSGqXcpdrdkYswa4fLsdD2xSOxtGPrjqjbyY/Y8zdJFuE5sW3t
         olWQIO/RWE/whXGhRcsoxuA73nVd+Bmr5Ikn15yXVV1wRYAIqptPFchxhczFTLu04ihn
         RDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794860005; x=1795464805;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BDGAdzVguqNy0JEZoxyPcMqb3hE97RGPZcChbfGjrxc=;
        b=TJfUdW2zq2XagkYgD5s5bdiAqhW2OBJOF/qZQw34xgH1oAmEQC070QixCwKY+MDpUU
         tELEXLyKkPT8E89QfQ5com87bhhHT3QiVS1CVDI/gaSGdwsADgsz/UDUAvphTzPGw+m2
         nWPc8XdnxdRsxp+sO4XrQC1rtT6g6bEYefFVymcGxYVuj6iVIvCdLLZcAq9ugiEJ98VP
         EYQnXoTFGYYXNb1sZkqwAX+Nf3dG2jxXlDBUCzUM4pg0S65ogW3ieHdqjtu/Wo9kaY0T
         jy6PT7gQxE2j+5PExwhH9fbT0wnq7ZbVFIq+C7aWRcoaLIagmQQy/rv6B1g1akk8upMQ
         i4QA==
X-Forwarded-Encrypted: i=1; AL+hErElq+3c1qbMwkksTuBkXTSopgMQJT+l+RPh89e9x/xKFsJqiZtokTeYUno8g7OowBp7S18o0Pbw3Qc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jf42Q2bnx9kDoTMjz7S0UBQi5dDOEjv3ZGpJzqbBlxSOk66Ih
	vqfU52asp7t+8n1rNtL2Wb1017x57R7Bd/NP+f86DSN1ZplmVpDr83ApcaVuBTSzAj8=
X-Gm-Gg: AYBFou1Yb7bDBjec5FtqWA17WuWcFpRa03r4AoS6j/7Q8GVyoiesS99ZHUG/5pOPg7c
	UTtTB3rbsHBXTMQ9HwS5dPIwNJvuhpsF3Mzwi5I6V4csSsYvQDAN6LH5sUi8xTVDAzfwGdK9ocf
	++4mLtjU8r1U3DpNm4AjQoENdx7ZTCKH8/d6yq+jlhZX2JqyoTG9jpWrrACVQqD3zDPZAhYRWNZ
	iNOWRWoeAXiZkjxOcmOoMUVt0ngPIQEhdNvFmrmBgXK4Q7DH+3++A6XhE5cCDwtYTqB5V3fql/W
	Js84nBWQtNzcVIFKIXxb+ljH9IdgTiJRQ0mB9EZVs14uCGPqmOwckzY+l5MZkk9nip0jsmmLz9b
	fJ9rtJtUglWrYc2ZGAnRt5lwglX8fEx1CZDZLxzWDDIlskClsl8hEnz6l8ZNV0/PNSz8go1sscU
	Mq2kte0XBkxfYxgfoN6R6V1cu+b9U0LdXHSTd/9jRFfk8Si9rJNJ0DrXVaaz0fhI6N1KhBboz0D
	cvaYGgjTSQfATFq2XAst9Cw/aJtHveJT6HQMNAwrp71hS8k7/dSfVSgB4irPqPLB/ajMWNjwfRf
	6cS4DMuA9Pf5RW9tD02/EJKZEwfw5ZayLPq6W05Zh4sHtKJ15cKio4KXWCk06mbeL+5piY9POrW
	XmWC39xS9Bo76rbvCoenGJ7MasOvsBqiFuNwoq9R8a8ZNiGD6RLTV
X-Received: by 2002:a05:6122:3c4b:b0:5ea:389c:51fe with SMTP id 71dfb90a1353d-5ee34aa9574mr3361794e0c.17.1794860005139;
        Mon, 16 Nov 2026 12:13:25 -0800 (PST)
Received: from localhost (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee3e031bf0sm5639266e0c.5.2026.11.16.12.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:13:24 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 15:13:23 -0500
Message-Id: <DMWWRQTLNYH6.1LJ2K5HT60LK8@soleen.com>
Cc: <kexec@lists.infradead.org>, <linux-mm@kvack.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [RFC PATCH 2/5] kho: build KHO objects into a single kho.o
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "Mike Rapoport"
 <rppt@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Alexander
 Graf" <graf@amazon.com>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Randy Dunlap" <rdunlap@infradead.org>,
 "Andrew Morton" <akpm@linux-foundation.org>, "Tarun Sahu"
 <tarunsahu@google.com>, "David Matlack" <dmatlack@google.com>, "Samiullah
 Khawaja" <skhawaja@google.com>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261116134013.1636689-1-pratyush@kernel.org>
 <20261116134013.1636689-3-pratyush@kernel.org>
In-Reply-To: <20261116134013.1636689-3-pratyush@kernel.org>

On Mon Nov 16, 2026 at 8:40 AM EST, Pratyush Yadav wrote:
> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
>
> kho_block.o is part of the KHO infrastructure, but is currently built as
> part of luo.o, which ties it to CONFIG_LIVEUPDATE.
>
> Group all KHO objects into a composite kho.o, built for
> CONFIG_KEXEC_HANDOVER, the same way the LUO objects are grouped into
> luo.o. This also gives a single place to add new KHO objects.
>
> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
> ---
>  kernel/liveupdate/Makefile | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/liveupdate/Makefile b/kernel/liveupdate/Makefile
> index d9f4694625567..bc679905ce3f2 100644
> --- a/kernel/liveupdate/Makefile
> +++ b/kernel/liveupdate/Makefile
> @@ -1,13 +1,17 @@
>  # SPDX-License-Identifier: GPL-2.0
> =20
> +kho-y :=3D								\
> +		kexec_handover.o				\
> +		kho_block.o
> +
> +kho-$(CONFIG_KEXEC_HANDOVER_DEBUGFS) +=3D kexec_handover_debugfs.o
> +
> +obj-$(CONFIG_KEXEC_HANDOVER)		+=3D kho.o
> +
>  luo-y :=3D								\
> -		kho_block.o						\
>  		luo_core.o						\
>  		luo_file.o						\
>  		luo_flb.o						\
>  		luo_session.o
> =20
> -obj-$(CONFIG_KEXEC_HANDOVER)		+=3D kexec_handover.o
> -obj-$(CONFIG_KEXEC_HANDOVER_DEBUGFS)	+=3D kexec_handover_debugfs.o
> -
>  obj-$(CONFIG_LIVEUPDATE)		+=3D luo.o

Please send it as a separate patch. I have the same change included as=20
part of the kho-ro series, but let's fix it outside of both series=20
instead as a standalone fix. Also, maybe rename kexec_handover_debugfs.c=20
to kho_debugfs.c and kexec_handover.c to kho_core.c for consistency, now=20
that they are not shared with the rest of the kexec_* files in kernel/*?

--=20
Pasha

