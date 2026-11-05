Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876780;
	b=F1Zfu+o5nNRQNVeWCXPoHXUbl1G5EK+5Kh03jq5QKGFmDTqGXGInRLYPOiSbOV/EhNO0
	 yP+TEemV7nUDpEmjXfGl5NMi2axjwzTXdiX8fVIRGA+c60XA6BMQisBRByBVTXVOEQGfV
	 s73tYDW9R+rqfAYMAK5mlF1nbyncm2eS8OOItCiH+Ggmh5sthbLBk8mJSuiBln4mICLxh
	 vE+iDGjK36zUNJagYhi3sDiWheCZEU+90+YdSYedi1duXm1OAbnZJf9Iv2awaUfljqaaz
	 wvBBVBoEJQ//k4IFokLIvlda2gZ7uS2EYLWrCxrFjhIRJHkbgzbhIc/ATcTQiRgGU1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876780;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UkU61sxV7gzGCXcoseb2sfWpv/CEGqGt6zB6Q3Q0kmk=;
	b=Fu6cceFP8OnmpnOAyL9iIpaEgJBr1XVrWor3WyYTKL++sXHkr5Xbcp/1Dcj5EYJ80+RH
	 xrGToyxjwOIM6YkhnaDQ3AXB2vW7vwxncyoPpDhxyPeGFUffIiEGgcRB1RuiN7RAZlmZO
	 F3gUIBOTWXzZx4c8mhGR1e/xk/2uHmY8F2CF09b4dv0FCsAS5b7O7I2PWxrmm8SeYZCbQ
	 ZPkPzefvxsghY/o9g/GAGutxfYa0BbZxunsLlV7z5WI9Q1YnTAnFMSFvUUUR99xhEgMD/
	 O2zlQW+Fd/isZt/BQ8Cex/eDW0YuozB6YuJ4R9BZZ99cHhm/xEzfSVjhUr+1a5fyYAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KiSV4y9F;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=WsXbCiUM;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FA5606A329
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 11:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74FA5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KiSV4y9F;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=WsXbCiUM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793876778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UkU61sxV7gzGCXcoseb2sfWpv/CEGqGt6zB6Q3Q0kmk=;
	b=KiSV4y9FBhBBvYxcQ+s3SvHZHpEQp/7IJrJjRPWFEufX3nLgS6EaGE/MGlfHeco6v3Izux
	2hrMXybCfjrTzFyG8ic3k9omS0I/kfiefjx0DRhL7En2ibJOHMUZ4bwjmP0ZjTJ0HzXTV2
	dKuDlpYhXG0dnCA2Mr1kMwuOz5cygww=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117---TTYQpmP6uz5xw57yIj5A-1; Thu, 05 Nov 2026 06:05:54 -0500
X-MC-Unique: --TTYQpmP6uz5xw57yIj5A-1
X-Mimecast-MFC-AGG-ID: --TTYQpmP6uz5xw57yIj5A_1793876753
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1fdde384cso10850595e9.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 03:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793876753; x=1794481553; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UkU61sxV7gzGCXcoseb2sfWpv/CEGqGt6zB6Q3Q0kmk=;
        b=WsXbCiUMSkqnE7ngUMd5bOc1Y7Lq5+aUK9198qqWt7QWr0eDvbmtZOI1vFmOKCjCVz
         fA44mYEnwS8K/g2zCYrINd6So33X1L/gDnLg/GQAZvMRYDZALc34jwUR6wOr8CIF5UOy
         +3BVK/kmtB9JfESFQdCVUCW+lCTlUt3+9X7a3swK7j4IVqgh1QQ+w8q6ac2lMCSLqHHi
         tsFJkYT6d7vB8jQpu2K+M+RpWi8VqiHAdDZtuJJXlgPClPdWiq/pE55S2yTwp4qjncDb
         K/zMD8S8Cjdz2kqrZiL3W7Q/Y0NdYBxuajnx/UwMwbrpWczieFQnuKBcA5LtYfG9is4N
         serg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876753; x=1794481553;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UkU61sxV7gzGCXcoseb2sfWpv/CEGqGt6zB6Q3Q0kmk=;
        b=wIIquq+SdYFAq1OqiG4990ff6Gq1msWskUwuK2y3uMGrMGMPVBPWU3Tro7OOPyGXc6
         f4Owsu37G5pt6zixh1+okgVN7xsEiqZAaRVamiRr2T4E30AwYHrbgeQ6TOR+IU7+GZ3/
         PDFw+DtLOj73sbYZ0FBJtSyAhFwXbgNPMaUQSIMsyE6AD6LOdRLPEILW3nENebEQJZd/
         W7vaYtFIa0ihsxE2WxTyCCBbhI2AEzPgvZoszlOhmiP6tM+grhqppv/IP58lu+OjWJcv
         cgZFr0HipBRWfaq119IYFqfsKJDKYOXzSbXHdmurhYWU6uWy7ha6qR//6/BtwQawH0EF
         skJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwg+CMYDuv3La4Yigf6ODicA2xM9DdShLzNRZYt5jEFy6t0gq9GcmzQmzicZzWWnZTie95Gt/IYHQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/ckJUIFV0QVzXjIycn+AtVoElzazVvhzYqsg2xZu76HeSekMU
	uCtUobZ0l0gGWET9tbd82be0MAyS+TP+z6NrYAgvvBX8Cy9JYu5NwtRZpwp3Hx8aYV4ebOYhBBy
	RdOi4EVQT6pesqKM/2XfwWcL+njfozHaE5/LZjPEV1R7FF2VsnqCdQRI2XBRnWQ==
