Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDFA2DCC17
	for <linux-doc@vger.kernel.org>; Fri,  7 Nov 2025 00:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762475746; cv=none; b=ry8V1ngCGiiqzviuTbNJTKrbrkyLx2xyqf6D82163Zo5phMG4atruRnZvVwD5goPe7gnKa+zf4icKnN4VkDW3l5cmNc8POn8jJpijYXrTdBmSC6OD/yg4ojmQC116LImqSA74Z+BqryZxO/DOZJECDTM0xVFy4UyqX4ZrQkh6sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762475746; c=relaxed/simple;
	bh=26mhvWfpyqxVsoR6ouyViiXyO86XybPyAuTZV75c/PU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8F8N1Cyd+SaniXkJQkLUuPD00nVnzlmbWDGEEqR/vrCZNuBzgivTOcWE+OPdEHIZpi1f3kB0Fn2/jaOq2aaUnRBNma+FgObnnwnO6X8RbDqunAcAAOaBjxeYDmo1TGUZEiLXZPi7ekTe6BOyw+HSiiHtF4JLxnlYfeZ02PmrkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=fZTwWyy/; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="fZTwWyy/"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-880438a762cso1471066d6.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 16:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1762475743; x=1763080543; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2vFuvWNdBF6vFEowrW3WFaNnkoxz6xkvGAkNcwr5uLg=;
        b=fZTwWyy/e9P480wxHvIYKeew97hdz0sWGfT/mbtUkuRZgXj55ebZ04gQRkNkM4lBqJ
         bZyoGDT0TotJ0iiN9/eLk+G13KiLnOh2gYsydiHpJSi/eDLU3rSMg97ClfrWqs5KH5iw
         8SJaeeqIxWjdbdEZwJ1T9WbRPdHRS2EsroD8+6k7o1s3w7YkkVWnuQz5eBlw949sByzQ
         m2SwowhV9+Z8mh8U1mgxYrffbAN7LSLGsUNStvYJhfggszInETW6NvP0y/r3VVYZAFvh
         0ZvorHdzABjeZdT/VeqmC7tm9gp1FD06LDYcNxBEtV4/ugC9ueTQjRAT6NMv8QEiQqob
         LS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762475743; x=1763080543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2vFuvWNdBF6vFEowrW3WFaNnkoxz6xkvGAkNcwr5uLg=;
        b=sWlxxjoXuwZGdYqmu9uZTWR3/pGOH6uS/QwarrLjleDA90mU0ebaaQUHePPOxG8G9X
         2J421X+qG2OEry4Q2ycV1MA+WyYYhscJAYdFHpovgIo128dghufnNieFmNfhYMaLy/Kg
         llRjVrqYnS1yklCBRHgyl1hudniW/gQnjVCNG2Pk+aQ916oxNNKXI0dpDFo463yRC08w
         ri5BbdiIgK9pHG2um9F2bHK+Wvw9b+a0h24As7qY9dZKieHFh5jIeYOUtKyUrcYPKJRz
         pxas3t6qFnrgSJ4IYThveHK8McealA3PVK8PGlF9+wFq0p54mT71FL77KO+TWttUd/uV
         IMbg==
X-Forwarded-Encrypted: i=1; AJvYcCWSpHsl24KXvy0luvtDusqpSQYHCdAnWswyt2aSV6TUvnZWkWftgFV27xMnzzBFe7hFJVRgJoDwVC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiqbE77gbPWqmibweawvgfY2IeT06FgzVhdURZ8hi9KGHu27s2
	lZB2S0LUSUOA5RmsL9uA88kfqFYP4PJa3j4VMXIHgxzB7iplB2OchOxx55OuXgi/rro=
X-Gm-Gg: ASbGncvJAVnMitS5R6wEjwqrRl9w2eeRwiUjBRGjYnS1cRb7NhFJpTHZeO6jTpDRs8s
	oQsYP0m3+ty6Al009nZHklMYAvAeLR5M9Vfy0jHzXBqZM+YnnRw/sQcb7q4o0CSvVzUeWIUGUD1
	fijIFEGjgYjuKRVViFyhbl61YKApNBGtzkrcGAVQiUHa1DABFZ7dOQRg7NfHp7JC36aIFeaDBQP
	w7cBAQEaGWdTcw7QGc9vUTiOl9xysKeW7twtAihylLwdPmqgRKIbqb33epabayMyUGZX3TUys3H
	9uuIG9VuWaz2HzkUS72qVKSPbb4rczv2MUC9AoA6R0P6X/1XDqTCVmxtkpsVINhtSDsxVDynoZB
	xy2nnUluNijxeWJ+PZwGslqzfhVq27tSnigjR1oTVZRrcsgypWpibiM/zcNWgDFRTECPXP6qSM1
	1tZBkhvRFwMlhulZun6t8oDK25165HPSYGZIN1BAXKcemSVw==
X-Google-Smtp-Source: AGHT+IFi5H/5K1qU/qTfa8zVHoasmFdiSIPqdCmrIYTpSC/tr3U2fbrwxyPtE8hN3rVdSnFiBHg67w==
X-Received: by 2002:a05:6214:2627:b0:880:5edf:d135 with SMTP id 6a1803df08f44-88176760434mr19773456d6.53.1762475742503;
        Thu, 06 Nov 2025 16:35:42 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-880828f5b1csm29528776d6.21.2025.11.06.16.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 16:35:41 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vHAS5-00000007WOg-0nM1;
	Thu, 06 Nov 2025 20:35:41 -0400
Date: Thu, 6 Nov 2025 20:35:41 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux IOMMU <iommu@lists.linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: Re: [PATCH 2/2] iommupt: Describe @bitnr parameter
Message-ID: <20251107003541.GA1792527@ziepe.ca>
References: <20251106073845.36445-1-bagasdotme@gmail.com>
 <20251106073845.36445-3-bagasdotme@gmail.com>
 <9dba0eb7-6f32-41b7-b70b-12379364585f@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dba0eb7-6f32-41b7-b70b-12379364585f@infradead.org>

On Thu, Nov 06, 2025 at 03:48:10PM -0800, Randy Dunlap wrote:
> > diff --git a/drivers/iommu/generic_pt/pt_common.h b/drivers/iommu/generic_pt/pt_common.h
> > index b5628f47e0db40..54c16355be2842 100644
> > --- a/drivers/iommu/generic_pt/pt_common.h
> > +++ b/drivers/iommu/generic_pt/pt_common.h
> > @@ -354,6 +354,7 @@ static inline unsigned int pt_max_sw_bit(struct pt_common *common);
> >  /**
> >   * pt_test_sw_bit_acquire() - Read a software bit in an item
> >   * @pts: Entry to set
> > + * @bitnr: Bit to set
> 
> Shouldn't both of these (above) to "to read" instead of "to set"?

Yes, that's right, Bagas could you fold that into a v2?

Jason
