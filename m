Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FC5307492
	for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 17:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750784805; cv=none; b=qXlLatldsIOle56im/HB0bHaGwrFGAbL3wPdkr4VQHoJ88dHExuktVLUhCLEN9QQU/RLdM9BEuXMINOs2dhmsTD+FzESmOMt6s8QdwE20exQhNJ0Ow2HLHoLAWyE2wBncFy3T6S+SvT6PJs+Rf9eTL8wD3RFmwcjCTHya4f2bvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750784805; c=relaxed/simple;
	bh=El96RS2GoB+xf+x5xkRmmKhAycZmnaHN2uzD4493RT8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TSjtXhV7AvGpqW730xmAV5oIli7AIzy6bUdBNLAw7IUyTJ/6zZJc57MCf/sTYPEaB/F3tlVS8cCPpVyCbWRlpeIy9URyhc9GjUXjrCxoXp4I7GH/IJAJBSZxXe+KkP+33pPRy6STSaTHZgrroAFEIyee/hZDSh+gmoMYIaSk+Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qr1RvsdH; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qr1RvsdH"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-31315427249so836835a91.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 10:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750784804; x=1751389604; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Fj3ia1xYcZY5Hv5rbn8TPDKNjSzgo+utgMvYqBwh94=;
        b=qr1RvsdHys8bD6enK9LV1CLvZkESbZ+H5V1Rmf08jNW6fx8qVmVEN9/5fltZQzOfyv
         Acnu3EHojahxOi00XI3SCNZOGLUqfcSjxlXRN1nPGvRoklAUxf6JlITItqNZP61fEFm2
         S6DulUrj3P49OdiKoQn4oj7RxVchQA9fC6xmdvxq/8ltPSfYSB7IT4grf9KADqvIZOQO
         P+aqDNZzpma0RIkUShr6lxlVExxIoW3l5ghyC1TRyvBMxVbJ+y7j78JoNltMipyMIfPK
         Tou0FY5OhMhN4HZzgg4roIdfb4r9DIFZnl3ojZddhQ3+1lIt4vQSvg92EuN9QCgL23uc
         lWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750784804; x=1751389604;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Fj3ia1xYcZY5Hv5rbn8TPDKNjSzgo+utgMvYqBwh94=;
        b=m7QhsDm7y9jz1isHRF1Gx4J09+oZRo1V+ygexAzYsZZtBJ0Ha4S3N2bZpD+0ANZl4P
         mGMbVyUgpvm3JuIKMPR0MaQ0kMFQtg7wwL7kfVIpQ+8HR6Zldu2niB0P9jfEVS+zXpwl
         RZ4pxK19JrbB0qVVEhc3f3PDm/Xg86ca2sXBzbka17jX+8tp1j+7nLOc+fIVEcPDRGfV
         vBP7wrkecBk+/5khLhHQgd/LBcoWgvd8QO2mxX1Dz3svU6IWa1pFiauSca73ZXokcoZj
         vkmejM2PASS1fotJraAcQ7uawsD038rsRH8hMQQcy+Mgua1vB83P0gDfRKnqmZDF1f9u
         unHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjbku9Gr6CZbYvBr0ATKW3yeFqR6fZtuGc/+15e+2ihrCZCoLAEP8aZir9qXRDSyOFEFZBech6xaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbI3FFg07o28QrRpw77hB56X4gHtglUYzSuEKZzWVc/iYsO4Ni
	x/3TKS3EEB4yzoO8EX/PfXFved5BbWoUAy53LhbS5LU6mRM73s1/QMLPgXQagh/ggY9yyVOP7oP
	EC9v7PA==
X-Google-Smtp-Source: AGHT+IG91rtujOF1URlp+uwPQ5xYFcxtfL51NMrhKNtKVdmuwx1+g9oU1lsxSZXSOfImxql2jLw2G1l0m9U=
X-Received: from pjbqc8.prod.google.com ([2002:a17:90b:2888:b0:312:1af5:98c9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1b47:b0:301:9f62:a944
 with SMTP id 98e67ed59e1d1-315eddb82cbmr578213a91.33.1750784803871; Tue, 24
 Jun 2025 10:06:43 -0700 (PDT)
Date: Tue, 24 Jun 2025 10:06:42 -0700
In-Reply-To: <d243d203-7514-4541-9ea2-1200f7116cc1@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250328171205.2029296-1-xin@zytor.com> <d243d203-7514-4541-9ea2-1200f7116cc1@zytor.com>
Message-ID: <aFrbIgouGiZWf51O@google.com>
Subject: Re: [PATCH v4 00/19] Enable FRED with KVM VMX
From: Sean Christopherson <seanjc@google.com>
To: Xin Li <xin@zytor.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, andrew.cooper3@citrix.com, luto@kernel.org, 
	peterz@infradead.org, chao.gao@intel.com, xin3.li@intel.com
Content-Type: text/plain; charset="us-ascii"

On Fri, Mar 28, 2025, Xin Li wrote:
> Any chance we could merge FRED ahead of CET?

Probably not?  CET exists is publicly available CPUs.  AFAIK, FRED does not.
And CET is (/knock wood) hopefully pretty much ready?  FWIW, I'd really like to
get both CET and FRED virtualization landed by 6.18, i.e. in time for the next
LTS.
