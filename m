Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C521742A580
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 12:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767874751; cv=none; b=ectSMzHyZMQbjUCr5glgbyTqbTVDzxR7WWeOpA7jsQB2YJ9CS9G667ypuI53WzhbJ4HR62++mKlW2hF1lnem9ccR61pSm/Fi+kE7Hy0Pa3dxYAv3r637WkwJHsIe/huxojAR/Pbk1s/Ajl+ajosJoPqD5SIa+KQ/Zu5lMIFlORE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767874751; c=relaxed/simple;
	bh=XslR5Skl/tw/Xim8K72eczklMzvlOxARWwVTFZz2hyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fmn2/86Gke4HfyReZgdEyWLpAe4D4chobnWWzSw2Fhq0GN6wna5bK4q8hlDqBNYShnXCaZeJFLy8GA0C9dPAOxU1UMSD3D+rwGWvm1tby8OZ70Tk8K36hBJq/1ncJ/JEHZu2dYUBsuz2Dd1V0jFtnDmYxg4O9iS2zfeMCzTJD3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ja+7V8F1; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ja+7V8F1"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8c24f867b75so308613185a.2
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 04:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767874746; x=1768479546; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XslR5Skl/tw/Xim8K72eczklMzvlOxARWwVTFZz2hyo=;
        b=ja+7V8F1ZwjWz5gIR9kXgeJQwqADgKnij+xGhHeSKOkbZ3j0fpqSXJgQwNFDUpSKHu
         BLRlwmWb5dG1rM6Sz97lQd8qG1LLDpxMRxJYaMGnmPnlptG5NZpECNAIr9Tm3qHE5hyY
         piUAzuG5yyotnME9cOrJQl6abmkEoDMJBDTvgWGMzgl/OE0W9gkeHApBotwro/H/ZKDs
         yL/HIYAMRAuDuFSAmVl2ueileIkRxaFoPFTmU+Q9KvU6xmU7xtRbJRglFTI+LTVlwgjV
         Jc3u+GQncx4lvYaL+FriQh4RoBG8qp0tuMoKbeqSCwslizSnn2sb1YoiVqWHZZy60zhk
         JhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767874746; x=1768479546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XslR5Skl/tw/Xim8K72eczklMzvlOxARWwVTFZz2hyo=;
        b=qlgsS8BiHf5Jb1y/vmBN0xoWuSbnc4dtVKcASrcclmczQsNdHDidOxB0xN5q8ktpWe
         sBKsMS859bQumcMKW+OqDhwj5UAyiYFRhRus5kpZuofYbLjCwNmobttOEgSczx6hLZK+
         Iy2rrFrXgO2pdFmdFhYce1A7TvP7/P1cjEGM482WAwH8ZCs3+gaIQ0dS0MVgkbAzmD2Z
         5i+AwkqWZg/WcELq4nvOdpKCkMnDC3QQ8bCc21VA81+bvF09CdlJeQdGfRDMYJF3JNI7
         BjGoD86qQ8F23L9c8OmpDMq0/ZRcdz+x0zWdG6NSi4kEQGWAd3sQOocEZHZaLXCkChTb
         5Gew==
X-Forwarded-Encrypted: i=1; AJvYcCXK/Mlu+n/zpWI7vO4zRGAAfXHb3vZmzyhBL3cB6paDpDPDHRLZtYuQaGIgUFtq5ba+Yk7P6LxPBiY=@vger.kernel.org
X-Gm-Message-State: AOJu0YySwuuYW03P3jemRRuFzA8X+32adYVCr9DY4iXD+bfIp+L87qPu
	k/bsD3+9xryvZRl1QosSfaQQ9HEH4YmGEhHtAZNB8mfrYDkmldIAi/oYHQPYo+5HVV72V5MUHUy
	gzhqoWsf7gXtDSkRCW2M7TYqJQG00TgHaxfIiDZw5
