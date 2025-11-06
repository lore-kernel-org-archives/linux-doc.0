Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FD72EC563
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 10:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762426639; cv=none; b=TpMcT50NzHfunocuwYVcaDZnv8oc2/4bSdV851dD0AzwIPZhAgXnDgKSXdHHH3frr2HhaOLfNX/Ab6evYSk0PKhgO+dJ7kEcl0v3tpvMO5BO1eKh6WJg2XZUeg4T03AXT/+uR4rPNz5j/ocXxJtdv3WAgAe3vY7QcRyrL8T9Pxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762426639; c=relaxed/simple;
	bh=9invMdERfhYKNnXg74LQAFbXckBFXN636tVMG/vPhmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CfhOJC76IE5x7xY4fHQJBDrV8BBnlcH+OtZAV7jLKbYGAEWQxKAG8esuDr8rt82wavyepdePWA4yNmZis0wM3X/o1dqrgFvyTSq7r+F0MivHjPmftJfzvsA+LYtlWRN6tr5nHa84fDzR9H16dJpZeEXeO2TGJ6G76u6glebS3x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U2ZNeaJ+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=grDVQcA4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U2ZNeaJ+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="grDVQcA4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762426637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kDAN1HMJoQQtQ55I20Dw66H+vj6obQIAmVodeSEuemo=;
	b=U2ZNeaJ+RaHnqIZimKjMdZYFt5ev1UuR2dNIGYuv5v23yoVdI9U0tiZu9X0yP26V2CIO19
	efUvIgOUa3ENQKeiObGq+lAyY57StiflbVh3fq9RnWfrO8cLpwuKMSQk4CiqtmaHivnyu+
	GRlxgftD4GdDf03aVHob1xL7hhYVQ34=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-BCUzUq_CO_CMHVxBDFaLOw-1; Thu, 06 Nov 2025 05:57:15 -0500
X-MC-Unique: BCUzUq_CO_CMHVxBDFaLOw-1
X-Mimecast-MFC-AGG-ID: BCUzUq_CO_CMHVxBDFaLOw_1762426633
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-429ce8ac89bso723790f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 02:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762426632; x=1763031432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kDAN1HMJoQQtQ55I20Dw66H+vj6obQIAmVodeSEuemo=;
        b=grDVQcA4IIFdE0So8kwToiBQbNlLPgaIdDPiSxX+C/FuB++X/USEZOPz538ddu4iNT
         Mx3ebMoFz2lRn7MwLwXTUuMCHAt5XM7Ytnqr/Zu4kHRU9+4cgSpAIyXWXl3CVkXog45d
         BwKJucxcUPFMcjsl3o2eliFK4MjWROxAhSQRlQjV58OvFAHMwk8VA41EDUKctDdLYj++
         uhODnFr1vzcRSSG0GwusM9vO250X/D4dXLaPhVLjkEHw6A80FmaeqPQcPOT/2xGkFxuc
         QiCGAWA7ljTZNUhxTHi1t2+CMf/DRs/ayYeucX0R4dZqTenDsfpLK4E+G3+/pT8NnFMq
         0GqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762426632; x=1763031432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kDAN1HMJoQQtQ55I20Dw66H+vj6obQIAmVodeSEuemo=;
        b=gZXtJlGOHJP16oQAo2GCqJvxMn75AtCAekVdI1+1iHZh1BTpm65RbVzD1zlH9/3Jt6
         izROV4VBLPg5XPduq10OuAePWKh1hSEbQX1nUgH+TxrqpOkkXT/t/yRvt/TTlJ6RBlvy
         sBzio/q9Bn2RSfiRWQ6VfGwNu2jpIMhJnzS+EOkZIo9JHF1DEYlOeAZGAuuKYoRawRys
         YQlMO0aSvWLg82/u2MiaZPGxLF0yKdhfplHZft3LR+H8l/oou0R4OG5bCKogPY2YWeHb
         FVAvMTl5Pd3kWRvu6u/SCWcbMc2ILc/70LjYdP8Wn4YSqLH4s/cOebZ7gyLGmGNO5MZV
         PBvw==
X-Forwarded-Encrypted: i=1; AJvYcCV8dew+4YFZ7AXj4dz5te/ziV+MaejBT3tv2haLePHQbrcXtSr/Gwfjyph0gjRW/8gHyerWQxkb4wI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywii8xzp/Fu7uU0zsJD86hKNmrWxqaDbH53zBkSGdSvDwNVjEqO
	NCaPOER3t96fJ1DSG28AkgeL4ldECuudxYTwYp8Fe6rbv2lCClk2rbr+UntreJaNWZ6KNNL9yki
	5Mw0B6tWTw0mhTybbGQfpMXOM63DVvm2EC6TpHmWqrq58zdDEcw9I5O7PD2NFUClHpfRPyA==
