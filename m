Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A17361660
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 11:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907897; cv=pass; b=sJvON+izgPhQfl3VWA1Ii3eI8qJ/0xuA+oIiXO8LphzPMvfmuajdDRWweWtX6LfjEEMmgT16U0WIdML6XMpMWQjU9d/bl/wwYmW0Kb0fjEpcDGaQ4QG/jNBTXPkOeL7+XaIHx78HddyCFcxpEDaJeFxG0y42tQfYHd3+lDBiT3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907897; c=relaxed/simple;
	bh=IdT7Cnqlw0gbduzUyd6rGZsiu6oNpbZ6fLa8v0srGMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IEWLvMcAsM0sXQUrnGaU2QuQQnKlgweHBZbFzTxTZToRfsNyvB53s1yrZTOUc/7kfmPKQgOE1IP3MIpvYzUUj6dv7Efsc5Hdwyo4zwLhK5pVejBmlE3c9SOVIs+hNjyYnHipuwj1t2vPkJKPThY9NNqx1yHelrf8uMEnVY42eh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RuFIMCT+; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RuFIMCT+"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5029901389dso33385351cf.2
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 03:18:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768907894; cv=none;
        d=google.com; s=arc-20240605;
        b=E2FIaxDyo7tbOTHm3cweS0OfsPqxZP4ENsamhAiC9We5OJ1fbHZdzstuzoRk5qpDU5
         QkE01j1/BtYTsXiOfwO7foG/cqLr7kfMwb1LiPsJnwc5EvQNX2X+NnLMyYQfyvAQtiy9
         VpfBGrU/KpYsu3o8YgPBp8BJgR0XB/dZ0PkCvG2PrT7gR1A0TKexyq5VFZB337F70WG0
         gzXTtr6fn/e15S10AMaDEtz3uIX6O4RvUgCadGPuHu7Ac5P4QFVNlVyHh1lchp+WoCEn
         XzODoAuJpRxui2WmFlHI5YpcEhG0wPOf/NqNBSjVNovk+FEUa+BFW07XXa31f4qEXdHS
         UiUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LUXil22tiizCYyaIA03hv+e6KoZWp5K7Bky9alaR5BI=;
        fh=lJ5/tCLEWyLs2jE44ePW3Ea/F3aSngAPNTMZ0p3A0m8=;
        b=Z871uZxAaoaol1ggjzyvq9kVJi8qf/SXDQxC3gSNiKDyU3Enn/AYMXaPcfxGv3yOGK
         xUZS8BWFNP7PEPHtx9/FOEBs5rsNf0LXX5CqOEhlK33pQRwhJUuRqrQwfkJKNJTiM5Sy
         s7mKUcYmN0EucoJII0a/ST4sIqzAzyDUha5USes+24j9sngHijhEXcu10UaJynusqxnx
         f44TmygvQ13/VsYhzacanHSpCmtyOatwrUo38Qzq8uUyYujDs8O+/ZO0s2PDFe39DdxG
         ANnQZfTi+G3w52V3i+RL7LHlXdF1MSSFgMuw4St8rQnvNnMS5LhfD+zv1wz9N7y9Ae7E
         q5Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768907894; x=1769512694; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUXil22tiizCYyaIA03hv+e6KoZWp5K7Bky9alaR5BI=;
        b=RuFIMCT+LVz7niNHIRJQfbaoPRSsdO8Hqz0Z/J3m63nr6LKihwAtY76EjTAxL7Y5He
         DTI0+HBc2DA7Wws9P3a+ky+IPgAJiu38WkSpaLB9WI4HPkcQQJa1O5OABpYGa+wOaog0
         2Xbxu3SsZ+voGu4vgCZtfGmL2Jx9v9GWUY1tMOd4nk0RZVG6ynthaiaHNcQoixfRAI/x
         eQphwNh2B/mS+Kq3XTCmbTH89oN2NySA/zUtUdQYuoihubFh6NZjZW4Z0lv5RxuG5udH
         jlwtVEf9G+ok8ktVWOYSAZZ6NkFiMIZO0+uEHNZYn/kHcdsP++8gMj3Q8f5KClcKCmsF
         lhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907894; x=1769512694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LUXil22tiizCYyaIA03hv+e6KoZWp5K7Bky9alaR5BI=;
        b=bcV13x+hbOMWrrPC/H7/fQ61EG9cZkDvMkb2u3lqIZ0C2PcyFW6Gsyr3NbeHrTmgRa
         QZJ/QxUoCuMpcgN85KuMOvoapP2QWZieqbPda1QCZmdhYg9lHmB4/N6X2RLItma0p24v
         2lqiHu1/uHAKdOLRBTvLr4f7Dc3BCFb6GBFFAdU8Fm4CTtLJ4OEa4ycg0KpVvqqiTpTj
         rsnXVOv7y1dDfZQvysIb0kPidf49B6lLUp4Nb14O0pUiu5rHhswUhoWXKHF9IZJSA53Q
         K9gbOGKxQJ0KdGRJO9MrGN7ZgP05qKz1hw6E+jfHAa0s6VQBazRAWfhfhVM9bC+D9oe3
         a7aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxA6SMa8CTXbPuTF/E3njptBsPLT1uzBX8cNutyA/CeAP//7smy6rM+9BBxLAlkiQGgXxioRWzBDk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3VIa/ToSbnqG6NizLg4HX0yzOrQ6CKurItMhaLjjEyC349zea
	EZ7Jx5DFBRws/1q+CosvVW3N8QIefQXg4ywcRNQU3KlY+M2sClaFerP216Y+SDgZrZ/d7Js/kd9
	Kucy1Hu80PRhlMX1fYUvoFEeWnBMvA2XtGRkn99/J
