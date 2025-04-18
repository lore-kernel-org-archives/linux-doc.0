Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972A184A3E
	for <linux-doc@vger.kernel.org>; Fri, 18 Apr 2025 16:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744992432; cv=none; b=UD7UQJRx+kSlAxeLU3eX3mS4VB9gXQWDQXOF3/iZHXjuoNdX9s4L8+wV4C+tqFJF8sBiDRti7IOhXSqlSiXaMLJk9m3fU5Nx5ol4j7EcmkkOMBWW/UsDEvLUwWdTlhba6mXEpKUp0fX4awnxi9rD7XWVWollg2IBG6x5ixwdKAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744992432; c=relaxed/simple;
	bh=mJDJYr7lVaC8wf49jlEbGffCUgODVQ8wlaVjxXpd9NU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bE6OKNmmCzgppeC5KS29eD2XqUjEy8/JxpsBsqFABzHzH5cVww99cEkrIOh6s4Hwlf2v1nYVSL6XchYgMPii+L+x1pxOseETpJm7sSDCtY7aDNF7Zh9Db93u8h+cjrPGSdE/ATki85lOYskZ0ut1CRB2jCEnWss2NwBbIbaUvX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=f4qIYwQc; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="f4qIYwQc"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aca99fc253bso309375866b.0
        for <linux-doc@vger.kernel.org>; Fri, 18 Apr 2025 09:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1744992428; x=1745597228; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mJDJYr7lVaC8wf49jlEbGffCUgODVQ8wlaVjxXpd9NU=;
        b=f4qIYwQcWNfstcEj05cGQ6wxM6ZVHkbgt2n8qZ3xy5J5HxdCEqKcsnWGOZrvjMRT1I
         a6x2Ko6aVbvtiDzRGEveqOi3v3ciEG31INr1o/O9VkwlPy25yYLK/r3zEnym7lgzP9aD
         is4fHwXQupWP7/coXFHK0uFfKSHeW9hVADg8zEl5GYHN0ev3XCBzYEhH8lUOkQstrF4T
         nRq/kdKQWdJ41TEiznqhRPugV1fNG+ZDBu49p+5mF4z+6WaQdtcNVrn9WOOit/OikQ+T
         rjw4SxM5scU7cbvD8Z8icpnZgetRXCbk/LMlWNfnhA/dozN2T3PTUEzN+r5BI+hBfDvR
         PRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744992428; x=1745597228;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJDJYr7lVaC8wf49jlEbGffCUgODVQ8wlaVjxXpd9NU=;
        b=RD1bH0igYDHwS9uOUhWetcLmkxGg0YCcjNB5eSb6T0umGbPRljdTJvCr4SdgqMC3WY
         oviNwxMKnWFCjZasoUDzXHLpRl5Ghl3PByIjqARK3Ws2cYz2pM8PsLbPUOZ4gAdDboGu
         pSqVLPMbPQxlT9I31FB8pGHQzE9v4IY/E3lmkUso0B5GKR634VnpPqCFxj59M/T3QPoR
         ++TzcMaFhOivdokrJKXIoRUQPvbpcWdmUKT4Q7VvOFOgn7ko169K16H39tvGQD6cpmBY
         mznEU33J1TgWd/KF8QVPwFqdtm6I+44RAXIeqWP6bYi3Gsi4rGXwH05l3U76EtgjG7D8
         T5Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXByA2lbeBfE+CeAPfuhZ/3u/fdoBn/kE0Waw64Jf+kwnQH+PAL0WJxpOdf05n051PQO6Ka9YZXvL8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2X3EylCUVFHU6XeI5jDZlZDFGaJLRCmRbJblWRH4K96ZBDZ9U
	5RjLADrl2wZQ1UNR1Tsxpom9z0vz7XTsEiru2zZ3Zy3oEvDahpO533JxIP7Lae8=
X-Gm-Gg: ASbGncvxaQq5r3A9+UhCOcNHWQutvxNUti760TyqSAsX9wQpG6fVuftqxYc/kiGZbdv
	Noy4ODkuCdtNOix7dHvfhowlG8NM+yt05xyoSMsf0s0/opbJt+8xB/rgKNLFBYUZK0iFYxjxIk8
	6prTLDiS9rB4EZgfXrVtkXDPrZ4Ik5eoLhpNTcL3AL31cEmArcMocRESx0i3Y6PfrP5/vQcmkzZ
	l2k6EtClxocDmYOHyLbbQxLdZKKeLdyOyuhjMe3tLmhwxA4hJUdIPj1NnXhpzpSsxjYZY80H1uu
	0v80IopJgAilxs+ZUwCBWO5eySuqw2jQWQ==
X-Google-Smtp-Source: AGHT+IGA0mJvYWhzAc0oNHZeKO+KGsF+25BJMfzQI0JM3A/aTXEi+UCjUxCGApuU0msTc2ARl0raKw==
X-Received: by 2002:a17:907:1b22:b0:aca:c6db:2586 with SMTP id a640c23a62f3a-acb74b18d90mr295654566b.14.1744992427833;
        Fri, 18 Apr 2025 09:07:07 -0700 (PDT)
Received: from cloudflare.com ([2a09:bac5:506a:2387::38a:4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec10011sm139200266b.14.2025.04.18.09.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 09:07:07 -0700 (PDT)
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
Subject: Re: [PATCH bpf-next v2 1/9] selftests/bpf: Support af_unix
 SOCK_DGRAM socket pair creation
In-Reply-To: <20250411-selftests-sockmap-redir-v2-1-5f9b018d6704@rbox.co>
	(Michal Luczaj's message of "Fri, 11 Apr 2025 13:32:37 +0200")
References: <20250411-selftests-sockmap-redir-v2-0-5f9b018d6704@rbox.co>
	<20250411-selftests-sockmap-redir-v2-1-5f9b018d6704@rbox.co>
Date: Fri, 18 Apr 2025 18:07:05 +0200
Message-ID: <87ldrxa1xy.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Apr 11, 2025 at 01:32 PM +02, Michal Luczaj wrote:
> Handle af_unix in init_addr_loopback(). For pair creation, bind() the peer
> socket to make SOCK_DGRAM connect() happy.
>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> ---

Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
