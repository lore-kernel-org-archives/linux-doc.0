Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACBB19F13F
	for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 12:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771505040; cv=pass; b=PdTrJmXFvII8bfDobzpbnDtxrQ2KYlXtjhy25+sEF058lebvfy3CyhUGcXALbbhwOgEsGsg0yYudsl+yJ9VYBN3AzWBUM8RuEvIgoto2nk5u66xnmriRO1flXY/R3y3WIzf4PUMrPn6fNo8KNN2WW3koClsiMe7/aHzqQtAhP00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771505040; c=relaxed/simple;
	bh=aes4AHs+AOWhWj2FYmgytAYSf1U9HD0Qri/K8EHmzMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SznnjMUodRYHhNuhVk2kQ86DSr/elOAKpo5xTVcotcqvOFJVP+f0tKYtNHPeyyzh5GJiRyidWnT+R/tb/Obtek6YEUEEcIBE1fGsEDbVVgZnKXLzrFGnB/Qg+DUwwuKsb8dBE0Skm3qZL0dz7c+Azulq+h5TpLcloLYZTVuS/DE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y2XdxYxl; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y2XdxYxl"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5033b64256dso506521cf.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Feb 2026 04:43:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771505038; cv=none;
        d=google.com; s=arc-20240605;
        b=Z8YAUexsbUEgfFqFLJl+altx8ec7iu0tPHSqihjx6jjRt6d7Ny1fHhDdqNVf/WKU4w
         J9zNuIkf3VbBSj315wBKJ/L1DUrdlZgj386qyb3Hx/ycEql/SzYTRuv+7EmnWQdx6kN1
         NA0za/7g8cvDhD8HU45DXFIUvksPBGJoTJrh/F0Z7/+jYpiTn4iUDLRFZzq8F/9tWfJr
         LAom2r20Uq2dQQvn7YewASioxBpb4b/hwPpgyckLVMukfuyeDKhRtmTKPTyYFa+ZUZJe
         xf8uP8Z0qeHI2G21n8JdRWsswc7OMqGPdCIN/OFIKCOQk3K2nKsXC8WSW1cg3oZx1vL1
         zSwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o9bs+Ht8G4EwUkix0oJqONw0G8EjLC3MyIbQ69wavOs=;
        fh=9AXXFJrXyYtXJ59Mo1u2Wtn6CZR7oPhJlQW7M3Zy2Xw=;
        b=b6oPn0KN15SYv1HBkAtUpeHRv/aFGvNcDBLnsZ6Rzx+gYQSlFPT8ria0txddCc9mbd
         OvUeBhRVpur8+Yeqy/dXJw5dPKM6BJ4QYsZxsTyb2Od2GsOan8Q6DafQ025qK5K256sP
         xkl/eN/ISozJqMqPTxBiC1Tjmb9R4rQZuMXI+OO9h/mJJl2qJc8LycKQIoHKf9jtczIw
         LRnRJzsBtbu890VV3a6c6YKyNFL3k6ZnYkQWjoyc0IGIOuH/qOI8F1ARoTAFkU/NQ1yl
         EbFlclZJt3HQ1TAMh3Zv2Ez1vKaJqolJE0Lr8O8fKYVidw04EIogP5knmlEwvqE4xPSV
         Mhhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771505038; x=1772109838; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o9bs+Ht8G4EwUkix0oJqONw0G8EjLC3MyIbQ69wavOs=;
        b=y2XdxYxl5B3qEvIH/7EiyUej4zu02zEh9V+uDaCvJARejtyhqCZB8IMShpk9DVW4yg
         DTY+BbcwGWxPF5A4vAA3CZdXqDijVHjcjqmrzK45AiqlGN1BaKNePYguDXF6K9t/X9wI
         siW+NqVc+3yFrf5NvuIj3giYLezlvipPZWL53de5kU/mYRkiOEJX5yGiuvIUFAgjSrkJ
         DCYe77MNFT+sBHoglLREmJpBgpDHFrcfpTqkwuhBuUisth9R9C/dsWdbNnPB8QTh8+/B
         JAuqbx+v247CdBrVHzMIfB7U43HXT4ikfSJpeQ+wEzdYYmP7KAS5KmpLCz3Gc32hMh/q
         Fe9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771505038; x=1772109838;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9bs+Ht8G4EwUkix0oJqONw0G8EjLC3MyIbQ69wavOs=;
        b=W945wCtgaW+K1rEKfprTKy7WEeziZKX+aEU0aoKd7KK8TSqpNyG4ctU1mgPXQBqRmj
         puKV5wR/bySjafFFIs6wxMspQYa2QtXH/ouSbTw/HfIFVWN2gOUtOEZch1KLgSJSqZmM
         6gwrDNPo5XEUnvl6XKB1A/P9qR8DtfSXQoGAB+8XGlCl08cafbgw8oHSiW7rHxjgtxHq
         xkQL7g3sYrrzXo2r2Sn8MjxVIaANRi9gfFV9U0U3JtNE/V9RkGTMh+upN0+RL/o/KNyT
         zHXOUGuzpZ7LbggTCMvPigICR1uer5xXATzLMvspOtpjgXEAGNLK66KhyCzbe9HT1ZcS
         gu8g==
