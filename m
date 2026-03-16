Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F3B2765FF
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 11:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773659380; cv=none; b=ZBdOn6zC0u30d8CI0979nGAFqEQzgIiuLU8/Jyp5d7P2WvqwTr0py3IZSVzT2eZMzszMjDvwyJMfr+ksZ66Niv3u/v/2JBqXfM1gAaQAhcXsf/+5A7vQRy/wxao1KoNjwCMSWGQ7sxZ3bHlxV8lkmH2oYS5mv3/0mpYc9alxDpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773659380; c=relaxed/simple;
	bh=4jmmhwQ9HX1nE0wu5X/8gnKDvmvDMxjNyuG7KPrwFyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WP0OYMjiJrGgs7oKsQB9O0EWl9MhHLs1xeDBjKTVHMfnNBKEcHdOlj1QnMzOZU1P+S+VYBtRWueCJayMdEPHiZ2AIf/xqXUtp3m6LOdkd5Fj0E2IWyafXu7okpBiGnSwU9oUwKACo9ufwRTZRXh6NeZnba+IVEIXcWaJXR/adkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aJmyttGJ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pg8DR4Zc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aJmyttGJ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pg8DR4Zc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773659377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJ1qCUPpj4bfVKkIIWkXXV0ps2+j94E+3GVF/7CvIho=;
	b=aJmyttGJVUFAI9sl6w0H+S1qR8xULZmZXGX+0nG9xXKVGdVOOaiqmd9VP1oc5pffWTR5Mn
	VNlPoM4YXu6EZJ5ct05/IAPOiwdg2M9ly8reBzhlpvL7EFPwatvHYLtalEPHXM9gBt1z1P
	+sYdHjloxX6KyPaKiTLabW4DTLsfXtc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-MecoPRLXP46vJT0gk0pptw-1; Mon, 16 Mar 2026 07:09:36 -0400
X-MC-Unique: MecoPRLXP46vJT0gk0pptw-1
X-Mimecast-MFC-AGG-ID: MecoPRLXP46vJT0gk0pptw_1773659375
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48541cac34dso41925815e9.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 04:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773659375; x=1774264175; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJ1qCUPpj4bfVKkIIWkXXV0ps2+j94E+3GVF/7CvIho=;
        b=pg8DR4ZciRU/ukhYwrOaX5lhErZFYQYqqGkF8dOZBruSptnLZupCiLBDh7he1CAsoj
         OwMo2wYzzCgoWmiCIDr5UKJUx+mOnWSeV9IdoW/xKbCXQIjXY/ewQ3ikUHOziqinGCbd
         7RakQrOrF7YGCOxR0brm55nfK4kwkQmjycIgVoP+C+3OTevfsvvFm0a9LAyZh/VDC3Qh
         YxlJ8WPAr2TO64ipKdC4jtOdJUPFAKZMDK5jOf9fJDDlN4as6ujUXPyjMEyCVKR04E6u
         l+B+2js3mM4UFo75FrSa6i6fCQb91jF/XifK9rEfDtdt8VNXav8ivTnHOfLkP1rukbFo
         Celw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773659375; x=1774264175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJ1qCUPpj4bfVKkIIWkXXV0ps2+j94E+3GVF/7CvIho=;
        b=pImM9+HTrNedGsO6t0XhRWMrO5x8JVXRA53P4FTFU25A4c6BNmhOtpqPGD5HJzOnuQ
         WokSHMwZjuoaqpqruHpRTdtKv6V4M4fMY6brD0E/cYxvgTNku7r31exSHft5rcZADSqj
         KAjjf1+IsDCR21rthbcf4No0hu5uggtUNWcfX4ComxZZxgeAgIC30mKHhR1PWj2bTNm4
         syFrFCDPyz2Pd4naZcbJvpbOnB6jnUbrWvAGm1ASsDqu82FHR8UmTyTKuqSPoq44fsTJ
         Ra81Ymw7p0gY5sR35Zc6V5t8Wxq1xI+mnAqXqxA1gPCcynklyTmBwJ3BPrK5OIKM7j4j
         oTGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy22c+j7GqLBSzrzQMEBigCWJLLGG+jHYq0dEwGDzHMdeGcQgyyKyaF+y9BISgTai9d/8lau5rhrk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9/wgA35fQwaGy9zPJ++P6XYIL0Go7+QsnQWufE2QAOwlN4KLP
	64xOAwt+z+mYwa/bB8NYDz20vHsPFk5YkMJGn/16b5DNRk4raiF0B89kQDXEnW1QsfgE2E6bFdH
	q2eElNjUaSyL5ha9Gq6RbI4fTCcDNPsXjaCWu81q1BKolYO5XIzHfNU2qw6Iq8w==
