Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA533E9F7E
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 14:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769006780; cv=pass; b=qiIwFVyXwSeACNmljHKo0rWDQPZ2qynEILla4B422R46FnXmLUhtZo3rBMwVcL/miRJv8hYmJzw7XiwG6tV4wZfMpo8ygXbmFL1nCIGgzUvJKUGY3ipqP0yfmOYTFjPa1NvSF0NvivoElsPMIlz/1B0+vp2Ls6/A36duftch6jQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769006780; c=relaxed/simple;
	bh=8LkGGQMI+aFrxwwHHlu4NNetbr+QWG/yDGjZ/t1VPz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bYleuApRFfwB/iR/RlmpVvbp9GnXqsDl1jl15N0jh7WoulHl1GMDbta4vpQp3sXMPjdMIR8dxR0XIhmmdMWPGOS8Y8OiDUigXKmlTmhvYvi7bWOjIRUd6C+i/o0zSraYmW6N1c4hireCgkpUj5AlBvkuB7ewGw674zBbKYvqfVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d28bk7Ss; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d28bk7Ss"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-502a4e3e611so8263871cf.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 06:46:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769006777; cv=none;
        d=google.com; s=arc-20240605;
        b=aZhVq9gLvHYkhePyKwjsXGjB8u8IfwQB4HlxzVvE/dUO0XexbLIMS8RgDi7nRgFTSy
         9nJjcpGcf/iA0Z3XH9lrfkdXPcRmjEOBM1IGbVWqiCs5mElOzVW8PsXbAMNHY2g5a62s
         HkMozUlVrRwNKLPp7vmboxGnFsDb9FKjqQXmPDvgv3U/k9R9NDeKUk081JKi1w3mggnd
         TTFVVmrVCom2v4d8Zk9I44xM1GKmvWZBHU2nNXTeRSTahRpAqTdcfrzhGQYd6lpugjrF
         KusyzDuvo0ay58fwHL6DVQCG8Z1PZX50QGUB4kcM8DoV77gSu2VR4mDlOOwQ1LIGf0ER
         7hJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8LkGGQMI+aFrxwwHHlu4NNetbr+QWG/yDGjZ/t1VPz0=;
        fh=buBP7yLgzaNQuesRcRyOwvdn4SNNiSX78awsuGV20/A=;
        b=SQs38Jsezut6qKQDcJkKnZ+gXTBh7Y+z13e0hhcf+KOXYAHSSHsSVlAfcmqfMkNHW5
         3uMrNMyPxt8szkGUDc4/P8glpMDkih25vHAUFy6BwoVJycxBsFgpp2eOs0YvcRop3dhy
         Uwd2Z7+O/ReoMnClnxbpAMgrVYZVTRSeIevCzWVgin9Vzi9hHhwFFGGZmr70aYr+dxb3
         Ci2r4tLSOZmgldi/YfqUIbHrHqikykHz1daVIjL1hObXnEBFNiE3n6jYP4e9oonYd5dx
         JY6ioc4+MhaZMwLRgylPdreq879aBFUVGaNMkvtnuvEeYMNh4xGHNqOIJ/Zx0MIgozNJ
         ndig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769006777; x=1769611577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LkGGQMI+aFrxwwHHlu4NNetbr+QWG/yDGjZ/t1VPz0=;
        b=d28bk7SslA/sFce7HOZK4TTDYBBQeo+OKAEYlM0vlhVpL65gsBLhCO6KPHMsWlw8Wk
         mosONMTxIPvFSicjHS9iTtQM4OuXCGSSByMIwvfm/jqbC1xRIweRK0J9DZZDDVZc7KOi
         EmcVdXOBxQD8DhtHknYdgtk9PMM+uk9lBU2xqL/xI0JVgR5ps/6oOTaoGf7VNMllYt+j
         O1xWMrpwCI2RrozBPlabGr/c3iw/PgxYCxQCpooAepiS/GQ1d4WfMn6pbMfVgsRNLVTV
         A4swtaueVj0Qi9NeCwr5GoGrM1LvcAoPI4J/2ZlREuJxFyXsDmEhmdKgH7eXfQE6oemV
         sd7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769006777; x=1769611577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8LkGGQMI+aFrxwwHHlu4NNetbr+QWG/yDGjZ/t1VPz0=;
        b=val6rA4eEgk/QNSTmU/gS6NcNu54N8EzcicpBo5L+2tTT9insLbM4r/AG8Ttv/C2KN
         kFFEo5z2RKyA80o3Z2Qux3uXjxUriX+KyWs/Joz75jpQbi38cT0eehMYlIDbyJJP2gpI
         dkPoRcLnkooLnbgM7gqsmEwST0ba/lYNBfJJhet2aX5fZGy9oiIYKJxHo4zpAbg2pcS4
         3LuenP83YPzLSudwlHdhK1vXTK3Tr6+k6kFkUbtRaRSSsNGRW2wASH4DiN45ProcOf9s
         aKMOYuduggGY0yavd8nmarNW3H5yzBsJsSZSOqHTJLXBipgtPQYnQ6F3YH9pnxwQxUNC
         dIaA==
