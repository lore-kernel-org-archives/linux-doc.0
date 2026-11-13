Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608567;
	b=TNhjxHv4CHWsriidmyaRjFDjfHemgLgIfnJF6sr8X1WteUn0konf1dyvv4l0s7wrd9p/
	 4XNBvHkfzLmU9g5gBJOZkfoPzMcb9nuz47XlLlBKy6FGByw9y2FX1+mmU5sCX8kd16KiX
	 ItMxTTe6aK0MunKlkJeTvugTuohwfroq7cfYSViNlqo/ieBaiH1xApLVbQ/cVZimiq+Z5
	 pnyl3fmate+Kyt0qXfkNgMMmfzo4UqEs7fZhvt35dw9AuLWudP5EXLQt7PeRFP/Hjgjt+
	 V4WmQx80gF7ytdr3G1WOtPZUBW+zWOAGVzs6GHEqqG9mev0qTkAySeLZ8ULJdxQjbEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PuWQ2BwaMw0F60EupC+5yCUtgb9A+hweuIMrIgnawM4=;
	b=10KhDnbyhxCNt7gF/6+EdV1DcnEnWb/bD/iTa3A3lf4X7/+8UMU0+YwHjzYiI4gvc8so
	 wiRCijl/JJSqzn3fPuXS6yTMAAvAl9Z2gh2oQum873yHHDO7zVW6QZ9750y/UriHT4k3k
	 mrXpNkj9WJtzIo+c+8MFgIVXBwr3sxWCZXJNIfXnRqMSPe37wk23WkVA6mvabnyK0jNYl
	 /znOyfiRmNttH+v/wz5MWEBx5dDl/F9BCfZVINHeVfFJJvgW8fWdodaAWjDkjrMFRPt5u
	 R3nN7BErCrUeBqfdI4hIzxJYnNwoKt4nLqcFykg7oh/hqkZ2sL4xpt8g1eSZQQwIvzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kt0eGjZ6;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB330606A889
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 22:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB330606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kt0eGjZ6
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36c9b5c6faaso716664eec.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 14:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794608566; x=1795213366; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PuWQ2BwaMw0F60EupC+5yCUtgb9A+hweuIMrIgnawM4=;
        b=kt0eGjZ6lI9yQVuQ0WalkgZYGqnAu6quAkbn/YNnSaNNY4bDxmg7vWu5L/iCEKeRq1
         BcHDv16Nly2AE2lgZ1szXyCbpA//4r+TIy7pmoIrIaWlaAuhxishgr/nf6iJy+MF8JHL
         MnFiQ8swqhS0T9o7CW2+KpZh79x4DzoeNMIG6AbPH6bu90SMA4+yEXC9cAzM6enI8Y0J
         2N0H9Y4xL4Kj41pYFL5pMsv1U33XLXGZlmtM3S4WLqvVUbDJ+yObSu0oCraJ4gIg+Qrv
         xYsUdpVKLCo1UNmumy85tcug4O2Qi4xN+kSO2xy4WFG7/h6Nu2vesGAp6pwgnTMh6ALv
         Nypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608566; x=1795213366;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PuWQ2BwaMw0F60EupC+5yCUtgb9A+hweuIMrIgnawM4=;
        b=SNDrpU284ZbmyHOnTh/t1fiAjX++5O/tCsEgl0AVBhHme4li6yY7Opf4GElFvPuI+v
         8qFKl/ECKcydMfiVdo7F9UjEXTXFDJldeO/vrAr6JR3P7FfeqFDnRp0WBAeQkNdmiY5x
         nY4LbFoAsEPCoNCmT8ja4gxE1AwalsuZ/xafnFv3W/Ge+rwCxv5WU/KKK/Hll0i/vI9F
         TvjzHryik9JIHxQaWooYcx0c1Ip9VQ9U5mrHk+orQIGpY+Fux9wwM55YotaWSIULuKhn
         qi3/G7eEqlZI67ZApViMJ56XXKd1brD6MRv9m0PnsIZlADpAxnLt+p6sqokoIOr/Uh18
         XnqQ==