X-Gm-Gg: AYBFou0+l/j1k0RbFJlQujsUYSMrcNEWATqC63iem12yg8iqAh0mViB9hHiXId0hpH1
	F73tb+SB1oNi+SulPDfkJaWnV/4eWcU4Blq+R6X6JIX7SOf734IEKY7NtrFW2cgvmE34RlLNDM5
	KmnVbb96OQH+9SvaQyi4AC7HNbJ/YCIGtoR5AW/YmAUSF1pyZWvVKwWghS8a45wzTIbXMOScuUT
	GT4Bc91NSM/2MJHCfLPjID/bCmWsMmLgiSCvuXxLxsqb+awKfImSsnjt3MAcraoDViTJiVwHFyN
	EmLiM41dNoD8BbjHWiX5Irup3u07UT9vO5j69NzSZc30yZ3xpMJGxVOZ7QbF5q3QJBkOZj/nb1d
	LQQq3UUne3Et44NDe9PEup0xWkkVMFw/elC7RN0ysZyHJeguKx6mCRfAkxMUhGh+LyNqFppYpXs
	pvYCapI/03qh+vjyeCXBsQPFcwGAakBqqgWut5JsZRzcE=
X-Received: by 2002:a05:600c:a49:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4ac17ffb2ffmr423454895e9.9.1793876753393;
        Thu, 05 Nov 2026 03:05:53 -0800 (PST)
X-Received: by 2002:a05:600c:a49:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4ac17ffb2ffmr423454415e9.9.1793876752918;
        Thu, 05 Nov 2026 03:05:52 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e2ae73csm59042825e9.1.2026.11.05.03.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 03:05:52 -0800 (PST)
Message-ID: <1518ee19-95b3-4a13-b36d-5791324a6a23@redhat.com>
Date: Thu, 5 Nov 2026 12:05:50 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 0/5] net: fix misc signed overflows caused by bad
 sysctl values
To: Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, Thomas Gleixner <tglx@kernel.org>,
 Joel Granados <joel.granados@kernel.org>,
 Fernando Fernandez Mancera <fmancera@suse.de>,
 Petr Pavlu <petr.pavlu@suse.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 Willem de Bruijn <willemb@google.com>, Maoyi Xie <maoyi.xie@ntu.edu.sg>,
 Oleg Nesterov <oleg@redhat.com>, Zhan Xusheng <zhanxusheng1024@gmail.com>,
 Gerd Rausch <gerd.rausch@oracle.com>,
 Nikolay Aleksandrov <razor@blackwall.org>,
 Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>,
 Wyatt Feng <bronzed_45_vested@icloud.com>,
 Hannes Frederic Sowa <hannes@stressinduktion.org>,
 Flavio Leitner <fbl@redhat.com>, Petr Mladek <pmladek@suse.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261101061331.286404-1-jiayuan.chen@linux.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261101061331.286404-1-jiayuan.chen@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/1/26 07:11, Jiayuan Chen wrote:
> Recently I have reviewed quite a few fixes for variable overflows caused
> by config values, i.e. a value set from sysctl, module params or netlink
> that is accepted as valid but later overflows when it is used in a
> calculation. I believe there are more of these still out there, so I
> used an LLM to dig through the code and it found the issues fixed in
> this series.
> 
> All of them have been reproduced and verified in QEMU.
I think that the 'net' target + CC stable here is a bit too much.

The uAPI changes, even if reasonable, can still impact weird scenarios.

Targeting 'net-next' without CC ing stable would give time to
possibly catch such users.

Also issue predating git history and exploitable from root only
nowadays is a quite a good signal for net-next target.

If nobody opposes soonish I'll apply the series there.

/P