X-Forwarded-Encrypted: i=1; AJvYcCV4yxAmJn8smmvSgaxI9wPelRwEOTxi/xY7RuJmgIwBhvfB31+LxbATvmqCwikLLJEaYfiSyJ5ksKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YysyGdszwgq2Jk7BnSFgKXcojftY7ziw29RC+XIhc4Rkoud+1jO
	eIncKnNGmKG8iTJaeZ6GDZB0WJrMcH0qBOOelUPBcNMBLtzlIEO/q8kszwalg2YFWr8D6tFqOY1
	L4uUkcV0mQ2ky7nnLpboUntnxRvGKWJCD8VKhhAH6
X-Gm-Gg: AZuq6aLDJ3owKR54HWisNTJZQYqIX4TsqVi8/vynCffmcLODrgYDqGSIE2AVUnhOsNO
	1sD6dK6cI/K7Re0EEWQl70c/HlVYgNKABcVR03yGvS+W5Gh67Ri8bmzo7O2jFF7ODHRbvIUUtSi
	5Hp/2v0uOcY4M5f2iWAnSqhvHHDw3mGkjaJVqDHPdZcMZWpvaEznMcsDykSlHV3NxW68vDyymYo
	S3WK8YShUSVhUS56CsRNpUNihsDVo4wQEc40om0UyJMzzmjat4/04mvPRVLiLrhpU0Q4bE=
X-Received: by 2002:a05:622a:19a0:b0:4f1:aa52:878 with SMTP id
 d75a77b69052e-502a153b0d8mr241578331cf.9.1769006776632; Wed, 21 Jan 2026
 06:46:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121143215.14717-1-chia-yu.chang@nokia-bell-labs.com> <20260121143215.14717-12-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260121143215.14717-12-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 21 Jan 2026 15:46:05 +0100
X-Gm-Features: AZwV_QhmibL0dUAXLsxhUO5inqdEXXTvbJ-_96RoQaEHVZjV79Y0et9q-_yyNck
Message-ID: <CANn89iJ7O5+xjoHHy1RZzLMfTBke7nmh+YhHCJsdpyx=-ewbOw@mail.gmail.com>
Subject: Re: [PATCH v10 net-next 11/15] tcp: accecn: fallback outgoing half
 link to non-AccECN
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

On Wed, Jan 21, 2026 at 3:32=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> According to Section 3.2.2.1 of AccECN spec (RFC9768), if the Server
> is in AccECN mode and in SYN-RCVD state, and if it receives a value of
> zero on a pure ACK with SYN=3D0 and no SACK blocks, for the rest of the
> connection the Server MUST NOT set ECT on outgoing packets and MUST
> NOT respond to AccECN feedback. Nonetheless, as a Data Receiver it
> MUST NOT disable AccECN feedback.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Acked-by: Paolo Abeni <pabeni@redhat.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