X-Forwarded-Encrypted: i=1; AL+hErFEiI5OF1gBRJpK/TpnFshh5FLAgaV+CYQTH1GQO0uZUzPryhkxPA1jylti1j3nV910kOl78DYVQQQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+6S3tA0Fm6TYddCOhWI6mZu1qdITYNGDIHyRiDE4x1XJny6CR
	MwkfYo2SmkUX2+ZeePaFFXRUtAU3LYLxcNGV6o4Psif9J7+F5ehBeZu/
X-Gm-Gg: AYBFou0Jx+Q4LrNGnpNXB3E0m+6Rsu5ynL3RT/l1yC6+mgnnNmFQsCbq/bnA6pIaibc
	n8kiwy9lo1df0ssFSICw2vM3eOJeSwQ1mw2pKhL7olrUHXeOVD5ujDuEM1KkWpcT/x/Mdl3kn+p
	B9zN+96VnVOy9/QLJ3Sj0JomuxZys/5vUBU70e4pJr/wykOligMwo3a/ztLw24w8I2okHFAr4Qd
	sUOvelg3J/Wz+59Qo36L5Kup03h5GtvBBjaftPJ1oHrjwzWjMq/rPV4tnxWEdiRNujqbdGdHYo6
	3Qelp8vV/+Tl+EWLAPt8uNxYQ/exP69qAXilGc+Qor5DduxncVlNcmELyJZi2XgFoJus061LwoH
	X41wGWj4uewj7+Wvniw8FknZC9h0PeGXUFz0w1nQanEklSwZI0wsynVFZzfIyp5nee22WTbU2UL
	SF+FVvhuul4dK+bZuEwNvAvdIOkOso+lis+twYMO9ddqpqfrnnPDPsZGHG6J90TWveDfe67NLm+
	H3e7fxI+7bO6L+R2PlhAGqHVMmlN9BDGaOW0HOrCZaAvbThcQ4c7roZgHrfVuX8ak+dxePkbyxf
	aKsMRL9A7EDiRWso8w/DfhA=
X-Received: by 2002:a05:7300:cf8c:b0:369:f70e:bd40 with SMTP id 5a478bee46e88-3796628f4c8mr3171439eec.16.1794608565735;
        Fri, 13 Nov 2026 14:22:45 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:72::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795378d7e5sm10160338eec.3.2026.11.13.14.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 14:22:45 -0800 (PST)
Date: Fri, 13 Nov 2026 14:22:41 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, jv@jvosburgh.net, 
	haiyangz@microsoft.com, ast@kernel.org, hawk@kernel.org, john.fastabend@gmail.com, 
	sdf@fomichev.me, bpf@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 0/5] net: make xdp config checks effective vs
 netif_xdp_propagate()
Message-ID: <aveNqpUudFjo0jA9@devvm16445.scu0.facebook.com>
References: <20261112235027.4072149-1-kuba@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112235027.4072149-1-kuba@kernel.org>

On 11/12, Jakub Kicinski wrote:
> Bonding (and netvsc) try to auto-propagate XDP programs down
> to their lower devices. These programs were installed directly
> with .ndo_bpf and not recorded in struct net_device of the lowers.
> This makes all the config checks for features incompatible with XDP
> ineffective - HDS, memory providers etc. use dev_xdp_prog_count()
> and do not call down to the driver to ask it whether it has XDP
> installed.
> 
> Record the state appropriately. dev_xdp_prog_count() will now
> "see" the propagated programs.
> 
> The issue was discovered when reworking HW-GRO and XDP interactions.
> I was trying to make sure HW-GRO is reliably disabled with XDP,
> and discovered we have a way to bypass all checks with bonding.
> Not treating this as a fix since it's admin-only self-inflicted
> damage that nobody is reporting being bothered by in real life.
> 
> Jakub Kicinski (5):
>   net: don't safety-check device features for XDP uninstall
>   net: move dev_xdp_set_link() and dev_xdp_set_prog() up
>   net: record XDP programs propagated to lower devices
>   selftests/bpf: check XDP attach on a nested bond slave
>   selftests/bpf: check replacing and detaching XDP on a bond through a
>     link

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
