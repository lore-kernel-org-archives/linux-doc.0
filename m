Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7793A961D
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 09:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901790; cv=pass; b=afgxwQqWKmAudvivHNENEz93/9ZrkVd31oKmlTKplNKuLOx7Q6wsr3gFZlN3Gl0k0dbf+TYNVbfWTdmLjkkP17fEh1/uo2wf11nWth86wVxZ78XdzYBMWj6c6P0xv7QH8MGUuAiz/5Ieck7XcrORahMH67et0NgW8vhR9YlDkhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901790; c=relaxed/simple;
	bh=i3I124kDIFRAt475DmJvL319sDurBF9+70I4XBQkzu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jzQk7DVgGU0NJRQb6rL73kPHhylZI25ldipUVBIkr9Jg8vtGo8KCkxeX/+drxZ+be0naxlR/mYMREKvzsBbRx/ORwDz9kMax13J/OpXxca9SNlgJlzVy7dOZMsp+ZDAYguWaYZSP0qyoJWOoP9XxYLZnvTPrK/etWEkCEnAisD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2ndOfVqv; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2ndOfVqv"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-502a407dabaso33486211cf.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 01:36:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768901787; cv=none;
        d=google.com; s=arc-20240605;
        b=BtLYU59PiG+FcBhxj4WW2sAWRwPamLd9i9mqYxV47BxnlUILsxRHeMalcAQJ/M1TYI
         71wdKu5vra/P4JQS+wu+BrlHM2gOED3hJ6L7WtEsmFmK+wAwVvWVx0f9bl3Um3LRxqoC
         2lwb7coVE5v765Tb+ku+7TNSsBMO9TcIbF3yjQEsGZSrPm5q6S78el6enbuFC1Eck/f1
         b4qn1Uk0fwNYuaZZBOvCBOSuX+JTvYYtM4UDJ8BYlGb52hB1aeztEX+unoYA1s4g3u1j
         AcKXcN4pwiUooi2hDJqJUqWR5mTz6bCtSsVae9orZZ20cO8KiRF2dJwZMITvV8NCN2yQ
         3qCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i3I124kDIFRAt475DmJvL319sDurBF9+70I4XBQkzu8=;
        fh=vAOOgxlL9e156eywKfMX+zM2VDzEk6BzENuZ+1R/KYI=;
        b=JP5n1GzjWtRuuKiUd9XFKGiLmKBMC3nv5Jpr92DQW6Eb0e8u8jtH+tDE00hSoTAhdQ
         BOtfPlVLw/AUFRfaobXqvo2mt7bllt8JGMgnWrIL8JmAPYIFunUwT/L3BcfzSpnHanZa
         KV054lY3L/3i5ARnxYmkcz00empA0SKtGAG+NkWoiaxlH13C3xcSC40D7uitmHLZ3uTZ
         ILlmgQLX9NqKnzUGY7Fs2hXj2qs+8oP5uID2accRouYcjive5MBNAlHLVcHT1posZZbK
         LCsvvjCeepfP6jwLbeRGb7TAiGzbkV8byGz0opoGnPjRFDtVGYjDbBcRhVg3AYLGGVkE
         Hfow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768901787; x=1769506587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3I124kDIFRAt475DmJvL319sDurBF9+70I4XBQkzu8=;
        b=2ndOfVqv4fK/TW+z5jKOb/UcajjFo/tOTQT6yvatC5jm5+XPDy7mU6DadDkJT1Mle1
         61ETuJ61zbQwfq5yIwsHyrqHPcjPe8+V3KODtHYyXJeK7QSQBEy0xv2mhXw6c1NqLoLW
         5ysj/VFaP4nI4f5jxQdVKI7EbPI9ly55bpH28cJimcm0czM8U5h/w7GwbwAfTNRtX1k1
         xv/awNwSLU3l5THmZBjVLlHXzwGbUbSN7Fep9X2lqtpPF8L9Y5eupsFQH5K5Ct0uVUnX
         2/xYuRl5usVIcOXiQp66YMwSvx3TDN5nQOV3s2d1QKBTwydj56smrEdi35z7YlEs13gm
         aG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768901787; x=1769506587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i3I124kDIFRAt475DmJvL319sDurBF9+70I4XBQkzu8=;
        b=p3XpBzc2tfL/JEJdB/yjTmRkmWybC7sUeYTEzI96PrWesOnnSJ+73jHJ2DaTSZLp8e
         q8gBR+VPw3yh11bRrRBgmBucT82QyZIHRKakBpnScVvJMeHvj2hlwLwsYoLEfVyIR1uC
         ap9S9dPYJG5wwPWn2/XgTZUEKgDHx62VLViJZvpVKhnvjxw6xOjKygt9PFHFFU6SNUwV
         6c+4wcfR4luUdLI21khfUVlG+bIiVHLiVjVm/3Am6yzflyvKpP7oYUze+qbM/IIRhev8
         +qICVT4/HzAZh1VTv3p5kEhQnxCn6/ZoQHZ17YqPg4VfZokPQgiNJRk+OvfAmJc/Rk4W
         DAtw==
