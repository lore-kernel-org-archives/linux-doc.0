Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794681955;
	b=eAAaXSG0OesgNT/RVeowIUrRPu9+JoYeuFgCVqjeTKr2Y5EKFvEevmq0P1QrY94dmEdY
	 J8ZmBV/dbiHIfKGs+HMk5AA7eHVF2eUGXwIdVlcZ5ZEnGLURBjXbplGcE6Lj2K1qk7/OQ
	 Yi7SpeICHSjXvxhNOwWRAwO7wyQqyCYsjQ3CWgd9HTt4Nuas/hguY+vZZTHOt20mmFK65
	 XQepxqXZxWvFbGD4fEQMrcziu0eOLOQpkpGVETAoQLYxn4r7XsresvYcK/tLYiC8XvhEJ
	 HiiVVAJ/ocGWVc5KA8cbEjmc5CS9B6QdaiLPorzts8jpwyR5JlyIlQE8VmWR7KfB+vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794681955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=mhjMuwlcmmA6xmnk85ku3gy5AP9/nFkfmboSqD/BPaw=;
	b=mEJSnicOVsOzD5awopIPe1uTxA3m2c41QAR23UNIzh6GSovUdIjQoaUB8dMOTZl2VWk7
	 oNYY3iRON0Y7cSmkfpDbfdqRnVROGaUzv8sjKCS9WZZNh0Sai/l20hB9ZM1B24HNYXvVp
	 vZZNdOifIiVoNITv+6uchTnUYNl4BV37/ymXHDeKsh4ealuaTo1jRMhWyKeOLN7bDKBcl
	 uMAiE0tJH0VsCF/P08G9Do2TMb30ytg4p3EImKhlKkojt/JVmdAPhJqqqgX3D/ecUldGq
	 dt3PUqi/F/l478w9oZZMZUNEl5Pk5lU8LGMhAC88dgBsZ/Wvto/DbM2QhXRX0koGpag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUeDpqG+;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95D5606A331
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 18:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B95D5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUeDpqG+
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91ea0c05c92so35752406d6.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 10:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794681954; x=1795286754; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mhjMuwlcmmA6xmnk85ku3gy5AP9/nFkfmboSqD/BPaw=;
        b=JUeDpqG++mf++7m4owPYQY97vDM1BdXIWpPWR9xMWUZo/jdQTQsMwApPcqakMIy9T4
         bxBTvAMMz8cKj90Y6hp8UVgQ08iHpVMTDGMkUDTTZhVtpCSlyDuLv23ZnhonAuYDQgX8
         oKPmJkcSN/LwL2vss6NxVKCVeiDgu6Jb9i1asyhayqdGhm3Z2qCoxUSeMlF0vthK2ck5
         xAz0/N+HElRMTaHFWZq2OAQvjEq5u87HjKalMvOkcw0cuyITO7+1Q1tMelM41VswOSma
         eUXZCNlTSp9PzhYqOD42jYE7WEurOcBwmyk9tMnP0YI2OkSYeC7Oqkb+p2tb0NKGtJCS
         ZZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794681954; x=1795286754;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mhjMuwlcmmA6xmnk85ku3gy5AP9/nFkfmboSqD/BPaw=;
        b=Fq8BqHtl7bt7ugOq5f0veesCo49PWUlTjLueTPH/5+Ano2MuOyqHbvdjCiTXHtzwYv
         L51Z3ir/0hMjiAXtt2xue+2w6peWO3cChMPzOrUN3/m59nmiYy9m0Psc0ZB6gXoI5iXk
         yGwvTMQEeqCpMEy5D5jx7k/xSrlmqPUR92hg/UkEs2H3W1faHMdKqCJUjzayI69KNDL1
         d+OVQpnnQp1gkke1ofgCredy8MbR8mTlenr9qIFlGuw39TADuQG0alb42IGcIbNtk8K1
         8Ztu3ytQQRY3fXFb2EIyxU56fpmBioZhVqdfxcTvota4mMm364rx/kZXrSJ2RXYIHGjr
         KFGA==
X-Forwarded-Encrypted: i=1; AL+hErEpmymcH6LA8CyAkWaYnaLwRbRDprWRFl6f/tiMMqj20osIXz+gHu+5hMzXfk38dfIbJ4n/GU3aHtQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sP3mer4lpuMuLvWmVR3ME8Wh3SwjWQaauOFLwidScfO+lOf3X
	KtuqQjp1aapWpAjz6VpUfBgV2hplOZPZ4E83TW8tNTY6QvDJNFR6I572
