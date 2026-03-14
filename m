Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822BC37C918
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 14:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773500149; cv=pass; b=fo8aasgEEk1fwtwyVzVW/DQkUlpwh/0l3KAtwqdcK/M64YKfi2MLs1IVv1YgjQQcIeo3JSzOHPyte+FhXBU9jyIDdbBY9eqOnEQhItvOJ/jG3AtRSt63l1n18J2/4OZ8QkTCKe0uj6laSDtQwNnWqQ0VxULV3lRlawSIHPk0w0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773500149; c=relaxed/simple;
	bh=Ca5kh9peUXUreTgn89AvAH7iYz5iRwVMohpHmv4hihs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PA3ZSvHW89s5Z2qN2DEw7Z2YiQMF3ED85P2aHyWY2sKGbLsvPz8uU3ouLmqdXo7r1rh/g35A3XfPH8v6hnutX8A7ol5YhalWfoqZLhhHWZEmW8npBvwog9OTlgz1fKde24YLt91tbBdNo/Q8ew1V11Uck4itILENNaFgxRU1So0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UnmwtPSu; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UnmwtPSu"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5094e1d17d3so26446291cf.3
        for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 07:55:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773500147; cv=none;
        d=google.com; s=arc-20240605;
        b=IEFMVKamsyhm/HB07wgmohr7JqAGc+EqD513KuTK9vscxD3kiq/0HzlojFRx1cTfQd
         XyNDnSn4A61j54+bodnTbc4XUvepFGXHu92T+CunHO81ytZSleJey6ZGXBoRRJMeu/cy
         Ts0ENpZ9yoBhmLQSU8dvaULwq0u2DspxPCuo2XZnRR+vDORgJI/yd54x29FqhQTwAhI9
         9FwcPTif7gh8rv5grZp3vBalxrkBEid3h/QcBiNBWSNbKtgOkSvfcalrJQRDXBlnsKVH
         ktqY1jkaOzpDD46UUx5Hb/qwo7NERMwWMQ9957dHur7CZoAkFmyirQKIXHUWeBx8x5Xz
         jhww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ca5kh9peUXUreTgn89AvAH7iYz5iRwVMohpHmv4hihs=;
        fh=ottZw9ekznJq5cXVCde/WnkK7RgE/CzjcjJ2cw4r0q8=;
        b=TdCp/0Lse8/4BXlxno6Q2WsF67oH+Yio0EvEe46gnuuE/1EmRDtSCJgGL4SbjTiJw7
         Vf/aCP2pgzevCW8rGTICqpVbRivWBlPxXRuCJxM/hNQHPdf0WIQK9gaYCFbRU+syelCA
         YVex6r4xjBeDrzFH5R0vwUsTlj3XQVN6G/6XrzpH0Q+hI38HHIu/Vjb8N4Jk6r3Z30fJ
         3ez8NW3W1GxhZJp1eTQ62kMIBXi7VuhqnpzaXeeRfDXv9Ya3x8ZU47jreoW5dyAuqt3D
         J32yUcSPF1aidH+4ZttfZmDKoKM6Ufhcq/g9Pw7oZrcqWPiI+BIzpgdN2tbup/N7j4nh
         ZRbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773500147; x=1774104947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ca5kh9peUXUreTgn89AvAH7iYz5iRwVMohpHmv4hihs=;
        b=UnmwtPSu8PBpZh9YRmoIKlUGcKidY0LqgrE1SlTuyFCpJmnr1NYCLtl7DzKlcxOjyt
         Km6T2SpRmeCE5VrdTT0K2FWGGJlaDcc2swRMYGnEKyhROPEkrTytz2XAHTnWcRF0/PoH
         u8OsYisk3eNuUEu51gAL64e0uI7blKn38SWI+blhqjs1zj7X8NEJhpZcfRahEmEBf/Yq
         0d1Li4EO88auLuF6ik9WLpFe+lO/HFCG26a6Y7Tx426tiY3mHHF0gXqiqqRKcLTw8gXj
         18tVdqpNNonqZFYp1GqwYlfv+CDHYfyekSrD1QZxZgqQ7OED8mKmnua7k9v+qNtja7yP
         BSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773500147; x=1774104947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ca5kh9peUXUreTgn89AvAH7iYz5iRwVMohpHmv4hihs=;
        b=adI+K4r/S6Am/RQvThlKvawXrdsf2uW4q5teTJE0HzVRQLmZQNnAbc56C8AowXETnL
         zf3MEd1cl5VMISPlQMZLwOA087++Xf8RhozlKQUSV1V9hOLyR23syw+tCfMpkXCx7Nr7
         RlPKkJCrMvUkx49aF03IXfjOy+sHn/+59PJBYT8nOELtyfcvXMOZJ5gmo6WiQvXTutt6
         0rrPy9dkSpkibUJiSn4TYs8s9D4+tCoIAYzItVCnmjkMZj1tQCa+k7p44SvgDUZuh1XO
         x34ScSswaL8NG37zCJzpov4VzSAYnV1c5VWZ9XfeOB+33eoS+bRSoCKQWuvfEnnnB+fb
         o5hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIchbrIQ8/EUKlowESZ8pY0Xl7qpzyXgpsja3/g0/XO2eoEWABcoY+yIIO66Z05FrLIEnqE+uIrxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHBxKzNSk5yAAbObROhv2r+cIg4u5i4h9dZCZOUY17zMu+w+ca
	Ruo/uGdpAXF+noT//Hq2U011Wa8znvbJo9flN1YXO87ZYonHtj+wtSRwc2JgdjOxdZA8jupdb61
	DI9BY8rrYcbkfG+/jvzSjGriFn2v+JhhjwwPX7drF
