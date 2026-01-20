Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6D5379984
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 10:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768904556; cv=pass; b=RJUcHL1oSsDoXQRoxTTEC6Y1UNodYytozvKR5kON+gB6swL6au8DMts/nDHxEDFeTa8fEtYwTdLg3ZqX/ONpaLqZnQ46X8xM40SVZGYBx1GbHKZz92qRlaOruijL+QEG0jV3PvD0ZCREy3JrZDwuTgZ94VhlxAedrXb5b0pZdpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768904556; c=relaxed/simple;
	bh=5w2+VNa2XcFV0uZ0AA/PoYuG7MXZPHrIK5lfvnq3r0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d7XlMeQI6evYcesOj+WesQ2Gx2RnoWbRbrj71Cg7J+Jwqih2MjfI6a0+72luFlmjjkYq6p0oubCOjN1oQFsCPPHRbUrOz74pvfJAZVP5v7DgtcjOlIO9fW5OT0TrPPmWgCvrQLAQt1/qiFfCJF6AHDmjhas+Ic58keupy7XaV9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BVH0iemt; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BVH0iemt"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5028fb9d03bso42134401cf.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 02:22:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768904553; cv=none;
        d=google.com; s=arc-20240605;
        b=hDsSANRbWNoCyQl5A9kYqnd+GNnWGWirEgzmpdzWMRnVvZVusP9gPFmtH4z0HgtoBt
         hVIcCWVeKwLKGpW8o4GqFCogMOxuGbEwlTVpxU8YE9RstBguGpZ5BNO7kOyKtZ+wi43r
         FlaAfpYVVAIRggbC3ysPJo+ygIJo2gw2Qz/99T1O4NtO5yJ8QfKQ5AueNRKWa+cbxLKZ
         H8QZakNNWWpntxegcEzL7etRfPMkDFABiVt8yOOVJwBsB3dbw3Uhv2UeuxjN8nSLNdVR
         EJin9iGEZ14+U+b0Q57vjDFtXdA0THJCcKacWf7Mm1nPNvvjNVKnddL+IigmnR+N3rji
         m2dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5w2+VNa2XcFV0uZ0AA/PoYuG7MXZPHrIK5lfvnq3r0c=;
        fh=U7rs8dDRTcrTKlHGxzoT9wKnon+tmrDTFMZkJy50/1I=;
        b=SPqTVz91nbIaNAzOSOdTFxITCKUI9Ue7QuvBWZ33ua90pq/ulUtBajYQ74zOf2bUyo
         CB0kfhBuFZg9dBE/tzErnudAB5h8mYNjfmKxL72MGiFX9NbSkWWHE8lDKnTxkEjoAh9J
         XveWEPyGI8F3PGpEtqzDc5kNqOGylXFkbvaS1+siio+hQagvDaJFdMv+eLLaqWGBlB2V
         4U5SMZgM2I+cBfFHh++9bPOse/8gcM/Il5Mg5KTRagKcSF8GZtrgGX+yqPIeFVYmGnY+
         ERGWlbDcFeL0wRcjifpCDZCnqqMSoWJotsIWI6LxPCTyhg0G8ffdFti5/ksWhV3d8reC
         Uj4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768904553; x=1769509353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5w2+VNa2XcFV0uZ0AA/PoYuG7MXZPHrIK5lfvnq3r0c=;
        b=BVH0iemtJXKgFzcspkojUU8TuSs21rpLoDur2zzJ922EnIgWrkLaRMp0B9iuSoktNz
         5khK03tz7j7PR5kUv2f2CyTtzux3YZlaF5IHhlZ5DXMbV81KSbPJC99Eqlpk1RAFtCX1
         kcgM+g1EuR3S1b9x62NLLLBHhV7l5ORtqmC8YWruZ5CW30RV1vxOD7/nagZH4UIyLHGi
         YSWeK48Q3xFjL/2JjJpn+NjaEeggPzhKQy1pmtns8mcq5b2RM9ONHdWaB8hceS2Yvc0B
         c9kotr6V+LvrwRvSfFWeLTyNXlGEM/3lI/7canEuRoqj+bHKm0ZXuIq2Q8s102nxLK3U
         qSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768904553; x=1769509353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5w2+VNa2XcFV0uZ0AA/PoYuG7MXZPHrIK5lfvnq3r0c=;
        b=OnLNamPek5uui2VqUyvGrXsDz/k2MkpvOAk72bcXnAfPxoFI3rroWFevp+dP14R1fr
         XDiYB8TAqwG4v+tZeLNStN8Z7+Fn+f0K6M96hV1UF0deeNeOuplrT7SXA3DTVOjHUbey
         uADg6GxlTk1W/VzkJ6ql1z+ieXt71tjhxGGjmEmcBiko8BYRsiFtbRFEwjnen3CFcYty
         P2pd9/amtsOeDUv7bNGgdnfX0AUbBPCESA2vnbxDlKuNU47+svn18BBSE0eX/QXEUdsj
         pzcHBnzkGxQH/QKlne/oFfteDcUunzeOF1YJ2HYGimrrv4GqaWWxnIM8IPGzSyZExmAy
         0AlA==
