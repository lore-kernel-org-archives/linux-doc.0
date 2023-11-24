Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VwCbSmup"
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D8F1FF9
	for <linux-doc@vger.kernel.org>; Fri, 24 Nov 2023 09:02:01 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a00a9c6f1e9so313765766b.3
        for <linux-doc@vger.kernel.org>; Fri, 24 Nov 2023 09:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700845320; x=1701450120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=43E23uAnd+k2rGiCz48QeTcuuPvbRuPzS8smKDyaGvc=;
        b=VwCbSmupocpzDeosNfLh7kHXy1eo2BxVw1J3vsuaJ26PXrVqNdlMi1kC5eVLU4JLCt
         wCeo2EckUXIS5c9wAgWqxc3DR9V8lVy/F5H8KvRB8kNYAe6NshBBle5myL+hjV/VosrT
         uev/A6BFSA1b43q7tiw9JUnkkqkhAozOt5KSsYDLZ0R8KDwSHRbOI7gobSW/QnwRhaGB
         6VsiiHmQ2lLcOjPZxPpiynVZBJYWcQjJewLWnACObPylH3grAZaa2XODHcjjziEUYjIn
         0It8/Xp03zb0z4+0GEVYd2WddFREczCxlYkEi/MfYZGMz8bc+oTZ+1xHRUdkrCL0qYIx
         QGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700845320; x=1701450120;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=43E23uAnd+k2rGiCz48QeTcuuPvbRuPzS8smKDyaGvc=;
        b=bEdzScCpf5v1JtmxP2P8FrlBVHHfkyArAVJYQN5jMVFwNE68sHhIJrZxYPfKlgKKuN
         EoNjwE/dmajUsmZv/GIpxJSkNeKJrka4nrqp4nSnZFdEo9NdU1is6Y8/xBYTdyDcMMHm
         nv59xMp/l15OUB0Q1KFOHaUAq5TQ+BQNXEOwHsnFezaYc+SR4hDpSIYTUm9NLlauaDRu
         FdpAAtyZ5m4hXoz1cQyrrqMKnJTQY/CJ7nH5uzc7P4eAy8u6YGZBP9SMZMMUGxEcfKnk
         1OPUbBimys4F0bpU4ca3ZKHj9An52S/PzRzH9/TnOtuZdmfaT8VjVsICBl6ky9iQJX9f
         8iRw==
X-Gm-Message-State: AOJu0YzdfIXUx8Qvp+icvQm+/P8L4LpfAuNx08K24yR4Kx0bgPbBR7xa
	45ny8lGyi8ppEeSw/rj0RzyA2Q==
X-Google-Smtp-Source: AGHT+IElUO+l51/8AnXdUmo/6bFieTHSrdY6icuz5IXr0X61Q6SkPXMM+wDGNFKRt6RKrJ9IHvi+Ig==
X-Received: by 2002:a17:906:856:b0:a00:2de3:73cc with SMTP id f22-20020a170906085600b00a002de373ccmr2137734ejd.69.1700845319366;
        Fri, 24 Nov 2023 09:01:59 -0800 (PST)
Received: from [192.168.0.174] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id r17-20020a170906a21100b009ae57888718sm2260761ejy.207.2023.11.24.09.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 09:01:58 -0800 (PST)
Message-ID: <9b0cf286-b938-4a89-bd5e-c2c00cea020a@linaro.org>
Date: Fri, 24 Nov 2023 19:01:54 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] docs: mtd: spi-nor: add sections about flash
 additions and testing
To: Bagas Sanjaya <bagasdotme@gmail.com>, pratyush@kernel.org,
 michael@walle.cc
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
 Linux Documentation <linux-doc@vger.kernel.org>, corbet@lwn.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20231123160721.64561-1-tudor.ambarus@linaro.org>
 <20231123160721.64561-2-tudor.ambarus@linaro.org>
 <ZWBMyPIPwq9L-5pG@archie.me>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <ZWBMyPIPwq9L-5pG@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 24.11.2023 09:12, Bagas Sanjaya wrote:
> The numbered lists don't properly rendered, so I have to fix it up:

Thanks, Bagas! It looks better, indeed. I'll include the diff in the
next version.

Cheers,
ta
