Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B932DA74A
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 12:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783946208; cv=none; b=CYbkrq5DtW0F4OBF1ABqxeEh/rwScAd1rcaTdYgcn0oQuDkEsly+A9LJ8jA6uwC6G0V+017/iJbY0kzyszYGJLG1aFvqxjB9Xm255Q2dl8z0WyvVBIHgTFyOZmphDP4UeeDHepZA092SPA88gcYEXC2qRA1+HDQ9zYLGLkx+GP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783946208; c=relaxed/simple;
	bh=eP+6L9APW6Fk/DPuUcN47xss7LE2be5MSQjekTkQ5uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OFJ4KWsV3m7nBzaAfRCO4TfGrzZbsAV0zpumtHSPdteFtcSramFfhMkGqPafriR3GNIn9RyuSqKCwcKdFEb08KkjUk21doWuNGehIGDLySfXFJvghWVntWAbiyh7NHN+PZ46S/KM/CwSFJ4haBB5+nUfnCzviLNNvEG6NijEFSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1601d552a8so306180766b.2
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 05:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783946205; x=1784551005;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t/6DNcSK6X/uGZ1IYS4q2R1Z6al9GC0dZL0uRll37ZA=;
        b=dCixGmJAaMLrKsuKe9Pt8mnnxPojCOEIJvYgapnxmrHIPvVQ2pJE25qidnunomCqdn
         BSYuDGmMxIqyOqt2bIWjBoRHi1tw6hjsSzdSG1BwyXIjpRgNKQkyBQ+fHzMSq/T/jpar
         5wiIFOEyx4+D2674rLl4kPRV+zCDkdRd15jBMHLq78SOZXWBu2NbOVQphvoWlixtM4nq
         UDcnxAz/pFKtHlPgzovlGSNGCyr+uzI/7UYyL96DdSCzCNbehvTGuFBDJ/n71F8aOpge
         ZNhC9x5vHwI4HfFqkH8RwFbExaL6LjsMxNXog5/fpzXIKHiqywlX+dQPymh76dZB4Pqc
         Ip8g==
X-Forwarded-Encrypted: i=1; AHgh+Rr7jV+vuZ6M/1pofdmyeUH4e7bNf/CJutb325df6gjIUEfTY9NFY1ooQgMPAMYsxm9RG74ikembqwk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMf2T48WPza09UcmLUtAQw2snHyDQ0XvS+jTLO4fWPz2LUzOJG
	ARrFnGzNFvWaDNbrUw2uN0KxYofuMzRziZZiBdpGT2OARY6FbxegyEFZT8CqULG/qDk=
X-Gm-Gg: AfdE7ck2v291JNsrKdhUPoELnYummUz2XxpEd44VJt7v/tUYfs451qrwaVEoiBvochw
	awEXooItImNbcElI2JrJwV9FLSdIirW13O3o93scXGiK8qSSV+hsdiH3tBJ6IGQlgIdfEqB+c1E
	uon0M+NX89gfPCNwwLC8sAqzqMX5sfhZll2rXG8wP67gRIyyz/m1awSuOSd8har/W5Op2a1OsIf
	3s6fkfPPVImgvPetsze1k2fo8nr5yi4+Zje2zBG9pMtMwiZYRO6STt40n4+oQWX5LNxnMcdG7nM
	0oGYYmY9+SjbrUi7dLA4kQgNI/b07axs/fNBOeYnqfoO+OP94FN5YpRyyimAre3LwqzUiwlWX7Z
	lBicV6IBIndE4E5RHaLfaoCZsGYfIqR5/kNRxIAudnNCZK3YrszTkmolX9eod4Q1rA1P5CB1jJz
	cKzukVnPNmZUSX9uDxRSdMhUPaM4pOXJK4wsowI3tGqeviDVmmjA==
X-Received: by 2002:a17:907:a64b:b0:c15:a9a8:66b with SMTP id a640c23a62f3a-c161f3fdccemr347121966b.63.1783946204909;
        Mon, 13 Jul 2026 05:36:44 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c160e833cabsm423530366b.52.2026.07.13.05.36.43
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 05:36:43 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-698562f10e7so4283603a12.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 05:36:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpfxwOGaysLDTHnnUGQvwAb3acNWiFdSz3w8kAjLr6zbraaHQb7UPHud3pghHNpX6pBpB7obUiwyzk=@vger.kernel.org
X-Received: by 2002:a05:6402:a29c:20b0:69c:7ac7:c740 with SMTP id
 4fb4d7f45d1cf-69c7ac7c96dmr1680487a12.13.1783946203526; Mon, 13 Jul 2026
 05:36:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-catalin_pto-v1-0-5b93b1131089@debian.org> <20260713-catalin_pto-v1-1-5b93b1131089@debian.org>
In-Reply-To: <20260713-catalin_pto-v1-1-5b93b1131089@debian.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 14:36:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBQ-Vn4XzbrfV31adY7cEjLvmGuwu5_x7rn1NBkEC5mA@mail.gmail.com>
X-Gm-Features: AUfX_myop1qSR0uweNQ9TGaDUdl1iHj4R-fufo4jIbPM1JPRHa_hqCZvJROVzWA
Message-ID: <CAMuHMdWBQ-Vn4XzbrfV31adY7cEjLvmGuwu5_x7rn1NBkEC5mA@mail.gmail.com>
Subject: Re: [PATCH 1/4] mm: kmemleak: confirm suspected leaks with a second scan
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

Hi Breno,

On Mon, 13 Jul 2026 at 13:48, Breno Leitao <leitao@debian.org> wrote:
> From: Catalin Marinas <catalin.marinas@arm.com>
>
> The kmemleak marking phase is not atomic. While the object graph is
> traversed, the kernel can modify pointers, free objects or allocate new
> ones. If a reference to an object is moved from one location to another,
> kmemleak scanning may miss it. We have explicit annotations like
> kmemleak_transient_leak() but identifying and maintaining them is not
> trivial.
>
> Given that such transient leaks are short-lived, rather than just
> reporting such objects as leaks, do another scan to confirm the
> suspected objects. If no new leaks are found during the first scan, skip
> the confirmation one.
>
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Breno Leitao <leitao@debian.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>

Thanks for your patch!

For how long does this postpone the reporting of a real leak?
I am asking, because I have a few known leaks in my local tree,
and it already takes a while before they are reported.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
