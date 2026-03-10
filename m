Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D75F42EED1
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 08:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773133094; cv=none; b=ZgpxOOxPE7niFU6ZePP8jMMJHiBj21Qybndy+IEboUP05GCcwc4YgsumztDK9yhOytSAr5yIgU/aBL776E77UNTwYZEelBtaJsKTUL8nFuvdZqBnMRH2tADw8ViukztAIwqxUVNBsRDATNKGubFLNPlohWbWRymvSu31JNIFn2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773133094; c=relaxed/simple;
	bh=PQp8DMIf16n9Q4WyqamERG099p/UWm8vclqnIXpsCxk=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:Date; b=MRF3BGHaQ2BuMzvnSGXw6+ptt2f+rShWlyR/vAGWZ9dGRWB5MRSUcAFYdK2cI6AydT/l5wKFkSowDS9BRt1t61voBS0EF4AqkUh+Qo4BOMDegKNh93S58oY6KCmSLHMnd0LZcTtKpPQsusHiz97CUGrGpJrtbY0YB5tZeja+nhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SdZLP+fm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=k0GFqOHH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SdZLP+fm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="k0GFqOHH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773133092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W5ixMEPwXpO/+b+N1FZSIy8hHYQ/BR1nMYxWpusN4IQ=;
	b=SdZLP+fmI2XhOVd1rQJslvqAIf/lih57cvRePOQYzynQLJZHhD1MfhPDB44/7h/e96Ngxe
	TZv4CTqj6NlH4UE6ZyMgCx7Ac4iEoSwVttnrOV4d5qZaZmugHP+g8n4+uJJaB4bmunuUcg
	eW8z4DugOnHLGouSe1RccDIYlZRcV2s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-GTqeGZV4M9Wuw-kULFf5gQ-1; Tue, 10 Mar 2026 04:58:11 -0400
X-MC-Unique: GTqeGZV4M9Wuw-kULFf5gQ-1
X-Mimecast-MFC-AGG-ID: GTqeGZV4M9Wuw-kULFf5gQ_1773133090
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4852d27f473so16777865e9.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 01:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773133090; x=1773737890; darn=vger.kernel.org;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5ixMEPwXpO/+b+N1FZSIy8hHYQ/BR1nMYxWpusN4IQ=;
        b=k0GFqOHH/UWrRd1z09J2jblhDYQDC4igfIEdXfrgVZdYpt5G3ipiQkrqONgU+GAF2b
         77G4+gwzWQKyZv4J1QxVN4ZUfpH6eXsbXUux2dxyQmq84hyrBhMZTR/zbmpt0zjTb0IC
         nsbtR3Wbf/ce5l3oXAQSXrSEds0sdKm2UO3j+RDxRFeSQ+c6Lc6sJZROrTGT5nmNMTNx
         RMMKDmyv3QnjvnhDM1ZS4/4Aq+tw7BgqiQEh4bAM4KNFFO1u7FdIPKvpEGi+3DHakr/u
         BQtbie8gxNmo2qS7eIr1wr7rck7uOvWXjNW7QGnadLJp37fBGQ/axz2lCHDNKFjDvqv6
         wsrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773133090; x=1773737890;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W5ixMEPwXpO/+b+N1FZSIy8hHYQ/BR1nMYxWpusN4IQ=;
        b=FulBZO69JbPnOOsLx1PKoUY6J5WI+LrujSMqX/PbnPqeCdOuS4NXyeeojp4Q4tn2QX
         KuedRGP6HLFv9Hhl4jAV25+QIyrV4XwL4iCFZyx9Nkx5lx8DmBCzSM3ZDOiqL64INP+R
         IjDicMZrX6aAF+vcXxH2WTBW6vqk6WnrDS0EXALY/s9z0+jAf2EzG767Jpu4hLB4YXDa
         Pmm5m8ZGE2cSfouDA5kepOwzCyCahONz2Qw7w1ShvesFdksFNfggbHtbvLXpBV0xAwAe
         vn6Pfj52XD3FqOpGNsyzDjtBgP7oTM1XFQhSNSR1gSO1LACdGOGtOrLF+5k3ySn7Ici8
         WFmg==