X-Gm-Gg: AYBFou3wRv3/TtIsGNFgFgPugxlJB2Fto7bRyLxSbVfXjCCt3y9c4oMmkEMGFoHhJuv
	fz3Gduh0KLr9CWpDu4DWtMZdFO2qRw/gwsIaRO55aVduaWhxQFdlPj6E4W6oja4ayS1P9IQrE2p
	L51bO1KLs2+bIrho2WIHNMexFizPLGXClqpqlikIU48poBuoBj2qsAzcKDX2GbHCQQ+5PD71i9W
	NlifzkkLTkQiqncBczZcOlJk90qq7CWOJIm+OhR+NSs9dDnF9vyufJWYnSOVf4qkCf4JqLX9myh
	MBVkQ4TIDBB2Cw6oBTEOGOpOZ7hUYze15csg5fWzIIHyDtUNBh/nM74FH/Q4gnJPZS55JJNxbjz
	S7Ey1iFJHFo2vLJ+nwpq6s5W9dwZiKphxGoLUhVNBr01NLQsqNCxiV1kFKjkdPi76gsvwFhgCSi
	j/FtdidpksotxnPv6hDWZXsV38N6/qdywDLfXuIh4EKweehTaRVd1Muq1IPXJEoCmIIAIfC7onp
	z7ixd5vQmIjKOIwdvwz8SIIl0heZizrrYWcaXbqRBF4JF8BCZKJfi8S8JOj4ZS9IOYM64WB2kol
	Ur7Ajn/nn11U9hcam4JSOPweQ4xQ2CxIk4wtySmwvzWEznSa0U7jBWGTAvU9KLADal8ScVUwpnp
	BxhuPfMiuMGOWdaWawnWF3O/Em4zqKO5+TA==
X-Received: by 2002:a05:620a:25c6:b0:93f:1936:b229 with SMTP id af79cd13be357-9494bbfe4ecmr937435085a.77.1794681953514;
        Sat, 14 Nov 2026 10:45:53 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9495a5ef5c4sm338706085a.6.2026.11.14.10.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 10:45:52 -0800 (PST)
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
Date: Sat, 14 Nov 2026 18:45:49 +0000
Message-Id: <DMV5NLOEYFGF.C7ITHCRCNA7P@gmail.com>
To: "Michal Luczaj" <mhal@rbox.co>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>, "John
 Fastabend" <john.fastabend@gmail.com>, "Eric Dumazet"
 <edumazet@kernel.org>, "Kuniyuki Iwashima" <kuniyu@google.com>, "Paolo
 Abeni" <pabeni@redhat.com>, "Willem de Bruijn" <willemb@google.com>, "Jakub
 Sitnicki" <jakub@cloudflare.com>, "Jiayuan Chen" <jiayuan.chen@linux.dev>,
 "David S. Miller" <davem@davemloft.net>, "Jakub Kicinski"
 <kuba@kernel.org>, "Simon Horman" <horms@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Stanislav Fomichev" <sdf@fomichev.me>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
Subject: Re: [PATCH bpf-next v3 0/8] bpf, sockmap: Restrict iter-context
 sockmap updates to sockmap iterators
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261107-sockmap-update-limit-iter-v3-0-7c0bad1ad036@rbox.co>
In-Reply-To: <20261107-sockmap-update-limit-iter-v3-0-7c0bad1ad036@rbox.co>

On Sat Nov 7, 2026 at 5:58 PM UTC, Michal Luczaj wrote:
> Follow-up to Sashiko's report [1] and the decision to restrict which
> iterator may perform sockmap updates [2]. Series started short: remove
> about-to-be-stale test, restrict updates, add a negative test. Then it
> expanded: mark bpf_iter__sockmap::sk as PTR_TRUSTED, restrict
> bpf_sock_destroy() callers to iter/{tcp,udp}, few little tweaks.
>
> [1]: https://msgid.link/20260626205814.BAC3C1F000E9@smtp.kernel.org
> [2]: https://msgid.link/87echn2fhd.fsf@cloudflare.com
>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> ---
> Changes in v3:
> - Drop RFC prefix
> - Update bpf_iter_reg::feature docs
> - Fix tcp_request_sock BTF build error
> - Restrict allowed callers of bpf_sock_destroy() to iter/{tcp,udp} (Alexe=
i)
> - Link to v2: https://patch.msgid.link/20261102-sockmap-update-limit-iter=
-v2-0-e96a63c43b39@rbox.co

Sorry for the delay. Applied.
