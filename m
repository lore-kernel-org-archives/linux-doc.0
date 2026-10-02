Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E3447D44D
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 09:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932698; cv=none; b=XHgwBixKj8PcGnTHssEQg+PfN0l2OpEjg/TgKJlSBTzOGuqKOK9krcOEJ5+5HFyobqjYG2dKcrLHMHt84lUJXP+fxn9CVeqteVJunEiL+FyeQB/UsDC8RPBHmAB44Riii0X/S5O1MizdTaIEmOEWtKMnQpJDOw0orw92RPMRJoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932698; c=relaxed/simple;
	bh=Qfsjd4gOBk2R1cAVmxNn9b1xSjQOZ/MyAh0pURKAmQo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=rvgN9UzKrpSSL/bkLMp7aat3RIfnjj3Txw0YPsIi+m3WgxNkSczethDLr/jlza6H4mx4M+i3QSysVk4yHqVUMilDwm+93q1RNArLvUxAXDiVh8GaJO6m+kWarO7WGHSniv7ww+avfF4C9ZVBH1cmpCxemgjCDrV7CpxFEoQu4Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2HSWPlO; arc=none smtp.client-ip=74.125.230.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2HSWPlO"
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-91784fbb60dso43390016d6.1
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 02:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932695; x=1791537495; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qi9AutxC+YxaVYc+sgXQhd2bNMCFaltRc/nQQBHbNXo=;
        b=C2HSWPlOBODAEnXbDpuwl56cL4P+YrbZGRADpH5kpPpdv41r96qFVxMojhe+alWWwz
         0h2yB1VQvIK2defDyTkcbtFsX57pasAF21csbbMSgK7CKg5JTSGjOahXBMwudFw4Tj0Q
         k9vLHNkpW8dxJHs9fQL/iYpRAZ281pepRmfGLWRGHB9iXlcHVWunhSa94RgxXGa9AhE+
         yxDewJGzhEzrOtBDcOBeIwNnLft0/Cg6SERXowQ9Wt7+UYeFys9URt0oRonjWthWeOKw
         5Gf92ZM+V/SpiOVUzTRd33dmOu4H36gtz1mhxFG4M4iueKfx4v/4wpG894/NW6xnDGHA
         Sslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932695; x=1791537495;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qi9AutxC+YxaVYc+sgXQhd2bNMCFaltRc/nQQBHbNXo=;
        b=mkwoEFyjE67ligGzv3tb1jxEwAI5SBAjchlmCFHOCO8F6h/Z9ynIUE/uqoNTNL1TVb
         3zqg8m/FuxF45uarxXjQumixo9MMqPyLu2fFBtLDhYMI9mwKdQF6jN9JYNUQjYSTc/5w
         NuHB2hwbXJV1wvH4U1OPPpkjYSW/A6RADHSrH9GRMel/GqEJOdOtySQFZBgxwJJU+1w7
         pF1IKBXITM/RTLecKxRG7481dy2T5cDUZM4hQHZvyw/3wxBxgjtvXUxTB60LJ4E0p+yu
         tqmcXvQKAfoUj+cAWhDb8uKVeuLpLdACI0XRRZ6XvvzzOGrzdD6zK24F33u2zh6/AP37
         3xqg==
X-Forwarded-Encrypted: i=1; AKwUvBw0JaCvh910bPmMDQdawHHLhAIwFlVwwJu9U3uncp6FrGNyZHExrVxiGAFcsaBXWvBpftul4CMVPxg=@vger.kernel.org
X-Gm-Message-State: AFuF++kjuFwVBieesiGPaZ7V1a602DFX3DXAd4od33m6Q4WUkAFyCW9T
	HzDRdc5aeVbatR8fc4jMcJaeoRS5LMuPFzSCNTatCca8bEKv+rzBeX9s
X-Gm-Gg: AYBFou2d+kmmJXFgUuga9Dxi3O7gJVbeKty9eHdqAwGEI6po4lc5YBg/VpmlDjlMiIa
	aKf1aZd+KuwpKOTsO/ytL0kG7HdOJnhLk1G5uKxQ+773+SpjKEXzcHoSMHwhw7yngOyml0i+UbX
	a2ANfTzKRv2DHb8qVD5azixDcfsuRQsoCcANgXCmEBq3DLu+Z/YkV8lcPowUBI6vW1mzsyVzr4v
	GnX9jcuc8u7cmAMJqWF9SpTWbQwX+Bb6kGAFAlxBsfXIKRR5txiFIETjHo6oalQvZDZzRtMqLnD
	OZ9FVJE7meNsSffI1fnZjeUjHVvnRI9GbHBTUZx+E9HL7xUDrOGMfLeU+FMOZ6uyNgBYsKObQn9
	1e7GenAmSRHSviqjqCWH/QP0S8cDN4cmJLcW9UUJY2+aiTnkaupSBW+frD9g04CQZc7KSR1AZLN
	dNBHcQAax+ZFjLTc2qUuEl1htBEp0Vp+r1bac3BsCv/HExypWgoMOkfFypwR7Z/OD/HEO/Nv3Pn
	DI=
