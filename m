Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E000498481
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 12:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767873912; cv=none; b=RFfakxf0InAqUzUnWQMdhjOY2Vp2BycpZj3V9SGJmR/gjaJX8JzDPc2Af4ccgehria3hxSF9kYNPoni7XehoNY5yG+CzvVs+rmvjpccB/QFsdhXOgtXEJkmFXHs/nh6Tj6N0dUWTaoisndS/jOfox+VqlXYficWCMC0OfOglqWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767873912; c=relaxed/simple;
	bh=Flh5gm/FG6f2h7+d4LlYOxc+wsoA1WupGU+z5tvQXn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=OSG2w5gyAMYXfrU0nTb+tPUpuuIilWuHkSfc0UamW0NojHmRGhlv3vLcsYphAZqwi2K4gINSaFg+GMcqtvN0eok52rN5XIURVQGRyGnb65w+TEagJbwpOHJDkdqFaOk9UHWo2gRxa5/8VJe6w6k0Y0HOXfHHG8zg0YBW3DX/1EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TeCBiu6K; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=P0EB5tUq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TeCBiu6K";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="P0EB5tUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767873907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Flh5gm/FG6f2h7+d4LlYOxc+wsoA1WupGU+z5tvQXn4=;
	b=TeCBiu6KuT+jvEFoO6KnAOfRwVFn3oXgMIIf2STTuffzattE39Dkj4kXepVd8hTPwS5ADJ
	mOWviDjRMNaAOEoAKhoCefY4Z5y0vMDwSmefLCLdMgmjR+4fI0iEBXCv8lPuM/io//DVUZ
	NpoT+gHv/g3iCnPzIqVCXiBWb3y+Kyc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-XVJ05EpZPx23wfyv6PAAZg-1; Thu, 08 Jan 2026 07:05:05 -0500
X-MC-Unique: XVJ05EpZPx23wfyv6PAAZg-1
X-Mimecast-MFC-AGG-ID: XVJ05EpZPx23wfyv6PAAZg_1767873904
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-477771366cbso26861715e9.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 04:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767873904; x=1768478704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Flh5gm/FG6f2h7+d4LlYOxc+wsoA1WupGU+z5tvQXn4=;
        b=P0EB5tUq4gEPbQC8HFtAZIwPhtjivVywhg5mmDspsKEbQaSC/gQpJyyKK5wFGyWw2L
         07vwoad/3AOiZ2lVzMvR1pO1Neja3nunwK4QhIrY5bACcofo+d9Eyxn2fmH8i0rHhtr2
         +gN9vbo0QEtstBCtwY0IhqDmtogQGYds4puZcBDlzJKio7HOz6i6sZkjbKiuZb2cCn+L
         IVqVsjsrelFzg4txGT8ePwrN3yjM12kkjuzGqDrAyuvN15oRPreHd1yctO+wzW9dZk2k
         pF3behY8G/tY4QmNO+DLPOvJMkczbM3RChQmEVECJPx63iSzS1diTlQOkRMT4uhlOCJw
         M2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767873904; x=1768478704;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Flh5gm/FG6f2h7+d4LlYOxc+wsoA1WupGU+z5tvQXn4=;
        b=jWUnl2Avb+NY0TFCPMktGJokwz7nvEYYgJy0gmcwIJLmpcix6lfaBhchLxQZVY7y9z
         ZOQnePFG/2BbITU9hAQtY2c44G+NAR9Sy8ob/wYj67oq1M0cn+IiDO/LvxTMmcvbkfjq
         pVEp0Sjs2n+Yap9QhWwY4qY3LfBy88FJmpb2ppZ/STEd/dJhgh8bSUtv+pfsF6B8mPdY
         v3hfBVe8zpE43hKYFhoQixhmPWaCKyvcB/HM19iWGxnluOCNXrbxpFI/Cfvpuh7lXmWt
         UgoUbb0+x40ONjTp9ci6+p2PcW7Lt4P7RBwNapeKTfKNI5aAHPHRFwEt1LarYjVpyhs5
         EAkg==
X-Forwarded-Encrypted: i=1; AJvYcCV3SwKDhr3l0D40LDH+cNUY4mqW/VgJ9afem3tBwZJN3Tp8j/YhcPwGS/7/q33cXFnGkClUCZEFq/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YweHrgTSCVYsRcLwzDI4e2ksSrNGonEtcDYlCu5OxOs9gVsYyIL
	5yDybRtTyGQYtOavt9xy1nB/o2hoE34/h7hoiycIM4xM7+GTfIB7IuiN0iceFWcMbOxJ4ixEWwe
	evRU3xECD6RRNflcj7TQDUoe0q25nUInkazZgzwT5BN51uudry/BgXJa19yVMTw==
