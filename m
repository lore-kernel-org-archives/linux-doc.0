Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511D53EA96A
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 12:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502502; cv=none; b=uqbCrEJRX6H4Om+1MVVlFS8STWDo8xs/3psduLyid9tcj4BIz0H3QAbfEkJhZ8JSk5nhjwSl/7SbS/Y09UFewtRTLSrwqPIa2E1xdR3vzznU00gzaHPHZkFTCxIwv+/LNk/oN/1wBBhOeJJVihn3NnjBhzu3C4IM9nfrwzaHY9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502502; c=relaxed/simple;
	bh=VLoydqIVwuKUQXc9UhOoh5aUJw20KctFbJ47mghnEwQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hkcUJaOA8vCFn5rQOzeyD91x+fgTok97Ldd7tBvsUcLJMcovn9cZd00lVgrGbKibY1o1aTrSRO+0gp5Fc3RAORspAi4Ne9JVLX0RA7/ftRA/Li+kBonj4wZ6D+8mh3GXKAVcCefUOB/RTVAdM3eeu5rmZh6Mhaselxj8VbkAx80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DctK7RRk; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DctK7RRk"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7621655eso1760578a91.0
        for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 05:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785502501; x=1786107301; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/YNbRRWBcnK55n/7Fk+h5EFRipryAvZ2dYj1AcH+cM4=;
        b=DctK7RRke0afxICUutbpKpHGLgLCjeaCp84HesdXcUtDslI2Ta9pF97c6DfuJtL+Mp
         Ybx3QxO2Uq+kavUPSjwyTV/4XdsVHgNqNd8RqynI88osWRhgeXgHjzA8puTAGwfbpnLu
         DRwemJvX9ciehiuhnGiDKej2iqbnX8uXfQOaCSJFfM/GbuPhrgQjwzoGztplD1TI8fvA
         5BSBWKuTj7lxHHqSg5flvEtI3Xwcuu4B9WFIGM0LEjroqNZ+aHkoOMozIzFoEUN5draL
         51CDYRTgPbPq6F16+gTcgpvP+uFyJyk7ouPgeORV/Fy6+sOSK60vIoi1oFuJSqA7/pLj
         c2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785502501; x=1786107301;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/YNbRRWBcnK55n/7Fk+h5EFRipryAvZ2dYj1AcH+cM4=;
        b=Ea4G0uJiOWHgWzNlk2c4aZEo8AWZGp7Uuo9n9SScSpbZS2IfeQKfPPRr94teI3w3Xv
         NE0hmmLQzrugcJqtU2qnmDvl6eCRpFNOmbMzUpKAKWFTB55UNd0r6btSoAeAfaG1N6pj
         H+u+IQSkRfVwIhWbQ8+MofQvG7pOO9gsbGXLGrX0ra4xwpdHA0+/6Qi9cRhcqTlOVGLy
         loiflSwWSSsaN+SZx0JFKKseJ0U5Hr36hq59Gsl31e5YoqRf6VzCwus562/ZRVVe4vjX
         CKHOdHdo1L40c5UgHNGhBzUDAU8m8QKCIunECyP4xAf0dhbVy2rOKdGaeOmho/y+FiNj
         y0uQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVbZM7lyzncDSd6VpYFZN76553cudu/r6crj41H3i+yDYm/Ptb2aG2XSM1fVm/Hy9u1yOOgydD0Ug=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxcfZp5lybTREVKPJL0Utq7AOWARevtdo9ROKKVO6Y4DfQCX1T
	c8LFH2TYa5occX/QZlAS3Y3wN9fG3F8fjiQB/WD2anI4g3iPBJjBbXgSlVuW2MfO2f38yra3wc9
	+LN+tmA==
X-Received: from pjbdb11.prod.google.com ([2002:a17:90a:d64b:b0:38e:bb71:b8c5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c81:b0:366:3517:1aa2
 with SMTP id 98e67ed59e1d1-38fb0e858dcmr1811652a91.0.1785502500466; Fri, 31
 Jul 2026 05:55:00 -0700 (PDT)
Date: Fri, 31 Jul 2026 05:54:59 -0700
In-Reply-To: <20260731091708.2963414-1-flosch@nutanix.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260731091708.2963414-1-flosch@nutanix.com>
Message-ID: <amybI9Fe4R_9OFAc@google.com>
Subject: Re: [PATCH] kvm: add EVER_MAPPED ioctl and capability
From: Sean Christopherson <seanjc@google.com>
To: Florian Schmidt <flosch@nutanix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Jul 31, 2026, Florian Schmidt wrote:
> This allows a VMM to keep track of which pages were mapped by the guest
> at any point.

So does userfaultfd.  Any performance concerns with UFFD should be addressed by
KVM Userfault, which is on my todo list for this year.

[*] https://lore.kernel.org/all/20250109204929.1106563-1-jthoughton@google.com
