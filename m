Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7227378D72
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 19:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768937746; cv=pass; b=qM/JYiV+V5nCipzKmXlKZn33ZPeP9iIYSQ1/+3PzQqdY2Z1NBToT3HUuLSW6XXgprP9GcDwLtMERwlPmx2HRqIGbYvQpmOeMvIkAwflK8dVhvqI2PsyQUjcmn6CwaCbzT/SyirjJgdFt1D6voa5gBlWm4hywRbQetUXVnUp9rPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768937746; c=relaxed/simple;
	bh=WF1YekMK7Vrv0H+TF4xGFci8W9+NmGzjNHWUBOBXXGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKBUiE+WjIg3MvCPqRGfUvxjiFt6+ipcsX9zjN5jXLy28KxIHy2NfJ//RHL7MfC7n164Z6qWkVFp9RJR2UsOM0YrJHVS/N4AdrWWDME8P8CYRqlWPLIhLm1io8DlGSfN7LR1uEHz4VNyjPAq2A+nbNbljJ4RaZ3tfA+yRIwjK3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ERoCygH3; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ERoCygH3"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5014acad6f2so73421cf.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 11:35:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768937742; cv=none;
        d=google.com; s=arc-20240605;
        b=LVGB6dFM3cX+I18g/YzGqdinotUc7X9JO2Ob9r0OPOXp0ud8OfqPMpBuvwy8alrTSc
         QZPWR/qp+Nrj5LbCC3igKedaRgJSKlHLt+0o0k0Ut5KHXeFbof89KdCObmAITXdR7TtR
         mmIzbmjyevYY4cKK5OzEU3FW9UQyTBP1W54BjfWIUG16XtO3AWR7Y1HYKNJyXSHfo2f2
         AIaYipigPXy+0Cv8oFH4MqI8qiYc9jA/bk33hRaGA39u730Ua3HudX6YNbJDKCj5y+9m
         9FmP1OjuGNUiS9/0UZgnD+OL9apR+CCHIFyrtsgN4DtHZ60okJHNVbjBpu5fiY8rOZoc
         Mqiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e/JLh5ORNBH9Tuc6LhtRVdmaDdTnbVj6AxCAFCa2LO8=;
        fh=9STY0HqFTQqNH/e44oJvB5hzKcG0FIFgFPSOofz7Hms=;
        b=F/8VN/j+41Fg5XMxGDl50n9LkUixitsaNALNsjaMqKD3Zm8ufwvfeZesE/D3ImT0cX
         PIJhhJ5TexLAyNmTGJYqp2sQHx/oODfsFooWS/HUFqAjuL3TUeFj3MsYhQljx/eD1IHj
         VpExS8jSUdNdEKaIWQVzCsIIvmc6lqpK0bFZTGutlJmHq7+Soe9zmbAhWMaQToIFdHSS
         JxGzVdhP0mS4vKWrYnxQQQZ32FiC5tPpnsfUjIzikFqoFezBC/yX1oBcMGnyBCm2A/YD
         WJiNsBFDrp7LwlkrBHr+/PC/h0/ljThEIwaZlTlzmV8SOvzA0fy9fFap+ojCHMB+C13S
         IH+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768937742; x=1769542542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/JLh5ORNBH9Tuc6LhtRVdmaDdTnbVj6AxCAFCa2LO8=;
        b=ERoCygH3AcFxMxPwYGTkGZTbXZDhlgxcMEbmwm4PJpAJzPZ2jOhEMIfvhAoifDxQKJ
         JnQ852p7Byo1BQvVA/vhZgpKJaTmogDGXL+apt357qHp5BQ78ffFdxn6ZcvGdpfPNxeM
         fa4/56gIhjfaJmYJGGmUmMqIZxpV3vaXgv239ZfseDJfbx7TLXvFG7JuMw4QJK1ooyfF
         PORPIbcTiP763DY5PsqoBNmll2/YBizkCEh1HLiNNYe+WX15TB87NdRq/F0wWTDWCX17
         aB7Zagw9HuV2iUGBnTAPh5N+L+5gzJE0ao/csczIiPQcz/+qINWAC5iZg8Ec62KcO224
         +F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768937742; x=1769542542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e/JLh5ORNBH9Tuc6LhtRVdmaDdTnbVj6AxCAFCa2LO8=;
        b=uL76sk4W3bMCGdnHRxLqX6EymChCf0TJO69kECyeqTa6GEHwelxgSxXneuDuYOMCEX
         r/KssCyKGAbZV+oH5qdFApEPzILE8C2kyGqO8ZARLUZzhQFvsjLwD39bju4FGtc1vIpO
         4ssmmILfX1ENBhW1SfuMlkqd1WG6EcfAMzIOY3JA5SVJ335tIRj7VmbdhB0VJy9C/brQ
         4SQbnghlmWuNPIXIugKDwTUQVRhhq8hj7sZ20i+33jCrOfRlw6678HvMkNIWorahhoU1
         Hi+669ZsorU9DK0oALr/2Dka+pA2hf37jZ1o9GVdmpl0LSDctPmxTEuywNzXU+qvJftS
         MQrA==