X-Gm-Gg: AY/fxX4XLucL7AnymH8ptloSV0DgXzf26fRlOwYGyE0tb/yLCDq7os6mj7fu0Ifau3g
	HbMBcOMB4GWoJBiS+58s0xnT61C7p86qvB+2qfDdpS/S/S9ZyHbdgIe6zJmiRdUCUMMZtcy0OHU
	Xphu1zDBXkoOdwNgMxkQPPRUuCiR7zZhkxoOe4UzlWcxk03Mz/hO/MbwhnoQQF91o+/wKDtDgR0
	iqSx2g7EEEi+XERQ+unsGNdiYG+gnNSNUDHinxUAOZYuBNYhU/gFt/c58vvt2vBQBbPwha4B/YE
	gAOrYGBfUVWnPJ8DArLROLv4h2pMkyHo1P3aHS8hsMQ2GnABAsxCpTlcTKA0rMOm2Hm4z6uMbMC
	zl7asckWkPz5R/g==
X-Received: by 2002:a05:600c:4447:b0:477:3e0b:c0e3 with SMTP id 5b1f17b1804b1-47d84b3b8b9mr66671925e9.32.1767873903878;
        Thu, 08 Jan 2026 04:05:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyd3EobR8+CtqNLr1SJNq4aJtqIFnG4hdPC4+x+J4mPj7mFR2jjmxPx+hGX2qRU6Jn66CAIQ==
X-Received: by 2002:a05:600c:4447:b0:477:3e0b:c0e3 with SMTP id 5b1f17b1804b1-47d84b3b8b9mr66671435e9.32.1767873903307;
        Thu, 08 Jan 2026 04:05:03 -0800 (PST)
Received: from [192.168.88.32] ([212.105.149.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8662ffaasm36179535e9.6.2026.01.08.04.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 04:05:02 -0800 (PST)
Message-ID: <9d64dd7e-273b-4627-ba0c-a3c8aab2dcb1@redhat.com>
Date: Thu, 8 Jan 2026 13:05:00 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 net-next 00/13] AccECN protocol case handling series
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>,
 "edumazet@google.com" <edumazet@google.com>,
 "parav@nvidia.com" <parav@nvidia.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>, "horms@kernel.org" <horms@kernel.org>,
 "dsahern@kernel.org" <dsahern@kernel.org>,
 "kuniyu@google.com" <kuniyu@google.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dave.taht@gmail.com" <dave.taht@gmail.com>,
 "jhs@mojatatu.com" <jhs@mojatatu.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "stephen@networkplumber.org" <stephen@networkplumber.org>,
 "xiyou.wangcong@gmail.com" <xiyou.wangcong@gmail.com>,
 "jiri@resnulli.us" <jiri@resnulli.us>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "donald.hunter@gmail.com" <donald.hunter@gmail.com>,
 "ast@fiberby.net" <ast@fiberby.net>,
 "liuhangbin@gmail.com" <liuhangbin@gmail.com>,
 "shuah@kernel.org" <shuah@kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "ij@kernel.org" <ij@kernel.org>, "ncardwell@google.com"
 <ncardwell@google.com>,
 "Koen De Schepper (Nokia)" <koen.de_schepper@nokia-bell-labs.com>,
 "g.white@cablelabs.com" <g.white@cablelabs.com>,
 "ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
 "mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>,
 cheshire <cheshire@apple.com>, "rs.ietf@gmx.at" <rs.ietf@gmx.at>,
 "Jason_Livingood@comcast.com" <Jason_Livingood@comcast.com>,
 Vidhi Goel <vidhi_goel@apple.com>
References: <20260103131028.10708-1-chia-yu.chang@nokia-bell-labs.com>
 <56f6f3dd-14a8-44e9-a13d-eeb0a27d81d2@redhat.com>
 <PAXPR07MB798456B62DBAC92A9F5915DAA385A@PAXPR07MB7984.eurprd07.prod.outlook.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <PAXPR07MB798456B62DBAC92A9F5915DAA385A@PAXPR07MB7984.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/8/26 9:47 AM, Chia-Yu Chang (Nokia) wrote:
> Regarding the packetdrill cases for AccECN, shall I can include in this patch series (v8) or is it suggested to submit them in a standalone series?

IMHO can be in a separate series, mainly because this one is already
quite big.

/P

