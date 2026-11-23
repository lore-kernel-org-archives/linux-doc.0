Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434533;
	b=owQqFcwyB3jmA8mwvM+90XHDY1mVOfuMhITenWFqYJecX71UtSKrgCGlvjvninNxiWPz
	 dUVcVCnvvmAJ99XIqm5VA4m0sExsYnnJ8lMRDNwGGIkIeFluuYSuCIeZSSvXKdw0NIcS3
	 nvgpW01qgwhuuhyvdCD5TdAHflJAdRkJQR9zZGP56V3jAQ55b63XRqeUSUX4gPqVCuKlP
	 VUyNgQyimpJK8pmrwxG/Ls9bgqqIbFa1Y3pHx3CoCus80Lb0u2kj3lLDu9p01My4MyrUv
	 0TPwHncOvHrI+EvsvN+pA/VD8Mx2oSPL3JWymtICJWfkqLn+mWd9OIojbUeFVbgiLgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bVLWph7B2WEr3md9baVPpYweSSyWCOp9inF7HhcfyZY=;
	b=NbZNTd8Srmm2veouPMyLUps+IH7Am0XXLNflHHRTFVkMDG+9VCAJiHcZzs2n2daCYdXG
	 B1o9pRbj3JwKkcSVtXJUMfvZLC/Zk+3qjWDl6QNPbcFpaDPxhrA2jdQbHGRrgJAlOoe57
	 4pjxGG8QV0bvduce+A84nC4+Hc3Gfd4nK1l+PRnklAw7bGO72E4G0LDPMC2TaiZs9x23c
	 cblw6dXVCtGbbG0iqK4nLfwnv4HttLUuvx/HN/oTXRJPYk1eUtbEhuN/44FUri3pbwuTa
	 tqQFId0aTwXvPcghUbVy0P4M9pX0PCAwuLZUEws4zmZwZKkdyA0s63cuYt00Pkkjj7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PtBRx4f0;
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D19A606A331
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D19A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PtBRx4f0
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7d65662077cso1688683137.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 03:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795434532; x=1796039332; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bVLWph7B2WEr3md9baVPpYweSSyWCOp9inF7HhcfyZY=;
        b=PtBRx4f0zHMPWrKCeYo4jmRaJQ1LN5JSKPTl8SuaDwwGOylL4gwkeWZuRFAir8i0Oc
         XB5k0mzLRktyLJg+vl6aem4aZ3S0217Q3kedU2XJ6a+Rx8VhSCyQSgIcPtDw+IP9ceJx
         J7XQA7M2DQ9QOU9CoOt65NNP+M3zGNqHutwCOtJDBV4E2sybFUpiotdRZ3ia/0Br1aW+
         VZ6Kom8GTYEPap127qiISr/1UNfo3AcD6EfhKm7hnT7W26Ny4mS5A50oLqj7OTJQAqFu
         fZ9Is/5bx67lwhC+m4nxemqFdjv14gTMpbZYwWIzCosqHuaHMYyuL2c09z6O+3MlbY/5
         9DJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434532; x=1796039332;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bVLWph7B2WEr3md9baVPpYweSSyWCOp9inF7HhcfyZY=;
        b=EvFsH83680ZoFryP072wnBiBEyTd3Pa4OC1XN9aHrRV0tPV6Hx3Z/Sel9XKWH1G1Gi
         Hn+W5VnDjeqeXoDLW/wJjG+4hTz+nITiwkWGOIz212SMKkNaXDFB7WbnUAFmbwbLYdyy
         RUanQSjrdccJxz/iPwS20RgNyGhky7d4j5bZXCrxsGQKeaAZ3V9nSjSlyLovljfmPmOa
         ReLFB8CGtp/EiFFqob1tfR840GAsVBPqg+saA7okAfGUEUG/adBqJ4fg8WsYOG+uSiGB
         FOFRHT9Cus0HssPiHL+iONOSnNVr6DWryXGofvKJwZ70rmkDssRpOqa7EJBkdv/pt5RZ
         917A==
X-Forwarded-Encrypted: i=1; AL+hErGTXFp01p5vSMExBbdkkrGLqtFgmumYgm0r2QHD75GF7jLqIQzfEgHUPY3E6DeTGtUdDQA0JwwIkoY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HEF88lZqgS9sRLV28HrVmF+ViTPdyqNfS8xvFRDA39D78bd4f
	kTkqebTczcQKmKQGJuDlLBTK209RgITMzOxWOC1VtsKt0FsDyp5DOX47
X-Gm-Gg: AZFdTZc3A9j2LTnoHfXosBZZCQuJvikXeQbYwd+8oFjsAzwmWqAklNFSRcZkEGaoMPq
	Q8+vvDgxf1b/R09heWISqNEt0ULn3UAZBwesOC9MiMiwE0jhsHc2sO1OZr7z7sc9AwvY1hNkmuC
	ihui2abidX8gq44uuSAHubWA+afFCUL6Vno8ryy62IkFaSg5LVURLRf65DXwJFkifiuWgTP5QbN
	4U04U+Le6vfYg9aLXJjYEOZh7bUdfNqotbIyN0OLE5uVLnlQc+CLWOEX4V6wt3lpJbHSjLDCehT
	M0i73WaZJPlByfGEkOCQO5h8GAXYGI61/VgsQbYKkrGE/IwtI0mdwrAqJg7nT6mHzSFgocQpv5c
	i7scIC+N7mPAJFZobLE25tw2jToJcl3DturZffLvOCb1Srt1zLiZHthVH/1EqO9PVGy/WFV5CBU
	BYoabcJxwPusJ3CTA4FIuZ+6YHW6qVddR6t8ZV25TkkEAwjzCShamatSqEQW+AAHXo9TOjqMKtD
	rWtHm1vt3jhg9MiH22m6XUk5yg9hOylWENdgbyyO+1lDH+wv5Qrfxi+EVeH32dxzSnP01iOx5y7
	zrLgZOwHTYYDjBTCq+qdNtweiYDJJvJrxrM=
X-Received: by 2002:a05:6102:374d:b0:7cc:971a:61ee with SMTP id ada2fe7eead31-7d7393ff678mr5339224137.10.1795434532277;
        Mon, 23 Nov 2026 03:48:52 -0800 (PST)
Received: from ehlo.thunderbird.net ([179.181.85.100])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7f92680sm11676646137.5.2026.11.23.03.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 03:48:51 -0800 (PST)
Date: Mon, 23 Nov 2026 08:46:43 -0300
From: Felipe Stival <v0idpwn@gmail.com>
To: netdev-bot+sashiko@kernel.org
CC: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, shuah@kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net 1/2] tls: don't hide a queued KeyUpdate from poll()
User-Agent: Thunderbird for Android
In-Reply-To: <179538279534.3135.17423952957860887247@kernel.org>
References: <20261118-v0idpwn-tls-poll-parked-keyupdate-v1-1-8e25101e7be6@gmail.com> <179538279534.3135.17423952957860887247@kernel.org>
Message-ID: <B373FE61-88E2-4F2B-9796-01B39ACF7635@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Can a poller that is already waiting still miss the KeyUpdate here?

Yes, any record tls_sw_recvmsg() puts on rx_list has no wakeup for
concurrent polls=2E This predates this patch, and I'd say it belongs in a
separate discussion=2E
