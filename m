Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892259;
	b=eCLOU+y7dmSx3Ij0yMSdFDG4APUXeCa3UOa6wCcTEjb1IkxGxRiHkfGGWCrNxuLtA/ag
	 IXZDUWSDtrnWRnZ2S0MHA4tvoW/nVDuBJhPTILTx96FStsUUfveZD28QVyGO35sAzuZxg
	 K3Yza/J+1zK0pRUaPFzq20rgvtQ7Uf62fhFiUdmeHjE/8gOpXHDavg8SjzzFDvQH7r0ys
	 IZwqwuo71vuRUma6+cXAxeRtRbXLXInMwW8CU4H0a3gB4YeGKICJPj0J7EibiqpqrvTjC
	 8Yx0aMb9IFF93DQy9qtCVbkhRwPoAqbmQaSihqk4DVh6iyBHZQPaszN5mznf+e/2e7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=W4gIrbBqqGETUk5+tbhvCUCWoRJurZ/AOQlfllVrCmw=;
	b=XVfXt7UvbokyQ/2dVfrHyp8GkzANoK025fhmpbzlFEjWWjL5H8x8I2mvV1F/2dByg7CU
	 g90ZpDOsCdpswh6qa6HbCjQQR7FOh0PKpOgh3qpgXbRDPGhzQqjRYfIoV8SZyypvrp6Hz
	 WXpZtz6LS87YJlZakCDZu1Z+fAB3bXgfghwLwGTUhktdy7NNJmicS1O/ZSXLlgGx2o6qs
	 ZjDIFAUHtOvYSwCgqQYZ3ZUoZUvp8L3V48gZgZYi12DlFARz18mLYTFOayxW/D915efu9
	 N4fx2jJLlGzAXaeXkJY75BBvZrTIglOQzSlbJMG3fNZj4uNsUuG2g4hwlfHM7zp80Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aopwHs8L;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD39606A31C
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 05:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD39606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aopwHs8L
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so5093681a91.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 21:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794892258; x=1795497058; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W4gIrbBqqGETUk5+tbhvCUCWoRJurZ/AOQlfllVrCmw=;
        b=aopwHs8LgRJ3mBsJaJv0DxIl2B8qllLye4JnbsuNtX1peqS7pc7cZJ4Oq7b4K4h5Tb
         ubc1TbWOgq6uRhUO8Fq/NQsV/JeYBhAkjCZiExAgSAzPZFzRK/1THZTjCwcE1xGCB/Mh
         +7MAzGFkfgV/AQyLytSOm6RuCo1yrTq8ENiO/Nc2k7Fy5I7YW0UIGd//VDa55nWFK6cu
         o8NFQp+0Vhd20qkO/0wz3WTRbdYQoLh0REBaB55tJzOPpCHEADIdOPejj1+1Hhhqtc52
         UMQ9LjOAYjgcnXr2tkeu0l3DzY11SRRJjc2ZUbKlyHlgyC+YMOMW/nI8mda3Ns9fHv7L
         6Z8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794892258; x=1795497058;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W4gIrbBqqGETUk5+tbhvCUCWoRJurZ/AOQlfllVrCmw=;
        b=qcAgKIbpriaUEgccfNBlKR2mcatoVL28XDyieieJ7AUINOisP9MMIH90cUT8xMnehA
         1SEuW/ZhPPuLFMp1G35CytGuu/oKwFQOy+0VhW5pZb8JP5LJovYRLq1FS80atTt1kaov
         RQUr3VCqBigew6XX71sWpQ4msWqvJ7E+ol2iOuax/MlzHdyJa7MOB3EZA6P+4StIkNnv
         V3BBYOnEAlX9ctqSNV3EGIcmL5K20dgDWMxlCsPOOZoI2oVeuHuV0Uv7Vncexu6Q5uaf
         dDaQYTkIEEElfP74/CoxATSagv3X+WJie4POFupzy1vSbL7V+EW6SfBciw4f/FIpdw9V
         dhJg==
