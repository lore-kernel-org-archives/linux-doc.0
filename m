Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB340217727
	for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 11:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739791271; cv=none; b=q2377MVkUK35ZOYn36ZH7ccjuQbcuTaDyidNzI9KlatGYNmdROvAL4TnP3IXGETTuvDz1uqT4FDytNL6Dmww6ZEQ5gzo9upcv60Lc1Cm8BkJjb79H3DaGCNN9PYgAWphI5oO18UQozH4eLD5py154RkqFMzxjZqwiXTF09v0YHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739791271; c=relaxed/simple;
	bh=9fD49zca/a7CY/GAfkZOjSfYZ7J1TiWSw9PmjLL/NMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lkKuSsJMHxmK7eLJcPucwpYrtbLYarlJsCjMq29PGHSIwPxmbglt6uK6qdJ41xVImPrpSpjfaC0tGsClRqXk6j99I0qCR7YxUfDoFbapEe1exc6P4d1GwNJ067aAwmmS3trIcIF1jUBQ3lhTcabzzLkRS6miA33zcJpeWtNDzLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FRWMIX1n; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FRWMIX1n"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-471c9947bb5so465501cf.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 03:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739791269; x=1740396069; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c/F61nasiGt/oZBal4vGoQato7Sw7jl8Q+DNm376G/k=;
        b=FRWMIX1ngUtEkpOwaXzt18sWJ4XQqdFaK9X59MRz91+M21bAp1jNEna0mVu85UT+Bv
         bNF/pRFi66CqmbetnsKGcSB6WlGw5O9GmFIqWHsB0FlZ5lNa8fxYJsHlob8MPC1+58Q4
         YSrEby7OsTXEctKp5i3/8l++xlotpz2ZytCj/bC/PX9ypv7xJS5ixbLZEKDn7kIiBR+C
         Lk74hiBz8Gq2o/aifEmlrmh598/bD/EfXluldZ6kSQXGI7dpgeHYPjDKWqVM24k4z192
         DrSfDm1BKAIew4QUCXRMcrfK5ujDsnxGsGmlRLkABQHCaNxSTOyT4eI3cTkNARE4gK6E
         4GJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739791269; x=1740396069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/F61nasiGt/oZBal4vGoQato7Sw7jl8Q+DNm376G/k=;
        b=AoQoP8XHhMY81bgQS4ex7yRcVfUrt9sHjBaWvCKzZaSBkXHKC79HaKgf7JCCYws00b
         0b+i3C79iBswv6mwsIonk4X9y7T8y7hLFLow3TabjbikjovXY82Smv4Dyp73FgyLGN57
         31Xm7WFF0KS7ANnrbr9o5Snjh2dv9uTnDdQWu9aAOhlIY1IJE6/M7A+hC8w//03CGyB5
         qrfH/62y2FbY9oYpqgVqK0tXzGMFIpWW8Qc7udw3Kh8cE2pvC4ytMSu5bQBGFer3PuJd
         BCUXLY/LsnwZhBETAbqknAiz6TL+t8xno/yToOXHt8p0qiowHQke35qZc4Vv6q7nVa33
         qHbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoc3UzHONWm+w9QaSHqYkiAgHl36rmqYyJup3Oharutum+wu41x3bxiYklge8QCs1RC9DuJZ86vmU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoF+Zbz/sY3eA0yX1yh7OeftcDjkqNxgw/B6KBsUrzhRj/hb8o
	6LwSKSpqPWdiIZ0B8bLT9UtYzCLl2kHu3biS38vhCMH74lL+bmU3G6bEgfUZYv6QCFlp3/So2TW
	ZYLVRoEZGDmppNXvyUJCvhCnAOVATBaS4NGHb
X-Gm-Gg: ASbGncuh6NfxqUA3Cui2EJuKfxbidWSUHvL6PM2PTRlSM+g5VP7qYsD4oZ6915N6zWk
	HEWbypqnQB6qqg1MgpGbeYC12RreNvERLL/kISGIqrv31hZtTtpvZ0uc72nTadg3qqyt3RGDzsU
	BkzZ8f7WYPikjk1w3JTgFeiMhirt4=
X-Google-Smtp-Source: AGHT+IEA1oHADje+ZqI4QhvdYoZ5pwlKb/TSeYiRyV0SvwPby3Andg0p/cEpbtOkmwEVn3yfGKPc8yk5Upi5XP7tuQs=
X-Received: by 2002:ac8:59ca:0:b0:471:92af:bf73 with SMTP id
 d75a77b69052e-471dc8f0171mr4982451cf.22.1739791268281; Mon, 17 Feb 2025
 03:21:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129-force-cpu-bug-v2-0-5637b337b443@google.com>
 <20250129-force-cpu-bug-v2-3-5637b337b443@google.com> <20250217111029.GIZ7MZJUGJRoeiScgn@fat_crate.local>
In-Reply-To: <20250217111029.GIZ7MZJUGJRoeiScgn@fat_crate.local>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 17 Feb 2025 12:20:56 +0100
X-Gm-Features: AWEUYZmUETjDhiEF2B1qzgoI8XTYa-MJljWmi_v2oHMRAAGbSdUt2z48cta-3uQ
Message-ID: <CA+i-1C2GF=5VE5Bfq_znG1nVU6K5orzhOohBatc64ghX7mW6FA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 3/3] x86/cpu: Enable modifying bug flags with {clear,set}puid
To: Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Feb 2025 at 12:10, Borislav Petkov <bp@alien8.de> wrote:
>
> >  extern const char * const x86_bug_flags[NBUGINTS*32];
> > +#define x86_bug_flag(flag) x86_bug_flags[flag]
>
> Why?

That's just for consistency with x86_cap_flag().

I don't remember seeing any reason why that indirection exists. Maybe
it's vestigial. Shall I just remove it?

To everything else: ack, thanks for the review.
