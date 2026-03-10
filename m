Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4C842F541
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 08:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132764; cv=pass; b=hG+G6cJ9gQpzR8kb+jJzPyKvq8BWEroPWbWWdo7MmgkebkdG3z4sE5ZAL5cvpWZO4Mde6RtA93E96b/d+iiHdNkqvChB98m8AXoLziBAyzgvXokAfW+BYrOJheCyy+XfFKY1kPGkCo6fUdF8VivPD2OQrXOKaw3fZ6kqhY6R1ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132764; c=relaxed/simple;
	bh=GWZ/M5s5NCER/oau2EA9WTqeml+PkjCSZzT7Gq/KoYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=taiiAevfVFT5ctjIjYT7knLpWAByTZgJ/5Nv+J464+wfKpriUL8VXRaIdpSneJ71Ce7ZSyJhPtyU4oDn3VRSQnuT8bLaAhhFDW4xXfRodKfn1lxDPmShJiuZ1FDudn0n5RGXaSuMfQNAPUf8tkqzOr1I+6w7qb70ZrPMKw2q3aM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uArXlFKp; arc=pass smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uArXlFKp"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-899ee491af3so94866816d6.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 01:52:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773132761; cv=none;
        d=google.com; s=arc-20240605;
        b=YUZ7avt13c5MyeoYO3PuoqSUsTdr23V+XHOmo1CK1/Bg7r9J9W4zqmH83ZQ/Vx9A4Y
         Y22PegjykPHVaqf4cPuB/kzA80cRB3rKOF3socGsAQXkKAviT1HnVGhLdyxV6s6g/xnO
         N/RuxDPXKZ6ySu+pS0LHczjDTiYY7/gzWzGGjZHBjBg14PFqkISUUpkzDck3DfqvYyE/
         T2JHEjeOEkQ7z1ebXsB4fP717THvU1XTp7mRSwJl5plZwYJ5Us9Vm9To/57QtrsDA4VQ
         xhuJjV0ih3mcFJmow815wqfIYi6sWu4gdVnFH3MWSXvS4e4ne3suJ+xbcicWtVo15UvC
         WSoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GWZ/M5s5NCER/oau2EA9WTqeml+PkjCSZzT7Gq/KoYs=;
        fh=g7Lcopz1LRjFjjmG06ZuDNMrNif68PeU9mTrJlZRSc4=;
        b=ODfjL1Gd1Aj74KTIRTa5QIt2lI4TAUcWNus9NKEC42hxChDljMm7reR3hNO/PNFIBh
         GSl43AZxDEnzhkijPQFuj4iglk7qY7wvgZnPROAUk0vsOQ8tARIga0RolMCEYIdWeW65
         XPIbmo7ZKk47jFzpbgXNSZMBwe5URRJMgnBLY1p8GGF6gxNS1HGgjcSy3bZY0xyVAqJj
         1eP32Q9jNFCDph3AWalzgKLrp6qkU1XczGPNG8MEymlLRnrnIY97MeISfx1+mXchOXIi
         tVs+KewWr28gaFSJkSvy98kzO30y2LryoqrdPFaot0HWZjG9OCBD1DHXxqzEcLO/zDAL
         Dz/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773132761; x=1773737561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWZ/M5s5NCER/oau2EA9WTqeml+PkjCSZzT7Gq/KoYs=;
        b=uArXlFKpdXlqKPjE09U/NpdesuwQWpbUrVISvbyzCV4L1AsHSXzQj0MCjt+cEt0VVj
         aqllWlGYfzBJMDKNsx8vLDQIK3/6XdLfDKM7ZKU2Djjt38uerxPm3YWuj6a686q4OB3Z
         0rDYPe0yCHGSq7E6y/cvMiET3Iguvl3FjTULft16Jd3SY/LyFUSkuVzXHIQ5odvTVV9g
         HUk5FbFqsZMD4uXraYuht1pWk40p6xhEroXzSuOUOT6y2liU0wRgbznY2/UznsuQ8W0j
         AizbepEM1kyGcW2r7d2sGynwX05yn9UhQFqz1tciVFGjYc54X59UA2Ai02fQySDhRtSz
         J1+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773132761; x=1773737561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GWZ/M5s5NCER/oau2EA9WTqeml+PkjCSZzT7Gq/KoYs=;
        b=d7FkTFl4pKEVOfs7X/dhOJ+Jfb0edo+YEua/FUaBnCwVLQperLbTw5NNJOIZkCF0I5
         xS7HFL3ihn+rISURdyl+hGW4pPOSxeRSM619TCv2utTmr9bODbVMoTjMLGMIUvWT8HLK
         Lhb/ddHHEXzQvl7fhY8wpyLxc54VXKVVHedms94koNjOYmZIg2JfIA4V3PfPq+h5rAER
         jBhnK9Q8J1F1XHWgVisj9fcNvuU48hqxOQlTKtYJmxUER8vngmwHkOtsK0ybXMS4Hd/A
         Rm0L29BlTkZE6RbQFF62YS6sq3TyhQXLziV6EA8lIjz7L0B9pW1i+6c850uk1LDXDjdQ
         KHzg==