X-Forwarded-Encrypted: i=1; AJvYcCUKG6bxMD5pOnhdetzMp7LpUlYXgYtLNQwA0ZUv0sTQ06ikZB6IgUelfaxI8sRkkpKIWUKpvjywgiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA4IlCuA7x0oXgVm3zRpWH5xGR6m7SjFx4BOTCwNkDzYGxXcE3
	4fYz4+hqCCaHXIgoifcfO5HdESALbcp24eNE/gBT1TOS+J1pOXhHDO7DA1RiqqcNYYrs9miZR8p
	FqU+mXrsFZkZ8pbyVqE/YYIHdPH142eSpdqjH0J8DMmH4MZMX1WiivQrK
X-Gm-Gg: AY/fxX6YSvA0KIhrjT0vUF8LIOOJpY2UsFI7XOIh1KiEj4uSCaFaKagVIchMuyEKY87
	NPpEukNnyv4+oeDfEB86Djm9sF6KXAaCisC7RuNnzO61v6GJe5Pam20hSkS6CkqlCitWiuhr1lI
	sepxzMGjXcCR5eAIn0hMKnr+Q0VPGC81wICQ4XjiFw//WCLOnU8e8JAjnn6SsrSffsGQlhBU7/3
	J9yTOGcIrr3Ry1kXWD5ddDqfwYF+uw8ljcmq1Ll0D+Wp4wR4tNfmQmUjUtY7RvpkQvNGfo=
X-Received: by 2002:a05:622a:180e:b0:501:4730:fbe1 with SMTP id
 d75a77b69052e-502a16073e7mr186116891cf.22.1768901786640; Tue, 20 Jan 2026
 01:36:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119185852.11168-1-chia-yu.chang@nokia-bell-labs.com> <20260119185852.11168-4-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260119185852.11168-4-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 20 Jan 2026 10:36:15 +0100
X-Gm-Features: AZwV_QiBVALGf5mVTwkAOxxW_7LaEeT-CXPBAq0Ya9GQEa2O6BH9EXhsIb0Qnrc
Message-ID: <CANn89iKNgD9tUqck8xHphqc3iiERFjYcLBa+PTHCqXwT7cxY-w@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 03/15] selftests/net: gro: add self-test for
 TCP CWR flag
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, parav@nvidia.com, linux-doc@vger.kernel.org, 
	corbet@lwn.net, horms@kernel.org, dsahern@kernel.org, kuniyu@google.com, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, dave.taht@gmail.com, 
	jhs@mojatatu.com, kuba@kernel.org, stephen@networkplumber.org, 
	xiyou.wangcong@gmail.com, jiri@resnulli.us, davem@davemloft.net, 
	andrew+netdev@lunn.ch, donald.hunter@gmail.com, ast@fiberby.net, 
	liuhangbin@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	ij@kernel.org, ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 7:59=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Currently, GRO does not flush packets when the CWR bit is set.
> A corresponding self-test is being added, in which the CWR flag
> is set for two consecutive packets, but the first packet with the
> CWR flag set will not be flushed immediately.

Reviewed-by: Eric Dumazet <edumazet@google.com>
