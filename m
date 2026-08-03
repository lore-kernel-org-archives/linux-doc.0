Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7202542EEA3
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 18:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785781594; cv=none; b=I94tTvbb/qv6Rz+ACIbOSVFGnd3yAUmJNwuTkBdv1Kjw93oyAIlAUncanYJ7KsR0/IdKmDSYaDjcCJQBvLm8dny416AWJ3xys5tRKowDdOsJheoNAroegHjL93YVN+vsLI7IWx0JoS1Bm20/PpunkS4oVLaZYjqLeH9gxDelJXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785781594; c=relaxed/simple;
	bh=hwElJ/3E3WMgBrgtpSjoWAd6JgFyEdeWgYXT89wOChQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hYpJBXzKvENZUVVwCxF3LxlSvcxcUF+MtCHGKqiYS/NLI7sNcvF69cgNrrojs5zdunbVvpR5PGjhNmhLE11oV9m96qkSYiYC2LA3e6Nz+mm8NzEzH15k+oZtD0FzNTXUerCv1LY/oXDyGueu1QlhmBSxa992ymzcmpnSW0H8Kq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rl3yT4NO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rl3yT4NO"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49553515a8bso38016595e9.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 11:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785781591; x=1786386391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hwElJ/3E3WMgBrgtpSjoWAd6JgFyEdeWgYXT89wOChQ=;
        b=rl3yT4NOl3B0A6qA0n7Mj7nsFPyUZRhHX1CNcVJ2ukHSbLKGxabiyv1168tATGTyAZ
         yl9+4IVENfYbUW5GVSQ7dQr22gNibdn2wjzIocerZiSs9TbPY+Mb/cl4Zsn9z0GEuU2N
         q9X/WflxudXF8aVdhuRWsXihPEMitlNqBiDX6M5+Si/HSiKprih0oWj86/GrPBZOH0fH
         p6MH5B3KrKzOc4+btOJbwehwe63T+JSv95eFAgg6frF9jQeXoqvmPD3QRY2Cyj9I4sGA
         4l1BSmZwa5qV4krPltTIeGb+syJZcnSekO6dMJmqRgK7zza5XePYX4Nvyx+fclLpNkyx
         4KtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785781591; x=1786386391;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hwElJ/3E3WMgBrgtpSjoWAd6JgFyEdeWgYXT89wOChQ=;
        b=Ut0GFwz1EXJIc2ldf97trvS7T6js6s7R+88hFQcZbGkoDmEiOobGlG7CHEVjxVWcff
         9wktf9LWzJPkzwpsLPdoprIizGDpb/wZV2uik4dK9NJ26oG62uhHUvKQSZSCbldk72Q6
         CN9VMKDkoChB+vOLxPWzvK/dM9Bq4yoZL8A7GLYOpyUGNlmrlCvRjK1QmnHeVi2jUUgW
         gPH58DErRp8C6NJN3RqD6GMKTfriMJYPTEMVadH4J0vHmcs5cDkoff1qZsZ4mRoDhqkZ
         Q3d01nSwIKPK247RgZx6wT/anr46YbsAi2bzSSSoKLmIYSsfWkBZ+wNfyhLdfzhFwysM
         nO7A==
X-Forwarded-Encrypted: i=1; AHgh+Rr3lbKqRYF3BncnZEyTwBMd4O/cQcYIXBlMPrR2xjb/sj+9KcB/eSPCfgL/2DR5+PRI0eFmkpkujN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrbDcxjVwiSqWAUFXdJDjwTd34Bu5ZBfvg8sVbnNWxCdw9rqjB
	yPu+Jpl+UAEFQEIw9Vxn+QRix8RYsm44E0FR0odFe1lNiIGpPgpHIqSQ
X-Gm-Gg: AR+sD110ay2q6B3D9eq+3QEdJKq4/3LmAjhMxOxoEbWHhPIBL5mx3pKnTvvXs3hQMqd
	8I5VRtl6MDWTBFrMg+ZN84GgUSn5WmUooInIguKiGu5Ov3hvBXuvVoXuRS4Yn3qpt+uPoJLNiWa
	jNZlTylcU8o4fv+4YfxdsGGzUen/OxdbosiQa56NLPGDcW59ixutrRpJi3DF15wrNlhg3X8DB+X
	Aaj5n2DImUBhEI+RsnJsnR7g3SFy5NeaozhLkS4p9gHC0mjYjS6CmnohURup64AgHhl89/zrkZb
	d4ECUUUzu4Olp0G0Em4G2g1AhizS6pt0eUn9KAuCy0c+a8eSO0UTHuKFlaGLwlYLOfUSY22t6k5
	MzhGkZd/N7IHyHiIRKClNK6x5G1W5TU/iOij2Gvngk9v6QvVDFgO2mD12TyN8HWGPNjPSDPCP5q
	A4sEpeQTaSaNQ+GmG89E7VQKvlJstgHC6l7aDzEC1xMkbsFtz1hb8d/6yg3JcA2a9/f6zO3UzzZ
	EjblijRW0VFlkEGywpA9ckaS7Jd0/B1Zldw6BBKhJsR8SnjYTiBKJgU
X-Received: by 2002:a05:600c:8b14:b0:493:c845:bc20 with SMTP id 5b1f17b1804b1-4980c66c94bmr266920645e9.4.1785781590469;
        Mon, 03 Aug 2026 11:26:30 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994a0f7b73sm15094885e9.9.2026.08.03.11.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 11:26:29 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <58a8c7fe-378e-44be-80d1-01479c425f5a@gmail.com>
Date: Mon, 3 Aug 2026 19:26:28 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: warn users not to use select on choice
 options in Kconfig
To: Nathan Chancellor <nathan@kernel.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, arnd@arndb.de,
 stefan.hengelein@fau.de, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, nico@fluxnic.net,
 officialnaumansabir@gmail.com, rdunlap@infradead.org,
 vegard.nossum@oracle.com, kees@kernel.org, tj@kernel.org
References: <20260715220149.48700-1-julianbraha@gmail.com>
 <am-W4tuI0k7MKXVP@levanger> <30650585-9d4d-4771-af7c-7c3908281719@gmail.com>
 <20260803174736.GA1067866@ax162>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260803174736.GA1067866@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/3/26 18:47, Nathan Chancellor wrote:
> It looks like number 4 has been picked up as well. Given that we only
> need three more patches to be accepted to turn this into a hard error, I
> think it would be better to hold off on taking the documentation patch
> and just push for the hard error next cycle. If these patches are not
> applied to other trees before 7.3-rc1, we can ask to take them via
> Kbuild with Acks and/or stable branches for 7.4.

All good on my end, we can drop this patch.

- Julian Braha