X-Forwarded-Encrypted: i=1; AJvYcCVR/UXdlB6UYl8eMSyAodLo74uDRuYYe6uKm841JLN0OAypnxzC5pnU9zKgbHAq2/RNWJsM63l5Erk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu7/z97mRRfERFFCWgzuZDY8P/EfSa0tdp46Vng4QCLrPJEbSQ
	GfsG6Zw6ya7Zaf2vd2ZXTOTEHl9EQiiX7LhP4LqzraSrEmfIkpoxq+7Juf2os4qO1BqaYiaow9/
	rCM+Oix15BwmAcp4QnkOs5wUv6fSbZc/jArvhOpKS
X-Gm-Gg: AY/fxX6efkdXw/Qr1fm6JPM+Qo4bvgFIVyrhVOOnZvU52Ij5+PDqeRne7NJwa4VLABC
	vK8hERTrciATWRwGkFvobFg9ArmJjZ6VBwbKpOJBxU+69qUgYJaGCgJBGvHCAhhReHdpnxeD8Zo
	jRI1/M7ijendYpXBZCNNvOEZbngzmBtNLGgqmRFdlBEXuhEH9D+SSL4VLGPbUH336e0vQuMz2JZ
	Fn4fEEJOqpZ7o/fsEyhbvlBeXge/gDZrwB5KPxW6F+lx1ZWcFGAyDiyJJHMaRw0oG0+IOtiYLpJ
	gvJ2XRw8yDGvi5xLYuVH3PT6kvowNrpiKX9DnLJL3jlWFyYk2j38gkX4zp0=
X-Received: by 2002:ac8:5d0f:0:b0:4ed:ff79:e679 with SMTP id
 d75a77b69052e-502e0cee0e6mr1190331cf.19.1768937741836; Tue, 20 Jan 2026
 11:35:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119185852.11168-1-chia-yu.chang@nokia-bell-labs.com>
 <20260119185852.11168-16-chia-yu.chang@nokia-bell-labs.com> <20260120105352.423ea3cd@kernel.org>
In-Reply-To: <20260120105352.423ea3cd@kernel.org>
From: Neal Cardwell <ncardwell@google.com>
Date: Tue, 20 Jan 2026 14:35:24 -0500
X-Gm-Features: AZwV_QhVrFxVPZIRT7nXwat9WAQ6ye9fzegNqePUSTW1gnZC3HPe2JXn7dKWhYk
Message-ID: <CADVnQykJZhYQZMtqg+Cm4BnuVeaBjPi+VWseNK+K7Y4eZRq_-w@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 15/15] selftests/net: packetdrill: add TCP
 Accurate ECN cases
