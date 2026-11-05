Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901355;
	b=iyXFO4fFcpC3AXKdasrvYnrikVZh47wGXDQdLQBKK8Pa++JRqOcUBl/iH6d9mNklELbh
	 rjm/9PjOnU1LF6tXG15oS/3B6L9acUmFwsdohVsZYVCRfiN3ie74/nSVmuoFAE1v2PNq1
	 eWUwhp8i1q2AhAUGCrY2nKwPH4dW45AmNJEKIn3yUoxg/93QLdRNoRAiIFFN01QyHyO9H
	 Y4RSpllMjvA/0svJ6pMXtIeO0BF5fh2WBF7IZSPVlDbP361330pJ6J8vFTdIv700LjM2F
	 LYSGTv51QCpdLN8Vxerd07ytF2lX5DqxhEp6O0kWV2ZiiA7ST6Rm8hYbLrh5+icvXYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PT8+knV5liWy29BtrumvMiHIoxRWXb5eMMdqevncVAE=;
	b=qssNl9GkGkVNSk1aDD4dptFJASLb5AZnditNKgMp+lcli1vRF0qRBubKei+CsdINvwcW
	 QtAbU5aKoE72KA4SOfio9h+wPnhOjZLDt9CkisQfA+pj43GguaJ2+6BVp0QRq5Ak1CbZk
	 r+F65zq0zBDapTMncDBVXGGvzH7RwS5UmLOotA2paLWuqfAQlGC4tvE3NMWrVIRfW7/yD
	 CSftixtLmTTnDLuJ4LD1+DHFnGOyACo0i9cgtUJC3+YiZ+dGEFnWF0n+YnYW1vFbl5r/K
	 9BWjaFfN3+PeKAup9Q42ekNagdczex0E82M6OcTn3GnBtzvGlKxjymD454VTgZs46Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gi5uigdr;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CCB606A329
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 17:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8CCB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gi5uigdr
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-35adc681e1aso2719557eec.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 09:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793901354; x=1794506154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PT8+knV5liWy29BtrumvMiHIoxRWXb5eMMdqevncVAE=;
        b=Gi5uigdrYHN5rA77ayiD0aV/+kPtnwiZq2VcYinUAKrMWWhGMwvJ6ckGfGqs7dqoVZ
         MAT3/y0LALIyPtT+pg52bJpy5nsZWY8qLzhr07n9YhDsldJWyg0P3rjaNjZCc9ntZXKp
         34qXrp713xEK2H8v9TuNgqRXM7yDR/D96VFWca1T7zJG2qMPy39TUHfTmv0XoiM9c1U9
         CtFy4S3TEYUOUcjK3kwOTfiTW4C3iuJgStNLb53U3kvm/1muJi1picQ9Vh+pUU03akr6
         HtSDoYxKdM2TYf9Ar95rPWT93gStbVqFrdPX9Z0a9aj6WJxEqzmbkdbqjkFBiQE9KpoH
         qyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901354; x=1794506154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PT8+knV5liWy29BtrumvMiHIoxRWXb5eMMdqevncVAE=;
        b=pr5dvmHTtvKDs18kzjgJTzadSGKsG6JsquawQk/cEMv7UllhMv5GmB2o198uH/YkbB
         rWmPmM0qzoHRXMAGlc2pVsh2Jie3kgVUSy6D6bfJNf06nq7x4pwLKZO1HA/EjZW7XY0E
         jwNI3+IztncklPeO8CjGesxQDJJO1bG2Pc3iEY45ud7Q3dgA/q3EMOboW39V+jC6zhbP
         iK0qXk/fLjDrrGr5f6J2JGaszn+R7h1npaII9eo3WNe4eiBF72RHr9JxtXTeeWTyGcf/
         l2ICmzl+RhFxCHORZrQp1XKKqAGoJHtJq0Xsk9yyomhZB04c4XIQuJ/Gi5p2UuX6f9Fp
         uPAA==
