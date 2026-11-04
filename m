Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793835358;
	b=b2MqL364CTmz3dfRzfB9wLeM5lvbKEPyZ8PxtnjESg2ddOvc9qKQkNSKLGczHe8ngGVp
	 iAVughfSUX/QIsnj/qO4/yhyZ0yGPKfOdYypLgcOxNBG3tulZt3xckXcmBw5DpoPruqSn
	 Qdh3b7E2TAk07E03fTHa6nTvIgx0C7NhxCh9tZU793QYBzxLDbOk9xjyO8fjdzxeR2O/0
	 eh0e+9i3GFA57rw37qZqPddJaxeLN0asJQmM9/fuMttnKLPTZVkdpLvzbCX0XzFF5Cvjb
	 gFuM6jIPuUT3Th0+gkWrwodWtayRf6PltzDoQ2G3HlMbBn5wwT1c9yld9LtCZ2NHCcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793835358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dmn1Q3/145xsrJD3bHMxFjskCeqjVe350pnKBSHlWz0=;
	b=2cqU8rtonWRmns6CC3GF4CF1oKBuwfWYr7HdmVA7Ek5Xt2PndIv65urJbJUvWwvU1dn2
	 d0dCRbRTrxKS/dfWkdbpbvS0RnWHb7rNHvV1wZq+xYJU9EAcN3I5y6tMleu2QR5HKu+I/
	 xcXHIMFLxRQXhk9zheJfzaURlljiam6R6Ehzn38yWr57yLA6okJ/4cUUZbLraDiDHzYMR
	 npyQt2EyPajHTQrpuN2qAhVOWp1eU1JS1RXxrJJMtHxjYMWMT1i5hAaqLk5sxwWKxx4wk
	 +xa+BI5FCllR+95fCQ4XVVxZbH3dQrV+UmQ5x9qJTkx8hTV7XTowOf4tKOpLtUiJ5Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SJMJgTdc;
	arc=none smtp.remote-ip=74.125.230.199
