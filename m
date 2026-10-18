Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38304348C6D
	for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 02:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792291097; cv=none; b=R3A8ikbuTlfzA3Bj3Wk5aWf2qjJyjeCh55AUqfJUynEZh6Hkoj1TjCSxZLY0EIrRNloNpdTTIg9dYPqYALuRd1RJ5bvy+JkivTWPEo3E3l119N43k5Zz6jJVmPET4S9AVgFyzavSW4zx4e3QNGGmccd/+CZvsJmtp8v57G9GI1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792291097; c=relaxed/simple;
	bh=OprDKVD3dlInOK+EtkJkBGY3nlx9HocRm71U+En4ns4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZX8ebRiVISazO9MlxNb2L/6p1oOF4SnVupS59CwKc9w+442uuV4RN1P/PczYhEo6foAMxZHsW4cXtzU2yLP3YExjuGkGpRXcZve3ETOFBTQWtCvQUV8Kz2goWfI5OSm6xHoVGsDRs3/U5K8CfDdcnd+RzuoBooV9SbS3iyxsam8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=cFtqatdM; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="cFtqatdM"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso1151620a12.2
        for <linux-doc@vger.kernel.org>; Sat, 17 Oct 2026 19:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792291094; x=1792895894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uuVxX/jLPtohDOq387cSqeqHjD2U6i5S+xDw1QtsGiQ=;
        b=cFtqatdMQKgmQSYSq39dS9PbMTjb/oOnEnOFu2GDA4z+ZyGbjIyySV5az4gfb4NtR9
         AVD/yCtLpvN0/YjkCU76bBR4Pnsj+PgIlEzafq8WYIpazHeQh6l6rsLdenVSs2FMa2ja
         5uhksrEELgmHbcewXdjdG3shuBifY6ia8hdn1DvWvYQvp3eaqb8Pck0qAPrhu7tFOfIa
         9YsX4OvnDOxe9pDGLESLlwC3Tcxur2p9YkEXHh887S3AN10uKePWr1El2P6t3TQUIJf2
         a9s+SJsSn8KYtnawo9kY5Ca0RkzAsPej6F8ZT513+kjcsYEmcE6zs2Si6xnd/tZUKuk3
         oLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792291094; x=1792895894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uuVxX/jLPtohDOq387cSqeqHjD2U6i5S+xDw1QtsGiQ=;
        b=iGZ7MxWofiLlvUNbPRix9AqrkumoyNOZoT8pNKQ0jKaQMW3Mo571BDZFVy0NtkWknR
         BAK5G2fo69sqhqzDutQdgbDrOG8/1UO1xIsLsUIX4zLD4Goy2mf6L94japBiJx3ytcdD
         gsZjrAR5AX+RMycqmQydBog847vM7jfeS+cqb+jCHJZdFM2EMNcYKCfFI9DadpFiWqeR
         UdIZ3l8gWo7YUY3UHRN5Ff4CTlk0Rdk+RvLLxeeX2RiDmfnmvk5FKsyawCq37WC/GqV1
         rPS/5g6ZRd9XTyuog/S2bpr6hZw/wd9n0kShQr4IiLpxD8CD9grnn4QAt/eGFbZMOjal
         HqRg==
X-Forwarded-Encrypted: i=1; AKwUvBz1kwHCKRSjjpew79kXg3QZ2au1w+D7Jlhr0/HI9t2SoujI+9sUnCSxwV9TkOZdnbVaBhmb3LPkf4Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLf3aJX/NSA818RzoTXjdB0Sl4cqkjmEbeaT+lltwAb88WkaEhn
	DWnBGaasvJ8aDsL4wxddqoaxtpjadRGamP7ai5eX8ZrfFSs5qMegpwktcu1AWkZU8g==
X-Gm-Gg: AYBFou2LtmkjXH1wiaHmLjVlq2QNHH/rkshZ8gGrRTByWhlAXg2CghoovxaA+NDtcWN
	EvMYJGYOix2aAveXsRECWn2YtyWcoDZiPo0cSZdqDFYJXmSS6Me6tpXvt4R2hejuJ/lOxi7zw9h
	c01Jdz8d+m7FfXg8lTjFxGMHvygd0qGeyX8ZthWo6gOJeIQm2PnAVGjqNSg9qlyxl81BGyhOECf
	AqdwLWe83uyXeVXMuQpLV5V9VMd3Z18nGbQF9k6qWl3xlubjVFi0FsKdQ2trL+iUpavnIStwIyM
	qAew35XkfI8B/8nL4E9CnY8gpWsymJvzGlzNvQHCvDTijkBWX0FcnYvjZ7sP/afQ32OliPyrp0t
	zhZ/OmfXOCloiHlJsonSYXoLY1f/Ooj/Kljtcd7hhm9pkqVXH5BHkR2CWNuWvpohix0IGdDAse7
	jYxsvc8bEafx8qfA1Fs/6PZ46S6AtB4HCiNR2DXBngrvL7yvQ+IhynyiI7nLDHa+sVzfOu8lh60
	y4P3t0hMA1vETY/ZJT0xtgyQ/tdpAKx+jCxVJKURlJNcBg0UM1OcPOH1+hJ/36KznkmHcTFPV7A
	mz+yYCPq5lbdlfD731Ua6Gu37tlUVQkrenS6hxRrgKW6oImh5QiQyUZZJverNn2701NpmxIROqs
	I5x+NS8stSCalt/rhupcruzC0AUCOJt7yPSFX6AFjtk67TU90dXV/5bAHypsdh8gyJnZXSJ5oQz
	K+8YOEiU6xTpLkil6U1IM=
X-Received: by 2002:a05:6402:2489:b0:6a9:850d:bb38 with SMTP id 4fb4d7f45d1cf-6b3a81766camr2392870a12.10.1792291094015;
        Sat, 17 Oct 2026 19:38:14 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c80desm2356771a12.20.2026.10.17.19.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:38:12 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org
Cc: fw@strlen.de,
	phil@nwl.cc,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH nf-next v3 0/3] netfilter: flowtable: carry a priority into the offload
Date: Sun, 18 Oct 2026 04:38:04 +0200
Message-ID: <20261018023804.562323-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <atQk1d8Tv03iPN7d@chamomile>
References: <atQk1d8Tv03iPN7d@chamomile>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 18, 2026 at 03:45:57AM +0200, Pablo Neira Ayuso wrote:
> I don't understand the "one flowtable per class".

If the priority is a flowtable attribute, every flow in that flowtable
gets the same one. To give sip 1:3 and https 1:5, you need two
flowtables with the same devices. nf_tables rejects a device in two
flowtables of one table (nft_register_flowtable_net_hooks() returns
-EEXIST), so you also need two tables.

With the per-flow priority it is one flowtable and the rules that set
the priority today:

  udp dport 5060 meta priority set 1:3 flow add @ft
  tcp dport 443 meta priority set 1:5 flow add @ft

v4 waits until the fdb series is done.

Julius
