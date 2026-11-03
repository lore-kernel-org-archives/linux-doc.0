Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793672913;
	b=N6VWoOS/K6gZEdaKR7sb3Bnl3ML3LPS/Iywg11UKNoEiQQgRgKdbzPvTpaCCcr2+Ck5T
	 M7fjcA1m42YZeQVU3YZs62mLlcjvdMZRER76PrP3xWjO2I2v59zWi7fqSk4Is8QSKa8cm
	 RZmLSY6W2KIxKeBTcPxoZ+wvdWTDzgepYjCmuQEgRi8rtGgdd60empZmGGLSbjs2mZGmu
	 ZF/qNjolbBjZTI7k4oVkw99Ban68U3HusBlwj3p97HQtJC7ORCaYvVVkDa0stemEUEZOy
	 O6dyYn9N9yOh2rgOIQn+X0NP+uCZFBCe2xpRPA+YBvptwWq+1nUqEUoxdiNbnNHQIPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=43k2JoRgmvLGktezxg5Tqe/6VKPUAsfo21mLYAXJ+uI=;
	b=KCL9lpFJsT1d32EuL2IS61DGhKBQpO9+Dv0Wd28hzhTuYxO5tUdN+uAHv3792B2te3mS
	 9j6TQkpVjPcIpp//nZ1cvP2/UOCO3MLfvrAqDt25TFajN/4uuT0zpo/yjQrD9gSno0JBR
	 IhQSgEEIzdESj8GaE9E7u4Db96VZsgLsZMq7CcjPfNPSYelB02x1T5d1No92U8Oo5Enn0
	 c0XFw2PzgFUPNdhXD4P+6D9pzUzc/JVJBhshV/6SyqDsihl0cFk1n+tolBoJGV1DzgSuT
	 2pVrbtw5eh1sXJ7TivFLoI+v2AEWoq2Ie0H9T90U/OJkROoOkMxSN15S51tqq7hQajg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBcVpV3N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2962B606A329
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 02:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2962B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TBcVpV3N
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5365f9a04c5so62215011cf.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 18:28:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793672912; cv=none;
        d=google.com; s=arc-20260327;
        b=PA1aOxlPXR9h3+73Y7fQ6noxHktevzmxwvrbvzZg3w/gVG3iwWfsOZEiWuPyPAHmKG
         GZjl6gkvKKrPLxWmq3jeE2Ob92+WyIyY17XpZnlw1sCoA2pwqT3FM7MeniQRs6krh9LW
         8aO9ZZh2w0cydFyFMp28mq/YzQLZMz3l43RBo8kQILdh1fbxdS2BCDpPHAonilMFbfCh
         fV9za+cL00o+8PiO60bVYdXtH9VGpr/UR1tdOniFW1bu1/oHxTOXAzYlgk92wK2w2ZNz
         CBvjGqEzCiJpnXOG7OaDGROzmgiWyziYWsy2kbHeK+PP4zeNXjbJaDetLs/5Npgi/Q9s
         MWLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=43k2JoRgmvLGktezxg5Tqe/6VKPUAsfo21mLYAXJ+uI=;
        fh=ul5dg1tIliFktvX1K39wengK8k1pVXO6PQegamvxvZA=;
        b=Q4jCpnl9ydzifFssKDG9vWaBLFi53S16fV1AXywrZLF8pL0jcNQsxcFXRA5TiCJZZ9
         GeAevIqiXfAwDBERrQuRiiflcUlCNMrZZDSPg1Z7jPJ/s9MwnlDjMbduowGiIbiRaS8D
         PwooNBn+xf6/ut4xazneYK8B0Ffp0a3PBGh5SffD+gQbjr+ZjiBbELBEyZ/1SWjL8l5n
         7ADAHhMceXXF77hemXA8PwM6abiGCJs6+fqPAi3p/xXuoXzEua2osNqSpS5Snwf05ljY
         QXa7OHkPRvT2n+OUy36Y3jSom+MsDQQsrIq2wA4pY/w42/PTqi911FBieKy3ylBf8w/T
         HCHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793672912; x=1794277712; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43k2JoRgmvLGktezxg5Tqe/6VKPUAsfo21mLYAXJ+uI=;
        b=TBcVpV3Nm0DEYNMpivFPwbeMW+Qgh+kb04TIohJNdNrJXXHNLdU09nGHewGUewzNB9
         kGC2oUWJ6M26At3CDIR3ChUKw8t/UezDkoB22nnJOwjzv3syJrngkTRCnZp90UBO+KJR
         jw2tK1G9qf563Dq/aHrzwejkDJKKaNuQ1oPPe9Wu+sk8CrTm01ftG8UFfK+Op3Ky5V3K
         a1J7/HcjRla/z9oh2iSNS34iC5Dy0pJSl4thJ8LmoAhb81bYvvJ5JCBeB8gO4pD8WLtK
         zJEMycOpLbu7GrSQ9VNPnvdK0Y9R0s398SjtBGUIQg+zf5y7TWhZpymUFUFrUSS0me02
         shaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672912; x=1794277712;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=43k2JoRgmvLGktezxg5Tqe/6VKPUAsfo21mLYAXJ+uI=;
        b=U0GLcx2TdsS7zT6pqIJYam76jQBsLr54BQWfn2cQH9eKn3ZTArwwhSQ5tNJ5XXCCK4
         2maeRvsMJG9USJWEN6Xo24X4VaYL9T9lXZkgTiFkZeOTGGr6d6ls4CD1vo5wRnGKQ4gy
         jbx3sNsRmxqRa2sCjVVC2HjuwvxnFXpdxXCv/p+YdYgAOEVAvALeLZegz4a5O67MRUJN
         ETmTmNULNCRXWOh2+3O25Rh8jR6nRZqjCjIbftlSU8dzuxFQ5RUM8CXYKO4Ef3F56cfA
         0YTqp0+zdeer49qmDjDAboFU9PZbsIhRosIxKQ30jgComT61KxKBHZ3Hn85Ax/atiPYg
         O4PQ==
