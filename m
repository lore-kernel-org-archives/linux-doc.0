Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030071;
	b=vkyzD6SwTgRjwC8O++ip42x66hunJ22snTKsYfWWkJEk+yIqrsCycON/Tkq5j8hHx22m
	 p8tCV/6V8kML2i5rs9pQto003Dns3qdXXbq6eRv0FLIWg2qXblvBfWQX/IyGaBZFMOlgs
	 pBo4nnljo1TKrlQze+CIlGXbTFfDfpA6eGQj1NCzYAMIfUd6/EHLwzWk3PRzgpkfCIxL1
	 nZrzG7g4C95tZRhSOQHK8iG1/zan4Jwup2dy6oShrmYTh+TrfyFHLPuztuzJ2krrthfD+
	 UV5pkEB2znRW5vzgPOquVHHJBXqNVbThFyZO4bd2P0zJTjHiW2rFtKsk8N2gp9NoHLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:Date:Message-ID;
	bh=B8FTqo2cthF1N8/EPSwd5W+NmZQX4EUuEeAqIs6bJK8=;
	b=gdxhWpW5ae0CoGbkHvrrwcwjyVufx4eNhEwbcZ7koR6Bd0hVps0GQLI/37nzIStFnX94
	 9gUA1HE8pzlz3FVw9uSO7HV7F4afLbrM3BRmdKarXIQKk1oT6RFI5knIM2aIq3ylhOEDC
	 aWxDHjc4Z8J/kM+A8hORiw2LltZsUi5r5Pj2nEysrMBjB+a6UDIpWo/pEZgrAalkBXYjY
	 xFOZf1tmY8r3BV59lX6FzMsiq0kqsGfU9BVFQ3RDTrraHNo35yxfcwnANemDCRAdsZJTX
	 6acykGwezx5fIuCmWkP+H3/27Wf8/a2LlFAMIuS/5KyqQ/PRvHoDcX5JJQwKoraUbog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oyaFVDfn;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4864B606A31A
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 15:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4864B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oyaFVDfn
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2e96be2196bso10571025ad.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 08:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793030071; x=1793634871; darn=vger.kernel.org;
        h=message-id:date:mime-version:content-transfer-encoding:content-type
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B8FTqo2cthF1N8/EPSwd5W+NmZQX4EUuEeAqIs6bJK8=;
        b=oyaFVDfnJhNi0xtZL8JjXLPR/BF85zCb9JkvG2KlyL6QWoiY73Ez0mkdKjydkDlCmd
         2t4leyL/054cIB31SHTnLIbCVGAs7RaNU/wVjBwywj2lodtohWE4LxdRORCLEicTSMQP
         paztEbO/z5tA3aJxCfOEo7C0SwKWn95TcRy8zRWC+01IwZlj9yIQx+8XxBtuuc4juFdY
         9mTy2b6FfFAkv7BXni43NoF7XhtkU2vBEFg5QsLOTrnFfh5fGNyGb2KJdgEpqroR+8AD
         2AlxjB05Ap+zoVzVOxHje880MV4cS95L3CmB2TlJrQ/qvjcUzHk4e6ANvyv3ILZBDVmE
         r3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030071; x=1793634871;
        h=message-id:date:mime-version:content-transfer-encoding:content-type
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B8FTqo2cthF1N8/EPSwd5W+NmZQX4EUuEeAqIs6bJK8=;
        b=uy1APzkAJZ/13iuJuvRUOKxpUxlGxhksTU1ZMTK6ipUwFGNZ1KcsBFXRc9XIrM7Q6f
         WVo7KQqh17D0/koxJCNlEQs7VTgVVHWr4+N7M/ZZg1XsZhuKFaHcP0wZBrtXFR0ChRzf
         KadCVmPc/6JAHj3Xu0+4+AEb+4CiTFrlGD63No2ePIpCYWUW23614+tjJGHRERKeS1zi
         6/7JZO3cZ2DdzI8VEDojNUcRhfgY/iGfEdS0azmHlramVhf58iWH/KFD4ZItsiUoqLsY
         bxxfYjJdt9Dw7LAlzwWUXQ01+wLBogXGFbUVx0lIdpoFye3yt3kyL+qaT+T0kZK+K+P1
         zNuA==