To: Jakub Kicinski <kuba@kernel.org>
Cc: chia-yu.chang@nokia-bell-labs.com, pabeni@redhat.com, edumazet@google.com, 
	parav@nvidia.com, linux-doc@vger.kernel.org, corbet@lwn.net, horms@kernel.org, 
	dsahern@kernel.org, kuniyu@google.com, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com, 
	stephen@networkplumber.org, xiyou.wangcong@gmail.com, jiri@resnulli.us, 
	davem@davemloft.net, andrew+netdev@lunn.ch, donald.hunter@gmail.com, 
	ast@fiberby.net, liuhangbin@gmail.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, ij@kernel.org, 
	koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com, 
	ingemar.s.johansson@ericsson.com, mirja.kuehlewind@ericsson.com, 
	cheshire@apple.com, rs.ietf@gmx.at, Jason_Livingood@comcast.com, 
	vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 1:53=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 19 Jan 2026 19:58:52 +0100 chia-yu.chang@nokia-bell-labs.com
> wrote:
> > Linux Accurate ECN test sets using ACE counters and AccECN options to
> > cover several scenarios: Connection teardown, different ACK conditions,
> > counter wrapping, SACK space grabbing, fallback schemes, negotiation
> > retransmission/reorder/loss, AccECN option drop/loss, different
> > handshake reflectors, data with marking, and different sysctl values.
>
> Thank you for closing the packetdrill side, and big thanks to Neal
> for prioritizing getting it reviewed and merged!
>
> I updated the packetdrill build in netdev CI and looks like one of
> the cases is flaking a little. Since it looks like you'll have to
> respin, please try to fix:
>
> # 1..2
> # tcp_accecn_client_accecn_options_lost.pkt:32: error handling packet: ti=
ming error: expected outbound packet in relative time range +0.020000~+0.50=
0000 sec but happened at +0.015816 sec
> # script packet:  0.181936 .5 1:1013(1012) ack 1 <ECN e1b 1 ceb 0 e0b 1,n=
op>
> # actual packet:  0.177752 .EA 1:1013(1012) ack 1 win 1050 <ECN e1b 1 ceb=
 0 e0b 1,nop>
> # not ok 1 ipv4
> # tcp_accecn_client_accecn_options_lost.pkt:32: error handling packet: ti=
ming error: expected outbound packet in relative time range +0.020000~+0.50=
0000 sec but happened at +0.015800 sec
> # script packet:  0.181952 .5 1:1013(1012) ack 1 <ECN e1b 1 ceb 0 e0b 1,n=
op>
> # actual packet:  0.177752 .EA 1:1013(1012) ack 1 win 1050 <ECN e1b 1 ceb=
 0 e0b 1,nop>
> # not ok 2 ipv6
> # # Totals: pass:0 fail:2 xfail:0 xpass:0 skip:0 error:0
>
> https://netdev-ctrl.bots.linux.dev/logs/vmksft/packetdrill/results/482201=
/115-tcp-accecn-client-accecn-options-lost-pkt/stdout

Probably this is happening because the SRTT is around 56ms:

.050 * 7/8 + 1/8 * .1 =3D .05625 sec

So the RACK fast recovery starts afte rabout 15ms due to .25 * srtt
being about 14ms:
(.050 * 7/8 + 1/8 * .1) * .25 =3D .0140625 sec

If we make the SRTT 100ms then the fast retransmit should be around:

(.1 * 7/8 + 1/8 * .1) * .25 =3D .025 sec

So I'd suggest changing the timing of the SYNACK from 50ms to 100ms:

old:
+0.05 < [ect0] SW. 0:0(0) ack 1 win 32767 <mss 1024,ECN e0b 1 ceb 0
e1b 1,nop,nop,nop,sackOK,nop,wscale 8>

new:
+.1 < [ect0] SW. 0:0(0) ack 1 win 32767 <mss 1024,ECN e0b 1 ceb 0 e1b
1,nop,nop,nop,sackOK,nop,wscale 8>

neal