X-Gm-Gg: ATEYQzyrv/ZDVBmMrPz+Vd9IQIml2tdq4rFUlE9B48/HwNAwQLMWLG8rESiRLkUxrgw
	m1jo7R+wwWEs4iI2Lb+NEPJIlxYB0+yz6SjjtRiahXRE16b57ChgeeNHYKNHNUqJxbTJRLlwWLD
	SWWBTDVroggP54vEIlMnaA7Vp03DlT5g6RbhahPez3lOvvb+zn/rPLBWP5nh71okropejalFS2k
	6H3BiRHyHeHjrEvnXaEK7iXgOPqqFwNWRbtqI54Ua0R76HRhXB6oWDRPzEvi2Pi4mdzgNlmbQOr
	rJXsF0Y=
X-Received: by 2002:ac8:7c4d:0:b0:509:1009:e7a6 with SMTP id
 d75a77b69052e-50957de8d93mr94929211cf.43.1773500147029; Sat, 14 Mar 2026
 07:55:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com>
 <20260309-tcp_rfc7323_retract_wnd_rfc-v3-6-4c7f96b1ec69@gmail.com>
 <CANn89i+PypF1cK4mnp8L_eCG_z+3Aj6uxJoohm_=DwGfR1=4FA@mail.gmail.com>
 <abCkmiCSPkmxzECa@gandalf.schnuecks.de> <CANn89iKYxs644ardFFSKo8d0EXL_2A5eUQjWZ3yp9-Q4tVLKzQ@mail.gmail.com>
In-Reply-To: <CANn89iKYxs644ardFFSKo8d0EXL_2A5eUQjWZ3yp9-Q4tVLKzQ@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Sat, 14 Mar 2026 15:55:35 +0100
X-Gm-Features: AaiRm50YYJlq5QX8gZcwi86mWXpn3wuRkajMKwpZDqBSmkf1bay96mdoaMNxTlo
Message-ID: <CANn89i+sEmZxcYDXHE=jtjNxoitGE-z4qkcS_eWSbiWHyNTs2w@mail.gmail.com>
Subject: Re: [PATCH net-next v3 6/6] selftests/net: packetdrill: add tcp_rcv_neg_window.pkt
To: Simon Baatz <gmbnomis@gmail.com>
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

On Sat, Mar 14, 2026 at 4:58=E2=80=AFAM Eric Dumazet <edumazet@google.com> =
wrote:
>

>
> Then add my
> Reviewed-by: Eric Dumazet <edumazet@google.com>

BTW, this can be done in a followup.

Jakub/Paolo feel free to apply v3 series if this is still possible.

Thanks !
