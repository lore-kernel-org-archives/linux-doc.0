Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEA55A792
	for <linux-doc@vger.kernel.org>; Mon, 26 Feb 2024 11:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708948435; cv=none; b=cGX+L0Gp/k1Hvi67GC3G2qxX14ziqKxvAxF5sVSvbixfzsJ9noMDY7lHBjYZ5jbtg1gF+ZmiPHFIWCTSn0/q5sj2nmVZgfOJoCXJac0dsHTcJt0wp+PEva73U9ITLXRaSAYUZGpyK62NecVEk/fiGhSfQaCgSgSDPsDXcWVq+fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708948435; c=relaxed/simple;
	bh=ubN9jpbxnUOn3Nf+SSQIPfdxnodeJtVUj6aPzJVKrDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Bvo61XBprP+vGrbHUHYH/GgqlZSgCOw45TAC6K17en5mE8ufxd5uqQ9lmSS6TLnp/5rSxbb81kRp7kphrX9FkD9mgjFZE77ovuP++jyrt93R/W4bgebhpouytZ/nsfI9lRqT0IHf03mE7Iwu7YjR2Fdfo+8s/i/9YhM5UDevie4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JL4J6oxs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JL4J6oxs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708948433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=N83wWYshCUb0OAMGltLJDvm3mvy8KKu8gtewNQTz+Us=;
	b=JL4J6oxs4wy5RU75dtWLYJNTCm2EbEFfcBs9ya+FsBqWpaUvsgS1cdghekpLIfSWth75J2
	+hn0JLoUjwmGpZ5QENaqoLtv24ObjhY5h87t8v0LtB5L04/sc+dfVR4Lp181Q+mrxjGx88
	d/c7T7/iQcUvIj6mpiIhBU80vxUOPs0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-4v94yu2wPk6iZXA3L2i3IQ-1; Mon, 26 Feb 2024 06:53:51 -0500
X-MC-Unique: 4v94yu2wPk6iZXA3L2i3IQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-412a070d81eso3131425e9.2
        for <linux-doc@vger.kernel.org>; Mon, 26 Feb 2024 03:53:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708948431; x=1709553231;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N83wWYshCUb0OAMGltLJDvm3mvy8KKu8gtewNQTz+Us=;
        b=bWfmJhZW8VyXNHD/rXftrzt/+Ybnf8F1F90OiCXP4iAVYhkdwunNmkYmFqGQDbTQ8H
         3iZ79hw2sYstLVgSbLSFb444pleB29UATt3mqtsnhyHIhKzn7F/IKfqyeQoexarqjZGa
         1w5voxnCbgwBhTOR76TWVs8jpZ9pU4vr4e/rhCEQ0L+WTYE+beu+prASKyz+opQngPGj
         KdlwJ7nmkJJ5zT1W9yo6euiOkzGhIVJFiiCUKG/XknOfW0sQBDES46u+jaFZkHWNkclS
         GfxzBy/pJH7U98BeeDVypMmclZJfx+mRC9X5ewJUvS+tjfvw93r8f5TSMLbP7GZ9FDKn
         HwNw==
X-Forwarded-Encrypted: i=1; AJvYcCWaNPO0qn+MzMl887KLlO4Y4Le3aL0HUnGh57LSjYqQDkXxpKKVy+z7OOMm9Y14GtKKFMJX+rt13bW5hhniS6hcYGxaXtnK3QKz
X-Gm-Message-State: AOJu0YweAIhLJKEwNZf7nojQMkeOmrb1AAriEnd7wHNf8Kcfc+D/leW7
	7/u/bsHTqRpS1KIBHD1eIh3ERSI3ceUpyR77cZiFmntJt4HoGCyWJ1t7rz5WXf3SDBbHnewGYdH
	8OcXzB4HTM49qCGaHFhfWvcL9TjO4Pd2KJp47DFVzKEOs22EI5mzi98FedA==
X-Received: by 2002:a05:600c:500e:b0:412:a96b:9aaa with SMTP id n14-20020a05600c500e00b00412a96b9aaamr43261wmr.30.1708948430808;
        Mon, 26 Feb 2024 03:53:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwx+LSotit9GJsq9qeYONBhWJ0/Lg1vAqPd5z55NBn9kh7O4AFmUEDRgN2C8LqQLgCU6TDMA==
X-Received: by 2002:a05:600c:500e:b0:412:a96b:9aaa with SMTP id n14-20020a05600c500e00b00412a96b9aaamr43234wmr.30.1708948430442;
        Mon, 26 Feb 2024 03:53:50 -0800 (PST)
Received: from ?IPV6:2003:cb:c72f:f700:104b:9184:1b45:1898? (p200300cbc72ff700104b91841b451898.dip0.t-ipconnect.de. [2003:cb:c72f:f700:104b:9184:1b45:1898])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c114900b004128fa77216sm11727858wmz.1.2024.02.26.03.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 03:53:50 -0800 (PST)
Message-ID: <2f4c44ad-b309-4baa-ac21-2ae19efd31fb@redhat.com>
Date: Mon, 26 Feb 2024 12:53:48 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 19/35] arch/mm: Export direct {un,}map functions
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>, Will Deacon <will@kernel.org>,
 Quentin Perret <qperret@google.com>,
 Chris Goldsworthy <quic_cgoldswo@quicinc.com>,
 Android KVM <android-kvm@google.com>, Patrick Daly <quic_pdaly@quicinc.com>,
 Alex Elder <elder@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Murali Nalajal <quic_mnalajal@quicinc.com>,
 Trilok Soni <quic_tsoni@quicinc.com>,
 Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
 Carl van Schaik <quic_cvanscha@quicinc.com>,
 Philip Derrin <quic_pderrin@quicinc.com>,
 Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
 Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Fuad Tabba
 <tabba@google.com>, Sean Christopherson <seanjc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
References: <20240222-gunyah-v17-0-1e9da6763d38@quicinc.com>
 <20240222-gunyah-v17-19-1e9da6763d38@quicinc.com>
 <ZdhEtH7xzbzdhS2j@infradead.org>
 <20240223071006483-0800.eberman@hu-eberman-lv.qualcomm.com>
 <Zdxwo0abvklfam-Z@infradead.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Zdxwo0abvklfam-Z@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.02.24 12:06, Christoph Hellwig wrote:
> The point is that we can't we just allow modules to unmap data from
> the kernel mapping, no matter how noble your intentions are.

I absolutely agree.

-- 
Cheers,

David / dhildenb

