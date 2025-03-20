Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111E721C19E
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 23:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742513441; cv=none; b=uPjTY8Rl/8nOHnvv/n9qS7JA57xc1XKk4YKyIV1NDzg0gJJOd3CeB+LDCCNKD7OzyDHwsUPagarv7+UcuQYxdA1VwUHnHCF7aPNv/k83g9ASy1GNwspXImmDen1ZguWXnNjPN7yTCssZJdxO9AXlTYe38MNUAi0hdCHP+dolleE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742513441; c=relaxed/simple;
	bh=vU1k0Pwo0yGfw+XLBJ54G5KtBR0m8Nix50SWo7Z0ess=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BzLZwFytKp8SKFeTdOiezUxbX2YBZBkS0ZnNAfJ3w+1x4361wjofMOo0PA8aiEmGH9oIRP5brm3bSmQ4/6uZNTJN6YJ4+99yW283Eqrxq0rmeJBMEiB8douHmg+2FamMJZRszoDKH2EFCUThm6vveb4nhQheTaAeRu49XNPterg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NZ5o1/OB; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NZ5o1/OB"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff799be8f5so2253524a91.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 16:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742513439; x=1743118239; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xP/wBPgQrPgKUTmsFzSczlOv6V7nkKEHtL+ADvSLveg=;
        b=NZ5o1/OBOG+gp1UkFfm7k/pNhoZ7x6VXU2GNMWJA5EgXkXbjeTLVwx6DYSFLwgSJVe
         0mZy/kvQRRoUgCbIi9uyIVNkQtzMoyfcAbeh0yDTi5K1CqIWkwhRg0+qNrh7rE851YC1
         oulQO6bkLiERS0JTyWZ5n2VtZAafg+rXJgZ1KhXqvfyb0AB+USfBIYnHfEiO6AI+MKv2
         Hw4m4B17+bE9m1KHZnPYsNWmTHNN2ALN+mcXWviGOYU2p/pEYYoORiosiKZLLQOLu2gx
         BDGKeVtSSaJwNDosx9clRYVIwoTpYrD/W+2hUAsvgS66q1VnlFKdOuro4oLpMzlQ3jEv
         BW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742513439; x=1743118239;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xP/wBPgQrPgKUTmsFzSczlOv6V7nkKEHtL+ADvSLveg=;
        b=a+AK+ekT/h2ROuzMoWVhCOmkiXOa4a1Y65D1s+IZTtg8BeSfR+qlDctKYsoVUkSl4A
         2pLeWr23chiyMC9ivX3qDg9+MF6mRtP9SM01Gqv9N2VbCJ7lTHw6tyOX+E3ktdu/vVC4
         lBcdcC+QednTlCc7u1HEc5rvMPjVQ4kt/hxRVyR7enHLuURvd2Zu/7bMonJUJ6G+3Q/m
         0desCIPIVN/34hZnEz3n08hmTCflOUHSMbicFFuRsgKGnb8mRaqwyBLnBV2SOXwhBndX
         iYkbxaaQE8YmMKFRS8Tkq7YaFiIuLdWBTXBPJLFk34GzvbPMlMBum37UJXWUYI8S90Ik
         9i/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWaFGjvOGdqGPWAUQHM3IGQ05D1vjkii27nlqcT/SmzDKPrPfW4+zHtRO000T7zaNi+JB/K1CsB5gI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi8DoHARHXQt1z08GncgAEQEz3i8KFQzcA9afAWUYz2H2jXKQj
	TYPTo0Yx042XA/WtJDKlzsMWz94CHjCfCaTo7wBksW3qpUqxeu4KOdTgw7PovHj7Ivl5q163vSf
	KYpLR2IpGlzMqt95j4w==
X-Google-Smtp-Source: AGHT+IGbmtH1MERfzGXAl5vYkqkNbYTkv2EXQg2sVuptsp1X//5UG00UaPWxnKS/ywcODQ4038/Q7eALZzjdmIbU
X-Received: from pjbpw15.prod.google.com ([2002:a17:90b:278f:b0:2fc:11a0:c549])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:384c:b0:2fe:7fea:ca34 with SMTP id 98e67ed59e1d1-3030fefe329mr1442133a91.32.1742513439279;
 Thu, 20 Mar 2025 16:30:39 -0700 (PDT)
Date: Thu, 20 Mar 2025 16:29:56 -0700
In-Reply-To: <55a5e3f3-1b3f-469b-bde0-69abfff826e4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <55a5e3f3-1b3f-469b-bde0-69abfff826e4@kernel.org>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250320232956.327827-1-changyuanl@google.com>
Subject: Re: [PATCH v5 12/16] arm64: add KHO support
From: Changyuan Lyu <changyuanl@google.com>
To: krzk@kernel.org
Cc: akpm@linux-foundation.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, changyuanl@google.com, corbet@lwn.net, 
	dave.hansen@linux.intel.com, devicetree@vger.kernel.org, dwmw2@infradead.org, 
	ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, jgowans@amazon.com, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh+dt@kernel.org, robh@kernel.org, rostedt@goodmis.org, 
	rppt@kernel.org, saravanak@google.com, skinsburskii@linux.microsoft.com, 
	tglx@linutronix.de, thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi, Krzysztof

On Thu, Mar 20, 2025 at 08:13:24 +0100, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 20/03/2025 02:55, Changyuan Lyu wrote:
> >
> > +/**
> > + * early_init_dt_check_kho - Decode info required for kexec handover from DT
> > + */
> > +static void __init early_init_dt_check_kho(void)
> > +{
> > +	unsigned long node = chosen_node_offset;
> > +	u64 kho_start, scratch_start, scratch_size;
> > +	const __be32 *p;
> > +	int l;
> > +
> > +	if (!IS_ENABLED(CONFIG_KEXEC_HANDOVER) || (long)node < 0)
> > +		return;
> > +
> > +	p = of_get_flat_dt_prop(node, "linux,kho-fdt", &l);
>
>
> You are adding undocumented ABI for OF properties. That's not what was
> explained last time.

Thanks for the reminder! Sorry I missed [1].
I drafted a PR to add the documentation:
https://github.com/devicetree-org/dt-schema/pull/158 .

[1] https://lore.kernel.org/all/b1e59928-b2f4-47d4-87b8-424234c52f8d@kernel.org/

Best,
Changyuan
