Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1581515ECDB
	for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 23:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720655355; cv=none; b=TBSpWrJjN7plVtboeuwt0sP04UFnPt722SQtYLx2fz22kfg5PgG7/1ur1D/hxVeSuI+l/MIMPNhvlSVoXsqMEpf3jyMVZ68oMHwX0i9IPN3qesXbNDJxUa0m39adhzUql4mZI/WL+NpENj+v7D56zD3HkYRj6ocomYNyVYCkQp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720655355; c=relaxed/simple;
	bh=WpUWnTWcQ9yZbCFEuArGMs4Fxk919PYBB/xOGitk7xM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ll6rFYWqtLgkOkA7HSKR8WH5EanONWQ/R29YdTTt/OtRZt9fyGhys5gT2FZ6e+wIZwz0h/JiJFHWIZs1Pxqe3rebHbKrWs7rV6ayMOUUKsNbVE3bC5I0yKUE2coIGuluSXySgTfDQWZ6KeKmZVELmkX7mlHZse09CdnMLDPXhu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TxVFDFfZ; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TxVFDFfZ"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-447df43324fso64801cf.1
        for <linux-doc@vger.kernel.org>; Wed, 10 Jul 2024 16:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720655353; x=1721260153; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WpUWnTWcQ9yZbCFEuArGMs4Fxk919PYBB/xOGitk7xM=;
        b=TxVFDFfZrvROa1IKZ3G5x2ZkEvq9G8gQk4z8oeAb/KpPpPvQOH/gIU0KLHUwUU6GFn
         zHjX3/emlwa1Wq8KkRnLm/gAk7ZSpGZd+0D0hWyGHNdvypxPkVvYAwNkIG7hDC0jmwns
         6BwPHSONhiwDP92nugSYgG/1eVSF9OzY4SWiAe45CXyIaey6oVcoW7jc7pvnOLXgCnNK
         AR5QwzdR+o+LAOiRAiEgiegcIRa2yNMefFsu/Zjn+6Ok0C22D+4MxmqggJiAH2ljTTCy
         rHuCbdu4xAxVsXkUPgUR1XYB3+y2/ecAqd96rNfabcyRGfdJAU47FpwBR8yJMOjCJI9u
         H6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720655353; x=1721260153;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WpUWnTWcQ9yZbCFEuArGMs4Fxk919PYBB/xOGitk7xM=;
        b=d5kTTN+9Zj9ZkAIHMYd2UUsQ9so6P2XH43nBTtjFfp5Mxp6LS9RwuwC0hqnGytU8bn
         obPEJpsumZ3zwzQV70sMcB4zYEVtasP+Jt0YPtRIhZNRjXJdHl03TQ0H6iWkpZnO7ovZ
         mHxCA6sLe2nrfpciI1JD34GqGnKwg+ZBZe0SJenyRCRONuZNpIxdWAM8lJgxAkBqOk0R
         m/srs6+jqXO0rBpTclLKdT1cHWYlXX+73ATjIMPcQObPrfHm3EFQVCmr0fKW3Sa7Do+q
         HpfnATSPpBdDYK6B+z7ggZSNthk3P6OK1gYYkhHUI+m3xezdrM5cpl8cKl56WwEHILP2
         EtCA==
X-Forwarded-Encrypted: i=1; AJvYcCXtNrNyffp0f9W3atTnMuzGW+8/fJO04DaTbr6/Ts0qctB1OfQyuOw8x9lOyLGJRBSjR3NV1qNZpKLoaUzCc3O2ukvPwk9GWNbp
X-Gm-Message-State: AOJu0Yz6cSZpvC+j+lfivyMHNlsc1SOuVO07kCTHInS6Crm3SrlCATQ1
	aq36nfJeKaMR79HW+xKwS+ZxK9j1QQTlBwFeYg5Wrweb0yqpjez7SAfGCrC1/MN+WsYYLGgGVmD
	7tdxXiyYU/AV7VWXNJZiqh6lBvMg+PPdCi8lM
X-Google-Smtp-Source: AGHT+IEuslvTU7O114maCMu6s7q1QatazKYK4Au3LHFSN1TQt2fd6q24xfMVdE/dWH6oyRO5MWqPuiKjKkMbsPD4dqw=
X-Received: by 2002:ac8:7386:0:b0:447:ec33:f488 with SMTP id
 d75a77b69052e-44d0aa4788bmr1329661cf.4.1720655352838; Wed, 10 Jul 2024
 16:49:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710234222.2333120-1-jthoughton@google.com>
In-Reply-To: <20240710234222.2333120-1-jthoughton@google.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 10 Jul 2024 16:48:36 -0700
Message-ID: <CADrL8HUHRMwUPhr7jLLBgD9YLFAnVHc=N-C=8er-x6GUtV97pQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/18] KVM: Post-copy live migration for guest_memfd
To: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, David Matlack <dmatlack@google.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ah, I put the wrong email for Peter! I'm so sorry!
