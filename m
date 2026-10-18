Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F661D5160
	for <linux-doc@vger.kernel.org>; Sun, 18 Oct 2026 02:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792290334; cv=none; b=Jdcrln6bhb1YrEp6RcrgIhtAPPmK8iD/8idwRTD6hXuxQryHE4/A3RJ5rOuuzNk2FrbitY5HvBh08tg7AX7NrHB4Owp4YE7nOh9MkE+Z9PrcSqbM1WJkum2J1hf6RsQAzOKM+tP3gp2qyVqkM8SC4mm26Zu0ESRNXouxa8SBs0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792290334; c=relaxed/simple;
	bh=cOWgL4Y5aOSoL3opS9VqD9bwE2Ik8UunaS8+RLwbmv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IghhErVbBmJ8FnRGa9VbMxfb0dDI63rkmtEO4vTdDiuxrv0u0gJJBMoBc+AJycUrER3QszMOVisS1cVlsBFmpwNpE8MsVhFL/dzjAg50xnANBSAsyKCK3AAjiB5kHMESvLoNPJMBqck3gJogZtVNQQZaRxnP7NVQek53OV5eOz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=sJbwSk21; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="sJbwSk21"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c315869241fso106818666b.0
        for <linux-doc@vger.kernel.org>; Sat, 17 Oct 2026 19:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792290332; x=1792895132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cOWgL4Y5aOSoL3opS9VqD9bwE2Ik8UunaS8+RLwbmv0=;
        b=sJbwSk2180ZFZkpasPbMUs+VnMuDmisi/Ml/uMIqWgJu+Wy2c8tk0IPP8f1gNewA+9
         7j4qFEMLErx/AMNezdDNt1ya079p74pP1J2G07FVj4DcMBu3XwhRcP/KVRuQY9N/X8zI
         g3QUPlvDmAud0UDDID/3PKF3hyiMlNaFURBHy6HaQCah7yvngWZbyE8FWAZOz2EIZ6im
         4Ztw1lG2LyAbP/lJW1CMRQa/j1l0sWkuM+ufTN7wTzXQoxvLfe7no1E6s+oAoor7hb48
         dwwcD7adG3cEge0Ghw7bGupo+mxFmjjgLJHC5r5QdV9kGaSUvM0u0sObg0arJdHDXXcD
         VfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792290332; x=1792895132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cOWgL4Y5aOSoL3opS9VqD9bwE2Ik8UunaS8+RLwbmv0=;
        b=OfNNm5GLpStkCnaqS3wjNv+iZ+buHwVRnT6gFGnIO1A3h6MrD87jS9e7sSat+BIcZS
         KDouVXKT1bhLFs+67GhFOUBKQVvHryTBEgpYY/uBPQ14r36xy++mT3oCKVRjE6tpYoOa
         y2qlz7eJvFXTW0ORpGMmUSxsbxd6r7wv3ocKB5LD7vInPlHZO59ZILJi7XMLtd/m7XsO
         92BKJ8VHIToFaLTZheHe4dH1zJV89xGCmOup8W2NKvCPKDukwAz1j8A2eT7C3JFhSB6N
         umVLhMYQhZf6CUe7Ub2MRMUiwDf7Eo7D/whxeiNeR6artoxTUGWPLXuPbVb31CjXsxca
         S+VQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7VEiKnPtMoseBIsAkJX3G+hLAFslUo41Pud0bJrcmmY4VUJFrxPWjEfhO9J2PTuKi4iIp8wXhlEI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDAA6hH0fNQxpBwd28zqDdsy1KZdQBHMsx+2ZbaGt2Ehkviq62
	9vn8UbBa+9/o6jqnQNjIpUCBD0SYSic7W/OumYHWhbYw3UjKjdM2PgQaVKBBmf+ZWA==
X-Gm-Gg: AYBFou3TVTX+2UkbDrVILSpTSCI2OQFHBG1JvYvjwnfBQ0mAZjged/CR2te0jj3lFSe
	LsCKpEAHz/Wi7XjUuoAq2DEnfWTKZ8984I3Jej5G55s4zw12zhHOhXu+aMh7ZCF9G/2yRrhfzff
	zDcGQkZBULDmRbNWM3OQN98YPdmJ4NqQxcvxYj9CpqlTniQ0+YRESkIG1Hkh053MtHUqxrcBiW9
	le3Cibpl3czSQwZabDv+mYwgX9Xm0Vb8NeGD04DzWroWvroABF2c0Lpio3ymGYqTKdRMXyk+0iE
	fDkffsdqL1UyGTKnc/9jcQAVdNi6enfpdXH03n5irvhyFDBPihrFTepgwZY/8uIUUHtS9KGfTJ9
	arA/tS6eD1Y4hQ8BXlOvIu1T5BKpnFiwA21T/TKJDXkq2noNwuO1Ig8Sm4fg6D9E87DPenSHEJa
	7TV3uEcn4yUvaQubF4qXKD+Zxo3OJbZGM1WIe3aCzoKzTJxJKVJnk9MektmfQxjUy+DqPPtIaH5
	1yHM0FVhOtX/djSmBkF9uTw53e+RJnII3rhhvEbQk+0WFuytnpS/Ki2moEyml+GaHhW7gBVk6GX
	aR4HFR7skclzJTE8s7h1bi9EajSeFPwVIRZ1NZvVKuzm/atZyadU9nBXlnInDqM4u3bI1k1b3mR
	HzT1j+qIbWKymk1tIyRUZ4OkFbj8Wp3Uh4kQEaDB4MS5XPoiMO/upMokNUzjLKs/SbLlyafGrEJ
	0ATvS656u6JHHbpIEgLDQwIlS/vTIONT4b6GhDisLoUgNHSeg5XbrPR6TtOijJYA==
X-Received: by 2002:a17:907:e849:b0:c40:4320:de2c with SMTP id a640c23a62f3a-c419e73e2a1mr277700866b.15.1792290331870;
        Sat, 17 Oct 2026 19:25:31 -0700 (PDT)
Received: from Desktop.fritz.box (p200300f247429d100000000000000a27.dip0.t-ipconnect.de. [2003:f2:4742:9d10::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40913c4c5dsm222994366b.39.2026.10.17.19.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:25:30 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jianbol@nvidia.com
Cc: pablo@netfilter.org,
	fw@strlen.de,
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
Subject: Re: [PATCH nf-next v3 1/3] net/mlx5e: Ignore FLOW_ACTION_PRIORITY on flowtable offload
Date: Sun, 18 Oct 2026 04:25:27 +0200
Message-ID: <20261018022527.4065122-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAC1t37K0tEMzxmRhLeHnH-TPx61pZmCHt0xxTJ5Wq2Wxvzv8Jw@mail.gmail.com>
References: <CAC1t37K0tEMzxmRhLeHnH-TPx61pZmCHt0xxTJ5Wq2Wxvzv8Jw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jianbo,

v4 is ready with your Reviewed-by on 1/3, the rename to
skbedit_prio.c and the consequence line. Pablo asked to handle one
series at a time, so I will post it once the fdb roaming series is
merged.

Thanks,
Julius
