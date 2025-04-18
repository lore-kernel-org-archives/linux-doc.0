Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C3B2147FC
	for <linux-doc@vger.kernel.org>; Fri, 18 Apr 2025 16:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744992817; cv=none; b=Qce4F2pnYFSoKygf3cDN25PfeUIckuWNZbloF0AleO4Jv9d9jSthEQsBp4Fc0prIuVhiw1Ab5EbAhTQed9c+whyx1gAGsDyG1wIBwu7AZ8cE3gCuVmJxfSXyNGjN794yvRN/o/TsreZhPfN2WrxxwVB/g0BJyYbr0IowaFbGXks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744992817; c=relaxed/simple;
	bh=dnPlx1v/5+9ztyxM4DD3uu2rXOji5rsQEo270rydr7I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IFMsTptpUX8paaT14Cj0z+Jzq6WVv38dAIMrR4rsZUL/gQih1Ohr/YwyYNKwhzMWYWR5nKGBucOK/6Rq7H5YOS/SWf6gGYpqpv+hOcYK9tR3RiBf4tneyN28pKhahnxqC0ozVUf/EcNpjxPsg6NTcn0DHKh0W/YiYkgPlFKFVA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=QaT3PONR; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="QaT3PONR"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac7bd86f637so584288066b.1
        for <linux-doc@vger.kernel.org>; Fri, 18 Apr 2025 09:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1744992813; x=1745597613; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dnPlx1v/5+9ztyxM4DD3uu2rXOji5rsQEo270rydr7I=;
        b=QaT3PONRArsY3lLNVeDHfsE4UhO014kmIrTkSySDTiTJP7iFtTJyvR2447yF6y5lKF
         ulPWpPmzKAB8TuHdfWNprw0fCGljGVYNKNVSPOxB8nqhHaE2ysaYPC8NjpX7Hn0tOj0Q
         hi3WDjmr/8XFEqtt9NqG+yO/ko1ceBNf+4eXuFXqzHFHCOxivcBixorgyMzB1AgWp3PX
         m5cqqTnz0HTMAEzNsyB/+iO1iJurK6T8GglOuGzIOj4tEduqWiFyBmOuWLEOETtopxN1
         OrNAbA7tAr+txv7ZCFLwmXxVlB3RKNj6AwnFEQE2bhFdwxhAmpPD1ZDcgTnZeX6R0lqu
         fDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744992813; x=1745597613;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnPlx1v/5+9ztyxM4DD3uu2rXOji5rsQEo270rydr7I=;
        b=rGBk1sODNJMNLLQ7CWHsIW4L5PZjvHmSUyfs8MeBESKyzuF/BwpQ1fIflkBXphK/CO
         9KiK1/HPHP9/WoLxZdZ+h3AIwgOxjorC1+ch+o8NJG6ZQinCJEwypFLa0c94Okt3J0A/
         4F0LXL3CPGm2m4eL0kG8zcEYlSLwpH7Co1uTMbzoH8A6FJGZgnneg53v/vvZNxh6kjfv
         tQVwvCneGDh4O/2/upmkvRDn3yXi4X8cRC5Qv8GCjnuJjvZdH4nkxXI5aiECS+XmQBR/
         pjzC5hu27BGH7g3JkVh/32j60J04wdO8LgDwaC6tRD4sx1GncLgCivSU8CPF6Ar7Vyxv
         sLuA==
X-Forwarded-Encrypted: i=1; AJvYcCUAUOKp+HhW84tNyzRsJ2KJ19eTZjNNvF5+k8rnTP4ci968cQ4Tn5/9kZ2L8qmYCZe79Je71uymFNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQs3g4ami/Q+aNQF5Cadl6zq4pw2wALTcp08/kWkegZ6fmJ3WZ
	SRrK8XcxD/v6XCG0stxUDXpko9lnJ8bFzi92jH88lXY5gqVUBDQG1H9PgtGxUHg=
X-Gm-Gg: ASbGncvGq0qEYK1XWAaM1wOQspMMm+Nwb/G0b3NscuorTMXhqVOeSkDfsDi+NzsuAQF
	ZAGyCntbxQv1JY5IyauvYg/C61wJs11LvcrW/WDmOgCAynUtc6Iga8lh3mKLxdX3mBzC3qCdTrg
	7nqsLUevH9rTwZsypXdoQ4hBRr1ecfhK0fnzeshuMKZ07ruixQe6P+gnNOx0msKZNBh6/8khmMt
	BS0QBlPW3araQOMzNClqFzW+HlA2A2rrIHV3o/LMlCqMyfUbr4+P5O1SPfjWTQbU731MBRgWE/t
	Bw1ro5o9Wlnp14oM31/tKGA9UNRmHtLqzQ==
X-Google-Smtp-Source: AGHT+IFLgbP7tACquxzJP1RHEXNOH/DlqDIlfnCrIa/5xv6iI7vhI+s5eVpkRTeUtU+t5K/5B3t8Fw==
X-Received: by 2002:a17:907:6e9e:b0:ac1:17fe:c74f with SMTP id a640c23a62f3a-acb7534d843mr242424666b.21.1744992813109;
        Fri, 18 Apr 2025 09:13:33 -0700 (PDT)
Received: from cloudflare.com ([2a09:bac5:506a:2387::38a:4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6eefcfb8sm137109166b.111.2025.04.18.09.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 09:13:32 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: Andrii Nakryiko <andrii@kernel.org>,  Eduard Zingerman
 <eddyz87@gmail.com>,  Mykola Lysenko <mykolal@fb.com>,  Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>,  Martin KaFai
 Lau <martin.lau@linux.dev>,  Song Liu <song@kernel.org>,  Yonghong Song
 <yonghong.song@linux.dev>,  John Fastabend <john.fastabend@gmail.com>,  KP
 Singh <kpsingh@kernel.org>,  Stanislav Fomichev <sdf@fomichev.me>,  Hao
 Luo <haoluo@google.com>,  Jiri Olsa <jolsa@kernel.org>,  Shuah Khan
 <shuah@kernel.org>,  Jonathan Corbet <corbet@lwn.net>,
  bpf@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 3/9] selftests/bpf: Add u32()/u64() to
 sockmap_helpers
In-Reply-To: <20250411-selftests-sockmap-redir-v2-3-5f9b018d6704@rbox.co>
	(Michal Luczaj's message of "Fri, 11 Apr 2025 13:32:39 +0200")
References: <20250411-selftests-sockmap-redir-v2-0-5f9b018d6704@rbox.co>
	<20250411-selftests-sockmap-redir-v2-3-5f9b018d6704@rbox.co>
Date: Fri, 18 Apr 2025 18:13:30 +0200
Message-ID: <87cyd9a1n9.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Apr 11, 2025 at 01:32 PM +02, Michal Luczaj wrote:
> Add integer wrappers for convenient sockmap usage.
>
> While there, fix misaligned trailing slashes.
>
> Suggested-by: Jakub Sitnicki <jakub@cloudflare.com>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> ---

Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
