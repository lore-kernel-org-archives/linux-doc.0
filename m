Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A653312BF3C
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 09:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707210434; cv=none; b=WfL4rvRWZeu6c4rZTztQD5tZWs/Up8lTDb7jSkiIC8z9/X/NPje9S5FyUPN28pxnLoVoBU8Wj14pZ/6zK2LJ8vemVC9/6ACGLdO4yIxdBiOAmAFLxeDFk9eCHshtGtXiKq60hYU3HDlEf4oqBym2CaEBL9FQKbxTj17F5o09buI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707210434; c=relaxed/simple;
	bh=fnEctsruhnVWmql+TCSz11y0qzJmN4K1EeDPjcx04Vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UPY2SKr1TVNkLDCqHdkwBrxgyGgE2sTh3miPIkTi0cK57fChbJHmTqlEp/oMjNegeUTKpQOHpende8onIDYNYuSkW7F/FcEdYDZLEwnXIOlYu+kqjPFRn+27y0i9msaYZm8VuiPRPAJoTZiVc/0EqttRt1VP/B+7/eEw3fxY5kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SBZK2Weg; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SBZK2Weg"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5101cd91017so7053901e87.2
        for <linux-doc@vger.kernel.org>; Tue, 06 Feb 2024 01:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707210431; x=1707815231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WM+y+UC/O88KwoIvUP7ztF2oIYBeAuZ8I4kYszkol04=;
        b=SBZK2WegSlON9KbJe/eaicM2ZG1ZGJwG6v3Is7z/Y3lNWVy/DUigWr9R0a5/guxSLH
         o9FeA71M266CLNQYKOF4YF9legQYslKW0sx0VtO4ZCo82lsxPFFTbXYXdqfa2guExN2t
         FBM16eSTsMCjFg5n+duvQ9H55Igk6Mqwlja+RZ784kz+QKFVRG/ehZU6+/hcZpGB4/Gb
         0tskeTMoi4ZBquo0kkbzH8Zb3ScVUN769CNKp64WIu7zDCMEx8MVMX+gyxMz7sjsovKI
         IO7asHlDZIbsVK7AkgAWRs2fqK6dzQGqfw3JtlQgB8q6i1MBSzP7lrQjHz/3f6HsxVGd
         WQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707210431; x=1707815231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WM+y+UC/O88KwoIvUP7ztF2oIYBeAuZ8I4kYszkol04=;
        b=RV7eYflUgcGKyi+Pcha1tybHHuVHQEH1t07Qkulhr6PP0aewLk5K/4N8Q2CX+hGI/9
         3GFzQoUqgYdWWCGt+EypOfU0jfI+L1GNiAzlh2++HsejOQ9ldNJPcsr/qDrJWfzVmDXs
         QhuTh2XWudm7QCUfGpkNkf3w3OxZDrD7lw247nwj5yZ8GHAqDSq5YPSSG16Puwv2nMWy
         Be6ceya64JgqQgRvETEttCo1C4QXyhMl9mWk8hj2rEpYzYntnRVqKGEI+L/LTTOThy2B
         uHPM1x1TL78ztRAPGqqe8rGqBf+JK2oDKM9ulXeR3X9fpkDbdXzSesqDdU2L5ZklBOJp
         2gUg==
X-Gm-Message-State: AOJu0YxFffjLJEONS/iuI9R9/yOFmco2fmalu1BkVdYlK0pTt1rF0bNa
	fgJ/bv1E9V39Z7As86xpwXssyhG8uppuO/djshg4MrldaW1vGqhiJaHin76ciQw1F8kL8Bs1nRP
	lXUA=
X-Google-Smtp-Source: AGHT+IEVtfeRspRLdAyLcxvAk3kbxLTxwqNrCZLbrhzZEIgx06XTFt+w7WRDO3WY1hTQdxiW0zJC/w==
X-Received: by 2002:a05:6512:b8c:b0:510:1797:14dc with SMTP id b12-20020a0565120b8c00b00510179714dcmr1667466lfv.10.1707210430685;
        Tue, 06 Feb 2024 01:07:10 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXDy6w5A1fvKBuSP6HcTwk/RZzZolXWXofV2m7S5vm8UINiI5mTxV9ZC0VhTGMIHCiENn328A+ii8rummc2TOQy89Ogc+5iB6YxljMe5ECt6nH0t3KHNEq06or3ZraISdd8DEgTRmdlt01b/Ki255Q9ifXNUA0eDj/q6ARUK+lZp4FYy5dNxDDs42hfwQojg6/2LgtC6VCxyXsmZnHPKi4BWOsjzFzFBGbt81fAfG3eGnHyuAkLbliS6Kj9SryKCs2b3UaL30Daikzqp6CfQU44ETz4YuAkkb8cRpB10UgGFkaS9Jr6H9gw8LiumaL+rjZXBl+kZ6ZaLwWsHfZTj+aogLmXs9bEJsPrqi4qluc8hrhNsoAoxX3yb/AdFuToz+4csCghG60H5XQyixUt
Received: from [172.30.205.88] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id 14-20020ac2484e000000b005114a6cbc4dsm187169lfy.4.2024.02.06.01.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 01:07:10 -0800 (PST)
Message-ID: <8189e50a-290c-494d-af42-a954a5d231ea@linaro.org>
Date: Tue, 6 Feb 2024 10:07:07 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add support for QoS configuration
To: Odelu Kukatla <quic_okukatla@quicinc.com>, djakov@kernel.org
Cc: rafael@kernel.org, corbet@lwn.net, linux-pm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_viveka@quicinc.com, peterz@infradead.org, quic_mdtipton@quicinc.com,
 linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org
References: <20240205145606.16936-1-quic_okukatla@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240205145606.16936-1-quic_okukatla@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/5/24 15:56, Odelu Kukatla wrote:
> This series adds QoS support for QNOC type device which can be found on
> SC7280 platform. It adds support for programming priority,
> priority forward disable and urgency forwarding. This helps in
> priortizing the traffic originating from different interconnect masters
> at NOC(Network On Chip).
> 
> Changes in v2:
>   - Updated regmap_update to make use GENMASK and FIELD_PREP.
>   - Removed the regmap structure from qcom_icc_node.
>   - Made qcom_icc_rpmh_configure_qos() static
>   - Removed qcom_icc_rpmh_map() API, inlined the code in probe
>     function.
>   - Updated declarations to reverse christmas tree fashion.

You ignored some of my previous review comments without a response.

Konrad
