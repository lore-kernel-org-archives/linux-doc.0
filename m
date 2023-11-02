Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67061D523
	for <linux-doc@vger.kernel.org>; Thu,  2 Nov 2023 15:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="HnPsTwnd"
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9748E13E
	for <linux-doc@vger.kernel.org>; Thu,  2 Nov 2023 08:50:43 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-41cd4446cf5so5455331cf.3
        for <linux-doc@vger.kernel.org>; Thu, 02 Nov 2023 08:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1698940242; x=1699545042; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1wB7K/cyK7ekdFksdqw2ZnrHbBqOSSiCpIC9jyTtwpo=;
        b=HnPsTwndmznOfFuVOWXHx8ct/WrvBsPK5x/xLIx5VeUKtyb62e+cXmBq3CiPuVdLjN
         a2jpmZFUz/l+eCljwhEANCYRD36X2YtOA10ZRrpxipMD5rta6iiEh1nPAeg6557YEGDf
         7IW5o8OhO/mIuevLjUaz7bfhXTP+ej6/fn2pWFSvuBpwP1QOojfV0G0fD3d01PJUdPUV
         LvRGJHkEoo+Lnw53MAhNEYaxQxi/3pb3Ar78Q0ZstWFEzAEqDQVawsWQS2r42rT2mexC
         PDQUPO4R2WSiFFVWcUrxTKxLuDEQGuKt8Z2hTAggmQlUvTBWKuAqT1PWYEU51+5iiT1b
         MYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698940242; x=1699545042;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wB7K/cyK7ekdFksdqw2ZnrHbBqOSSiCpIC9jyTtwpo=;
        b=dNMKnmTeQh0tKuFoX2GpJAXunxLAMidVh33CoEoht7syRfrArF7bxlb1J0GxjJ78DL
         9YYYa/59OPQbpysYs5tidhmNQ21YvhJxfHZwsys5i+kNz7y0q3wFAL1wTdw5f4ehJD5J
         znaJjxRRCIxYBUb1RNubP8s7/vKAS/U0bKnFwDy9i1H2DncPx82Na3CG4yjkj5NcyXFm
         mtEnbU/0NUIkjhu1BIEGrzxJ15il+8pgMgT4F2214SsE1Y9Hwg129oS6SK5tP/Wq5rtR
         TnKVrvEydwYsvYJ5GGyG5mRT5F2RKozZlSUcaZ1/a0PZjXsoRl3+qb+lzr4uGBI2E+hA
         I7ZA==
X-Gm-Message-State: AOJu0YxzL0zujF8mGIR/i0xvFjcuRlPAHpjo3qt4Wy/uvVA0w3IEFE8D
	jMxakVN+oL7B47bB7ZylpuHZI8EV8QEzvPkg3W/30A==
X-Google-Smtp-Source: AGHT+IGeKyqz4S48dOlmrzV0IcLt/Pz5O88FAxRlS/vj9uMFuB0NwFTsg8gf0j3/eylhtue3lIsgsrkZbl6P7Iv8sPE=
X-Received: by 2002:ac8:5f06:0:b0:418:797:20b6 with SMTP id
 x6-20020ac85f06000000b00418079720b6mr19045388qta.5.1698940242486; Thu, 02 Nov
 2023 08:50:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231101230816.1459373-1-souravpanda@google.com>
 <20231101230816.1459373-2-souravpanda@google.com> <CAAPL-u_enAt7f9XUpwYNKkCOxz2uPbMrnE2RsoDFRcKwZdnRFQ@mail.gmail.com>
 <CA+CK2bC3rSGOoT9p_VmWMT8PBWYbp7Jo7Tp2FffGrJp-hX9xCg@mail.gmail.com>
 <CAAPL-u-4D5YKuVOsyfpDUR+PbaA3MOJmNtznS77bposQSNPjnA@mail.gmail.com> <1e99ff39-b1cf-48b8-8b6d-ba5391e00db5@redhat.com>
In-Reply-To: <1e99ff39-b1cf-48b8-8b6d-ba5391e00db5@redhat.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 2 Nov 2023 11:50:05 -0400
Message-ID: <CA+CK2bDo6an35R8Nu-d99pbNQMEAw_t0yUm0Q+mJNwOJ1EdqQg@mail.gmail.com>
Subject: Re: [PATCH v5 1/1] mm: report per-page metadata information
To: David Hildenbrand <david@redhat.com>
Cc: Wei Xu <weixugc@google.com>, Sourav Panda <souravpanda@google.com>, corbet@lwn.net, 
	gregkh@linuxfoundation.org, rafael@kernel.org, akpm@linux-foundation.org, 
	mike.kravetz@oracle.com, muchun.song@linux.dev, rppt@kernel.org, 
	rdunlap@infradead.org, chenlinxuan@uniontech.com, yang.yang29@zte.com.cn, 
	tomas.mudrunka@gmail.com, bhelgaas@google.com, ivan@cloudflare.com, 
	yosryahmed@google.com, hannes@cmpxchg.org, shakeelb@google.com, 
	kirill.shutemov@linux.intel.com, wangkefeng.wang@huawei.com, 
	adobriyan@gmail.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	surenb@google.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	willy@infradead.org, Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"

> > Adding reserved memory to MemTotal is a cleaner approach IMO as well.
> > But it changes the semantics of MemTotal, which may have compatibility
> > issues.
>
> I object.

Could you please elaborate what you object (and why): you object that
it will have compatibility issues, or  you object to include memblock
reserves into MemTotal?

Thanks,
Pasha
