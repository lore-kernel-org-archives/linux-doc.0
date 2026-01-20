Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF863D4101
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 10:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768904733; cv=pass; b=TDLOkOOiWx+ihaSdcnthT4PsLUoFVw2kz6PILGD/riYTWF2h4U4kR/n7/WpupiCz4mwRcZ1S7pIALR9b40a2kQN2lK/3aMayXTcnLL7zI9+eJ38b7OZ7oKAGUa/mJwSOXGRjbsROl8IFcxiZiefSFypXpEJE/T1LqI/jXt0LB6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768904733; c=relaxed/simple;
	bh=wjJ+Nws351Qs1zaYiW8MF562GhG0txIVy0NZYF2vpvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FApRU4MToaxSBa5m612SDjJms1x0cD5b6d7dcVv3JRMvlG4zkwi6ASUnxogfSNpc275nV6WX4gTaoN+j+blp9ugz4gXsl0yx/vyMHSWK97Z4nYcX26tv78Ypde1CHfhQHk2X25+plbRQKTjOI0sjZbQwx5I8p7S/9ovpQnxhXxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0MLoa5g2; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0MLoa5g2"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5014453a0faso46987121cf.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 02:25:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768904730; cv=none;
        d=google.com; s=arc-20240605;
        b=GjiNhz/AxP/wJkfsbKVTVRwpYZQ0NAC9H/LASrWA3CZ35D4m4tp+qFMktU2jC7jeE3
         y1+CrtMlJQZQaR80rHsO3+DIdlItciUrQ6b94VAeWBTW2nBT8DyhRZ7URyZV/qeplvGw
         ZHHFj43lZUOJCII4m3zUM+iTls70QaCPL/B6tBmWZhuxLbhbP5LVQuvh21yESDNp9NWj
         ZMm1+3R+qYPjJlvRHlAQoTE3tSHsdbMWlyZbeT+LQYdZjK3jPD+TqOypDAAKljGBT/Z1
         3X4KE+InFnPBYtwdlGs0hFYshwNwewZ5sAJE5Q8QX/n4ly7fvFa0KFT5lNAK3YNUFuxw
         ovHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wjJ+Nws351Qs1zaYiW8MF562GhG0txIVy0NZYF2vpvo=;
        fh=PWY5KpfqrmZljr276HGtsmq8EyjFCfAEE0ne2eXeQE4=;
        b=lzMJGDlZPDcwIbMPxWV7V4alPEEyZRxx6TBOg1GWOlN7KIaFxFllvlscXuUl7TiFZG
         VXRvt4sCBBmG3eJO02TIJuTfHOJUmhpynHQ+8fY0d68gd3u/X+GAMbAEfDpuPdJCMZGZ
         1TdSG/bweUtKvuhO22pLAeokr5S3l4YwQMDTDnxRSAIP0sYbM4EJckUREc+SpLyBnZBc
         HuonEzpn9nuRw8G49lR8Qsr2Yo6rHMW4EUFarHZEn2T8NC/4OTHLBiMINeZ+bxkpxjLs
         AkNsv+9dwZ45QdmGyH4oJrKqi/hFXO86Mc97p2QyYmgb9oUK7IJNg+18b8Rg2zFiofZR
         PGDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768904730; x=1769509530; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjJ+Nws351Qs1zaYiW8MF562GhG0txIVy0NZYF2vpvo=;
        b=0MLoa5g2PfCyeo+1/vEDpd8wWDjQmTPWqQUdJjSPPpiq7qmcmGeDLKE/WzgLwrpKAQ
         3ymVQTGSykLqPZ6elyTjQFZO0QMIK5Xyd259NJ8hEgd4CPlKptQHqihhy/L3sEkKQ3pP
         fBoA7vUHQi9bE3vArS9v/adTBoCvpwPN0OPuQyehyEEumx/mmDbYCoIeEn0EsmTTLTMX
         bOZGsy/sR94ywAORlTNcYl0C1ZNMTqrulnEney6DmlSEo6auplShGYvW3x091LJS1S2R
         11IWC8b7mArisAW38h4Db0zJfR7fPWguUT+qkHzJ+/f63kuyDkqxkaNFJWGJxJZtI7rU
         Uqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768904730; x=1769509530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wjJ+Nws351Qs1zaYiW8MF562GhG0txIVy0NZYF2vpvo=;
        b=H7zKHNqDpECyQVspqjqqJFXqwjabs88uukW7cv2UTVTMRR79NPOUUijFCw+lhlRQvP
         6PEQspOfgEytu37XTPujoKkJDVXhWpZCfFi7m1RmzF//LSK2ctxZ+pT/Z2tYhosOSf/8
         57oe7dWZXOWdd/g4ScvJfZ0LXyJ/oCe5GXGEPEFQHRiJTxuvamfzHMgu0Ok+MnOmtXp5
         2q9bjZO1JtJ8IdLkyz5w+RfhWVcVmovzX8jk9QyWoRNvDQ9OfB93NBMxDIkRQmop/5iB
         0P5w/65vrBAUGMsHMAkdFOS5ROuOly1fyu/EUVrvIizAaFaCffKe7azJXcBZ1LoXkwNa
         o0iw==
