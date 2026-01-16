Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D0A3195E8
	for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 09:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554538; cv=pass; b=n492Ff26PQ6ehWkW/wpgr0ChQ00hJX6von1aWsEy94U+Xqby4ssrPBKTg0amphNFXkYGDcNSeBkbo9RCtq9NZ0c4rsL1n48mvOHlvRVYjS9tkUt6yhr+1qnWcsj635CJ+9kZ9BPsOchthhg8V4pdmVinzdDOjTa9+huZ4D45TjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554538; c=relaxed/simple;
	bh=uV5ai8+6EC+pJzLYQZ3fFgNGH9Y3bcfVxId6H0sX3yk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rzm++f3sVGglxFBD/rO3tuhZzhTtHOcxq/8BINquggX8hOyNLSGxAEHaKw0DbK2i/iEijpV57wmSItu/XcxkZocWlsy9NZsYnHJBsU4UTcq8RA43DWbp2jo2TJxOvR0ATTFbrBTC6UNvW+EtsgUyf2rhTFpwRbNA4vHrHiDrFAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U45VTv8A; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U45VTv8A"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50299648ae9so307011cf.1
        for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 01:08:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768554535; cv=none;
        d=google.com; s=arc-20240605;
        b=RM3dxPfr21vg1MfM40JtYC4Tr8KMl5hRL9uo4LxDwPUCbqGVjEStM1tZd5wMr8CM8t
         yfq1C6XOpW4rYtw3YGgUMU0A27JHxtmJbivbiLoo/0HLYfT5olGQ4QT5oSPjk0KWBank
         gl1mbnCuKPY0xlsyts/6Fk6tq0Vc17j74N7yw/Wmr1p3p2uMS3tnMjjIlM1bGrxlR1e9
         PgfzyLmPPTXLcOpy+c/F1f60hg+NQLD/K5SVsSH/NVfqeHm81XhzvCd2xCMIZBa9xUjV
         wJeRlZjsIMUTKtT8Cl4fzGmwXbHNoVgk+xCLu2D9fxq5MTFWnFqUnjJIf94n3/OElv1O
         s7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RcimFNxoQuk1GUtLKJNj8zegx2jcra7sXFZBTJ6wuhQ=;
        fh=WwfgSuWFyvBX2UyFBsuYyZQDMS+FjlfUju5jCX9pKEk=;
        b=PlT0UU2fFPfuEhBfHxVB84l10R6gCAFoB756EbnKfglXFbCm3vFwuxpZ9KdoMW4TSo
         UvtFRr/8bNE2Ox5aEbN5pwU6KuCfqktuNUJ+OBQ0DYvfB/LNKU7wOKjW9snrcdeFt2qI
         jU5w3fdP8L3E7iwWn5UvtV1XiOXwmse6a19r7e+xlWYjGssBAgjl4DsZd4Kk8OQ4X4l9
         wF657zl1BJ9mUAVpoKH/2L1a0k9xobDtHTQ87/HRPFtdLmKEJz1xcNKHnRkwD56pZ5Nv
         Bj/vqWtfyU/6ewcbrzU3fixGTJTepJ/pMMjH5bY4qAOckwg2XYmXWma0RtwqFueCOb2Y
         305g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768554535; x=1769159335; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcimFNxoQuk1GUtLKJNj8zegx2jcra7sXFZBTJ6wuhQ=;
        b=U45VTv8AolTC3SpMQt7LCI9QsipTbjfX+AMZetLumuOl0x1JMlbSSuP0Dix9OgvLru
         z1d2NgEKZPrpK+4zlYnpPqwUjNb4E81wGKPu0L5QswKiChfG+NBirvbuX8+iZ8H61vOR
         NedLJcQ/byEjzeey+GvgDpHOL/KsZvekAvQNrYTaSZwpSIA7ApCTso5P0piJOeYtkx5Q
         NK3idMDleEs2aOeUwNIWYoqVQQG1I/sZ25HnrPyddcC4HfZGu6TAWFA8RtuMUzRjyQO1
         NNmYPKBTlTyj3/S+3OYflJiV24LkxVBBib+PyLUjjLtVogeFkGvKfdDNCxkTPXpmncbR
         sy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768554535; x=1769159335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RcimFNxoQuk1GUtLKJNj8zegx2jcra7sXFZBTJ6wuhQ=;
        b=fg3zC6MzIu2+VQNdvQzh7oTHPrc8gLZNnqPiYhf3p13QpRV13FGi1Iix376fBcdmQC
         bviCd7e3pevQn6/cwLjCjUe64tNHmJ8JUa04UX9hEviczUzLMCQd50TZk88Ai4PVeo51
         wxJNL6fYPPOw5hqZyJUpK0anGgKqLid+aHf5zUrL/pDCWph5J0d4ugVXnA+O+VCSrO+I
         U7zpl0cNkaONaq61zHesHJ6cBmbzelbk+38HzVYiOL6qdsdX09BOkJrkYCE1YMP4YRru
         4zFH+g+Ad8/85IVn06tQdoLIMYqUACEWe2wezWoAWLKDWFMc1ruwnYR5MLigVVOpWB63
         GScw==
