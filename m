Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8135F2375B
	for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 09:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715936925; cv=none; b=L6jSvABc/azs6urh6DZYUyBxl5r/TWJGXsWnVgMGRzSGmHak6bcmG3gXrP3mxAyxsbSZlPfDSpSWmKu7q7otIUyP4BbQi8+mHwByVooeom8zf/bBwJuFF8/LKRZsGlLL9GN5s7wNH+FgKMgh8BNj+PAGFZ3D661uqZSd8i12HZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715936925; c=relaxed/simple;
	bh=TEHtCpgbdlqVzF1zXyzG1Szb517FKtFzCdajAHVAtmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d5FIIgRa1JMIef/17PXR8Yn7QCpbSqTxA1HTW2rhU1NsxXeDHvrrLmfKfxhdFkdkTeEhBCJxq8W58nAylLqPgoYJCtKWvsy6C2mvW3GBXt4MRgiA3NQnYNg9D26rkSYmVd7con6CMD9inGa1gRgqK2u4qdHVnW14xPMWUOQ87IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=fCQKzEXp; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="fCQKzEXp"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a59c0a6415fso443600466b.1
        for <linux-doc@vger.kernel.org>; Fri, 17 May 2024 02:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1715936922; x=1716541722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xwh3lnhUhd7oHBvNUUgJZI2n83eK0ml7NC11m5y4KDs=;
        b=fCQKzEXpavPM+TuuR2ydaqtoyHospQaCnY360d1397CsR/nVbCTa1Qy0Q6YgjGqt/L
         tkD71mYnNkf4JPg+za0s+krI91AaiQcmsYTm4eo+hR1+6FJ+qk/r5PdHGmxxoOu+1SCX
         F9V6iL22RWAp6X/30O+cd43S0eAmvVGbO5AUngW1ROKKRaBdzP0CjmFdyCyKzmBiHMny
         XTxVCY32sQO2rL7jTXyskzCSalfN9RyM42mpoT51TCTfzB3+een6ul3CRmKuVeFabpZG
         jAaJH9a6IS9HafT9TBmAZe1RcPATh6djiTWWBCIZnVzt7R7M4BGByqqfEZGdWKs9ZCyh
         SsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715936922; x=1716541722;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xwh3lnhUhd7oHBvNUUgJZI2n83eK0ml7NC11m5y4KDs=;
        b=Otl+WojCbZYFAYUKMWY7LX7SNkz20lB6p35FMOJvKjt7Z5IPQtbrezds/zxilr+fN+
         vZGkcXIeVfeQd7ZlYwCU3HCl3GFDf8noCIHMHExPO9UEcWjCArstRSV8A2swhZosgt1o
         F8RDwOHAjmE4Mz/SzmoHhyoVEiBN0OJ2TvLcfREN2KvlV4LMzQFRYbNwA5w+P+m8tF/G
         v6LxUu1+o+2/SSfYnGp9u5c1DI/YAG5mVBSAK6ThKGbxtU9+k9GKv45fBE+0k7H5o1vi
         a7JvvriImvtDoyAhYI3WscQm9SaOx6/SUfz4X6i1HMnEj+BiYhmVwRfW4FpWCGWEXBzB
         CDBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXRIb4p1xN2mDdhiKbyJcwdmBwcGvn2ftHaWNEkO9MwLebzhwZzIjNeTZrtBumya/OwTTJQd2ScaAKsp83LWhTpIzGn3A+ofHU
X-Gm-Message-State: AOJu0Yz9GaK1m2xyieMyId4QrdQx2dub80fNqqlq++aK1ydVIujhM2Do
	1Jcqp/ZxoXzArMC8HpbH9kCqFqFw3+/fthvzRMF03Y+AB3RGuybyb115qvsnXrU=
X-Google-Smtp-Source: AGHT+IEgG+ysyN5p95zBEB/teN7eTbSrbUtVmUotuv5u7b9gbXK+Nvx5y+aX5ItM1vbciitmK35z4g==
X-Received: by 2002:a17:906:4886:b0:a59:a83b:d435 with SMTP id a640c23a62f3a-a5a2d55aa50mr1373772366b.18.1715936921554;
        Fri, 17 May 2024 02:08:41 -0700 (PDT)
Received: from [10.91.1.133] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b17886sm1097162266b.210.2024.05.17.02.08.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 May 2024 02:08:40 -0700 (PDT)
Message-ID: <40730e9f-ae2b-4b56-89bd-f839876271fe@nexus-software.ie>
Date: Fri, 17 May 2024 11:08:38 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] remoteproc: qcom_q6v5_pas: Add hwspinlock bust on
 stop
Content-Language: en-US
To: Chris Lew <quic_clew@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, Richard Maina <quic_rmaina@quicinc.com>
References: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
 <20240516-hwspinlock-bust-v1-6-47a90a859238@quicinc.com>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20240516-hwspinlock-bust-v1-6-47a90a859238@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/05/2024 00:58, Chris Lew wrote:
> From: Richard Maina <quic_rmaina@quicinc.com>
> 
> When remoteproc goes down unexpectedly this results in a state where any
> acquired hwspinlocks will remain locked possibly resulting in deadlock.
> In order to ensure all locks are freed we include a call to
> hwspin_lock_bust() during remoteproc shutdown.
> 
> For qcom_q6v5_pas remoteprocs, each remoteproc has an assigned id that
> is used to take the hwspinlock. Remoteproc should use this id to try and
> bust the lock on remoteproc stop.
> 
> This edge case only occurs with q6v5_pas watchdog crashes. The error
> fatal case has handling to clear the hwspinlock before the error fatal
> interrupt is triggered.
> 
> Signed-off-by: Richard Maina <quic_rmaina@quicinc.com>
> Signed-off-by: Chris Lew <quic_clew@quicinc.com>
> ---

> +	if (adsp->hwlock) {
> +		ret = hwspin_lock_bust(adsp->hwlock, adsp->hwlock_id);
> +		if (ret)
> +			dev_info(adsp->dev, "failed to bust hwspinlock\n");

qcom_hwspinlock_bust() already prints an error on failure, you're 
printing a second error here.

Choose at most one.

---
bod
