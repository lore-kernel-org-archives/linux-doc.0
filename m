Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34E1261B80
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 09:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768902842; cv=pass; b=ZP1liuCOVehWbGtxrB+BVYkgzAhN/GYPfg8hUEM16+1kUOr3UrQHG6Tit27lQ+/CpJGS1RyC+T0DeebqTZuGxwIHW59cQTYtV7Fl7p57JsAv7qAcMdmIEb+QbAjjQprWv7mbSRG7TBZE6xa8uYDLGpI2Xkdu8H3bVDzhATtHn7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768902842; c=relaxed/simple;
	bh=bxs1d0ToON+/Bp2OpxrCQltJoJYi6G5PLdJ09NcDoJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sVnQJtDNqc6T7OLMDejhzwHrWOoMu3+5BRKN5S+5LlXEsteLZcyYwrFMd/cmjFUy2Dprgs4sPG4AJPH+7D4EqNJaF9sWx8J38ejzksvp82gyzdZgDSO4GGJ8Xp1hkuKaoF3ktqBj/qH5ZGmIZ6IliKrtiSJLAnNDCR5/3AHEnoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QGEczJpA; arc=pass smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QGEczJpA"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8c5349ba802so482102685a.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 01:54:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768902839; cv=none;
        d=google.com; s=arc-20240605;
        b=jWsLxaewrA6ivVtCU943XA+0bMYAiWWPcRkgQHBLXVBC99ih/uS+VfksP4P9brc/6x
         NoMGscymC6UyPLsqN5B9DD3Yj2FfRf/bAZN9H3ulCRuJ3sNM8NTPt7dQ0xvIH0lHyjDD
         QlUDYNn/lTUEV8/iRXFalneaClqmiKligccX1TKzN/tJBR+C8svk3TUB2CVf3ZaFFkBx
         JKNRis4YSdGeghFQmx89Ieaa6LjgzvZ/5dIWO4GWBGumqdhs7BVshEYI45UonP6q2wkX
         jpOE4EN4WUw6hoqks3czbtrXo0dxJz4utO0s8WdAwVty9J3BgwEuVbn0c0OmTAZPjZin
         jXLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M9+RAXA+S1GCjNSmsIFRavSncliAYK27qdBowu4HD38=;
        fh=Auhaj3NAdaYqCdMwDUI7VkTT/LgcdEisbGtS6gvrg1I=;
        b=lpP90UDaitMiABUqbFFLGSJKkg5U/EDE8rh2pSvbub+Z3/8ftdYfw9cpfM9g91PuMb
         QR1G3REyvFwVAZBR3KcVhLZTY/5xZyTxG3Drhr9RgZUGHLiEHd9KGZoOQjIPjwLTec5+
         H7YlgX3Yt+/qtBv2khoa+srQLzE1eViHvQT+Pu3B0gLVwBxw9t8Ha7vwkZQvmftKUIi1
         xJbqfhv5K+/oTccAinHK6gqCujQ63NBbGU1in33L2djkmwcaLh04jxfBiJGXBfk4qbHE
         /Ri6yupPMtpPPL7blylZKg1bL97oisNYDQ+r8lhlUqkNEvc3zlV1U5LDiK9LtiR87UyX
         BZ9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768902839; x=1769507639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9+RAXA+S1GCjNSmsIFRavSncliAYK27qdBowu4HD38=;
        b=QGEczJpAluT8c7LsRlygARCVbVUWctoyx6kf6J4lKavXSxu8Tft8yGH7w+4VtaLNbI
         gmNxry7Zm+wZWIhsvmJRByMTZzJ0lzq8JrLRA4jOiIpwoGGEg5Y9OsSwhKAX1tPi3G64
         LMO86/ts6hjaPxxhUKc3RhjlxxRBHKsxa+gZ8qusGSXtES42rbVEntrfnUwQLLgi6fA9
         D96OsslS0f+5XajPPuRKNjUje1eFYzf1vejmO5zI/YlzInRgCCn47FJeDRiOG3ieywru
         CQMk8wn4FISM3SWopCDq5BKSOUR31+WKPJnSKhoPHo9nTobwR8Xxqu46oSg2tKeitxCz
         FALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768902839; x=1769507639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M9+RAXA+S1GCjNSmsIFRavSncliAYK27qdBowu4HD38=;
        b=ZG1J42yi9hLv7WwxpG/M2e9RzGTbFHuO5k7kOPI4RV/sNLe366aMQtx4r1ODAl1vfV
         duJu2fmAv78gkARqn3puFvfh8+wS8PUhyz53Vb6QS9ytbN7Q2FBqA9+dXOFb9JA+O8OK
         nIgFz49UcgmKjDsVQssNcKjCYDVdC/RCWlZ+R6R9EnhyaH/K0xcL2p52r/yIqx3y9CSM
         6kdebicWu8BnQcbitgTmAcwHTxTm7Ujz+AmHN19pKBuST20Y/LFwxs1Y+jO6V/VwqlXt
         DjC7Ss+Eogzv8b5yirkPDxE2s+2zuYotTTwqMXEbedg9F5VxROD8hlW8D5TfeZcFP7XH
         mpVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKO+oh59W7iS2uxbpdWlFpFHL7ezDXsBMPtf5yWsIDy1JFMmKACZshfso5FXo2pwXz3Ff1KjeMHvc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt3IDUKYEVVdDNhsFrut8UmRJrkWQl9ByDhxCjpbb1CQXb89N+
	lTT40zP5QFz7+Jw8AZpfKh26UgUmFlkNo7GDo7P4EdbplBM8+oDYGLtQqjxYNepYu7l0aG38O/U
	J7nGAOQDPSRedeL5s5qiNs5UO/mRR0BkeptgBBi58
