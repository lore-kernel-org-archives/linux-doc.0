Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1A52F6938
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 14:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760970173; cv=none; b=C6lP7jYFWAFiIbkQGCB+AEmz5sqRUPs9sAPHtoQv9SYTgcQj1ad00iFYXJbTY4Cu3949c7ZpLcVyHP5tcU5C76cpwQtqHBpKx1Oih5LN8DHzyZGrHFl2M3d15tyGEPIl5DHr8Vz1F8g/d1p3kbdFnn1bHPk+JQh4PTIyYR1sT70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760970173; c=relaxed/simple;
	bh=UJJpmzAqJ4fNKtxAFBD6r6VHXs+/qK3P1QsraWv63QE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2C5N+YwI/VTDyPgxrYQIJ0w1j9JuiyNn9NF24ayOL9/6Xb2jDUiWM6xFDZjjpV0nmmCdxWpajPX8oHBkILikSi3mfdid3Ft3pMA2iTC11VYubOt2gqNeeNzZfVL/VWnAffGXZfNfRCaJHfZOAxq/8Uf1PTO8+DhnzLGtkEB3Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=B3vxHAJY; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="B3vxHAJY"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-87bb66dd224so61025066d6.3
        for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 07:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1760970170; x=1761574970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ome1K21U8OKmqIh6cxr7UpkIOBQ/Su9V9X20JROSYuM=;
        b=B3vxHAJYKEs/96pn/HUMQIY5sOQM7Yc6roOi8anQ8ev3wQP2b4sgumnLtf0Juo/0lQ
         mbArhcdwH8v6YcDL3hMyxusAbKZ26ugm49gWNj4jnAQ7lRJDVvGW45BgKkKvPfPLIp+u
         ua5B8DZ+n5dhlEbkom8vBytat3QmYCEGOJ/IvfnwoNuyyMTtzRmn46lppLfsINEOF7or
         ZAUKxiIIpu8mXNr9thhW2JFaNg4cFpkolrxJbPwa004sXQNbv641mSyiG4avZ45SYU27
         +KIE8YHK5t93F0ZZ/I8Ca4zviqMI1m8f/UARfvLWkaYUGF67cKfj55BOpwYkc+pXBYFc
         Kikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760970170; x=1761574970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ome1K21U8OKmqIh6cxr7UpkIOBQ/Su9V9X20JROSYuM=;
        b=aKA1ocaTCDIpMLhuS+61rjt2r0jG1n5eWP0wNaQB4e4+3gwHiF88jo7eJ9OeOBXngT
         DAwtEx6KuTuF7xBIirquZNzbuWGZ8mu65xUUG5IlZTaOLFLMuezF8jKjo/tWcB2/ph+s
         PvIFERsRz5LAuIvdM9pJTrVE2WPrbnlN8l3CBQpitoL/Dw7LRYy1xjka/0kzuK/X02tl
         MPZ8rXCkqWy4x46QjbGY8c+ACUeuxMAiSByPzHbO303fc/iXVWe6qOff/IuKb13+cGiT
         on/T2PCOVcSHFyGJU67aJs7lcXZThucoTz+ihmAmV9eco17gbDlxoAuVujxc1R52TUkt
         zrDg==
X-Forwarded-Encrypted: i=1; AJvYcCWGogjdLbU8chUSZcwOQdMlvxgco2q3M7xYqRdiyvUOhSUDCi28DnZBF7Xs3ENZvLUIiot8Av4pIj8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9J6/ijlEOpuT5GRIewHAS/+gKANKG4Md37V1O6cfqCEwL2RlB
	ZAaiLDNyFFfIFlT5drMuQD9ismWgLtFU8Wc3nclE66uJTYJobDREz8t7TmEJfRKxqLI=
X-Gm-Gg: ASbGncuUvfp9B6uUH6Mf5YRulP2pIGVF7rJteDz03+wlqKUx4FvuAzjCqBiinOJ3g9/
	SpirmnhhRM+O8UVp/T4lV4emH9fhWP2UM+pNCszJTYJA8ck7TiZdhhGahr7xetbftVusNc9iL+M
	lUM3t7LZO6s4VAhelN7cQP5N8EJh9CinQQvInbdrf0Buyos/bKWohgocOhUttwwx/A4j8n06DNH
	FJ3YlWapByAMeyGfizZZyl5keECP/s0Hi3wD3+z968jRSOJwSeCJ6XTPFPWZkFmCRSJCmHQ3XQM
	aoO1wfw7knCCPmaaN3JUpYyyK8/J+qJ8o092L75BJ9izxxjp5nYHFZmjHWALdD6T8a0q/nk8g0a
	Bc68qLxv0LeBz5EK71QqKlsbJsN7RCQqlvDj1DXFilV71dWO55x0PzIo3uKEJwUTa8Gpfd+tch6
	95ytTKfTF+kQhyXGopgXiyGarPAYmSd51ljwts/behYSZppb3VOKTORBU7/dNsnsbERI8Ukg==
X-Google-Smtp-Source: AGHT+IGL/jp9+4xUfY50jcRRy/t4MGHpw6jQ2O094KKD/LfcVRUdB+PlhBahj0B9OuP95IOnQE5uVw==
X-Received: by 2002:a05:622a:306:b0:4e8:a85f:e4a6 with SMTP id d75a77b69052e-4e8b7cdf3cbmr81951421cf.81.1760970170265;
        Mon, 20 Oct 2025 07:22:50 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-891cf0af579sm568871285a.41.2025.10.20.07.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 07:22:49 -0700 (PDT)
Date: Mon, 20 Oct 2025 10:22:47 -0400
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
Message-ID: <aPZFt05GcyTkGNQ5@gourry-fedora-PF4VCD3F>
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
> 
> However, it also means that we won't try moving 2MB folios to free up a 1GB
> folio.
>

This may actually explain some other behavior we've been seeing, re:
reliability of 1GB allocations.  Let me ask some folks to look at this.

Thanks David,
~Gregory

