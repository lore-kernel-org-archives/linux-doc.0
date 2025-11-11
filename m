Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADA2277C86
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 09:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762853992; cv=none; b=MbI/KQLNqLHC7wZ7zadZqHal1X0d6qZ51FVEC00iuw7+CqAP64ZWkajn3GCBSRFj2O/n8LXR55L75uwQCutqAV2lb6kTLBEU9Z/TYAy7dHG7uczauelJSYfNUZnJsHIjoesBAbhQqmUUtAo8trZYmGuZ5KSMMivxfUii9p+D37U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762853992; c=relaxed/simple;
	bh=0qHk353sMNXNO0DfdJ24OLoqMz+VA+2bTVAiXM7RnOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TtB5XskgMiuFHKeEYTxVg/ZQVT87qhDmNEkPYakgy0oyH9lPxrZ1ErY6re5QYRyyF1ZVRXTkBMPejBVazmJJTNC0bG4FHHypsd3gXgn7P8gC4c/g4UVPl1B8RqMkupf8XZT8HqQ1fsf0wAkySSQfNKS9/OfX2sUAhqhse9T9WqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CfTiTPu9; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CfTiTPu9"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-340e525487eso2701310a91.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 01:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762853991; x=1763458791; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=x27CBOBuvs19lllL/4Ne+a54Yz+5/uzP3YpUzWY+JnY=;
        b=CfTiTPu9uAzZIje6WtImbQO8ZfKqsg9T7dcF+E59e42zKjW861RFYZUQzZj0+ciUaR
         DLzB9ssxsP5qzGnkqP45MAYLdCNf17TqlYtqDZ3fCjCWgihnJqsDQZDcfRSQ6+rIpJcE
         BXNyyoYBNyJ0GhiNM5eXjjX/a0xrY0ucZj3yFsJb8EOWFYODEQJoexbVMzqRXgU0NDTT
         rL3U4RRH71crF5rl2y3Ut8G3KOsjc3jEjX/yNmFbQ+0QJ5qApluaM4PiA9o9Ioq0oiRX
         pdcmAAU51jTJJyFZw2Ji5Rc08/AvR1L90fAsAmMcGBi/XEeg4cjDJRbT8nhn8iQvAiOC
         bo5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853991; x=1763458791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x27CBOBuvs19lllL/4Ne+a54Yz+5/uzP3YpUzWY+JnY=;
        b=D3USNCut2x9IzQozso8xntrkVlmwLxftIrGZKLEiBYr8UaWXNdBARSwKs9STLclPFC
         4/M93ENs1VLFhar/TZhVFeT3jBHAbOlj1xh53qxj3Ta6Fe+ZNBxjEIEzxlMczXGMRrq1
         nJXDejVV2T65YZVt8PmSHIxGiP0oTA8DB1XgaqWmyvu0bjx/+ZfD6By/padM2LjdjSLp
         /bieYVpAYftscUjGnK/mPcQnHODVSXEruQ+XRxj9K9vr85MJI7jb2jRVTpNw0dfgyWuD
         pRrKPAUZ8Fl6KI0Hx5S79mAvWZ8qNHlmWUB2UgMD/6/FqXGqfEIWNFzEplLqs+lWSCLg
         eSCg==
X-Forwarded-Encrypted: i=1; AJvYcCUE2wLdFX/LEpNXqRKfbzoIFI0f80AvMFWL88Gohi0U0zIJuy/YlNB8BlMI5l3QbR13+p0tlkvZZos=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4L6idpKGVXaYrcN9L4Uja7o3ugjYlaQB4iNjYI5Li5MQ/Mtnn
	AOw1vi0saUAXt6bzKe9rVy8WPB0mooqltXbsYyMFdak3n3bJOTWxfCmX3lYmK7saUpnCW8ckdVY
	LFQ1apcuERJM+/Qw/2XLFQMVO9nwcb8xo++v+NBGm
X-Gm-Gg: ASbGncvH96vUpF5qKB2DDBZfOmWpUvcv6gdLH8SQi4U05BoyEkw4BmAGV8h4FW+4FW9
	Xj2BFWlhxmUzessPt/04IoRU4KFl74y1wmli6wWOQhwLhu2V5Ukss/pDFVjsKh2BwONPBywJInL
	N2H3RoV7joxEPnSttMQDhdyV6GWHcKtBbJQKPWWCJ/0X9RlbZgS5zY7O5jQQHiDYRUiPkV858fL
	DqhGG3DkRSkG3iCrpIeHzaeiBISKMWhD/anmwwmork3V0MUEP2soF4Ce1a29+5uWKTY8brfCTrN
	i131D0I3Nwe4LeG+IjrzRpCksjTKtLr03XL+
X-Google-Smtp-Source: AGHT+IHbYtcp4TEm3YWuggGsZDtmzQmO+Esj4ot5UyBq5O3ykfRy1t7VIIRByVPx+YeUvhQm6/mmmHJjCQ5y0jFctOY=
X-Received: by 2002:a17:90b:2f8b:b0:340:ad5e:c9 with SMTP id
 98e67ed59e1d1-3436cb9f0a4mr17438597a91.16.1762853990547; Tue, 11 Nov 2025
 01:39:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <ab71a0af700c8b83b51a7174fb6fd297e9b5f1ee.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <ab71a0af700c8b83b51a7174fb6fd297e9b5f1ee.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:39:12 +0100
X-Gm-Features: AWmQ_bn-DpseVZlfA_JkC1KeMe_i9gWzENoYdJOcpoJ15BxyTxVZhbSiKbweC94
Message-ID: <CAG_fn=XyQ5Mc_ZvsibN4K0r70xfDAkhPqUJgtojVRcgTt-q0WQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/18] kasan: sw_tags: Use arithmetic shift for shadow computation
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, 
	kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, 
	ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, 
	morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, 
	baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, 
	wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, 
	fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, 
	ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, 
	brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, 
	mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, 
	thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, 
	jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, 
	mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, 
	vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, 
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, 
	ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, 
	maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, 
	rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index b00849ea8ffd..952ade776e51 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -61,8 +61,14 @@ int kasan_populate_early_shadow(const void *shadow_start,
>  #ifndef kasan_mem_to_shadow
>  static inline void *kasan_mem_to_shadow(const void *addr)
>  {
> -       return (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT)
> -               + KASAN_SHADOW_OFFSET;
> +       void *scaled;
> +
> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
> +               scaled = (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT);
> +       else
> +               scaled = (void *)((long)addr >> KASAN_SHADOW_SCALE_SHIFT);
> +
> +       return KASAN_SHADOW_OFFSET + scaled;
>  }
>  #endif

As Marco pointed out, this part is reverted in Patch 17. Any reason to do that?
