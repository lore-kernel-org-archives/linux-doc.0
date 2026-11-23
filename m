Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795417657;
	b=JFX50QnvsA3AJjNco2bvs1xgE8dEAlOojc7niawZgQnpkli8H3nNbw+3M6zL4W+Pczkk
	 BXnfuoAnV3x+QXAfLf/4lKrWhqg4gZiorDyL0NKS+jmpKigRIkjvuYQPuPEBfFnUWrQl3
	 /wpA4nYL13KU0YRWTnP+oFLxJLRW6yGBGSLz7mnTxF6WxEeKTnK9Q5trwsoH2CKJt6ndQ
	 D+6RM1EiKwUE2sHm+u3nmCPyalZU4FvkTYnDeZYwV3wRFkfdEB+Blm52sH8QQKEvGLvci
	 SlCN6SUJchW2sdAimkiFbqcomiAzJADO4rX0sD2rwll39Nz6vWS0KyjtQnzw3HiMPnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795417657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=MsxSnERYYFOLpooDmz9phzS6JSJAH8F8JlBPwPYUgdE=;
	b=jAtFaO6x0qSDPlFTq8wHMXp9I7WRw7BbK7ARrOUVzgD6FMkv6jT9YdA9+a7aZgK4aigP
	 3h/n9rJNZnNSNIjBqme9gF4EuB2+nOojdCoHw6zOCRxO0P26fYsiJMeHezNBL8T2mHZhn
	 xnFTWUqp0duyNmJ/R8gOtY3tAllWSppHhUfNvEyfbk9UjM0P77+DIKdfTnF4KxbTSEmA5
	 PpdOMr0di9j9sEfGLitifcwn4ISsxQeN4mc0NZPsCcADEx8uimKqTqZOGDHPNgDAGbMUZ
	 UQ92o6zrwD0sVIwN8YeF7JvO/4tvPHHCH9YDWPyBwuO5XC5ZX+0ubUf0cg5ftjDg2GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--starchang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=U+lWctsR;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E38F606A31A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 07:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E38F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--starchang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=U+lWctsR
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b930598cf0so5143348b3a.1
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 23:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795417657; x=1796022457; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MsxSnERYYFOLpooDmz9phzS6JSJAH8F8JlBPwPYUgdE=;
        b=U+lWctsRGzRFPIowLeFXgiiB6l4PafdP0ufQnLQM460wToUfWjkYeAmQgpG/S76Dff
         hF4P4QUg39kTO2662erx1wIxq1ld2FBQcb7PTTzaSxgaAK6ZhGxEAtwOwG3Cr54uGUpR
         po2M6XPV6Jr9wL9YBgYZhNuhAXt47Uyg6TR8b3BpULTyrf3H15vDbkhc0nMoBzkP/fac
         dpoHwMlbWi6wHi5jJvj5WxXHdcbIlkWQR1UDaFWl6eKEjxqqBqPbjnqX2vVWpyFGyA3v
         xKKrisqHYyAXaBI3qcAqlIxnAKdWdGIhDwE4/AlcXYFIdm5SnZcuIanTpwrfJFwOO5Ea
         18bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795417657; x=1796022457;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MsxSnERYYFOLpooDmz9phzS6JSJAH8F8JlBPwPYUgdE=;
        b=VJBYblONdT9SpPnV9GqeGNDDtkEASFec53rmtafX6iXPGHxgA3JwJpv3h7Yqb1PeEy
         Jyno8T9AKVCrwFR87zdTCAsAwfnqnpmnzRJohkhSHeC+uhMIT5ymeG0qSjL7a7jxZfxn
         vUtsAE/y64lD8tZ+nMXU4gjLqcU3qM12HplhOQjll38TkLzu9TsQewNWBYMjAJuB+Qnx
         Mx0fEkpq3YbRvj9W32Nskc9y/qpykdqIhMTvGk7hd8Fj1sAPZqpv5QYzLRwyUMKvpqtb
         vCKvwDYu0hiMgWgBF3zp7/lm8/nbV+jS5JKnwdxwh83hZclx6Fq1IBB3+n5QMUcOwsCi
         N68w==
X-Forwarded-Encrypted: i=1; AL+hErF8lyQHkrPP41HBVnssUCRnsMG7tHxKgn2rp1KY3cQ5wLbKRiIpWEDuetBEmFQIhF66X+FqOFp0tWg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aB1CpA2/QSy3AuSnxbxBJsPs1PxgIkMNxTv9ftd0+SRm8zE2R
	ILhj0PQ9X1/I++nBXljuRddQYfua3QX5e/2biERAoEYw+1mJpiJn/wBvjughY2pQMPXeYIXFmgT
	EMwEa54wIbrhdnCo6oQ==
X-Received: from pfgu2.prod.google.com ([2002:a05:6a00:982:b0:89f:afc:76b5])
 (user=starchang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:984:b0:8bf:e028:7864 with SMTP id d2e1a72fcca58-8c87663e154mr10249455b3a.0.1795417656556;
 Sun, 22 Nov 2026 23:07:36 -0800 (PST)
Date: Mon, 23 Nov 2026 07:07:34 +0000
In-Reply-To: <179541590924.3294.14959742776383569350@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123063608.3665186-1-starchang@google.com> <179541590924.3294.14959742776383569350@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123070734.3686009-1-starchang@google.com>
Subject: Re: [PATCH net v6] arp: Do not update neighbours from ARP in L2
 multicast/broadcast frames
From: Star Chang <starchang@google.com>
To: netdev-bot+sinfo@kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, Julian Anastasov <ja@ssi.bg>, 
	Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wangroger@google.com, 
	starchang@google.com
Content-Type: text/plain; charset="UTF-8"

Hi,

How it was found: internal security review of Wi-Fi "Hole-196"
mitigations, which found that drop_unicast_in_l2_multicast does not
cover ARP.

Triggered: yes, reproduced in a lab setup on a WPA2-PSK network.
Another station injected a group-addressed ARP reply (sip = gateway,
sha = attacker MAC), and after the locktime the victim's gateway
neighbour entry was changed to the attacker MAC (seen with "ip neigh").
There are no kernel messages or crashes, only the wrong neighbour
entry. The broadcast request variant (sip = gateway, tip = other host)
was pointed out by Julian during review; it goes through the same
neigh_event_ns() path.

Best regards,
Star