X-Forwarded-Encrypted: i=1; AJvYcCXjB7ZVPE4L7/pjEjgKQsNntblUHzcfOL9WJjWVNBV2R8QMWWhrvmgrOJQ9t+c+4hFVN1SlwZzDmCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCabm3zA1Kt4Y67KIkTkNOMzred6C92yz3bjRFiXeuzdJ3HelU
	51wirpwgqc5I4SqKDgBlqNfla9f8PBx0442HQdT/bTwjQS+OX1BcE0qqX+iI11XnUc9yynrGMs3
	9kpJ+cInB3ybeB7gBlL0fEt9lqhAeHnVTxq0E5kiW
X-Gm-Gg: AY/fxX6pZcSWQNhMy03eFHxnIyRR7srvEypPVAGTrGkdrDJF60ZlU3Pwb+FEY902ayf
	jmH7QTjRzwXXrV8CC7ZV95fydup3Qqxxf+oaiHXe+fTqi4xwuA32/DcQEuvlYC6bbGeHDUspfA4
	JjJQnttGUyAkJRRuxv+NPsGtZw8kAW1GdAlfgcBElD15+eopGCRaOXWEnDgeYtJWGPswOvvYmfD
	Quu3zGSFDqzn91s2P99BgKlZP1kphrB10ASBVuT/IS2YhHhVwIFZiwTaDyeUpkQHaXSRig=
X-Received: by 2002:ac8:7dc3:0:b0:4e8:af8a:f951 with SMTP id
 d75a77b69052e-502a17de1edmr195650251cf.83.1768904552249; Tue, 20 Jan 2026
 02:22:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119185852.11168-1-chia-yu.chang@nokia-bell-labs.com> <20260119185852.11168-8-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260119185852.11168-8-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 20 Jan 2026 11:22:20 +0100
X-Gm-Features: AZwV_Qj6HtGAH-_1CoFAtwz8z7DAfNNNRGDqqnAwXby63-7-acE9435g0aUmmD4
Message-ID: <CANn89iKKQH=moYMied14AHrsDTOKK0pM4kVQHdh1FS4WcnU7ww@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 07/15] tcp: accecn: retransmit downgraded SYN
 in AccECN negotiation
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
> Based on AccECN spec (RFC9768), if the sender of an AccECN SYN
> (the TCP Client) times out before receiving the SYN/ACK, it SHOULD
> attempt to negotiate the use of AccECN at least one more time by
> continuing to set all three TCP ECN flags (AE,CWR,ECE) =3D (1,1,1) on
> the first retransmitted SYN (using the usual retransmission time-outs).
>
> If this first retransmission also fails to be acknowledged, in
> deployment scenarios where AccECN path traversal might be problematic,
> the TCP Client SHOULD send subsequent retransmissions of the SYN with
> the three TCP-ECN flags cleared (AE,CWR,ECE) =3D (0,0,0).
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Acked-by: Paolo Abeni <pabeni@redhat.com>
>

Please amend the changelog to give the RFC precise relevant chapter
(3.1.4.1 if I am not mistaken)

Reviewed-by: Eric Dumazet <edumazet@google.com>