X-Forwarded-Encrypted: i=1; AJvYcCUJGnx4uO3xFnwFdjsxM7eriLR557wUq1mS5g6I+oCuEsgE/eyOS7ozRyMu9q/v/ynQO/dX0rzQdpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZgMifKYlk5khtZLf6+u3uyQ/VP2jMSjoEnBAfl6/eOzRIZTwd
	QMpqmpBd2g/1SLcwy0Oz8ZBzYYLOjLNN19nKWQKlGbnwNZJi9HmWHP8/mEWenHuf1sUm0jiI/C1
	h6z8K6+udshh1PAUZ9wbUem0XKLGCts8dT5K35nCwkpeiTVWJkvtQGUSfBe8+LQ==
X-Gm-Gg: ATEYQzw7Hwu7+VtlFinNLNvQFfJ1tK6oluN6dVnWqCPJvDA3y9DNUnssH0D3cikfKSQ
	v5KGjc4o5Nh7OeepmHBuBcDhuUTrpsPAm1tUTjdhlgLFaTc7KjuEKrHHXD/wVRBF9784M4JUV7f
	54vUoODzDiUQpEXHNeEFwX8h46RWDayJwAnKX6O5AzTBjG7CbePi4l5bLcYEaHoK6DWJ2CKe7o3
	a+oShzYekrox1wJlvCi8AjUVA60qo04SmX7OYX03C8kKh9vJZ2dvb5+fhXrAmKw8YQbyYsvJ+Yl
	adf6PFq2zzk2KtRyowuvZciJXXLNZhV5P07odwaq/Td6HyDW4U2ZzOhA2EdAIPs69iuHRRlxnpP
	JmkG1ogRevwj5oCKqef+zyNZ50PYB0gTXMrf3BZlJbV2t1F35kg==
X-Received: by 2002:a05:600c:4712:b0:485:41c4:e2e5 with SMTP id 5b1f17b1804b1-48541c4e453mr36599955e9.27.1773133089739;
        Tue, 10 Mar 2026 01:58:09 -0700 (PDT)
X-Received: by 2002:a05:600c:4712:b0:485:41c4:e2e5 with SMTP id 5b1f17b1804b1-48541c4e453mr36599305e9.27.1773133089122;
        Tue, 10 Mar 2026 01:58:09 -0700 (PDT)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [176.103.220.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f3cdsm67159225e9.14.2026.03.10.01.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 01:58:08 -0700 (PDT)
From: Stefano Brivio <sbrivio@redhat.com>
To: Simon Baatz via B4 Relay <devnull+gmbnomis.gmail.com@kernel.org>
Cc: gmbnomis@gmail.com, Eric Dumazet <edumazet@google.com>, Neal Cardwell
 <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, David Ahern
 <dsahern@kernel.org>, Jon Maloy <jmaloy@redhat.com>, Jason Xing
 <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com, Shuah Khan
 <shuah@kernel.org>, Matthieu Baerts <matttbe@kernel.org>, Mat Martineau
 <martineau@kernel.org>, Geliang Tang <geliang@kernel.org>,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 mptcp@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/6] tcp: implement RFC 7323 window
 retraction receiver requirements
Message-ID: <20260310095806.121d198f@elisabeth>
In-Reply-To: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-1-4c7f96b1ec69@gmail.com>
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com>
	<20260309-tcp_rfc7323_retract_wnd_rfc-v3-1-4c7f96b1ec69@gmail.com>
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Tue, 10 Mar 2026 09:58:07 +0100 (CET)

Simon,

On Mon, 09 Mar 2026 09:02:26 +0100
Simon Baatz via B4 Relay <devnull+gmbnomis.gmail.com@kernel.org> wrote:

> [...]
>
> diff --git a/include/linux/tcp.h b/include/linux/tcp.h
> index f72eef31fa23cc584f2f0cefacdc35cae43aa52d..73aa2e0ccd1d7a6314a00c27950b019b62a3851c 100644
> --- a/include/linux/tcp.h
> +++ b/include/linux/tcp.h
> @@ -316,6 +316,9 @@ struct tcp_sock {
>  					*/
>  	u32	app_limited;	/* limited until "delivered" reaches this val */
>  	u32	rcv_wnd;	/* Current receiver window		*/
> +	u32	rcv_mwnd_seq;	/* Maximum window sequence number (RFC 7323,
> +				 * section 2.4, receiver requirements)
> +				 */

I didn't follow the rest of the discussion but, at this point, what
does this mean for applications (CRIU, passt) dumping/restoring socket
data? Do they have to adapt? I couldn't find this bit of information
anywhere in v3.

-- 
Stefano

