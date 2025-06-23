Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A108428EBF1
	for <linux-doc@vger.kernel.org>; Mon, 23 Jun 2025 16:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750695254; cv=none; b=oTdT1qVnb3AiLiRG2R9jfz6ruuhbpIeSK6EV1E+fiT3TFpOr3AxoitZFMh06gBkF7DJRnBSBIBUsVUQdL0gcaLu66PkoN+rBm0cnnrk8dOc+3w0kJckKN2Ct2mDB8KXs97Zknj7oj4bp5UyNg9AtMJxgRSqk9IIxrOS6xsct1f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750695254; c=relaxed/simple;
	bh=Tz+moTFStFX1YX39jWCVWhxsp1nVbvbMEnciDuWFgg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cmNr5t/F0NG47T3KJzIShM+n+pk0Hx8lDQwT3x4M8EyDcHbHIZmpG+jRxJbg02PCwX3B+UVir4NA52KHM0IBEPFZScsYYlffLyO/49Tf3fH1Zxy89W9xdHB6ildpAK1rVsRMuKWsywjjZvHN0G7U9N5urz1sapmVrvT4fuPxv5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gvvWkioS; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gvvWkioS"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a6f0bcdf45so53125561cf.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Jun 2025 09:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750695250; x=1751300050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wN+RSCnSaEyeOJOV22jB+Ns6YfYfbuKVTQFf93dpJN8=;
        b=gvvWkioSl67jjGr10PTQQbIlXYXFSOz+Z6BtomHgsf5xPkkU/kGiapFMoBfZUN+U+Z
         PmKLO+iCoRzYV+tRxsXYCbrKhyAa1hdTqOH09Hl4u0xClAtggzbulu0ZRR7kzldIpDvE
         IwUMIZ5OTZawrkly0Dh1AcIANi1TWz5FjW9vPINoUGfMEbsrcNdIS2XQQShLb/nxi2Mc
         uUtzKrWqqLBNt14ACAOTgcBlZW5vSthVqcUdQXYPKfoMR8iTGATIR9MJO6l+HG2j3KFK
         XadtpyQk6YSNilylWwOUrTJbFS10f/Icks5jOR77h3zDvY5TAiF+pkPNiPdYPAMCO+6I
         7U8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750695250; x=1751300050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wN+RSCnSaEyeOJOV22jB+Ns6YfYfbuKVTQFf93dpJN8=;
        b=bpqUfRxqC+B229H5BnRxKyaAFFbZs4UUdQPOE6RbtowGClZFobfoa71cWHNBntpLzf
         mFnFzbcXcFjfLZarLukG6TmfnCuEmoLt3G5j3FNohoeOGo1+FI8kxLrrwj9DUvOtLg+n
         yR43NpnmD50ce7eW5wKPUbP/E/ykjrULB2SZHPeP2xPgNxng3GGtZDJ582XBNjHwb6Fv
         ZC13iEKsYcx9gCWWZh68XiX6O95VeBDfRSWY3Xf+RllQFgvLIoio6O1x/zqmRETKRfRI
         GXg7RAmTewmyRS5JgZVpa7HBwmzEixqGw7ADLR7ysh+2bbb0YsMyQrgk1Hfu33JBqekb
         Tltg==
X-Forwarded-Encrypted: i=1; AJvYcCXLXPwG0AwmpHzBsVtzTobNzJ9ggvTv7YQh8TtvhBMwn30AZE47mxnidnhjk7ag4TY7us+de5QQYqA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp3/ImKypR+KZYbVDvgrLQaCLXpwLidU7pOwQ1dBHtWlzahHTS
	0mkYSVfTHLvcv8uaSBeg45KujBwWObz1AUUA7bF4C4zf3bZqIrJeXXLT4kN1sxzpz/yNYjNRSnW
	FRi8wVmSDAgg4afKpmb1FGpTKkGeAvUVk/3YNHBSe
X-Gm-Gg: ASbGnctIqndpCA2H/xBbaQY8pDq3dVswGXd6tFw2NhVTlF3OVx6Ux45FUNqH/zJMmT+
	4J/G3xCLlDYQotOMPWJ+Y9tRrKyMwA393fl0wCLsM4qRVosrBcYVgpt714ZcrNqgPTQbDSLWT1P
	SB5oQ4vyaGnFimIfhYI5xO2KEtI+lxlG6R75Atg9dy6K0=
