Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855151;
	b=VEDSEFyjUF/hggTfAlxiHNHXW9G9MXycA70mfnfTouU5HsFEKRU+o6PVWwS+oTP4T/le
	 gfLmUUJNH5MPAE/jBlw8odv8b8d7XXPUvrXbsbGBJyEazmc0WeI4nQJlWodW1mHnW4JqX
	 on4WRrqOsO6IKb2IW5iacrSf0tPQzXY79tm+2Pxm+g/OKnyor6Zv/OO40S1vYJoy9gj/U
	 0A7JSbVNa5E3iWTBn3d7oK3A22Y6M89uo8rf9/DjraWjHmlwPXGpRmo3mUkKWpyTFGM+P
	 4OHa9caHRewQj5LJ3QAtAwKe2WktKm/EWqQ0nI8ujo11JpkomSaAsqysmYVSPuTvUfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=vkfkDzRzhP/lJQHb5qA933FrYUOsdOG3Q72hhxn9rwI=;
	b=K+8xS/B3iA7SdIQL0iGydaTkWdQawcXhuOwfuKxTLpm7KV+aCdDAtyMsgtjWD7GLXXDR
	 NHEeSWvuP37bYhSk62IVgvc3MEt2FJGJ9UjbNIS1vYWtKOuMFoiVhBKw+iuFrwJgsmweC
	 +6kNvmnwaBzfl3YUAFf+dbYDTRoLzi3Ja5BSc3WoOQWQZYY4fTshsuyNts2Ny2wCgmLyb
	 yeu6Zp2ZQ6QuJ7vm3JM/Q+cuEQqC608KlDMFXlTZ4hPKwPYi7khxjd+Y3yzQViKcdOnN3
	 MCqrNTSOrGJqCLzWBcJ+b9WkPsJc/1qKWkh9iCHeobObT3j/rgw7EoKIkd6HDZYv8qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=QxeQQqeb;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EB5606A322
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 18:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6EB5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=QxeQQqeb
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1653469f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 10:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794855149; x=1795459949; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vkfkDzRzhP/lJQHb5qA933FrYUOsdOG3Q72hhxn9rwI=;
        b=QxeQQqebeJTGfj2tTnJZQKbCi1ZPDLG9fA3t2JiMbDA1JUhtGxgetQFoXlGRJ3jDKX
         BQokDR4RZFnxbjOFvoHiwsYXl7mBMUB+Sb78npVaRWD7iHbRuEhe7anB47GKi/tr67jy
         cFEcdN5nP1+bKix0Z6qEd6MZwstXq6TJlc/y7BmbQY1vyG/5z8H0hiiPGnsF1juP/7+I
         Bs3a8NTeaNMPUnlZXnx4dCznUw/bTOHTaigAFDfED4/c3u0IHwbmQNJrzs+BiAdrmiQ2
         OPQbGqRLW5uV8RMRS8B8anaCoIvdiFyjnyipEVXZEE+zw7A3EYPUqn5isjlHltPMB/bI
         S84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855149; x=1795459949;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=vkfkDzRzhP/lJQHb5qA933FrYUOsdOG3Q72hhxn9rwI=;
        b=dw3BE2S9Rmjvd30U3eLRlkNNOWZ6mRkcVtQpPBFSCj7XOQjL0iB8JdDAX/OljHy/nd
         nB67H4c9GWwvueHDw2QomTnt5U56gnIlNSZapPE63ZfH2u+r5Y5ngubQm9YrdBaB87bT
         YJWRrY4meDc3a8HZv4qCYZcs+qQs2VDgr6eIsnKs1JScQ7WwDJhQWg/pojQTCFXMhcx7
         gGvSKN5DVLykKQbImFqHZX43PPkMr3Vll1+2CJuFs9vaV3y/2GaHQCJ9YWObd6E/UV3Q
         FdchuwcHRoHDSBv7c5oX8qPL9X82hpN9Ke2q5VdFaDl0Iud8fHPIYuQfemWrWDR7N2K0
         jUYg==