X-Forwarded-Encrypted: i=1; AJvYcCX25O9+zhNp6OyEvtvmvdlSrQXR90mdct9bu72m6h/aYOrDSNQMqxYOqcKmPA8STFXzrXUJjLhf99k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxolSxwestvLHyz+K/l0R3akgsVHx+X1cnsTA7kE8TpYXx8iHnh
	9JoXkjb8lmekExk0fDyTr6kpRYehDTtHa0l89pddxPnD29yFQdb5L98DcWURQSsucF/e6JVgphE
	bClSVbusRKy6TEGFhg+d91UEE9toGBfYV741Wxs8J
X-Gm-Gg: AY/fxX4i9DSapFZOe6rb4G2EBCgWgsx2KsCZOasinmFgSUMbSjflIrN/zJrV1xh97ND
	56aQtHxtiMwPaahNazxbdYPs8WPFvJh0IxLkAKT6ybA7ssguXSHWhPWU2SOkwHmKYdABcarpJ7L
	D+suioDAzAIlXWpQ4TDfyryoZGj+QvoITWa9yYAYOELo98aSL0H0uOzXZsO6qrIC+SeSca/4qbl
	njCpDmGOuQHgHUl0Saa5eritI7oM2dQA60WGHzbZtScnhQrFDgiz1E+Xr3gNM8jODDDEXTgFdel
	VHaqQg==
X-Received: by 2002:ac8:5d4e:0:b0:4ee:1c81:b1d1 with SMTP id
 d75a77b69052e-502d84d36e8mr12347611cf.22.1768904730033; Tue, 20 Jan 2026
 02:25:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119185852.11168-1-chia-yu.chang@nokia-bell-labs.com> <20260119185852.11168-9-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260119185852.11168-9-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 20 Jan 2026 11:25:18 +0100
X-Gm-Features: AZwV_QhXZCQk1XE-q39P2gd1Nz-BCTJZ9hlSkcwUiVU-61knB_BOINgx5AQZsrs
Message-ID: <CANn89i+6KjPh916bSTJ96=mDtR8d4kQ4LNs5eqfJHZnRGMx1bQ@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 08/15] tcp: add TCP_SYNACK_RETRANS synack_type
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
> Before this patch, retransmitted SYN/ACK did not have a specific synack_t=
ype;
> however, the upcoming patch needs to distinguish between retransmitted an=
d
> non-retransmitted SYN/ACK for AccECN negotiation to transmit the fallback
> SYN/ACK during AccECN negotiation. Therefore, this patch introduces a new
> synack_type (TCP_SYNACK_RETRANS).
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Acked-by: Paolo Abeni <pabeni@redhat.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
