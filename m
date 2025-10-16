Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B46B2FDC4E
	for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 08:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760603306; cv=none; b=LWjR56qfQs1eupBy8H6Ei6xIMLee5bM57T9tkZtmkGCW/iXKDrtUPPeo92hsZaX+ckU6+2hjRNymd1GbxwsEc+FSVJ7K/2GHQ5CQU5rf7j2UJPFCAjv9KemlfrkInZUMxLTcMwoYuRl95GeQGt17iSfCK1VKemSpD7BxizTfG7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760603306; c=relaxed/simple;
	bh=J07mpHl21TfE9t4lZeUyE3RSzcFd2BOmMRpfQEgFbA8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SYAHLj0AfT5dxBPJ4Ppn/t1e4MDpSzOekmP7Xuv4r7qfbooxLMjq+IK8yK/YeR87mzz4Rm5Jvs4GzcqccDAg6NTdypWT6tsHEncm84rvKC9K/xYV5h+yV6M+c17SawxFR57AhH6x7N8xpiMk54CkxVgPSrD5RtwfOYp65NM+Z/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UqpSM0/e; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UqpSM0/e"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6344e493258so473949a12.2
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 01:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760603303; x=1761208103; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JNmsng+cg2p1PdPlY0IWVGfCJ8y/Q3JJAW6eqsqnHZs=;
        b=UqpSM0/ecihKg0k2HaFS/vXOoFKmZFtC6xw8cxSOh2c1LdTqRLtKc/i+6WwAiLmpjY
         6lUR7SB0StYuDcYb7VelodXhRpMSd71GNqg0Jn4/qgHY0bt9Xfvisn+EchtRCgWwMeIl
         0WToLe8z2/bK4rJ/MGQNEIE/vIC6NRk5jXO2GJ52XZqNUUU4Ct3mOlIdy37+8+SnFWp6
         gpkegEGilFJSgrpRsuFUcV5zbyzb5/Lab5U36oFASNrDvESJGOTRgJrcO0nbAUF9q5UJ
         E9EjlusI008o8clLgBqmXJG7H5durbDGdmj2MwtyL45VxodWwpBunxcHeKFV9zYnxa6W
         9Ajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760603303; x=1761208103;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JNmsng+cg2p1PdPlY0IWVGfCJ8y/Q3JJAW6eqsqnHZs=;
        b=ndb23AUNJ4c2RTeWALxl0x35DZqHsgp49IJKekpHfm2gCnsBQzGe6rcBu8c6CG69+b
         ni49XvGay6pQzH0cAYbRB2XcqAC7l0PDMztZKWqTuORHWxNTNTtRfAeAOwn1uSTXw4fc
         RlYRsbzF/Mcu//e6EOSwFk+zIBkyC8fjb0iWn6BFZ2iyLkWNnc/ViReVHtHlj8qa8dHT
         sjtwQ+OJa4HDBCgX2P4oiF5WgvC+FycW1CLZ6WK+NT55nLlioP3M5e3ImE67lgfk4CGr
         0dOPiYnEQiX97hxz6dgo6ExiRHOS2qZEPhARS+YWiAzqLm8p4c4/1aXVeqstTrejxtxL
         JGDA==
X-Forwarded-Encrypted: i=1; AJvYcCWilwCfkcZEcPKbH6Xkce0R7M7FSH01HyAvwQ5xib42cx/cLJSyDH2ObB70o/xqj3dkRlHjVzFgg/s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY9zoCSyf1Bei1QHet54fwqRm5Lz4GWjqCKlbk2YgoAIlU2ZgC
	XBP6/1nIH4IV1WQ5VwgYlhuNpkrsrlzucYuvGDLsMGxhlsjUBxbNJ70DUFEKSGxbkmltAkTormW
	fAsJWadmh+66ISw==
X-Google-Smtp-Source: AGHT+IGgIfWELGcS8CM792Oeson7+h2PhNJbcALhBReQFlhM1RtE+mvU/D5YUvWFzkPTbgP7ct7PeSdqoiYKbw==
X-Received: from edtq8.prod.google.com ([2002:aa7:cc08:0:b0:636:7d5e:f1f0])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:b28:b0:634:6d87:1d28 with SMTP id 4fb4d7f45d1cf-639d5c74a9fmr20973936a12.35.1760603303299;
 Thu, 16 Oct 2025 01:28:23 -0700 (PDT)
Date: Thu, 16 Oct 2025 08:28:22 +0000
In-Reply-To: <z5zeptd2yij7e435u4xgdqsvnqf6hwjkwixajlh3u4nggp6gej@ej743d4adbb3>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251015-l1d-flush-doc-v1-0-f8cefea3f2f2@google.com>
 <20251015-l1d-flush-doc-v1-1-f8cefea3f2f2@google.com> <202510151438.DA62BB421@keescook>
 <z5zeptd2yij7e435u4xgdqsvnqf6hwjkwixajlh3u4nggp6gej@ej743d4adbb3>
X-Mailer: aerc 0.21.0
Message-ID: <DDJLS7DZYDFW.XKPRC42PXW8I@google.com>
Subject: Re: [PATCH 1/2] Documentation: clarify PR_SPEC_L1D_FLUSH
From: Brendan Jackman <jackmanb@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Kees Cook <kees@kernel.org>
Cc: Brendan Jackman <jackmanb@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Balbir Singh <sblbir@amazon.com>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed Oct 15, 2025 at 11:42 PM UTC, Josh Poimboeuf wrote:
> On Wed, Oct 15, 2025 at 02:41:18PM -0700, Kees Cook wrote:
>> On Wed, Oct 15, 2025 at 05:02:05PM +0000, Brendan Jackman wrote:
>> > For PR_SPEC_STORE_BYPASS and PR_SPEC_INDIRECT_BRANCH, PR_SPEC_DISABLE
>> > means "disable the speculation bug" i.e. "enable the mitigation".
>> > 
>> > For PR_SPEC_L1D_FLUSH, PR_SPEC_DISABLE means "disable the mitigation".
>> > This is not obvious, so document it.
>> 
>> The only thing I can find in Debian Code Search that actually uses
>> PR_SPEC_L1D_FLUSH is stress-ng, and it literally just toggles it before
>> restoring it:
>> https://sources.debian.org/src/stress-ng/0.19.05-1/stress-prctl.c?hl=893#L893
>> 
>> I wonder if we should just fix the prctl to match the existing
>> behaviors?
>
> This feature has existed for almost 5 years, I don't think we can just
> reverse the functionality like that?  There could be proprietary users
> out there (e.g., cloud companies).

Yeah I'm with Josh on this one. I would guess these 3 situations are
about equally likely:

1. Nobody uses this flag for security.

2. People use it, and they are not getting the security properties they
   expect.

3. People do, but they know the meaning of the flag because either they
   read the kernel code (in my experience at Google it's pretty typical
   for security analysts to do this, they are smart and rigorous) or got
   suspicious performance numbers (I've also seen this at Google, IIRC
   this was how we found out about a bug in the Retbleed mitigations).
   Or, it could be the users are working on the same principle as the
   author/reviewers of the patch and they expected the current behaviour
   in the first place.

I think we have to privilege the third case here. Changing the behaviour
is gonna be extremely inconvenient for anyone depending on the current
one (if they even find out about it) so I think we'd have to introduce
a new variant of the API or something. That doesn't seem worth it, I
think the chance of anyone actually adopting the new API is pretty low.
