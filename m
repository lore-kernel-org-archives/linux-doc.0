Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A685D3002D4
	for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 14:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761403966; cv=none; b=ONZNCS4B9UTn23juqak8uS4CzwcJnEMY7hs8DTsecn185XgC6DbT+RYtn88DlIVFS1RYqEf84vHutgfzO4Z0hraKlW+eguvfRlrBWmNF88TLpizoq/XAO1pmZz/IwqbavYi8nwOtRq6a2ZFrky27tSRKx9qsGSRky0KN9iBvqXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761403966; c=relaxed/simple;
	bh=rxkH9HqQp8MJpuSr9SUPPrL1eIBYUI8t2HD6mPry1gY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMmw42nATheQSRnwRV6nkq2DXgSNZEqtsHTRvP+ZJEadKm7wbxrwXSHz+GsjD2OrY/SSGEyyjux2IgI7zCPSOwxjXlqPp4FLp3dPOtl36gv0AyH6v0oEnSsbbKxl2VPNejA/b6IQ40YPwGn5rblvwDOrvCwoa+5cfJzthBjmO9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=KEA7ztmA; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="KEA7ztmA"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-63b9da57cecso4933362a12.0
        for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 07:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1761403963; x=1762008763; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rxkH9HqQp8MJpuSr9SUPPrL1eIBYUI8t2HD6mPry1gY=;
        b=KEA7ztmARobV9Yc1iR7ecvxjk8qwLXPA3I+hGYCCySYVsd3ZaoRYuccAJxJpcCNajz
         0DOML/K0LK3WKvi+qHMgK537S65pXnEzW/+aLRSw+yxO/cKfBkQH68q+P1PoUUqWfuSh
         X9s/01f2ISuSzjDFLwIsc3nCfwlfCfk2G2uKcoy1+ULfEPg1p2G30G8VYOWeOL9lxBvm
         OZmkNaRZfvgFuoJ5PJtl0i5eUanKw72UqXbFaUxSWNRGWTc/yzroeoXgJdq3JBjigQnb
         E99bTcXDtLZ4iyAkldlynod/4Ww+uW8Zuh1e9dRTDnBCgEc9zh+vi4xUonXmLkhGt8rZ
         njcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761403963; x=1762008763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rxkH9HqQp8MJpuSr9SUPPrL1eIBYUI8t2HD6mPry1gY=;
        b=hzIr3CSVN9RZI7kQHcF4xFhEHVjtlRzmaAx0ARJApRTKUiINx7PoSKFWjrg+Gsqh44
         P9if3OqHUnSRBP6No4Hx3GPHid4HrC+kETW7QVNt6OgNwCa410jsre9Z8WjeYBYRZWdS
         tUHKbFXK62YKhXhpScMHW0ISzIwRBJArQpCYfpJRXL9bl3NFeOOLIkRvzClQgY0A6BTF
         68GmIm2sva3hU9S/bdhz4zfUAEVtAb+08gQxLDSzOyTkKNSTTeGx6KJPaLrU9BFC/AW7
         6LNU6fqZp54b0K2phvoZzVY1vh74KBd6mzRXseLFzKYAZEmuODxmdlZj1x684QoFKXpS
         CQ/g==
X-Forwarded-Encrypted: i=1; AJvYcCXzwa01t16UaE/OYlsxFqxo0SqxOA3tG8+8HZBdxQ7/KrTZIQWrhn3rx67MD0zYdqouRQmdYbLWhkU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbn6MvGh2ySt4m4xYgSIw/XJIOJC3erBBDgSTSYdR50cbfKvl0
	xYJEwS9u26CdBxq970XSvaDkPNUDuhFpvA4/P/NCbAtPoQad4nPVVDDvCSbfZkzT0Q2yxoP4Vxn
	rFrTmumtfWyT6kBUOQOMxH5VlKCBgYxuaPVxcINPWPg==
X-Gm-Gg: ASbGncvhA4ciIKXHWjQtlgfOVtTG7KNG423nKeDEAVBx+yynSU8w+IjAi+S6Cth3YMg
	hWg7eo91WfYi542tA1fPz8JgD1bp1HH7gyd17HR+M2DZwNoG4zSUgfwL8+D3s2e9rVeWB17A79O
	bYj2vt9ZEW6tbg6pyZ/8i0toGU+kRyxRqYl6PfK5Og7i6BGJNAcAwxCrt/U9mLVAQDk3mKmzyrO
	6cJ8JkyQs0yu/NvxbYBid2FQuDMvYoiGNoWIOKou4qpcSpLr/4B8LWsGpey9bx8Gs4FJw2yLtDZ
	luoNAJxLXZZ+ZGd/FiU5ZlYW4ohd
X-Google-Smtp-Source: AGHT+IEEmtC5AP/1Gyl7o28TLb62A6fjQmpgJI/nFlghPy3b8TZfgzFAjEpwZUdPvlcd5pyK5S+BLKOml0q59+GzhB4=
X-Received: by 2002:a05:6402:13ca:b0:637:f07d:e80f with SMTP id
 4fb4d7f45d1cf-63c1f58c0d3mr30957969a12.0.1761403962844; Sat, 25 Oct 2025
 07:52:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
In-Reply-To: <0-v7-ab019a8791e2+175b8-iommu_pt_jgg@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 25 Oct 2025 10:52:07 -0400
X-Gm-Features: AWmQ_bllNz8YycDjixpyqg8hZuOQcw77RRZ1nqOvRZhBjS1lHQKHtPcetSr4uhE
Message-ID: <CA+CK2bBvCytQhJ-DbgBDUo-MT0xtuXNW=yzX3StwaNUj=JfnoQ@mail.gmail.com>
Subject: Re: [PATCH v7 00/15] Consolidate iommu page table implementations (AMD)
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>, iommu@lists.linux.dev, 
	Joerg Roedel <joro@8bytes.org>, Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, Bill Wendling <morbo@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Will Deacon <will@kernel.org>, 
	Alexey Kardashevskiy <aik@amd.com>, Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, 
	James Gowans <jgowans@amazon.com>, Kevin Tian <kevin.tian@intel.com>, 
	Michael Roth <michael.roth@amd.com>, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

>
> Cc: Michael Roth <michael.roth@amd.com>
> Cc: Alexey Kardashevskiy <aik@amd.com>
> Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
> Cc: James Gowans <jgowans@amazon.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

I tested this series via iova_stress [1], on Intel, AMD, and ARM
machines, no regressions were detected.
Tested-by: Pasha Tatashin <pasha.tatashin@soleen.com>

[1] https://github.com/soleen/iova_stress
