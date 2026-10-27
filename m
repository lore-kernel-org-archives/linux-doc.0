Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095400;
	b=DJlEf3RJqPqr6hXy3BI4WMvbFx3cOUtvKUv4tOXDvKxFCSOG1b8lDGKi2A74xKPaflj1
	 GSiqIZIneOTIDchZ5OZ8Fv/8AQ9gdOZ/yWij4p7AS0Eu906aF+jS/yeRJakz2YQBv3HD3
	 Td5Mec9rbmVa7hBptdSEv3qYV+r+T4IZqXSK72DL7zIEy/XjgL9mtZt0wgYTGSRJjQsCP
	 Qx9olMV+i/HY201YCeKmP8b3k/9UxJPzWUKQ8qs0oOiKMqu9vkonVJgig3OTE1iABu2hv
	 X9JRvcp7XBFMiT513J4wUVlrIeAi7JljjChFWMmiQWSaNYGaFusYdYY2W9AtE9jAe0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=B/ZpDq3DjZV/62zmns9uwG24EjevmhON4QmJ/2QUaFc=;
	b=LndGf4IIuzhlyYy355lMXc8ibFNtwG1WWnM7iY8zm2uG9VpaVkN0iHnr1n18/y4I8xq1
	 elraiom+L6bnxh1HVTN5ZhcHKqoWdWoCE0Eiiv4AQtqudP9sYanjy+IaFWvo4YdH5AK11
	 qhdM9N7whfl4t2bnv/9idTxG+kzXcAPxpqlkrvXoXRXJXf13hW2P+/D7BQe8GSkikNLqv
	 xj957NqyfEVQuNZMZ15SfS46+dzueTnlq5DHdwqNncm9+LbmOusy4txuAFr0VH61iI3o3
	 /cSPE8OlbNgC/MFQ395jrf56aC/8wEk2rHQRXnlLbUSbWHE6eLqt2aXVy6L91qzFVtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A88606A31D
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 10:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71A88606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c423b145922so528124066b.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 03:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793095393; x=1793700193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B/ZpDq3DjZV/62zmns9uwG24EjevmhON4QmJ/2QUaFc=;
        b=EKwpsigzwDmZPRkvIpX1b4c0/rz7uhtPntV0JfCYEz0s3pcwkOGnsL5Nzc3IENmwos
         3sbhs5QgQhWDLpAOwIEmEB+wgVol0pjCngvClscZPLVgXpK6vwt6ozQLK9jHaqZpS7Wx
         UAwHaOAiTlSXV7JOhQYBkg+WaE7NJjWYx0Q2jkUKe51KAl6u7hwDCeM2xNigR7jQ+Esl
         2TD+6FVjssyPooQGV77/khcqAuzCs5MkcZsRcYmk+07Rxjllua9OU3dnOSkEIb4tDpCN
         GKiS0GgWXoNCU/s9g+GrCc6/QeqrtOgD8LLSneSwbAfEJ6r0lK+DJ5aWEsAXcsoc+VP0
         o0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793095393; x=1793700193;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B/ZpDq3DjZV/62zmns9uwG24EjevmhON4QmJ/2QUaFc=;
        b=y0W+vUupvt63Kq6OyLwUfrXWMgx3nEGNgp6kcBzRZ4cg64qSrrZLzraim5Bob1icgD
         dc19BcjrD+LxMef5PQ63v+HmRb1aexQOF6f/gXGZ/9ytSgmHQf0gIQRVUTU8sT07Ch6G
         pFg7pe3PuCT7IQPkC73hbuBxCoKap6d+kejKJFRwvPu1diio7tzkeiaX3pTBH3BTd5h2
         MNa/wypJukZ5FI1YVG2iqVZbLFlKawnyp1F7c+UwmlD3kOjcNukw2UaYpYgldJIIFLEw
         Bg2ocKgWzx7uGdVwExxaTl4UY9XYKsEnPerb86lNURDoh9tKxzfyWcz75UzNQMgazO1k
         7sGw==
X-Forwarded-Encrypted: i=1; AKwUvBzxYDqQW6fYMeN15lA0OU7HcMJrPpfXKyoMeOFpHiitNCAtdexdY/k9JIdJAKhY+AAkyOmbbyWIvjI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKN2gZTwOfXoSEv1fgScf+plDWf4EICxiGsB+Kv1bua0lABAWcr
	V+CkFoFUXzMHKdGGs/MnOJlzImWLvjSmI4zAclm8xGHH/Pw3lFSorkyheLdb1V4oeAo=
X-Gm-Gg: AYBFou3RbC3VSqtO8rUG6RuefP1XAeCAi19RxkvdUTQvv9AQLQmntGC5uhev4fGx07u
	bgnGUE5NUUGa4DPJg4n2rtAJleLeVlf5vI07W0Ku7K7BxjoWx/xzS0co+PdY74FQhhU7DULJNOE
	K/j9L7z8ggJgefrFNNLnuT0eLivdBZ0kJ06oWIPO3SwmKYmRxnAt3Jmc/sq2rEj4fS9RsY9s0hx
	9t/4k/VBV0U+JL4ejL5oLqItLMDEbsHpq/K/M91ECzYMp/PO0H3kpdC2BM4Xya41uk8A0Woyg+0
	gGr0Y6kxCGZAnaZxcRt9fht0XR38bHvRVUIeyhKX2Rv5dWWYPCW6OHTk/Kc1NeLD3Et4FBE7CVP
	ZV95LJnHV+ugar6kHzNlncPwrUadNusRRhTeKxYMaLjM5YKcrxF5fVzsIOFClEbeo5hSu0IovFx
	MjA6ml+puyKovKwT+WqXiCY8+Yoh6UTuVTGi/DdOWdeaaXBNNcaHiaJ98nw6cGzxK2FZ9K8h80Z
	LNkSpjXYkjO1Eg7+H2z6PNBh3tvyyBPtawsZvEf8kI5qNJs+1nZzsGLvVGN/LFG
X-Received: by 2002:a17:907:728f:b0:c3e:d18c:1d7d with SMTP id a640c23a62f3a-c46bddc42dcmr1033526666b.22.1793095392233;
        Tue, 27 Oct 2026 03:03:12 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd790afasm420098366b.68.2026.10.27.03.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:03:11 -0700 (PDT)
Date: Tue, 27 Oct 2026 11:03:07 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	jgg@ziepe.ca, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 18/20] tdx-guest: Expose the native attestation
 service API
Message-ID: <auB21VZhFg3sDcXz@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-19-jiri@resnulli.us>
 <179302367453.58760.3338436189030317197.b4-review@b4>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179302367453.58760.3338436189030317197.b4-review@b4>

Mon, Oct 26, 2026 at 03:07:54PM +0100, jgg@nvidia.com wrote:
>> Share TDREPORT, Quote and measurement-register operations with one
>> in-kernel client while preserving the existing misc, TSM report and TSM
>> MR interfaces. Tie clients to service initialization and removal.
>
>The tdx stuff should just be an attestation driver, we don't need to
>make these kinds of linkages..

Okay.
