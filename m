Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24AB631
	for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 00:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718151944; cv=none; b=BbSrSNN/XzVFt+sIgjsEIqFKCET34CG5K+6l+LlIZnaHfL6JA+cXvDWiy9jLevDM3I+v/rOCuzkK6fpcQ/cCshG367lFZCjr2uuyORQJwjmQdjjIYBUBKWK28GIgrVwxmTUriIdNOFyDkpRzK2SlEcD8NUKSYTYwFXYbTu61wDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718151944; c=relaxed/simple;
	bh=z/2yRwkdCljaoKOGpO1d2golTaGcCNFoMOn1+YpkLfE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RwlCyco3h2h/f4x/Bm9MLY5qYRYXPUhowJuPgAMdFTmAIURW2SWvsg5+JMRpFZurUBazEJFRIbghT6YLhFaQpcY/4w5CSw4bUUSe4GEjt7wBwE75NVCIDzcYer2XSmRxl69/+T8/sQ5f2jvc8Mo0VPOY1ykMVYwSmwMkao3ZrPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i8X407/A; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i8X407/A"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f70ec6ff8bso71285ad.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 17:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718151941; x=1718756741; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Jx+dpbpF1izwf17SLEuAd5VzAXe6OlxL8ty7yz0tFc=;
        b=i8X407/A0YY/mdpWHqmmx/bhe9zB592ikYXDIffpV+sE/Q6AeHpRPLmLtRDwYTZlLd
         gjVDUfU9FRfoYMwf9Y6S660E1VSkp17kyFMxXlUyT5CWsSjDvSBKC+gy3KKS7if7aUV7
         N/8EFZFNp2VZxPL/ww1n0JUnK63kH2lgeRXcGfMVRJjnn+srcrnOgOKxc6DjNthwnjpp
         +KZt8JdcPumhoP36Yf8oK2XvfoO9dDKifYXhlzxMaGQfvw8gkM0bq2fPubzKwq3heqf3
         lh8VOWoKpzh9A9JhOhQcvfEp1seFLbn7C0IZXDSYxvvpIOZKWXTrTp3Z11dgr/hs++bR
         OS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718151941; x=1718756741;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Jx+dpbpF1izwf17SLEuAd5VzAXe6OlxL8ty7yz0tFc=;
        b=HjaktgDSvf8e+fY+IU7hrHw6EvB80xS+J87r5S82f0eP+AfZL9wA73Ds708N1ng4RO
         f9gbUxfpSe57PI/hWzEf2PBbMEgRMNTJUqJ3bAK/r1e7mPKUNOqCXYSG3Ii93+8JJEda
         DXTOukK+nsvtWs7FyGlAKOPwmMc3eO3/4xZdFVCGHPiuuVGWPhPeiD2sy7QDaeLDu6Ga
         G1XqvRWvM0jb+P/Sstt05LNt5aWKCpB468bAhBKdPWMDqtnByLhJDyFpLViDgGTkElgO
         24ytDZdBSNhlMBmm7fcu1lfZpXiC7NFhF8g8rKIsGt/lSbxW5OX/F1w5XkJvv64QkzjN
         Bsvw==
X-Forwarded-Encrypted: i=1; AJvYcCVm+suyFXVwdV+M1WIvgQxASV2o6hWGnqhDJybAZCleUQjFFue9KdTDOu/gOaiy1TPyRFu0nWhxT5nQ7YwcSToMQPTc0/N5yg6e
X-Gm-Message-State: AOJu0Ywn8Gd5phSQTVKX8cLhG+L0q/NI9sA8k93/9zhptxH9mm1xJnTa
	5HpjRhrt4HTw+FhXRIyb4o6Nn3dyUez+rc9ltsM1o24McXcBbD5pWC37VfiK5g==
X-Google-Smtp-Source: AGHT+IHlya7vwInxFDp0+EWhOLwMIyetA4gB6RV8l5p0Exjin5Bjm2songabBXlS19x4W+pEVmxc2Q==
X-Received: by 2002:a17:902:9048:b0:1f7:1c96:d2e8 with SMTP id d9443c01a7336-1f838ddb9fcmr1323935ad.10.1718151940686;
        Tue, 11 Jun 2024 17:25:40 -0700 (PDT)
Received: from [2620:0:1008:15:290:7df3:2a02:3982] ([2620:0:1008:15:290:7df3:2a02:3982])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70595da2deesm4287777b3a.159.2024.06.11.17.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 17:25:39 -0700 (PDT)
Date: Tue, 11 Jun 2024 17:25:38 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Jiaqi Yan <jiaqiyan@google.com>
cc: nao.horiguchi@gmail.com, linmiaohe@huawei.com, jane.chu@oracle.com, 
    muchun.song@linux.dev, akpm@linux-foundation.org, shuah@kernel.org, 
    corbet@lwn.net, osalvador@suse.de, duenwen@google.com, fvdl@google.com, 
    linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
    linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] docs: mm: add enable_soft_offline sysctl
In-Reply-To: <20240611215544.2105970-4-jiaqiyan@google.com>
Message-ID: <9461874d-e2d6-25fc-813c-9c9bb0ad1aec@google.com>
References: <20240611215544.2105970-1-jiaqiyan@google.com> <20240611215544.2105970-4-jiaqiyan@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 Jun 2024, Jiaqi Yan wrote:

> @@ -267,6 +268,20 @@ used::
>  These are informational only.  They do not mean that anything is wrong
>  with your system.  To disable them, echo 4 (bit 2) into drop_caches.
>  
> +enable_soft_offline
> +===================
> +Control whether to soft offline memory pages that have (excessive) correctable
> +memory errors.  It is your call to choose between reliability (stay away from
> +fragile physical memory) vs performance (brought by HugeTLB or transparent
> +hugepages).
> +

Could you expand upon the relevance of HugeTLB or THP in this 
documentation?  I understand the need in some cases to soft offline memory 
after a number of correctable memory errors, but it's not clear how the 
performance implications plays into this.  The paragraph below goes into a 
difference in the splitting behavior, are hugepage users the only ones 
that should be concerned with this?

> +When setting to 1, kernel attempts to soft offline the page when it thinks
> +needed.  For in-use page, page content will be migrated to a new page.  If
> +the oringinal hugepage is a HugeTLB hugepage, regardless of in-use or free,

s/oringinal/original/

> +it will be dissolved into raw pages, and the capacity of the HugeTLB pool
> +will reduce by 1.  If the original hugepage is a transparent hugepage, it
> +will be split into raw pages.  When setting to 0, kernel won't attempt to
> +soft offline the page.  Its default value is 1.
>  

This behavior is the same for all architectures?
