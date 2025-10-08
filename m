Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9D32BE03C
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 16:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759941604; cv=none; b=u/08UE8SYZ72+SioO552FYbmOI5IzDt7f3160026LV5yIXCaoCWauYRZAdOFdhgavnCFYC7wgS9j1cCZvSXjiSitqBlsUIEvUq65/LHZhfmJvbGPQyVz8NAQoKtY5778QdP5MCmhuX+PWEj8h2ELqn17AUozVXifgEcmWE4AiZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759941604; c=relaxed/simple;
	bh=D0L8i7z7Lh2/6iCKxKlxYqBH7/JfzkEVyy+yW5sp+hA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzM+RolX11Hr3Fsl2BKp5W49f95G3nDvE00FOb3js1S60lxJkT3GUSy/OdJPFCw5/zE3D8TJWWdkM4ebMEpLmGwUaqAhX/E5cJ1SERKGqvmspFqatHGDRSEfPGs5RHpjHZtpB64JQVjZ0EB6glQ9YqDWGj2t2r3Dl1r9W67nc60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=q/Dh6NTd; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="q/Dh6NTd"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-862cbf9e0c0so3035685a.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 09:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1759941602; x=1760546402; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qokGyOQhDE9qT4JkWLoh//AKI3V2AMxtyx3IuSqkUsE=;
        b=q/Dh6NTdXPl8Y8JhqaJlQC6vx6Q5bF4sVg9DHmoaSKd/O5KcsSwJY62NVwPx8yd4A5
         7oI16W2U+XuQUsBgvmXYH7l/KFxQ2ViHjvsTMAR9s5NGug+AXMIy/MMtm/Bkjg2/FL4g
         236JwiZKYnDC7H0HyG5EwjRzORY01zhV5F3H2aw85qjtyz261AWhxsJch7EiYsJN8b4c
         I/oOqSTzGwPrsuYZZ+nnx3Jc3M81xqUJPfLbru9FKWpFZ3G1kNQyhoXozZ65g5QnJ9cl
         4dOVUmRN4TCAupushWG6Q6Wr5+RJjJWNntF4jMSlT59WmYPruH+prCU75/vwVDpjhqKS
         H94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759941602; x=1760546402;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qokGyOQhDE9qT4JkWLoh//AKI3V2AMxtyx3IuSqkUsE=;
        b=nguB3EDu84jW/plWn/djfHz5fIjRTn4jAutmRT3ReTPx69R7pMzGyDbGNw6fb0GK8f
         0W6LaAmLDJ5P5DKvF1LA+q1MLSBjMcNm7Epz09NRRUheyiTB5l3UQzJHbpIbipeLnv57
         9wujBwAbZuwRyay/l0GMGneJPZSTcyVOC+D57LVdeWvbdRrn9cwbELtM0SK9WvSBP4K/
         aPloXPZ0BiYH7+Y8zTEIENaQrksbxYMOuqJuuFHN+twaypvKJlJYY6VCQfTWgb1Xy3e5
         dmjWGTQfym5GD5Y+igACom5089arRIFfRvJ1oh3kuwEOd4+DHgWZHsagJwKW2RtBCUxL
         gNoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjKVfQGguCZjtqmUoc9GDQXeHQR5ujNrI1AH8cDChKLlAOEGSwa8zyulC7tFXiy0P0B1ZD72qglto=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFzfLiC/a3qV21edXirLv6xDOhw83qjQz5l2KZ2/0p7UdGMrFR
	5557oWstbHbSWmy8prVamheee/fwILzaS3aNbNLoi/4ef5uWbXRkqtGCGJdloMJbP50=
X-Gm-Gg: ASbGncuvVZqzWSw8tW+yANz86Zzo6kNeLUTSIWJqdS6WYmuAdfWZw9ebFum2ksTfCHi
	2qbz1OxemT8sTcCJyWwbjnoYN/TM1UcIaAspEplMjaW9ZsM62F5YlOfDr9//0flUSnd71n388qo
	s9S4GUPgkPnJF80eD5yYnZxluFE+0KwivDGhsrXL0dqCfwosMYoN4B0buXmPAnCiFzy7q68iIqj
	7ETgRdRt4dzEKJWWYSsOfmnZc7WPYwsIJcUByGZBGoQ8j6I0NgT3Zlmi0esrR5Dpi0+nlv+RIcO
	nw5XCLtNRNTLz230/qRqfoLLV82KCcg0O2Sa6WH7zY62RgZtw8RkTTNRZ2E4eQOTwl738E/Apjl
	FtNqxkFMDIBCMRzR3oQTuEGKVQIxKkE4yW1YHa+gYNTRvk/mEofNr6P9xkao/YcuQJVH+Rika4B
	3i5Dn/0cZuGwuzoAoGgc3flxueKg7Lw2OX+5TNGK4j
X-Google-Smtp-Source: AGHT+IEnjaSA0DLEcAz0iokulc3JVOgeDM2v5egdeJRtc3xhBAqOkFJ7eetlh7hu/Y5ZOJpn0osvnA==
X-Received: by 2002:a05:620a:28cc:b0:861:27a4:5bd3 with SMTP id af79cd13be357-88353b2a879mr647338285a.64.1759941601884;
        Wed, 08 Oct 2025 09:40:01 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-884a1ca39dasm18736285a.30.2025.10.08.09.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 09:40:01 -0700 (PDT)
Date: Wed, 8 Oct 2025 12:39:59 -0400
From: Gregory Price <gourry@gourry.net>
To: Frank van der Linden <fvdl@google.com>
Cc: Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org, corbet@lwn.net, muchun.song@linux.dev,
	osalvador@suse.de, akpm@linux-foundation.org, hannes@cmpxchg.org,
	laoar.shao@gmail.com, brauner@kernel.org, mclapinski@google.com,
	joel.granados@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mel Gorman <mgorman@suse.de>,
	Alexandru Moise <00moses.alexander00@gmail.com>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	David Rientjes <rientjes@google.com>
Subject: Re: [PATCH] Revert "mm, hugetlb: remove hugepages_treat_as_movable
 sysctl"
Message-ID: <aOaT34_LGs65VYMG@gourry-fedora-PF4VCD3F>
References: <20251007214412.3832340-1-gourry@gourry.net>
 <402170e6-c49f-4d28-a010-eb253fc2f923@redhat.com>
 <aOZ8PPWMchRN_t5-@tiehlicka>
 <CAPTztWaH7mJ3ACfqqYr1CFCDycw6Zm727t7wAa4n9Th22bn-yQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPTztWaH7mJ3ACfqqYr1CFCDycw6Zm727t7wAa4n9Th22bn-yQ@mail.gmail.com>

On Wed, Oct 08, 2025 at 09:08:01AM -0700, Frank van der Linden wrote:
> On Wed, Oct 8, 2025 at 7:59 AM Michal Hocko <mhocko@suse.com> wrote:
> >
> > Maybe what we really want is to have a configurable zone rather than a
> > very specific consumer of it instead. What do I mean by that? We clearly
> > have physically (DMA, DMA32) and usability (NORMAL, MOVABLE) constrained
> > zones. So rather than having a MOVABLE zone we can have a single zone
> > $FOO_NAME zone with configurable attributes - like allocation
> > constrains (kernel, user, movable, etc).
...
> 
> I agree that having mutiple zone properties is probably the way to go.
> 

This I imagine would need to be a build-time configuration, as you'd run
into issues flipping these bits if the memory is already in use.

This of course begs the question - if one configurable zone, why not N
configuable zones?

~Gregory
