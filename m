Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06553F9F51
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 06:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780468035; cv=none; b=BUFqkPZy7IsteSL1d3pnMsoaXozH16vCXp2nX8yEzmJ2guo/2QTJ+uIY/bOru1Z5CFJg8Zsoy4XycHVxPtC0xDnGpN40ck0LSA25dRua/5bnoj6NeTxKJ6kk/KcjljGWBBdD/U5YBYpI0N/LJSGAqYy5+RrYyJjCjAeu7A0yVos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780468035; c=relaxed/simple;
	bh=br4Q/5Zkdoxf1ZYbzi2zhNKQk/fuGIIMoDVDCqYOvec=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=BGYE+4HeBmTQQBzLM4l3mvN1LzR4wyLMz6LcLLF5EPYzzBoNpvEhOLsH4SkCev31HkuDPxtdohVUQ7BErtinTSyU8ZXREl1IREafun14gejDie4eRE3cml8Oio2EDeNEEB9NPfzJGPe16Sp4w+fNyHQHyjqwRHaeqRhyTDl3EoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+TFFupz; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+TFFupz"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bf18c30bb2so41144515ad.0
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 23:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780468033; x=1781072833; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FsWw+BRaEfTe2BSzSpq066D0ULR8rb3630HXbbNfz04=;
        b=G+TFFupzCbNdF3i5DbDb6woQdwwrx11zHf//h3dwTPe8HiXAdLqI8L9P/BHw6OQRb+
         hR3iha1fuQu8ZdJMa/s4PRCm6hh6r5Z1WRP2uoSjC+jSVNSJZq2K7hpcyxgqMouh8w3S
         eM+6jFl1bYbeM2jcc1X2uyS5hj0Yl0bpPgOO/HLDy3q06PpdC32BzSuLGBYLTOzoxqfu
         Rec4QVRaKx2mtf0Vx2tbbLzE8vC/iX3bev8xe/ass9k1wpwz5yT6ijX43jdnz8UO2eeN
         fOubUiE5rUufkGGQIbd8IPBc+H4vHkghDpkXavVFZKfbwUthzno5bWnvepkF8OsjjUam
         q0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780468033; x=1781072833;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FsWw+BRaEfTe2BSzSpq066D0ULR8rb3630HXbbNfz04=;
        b=DWPQEwHbC80qfIf34RanPcJl++A4FtbB96R+/54lCF3cU7kJMhV37i0dyNOfdlXP2K
         28wtFBx+YjN+CWockjC4IaFine0tlNKgKMLTkRxEzLR+1pBkkYdSTxjP6iXOSoiqK132
         +bHFf0f+dyxlAfRt1mf9P+tWC6j8O15fLAr7PSfYiC961uY5HcyDpVeg9pM46A5rOXRZ
         bwwdzejzykijMZe9lSjANR2RPVWQSnIs2mxBoXB6PcABSaOGWpSkOvp0/kXPsKb+Oj87
         bI4fTvTOamt7CJTsqI1WQt8qJeSICwUIqIc6O134fmOolxzmXYRq86Relc/qvN+G1wEO
         yFMA==
X-Forwarded-Encrypted: i=1; AFNElJ/JaMSGY+gp9nhuGQLZwayCDL/ODL1f5DySS3wf/hIeesgZWy++1bdoIb+TAJtKPxGYFLYZWof18CE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFboOQgc+2g3poUmKo6r+v+fuOKgSHZl0zEpeScjpWn9buo/CW
	Gpw0i1vJFjHgJcAKkGXBebbwqdVZ7XGVslACeXV7XzonJA7Ixw0YkM21
X-Gm-Gg: Acq92OGRJ03YSHX8eqmuifAxZXeP8KmTmu8kK7OnJzHvWXB+O3EUNMWz5J1XwdB5xde
	tveaUAYa9kcL7EOGBl9nzeqK3CILkEKWG2nGFtNJ94f0NV+Uso1m1XORXYd3Ln5HwKZt0vErtWJ
	3Da0sXzGaVHJTEKq3xVjiaYnKoMr+t60syZ8w3Kig9+K/dKOJ7RFyGi+6umeyzp6KYSYttzIFil
	+zJMVxkND057cTC7vVdo8mQxxaRbS/Bk9qHkddi0VnlwiW9wpWw1GjGgPs+KZvvH9xn8zmFQ7Cu
	ydwY7qscDjlNRe26OuhMctK2g9cZVoNhO2K8MdoEUnnWeKQidAHNdXN/f83BSF9zoGucFCHvjrD
	l1ifRhRiUEAFFEiJOvtHWDJSJiBygCJDfgFErY71+ThdV1QRUkLLkKqMzA+f06PPPwMfEIpyGIC
	zG13HDcMW6x92YdKettzREHVscgAwIVN/i
X-Received: by 2002:a17:903:3c45:b0:2c0:bb2d:a30b with SMTP id d9443c01a7336-2c1644ae17fmr20198585ad.32.1780468033143;
        Tue, 02 Jun 2026 23:27:13 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629cfb4sm12978885ad.59.2026.06.02.23.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 23:27:12 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Harsh Prateek Bora <harshpb@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, Amit Machhiwal <amachhiw@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, Anushree Mathur <anushree.mathur@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, lkp@intel.com
Subject: Re: [PATCH v3 1/5] KVM: PPC: Book3S HV: Validate arch_compat against host compatibility mode
In-Reply-To: <56c84e26-69ed-433b-baaf-7b53acc60391@linux.ibm.com>
Date: Wed, 03 Jun 2026 11:35:55 +0530
Message-ID: <bjdsw43g.ritesh.list@gmail.com>
References: <20260522152744.55251-1-amachhiw@linux.ibm.com> <20260522152744.55251-2-amachhiw@linux.ibm.com> <pl2g6xbz.ritesh.list@gmail.com> <20260529141530.fc225a67-e9-amachhiw@linux.ibm.com> <cxyewhx8.ritesh.list@gmail.com> <87se74z4a6.fsf@vajain21.in.ibm.com> <72ef4cdb-8d9e-4319-9c94-b9a46a6f6194@linux.ibm.com> <56c84e26-69ed-433b-baaf-7b53acc60391@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Harsh Prateek Bora <harshpb@linux.ibm.com> writes:

>> amit, can you just post this alone as a separate patch, so that we could
>> pull it for 7.2 merge?
>> 
>
> FWIW, b4 am -P1 <mbox> should fetch this patch alone (and not the entire 
> series), See b4 am --help for more options to select a subset of patches.
>

I agree, however as an FYI in this case -
I had few review comments on PATCH-1 here [1] - which along with the
commit msg changes, also had a code change involved, so IMO, it's still
a good idea if Amit can test and send an updated patch separately for this -
to be pulled in for 7.2.

[1]: https://lore.kernel.org/linuxppc-dev/pl2g6xbz.ritesh.list@gmail.com/


Replying to Vaibhav comment here so that we can reach to the conclusion
at one place.

> Hence IMHO, this patch can be marked for stable tree and potential
> candidate for 7.2 merge window. But dont see applicability of a 'fixes'
> tag to this patch

I agree, we need not use a fixes tag then. So, we shall mark this
with v6.10 tag then.

Cc: stable@vger.kernel.org # v6.10+

(I calculated this based on when Power11 was added: 
git tag --contains c2ed087ed35ca    | grep -E "^v" |head -1
v6.10
)

-ritesh