X-Forwarded-Encrypted: i=1; AL+hErHSzANS1V2QqQZkUwCiJ1UTKs/oWokpetLDxXluvbnH08OsxH16P7ulQmIRJuez+S6w7fgFQ6GF4WQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KuxwSwKLU1p6N4/0xAhxIoFsLL06gjeGEEwO76MNU4PVfkwhr
	io0fjE1118gfgfYdFfXRdj7UNY7smPJwkAdM0Q6X2LYhkzWFhRYgCSgZDMg5aDLEbx0=
X-Gm-Gg: AZFdTZfKsysiz4Nwip8zaLfUQp5Ucl0HOnDCJSpGcf03bvM3MDx8vrdd3Cqh8ksymEb
	BO+wSye6EzPwUgc3WYMSqtsvTwZ07Gs9bLKnv5waY6cfaL48QZmVOl0ZqS3ZXoBixKYdJRQrhoU
	xQNR05gjGAsB1HOUdZa/gLLySAb6hhslxeExKFiOGKi3gomZDPWHMPQpNLTeNvBSdcPJQ0m+82t
	4A7qPcXpFb47uE1PNdJmguy6gejT0CfLLNFB15nHsxjj0jpXSuklcAJCFCCcsfUEzza1v0DVR9o
	EEtBGxxGO1a45gTWVLew0kgbKb2yN4iWNrUDV3I5nQZgb28Bre5Cta11fBQTHt2eeUlpRDdU9jl
	OT+NwfQHIVLU2WfXCqOae0qPS3V3wxOy/nzWy8jQeKG7bpUoPZizaWyv/zZi1saI+sDJf7i5roS
	XfRInoQySU2SRPJ6EoO8Jsw1mbbKc/E+sCloISOLm+MO+Ggcv8JKT+1QHSBMaJRjjhf4LGTxA81
	1B+AdducxGc4R8ye6A6dKqkfEk+KrCPFzYsGWsn4NZxxtVGixbDjKkxza84y3Ist7UEvrES1RXh
	+U/4GMGh2VLwC1sKqqJxBVDaTR6gik2Z9kh2CXyp
X-Received: by 2002:a05:6000:4697:b0:492:c53e:2ea8 with SMTP id ffacd0b85a97d-49c7458620emr18353879f8f.49.1794855149071;
        Mon, 16 Nov 2026 10:52:29 -0800 (PST)
Received: from cloudflare.com ([2a09:bac6:314f:191::28:17b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm23398371f8f.12.2026.11.16.10.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:52:28 -0800 (PST)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Ahmad Wicaksono <supersonix03@gmail.com>
Cc: bpf@vger.kernel.org,  rhkrqnwk98@gmail.com,  ast@kernel.org,
  daniel@iogearbox.net,  andrii@kernel.org,  eddyz87@gmail.com,
  memxor@gmail.com,  martin.lau@linux.dev,  song@kernel.org,
  yonghong.song@linux.dev,  jolsa@kernel.org,  john.fastabend@gmail.com,
  corbet@lwn.net,  linux-doc@vger.kernel.org
Subject: Re: [PATCH bpf-next 2/2] Documentation/bpf: Fix stale selftests
 file references
In-Reply-To: <20261114170117.196552-3-supersonix03@gmail.com> (Ahmad
	Wicaksono's message of "Sun, 15 Nov 2026 00:01:17 +0700")
References: <20261114170117.196552-1-supersonix03@gmail.com>
	<20261114170117.196552-3-supersonix03@gmail.com>
User-Agent: mu4e 1.14.1; emacs 30.2
Date: Mon, 16 Nov 2026 19:52:27 +0100
Message-ID: <878q2sr4lw.fsf@cloudflare.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Nov 15, 2026 at 12:01 AM +07, Ahmad Wicaksono wrote:
> Two selftests paths in the BPF docs no longer exist:
>
> map_lpm_trie.rst points at tools/testing/selftests/bpf/test_lpm_map.c,
> which was moved by commit 3e18f5f1e5a1 ("selftests/bpf: Move
> test_lpm_map.c to map_tests") and now lives at
> tools/testing/selftests/bpf/map_tests/lpm_trie_map_basic_ops.c.
>
> btf.rst points at tools/testing/selftests/bpf/test_xdp_noinline.c, which
> is now tools/testing/selftests/bpf/progs/test_xdp_noinline.c.
>
> Update both so readers can find the code.
>
> Signed-off-by: Ahmad Wicaksono <supersonix03@gmail.com>
> ---

Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
