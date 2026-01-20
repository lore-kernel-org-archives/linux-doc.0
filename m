Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88AD2EFD81
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 09:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901265; cv=pass; b=fQyOJnJKrxmMq/XjvBdUYNE/eEVyc4qTLupfWfXAKlIIrzPHdiIMWiVYq5K1uxz6j58Td4pS6K4iXb2b3MEZqF2l80fYoLZ7G4imIOncP7vuOwgWo3dLq6wKR1jycUd61+TDJVvPbVFX0wwCG4tt3/zrRch9x5c3kaY7u7/os1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901265; c=relaxed/simple;
	bh=VFm+9wwtgk8aq4k8dQkzu3uNUhmEdxvmn8yiOGHPluU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hKHcrbV5gOWpYsl3sIF/zDnGb98vAnuw4sc7cJXzeEBMy5PY7ATzsE/f1BLUZGtRTZhSjCOdCGfpsyUN99R3G2MpU774ceFVSODScBBZ/WaViLChc8Iy5Un3vwjmm07jhg4G/Fzf0zad9g2IaOAsIf23AkFQeWmOML9b8UtA97o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SFtTGZHF; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SFtTGZHF"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5029af2b4bcso21985991cf.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 01:27:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768901262; cv=none;
        d=google.com; s=arc-20240605;
        b=BQrDQqdwqH8vUnRUQNlaFSff9TwJDelPqtB/35HwhxOWaJ2TkWRP+VzLeNE0G8Mpal
         Jawz5E/9HxdATV7fPm14o7eeK0pnT7ocyN8R/z5Tcagj8QqtnRyhV6N17M30Q6IBgO3j
         UFQUwCE+fVbrnXDuck7CrimGyPxnGslr6Xc5Tw2vw2Zs9a95YkaEzKDKz/7rIyf4YQsj
         ALiKjtrdfCAjM+ncZ5g4+EE1ym16iPpfTF0HPikcohufob7+xgQfaqItMjPKfcJgQUrp
         MLzYMJH/HmQYnClh4WBT3Rlqf0t9sQ10eGmVyZ0eI4pgvf5sHZ5jl0aCWAUx1r+igQsw
         xX3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VFm+9wwtgk8aq4k8dQkzu3uNUhmEdxvmn8yiOGHPluU=;
        fh=z2gfu34QJ+BxQ+DUmYzLuHoflQzzTQY2KoWIk2c2GHI=;
        b=J/CkuA0npnhANtyvqm8uDfYXHBl0fhdHNh1HLd/kxnJcPGHtL4wxT0tCd9jwHwksPB
         V7ILKhhMFUTRTEi+OH+0yZsFexX5vYOsCSmKQeNAB0r0tJ1XfE+nV6Yz2X4ryq+gge+0
         r3VBmQN35apwkmGjgSGFLFRuBYdGCDStow8RfQ4BKtTB3QgpoxO389a0gMnjQJyWfRgn
         JbmDhbQRN8zcA/8IPY92vfVoa79YG9CoyKcPR619QK5qJ9sBB60L4Pdj89FKDjG+IFRL
         IQ9MzvHkPWCWzoBD9CzYfmW71abmcKm63RgL347Ag2+Sc1GXJSJYwgRJ10zzccQfwuxg
         TyZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768901262; x=1769506062; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFm+9wwtgk8aq4k8dQkzu3uNUhmEdxvmn8yiOGHPluU=;
        b=SFtTGZHF9NsJIabBnvYroZCzVEpdC2Hb+eE2ztAAX+AP/pxQ2GQn7gUzykX3xJE1T9
         Ic3+0XhwYEuVO/+V7CTqq8bK8EbVBGm14wXQZAdOhxbgZZMUMf9Znai9ninsnRo+wuBU
         tu+6U1tkqdA6QIiB0ZZEWgrBSf0CwqLCg11DMnxlCHHx1KnfwFltcwLKdvLS81XGy3Ib
         L/g09oZlVwkvnAM5lZhMgbe4I3ro46YYjP41sN8IevjoS/Ikjp6uK/5GoMwOTCddfmBZ
         od9r0TIDu2IfiN9us/4iZw1g2e/ZpWXGGBJWpcln/Gof4PS9uLDQvaUkilSORvAE5IYo
         jpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768901262; x=1769506062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VFm+9wwtgk8aq4k8dQkzu3uNUhmEdxvmn8yiOGHPluU=;
        b=f6hxnvyWfzokhwbUH0aiERV8jjH2/z3CorOPKzJo6U8ghjx3EbksBIHT9G+xmmdqLy
         +GFKCJAeemN4D3d1jUKR+uxKDJlI4q9Q0tlSf764MIysgCDLahF9pCddEMRhWcE4SGfz
         46iuaipyPQ2d/7rdRiYKaWKGrsNxoESGdkeTLN47VreLuo0Zhj0EGGZ5rjTzKa3hWzs3
         2JdpmgyBTSwPfXQGSoUm79QeFG809NeLBEDzcDUOVvtLXBz2HTtkGdwxNN9Lkqzafek8
         xJpMPAGOylQBU4yY/dPkiU+cPon4L3sHYqQyWyrimB4XSkmtY1GKOXeJZeSVui3Hg68z
         in5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9teBppFnqNQ6vGludsgEpuHgpPFqOxQW4Q/DBcoR6GVM26U7xNIZBQiZNuEOsl9+TOPUlb/nC2Ew=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHy9PfbpsJXhfb6UIZie8WpcNcd+YMjmn9JHXEkcakl8rlQnXG
	+bvoc3HhbGgvZqht3pBra20OWqK47u/WFpAWY8kZwcyV52yqh27IDf89TloiVHjt+LPeaY5d4Pe
	wilnr3kPnul4U+5xWXTOruX30jV+ZIeb8PInQ/M98
