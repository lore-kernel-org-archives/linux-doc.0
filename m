Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834BF254B09
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 13:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752499376; cv=none; b=oplsEOk2ciSST7P9m8Gq7rd/dcmXE+/3SV9a95eUxClagR1z47zj1PFbl8T1JpyWtG+lk9wB3gQVF8rqqe1EvU64x6h3D6rQGBUT+gy9OjF9p5uYISsWPk6u1y2/mM7Jt6oHbn/owIuObwgWyJPjwVPMhPpSIEDyxrQ+ROFbN2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752499376; c=relaxed/simple;
	bh=DSltvb0vEhfUg7AEaM3U6pLDRM1PmY8c4GSdMZ0F3aQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GT0cJTWtGuTX1zVxJkq1KNHoQzSoHMUFsmAt5GGCfSYHswX+nw/KoUmdMSWkytyuVLC/tMoy2f3iVQzpRkilRN+Dwkv8Q2EExF6euLYryESu11reMlohqT2taA+aw3a9jasPjY4otzYrW9fvTrLCGOVAskY4x4m8RfexB7+OuXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KtzCk5eQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KtzCk5eQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752499373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+74sl1h9XcDCGHLtxtil1RR5aKu+l0UGJeyQC88qo+g=;
	b=KtzCk5eQDTIEP3LW8VGRh9EL8q0ClmFn3JgDB+sIL5b3VnB92TG/9swsjbe7It4tcrcZGX
	Za3FwKDrB2IlJJvd0RkOgYz7awZRk7Bhe6wA3vNZvheEfBA7Y+1rvL3ob9RAF03VIsYdKv
	3Zp8QMtpiaPUmNvz/O0jV9AT202o3qU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-gr1S3L6wNM6tAsXW4aopjw-1; Mon, 14 Jul 2025 09:22:52 -0400
X-MC-Unique: gr1S3L6wNM6tAsXW4aopjw-1
X-Mimecast-MFC-AGG-ID: gr1S3L6wNM6tAsXW4aopjw_1752499371
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45611579300so10414425e9.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 06:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752499371; x=1753104171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+74sl1h9XcDCGHLtxtil1RR5aKu+l0UGJeyQC88qo+g=;
        b=Yo1UMw8Nm1jqFy2Pct38o00AWr0FO8WSXOSKiBca1XajVCq+xNf+H1Psvq8eZ/h0h+
         mdqEIjdZpStMnzjitV/8d+yDLWCEyHNrDvemg72VeDa5NklllNzHX4HW64vK9F6Obnnw
         iRyUdRLtyvq71wbD+W9+hwX93JD9lN4mORmj7FOx+WyhJJgZKt6eRvw6pstMoB0ca8OR
         M/4eG+5DK1M1jHoTVgWuoS2B88gKi95NSEDCxVtOfj7lWwydiW+li3qm6o5O+68BqMOC
         qZuyYTmJBOBy5PuN+xMlkdRGT3AzbNtr8rlILI9y1CB/j0h4ksSu8qGZYdgzcB2v0cs/
         C7NA==
X-Forwarded-Encrypted: i=1; AJvYcCUtQX/j88UV26KUstBw5XEgBeq09UGpr0GZ0oyPfreE83X8ldxo3oAcWAQl3BRRRqPcNzX82705hq4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzspfZhREQhEaeWadZBOJ9X0uVqlkQcFL6skBSJKn4Qhl5EHgyn
	0leFBpZWH+L+ZLTVuwFVyXw6E4Gsre9wuae68twA9WLC8Tp8BYJAqoVtQYBI5yelslZTkhSStbK
	W7akgmuUdy/q6K40V/3biwowFaSSLaGl0Rf+BTWzcUQDRu+PrSSak8kBVZB8Jlw==
X-Gm-Gg: ASbGncsDcx0saF6j9gCmSIqm2PFJYBULqVyb8Wgrk9I43TFZTeyTiu9oD1ujgZp11jx
	gqPSt870ot0bnqEXiG/WRcmHw4dihMWDXI283N5lL2jb/PzjLJSYAJJvII91HHwVBV3M0Z00fIV
	FMF6VpWS3DD3DfUcBWpJLRem/dsGNqWV/H78A2o1YTu9seA3u0Ubn9zS/VmLs+dAMqYZMbpqFPJ
	MZfJQfb3TUnyBlG8SYBUE/Kqk8qya3PBfdaiC8EyzFFOZpv8UIFT7Yb8iYj18ubVCOzqYha/WE2
	cQpEpoApx6PfLalqa/qaAjiHNJVD64fAEBXxi5aaD/0=
X-Received: by 2002:a05:600c:848c:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-4557f0b52f2mr103652135e9.19.1752499370526;
        Mon, 14 Jul 2025 06:22:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNCV4TnpnSpBNGL5u+cKnLCGpcA5mGUjaCcEkgIGAq0CDxzLK13e64IbjzNHnO8ged+huEHA==
X-Received: by 2002:a05:600c:848c:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-4557f0b52f2mr103651615e9.19.1752499370003;
        Mon, 14 Jul 2025 06:22:50 -0700 (PDT)
Received: from [192.168.0.115] ([212.105.155.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5032fcbsm173656775e9.6.2025.07.14.06.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 06:22:49 -0700 (PDT)
Message-ID: <eaeaf8e5-ac94-4368-b897-538c757f4e34@redhat.com>
Date: Mon, 14 Jul 2025 15:22:47 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 net-next 07/15] tcp: Add wait_third_ack for ECN
 negotiation in simultaneous connect
To: chia-yu.chang@nokia-bell-labs.com, edumazet@google.com,
 linux-doc@vger.kernel.org, corbet@lwn.net, horms@kernel.org,
 dsahern@kernel.org, kuniyu@amazon.com, bpf@vger.kernel.org,
 netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com,
 kuba@kernel.org, stephen@networkplumber.org, xiyou.wangcong@gmail.com,
 jiri@resnulli.us, davem@davemloft.net, andrew+netdev@lunn.ch,
 donald.hunter@gmail.com, ast@fiberby.net, liuhangbin@gmail.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org, ij@kernel.org,
 ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com,
 g.white@cablelabs.com, ingemar.s.johansson@ericsson.com,
 mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at,
 Jason_Livingood@comcast.com, vidhi_goel@apple.com
References: <20250704085345.46530-1-chia-yu.chang@nokia-bell-labs.com>
 <20250704085345.46530-8-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250704085345.46530-8-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/4/25 10:53 AM, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> In simultaneous connect scenario, the connection will be established
> when SYN/ACK is received after patch 23e89e8ee7be7. However, the
> third ACK is still anticipated to complete the negotiation for either
> RFC3168 ECN and Accurate ECN. In this sense, an additional flag
> wait_third_ack is introduced to identify that the 3rd ACK is still
> anticipated to ensure ECN or AccECN negotiation will be done in the
> ESTABLISHED state.
> 
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Co-developed-by: Ilpo Järvinen <ij@kernel.org>
> Signed-off-by: Ilpo Järvinen <ij@kernel.org>

I saw there are existing pktdrill test for ECN with simultaneous
connect, but I'm still wondering it there is a real use case behind?

AFAICS simult connect can happen only on loopback, and [Acc]ECN on
loopback looks useless.

I would simply not allow AccECN on simultaneous connect - assuming that
would basically drop all the code in this patch without no fourther
modification required.

/P

