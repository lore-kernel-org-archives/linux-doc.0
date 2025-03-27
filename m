Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766F91ABED9
	for <linux-doc@vger.kernel.org>; Thu, 27 Mar 2025 06:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743056861; cv=none; b=B/XFSQCqHxFwAcL3VHbzdBgMECk+c0fFx7xoOcbc+Z71MXFN4U6ZLu41zPul6DNcA3Juz14s2ND9gHw3sE6myFIz43lL4z5jXfoGST4fOOsOH7eBBMaq04sgjr7IZxHRdMYbxJtF0Dz3yzwpoHU+WrHpqeX65aTKZoB9TClqVyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743056861; c=relaxed/simple;
	bh=vNB55LLHsIzewlg4O3Bpq6Hpru+HJpGh5yavNpxEX24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V2+5kSGg3IumoQ36mXX3wCaQa3YJKZ+pv02Bd9tA9Xq6+09LXpoS1YX0NwkqOH3Hhy7AR+p/b8d0O5wDp9H2MH0aayh25jXqw9KkeJaMsd//lwZZe9xtnoHxXglhHpYxnW8WvpHrQgveuWTC6M+bDgw3YFGTYcvNl3gcgkyOHZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Slx1x+X7; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Slx1x+X7"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30332dfc821so827246a91.3
        for <linux-doc@vger.kernel.org>; Wed, 26 Mar 2025 23:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743056859; x=1743661659; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vNB55LLHsIzewlg4O3Bpq6Hpru+HJpGh5yavNpxEX24=;
        b=Slx1x+X77vv+lBm/QSo/JzDCg5zL3cE+6cCBpC5Bc8vE4vLaS8UZxH/mGc5tkh7PHD
         u8OaFfYX9eRqGiffN9GCxXgfXv3AUdb6YhuceWvYWMWAfUt6nKLoOAiAHzF5ZlxT845B
         qwnwdrqf8oL+k+bliBKFqj3oxl2rynksEqTdl6Px2APq5Et5xjnLFHHFO4XU1QnJRXQ2
         Y5GJie3APj8wN8RVlAeO4TRALaqhGjrUS1LA8UknXJ9RnOlTexp+YPIuOHpXEiqCyJlV
         7yubMZZX1d24EaVRZlQ+ZKl+7EVD3maOJobMB+YDq7kRunvauKf8rfQxALyKVJul8zsf
         z2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743056859; x=1743661659;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNB55LLHsIzewlg4O3Bpq6Hpru+HJpGh5yavNpxEX24=;
        b=UmEBpZIhe4yrQmCUHxBK7xKGfKKSnVCjo8sPwtvoVj8skq9bjXc4I2necbAD7c14NH
         cEi6iCwr8Z0y9Ve+iNSsdmF82Ml61+WKX+uamqHQyOwKoA0ae4Mm0cjwlWKeXPQio84r
         9ZMV5548+pQpNjuIk6XuSRV42lD10oxhJ+/1DhqRwGwI39JnemHOx1a1s5H/kJ8rWkhh
         J57yQbXojgNcXv0qBS2xXH/pncBqtXhVeoQLxlg6/7+OIGnjlk1LU8UHnaKqiaIA0EY7
         cPiVSJzyjV6IYr/Dw761VWe2rOd4/y5xxhx76BKH5dt0wUBFDumyKhfhXFxhVecH5HRu
         LUbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe21WF02kuXVkkvCQ0Hk5p4doyyfDd6fAOBy/iN22RAuv8lQdeRgXUYnSbA9FstA5Xj68ePH4J/QU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx57GJZ97dU+fkBTxDjXjPzyB2CBWgAsuop/Wp77HIfmLxcXlEi
	5YEcgWGv0y1UPSKhC51bg7ASHTwsVuyRIcasPSebt8tISDYl361uJAd60c7fGY3e2kRf92THlBI
	EN7qIIWJ1ZjU+XsJ4wbfQGbUtJIQP1SfIJztU
X-Gm-Gg: ASbGncsU1V+MRpQLjlsrY3aeFFynzY711BtfhtJaWwRtARlkkDel7vbXgPEsnpyz2wH
	MS8FKBL3Z2BiCW7QByuzEnz3NF+690X8HH3doylsmVCB/oHHB5PtkTf4tcJxFSeAHI1t+0FOYQy
	23WM0eF6ynr380KFraoY+eGHbnSEzVYlIkexSE8lfgCZvhe3T+GuYcMEiS
X-Google-Smtp-Source: AGHT+IFt7Uet3UwCNOAH8meYB2W9ViJLDi7wcmCNPw9mSbfJ0sSbyamjROCSnSFkmO0FUw183zFiWc7Rnl9Qc4okr5s=
X-Received: by 2002:a17:90b:354e:b0:304:ec28:4437 with SMTP id
 98e67ed59e1d1-304ec284935mr218399a91.22.1743056858259; Wed, 26 Mar 2025
 23:27:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319005141.312805-1-quic_wcheng@quicinc.com> <20250319005141.312805-2-quic_wcheng@quicinc.com>
In-Reply-To: <20250319005141.312805-2-quic_wcheng@quicinc.com>
From: Puma Hsu <pumahsu@google.com>
Date: Thu, 27 Mar 2025 14:27:00 +0800
X-Gm-Features: AQ5f1JoUEAB76GccOuQU5OR51PoZ29U3C8QHFwNl_oTL2dvwjiuuxHuLDi3FutQ
Message-ID: <CAGCq0LZoi0MOJLJYUeQJW6EfOU_Ch=v1Sg8L4_B-KhdDCx1fCw@mail.gmail.com>
Subject: Re: [PATCH v36 01/31] xhci: sideband: add initial api to register a
 secondary interrupter entity
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz, 
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net, 
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org, 
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com, 
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

We have implemented and verified the USB audio offloading feature with
the xhci sideband driver on our Google Pixel products. We would
appreciate it if this solution can be accepted. Thank you all for the
work!