X-Forwarded-Encrypted: i=1; AJvYcCUFOip5FJegVXrC1Jlzhbn5Cwvma1v/JWKYHjcd2JgL3FRo2E4EgKr/xKHYBOi5xObb1g+SzN2GXzY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza7S2LwOS5m4Zn0fH3vfG/x7f5I0Vtsi0u4aCGF3ioDT9zYXPG
	jKm1xRINKwvg9+rfMHKO2XT2wdNDskxDIiTh6MQ4SwVJK1812lx3ILES2MlybE1p1sfSB/2b0YE
	qvvpJr0BMvJ6BxOuqbA38+qcxafxhyhVu2TfMVIqU
X-Gm-Gg: ATEYQzybKNL9fAxbdUuZWpWVKwV8yxLRMmuXz+T7KyRmX8N+LTersZ0Dt38f38DYRgN
	dS3GZJlTjHn4q2eATeYPUgb/0z/zijhf9app04xtiSyblOhkcjK7u7InnoMhQAqGzEdiJPmUCZj
	BVj4oJD07RtkHe7U3ifvyhBEnzAMdletYB2PdzMV7lYBrKG2aPQEN7X0D2qEmTX4IUPJnnBByHe
	sY3lL9Om+WU7L3SvRm7E+ifEZx0z1WbEkGPWKwjRhMAl7AWNenFoTCNx5HjcIAPP5cE2MJ5FYlP
	sBg55wg=
X-Received: by 2002:a05:622a:1495:b0:509:f36:496d with SMTP id
 d75a77b69052e-5090f364cfemr113018421cf.33.1773132761084; Tue, 10 Mar 2026
 01:52:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com> <20260309-tcp_rfc7323_retract_wnd_rfc-v3-5-4c7f96b1ec69@gmail.com>
In-Reply-To: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-5-4c7f96b1ec69@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 10 Mar 2026 09:52:29 +0100
X-Gm-Features: AaiRm53cOsmiV2tykYX4dD4wvI_-2esZ5FOIQTDvQaaas49mugfLK5wzrAfT4QA
Message-ID: <CANn89iJCR+nO6ZdggkCGACfQ-Tbru1nq3_q8q4QTp93faoCPug@mail.gmail.com>
Subject: Re: [PATCH net-next v3 5/6] selftests/net: packetdrill: add tcp_rcv_wnd_shrink_allowed.pkt
To: gmbnomis@gmail.com
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Ahern <dsahern@kernel.org>, 
	Jon Maloy <jmaloy@redhat.com>, Jason Xing <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com, 
	Shuah Khan <shuah@kernel.org>, Stefano Brivio <sbrivio@redhat.com>, 
	Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>, 
	Geliang Tang <geliang@kernel.org>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	mptcp@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 9:03=E2=80=AFAM Simon Baatz via B4 Relay
<devnull+gmbnomis.gmail.com@kernel.org> wrote:
>
> From: Simon Baatz <gmbnomis@gmail.com>
>
> This test verifies the sequence number checks using the maximum
> advertised window sequence number when net.ipv4.tcp_shrink_window
> is enabled.
>
> Signed-off-by: Simon Baatz <gmbnomis@gmail.com>
> ---

Reviewed-by: Eric Dumazet <edumazet@google.com>