X-Gm-Gg: ASbGnctN/fI72vue1BfGNwt2f9LEZh4JX2lsxKQgwUcBmXVDEBmWbUbdg1AJcku79RZ
	L3nyx/L+zE9n5ArjPSFlS8XgCoLjznnZpIR44oy1XPEj4q4DarZS/KXO434pQc7mL0NzS+nAM8v
	Ff3PgbEsZiaLCpgTBSyQNjXMZK79D8FzwsuVxz6XAslZuAmk3P03Ned9S5Sb5xP3UhjLqAcllxS
	4okLCkvedSasbhKm5BJt2X9BhU4TcivticQajjIy3yHlH+gntILPDd4rWPLvHGPv0G0AM6TpgGv
	S+M9+/P1vQKO5w2bFknFrZuIEWf8nxZGn/EcwSXap/abyqIU1AZxTMkGSdCyktTNPB6PUY+EDt3
	+Nw==
X-Received: by 2002:a05:6000:2811:b0:429:edfa:309e with SMTP id ffacd0b85a97d-429edfa32admr1087648f8f.20.1762426632517;
        Thu, 06 Nov 2025 02:57:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuo4Zz37FAjgeqMkvLjK2yjkrDZq4CtR/TEtSlcvQWi/2zCplPBisLlN9/n2avyBib7PRi5Q==
X-Received: by 2002:a05:6000:2811:b0:429:edfa:309e with SMTP id ffacd0b85a97d-429edfa32admr1087626f8f.20.1762426632119;
        Thu, 06 Nov 2025 02:57:12 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb49baf4sm4127409f8f.33.2025.11.06.02.57.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 02:57:11 -0800 (PST)
Message-ID: <2f38933e-f24e-4a14-a906-0d06bc194a21@redhat.com>
Date: Thu, 6 Nov 2025 11:57:09 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 01/14] tcp: try to avoid safer when ACKs are
 thinned
To: chia-yu.chang@nokia-bell-labs.com, edumazet@google.com, parav@nvidia.com,
 linux-doc@vger.kernel.org, corbet@lwn.net, horms@kernel.org,
 dsahern@kernel.org, kuniyu@google.com, bpf@vger.kernel.org,
 netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com,
 kuba@kernel.org, stephen@networkplumber.org, xiyou.wangcong@gmail.com,
 jiri@resnulli.us, davem@davemloft.net, andrew+netdev@lunn.ch,
 donald.hunter@gmail.com, ast@fiberby.net, liuhangbin@gmail.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org, ij@kernel.org,
 ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com,
 g.white@cablelabs.com, ingemar.s.johansson@ericsson.com,
 mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at,
 Jason_Livingood@comcast.com, vidhi_goel@apple.com
References: <20251030143435.13003-1-chia-yu.chang@nokia-bell-labs.com>
 <20251030143435.13003-2-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251030143435.13003-2-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/30/25 3:34 PM, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Ilpo Järvinen <ij@kernel.org>
> 
> Add newly acked pkts EWMA. When ACK thinning occurs, select
> between safer and unsafe cep delta in AccECN processing based
> on it. If the packets ACKed per ACK tends to be large, don't
> conservatively assume ACE field overflow.
> 
> This patch uses the existing 2-byte holes in the rx group for new
> u16 variables withtout creating more holes. Below are the pahole
> outcomes before and after this patch:
> 
> [BEFORE THIS PATCH]
> struct tcp_sock {
>     [...]
>     u32                        delivered_ecn_bytes[3]; /*  2744    12 */
>     /* XXX 4 bytes hole, try to pack */
> 
>     [...]
>     __cacheline_group_end__tcp_sock_write_rx[0];       /*  2816     0 */
> 
>     [...]
>     /* size: 3264, cachelines: 51, members: 177 */
> }
> 
> [AFTER THIS PATCH]
> struct tcp_sock {
>     [...]
>     u32                        delivered_ecn_bytes[3]; /*  2744    12 */
>     u16                        pkts_acked_ewma;        /*  2756     2 */
>     /* XXX 2 bytes hole, try to pack */
> 
>     [...]
>     __cacheline_group_end__tcp_sock_write_rx[0];       /*  2816     0 */
> 
>     [...]
>     /* size: 3264, cachelines: 51, members: 178 */
> }
> 
> Signed-off-by: Ilpo Järvinen <ij@kernel.org>
> Co-developed-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Acked-by: Paolo Abeni <pabeni@redhat.com>