X-Gm-Gg: AY/fxX7Azlevk1gC/8OQSrjb6VvK2sAF8uZ6NurO9TEf5P49nz6tCBAKJ0F9QCtHRo1
	PmiqVhlspu3g7PeBLcZnbsMonJTdyq5EuXxlhdMZ0NrFAlojnWDiFDHhGPJlTY/+fVV57MwB9/C
	hMgXKGOaVMgMn5v+A6/5aWdYZTqG2gOH26Pn4b3JuRyCXL2xKS/x1uAaNoUaCP7Td6xlfciGJII
	V8o+ba8ZTH6GOMhzX9pRbPDFgEaDcvjJEtiLYw0MI0jf/8v/SsjPgeJ2xYpIIWGXTrvni0=
X-Received: by 2002:a05:622a:180e:b0:501:47d3:217a with SMTP id
 d75a77b69052e-502d829a969mr10411241cf.25.1768901262067; Tue, 20 Jan 2026
 01:27:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119185852.11168-1-chia-yu.chang@nokia-bell-labs.com> <20260119185852.11168-2-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260119185852.11168-2-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 20 Jan 2026 10:27:30 +0100
X-Gm-Features: AZwV_Qh2C6qterbUps9ipHoZiFx2JUtmLIyzTtH8Kko470SyemAziOwyIlRmsJc
Message-ID: <CANn89i+44At=GtWMjksjjMmARZONeVAAiDgqAP2jXWSK3BxJLQ@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 01/15] tcp: try to avoid safer when ACKs are thinned
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
> From: Ilpo J=C3=A4rvinen <ij@kernel.org>
>
> Add newly acked pkts EWMA. When ACK thinning occurs, select
> between safer and unsafe cep delta in AccECN processing based
> on it. If the packets ACKed per ACK tends to be large, don't
> conservatively assume ACE field overflow.
>
> This patch uses the existing 2-byte holes in the rx group for new
> u16 variables withtout creating more holes. Below are the pahole
> outcomes before and after this patch:

Reviewed-by: Eric Dumazet <edumazet@google.com>
