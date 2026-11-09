Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248961;
	b=gjH004bKjZLx/WavJgom+F6I1zk3Sp5MUYZyVhetppObV/4dVSFEC3ZYEhFY3dDihlVt
	 /WUGmHOuw6PJD4+UfZR8bofENudKs+HGDSDbvugEUQXujUeHmc/e5feOMuKfkixSit1od
	 4PL4YsIxbV8khnsiDhmDKSE+rXelR6P7zo02+I9jrPIa6KpDCEkDIFYudBJVqPf+McuMY
	 wdE0FrmyMAwnPrUMKC2PdI+GoIyIykR/SrrtvvQC7RJIr6dzX5rusOU6s/yyStQkoq+Zv
	 eNCi8MqEJ+MyOeMK8aHiq8exNcp9dJjV3iQVao/Or865fkEBnDkeniNXIVq24arjEVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:In-Reply-To:Subject:Content-Type;
	bh=TyNlOaE6r53YabDf7NgKAHxeTjKkEmLPqy6LNOwpSOw=;
	b=aPnAG3GVy85nsu6NPvbfGaDjbSSu/4YkizCBsPnqXmHSj2ohsUealmMZGls5lumsW5Z7
	 sk1/eHYvTFzeJz5K9F5V/zaCjT43FnjhL4FUdHxl9KMiipkwFYBJfrqNmQarzm9VPBDQW
	 KvWQdzuomoS7cukvPTWIL0e3/rLqLkUVxL1Vcb0Ypl6fLv9TQUe2ARBCSmA/vrmj0z8XM
	 T3ltjArKf9Md6oZe1zW+5PDJEzKvTxTC4n4NagRO+Oql6doIh+iN1mLfS7m3wSpu9YHJw
	 qB6w5NXdjPb0FSnbu/i8fzKndC/dzDul6QMwuh50yp1fNoUEgN4SJb0TWjCZwaJxGpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wVPmauA8;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD826070ED6
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 18:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAD826070ED6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wVPmauA8
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so721844eec.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 10:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794248960; x=1794853760; darn=vger.kernel.org;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TyNlOaE6r53YabDf7NgKAHxeTjKkEmLPqy6LNOwpSOw=;
        b=wVPmauA8OdLBNUi//iUcElADcRibZhBlYmRzMsqGWZwocRzhlB8pAEZUyTVONutmzP
         YHGl7m7d5gmKZ+kHy+amcdGR0AdGQnPC70uqhqLev+qT0zS5gLE0OQedk71PD93HuDHe
         d4AmF+8Op5QqLeFTRnHezx/ld31iyUN1GiwdR9gI83FoQB/p3kN+M6POA5UihECgoHE8
         nuCiIhx0et4FR8tdMwbyimQJYCdpUxlrmR1+YMHy6otayeUpxcz8AVkru0zzf6Ais/I4
         VVUtRfQ+Vg5feQX7YYsyKpySiIOvAMZA1iGgR5VhnDI5k3Uv8f3/btggB3XTDbZErZLZ
         HL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248960; x=1794853760;
        h=content-type:subject:in-reply-to:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyNlOaE6r53YabDf7NgKAHxeTjKkEmLPqy6LNOwpSOw=;
        b=OiAcaW6g+l0HQUhe+8dQKdQHVgfl6/iyvydp9vo2yArsS2FgH2Zf+v1QeyWixTDY7D
         sQyVN05mANSPNv5pySHtUPFsCsQk2I9jw9X980BY3SloginYqdI/rkcg+Tr5+tfbLEh3
         hqSq8EutQC3dw1z06g1VEsQ/BFlAhenT4gY9oCuL8mG/zvS45cedqj49SrfDm8m83C8R
         ggFxqou7YlyYt/663UlztxdIPc4IGAp9t4OB1hLBB7hDjcXyxE9T3bZWGabkvDAx0gV7
         5wUFrlIshCBk5slFF9v/tb1X3hTGj83NWj0+c7urU2jVghhwqL4gUasni5prNYjFW7KU
         i0gw==
