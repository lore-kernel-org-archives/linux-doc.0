Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6A6267B89
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761747871; cv=none; b=uBGG7UDlOeA3XMnQhHYvtqGMyRfe+ntKoysvTweiyUgGshR9IZDrW+u8gqz7LFXiBGHvVChC6BJ/r5f6oFm7o1IKpjZB+nnVmuriEkQNATjlYbR5/c+Ziyd3vi0G3xZljoxNlZkynMOQ82mKmzGUURl52G/4Ux7en9J523rPMuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761747871; c=relaxed/simple;
	bh=qS5ti7OtwVEPt76zXgfefM6TFVwnuYoF/S0givgkQgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6w2PaX2h2oCXj9MQ81balgQB6nk7p/Dc/t7/QS8J9jZA3U5Wwy7olEHjMgFqRwbsxDjusI/qkE6FdFX19bUBTn3kX5kz0RzWMuGDj3+kwl7d3lbghCjPw7rRs7x4qAdDQE1jEBsBR/srlYPCN11H1VjoZxGDTKasmTi3L4dn+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J7mZ+boQ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J7mZ+boQ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47105bbb8d9so55535e9.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 07:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761747868; x=1762352668; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lYw1yzHZtok63cidNSQI3kNDGCJ3YniZmqixcpLm82c=;
        b=J7mZ+boQENXRVmY1sHexaQTwl97w4x2q0WPzF1Tn7msd6B59BalugcA/9LTplrxVdV
         vWOsTV0YI89Ut/OJkIGFh35B/TqYasnNAE9oJ7mAlopJ55Ma4/+CDvzbxVmuRjIVDh5W
         rXmAbERvOahT/WCkdoDt/CB3Qp1UUGpxFffDX+yejrFaCe/VCHrIQTi0zZ8rnAaAnLgA
         CloSadXZqcDhl6wTPKYxy03ROO59a7ELkcJOsSWj04GfsMdvmTZy8CTN+S0u9BbY9HOT
         Qzm8NAG0b8eMx53J+5g13vqqaLp/+bdgEoPROMV6KbQ8L0pzbnHxm62QYD8ZY3AseUFp
         p7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747868; x=1762352668;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lYw1yzHZtok63cidNSQI3kNDGCJ3YniZmqixcpLm82c=;
        b=GK1L1yZEWFRlNu6D8PETI7HxnblLZs/EEFT/Zrs7ojRtMocS18/84NOr+t4tt7tMR5
         pw9179stfBdJIpQ80D3Gl5/k+9LCx/38SmoDzpYwztqKkCKiVOx+2DxzQRyG9SBpDanu
         7m8ZyFXJeaZnQbvaDGrr69ScmqoD3TmbobaFxjAHnjrQ08vQZdjfphCO3DUDuSaI8fpJ
         0qJrG0PVPNaSBfJOlmVC0R30pn9MrduIwlgt8ycS5t64mAHC3ECFqornm6R+P2lZBd7c
         bp76x574G2kSU+PPnR9zOzuZ/0ZddmlECuKlm/SmZ30A0oPtRPI9wrCTz9VJxDw4U315
         b0pg==
X-Forwarded-Encrypted: i=1; AJvYcCXdAhpmBtHCXInGrqXek6t4zqjvKP2C97Pg3xXSGfYPM8pp3oSJuITHBTq5MyBAuIPnXG+ZLrjZq1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVGINbqlsOW01OYaJMmZpKh64PLIRkNVBykbL+VD2u0dXpdimD
	vBZeR14TFJhxEYQnnnisZo7f0luKhUcbf4i/A/NFsnfQCFIu8NzLopggCIdsbYIkAg==
X-Gm-Gg: ASbGncsG6UzLmmH828Ox8sTP/XlIhxrAUtn23q7gp/sVt8PjaINo5KvZnelX+7+lBNx
	ObnMbcnuPu1MLnXSuDQmoydjvdKYl6Z3hH1vh0N8uDwLuG46gKeyxKuKvEz2Sg7PAjXs6v6NbhJ
	K3sZlX3I+SXtwpPhNpmslKnbZG34zANXmA+A1bROpdRQ47eBtMBu5zKkt4vAbo+DSilvSzeWPHD
	nlYOTABliaVoxMMvQv6iMLXAOdC4l+3cQhJ2V1XhA3DcAkYk2HkMUckL3XyUp0JOeOBOg5+4frd
	p1zxBrZUKTRbeUUdCPKQfjYbqDGBxP4SDtRRxqI8HXoBW+IPqxkKw/o9/r9tjTnfSr8n66xA/zx
	cRUU8kznYNccmRerdXw1F92UOJQKGl6O0xIPsSyV+VvWd+I+tkYr07snWyOwLxpg31/hBbQeM2K
	YiPseDmUSTWlTYzWXNARLUQZevmNRzFkZoycTf+jCQp1ScKHTo8g==
X-Google-Smtp-Source: AGHT+IF2w8kCzWJz2ny6yJjbrSOF+2z2doPlN+BMk2LktbvxhoCGI/5la8r3PEhEpY5MyiFPBKRJew==
X-Received: by 2002:a7b:c054:0:b0:45b:74f7:9d30 with SMTP id 5b1f17b1804b1-4771f2ee429mr1618205e9.1.1761747868039;
        Wed, 29 Oct 2025 07:24:28 -0700 (PDT)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d514asm26815984f8f.23.2025.10.29.07.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 07:24:27 -0700 (PDT)
Date: Wed, 29 Oct 2025 14:24:24 +0000
From: Mostafa Saleh <smostafa@google.com>
To: =?iso-8859-1?Q?J=F6rg_R=F6del?= <joro@8bytes.org>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, will@kernel.org,
	robin.murphy@arm.com, akpm@linux-foundation.org, vbabka@suse.cz,
	surenb@google.com, mhocko@suse.com, jackmanb@google.com,
	hannes@cmpxchg.org, ziy@nvidia.com, david@redhat.com,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	rppt@kernel.org
Subject: Re: [RFC PATCH 3/4] drivers/iommu-debug: Track IOMMU pages
Message-ID: <aQIjmKSH8r8U7uMa@google.com>
References: <20251003173229.1533640-1-smostafa@google.com>
 <20251003173229.1533640-4-smostafa@google.com>
 <3ajy2xcjo3t6xdrbeo5xinlwtxzujvx4plzk3vqj3za7ren2rv@wdmwpjlaq6ql>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ajy2xcjo3t6xdrbeo5xinlwtxzujvx4plzk3vqj3za7ren2rv@wdmwpjlaq6ql>

On Mon, Oct 27, 2025 at 12:46:02PM +0100, Jörg Rödel wrote:
> On Fri, Oct 03, 2025 at 05:32:28PM +0000, Mostafa Saleh wrote:
> >  void iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys, size_t size)
> >  {
> > +	size_t off;
> > +	size_t page_size = iommu_debug_page_size(domain);
> > +
> > +	if (!static_branch_likely(&iommu_debug_initialized))
> > +		return;
> 
> This still adds function call overhead even in cases where iommu-debugging is
> disabled. Move the static_branches to the header files as well.

I see, I will fix it in v2.

Thanks,
Mostafa

> 