X-Gm-Gg: AY/fxX7abex1ReZTVlPYPYqeJa3/4ewvoO+Jbcztx0oC69nDfDRWmtp/YcqmixW4zx1
	ucy0jjSPPZLTq7DpvBQynNKO0nX/AzZH2e2KNpt3wGAAeXegwsAuRg00UTKPfYmAYkw4qYHCy5C
	5ivK5X+GHokBdy0pGCJjAJBgqsEYH1ZPVS7lUwL45f0AX6RuxaDJ/4Qcf4cyh4XmxbkgtcUWHwF
	VvRQ+2bl/IvDAmPDNIcBW8LfDGUfPWMq5SIOoqZA0ZBSi3DG34T8d+TvU1PefRp7TunYJkhNW3M
	WU6d
X-Google-Smtp-Source: AGHT+IE6CBzyCrx4IFVvz/0AqM39PV6mvwh7lOn07b9ckEerO+EpyGAL7TIuu+rk4c57j55fgOdIw95rlnzvDdfaED8=
X-Received: by 2002:ac8:7f8c:0:b0:4e8:b2df:fe1f with SMTP id
 d75a77b69052e-4ffb487f955mr83824451cf.28.1767874745665; Thu, 08 Jan 2026
 04:19:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260103131028.10708-1-chia-yu.chang@nokia-bell-labs.com>
 <56f6f3dd-14a8-44e9-a13d-eeb0a27d81d2@redhat.com> <PAXPR07MB798456B62DBAC92A9F5915DAA385A@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <9d64dd7e-273b-4627-ba0c-a3c8aab2dcb1@redhat.com>
In-Reply-To: <9d64dd7e-273b-4627-ba0c-a3c8aab2dcb1@redhat.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 8 Jan 2026 13:18:54 +0100
X-Gm-Features: AQt7F2pGmpHwQwLbaeD-dBc7rrFfr_O4l9u7b9jAwL-yY9Bn1sm999duNbFyyYY
Message-ID: <CANn89iKRAs86PVNAGKMUgE49phgZ2zpZU99rRkJq=cc_kNYf=Q@mail.gmail.com>
Subject: Re: [PATCH v7 net-next 00/13] AccECN protocol case handling series
To: Paolo Abeni <pabeni@redhat.com>
Cc: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>, 
	"parav@nvidia.com" <parav@nvidia.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"corbet@lwn.net" <corbet@lwn.net>, "horms@kernel.org" <horms@kernel.org>, 
	"dsahern@kernel.org" <dsahern@kernel.org>, "kuniyu@google.com" <kuniyu@google.com>, 
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"dave.taht@gmail.com" <dave.taht@gmail.com>, "jhs@mojatatu.com" <jhs@mojatatu.com>, 
	"kuba@kernel.org" <kuba@kernel.org>, "stephen@networkplumber.org" <stephen@networkplumber.org>, 
	"xiyou.wangcong@gmail.com" <xiyou.wangcong@gmail.com>, "jiri@resnulli.us" <jiri@resnulli.us>, 
	"davem@davemloft.net" <davem@davemloft.net>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, 
	"donald.hunter@gmail.com" <donald.hunter@gmail.com>, "ast@fiberby.net" <ast@fiberby.net>, 
	"liuhangbin@gmail.com" <liuhangbin@gmail.com>, "shuah@kernel.org" <shuah@kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "ij@kernel.org" <ij@kernel.org>, 
	"ncardwell@google.com" <ncardwell@google.com>, 
	"Koen De Schepper (Nokia)" <koen.de_schepper@nokia-bell-labs.com>, 
	"g.white@cablelabs.com" <g.white@cablelabs.com>, 
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>, 
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>, cheshire <cheshire@apple.com>, 
	"rs.ietf@gmx.at" <rs.ietf@gmx.at>, 
	"Jason_Livingood@comcast.com" <Jason_Livingood@comcast.com>, Vidhi Goel <vidhi_goel@apple.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 1:05=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 1/8/26 9:47 AM, Chia-Yu Chang (Nokia) wrote:
> > Regarding the packetdrill cases for AccECN, shall I can include in this=
 patch series (v8) or is it suggested to submit them in a standalone series=
?
>
> IMHO can be in a separate series, mainly because this one is already
> quite big.
>
> /P
>

If possible, please send a packetdrill series _before_ adding more code.

I have been reluctant to review your changes, because there is no test.
