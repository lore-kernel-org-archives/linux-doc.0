Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B333740B0ED
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 14:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163309; cv=none; b=pUNI40VRNGHTi776nRMzaWId7StSfuW4gURymLDUmGqzefEiehPZ93Nj7OLCB24QVlQHhGAGCnLthYBjiCLb+pH6m7HZbT/EDNA+kNKHHd5QlKcbKnIb6GPUqosaVf8k5kA+hNERAlynabgsrAi0fQDLnNZb+mE9lFQHjwyHrTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163309; c=relaxed/simple;
	bh=t6w1Im2DkuyzdMCE+ASzKdfVWcpCqbCUNEi+RElOGho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VW8q0nCx1uL2WLvWSmQOrp5VkkPeqA2oGG6pZL6rN/zw/bq8OMPzZanw2oe9/zi+RB0NxNFWvg53IG4GDb936Kv5Wl0jlufLAgA2iA95HpGVPAfPH8WEXNJJLSyAvgElREgbrxLj40LlPtX/5OIzJrY5Sk55W7pcyclpZjJSJ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q5F2L6/A; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q5F2L6/A"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-caf707e3a70so2479560a12.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 07:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785163298; x=1785768098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ho62qmc8k6xuRrfZ2CNtaVu4pSIvsJ17TU2OHfivqGo=;
        b=q5F2L6/AJpLZgEfyFsdtxAZMGyzP8on10GYdDW8kFSoMtiwZuKZLeP9pHNBpdMU2Qa
         SCqDQcmfu+CspaUIrdvFzEobHwIuDDuMxy8Y4/9KUQUWSJvw+FnB3T3S7uoe1lvCYcVE
         Eyr508+82v8myGS33jvkxwvDDz3fiB+mtAlZ+iO2nkEIzVoBXN9ysbOtc2IhkqrcHet0
         OfgXQyNTLdLS3W6zDBP86iMavCHwAi5fbQexHnnNdaMi37eN9QX2Bm5HRQ6Bpq/OEwdI
         VfLkR3omfhKhXae+6f/KH/Ec8eRKLT5+7gZe9r7z/I3G7nDV6eCdC4hvkdYu6Oq7++vS
         dJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163298; x=1785768098;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ho62qmc8k6xuRrfZ2CNtaVu4pSIvsJ17TU2OHfivqGo=;
        b=PMuEMlPLWZp7MtXPMAoVAC0dwaVfgab3Sa+KkgiIxYQnVUMGCBKKoSBvewyOBkTLOw
         9alIFQJQfT69IuE5vHYCYJ90D7s9Yw71m82zC0nfcn1rMEkvxtdyljBksMTbGeS8ybxY
         4p2yRODDhf2I5+IQG74UMbIwoQlZJHtW0OmV/ugbmvioThUKXMymKsoic45UepYD9mGS
         IxGcayzZ8ZWwpGiKVR7iIuHY7MFdGAgspdgKrMHQFViiP7kWXCnJXCAIKGm1B4rNzxXi
         OUI+dPUVVbyYZNOvjle64oyTuI/GEymb1Tid4DeSV0T8ah9RMZcWT+J/+bverSTRbv8t
         q8jQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNjC7wDQWlWccG6Q1tB/TFqOWSgLlmIO/dK/X8ejjWU1R235CQujrxOLmxx3POLx3hhfSzsxc1dz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGgZHlt4RNpAaEAvQe8SHy9OU/x9CXY2320AUxC1RRwPf42RvO
	majnYfp/RpeRvgBW69kjnEG+kv+0e6zIeSLbJzjX38hKFwpreSevoQEQ
X-Gm-Gg: AR+sD1378cmn5dkWztgrrPLWm+X/99oscU38tIWvM8q67EDSGCdmI8GuBsEw739J9V+
	wzmhKx8BwqJiWyYIyrWZRZ6rRCzzuBRQLM/GmIbKR3ywfhzEyPkjebGtD1z16weI1vNBEBazZym
	cKDh8vB9cpAPM5/nM5dE5SzNEdXGeVvQtJ6rZSbXFJvVbnvyrTrajNaVs7soBaexLlhhQ/3ZGa/
	qthMZZfY5QM9Pq3f32ZG3TkAU9tid25A7p//T49b5/KEa5G1RHLjU7DBWfOIHNoUY+CiA4NaJQe
	WT3VfH+WexDvHxZZGAuzdd5dthUsLssQJHDD3uXzkS/vW+hcdJZE3t+AlTddwAxFl95FKzWwP70
	TzP7lC85gaPcTVzbEkgP8fu9Xcstru79nRtlm3nmY6eNFjpyL4QASMsFKrdGKX/zZbE9ggPIIr4
	VgEW4xP458PulcBdg=
X-Received: by 2002:a05:6a21:4e01:b0:3b4:6af4:bdd5 with SMTP id adf61e73a8af0-3c67240d4c1mr10310593637.15.1785163298516;
        Mon, 27 Jul 2026 07:41:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc288a79sm32928271eec.0.2026.07.27.07.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:41:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 07:41:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Chung <Andy.Chung@amd.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 3/4] hwmon: (kb9002) Add driver for Kandou KB9002
 retimer
Message-ID: <9151a4d1-a23e-4247-8583-03a1e8976a1c@roeck-us.net>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
 <20260724-kb9002-upstream-v5-3-9523c3ffe83a@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-kb9002-upstream-v5-3-9523c3ffe83a@amd.com>

On Fri, Jul 24, 2026 at 12:47:39PM +0800, Andy Chung wrote:
> From: Andy Chung <Andy.Chung@amd.com>
> 
> The Kandou KB9002 is an 8-lane PCIe 5.0 retimer that exposes an SMBus
> target with mandatory PEC. Add a hwmon driver reporting the firmware
> aggregated maximum die temperature as temp1_input, with the firmware
> version and boot status under debugfs.
> 
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>

Applied.

Thanks,
Guenter