Received: from mail-qk2-f7.google.com (mail-qk2-f7.google.com [74.125.230.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D707606A32D
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 23:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D707606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SJMJgTdc
Received: by mail-qk2-f7.google.com with SMTP id d75a77b69052e-53603c3b973so9603321cf.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 15:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793835356; x=1794440156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dmn1Q3/145xsrJD3bHMxFjskCeqjVe350pnKBSHlWz0=;
        b=SJMJgTdcGBlQsf4zsbrbO1j5AkB7ELH4/WVaj4Sdyja5e8Qsu41MqKvyxQgJjRsmvv
         WB2WEmuLJYf6rFz6iWK8B8a0Qq8ltXqfC3dLLnzSb/Vr1kzCqcVcDQZ3cIfBHOZ+5v5F
         BLE6BusncD13AnA+suHKkbOfoVPCAwy7EG8dZrxWIbo07psQ3pnSg+ksINDz1A9UUWrH
         6Dd8sem9Gf8LjO7S5z/9LOgyh3nnxfHBf53t/4egxxRnpdKvyogEIV7ou2TArLsJ0HCF
         m+eLHxQj4QlJJHgWrpJlhhc2fC9xqCmbyf3EoxeRtwyCaKY2DnrxE2PcuGUmjyMKs6Rf
         jPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793835356; x=1794440156;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dmn1Q3/145xsrJD3bHMxFjskCeqjVe350pnKBSHlWz0=;
        b=e8io9QpkIH0GyRbFaPdLmoESitbOe4DiF8oGPSubN1vGK74RnUzaSNMn5j1N1GXVcS
         O2tqoKcA44+0YT4QxR7ClCAsXqSUKpwYt5wZ+B1jQhDTSNIZbr0/8Oajs037/eos28gu
         1Nqear57mxMEq0MruIUH5zx9ls5xYE6xnGq303d792ZaKuYPwR5ECkoyKPPDM9Xx8ytP
         9Wo/W7Sp7ygF7VUqvPQ1mKgYlNVbO+AIO0S91LfPCuCDC4zDr9j/mjxzQOZTcGPbFgZl
         8FLDzQp2PCrBNxMq9AJ6LeChLFkiek4u2xzkCpZLUMegt706BDLMJm6qSc+0Y70nIhHK
         MxIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwM/8ZTCbAOmWhtZ2ADKAsFG/gEd6fSUs1XSD6eRhvyH53RQWkcH/iimJGsiY1AcRsUvT+tqafb8g8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WtyLB49BW5ydDHpRTIzjDSN+BFBN8UM9Lc5epi0n58Th6jHtU
	4/QcqYqCea9IVYrqzKITKNs2dnDFFw42rOEldz/OjKZqAIU3mjgBoj8X
X-Gm-Gg: AYBFou1Jhy32+Pe+cI6pXjLH96PUgWWDrJf7IwdAJ+IQuRtq8nLHp5DJLT7lsDs3CcB
	mBF4e5/iXGBlH41UWt7Dpg3IFtlmF3QVcm16M2PCXXRiO+BWFn/1HHGXHvLri47un1A87YKCqDw
	cCapF/Nf8jgDQZQWehV7/emQBxBow3zDLBSVqxQk4sQDqM2Gn5nNax8LzWDDkLN2kHt7iTFSodn
	X/Tj7ujBQlQcvh2NyC9MGuMr8MTp1RPMSVwxSQxy4YSgm8KfVvzLuuS2icaVcvcg2LXtcgMMv37
	AwEzv3f6u3vogYtibUa525YagYfvmvkAuC0MM+lzvv82s5mSIR2BD37dkoQmCijKEhytBuKwgCg
	0BACPe9KhUZ7vkwDKyWYuZEMsjORNSoBSNG/1luVkFW3PBJfcWgwyp+aeSYhPsqmcOwgHjgmWdY
	SI86XIuDzUUP/vXARuznym7p45euauPDzBENKVl94Pfjs4VzYG1JsDyJjPTEE2HVj5RT6TtTLrA
	ap5pYwqP3Cs2iz6onzce86Htn5vnlOr7oXnfL1faOW1HP0wTwS4mxMgJyRSEK/1iXn1rr/D8a1f
	xBawHHW1mSaTe4cgZCXJM6O8osIP8Qf1DA==
X-Received: by 2002:a05:622a:1aa9:b0:536:766f:271d with SMTP id d75a77b69052e-542b781f632mr306774901cf.51.1793835356393;
        Wed, 04 Nov 2026 15:35:56 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10a63462sm36858141cf.15.2026.11.04.15.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:35:56 -0800 (PST)
Message-ID: <2a1728c5-2856-41bb-9ffd-c80df4ffda6e@gmail.com>
Date: Wed, 4 Nov 2026 18:35:54 -0500
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
Subject: Re: [PATCH net-next v5 5/6] tls: send a KeyUpdate at the record limit
 and on request
To: sashiko-reviews@lists.linux.dev
Cc: John Fastabend <john.fastabend@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Hannes Reinecke <hare@kernel.org>, Chuck Lever <cel@kernel.org>,
 kernel-tls-handshake@lists.linux.dev, linux-nvme@lists.infradead.org,
 Alistair Francis <alistair.francis@wdc.com>
References: <20261103-keyupdate-rfc-v5-0-de1ab90a88d5@gmail.com>
 <20261103-keyupdate-rfc-v5-5-de1ab90a88d5@gmail.com>
 <sashiko-outbox-198141@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <sashiko-outbox-198141@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/4/26 16:43, sashiko-bot@kernel.org wrote:
 > > +   ret = tls_encrypt_async_wait(ctx);
 > > +   if (!ret)
 > > +           ret = tls_keyupdate_rekey(sk, 1);
 >
 > [Severity: Medium]
 > As reported by Sashiko on v4 [1], can tls_tx_key_update() ignore fatal
 > transmission errors and rotate the TX key anyway when 
tls_tx_records() fails
 > with -EPIPE or -ECONNRESET?

Yes, but this is not specific to KeyUpdate. After shutdown(SHUT_WR),
send() on a kTLS socket with no KeyUpdate also returns the full
length. I tested this with TLS 1.3 AES-GCM. As I read the code, the
KeyUpdate record then stays queued and TCP does not send it, so the
peer never sees a record with the next key.

This corrects my note in the v2 changes, "The next call reports the
error". In the same test, the next send() also returned success.

 > [Severity: High]
 > As reported by Sashiko on v4 [2], how is the KeyUpdate state in struct
 > tls_context synchronized when sk_stream_wait_memory() drops lock_sock(sk)
 > during a send or TLS_TX_KEY_UPDATE?

No change, for the reasons in the v4 changes. I checked these points
by reading the code.

Points 1 and 2 need a TLS_TX or TLS_RX setsockopt() during a blocked
sendmsg(), which is an application error.

Point 3: tx_key_update_reply stays set after the update_requested
KeyUpdate, so the reply still goes out before the next Application
Data record.

Point 4: a record that was already being written can go out before
the reply. RFC 9846 section 4.7.3 allows this for records in flight.

Martin
