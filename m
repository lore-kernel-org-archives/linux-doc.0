Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BBE5476B
	for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 21:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708379590; cv=none; b=mZlBIYJDzlhP8VSrLy9n/3+4O7CIkVYfBnzflY9T4bJGohdhJE+CA8O1Xa8IqH+Q6Hb7vZQX2yQ6YscuFv6COQ+PpVyb0HsxcdJLpPab/xpvitk8b7cxg+T4T5uOFLJMCCY7o+cQlkI12g5LLSvm5W7D3pQOKOuXABvEq52Jwuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708379590; c=relaxed/simple;
	bh=KGtvedv9J2Q+aICQY5KyN44vvbdTifr327wYhVDJi8E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B1AxSmoE4QL/JDj7HbW/noGOXzpOq26cmokLfFJwl7ZrgOwROa/bJHDT17UBLn/wn8Nn5deLYXieSAaUJta5sQancbFfuTHPvmSyIA3tf3q2umyD6W7B0fODYxytEWusxtpNSq7oLGYL1y9fW5k87eA/kgKkAlbqKyDzD/aufYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1JFzGjYH; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1JFzGjYH"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-6e0f80fc3a2so4540604b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 13:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708379589; x=1708984389; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NFqpZSKH861BhiQTTyjzCdqprlBqo4gmUGK5oD0uOYg=;
        b=1JFzGjYH+qQBGS6AZb6Hccf3ZgWZ8pLNsC4jeBi+b+wvp39bqE9dCKwECDCyq6U1Zk
         ztPCCBfzc2keaPLNoRhbGK5UOUPdiC0XPQ5dCh7y/CzLFLx7g3c1rMUUuACtX1opfmQ9
         2E5ZuSgclRzfM8rq5MvNzGGsmFhwzrZsNDgpmPloSke3rZfyfUozXWoMwptzpruV7xA0
         d+uTdDBRb2okReYH+tQztv1/GpEr3RiD4EzM4dMSrVS1VE/31xtqJzm4kbV7j02ujpD9
         +NxWzvBRJyF+on9dpnQLzlypl1oWTal1KxD93Es0A8LpIBdQZVgFy14D3Navy+8o6PZo
         f3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708379589; x=1708984389;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NFqpZSKH861BhiQTTyjzCdqprlBqo4gmUGK5oD0uOYg=;
        b=c+KM3bDxTWWRmGyl+lfl2P36c4CqlQ2unx5VzR49r5P/jgH+e93uffWD5YY3MGtdbc
         HTk8ySzNxIXz0g4CQLELBRrwrD9+OZ9k5trWq7oUmar7jVy8e6C2qoea4ODSJi+7pTo/
         j/fnUXMfvghPTDl+qKyWPddRJ6GywvFuDiEzySj73FY0sHMaBTYdNX1idlfc/jcuXgBI
         MQigNjQXfcHdTc5MyKkQPwB3tohn3GWas1aGTHjaWaM4x56DMqy2rf9cgon8ZRmcQV5A
         LtFAbLUzG/H0i7QEYCLoWFmOSxoMYBYrpkHj/t+cNBWxZGGq3XlE4Dj5rDvtcXAonSqP
         o+Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWrSTiYEaJHxwGqBdfuxhsFiX/jVb28pO7FMADWuWmAjeNV9kPz9UyLkzxbGSXY+3a9NiFvyCNQeWytgALrUrhplqICiZBjf40P
X-Gm-Message-State: AOJu0Yz8yuvfeBAy6UgCEPfe1cdxeZHSW2XlsbAknRCARKXZrd4GnPGt
	SwwszF1CorpK7sG2XtcoqQzxyab7ZDSTA3DcWNHPEtOA45yjViB1FwB3ftW39HUsFKg0VxFnwcT
	vQA==
X-Google-Smtp-Source: AGHT+IH/Or4BZP7MhcpiaZcbu9MeGySoedOfq752Zz8WMWEBM8KeiUUYdKJIqjjXKI7+Ve8OybP/rzc9484=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:8c09:b0:6e4:5a40:a151 with SMTP id
 ih9-20020a056a008c0900b006e45a40a151mr22695pfb.1.1708379588868; Mon, 19 Feb
 2024 13:53:08 -0800 (PST)
Date: Mon, 19 Feb 2024 13:53:07 -0800
In-Reply-To: <20240215152916.1158-13-paul@xen.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240215152916.1158-1-paul@xen.org> <20240215152916.1158-13-paul@xen.org>
Message-ID: <ZdPNw9evnWw2JzG-@google.com>
Subject: Re: [PATCH v13 12/21] KVM: x86/xen: allow shared_info to be mapped by
 fixed HVA
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
> @@ -715,13 +731,23 @@ int kvm_xen_hvm_get_attr(struct kvm *kvm, struct kvm_xen_hvm_attr *data)
>  		break;
>  
>  	case KVM_XEN_ATTR_TYPE_SHARED_INFO:
> -		if (kvm->arch.xen.shinfo_cache.active)
> +		if (kvm->arch.xen.shinfo_cache.active &&
> +		    kvm->arch.xen.shinfo_cache.gpa != KVM_XEN_INVALID_GPA)

This should really use INVALID_GPA when checking internal gpc state.  Mostly to
help clarify what is/isn't KVM Xen ABI, but also because I don't like the subtle
assumption that KVM_XEN_INVALID_GPA == INVALID_GPA.

Even better, if we slot in two helpers when the HVA-based GPC support is added,
then the Xen code doesn't need to to make assumptions about how the GPC code
manages HVA vs. GPA internally.  E.g. if we ever refactor the code again and use
a dedicated flag instead of gpc->gpa as the implicit flag.

  static inline bool kvm_gpc_is_gpa_active(struct gfn_to_pfn_cache *gpc)
  {
	return gpc->active && !kvm_is_error_gpa(gpc->gpa);
  }

  static inline bool kvm_gpc_is_hva_active(struct gfn_to_pfn_cache *gpc)
  {
	return gpc->active && kvm_is_error_gpa(gpc->gpa);
  }