X-Forwarded-Encrypted: i=1; AJvYcCUZ7T+PU4xlmkv6gA1FOgxJ8WyGiSKgfYMZMm4lUyAQ777Am/fmKIZSPJLvAZDgBKyNnpMF3014zHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgR/yaUa4zeU1c2Vhn7s6+bJvEFq8NZHD1aiUNAtL+BRuH22yC
	GZEXXc8clxKzcflCBbI3vaDVoxjcyaz4ifjeaBCkUCDQE5FBb2r7L9S4aegTbLc+QwEJVugjBGk
	pWXx52B81FBZlSyPTYVzDJg73O/FsB4TqHBYWSc2q
X-Gm-Gg: AZuq6aK4Yu2wj3jWFC0x+CV4uyjytgEd5NAYZJYKGoiSawX4YnzSDgQwy/tF9wnbJbJ
	qAzORR8kNXn1VOhvU7rYPGM3rsZcb0mUP4yJGNjR7h1Yzj0V69Y5rkrRL5mGge9xCtG5+t9jBJX
	XcLL6nmxOtF927barL5tklL5GRz7aSs2BCnqx/7kHaFT879I8Yrr9W1olyYyLTTi0dcr4QxPaIm
	6KZ8V7rUeEZRgWwruBqYen96rLpm7uMaZ35PbRk016L3pcjx0Gu9B16AD7aSzl9NDT/BZ8+hRWt
	BktRJvDV
X-Received: by 2002:ac8:7f0c:0:b0:501:4539:c81 with SMTP id
 d75a77b69052e-506f1dbd2e8mr6722271cf.2.1771505037357; Thu, 19 Feb 2026
 04:43:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1770071243.git.ackerleytng@google.com> <86ad28b767524e1e654b9c960e39ca8bfb24c114.1770071243.git.ackerleytng@google.com>
 <CAEvNRgFMNywpDRr+WeNsVj=MnsbhZp9H3j0QRDo_eOP+kGCNJw@mail.gmail.com>
In-Reply-To: <CAEvNRgFMNywpDRr+WeNsVj=MnsbhZp9H3j0QRDo_eOP+kGCNJw@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 19 Feb 2026 12:43:20 +0000
X-Gm-Features: AaiRm52i2AVuoNuRooDCBFkBdqWWQyvSpL3Y8tHflFey7_du661FzMtD72y3RC4
Message-ID: <CA+EHjTwax_DW58a-hQ=TtsqbjTbBDBDeGvkL1fcDOnY4B-SjeQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 09/37] KVM: guest_memfd: Add support for KVM_SET_MEMORY_ATTRIBUTES2
To: Ackerley Tng <ackerleytng@google.com>
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, bp@alien8.de, 
	brauner@kernel.org, chao.p.peng@intel.com, chao.p.peng@linux.intel.com, 
	chenhuacai@kernel.org, corbet@lwn.net, dave.hansen@linux.intel.com, 
	david@kernel.org, hpa@zytor.com, ira.weiny@intel.com, jgg@nvidia.com, 
	jmattson@google.com, jroedel@suse.de, jthoughton@google.com, 
	maobibo@loongson.cn, mathieu.desnoyers@efficios.com, maz@kernel.org, 
	mhiramat@kernel.org, michael.roth@amd.com, mingo@redhat.com, 
	mlevitsk@redhat.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, prsampat@amd.com, qperret@google.com, 
	ricarkol@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, seanjc@google.com, shivankg@amd.com, shuah@kernel.org, 
	steven.price@arm.com, tglx@linutronix.de, vannapurve@google.com, 
	vbabka@suse.cz, willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi Ackerley,

Sorry, but I completely missed this!

[...snip...]

> 4. guest_memfd ioctl flag
>    SET_MEMORY_ATTRIBUTES2_FLAG_PRESERVE_CONTENTS. -EINVAL if kernel and
>    vendor don't support content preservation
>
> Specifying a flag to choose whether content should be preserved at
> conversion-time is the current best suggestion.
>
> What does the rest of the community think of a conversion ioctl flag to
> choose whether to preserve memory contents on conversion?
>
> Fuad, I think you also made a related comment on an earlier internal
> version we were working on. What do you/pKVM think?

Introducing PRESERVE_CONTENTS seems like the correct architectural
approach to me. pKVM fully supports requiring the PRESERVE_CONTENTS
flag on every conversion where data retention is expected. As you
know, pKVM operates at EL2 with control over Stage-2 page tables, so
we intrinsically support in-place state transitions. Requiring the VMM
to explicitly pass this flag when injecting payloads ensures we have
explicit userspace intent without artificially restricting pKVM's
capabilities.

If userspace omits the PRESERVE_CONTENTS flag, KVM must zero the page
contents in software and proceed. Returning -EINVAL would be incorrect
because it would make the flag mandatory, eliminating userspace's
ability to request clean-slate, destructive conversions when needed.
Additionally, software zeroing ensures deterministic behavior across
pKVM, TDX, and SNP. The guest is guaranteed a clean page, isolating
the KVM uAPI from micro-architectural data destruction nuances.

Cheers,
/fuad
