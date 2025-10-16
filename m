Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04BE32861F
	for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 10:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760609311; cv=none; b=IP1jdtgm3lrWDVpagqRmlVCGl60LUdNVMiqSeA2FDXQjkpwqkkbjSGqElX4ymgNG3OhGXcb1vjGOkm741NYqItkQYRlmmt89N/Wh+Dlv3HnqvjWe6G2ItHn11JW2HIeI7fxX26vsku/YUG+fyWez0K9WJNbyQJtaCfjou9/FB2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760609311; c=relaxed/simple;
	bh=iAG+Qsr3wjzsEn7xPqBjjdvU8mNrEK01RZVMASCmXJQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k+KqVJFq3yXR38YD+QNwsn03pXkYW2ewCl8826bGPnZRpGh47RUifNR27042BmqDB7AmXcL6aWs7mEXwbAEdM8JlV6wS6Ml+r2JwvEoiBa4679mcZEZs3TEr3qVXLIYhaiLlF+J6MLyoSQjrn7aGuMPm84UcxbtCaeRY3Ik7dZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=W0MCR+wf; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="W0MCR+wf"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b3e234fcd4bso89989766b.3
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 03:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1760609308; x=1761214108; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iAG+Qsr3wjzsEn7xPqBjjdvU8mNrEK01RZVMASCmXJQ=;
        b=W0MCR+wfDbMXdyyRrMKTp1cyLb/OBvi58u0nN3mGGm3x1GsjgovaaeHohmH2fe674L
         suOJEuM/oEB9t/cakVEC66cRGxVwJ+ewZ2Ccoch5BiQUXe1xXdPXGmDTfJZaK1VvFsDX
         tFyXidXglcCFOS3M85JwbUzAeb8MOdm6c3bFauV76tVsI3yhD3mHVIX6GiaFyxaYja37
         6b8ig5ZP2iNRYRhZjArjhMTq6hADzsGnLUx2k+mZrC43gFhj2AklD3w3nd1s7bvjivda
         9ZJP+fYDylEwa7dDYLnGtGNJx7mLO4hBdpMicRjzD3ClnGFwQDfr0vngUg5z5PgMaDAp
         0Jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760609308; x=1761214108;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iAG+Qsr3wjzsEn7xPqBjjdvU8mNrEK01RZVMASCmXJQ=;
        b=VL/c0b613XsG2UeDBWSoZehojAJNuMZnfsLM05eJZd91+jY8IK6OZDa2dsFZIQQZCa
         ASTwgDmMKNqP8eZaJf6tzzukiXMzrpr2mptkM7nxWVR2AUXI1RUFEnMcsvQc9jVsbVcS
         eTPNDdXWKAkDTr6e/DPgeBOXZDtzgkKaagqjer8POIxJ7+2OjAe95zKWWA8FJdSEFL+q
         6Rcbq8sRhXQne4VhlACdGDWxeRquKEEmCox4YxgtBYgQp2BVNrpYiuR7Y+FxaxLZY9F7
         lTBU0Onw92PWImkDt6WMAmqXlt8i3gOPqK8U2Tw4iCBN5wxqopy2JltnJtvC2IrboKiC
         KjQA==
X-Forwarded-Encrypted: i=1; AJvYcCUDg92kegJNpg/lzszdjphFlYh3r9Ts20W3FWIv905jxJ8t2qcXKNWa7KvbhP/tbC3+Vg34tUuU2GU=@vger.kernel.org
X-Gm-Message-State: AOJu0YydOsvQ3halQTLlcXokNJuHN+woeC4hQSczMqWlDNKyiW96tIjG
	K5LPcN2wWuv0U24Fi6shkxt0vB/LHnrUFfh1zteGyXfp5wmOnt9KRBm8Vkyny1ZLrOw=
X-Gm-Gg: ASbGncsQNa3J45zzzd7Y7+PCCklrPXYM/himeF6o7NZXqn0eaIffcC0vmfgW/UNQlJb
	Kodj2PDM1g7P3H0nA8au+7lMQjO1Z5ytmS/SfWPrw1ZAZDRIJONbTDUTnpKPlSW3ONvGBILnAR2
	77azaaeiImydXhUs6Sx1dcbPvbIGuxR/uIU9TrR2Vlt0o+WTFQNtdraRBGOrdMuIEH3smCZ6fvy
	jMp5OOeja4HG3oH7U8s5ls6GoOJCPKpztZpLj9r8dYiLdrm+FK8VQPIH1DPmES3wjjHRZtREA8a
	f3BzAC3erFFbimFTtesi3h0BPVwlo3uRv+p3r3x9/SHGffie0ywHZQ2uv+nGtZObk1UytbrTmQT
	7ZHYcSdOzLSr4uDQ1L2rFi/jL8rrpcEc80e1lBOEUdDsEkVqjF38tZL9sGVkk9I48Kj5HMbRAiF
	W9EUE=
X-Google-Smtp-Source: AGHT+IGVd98H8dpafuklugEXTVi3BFcPl1nZR56txXlgYEVW9BZqLRUhorikH3U8n7kBYnhkg7YyKw==
X-Received: by 2002:a17:907:7b99:b0:b3e:c7d5:4cb5 with SMTP id a640c23a62f3a-b50ac2cf67cmr3476075966b.31.1760609308113;
        Thu, 16 Oct 2025 03:08:28 -0700 (PDT)
Received: from cloudflare.com ([2a09:bac5:5063:295f::41f:32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ca4ec65f9sm471635366b.0.2025.10.16.03.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 03:08:27 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com,  edumazet@google.com,  linux-doc@vger.kernel.org,
  corbet@lwn.net,  horms@kernel.org,  dsahern@kernel.org,
  kuniyu@amazon.com,  bpf@vger.kernel.org,  netdev@vger.kernel.org,
  dave.taht@gmail.com,  jhs@mojatatu.com,  kuba@kernel.org,
  stephen@networkplumber.org,  xiyou.wangcong@gmail.com,  jiri@resnulli.us,
  davem@davemloft.net,  andrew+netdev@lunn.ch,  donald.hunter@gmail.com,
  ast@fiberby.net,  liuhangbin@gmail.com,  shuah@kernel.org,
  linux-kselftest@vger.kernel.org,  ij@kernel.org,  ncardwell@google.com,
  koen.de_schepper@nokia-bell-labs.com,  g.white@cablelabs.com,
  ingemar.s.johansson@ericsson.com,  mirja.kuehlewind@ericsson.com,
  cheshire@apple.com,  rs.ietf@gmx.at,  Jason_Livingood@comcast.com,
  vidhi_goel@apple.com
Subject: Re: [PATCH v4 net-next 00/13] AccECN protocol case handling series
In-Reply-To: <20251013170331.63539-1-chia-yu.chang@nokia-bell-labs.com>
	(chia-yu chang's message of "Mon, 13 Oct 2025 19:03:18 +0200")
References: <20251013170331.63539-1-chia-yu.chang@nokia-bell-labs.com>
Date: Thu, 16 Oct 2025 12:08:26 +0200
Message-ID: <87ldlbw44l.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Oct 13, 2025 at 07:03 PM +02, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Plesae find the v4 AccECN case handling patch series, which covers
> several excpetional case handling of Accurate ECN spec (RFC9768),
> adds new identifiers to be used by CC modules, adds ecn_delta into
> rate_sample, and keeps the ACE counter for computation, etc.

The latest draft is here, if anyone else is looking for it:

https://datatracker.ietf.org/doc/draft-ietf-tcpm-accurate-ecn/
