Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B6374E17
	for <linux-doc@vger.kernel.org>; Fri,  9 Feb 2024 15:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707494342; cv=none; b=MpsNrnF/Ju3SngOEpiLqbJmvZC+zL2hJ+Qss+VVo48NC/hanPv52JMfSXf1NKdTeqtwpYSgHvjXyTPsGkL30dR6si2i4IDNwo7RKSKR3fEPCE+Z0biM8VrfHmHvw1u6t8c++yQPZIIEr8W7RQso/YyjlYf4y49Yoj+SyDn3C/Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707494342; c=relaxed/simple;
	bh=t8AOFvwk4ZsRfte4mt6qy5Qnrh895ZKYWxZaGpnZgQc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=peiepPtBQ5z+0zxamo30/H4h5iyu8nQGoH10JVp58BedskTDLzTtoJNEzugKeurZh53sRhnGCrI8hlk+IOPsrO4uzepUeHsvYo8wxGZCz3i1hUPbGBfE7sH16EOGSlButeP79OlD+fVqzt9DNljzuE3BD8nKVlv9ZvECeWg31XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ih9WpT7m; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ih9WpT7m"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-6e05b360ecdso1215041b3a.1
        for <linux-doc@vger.kernel.org>; Fri, 09 Feb 2024 07:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707494341; x=1708099141; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vmU1iVHFMR+KMXCRooeSWvSlFqesJV4w6OG3Cfb/DYA=;
        b=Ih9WpT7myBDsTw1jCpnqGE0Abm0wEd9RUQQPjCsGBaElh0R9MIyqVn1LPzcv9ZNrCo
         7W7i75Reo0LFMMvEJWyTGisjp+fpPTxUsv3/BtEtoIf4WH5rlJ/vMsipamEpE4MqYn0N
         gtfuy/GKlvIDB5ldu0rIIpNqn1qr6JhQxcyP87hVdfTJnZLd+Lo1KVIPylm2rvhkdeGS
         S1JQAi4SrcZQZmEI8ndBLebmKftD4grQTNkD9lgCPEa4w33In1WzS72Opy3RZRW1WHXC
         /RLlvgb/prfQoY681Coz1OYc1fuJ+w7UpHtch3g4e7jcTsSLjjM8RcE4WRrFP3rn3tHE
         iNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707494341; x=1708099141;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vmU1iVHFMR+KMXCRooeSWvSlFqesJV4w6OG3Cfb/DYA=;
        b=a0d/L650E7ogYoFCAdP0w3DAyjKUwkpHKdOYypz4yKaSkkrLMlvOKKqi5CDBi44l57
         ECgPh6Gn32KVRkrY6IFC46gFTpI5Lg/U8V6n1qk7TEoW4qe2JVKkekDwrPu7+DIDX2Nt
         BAumQrHTaj/EM6WAG3vB5fZi0MXSkhlbgC8wR4dngMMNHOQe+/8fyG+NgadeEWOHIBkE
         wKcbQxY/BSdJTEAdzcR0RM3TnGe2FuEItg28bIDo6EGjaz+8HH1tyWdNDTKoa+HrlGVG
         Yga1yghlffmi/RiqRiEFiqlV0It1uemMIEQByAsj3iszyMmrxAE/0gaE+tIKJK+Hxa60
         zIUQ==
X-Gm-Message-State: AOJu0YyW+sEC3lgCQ4EdXdnyrz30dCTr7F4tSi+RxyrWvtd/sZPIHBmV
	w4YmqR2UDh0zLvKknWYfrXb8tFTw8pC/rI5k/62LNA5wcHZ3gDyiFcHgmes5zOynZGZ0OFfdxUt
	/NQ==
X-Google-Smtp-Source: AGHT+IEqw5iMxlNZ/6HDdmLqiij/UuhrDMLWbn1BX87m/Qwf56HYcCS7HuDzUgtZIkwG2a7Juqlewppc+Dc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:c88:b0:6e0:3e0b:44eb with SMTP id
 a8-20020a056a000c8800b006e03e0b44ebmr132321pfv.3.1707494340657; Fri, 09 Feb
 2024 07:59:00 -0800 (PST)
Date: Fri, 9 Feb 2024 07:58:59 -0800
In-Reply-To: <20240115125707.1183-5-paul@xen.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240115125707.1183-1-paul@xen.org> <20240115125707.1183-5-paul@xen.org>
Message-ID: <ZcZLw1KGje61A9Yl@google.com>
Subject: Re: [PATCH v12 04/20] KVM: pfncache: add a mark-dirty helper
From: Sean Christopherson <seanjc@google.com>
To: Paul Durrant <paul@xen.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>, Shuah Khan <shuah@kernel.org>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Jan 15, 2024, Paul Durrant wrote:
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 7e7fd25b09b3..f3bb9e0a81fe 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1399,6 +1399,17 @@ int kvm_gpc_refresh(struct gfn_to_pfn_cache *gpc, unsigned long len);
>   */
>  void kvm_gpc_deactivate(struct gfn_to_pfn_cache *gpc);
>  
> +/**
> + * kvm_gpc_mark_dirty - mark a cached page as dirty.
> + *
> + * @gpc:	   struct gfn_to_pfn_cache object.
> + */
> +static inline void kvm_gpc_mark_dirty(struct gfn_to_pfn_cache *gpc)
> +{
> +	lockdep_assert_held(&gpc->lock);
> +	mark_page_dirty_in_slot(gpc->kvm, gpc->memslot, gpc->gpa >> PAGE_SHIFT);

Can you opportunistically have this pre-check gpc->memslot?  __kvm_gpc_refresh()
should nullify gpc->memslot when using an hva.  That way, you don't need to
explicitly check for the "invalid gfn" case here (or you could, but WARN_ON_ONCE()
if the memslot is non-NULL and the gfn is invalid?).