X-Forwarded-Encrypted: i=1; AKwUvBzW8C91YXDHxTOcJAaFUMjVVtRFMnQsjY5RMyhMLWvVMNDkPEEgjvY5MfQL+OGY2qlCXgKMRuwqDlE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9eXvgXIYw2TVieW6wFdNhWzvXxMAaKKPOInGaMhwVDpIEd2uv
	tZUbWzo9fyx4oPiNXvuoN1b/HHvawA3IUCgxqqqL2u5+iWkv6jATmSEc
X-Gm-Gg: AYBFou17VjHjS1kmYDE91/peiQLITVtS1awnS/3B+HTZCDZpj79KSpnkQ+v08aNA54A
	ZoFas1Y86oQzfDzFQ4npMObP+ATXPInGMzUerSL2tZb0AaLFBs8wFnS044o7Kye+ZttqwNPhGfM
	0Ip4w8mDFIxA78bqoEYzq79LZNVDzHQGflfPOLEMXtl7XkUz9k2jMmAagXUI7gc1z2RSRsX0OZ4
	TNzR/Ftf9XypUyR+xCYPlfAU2Laf6fOMS2TpzE0BRaOwS77cJWpbUHbq252GD/1hxvw/LpIyl8S
	otf3nlf8hx54prszZWtF/U3dY+T3e+xC6MLT5ranE09CKEZsdFUieUwWPviKzq4YRajJTzL9fjq
	bEixhfhGIzDt0Dbon6x7Y8sJ1rXOk+0LMJbxOAy8AeFtvfgBfqsVoAjzdECfzGaw5M5spPJ07da
	0LLd595P1OQOSC7TE3/4Fptea6N8w0gNNbiAw2nhO3b64J/nOq7ThZvLeh0BjibCFEQho9Q2Wg8
	grHHN+HOIWr2KILoK85YMupWG9mA87fJSgENgw0m/EBrDrItrnrkv/M3zZodeN2Bvlmrl1qqrfR
	rpTxZ1avSYCxZhf/2rgVBT1FKEBVg7z/mpViCsXGdbP63xiC5VXv
X-Received: by 2002:a17:903:988:b0:2e9:5059:4477 with SMTP id d9443c01a7336-2ea9c6c82f1mr52579075ad.23.1793030070524;
        Mon, 26 Oct 2026 08:54:30 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b221101sm19099555ad.71.2026.10.26.08.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:54:30 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 damon@lists.linux.dev, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 4/8] Docs/admin-guide/mm/damon/lru_sort: fix remaining grammar
In-Reply-To: <20261026144451.150560-1-sj@kernel.org>
References: <d054b7a2653a2ff3d419b689a50a53290c2cafbb.camel@mailbox.org>
 <20261026144451.150560-1-sj@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 27 Oct 2026 02:50:54 +1100
Message-ID: <179302985414.2.11997096580844017569.damon-docs-reply-04-lru-sort@gmail.com>

Hi SJ and Manuel,

On Mon, 26 Oct 2026 07:44:50 -0700, SJ Park wrote:

> > Yours isn't wrong but I would make it:
> > +this scheme should automatically be activated and deactivated with three memory
> >
> > Choose as you like.

I feel my wording reads a little better here, so I might lean towards
keeping it.

> > My choice :
> > +Below are the descriptions of each parameter.

Agreed. The plural "descriptions" reads better here.

> > I would go for this, but I'm not sure:
> > +Number of times that the time quota limit for hot regions have been exceeded.
>
> I have no strong opinion.  Aveline, let me know if you have some.

I think "has been exceeded" fits here, since the subject is the
singular "time quota limit". The same applies to cold regions.

Thanks for the reviews :)
Aveline Noir
