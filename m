Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1741CEADB
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 16:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760976346; cv=none; b=XoFM+J7pQQJe73AjY6zxDph5vUkwDiM7lHfQorThzGyNIE1W+PqBR5oS60lkUAEQFLlvBP9GWqUM5byzJKX6JT56WdZxIjQvTcvltiVP9xGVh9PDURr24adjKtrVWOBQVP39DJk+arV4ybhmum4bHg1FO1FcQPnObW7rNSNLt54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760976346; c=relaxed/simple;
	bh=qMbp2Diy4U8QOB57q1OG406eTNxLv51sA/JgZoIVxkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bUHP3H1LphKDjC/5Mm489gE0QS2Z6eh3YBKKVDPNQsTpO4f3RYcxDafSJ3D0CrQ4oLodSA8wA4kI/nbvzs40mbEl+G7c80BOxJvBgJUM4P8THM6gup4FdLE1PPnYT/FFiqnlyICBPWNJBRG5rbNQCldGbwQ+c84LvFoN5vS5BRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=rkXE2R7r; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="rkXE2R7r"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-87c148fb575so72436916d6.2
        for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 09:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1760976344; x=1761581144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p4JsBaddaRYoEAs4W8WEBwtA+SYjh8zLzD82hzn+tek=;
        b=rkXE2R7rkqoNJUK+RD7jTuveO/WEnn0dBcwX09GQ2jAij4DUWkcOnWtDVXIp0W4y58
         BqloU8n6CKIVXDV3QUIj0SfEseW55YYjMsh292rJXI90CuOmCy94MukGbAIlO1kCkZh0
         bOf+Pv0Bz2whfhwSd5owJcyE6+vQUxQoRXCpnBsjKveiqu38AoVKyaWIvFtBYaMJRC81
         vkU+VV79cX4hMEsEvb6IPHZDeFMeA64NPj37NWDp88bpjsA5h0/cJmpcFonC+6IGLPAN
         wDiLQyvZJfSs1X2cDc0EAFQZ5pdIJavaLa7quYmWzoOOCGNEQFAFmhc7/badG5dKn6Ka
         EPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760976344; x=1761581144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4JsBaddaRYoEAs4W8WEBwtA+SYjh8zLzD82hzn+tek=;
        b=Ggr3EPuZwz1+d7DnaR/Bk+Z7MYZMOOtJQpiOWUcTmubw9m4c4BY5oFfenz/jl8PwE9
         HbvuY64z6dlQ0YHtes0DY71VYZdtHVCDFmEivjZa+8yHSDQAcEEGRKV67QPcxP8XmH2+
         WvG3cz+x716vR+d0igPMxL6NSn/Qq4NPPXykRRxqImpAqMK11tWHWgx4PSI/Qp4pFYpH
         MqpJX2Efj56LIEm9vuK+WwSgCTGAM6Mm9+jrumr/kSEnumggQ42ju10DjR64Y8r2xWp6
         XvmQzbTv7kQJq1zNvz/5MDtr2LxfZet734mvT+ZnfEhuSNZ9qHDbXBrtUwSYHhwEKuBw
         nU8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjVrS8pgF6S1kZVSCXK1Xa5m1/YVHLsfbYkoBw/VroulrjNbD/0SqMSuRXya1aV4VFA70+EKxdOx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjftEazs1tFXZ36UagryXMFpvQEZ2670Hy38c2ZxW/UdB+osRg
	pbmxXzfzMKKJnEc5czFRNm0E8MWIvRa4Vq5UHT4df74imV0fXCC8lOG1lvvP8rFd8sw=
X-Gm-Gg: ASbGncvIbr1iUmdH4+1Xv8Ib1GT7zokP8wzWk9xoY/l4owUYaOZg0cKq/5TFHoFs1zM
	8VYDSkUUBjYEQwy2Y0WoHKh8Yxr+aaq5DuSJOSWCkpSOxAt/waQa+lu4+Ui0Vl8DZVaisyp++jl
	iy4OquyC0FF5BL5AtmWkZtINNXUjLcrzT2oMtQrWVCwwEUXOsDzcWUlMwNFeElu4023U1Y2VYaD
	4Wx+0QBeZsbfXShb3n6ZW+IKIsX4U76acMNsZKqKNPTa90wGRQrEZQ9Et5qhzO2zqs51w3DtxOQ
	G/NhKqqR5UN3l+y6/2ofJhJs7S0GJnV2756P/6qR2VrfNRx0thD82EVbUfjhzxNfkrnxChyN/2Y
	Bh+8aDHfNH7yYRTdfAInRcmV73pmRdo4Vhlp2CX9OyVTo8SmtJvQid14jlx/0Z3txrxnN2mik2e
	39/E5n7P7F6hm5AuRl6v+q3Si8am54hjGvtN7Tu6k/Tk9Skv27/PKjeyBLFP0=
X-Google-Smtp-Source: AGHT+IFO0Fmmp1MECEFi2jzErsOgbxowWqJ/ySBor/huje/sLrMYVoPz/DTL50HIV6LVQv5D46sXow==
X-Received: by 2002:a05:6214:230c:b0:87d:e2b:cdf7 with SMTP id 6a1803df08f44-87d0e2bd165mr123924826d6.66.1760976343811;
        Mon, 20 Oct 2025 09:05:43 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87cf521be67sm53378076d6.16.2025.10.20.09.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:05:43 -0700 (PDT)
Date: Mon, 20 Oct 2025 12:05:41 -0400
From: Gregory Price <gourry@gourry.net>
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, osalvador@suse.de, corbet@lwn.net,
	muchun.song@linux.dev, akpm@linux-foundation.org,
	hannes@cmpxchg.org, laoar.shao@gmail.com, mclapinski@google.com,
	joel.granados@kernel.org, jack@suse.cz, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mel Gorman <mgorman@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	Alexandru Moise <00moses.alexander00@gmail.com>,
	David Rientjes <rientjes@google.com>
Subject: Re: [RFC PATCH] mm, hugetlb: implement movable_gigantic_pages sysctl
Message-ID: <aPZd1dAIzAw7Ii8E@gourry-fedora-PF4VCD3F>
References: <20251009161515.422292-1-gourry@gourry.net>
 <6fe3562d-49b2-4975-aa86-e139c535ad00@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fe3562d-49b2-4975-aa86-e139c535ad00@redhat.com>

On Mon, Oct 20, 2025 at 04:17:06PM +0200, David Hildenbrand wrote:
> On 09.10.25 18:15, Gregory Price wrote:
> That could be supported by allowing for moving hugetlb folios when their
> size is small enough to be served by the buddy, and the size we are
> allocating is larger than the one of these folios.
> 

I think this is roughly what you'd be looking for?
~Gregory

---

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 5549b32cdd31..5def2c53092e 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6922,8 +6922,12 @@ static bool pfn_range_valid_contig(struct zone *z, unsigned long start_pfn,
                if (PageReserved(page))
                        return false;

-               if (PageHuge(page))
-                       return false;
+               if (PageHuge(page)) {
+                       /* Don't consider moving same size/larger pages */
+                       if (!CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION ||
+                           ((1 << compound_order(page)) >= nr_pages))
+                               return false;
+               }
        }
        return true;
 }