X-Gm-Gg: AY/fxX7C87tyz91neWGAbmZPnnNnx8oy6yDQmvzMdE6S8uXe70s3EJcwrcG7sY/Dw03
	OOai1ENnovInsgPcHj0DqVnT8jX6H8P8fdW3ySFdg1ne3LOolceM37xbPg/83zTqmyfZCSVgTpU
	iOc62KvvtTYLHO4vnA9GtUiPd6J2YaHguyxG//GHK7c4Cv7x2vzdgdv4dpGaRj5gYPAJfcUDpjt
	4b3BIgdNQp6uOmwE5ZnMM65/fsAITp8IwKPxqRNVzZj41SDkdcYcwiLDLkk7maHBU00u3A=
X-Received: by 2002:ac8:598d:0:b0:4f4:de04:2434 with SMTP id
 d75a77b69052e-502d84b0bdfmr14314171cf.11.1768907893248; Tue, 20 Jan 2026
 03:18:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119185852.11168-1-chia-yu.chang@nokia-bell-labs.com> <20260119185852.11168-14-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260119185852.11168-14-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 20 Jan 2026 12:18:02 +0100
X-Gm-Features: AZwV_Qgc8lwWGTeaXcXgJnQwinHD3Ss17Aa4vUO4GXRwqkl214KVxmDeii_C688
Message-ID: <CANn89iKhAs3rMWFdmM-rma1wS-Xd7mf9PBUQKL8YMKhB81Jkkw@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 13/15] tcp: accecn: add tcpi_ecn_mode and
 tcpi_option2 in tcp_info
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
> Add 2-bit tcpi_ecn_mode feild within tcp_info to indicate which ECN
> mode is negotiated: ECN_MODE_DISABLED, ECN_MODE_RFC3168, ECN_MODE_ACCECN,
> or ECN_MODE_PENDING. This is done by utilizing available bits from
> tcpi_accecn_opt_seen (reduced from 16 bits to 2 bits) and
> tcpi_accecn_fail_mode (reduced from 16 bits to 4 bits).
>
> Also, an extra 24-bit tcpi_options2 field is identified to represent
> newer options and connection features, as all 8 bits of tcpi_options
> field have been used.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Co-developed-by: Neal Cardwell <ncardwell@google.com>
> Signed-off-by: Neal Cardwell <ncardwell@google.com>

Are you sure Neal Cardwell really is ok with this patch, saw it and
gave his SOB ?

> ---

>  struct tcp_info {
>         __u8    tcpi_state;
>         __u8    tcpi_ca_state;
> @@ -316,15 +334,17 @@ struct tcp_info {
>                                          * in milliseconds, including any
>                                          * unfinished recovery.
>                                          */
> -       __u32   tcpi_received_ce;    /* # of CE marks received */
> +       __u32   tcpi_ecn_mode:2,
> +               tcpi_accecn_opt_seen:2,
> +               tcpi_accecn_fail_mode:4,
> +               tcpi_options2:24;
> +       __u32   tcpi_received_ce;    /* # of CE marked segments received =
*/
>         __u32   tcpi_delivered_e1_bytes;  /* Accurate ECN byte counters *=
/
>         __u32   tcpi_delivered_e0_bytes;
>         __u32   tcpi_delivered_ce_bytes;
>         __u32   tcpi_received_e1_bytes;
>         __u32   tcpi_received_e0_bytes;
>         __u32   tcpi_received_ce_bytes;
> -       __u16   tcpi_accecn_fail_mode;
> -       __u16   tcpi_accecn_opt_seen;
>  };

tcp_info is ABI.

We can not add/remove fields in the middle.

You must add fields at the end of it only.
