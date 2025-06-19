Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192442512C6
	for <linux-doc@vger.kernel.org>; Thu, 19 Jun 2025 13:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750338767; cv=none; b=sSDP7cQJeom23J8m7hS1LJ1FA90DSLkGN72rQY6FOK64ktjPHy+nXIdWBQ5Pgr1J5Lm3vYWKdsYRhvRoqvMzivEZ16V6RGjuTt5SRgK4nA5SUer8xNy1wnso0fhjPS8dWiMWm3T/AFuETlE0gp68kjedYUUqcanS5JrDtdtKlsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750338767; c=relaxed/simple;
	bh=7Z+pcU33oyPC7BRqEddWR4+kETEmpiLOQGbuRz0Rh4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Waju/9OJe1MaVXdnB2zENYiMcpmmWUHZQTq8rvaIOZK6BZ1icvPEgBCrsjvlCzwdU1u/WWkuCO2YzDHjrlOik3sFm3CtBPCzADXtUfoi941LDhvSErzpsjHVw4CHRdcDk75y1PE1TToa5jQt8T4WagfL9l+YmZqevM8IIn3ZrF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ajCfAww9; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ajCfAww9"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a522224582so383445f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 19 Jun 2025 06:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750338762; x=1750943562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RfbU5XwbSP1qLzPO3cyu4dPYbVldE49hn467MK7e3Fw=;
        b=ajCfAww91JELMoD0gRdIDfxfnP7N5r5jAgHqLI+K0jOHf9YYIvY6UxccmL84TIyi33
         WBzxBe+6EcoGeCKZtIZNsfcHU9b4dQLl+LxXJewBg13tKlp54OIm6MUOlcldBsYDgBtq
         7JoSpseRXnp5mOwPnzQsI89MqKRq8Ga8GLVFl8G4kHq4XCr9N0vKNhlCHDzR/ZMdMte6
         1pqAC/w8m7ck/UzhVPkSVabsTH1ebfTLTLo239d1hFFn1uLbkF1GPF/ylfWYjmnW0nQS
         Cc5hsyULGVPBmmD0c3xGAi4P9g0geIDrMUa123V8d6IngNMejK8K+oiC2dv0noi+ckd+
         u7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338762; x=1750943562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfbU5XwbSP1qLzPO3cyu4dPYbVldE49hn467MK7e3Fw=;
        b=uPo6vGMnaj6oViCVN1yQe4Ugi7wUY4thN6GDHJI+PhxyWjCliAqNpN8c7cZrOcKrHM
         9jojhT1v6/i4F2przlzssZD9mDmhYWJoH1ZttN8FF89fRd1/HZ8IxZdYZm0nxJrAaJ0l
         xGh9/lKWq8B6yipfJwr6LsqcK4tcRmcJYdv/VBCMf7Rp3gGeDIDC7MnWM6yidGRCyiBl
         njLv0chVvLt71rE1oFXTgaKE+MuTJiRJcuM6sZKxNt3Kj9ppiar7NWWKFRWdeX8mhvJT
         NohyOEoGMIhmDnduP44sBygdpgC6CtDrpFhwzi4zVgzptmI08i+VaNWTCS1H33csl9yP
         7iQA==
X-Forwarded-Encrypted: i=1; AJvYcCVSlOVMSPQis8KDlmTXUkoV9E2rxBGibPQ/nHuPVN262CCkVQBf5SkUtkv2U4iS4oWEbe9sVgk1KWE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3OKWIp58ryBqrq0+WP/Ovk1nk6aaJgrsGN3vAO72NG+cxoS5L
	ucC63LhINgV+oZu5skC44bhwQBaR/XoVaKQptnrnLXyHKbd/p7fR2NTV5mVPOCFvU3QTLVJz7V2
	v/Ujb
X-Gm-Gg: ASbGncsnIED3luNx1iiwWYfCGkdZ3IZC9vZJqNdEMkgfGNIpE2FwsGdKWy7YVddie/S
	7kKOQzngvdwkigK5y58lZDfhNk/V6bSSzbm+OozZfkwu0b0wsG3czCko2WE6LzPsbiykQUIqre2
	qm4YaJCKBFHX22188ROtX+WSbQqlWMS9/U+oyysDtxEnO28dnLkg6L3rDAYLUN/13wE6lwVptxb
	w7PiohTGnqyjnj1RCi+DmLqgrDPHV6gHbNimy0Oxz0gAAM/8CyoM8ppvCPPfXsJpPNOJVnISNfT
	Vxws4bsycF/aKaSNJVQkrg2b/9OlwYbd0x/0xMEgmX0Av2GgnD6f/qkdMejoOr7/
X-Google-Smtp-Source: AGHT+IGMRKN0eJ9M8yQ9jjcFab1egJr8KHPTZoIBqlP7aXsKf+1dslaBz5nlJNNPH1PKzxhd0L84JA==
X-Received: by 2002:a05:6000:1448:b0:3a5:2653:7322 with SMTP id ffacd0b85a97d-3a572367adamr18189709f8f.3.1750338762337;
        Thu, 19 Jun 2025 06:12:42 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365decaf4csm118830535ad.218.2025.06.19.06.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:12:41 -0700 (PDT)
Date: Thu, 19 Jun 2025 15:12:28 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
Message-ID: <aFQMvEMzXNQjLvp-@pathway.suse.cz>
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
 <20250618041235.1716143-2-anshuman.khandual@arm.com>
 <aFL7frrstgpzzgan@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFL7frrstgpzzgan@smile.fi.intel.com>

On Wed 2025-06-18 20:46:38, Andy Shevchenko wrote:
> On Wed, Jun 18, 2025 at 09:42:34AM +0530, Anshuman Khandual wrote:
> > Add a new format for printing page table entries.
> 
> > Cc: Petr Mladek <pmladek@suse.com>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: linux-doc@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-mm@kvack.org
> 
> Please. move these to be after the '---' cutter line below. Just leave SoB tag
> alone. This will have the same effect w/o polluting commit message.
> 
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > ---
> 
> (somewhere here is a good place for all your Cc: tags)
> 
> ...
> 
> > +        %ppte
> 
> I believe you can take %pte.

We should think about the future. If we added "pte", people would want
to add also "pmd", "pud", ...

It might actually be a good idea to keep them under the %pp prefix.

Best Regards,
Petr