X-Forwarded-Encrypted: i=1; AKwUvBzskd8w8NopQz8rC3U5feId/wISwsfq0bBr3ACYHrmPEp9TIiJfNTMobfoRwedpl/5rggeukj6Zke0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XU9hxoaG61az3akeZp1WSZc5TEvmtkcBAe9c8su1VVV6jh1g5
	vdSGVkWmXVLSTSS8nqlHi5oE8t9gK7hxVD6Vb2SaVbanT1uwPy6ue5NUSSpv/cSom32nl/GZ2dI
	Vn9PQBamZyaQqN7R1HvQTN+k7AhcF4c8=
X-Gm-Gg: AYBFou2cm2bkGFePEX2Z5FBoEDp04V9jq+unZLVIzMv5Zkxuqx75FGFsWfb/uu1RAs3
	pRWOKpflGa2vXAIXxv+QdSXnnlmZ95qosVQ71nuQPHnthUCUs1mXCUjVwWrhNtM2+GSnIRh6gxM
	izNOefoPj2TNA8jWdUPkLVmM/MHxxweQ0QE7erWQTSsHdceaQLCMFJjTVlL3iLkShki9aEEzQyG
	Yw4yyctGsma2ZR9tOLCTb11taQiyOAnv5Cf0UdbQGPoGVmekp/CFg3dT7qcokXeUX5nl1WFPr6v
	CwUbdhT05TTQuXTKOIs4vKnR5hidjwis691jcSJe7sEec2g9NyuTRqkXr6ob7bK4a2gfoCwD3Os
	P9d7FXGV1Elez8QUWvqkGGFwS+s+fl55aAsLCYBSq6UbO5T4LdcLxC060XCRO7KPvuepxOxilLJ
	et/ezYlyNWa50Hyqsbc0DXvcIzGKhT7+VFDKEBRZ2nABHCcnWBsv60g1VcvSgvzsolEXSzL/yth
	8Oz5feT/HUzkY6mwNuNL5oXJg==
X-Received: by 2002:ac8:59d3:0:b0:536:3a49:f76 with SMTP id
 d75a77b69052e-542b62a60f2mr208129931cf.27.1793672912039; Mon, 02 Nov 2026
 18:28:32 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013-sahara_protocol_new_v2-v9-0-dc9f24357c4a@oss.qualcomm.com>
 <20261013-sahara_protocol_new_v2-v9-1-dc9f24357c4a@oss.qualcomm.com>
In-Reply-To: <20261013-sahara_protocol_new_v2-v9-1-dc9f24357c4a@oss.qualcomm.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 2 Nov 2026 23:28:20 -0300
X-Gm-Features: AclHuK-mWSKXd9lnXqiSNJlntbzfXiWNAcEZqwA15ieqTiGdj9OVEQ3Jtku0h9M
Message-ID: <CAMAsx6dwZVCVQpfh9DYVU3NoTrsbRLOiORdMKm3Yo-vQLmpyFQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] Add documentation for Sahara protocol
To: kishore.batta@oss.qualcomm.com
Cc: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com, 
	ogabbay@kernel.org, mani@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Kishore,

> +| SAHARA_MODE_MEMORY_DBEUG | 0x2 | Memory debug mode. The host should |

Is "DBEUG" a typo? Shouldn't it be "SAHARA_MODE_MEMORY_DEBUG"? The
rest of the document spells it "debug".

> +| target. The Sahar client interprets|

I think this one is also a typo, right? Shouldn't it be "Sahara client"?

Thanks,
Daniel