X-Forwarded-Encrypted: i=1; AL+hErGT5N+HCepUOYX9bDDSsch6rVCqdnchxF4GjPAArc4mDB1+GaSyUYBFEhSynM7/bnE6J3QCCQz5mbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GCkQSwHChmruysrz3cCwBQwcMX7nh+8ivZ0gWxSpr/1oWYYgj
	opHEqNWjJpb/r0FOvFIyLNmjPFybpT1G2cO4CuehFUzIv0hrPXhZE2EG
X-Gm-Gg: AZFdTZek3EEaquQvWOuoJAkHu/3GQ0EgXZk4jUgX1fGzTYZhZx8LdPRYmu6vo2LopZV
	VhZfqLDE9Ie1dags7h6XHCEgV/DphrLN6u2RioLLOSjutCQ/EmG63h+OroUi2SCApzCfJxxH7UN
	QfyJ2P60wHjk86fLMGfXBg+e4li8/ujR+dYLzvuuEVnuOmJvXXNx8GlLr7Le9f55WRNBOxT8wWn
	GeF5OaZrBdpWCX+e7BK+y0TMnXZaok2DkjChMb0mgZAD0ThkSS9Uh3uee7EDQ+mdCu1sB25VM8F
	hPnd30m653+zS1gs/A9hl5Ad8+okhQy46knJcV8BSv85su2ubvEnjcbNzlweGN8J7f/42wIjDQg
	MxsFezJjcDFMyELjVx7/0NJbJuWjowZDlu+V/gZdFQr4RolJg0AYqAunfufu99eK83NY4o3oxI5
	hZ0TITU4p9KkmqqOVRVgO3QqjrTll/2pxcSWjLmTOHYUv9+tXzucZRolaJfgPBDYjogiLryqOW5
	dlLUiSPn6ekIgD/QvIcSPjme2DmEa41NA9QvaObEBqvX+Nh2aKvstlVHSWFNlN8vBN6k/Q1/vgj
	o4m6vbKO9Omi9+eYfyv8nfNojQ0cSKAqS6V0Nf1tGPys1kbBB1ITW2fdM8iP31spmeq6UEmB3rC
	XVFapSVDtwJmg7VnG/z/VJvvlWmQwJWtn6A==
X-Received: by 2002:a17:90b:2749:b0:3ac:7c52:fae5 with SMTP id 98e67ed59e1d1-3b1b0cfd813mr12141538a91.50.1794892258359;
        Mon, 16 Nov 2026 21:10:58 -0800 (PST)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde0e3277d1sm828308a12.17.2026.11.16.21.10.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 21:10:57 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 05:10:57 +0000
Message-Id: <DMX87BV331FW.XJL0Y10TBDO2@gmail.com>
Cc: <rhkrqnwk98@gmail.com>, <daniel@iogearbox.net>, <andrii@kernel.org>,
 <eddyz87@gmail.com>, <memxor@gmail.com>, <martin.lau@linux.dev>,
 <song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
 <john.fastabend@gmail.com>, <corbet@lwn.net>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH bpf-next 1/2] Documentation/bpf: Update sockmap docs for
 mutation restrictions
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Ahmad Wicaksono" <supersonix03@gmail.com>, <bpf@vger.kernel.org>
In-Reply-To: <20261114170117.196552-2-supersonix03@gmail.com>
References: <20261114170117.196552-1-supersonix03@gmail.com> <20261114170117.196552-2-supersonix03@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, Nov 14, 2026 at 09:01 AM Ahmad Wicaksono <supersonix03@gmail.com> wrote:
> +.. note::
> +	The verifier only accepts this helper on a sockmap or sockhash from
> +	``BPF_PROG_TYPE_SK_REUSEPORT`` and ``BPF_PROG_TYPE_SK_LOOKUP``
> +	programs, and from ``BPF_PROG_TYPE_TRACING`` programs attached as
> +	``BPF_TRACE_ITER``. Other program types, such as tc, XDP,

This already not accurate after Michal's series narrowed BPF_TRACE_ITER to iter/sockmap:
https://lore.kernel.org/bpf/20261107-sockmap-update-limit-iter-v3-2-7c0bad1ad036@rbox.co/

Pls wait for bpf tree to make it to bpf-next and resend keeping acks.

pw-bot: cr
