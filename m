Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8682353819
	for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 21:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708379370; cv=none; b=NVzOa2jMj70iWYHan1QZImg0sGq/9uas6s8Ml1b1e/5WlkLs2iNyreAWZCA2embvSoUIAmi6Z0Ye/vjQOwvH403qzyetZTSEwFqVuCoeVt0FJxYkX2TS05cmLyU+fkZXT6fUH8oPfJ67jsaTlGbuNTp04TJ2jesaD+HRfYl3Nao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708379370; c=relaxed/simple;
	bh=KItFpHig7GKB5eVb83kBF+Sj8VfMjfLDxIkJsHCGAAA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=E0akAhVGS5XCECzakrgLQO9VAfK1q/kgPtlb8OSTPnrVlWBqr+a+66csDuOpwTFYAs2nMtLa0+wHm4XgP0VzWxO9OVQ5UGDO4j79KjEp1oaVHKj4MfBHQx8ztIv3EAF4iAT6NNE/wTCaUxbMr1EpWHZlnJDaLPFciu5HEsumHtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NCgw1UP1; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NCgw1UP1"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2993035cd15so3204163a91.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 13:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708379368; x=1708984168; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rfULs70pvI7Ceuv9WP6jFUGiLY8ut6R2G7DJK71RQkY=;
        b=NCgw1UP1hH90/FQ/kuw6bS/QgCNpfraT4U5YBUE5OIytm/sgbrey2Pfng72N+ZD8dj
         DN3Y2DwcShM4JtwlsEy/Ffh7XHP7h+hsUytvvibI8QiEmcoI12Cm4GxQ0A5UW214eXHT
         vvz+ifVNxyKQ0bQHrq7tysE6HvM5B7jAQyD+leBK7anLBETDQapw0iC8VDay1swX/owq
         v/oaaNA8Iy8TmEZJOjG6A16OydqPeQCxnby+8hZ9a2+EiR2vmE/rOZTJeq2x3IOtQqFC
         7rngs3f4kqFMB6ax82KRVSsmrx7erjij1DLVt9xClC9MuA/q+A0w8KZw6gXzlwzWF5DS
         1d6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708379368; x=1708984168;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rfULs70pvI7Ceuv9WP6jFUGiLY8ut6R2G7DJK71RQkY=;
        b=qJ08DLJzh2NMmgMH4c3Fy7B1znx5CSyubYJ+gMTo91CgeDCvyPJUt7y1fFohgxfFC0
         R0dKqtgSPB1SMnRfAp5zHEd+8frLziV3v3SVEOTvk4Vaj2g28MfMb9m36mvfhL/u1EGD
         BZNqSm1c9mNuN30cdMo+UvzhbpvMBYraYsxCx2UL14H0XfzQYtFfivHOWrxGpg6YSGlv
         oRUvw7ILwGTdZtrdQX0+bvFDRMrVN+KIjJFBWtKoTMt4K29n187awEXMlLls4xQ88TS5
         EL473HFUfjg2vcorTxWVI3u13DIobqQbNgsIKaAH0joOyX/kfkSBsU1+mC7WuchJx69+
         2j8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVizIgUTnrxp0TN0NZ5JsqoRWsmVCy8pWoRxIbXGc65QT0uZX+gYovzDqfwcKykwd+6YrRgKWhiBdNjO6fB9UR44OElfzqDGs7z
X-Gm-Message-State: AOJu0Yz7yInd6p3ZQLQqlV/erVR8qXVVUlFZ1ZZ3IBBACulew0+gqZOs
	aaTGrrzs6FGCSFPlISUA/w0nP1JlsNFWE85gjcuZdg12BXTJEDPpIUkUgdhclao+kigz/z6F5io
	7kA==
X-Google-Smtp-Source: AGHT+IGiLYIaic9FuvOhm9v4VMwaSoQLJExmElo+aZ5wkO5dXcI8ekgu6UFSXYLaILEpuOWNO4GMHTfADQg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:1583:b0:299:cda:3178 with SMTP id
 lc3-20020a17090b158300b002990cda3178mr154276pjb.4.1708379367964; Mon, 19 Feb
 2024 13:49:27 -0800 (PST)
Date: Mon, 19 Feb 2024 13:49:26 -0800
In-Reply-To: <20240215152916.1158-10-paul@xen.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240215152916.1158-1-paul@xen.org> <20240215152916.1158-10-paul@xen.org>
Message-ID: <ZdPM5tzyHEq4Z8t4@google.com>
Subject: Re: [PATCH v13 09/21] KVM: pfncache: allow a cache to be activated
 with a fixed (userspace) HVA
From: Sean Christopherson <seanjc@google.com>
To: Paul Durrant <paul@xen.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Feb 15, 2024, Paul Durrant wrote:
> @@ -319,7 +340,16 @@ static int __kvm_gpc_refresh(struct gfn_to_pfn_cache *gpc, gpa_t gpa,
>  
>  int kvm_gpc_refresh(struct gfn_to_pfn_cache *gpc, unsigned long len)
>  {
> -	return __kvm_gpc_refresh(gpc, gpc->gpa, len);
> +	unsigned long uhva = gpc->uhva;
> +
> +	/*
> +	 * If the GPA is valid then invalidate the HVA, otherwise
> +	 * __kvm_gpc_refresh() will fail its strict either/or address check.
> +	 */

It's not just to make the strict check happy, though that's obviously the direct
motivation, it's so that there's one root of truth.  The strict check is there to
enforce that behavior and to make it  more clear to readers that it's an either/or
situation.

> +	if (!kvm_is_error_gpa(gpc->gpa))
> +		uhva = KVM_HVA_ERR_BAD;

This would be a good time to use a ternary operator.

	/*
	 * If the GPA is valid then ignore the HVA, as a cache can be GPA-based
	 * or HVA-based, not both.  For GPA-based caches, the HVA will be
	 * recomputed during refresh if necessary.
	 */
	unsigned long uhva = kvm_is_error_gpa(gpc->gpa) ? gpc->uhva :
							  KVM_HVA_ERR_BAD;
