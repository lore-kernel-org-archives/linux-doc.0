Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24F436212B
	for <linux-doc@vger.kernel.org>; Thu,  5 Feb 2026 08:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770279861; cv=none; b=dBT6CNL8wlOYHyjjtnPQQphAK2E5yG7aBI3PcohlWG1zfG7ShMGLjE2OlRfFQHf2x//VJaFMLrwK5+rBRpang6/Syy2nbHU3yZF7pWd86+YXD0My3VMzqztxj53+RJr9mvbJsLLNbqiCaRWWjlBN/a+Rn9iQ+4/MzHUCEIREKjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770279861; c=relaxed/simple;
	bh=vqpnc3K85d/c99z+Ag/IV7Yuz3e2NI7EtfIZeXL20sg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HlUgdJtgZzivvvidPn3uxm4Nm1enax1TPJhDSCiE0towOxgpriES6AU1sOX/FOPSdbutyN0u6tAGre4aGu4MMyrAr2GDltCE8Ls1tbqm1wdwevd/9IRMG66dCJGSreLwbXEqsUyLbIWQ3uecSWMF0cxtrNfuvRRqztGd+iJIHQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wc/OWfcb; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wc/OWfcb"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-483101623e9so5850755e9.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Feb 2026 00:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770279859; x=1770884659; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dKMEdNQFuTrvbn5AhEjrTHLTqyukv+S/YU3zyRF55AQ=;
        b=Wc/OWfcbjn8TSDOAjEokkzSAoSBo/aVZqAdYyWx0SXqauxjthjGWHFpVGZEy0gue7X
         ZBCZzTkdZHzQc1qJmNk22z8g4IueKaxCxP9Ie/zsvjvgIC/fCH4Ri0BPEdKyz+6DTedD
         44HtE9sbr9rI3aHf02+ckpmqKfw1ngO6RChPURBaWy1nsgfY/I+96GhyOm7rBrEr9EEk
         /sFVXYlKlcPgmA4ac5duV7EnZ6qjyRVoVvNUKOvxMGdMoAcda/2+CZLqKGFvbLBL9w4A
         4tl8dtS0lGfmupTP/f4/dcDU44rm7MLxT8iB7Uki/yQqZvvnggOxtiO39He7QRSyy2E9
         NSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770279859; x=1770884659;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dKMEdNQFuTrvbn5AhEjrTHLTqyukv+S/YU3zyRF55AQ=;
        b=TsKEdQEWWZpshdUjnsQaFjUkowlReSlV+3eRvLbJYTyGz+TUi/fvf9HNlKaK/AcfvQ
         VLYFCZidfRWJAmdUqReJAFUAG6wo2AVlB3L9hs5aEu3FNsPAjZmVUDEKfU715ZYNNLzu
         vqDKB73bvakn+xYJe+DhxlDlMAs4qrn136OeAATctIuwUoR3OimqhJ5wfmQfdnciIJA5
         Heb7CflYaEIofiYKZs24KonF8i2oT++mQr37oGrUdftKR9nms2dsYC7dXtGO5SuSlm1h
         5Jyn+UQ5vld5qcz77TSIeDIXXwnBK6Zvt3l6r7NwADIXFHLEWIS9o7dIASJi5jk0c/XC
         hARw==
X-Forwarded-Encrypted: i=1; AJvYcCWIg26xMVK4UM3nIZJD2ze8qvJSnRVXpcOeLN9mJnFQ3Wt2VCg1UTcYpo8/JS7XCZZbh5bXxVFXrl4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0uDZ6LXkw6tdMxK8Yl9A2CKCTGj8pNLF2XdXpPgD16MC17g8K
	cajxggDD2DHkaRzPAcQbBzyJBN1fnr20YLZwUcRsbB8frWOj2kHIoqUn4/JugxbrtEfsE4zrcR8
	eCxAbNQZsAKpUdPB4Ig==
X-Received: from wmjq15.prod.google.com ([2002:a7b:ce8f:0:b0:47e:dc0c:276f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8715:b0:47e:e2ec:995b with SMTP id 5b1f17b1804b1-4830e93033cmr80990595e9.9.1770279859237;
 Thu, 05 Feb 2026 00:24:19 -0800 (PST)
Date: Thu, 5 Feb 2026 08:24:18 +0000
In-Reply-To: <20260204210125.613350-2-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260204210125.613350-1-mkchauras@gmail.com> <20260204210125.613350-2-mkchauras@gmail.com>
Message-ID: <aYRTsvEBIxc4ru2F@google.com>
Subject: Re: [PATCH V2 1/3] powerpc/jump_label: adjust inline asm to be consistent
From: Alice Ryhl <aliceryhl@google.com>
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"

On Thu, Feb 05, 2026 at 02:31:23AM +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> Added support for a new macro ARCH_STATIC_BRANCH_ASM in powerpc
> to avoid duplication of inline asm between C and Rust. This is
> inline with commit aecaf181651c '("jump_label: adjust inline asm to be consistent")'
> 
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