X-Gm-Gg: AY/fxX4pLFeqe5YeDCi/pup3ngaiKNnLrrCbUiakMYEpP1aZt+gx77P8AC9Uir467hx
	4hP7+rgCtju4s/xodMoux2qrBFeTJvHnl2bIUsL/N91YJR91mevCCwA1fOuisQjEIHFz6TqA4oF
	ZZxTUd2izjwMDG6gN5uUi/rjUnA5tyfH48X4/m1Iei+VIjb2oR/wNdTo8xuJA7Rso4iWBVGDtaR
	EPwBkRHjtOuz9ylkSpknmSUdpfQXgQPvBL5ULdw5UIMnDGQa+tRl6YjQZAGDgaDtFqDA4k=
X-Received: by 2002:ac8:7d45:0:b0:501:4a4a:c24e with SMTP id
 d75a77b69052e-502a160b06fmr183731541cf.25.1768902839039; Tue, 20 Jan 2026
 01:53:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119185852.11168-1-chia-yu.chang@nokia-bell-labs.com> <20260119185852.11168-5-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260119185852.11168-5-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 20 Jan 2026 10:53:47 +0100
X-Gm-Features: AZwV_Qg0IWXghbxwuvPJvSjMMI2uFuU_uwIEWxMla7dfzpOOQkjvRiJt8IywSHk
Message-ID: <CANn89iLzynvieqZUVK3NqaSpMT=-toZ1M4QHvQin5gHQM7T8yA@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 04/15] tcp: ECT_1_NEGOTIATION and NEEDS_ACCECN identifiers
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
	Jason_Livingood@comcast.com, vidhi_goel@apple.com, 
	Olivier Tilmans <olivier.tilmans@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 7:59=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Two CA module flags are added in this patch related to AccECN negotiation=
.
> First, a new CA module flag (TCP_CONG_NEEDS_ACCECN) defines that the CA
> expects to negotiate AccECN functionality using the ECE, CWR and AE flags
> in the TCP header.
>
> Second, during ECN negotiation, ECT(0) in the IP header is used. This pat=
ch
> enables CA to control whether ECT(0) or ECT(1) should be used on a per-se=
gment
> basis. A new flag (TCP_CONG_ECT_1_NEGOTIATION) defines the expected ECT v=
alue
> in the IP header by the CA when not-yet initialized for the connection.
>
> The detailed AccECN negotiaotn during the 3WHS can be found in the AccECN=
 spec:
>   https://tools.ietf.org/id/draft-ietf-tcpm-accurate-ecn-28.txt

While for some reason linux uses icsk_ca_ops, I think the terminology
is about "CC : Congestion Control"

Not sure what CA means...

Reviewed-by: Eric Dumazet <edumazet@google.com>