X-Gm-Gg: ATEYQzy4o0xf9YX3iUuVOPyFDM95AMMFKmGC7EpKRuHWE7v1x52OtOlhs+/aDJqwF34
	XQD0ORfRCY+TP8lbY+kkmNXh2D1yB5dFa+9wmcbou1GtyhJVcslLyhkhnCU7BsZc4S4NbXBkm5l
	/BaZRIeDnEp6EJx+Aaa52V4sx1a0j6VUknbkxiQqCtYwiV0NR9gTB//TQcAUXJzzAHIL8OgK/Vi
	s5DeFl+S2Di9IMETB8fnqR8UVILsQ+dl1j4YXrcfz3ccWBGqUu9ljyEqi8C20XNqg9BWnNTyhhb
	oyVJvQT50/aD6sEYU0CL3HhUL3Um02kcVm6UEPj7WuqN5uRg4kkEYqYvBXXl66A6cc0QbkFiSFO
	TvpjQELakFJMgplLWrlkY06jynwo3gQYCwAM5DmQ/tmB7FksoW9VjiNI=
X-Received: by 2002:a05:600c:a4a:b0:47f:f952:d207 with SMTP id 5b1f17b1804b1-485566facc8mr211849555e9.19.1773659375347;
        Mon, 16 Mar 2026 04:09:35 -0700 (PDT)
X-Received: by 2002:a05:600c:a4a:b0:47f:f952:d207 with SMTP id 5b1f17b1804b1-485566facc8mr211848875e9.19.1773659374904;
        Mon, 16 Mar 2026 04:09:34 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73dasm1212991845e9.2.2026.03.16.04.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 04:09:34 -0700 (PDT)
Message-ID: <b042de90-79e3-4976-9bbe-b6df3266caea@redhat.com>
Date: Mon, 16 Mar 2026 12:09:32 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 00/14] tcp: preserve receive-window accounting
 across ratio drift
To: atwellwea@gmail.com, netdev@vger.kernel.org, davem@davemloft.net,
 kuba@kernel.org, edumazet@google.com, ncardwell@google.com
Cc: linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, mptcp@lists.linux.dev,
 dsahern@kernel.org, horms@kernel.org, kuniyu@google.com,
 andrew+netdev@lunn.ch, willemdebruijn.kernel@gmail.com, jasowang@redhat.com,
 skhan@linuxfoundation.org, corbet@lwn.net, matttbe@kernel.org,
 martineau@kernel.org, geliang@kernel.org, rostedt@goodmis.org,
 mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 0x7f454c46@gmail.com
References: <20260314201348.1786972-1-atwellwea@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260314201348.1786972-1-atwellwea@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/14/26 9:13 PM, atwellwea@gmail.com wrote:
> From: Wesley Atwell <atwellwea@gmail.com>
> 
> This series keeps sender-visible TCP receive-window accounting tied to the
> scaling basis that was in force when the window was advertised, even if
> later receive-side truesize inflation lowers scaling_ratio or the live
> receive window retracts below the largest right edge already exposed to the
> sender.
> 
> After the receive-window retraction changes, the receive path needs to keep
> track of two related pieces of sender-visible state:
> 
>   1. the live advertised receive window
>   2. the maximum advertised right edge and the basis it was exposed with
> 
> This repost snapshots both, uses them to repair receive-buffer backing when
> ratio drift would otherwise strand sender-visible space, extends
> TCP_REPAIR_WINDOW so repair/restore can round-trip the new state, and adds
> truesize-drift coverage through TUN packetdrill tests and netdevsim-based
> selftests.

The series is IMHO significantly not trivial. Can the end-user meet the
relevant condition in practice? How? What is the net benefit in
practice? Is that observable under usual conditions or require
exceptional circumstances?

I think we need a strong motivation to merge this kind of changes.

/P