X-Forwarded-Encrypted: i=1; AKwUvBwMVUhOMovkWmdf+5W1d1mgH2PkXjsgUIWIE3Vlk38NnzxR8M5JJ2fmiQk7B3ZGpZtKgk7CxHFDbcg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Nk8TixfOsvP1FeSp3DcVBSsAzlJb3+P1LRsF7u/v3pZxgKTOR
	92d87dYWCDQi8O8n4vnjoOk5ROvttt8pb8KMHw1ThBxne7WPqKZ9XVWT
X-Gm-Gg: AYBFou3DFn37KOzU7gB029O7aLuPVk7DNfZL97DGd4srBPqplY0kAFDi3RD+WuqxXcT
	XD1YwY886nn9Dohw1GkpWh2V84biIuX1Md+R3K8wdk3GuBuawTLfQ1+h4JGgD9Uu7N2xYBLlZf2
	DWJyyD2O9/mU0K5z2K9GYlUtuco+Uleek53Cq70b7dXN3FTKafqzITM+WbTjIWZPYAKaoWycI7D
	YsP8x2Gz4sQ6rOSwVOGZVGOjJD0P/oYkTlKTSERgZ1xdLTfKhmItZXJufDwSToPZ1AA21FuMLXZ
	l0oeIP0z1GaNlc/ZL/RUMQDE8Bjifaohydsn5SalbpLThEv1TQE+0s9N02bveRfj0NXl4NRIMjY
	hd26bdPalmOxr9z/hRme7avmw1bNu9FEn6CPfpEU8WV3dAtI64RB3zEzucjtXVW4VBq+j9jQzmn
	KZZHbI1Ii7wNmOv0CC1tQoCNaZZcX+xd5YcI9VrDK9F25wUrBlOq2svTfKojK+mP2cypMkAT42r
	NZyoH37Ldfjcjf5451xtI4dIr7vJkz7fJYCpU8f4o5f8LfmnoBMNpzlBKdn5Mrnm3nari420V5J
	6T0XZzgYk4VQHMoy86mwaw==
X-Received: by 2002:a05:7022:258a:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1ac55f2d3cemr35929255c88.1.1793901353699;
        Thu, 05 Nov 2026 09:55:53 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6a::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25100667esm9741999c88.19.2026.11.05.09.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:55:53 -0800 (PST)
Date: Thu, 5 Nov 2026 09:50:21 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, edumazet@kernel.org, 
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com, sdf@fomichev.me, 
	almasrymina@google.com, bobbyeshleman@meta.com, asml.silence@gmail.com, 
	razor@blackwall.org, daniel@iogearbox.net, leitao@debian.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 7/7] selftests: drv-net: devmem: TX from a
 hugepage-backed dmabuf
Message-ID: <auzBkdVHfk33JlF4@devvm16445.scu0.facebook.com>
References: <20261103235152.1904727-1-sdf@fomichev.me>
 <20261103235152.1904727-8-sdf@fomichev.me>
 <51381a84-de40-4d4f-982d-9585a2344119@nvidia.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <51381a84-de40-4d4f-982d-9585a2344119@nvidia.com>

On 11/04, Dragos Tatulea wrote:
> On 04.11.26 00:51, Stanislav Fomichev wrote:
> > TX net_iovs are now sized from the dmabuf layout, but the TX tests
> > use a regular memfd, which usually keeps them small. Add -H to ncdevmem
> > to back the udmabuf with 2MB hugepages and a TX test which sends a 3MB
> > buffer from it, so that frags end at and continue past the 2MB net_iov
> > boundary. The payload has a 7 byte period to catch offset errors.
> >
> Why not add a test with a BIG TCP GSO test as well?

I hope we eventually will have all this tested on NIPA with a "perfect"
config. Here I did not do big tcp because I wanted apples to apples.

 
> Nice improvement btw. FWIW for the series:
> Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>

Ty for the review!