X-Google-Smtp-Source: AGHT+IEobn0And7X+FnotCoZ870DRkq0dQIwi5clxpS4xb+1xJRmqq200eOqBXI6G1dwNYsWyv6mWhZ2d1yR0qDuYeA=
X-Received: by 2002:a05:622a:610e:b0:4a4:3a34:ee71 with SMTP id
 d75a77b69052e-4a77a2b6514mr178869141cf.29.1750695250190; Mon, 23 Jun 2025
 09:14:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250621193737.16593-1-chia-yu.chang@nokia-bell-labs.com> <20250621193737.16593-5-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20250621193737.16593-5-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 23 Jun 2025 09:13:59 -0700
X-Gm-Features: AX0GCFsz5JzbRrh0-kqOwf2TSk7Ef6ZqFtN_ZPJc01ldHoBLtqqmmWiHN33x0qI
Message-ID: <CANn89iKLKzvkLkPY67286+dKC4fGS3VtP_YhL00BmS6-0yXKxQ@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 04/15] tcp: AccECN core
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, linux-doc@vger.kernel.org, corbet@lwn.net, 
	horms@kernel.org, dsahern@kernel.org, kuniyu@amazon.com, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com, 
	kuba@kernel.org, stephen@networkplumber.org, xiyou.wangcong@gmail.com, 
	jiri@resnulli.us, davem@davemloft.net, andrew+netdev@lunn.ch, 
	donald.hunter@gmail.com, ast@fiberby.net, liuhangbin@gmail.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, ij@kernel.org, 
	ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com, 
	Olivier Tilmans <olivier.tilmans@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 21, 2025 at 12:37=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com=
> wrote:
>
> From: Ilpo J=C3=A4rvinen <ij@kernel.org>
>
> This change implements Accurate ECN without negotiation and
> AccECN Option (that will be added by later changes). Based on
> AccECN specifications:
>   https://tools.ietf.org/id/draft-ietf-tcpm-accurate-ecn-28.txt
>
> Accurate ECN allows feeding back the number of CE (congestion
> experienced) marks accurately to the sender in contrast to
> RFC3168 ECN that can only signal one marks-seen-yes/no per RTT.
> Congestion control algorithms can take advantage of the accurate
> ECN information to fine-tune their congestion response to avoid
> drastic rate reduction when only mild congestion is encountered.
>
> With Accurate ECN, tp->received_ce (r.cep in AccECN spec) keeps
> track of how many segments have arrived with a CE mark. Accurate
> ECN uses ACE field (ECE, CWR, AE) to communicate the value back
> to the sender which updates tp->delivered_ce (s.cep) based on the
> feedback. This signalling channel is lossy when ACE field overflow
> occurs.
>
> Conservative strategy is selected here to deal with the ACE
> overflow, however, some strategies using the AccECN option later
> in the overall patchset mitigate against false overflows detected.
>
> The ACE field values on the wire are offset by
> TCP_ACCECN_CEP_INIT_OFFSET. Delivered_ce/received_ce count the
> real CE marks rather than forcing all downstream users to adapt
> to the wire offset.
>
> This patch uses the first 1-byte hole and the last 4-byte hole of
> the tcp_sock_write_txrx for 'received_ce_pending' and 'received_ce'.
> Also, the group size of tcp_sock_write_txrx is increased from
> 91 + 4 to 95 + 4 due to the new u32 received_ce member. Below are
> the trimmed pahole outcomes before and after this patch.
>

> Signed-off-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> Co-developed-by: Olivier Tilmans <olivier.tilmans@nokia.com>
> Signed-off-by: Olivier Tilmans <olivier.tilmans@nokia.com>
> Co-developed-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> ---
> v9:
> - Use tcp_data_ecn_check() to set TCP_ECN_SEE flag only for RFC3168 ECN
> - Add comments about setting TCP_ECN_SEEN flag for RFC3168 and Accruate E=
CN

Reviewed-by: Eric Dumazet <edumazet@google.com>