X-Forwarded-Encrypted: i=1; AL+hErGfySflQwzci/cVtL5x//S8AN7QTvJYbHZ1ch3gH4gWCAYMu43JcREvDUxbnpn0gb3JFGrS96cyE/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z95gVz9Qpip0OsEBLr2yOFFELU8Gn4XRiuOniZx4AI3rmEG2ZH3
	QxRfKgcHreoYE+5wN/iRMsubwH3TOq9VUAxivME32gEB9VdLEHLUN4uD
X-Gm-Gg: AYBFou3IrXEXvR9r/8cRAJ/Xkgh2tV2a0SxHsSDPF2nv5liDajDW05aJwImZBQyg+py
	/9KA3X/1OUKsYZHD9rnno0KEorxINEirZwlodEOvVwBMc6Tgd0sntWqfZSzOHdZ+/lEdtEYGpA7
	T8siWCtsiDUmS0c0pMtyk820FDm/qJrGlR7edaIJvGizf/YXYDjjrOneEGsTsnxun7LzRNdx2SI
	NyDnS61d9CW4vNt9cQGbXUZE7/sT/b8uT/SNtyFSprpvZcz/Hmr4bBpbCqTKQxa9SmJKsjXO3Lv
	yT+ubzk1isILGJo2efvR+G7A3jxiFfwAJURFauTm9S0nLcbIGpFzUXXAUzScMwomI+upZx6SMts
	ZMTTgxvluOKwgzzlIe0Opm8NVtA7VDUxisNgOFVX+J+1F422OQ+q0vYqAJ3j/MuGbZVY/NWMLfN
	7vzRusHG6AAL9ibNqOVgDkuDQibjVlz4Ca6ZCstM3xux22uqy4ZMpilsMPPpSi7OGw0CJV52wLh
	XQ363t/t0J3kxmPSjECVOgFfygpKMfTPBK3OqsrDmqOcS3c9T1GtT5aclo80Gndt3TcPn3qg+Pw
	v9KMfCf96OFhHW+TluAj8LQ=
X-Received: by 2002:a05:7300:e9dc:10b0:36d:3c0f:cc85 with SMTP id 5a478bee46e88-3751c82b5e5mr145592eec.5.1794248960011;
        Mon, 09 Nov 2026 10:29:20 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:41::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm99440eec.12.2026.11.09.10.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 10:29:19 -0800 (PST)
Date: Mon, 09 Nov 2026 10:29:18 -0800
Message-ID: <8025f6aed4bc33298e8be50280ab72e4@gmail.com>
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch,
 edumazet@kernel.org, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, saeedm@nvidia.com, tariqt@nvidia.com,
 mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com,
 sdf@fomichev.me, dimitri.daskalakis1@gmail.com, almasrymina@google.com,
 dtatulea@nvidia.com, bobbyeshleman@meta.com, asml.silence@gmail.com,
 daniel@iogearbox.net, razor@blackwall.org, leitao@debian.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, leon@kernel.org
In-Reply-To: <179418738174.994134.464817117967884735@kernel.org>
Subject: Re:  Re: [PATCH net-next v3 7/9] net/mlx5e: lift the netmem TX frag
 size limit
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list

> [Severity: Low]
> Is U32_MAX really the largest length an mlx5 data segment can describe?
> The commit message says:
> 
>   TX data segments have a 32-bit byte count, so devmem TX frags don't
>   need a size limit.
> 
> Bit 31 of byte_count looks like it is the inline segment marker rather
> than part of the length:

[..]

> Would a value that matches the hardware, such as (1U << 31) - 1 or SZ_1G,
> work better here? The commit message would need updating to match.

Let me switch to SZ_1G to be 100% safe.

---
pw-bot: cr