X-Forwarded-Encrypted: i=1; AJvYcCWwSJouBQG/8Jq+OMXDPYIiBRmDVnnfpARQ6LMQyIYfT2lEHasPVjJIX/rTmHIAuTZCvFbAu8dxylk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQVNzHzpmVlzLSlvtbXBSZ9sm3IkE7R4Tw7YlVEozkzh/BbXog
	IDIN8ngORUA8jTt0MGBQPt779p03Qgp4uIvjDN2I/0RJfeX/XsJPLHRbci4dmDz4Z6Bi0dHOmo2
	wtlePR2EoFVRXGrOR4UkWQVgKN9PiwLs4AXWa27c1bB2Oy+avRuj1dxw9
X-Gm-Gg: AY/fxX603DYoGB3k5GOA7fL1n9ppFGAMhIIiC1jZ/zMP8KlV1SSIwMERCClpRe0JiMA
	ORcasA5Z+hlQKDIJ1EiF3lelLy7ZhFJhPQURtaE90nhPElZk3NlMjnjUwlpxePB1cfjAhXI1IIj
	ehgyClGhGq558C+aWtceNgdK8T7rJEq6h3eUR+xmR2JLnCMu/6w3VnmlSd/UOedHXSqkvYFI8Jz
	CfLMLRWsIgUgOqecyHzGsRjuDl8CnuO+A5zYpqKE6F9/H5O0TnWFnFv0qgQHQFNstROH7M=
X-Received: by 2002:a05:622a:1aa0:b0:501:3b94:bcae with SMTP id
 d75a77b69052e-502a2386e05mr553561cf.8.1768554534866; Fri, 16 Jan 2026
 01:08:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114164322.787125-1-smostafa@google.com> <f3ab0156-3d7c-470d-9c1e-922195ea27af@linux.intel.com>
In-Reply-To: <f3ab0156-3d7c-470d-9c1e-922195ea27af@linux.intel.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Fri, 16 Jan 2026 09:08:42 +0000
X-Gm-Features: AZwV_QiM8_AWnP4if6nM9uRrMx7z-1pq157-8TMrLaAscPdc1UVyRJ2GSwTSnA8
Message-ID: <CAFgf54rVPaUgbouXWQkczCyFQvXkrei_x6FYY6n1X5NkSSwYfA@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] iommu: Add page_ext for IOMMU_DEBUG_PAGEALLOC
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, akpm@linux-foundation.org, vbabka@suse.cz, 
	surenb@google.com, mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org, 
	ziy@nvidia.com, david@redhat.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, rppt@kernel.org, xiaqinxin@huawei.com, 
	rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry I was travelling all day yesterday. I see Jorg hasn't done the
pull request yet, so I was hoping we can still change it.
But I can send the fix separately also.

Thanks,
Mostafa



On Thu, Jan 15, 2026 at 6:15=E2=80=AFAM Baolu Lu <baolu.lu@linux.intel.com>=
 wrote:
>
> On 1/15/26 00:43, Mostafa Saleh wrote:
> > Changes in v7:
> > v6:https://lore.kernel.org/linux-iommu/20260109171805.901995-1-
> > smostafa@google.com/
> > - Add a new function page_ext_get_phys() and use it instead of
> >    pfn_valid() + phys_to_page().
> > - Drop R-bs on patch 4.
>
> This series has been applied. If you have any further fixups, it's
> better to submit them as follow-up patches.
>
> Thanks,
> baolu