X-Received: by 2002:a05:620a:1b9a:b0:93c:b47b:26f with SMTP id af79cd13be357-93cf178a668mr324269985a.49.1790932694960;
        Fri, 02 Oct 2026 02:18:14 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca26dae0sm170607785a.33.2026.10.02.02.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 02:18:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 05:18:13 -0400
Message-Id: <DLU8NL6QVE5F.3Q1Y7MLJVGCXE@gmail.com>
Cc: <netdev@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH net-next v2 2/4] net: psp: require an established
 connection for association setup
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Willem de Bruijn" <willemdebruijn.kernel@gmail.com>, "Daniel Zahka"
 <daniel.zahka@gmail.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Shuah
 Khan" <shuah@kernel.org>, "Simon Horman" <horms@kernel.org>, "Jonathan
 Corbet" <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Kuniyuki Iwashima" <kuniyu@google.com>,
 "Willem de Bruijn" <willemb@google.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
 <20260930-psp-defeat-v2-2-f266e7447129@gmail.com>
 <willemdebruijn.kernel.7eaf3a38aa5c@gmail.com>
In-Reply-To: <willemdebruijn.kernel.7eaf3a38aa5c@gmail.com>

On Thu Oct 1, 2026 at 8:19 PM EDT, Willem de Bruijn wrote:
> Daniel Zahka wrote:
>> Check sk_state under the socket lock in both the rx-assoc and tx-assoc
>> handlers, and only allow association setup on sockets in
>> TCP_ESTABLISHED. Also, fail connect() when PSP assoc state is already
>> present, and remove the dead PSP MSS adjustment from
>> tcp_v[46]_connect().
>>=20
>> The net effect of this commit is:
>> 1. PSP assoc state can never exist on a listen socket.
>> 2. The upgrade to PSP must be done while the socket is in
>>    TCP_ESTABLISHED.
>>=20
>> This change defeatures behavior that was previously allowed under the
>> PSP uapi. My justification is:
>>=20
>> Nothing useful can be done after association setup on closed or listen
>> sockets today. Listen sockets could accept a PSP-encrypted TCP SYN, but
>> the child socket will not inherit any PSP state. On the other side,
>> establishing PSP state prior to connect() will result in a PSP-encrypted
>> TCP SYN sent to a listening peer, which in turn has the aforementioned
>> limitations. That implies that there cannot be any users of this
>> feature, so it should be safe to remove it from the PSP uapi.
>>=20
>> In theory, the check in the tx-assoc path is more restrictive than
>> necessary. FIN_WAIT1/2, CLOSING, LAST_ACK and CLOSE_WAIT could be
>> allowed, and the peer would accept PSP-encrypted ACKs in the
>> post-FIN-sent states, or data in the half-close case, but it is simpler
>> to disallow those states because they don't fit the upgrade model.
>
> And preferable to do so. While it could be allowed, there is no real
> use case for it. Simpler state model allows simpler code.
>
>> The check in the tx-assoc path fixes a bug in commit 6b46ca260e22 ("net:
>> psp: add socket security association code") where an unsynchronized
>> write can be performed on an assoc shared with a timewait socket when
>> the socket is in TCP_CLOSE after shutdown. This commit is not targeted
>> at net because its premise of preventing listen sockets from holding
>> assoc state depends on net-next commit 8cc3aef0cb19 ("tcp: Do not allow
>> buggy transitions between ehash and lhash2.")
>>=20
>> Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
>
> Reviewed-by: Willem de Bruijn <willemb@google.com>
>
> Even if targeting to net-next, you could consider keeping the Fixes tag.
> Importantly the prerequisite patch is mentioned. But is only one of two
> mentioned here?

Yes, sorry. I replied with the full Fixes info to the bot here:
https://lore.kernel.org/netdev/DLTLF0VWT5UY.2WUPQRDZJQO3W@gmail.com/
