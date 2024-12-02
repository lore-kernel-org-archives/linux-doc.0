Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29B01DDC39
	for <linux-doc@vger.kernel.org>; Mon,  2 Dec 2024 18:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733164569; cv=none; b=ULnuSO+N9bPMVgbntVlgZ+T++SA6hdD/pVBPlgn2FnPF5KNmlqnq1mOEiataLkvQca3cvJY6G9zz0O/ZLEZFIgiljqkUUBxip1XYP8wK+LWpRz9mpQQHppj3MdYYZRafh5qpWgF7JIigqoKw2MZKtdoO8bvXEqAhgTA03d3lX0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733164569; c=relaxed/simple;
	bh=JhPRv+gPDMTF92gaKR88jFjruNF+A0nmJtg8odH4PDk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p7ZoumA4NhhGrYqY6TwIVUnYqjWTw9ToCGBsFu/xaOGcomE7mCS7UmvVqHqr42ugsnoQpGno2aNfU2uP9+ZMmEwWlYFXLIwcaGl/5DHWquYqk9TbrIwNCP0M36+wLlJAh9h4VncEXooCmCOA3X7olCuTWo2CKFUBWHFhiPt9dtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GwPTX+we; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GwPTX+we"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7250863ae6dso4403195b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Dec 2024 10:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733164567; x=1733769367; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dmhoE4cYt7rjQRHzT+iWiPMuGFQ3/gi9W/Su2Z8nl8A=;
        b=GwPTX+wexZa1w2E7LcIVqu4jNea4h97hp1wyVyQ0WpJvj/kpvfIIguj4rrmo/tNd9q
         LIlwE0Wz/ce9Jn0xyKz1krRy55+5c56p/A5/tShp3shIoQ7jKlLkGApmhC29MCWpljvR
         HptgIyL75BYEeoPosOw+AUtdI0lozuzCFg56Rv7/Nj2CaCfgNeiLe1pGYbOYhFbdZ8ak
         k8K67YLFtvNYOcynYQu1qGN31tMaAck6gLAEb/PYv00B/Cw6y8soyRBXaDOt9nYseJ/o
         JN6lRifwmGrEhGzzz6BYLG7UW6Mv0y49oYmTqFFtGD5xkI7Ru3tRizHTvOFb6QuU24qw
         Bx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733164567; x=1733769367;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dmhoE4cYt7rjQRHzT+iWiPMuGFQ3/gi9W/Su2Z8nl8A=;
        b=IxRL7nUy52KclRHjRB/CPVKxw4Al1mudJWjVRrXZF0QY61DIHVAX0jvoNMhc3Ho48g
         uoJc9+gAy2ZZZ6/xzy1xhG1gfK1nDfnaIZ68erLNyj9OnIsk/GDxRskpGoV9U7uXYXrr
         t9ngp+uvWVyHiX4cHbo9kxnKypIwE9QjezkWqnCY0tJRb6pvdWCSBr1gg8XITGbqBleX
         gZq7MDDGidxksOInfYNle8iqoPK/M4k1HgA/SVKTLloVA9DVhpXWJaeMCZCK7T7EnhP9
         3Xq2aJTw+h59ZW4ir5ALGfVeaAT4oVkg/OOUjkYq4imSB0KoC6ZTJPHvGR89bHrnnadY
         OvPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgKMsDn6PKBK8iC5OkYLOZaBUOImXroRn7mrAc+BulLBbOC+ZrBuF9UZ+8NJz6QcIyAc1fGlVLWS0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yywu9QfDtNB16JuXRwr3nO8AgaSH2vfIQ+11315Sgy16w6Ft/+i
	T4tWtEbARraMai03ZNg7qXzozqnotstcqcfikBSxpcIOowFryQBvDo+fGDuwh5aMHgovfgMz0PZ
	LEA==
X-Google-Smtp-Source: AGHT+IG+yibGcr3UBT8GYMqK9RUzkIylDwqwGeEVnrlV5H+vn+hjSd3rZQdwVZ+U5jysAAzoOzzga9AddC8=
X-Received: from pjbsw8.prod.google.com ([2002:a17:90b:2c88:b0:2e0:915d:d594])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c07:b0:2ee:ab29:1a63
 with SMTP id 98e67ed59e1d1-2eeab291d40mr9629060a91.3.1733164567155; Mon, 02
 Dec 2024 10:36:07 -0800 (PST)
Date: Mon, 2 Dec 2024 10:36:05 -0800
In-Reply-To: <0dd91e39-c4b7-4740-b469-6f71e48b72de@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1732219175.git.jpoimboe@kernel.org> <20241128132834.15126-1-amit@kernel.org>
 <20241128132834.15126-2-amit@kernel.org> <7222b969-30a8-42de-b2ca-601f6d1b03cd@intel.com>
 <4601ca077c95393837eb40909c941a4d67bb04dd.camel@kernel.org> <0dd91e39-c4b7-4740-b469-6f71e48b72de@intel.com>
Message-ID: <Z03-FSa6nvVbFjwc@google.com>
Subject: Re: [RFC PATCH v3 1/2] x86: cpu/bugs: add AMD ERAPS support; hardware
 flushes RSB
From: Sean Christopherson <seanjc@google.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Amit Shah <amit@kernel.org>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	x86@kernel.org, linux-doc@vger.kernel.org, thomas.lendacky@amd.com, 
	bp@alien8.de, tglx@linutronix.de, peterz@infradead.org, jpoimboe@kernel.org, 
	pawan.kumar.gupta@linux.intel.com, corbet@lwn.net, mingo@redhat.com, 
	dave.hansen@linux.intel.com, hpa@zytor.com, pbonzini@redhat.com, 
	daniel.sneddon@linux.intel.com, kai.huang@intel.com, sandipan.das@amd.com, 
	boris.ostrovsky@oracle.com, Babu.Moger@amd.com, david.kaplan@amd.com, 
	dwmw@amazon.co.uk, andrew.cooper3@citrix.com, Amit Shah <Amit.Shah@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Dec 02, 2024, Dave Hansen wrote:
> On 12/2/24 10:09, Amit Shah wrote:
> > I can still include the summary of the discussion in this patch - I
> > just feel it isn't necessary with the rework.
> 
> It's necessary.
> 
> There's a new hardware feature. You want it to replace a software
> sequence in certain situations. You have to make an actual, coherent
> argument argument as to why the hardware feature is a suitable replacement.
> 
> For instance (and I'm pretty sure we've gone over this more than once),
> the changelog here still makes the claim that a "context switch" and a
> "mov-to-CR3" are the same thing.

+1000.  I want a crisp, precise description of the actual hardware behavior, so
that KVM can do the right thing when virtualizing ERAPS.
