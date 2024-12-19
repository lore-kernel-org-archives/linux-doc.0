Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658B6225785
	for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 16:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734624504; cv=none; b=PXSjElPabB2Jh2Q8QcV3A/MFniKHIgmI6eGGw68PyBBLLJk4Q2Lz/cR10IrXZI4I11ohWdQUNSoUTbgFQFBvOQvtwS04rgncz55HcpBM+xd9qWhFM2eOwJnaXKLMvo6cZJsJQSoVu1C/p+GeHSOZDfkdya8gBE3gc1fVT1sE43c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734624504; c=relaxed/simple;
	bh=YQEr6GSEtuEIr80AgS3GqbdNAQ58Tai2FwrUUBAgQXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZDS/KG7TJmZMwXQDTUY+UxMts3svSOGf9qPTDio25ovJmeBe8apYCRQc/MzH5KLbgVWsBI6Fa0T+enBSMRzzWPUu2zQwC8EpbuPrRgMTZfbZ2/l2HFyk9Kje8tiSfK+wMorxpfwvCf4TaqQ2kMKP3j+Ud9IDl5pysBYCcHp4gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sNZbFBtX; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sNZbFBtX"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4679b5c66d0so266231cf.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 08:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734624501; x=1735229301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQEr6GSEtuEIr80AgS3GqbdNAQ58Tai2FwrUUBAgQXs=;
        b=sNZbFBtXWTCOhRUnnWiHkC4gOHEi5oA4rPOuWZIA/Ar2Iws0vl8yEKg+YFUk8NsYlG
         zDa/o2xrAec9uK5xJY5TzUnkm7jkzmjFq9otbtQtP78RpBQxQPG0Tme9QSeqHzQeSPsZ
         tGUyZMZdRz+zokhrCaZAvNC8eIYVafIcsnO4WoWo+rzFx3i98G5lf7KoeQLeIojvuSUP
         hghj0Jq8+Wt9nHrVpLn4RYN/oGfhpxH2MV2DcYyKYWn+TiSDeu7Wdhkl91sMQNeDQ1XJ
         AZwAd4fwmT3i/Wln2qGJkqQH2uA8VHY78sY8PdC1S4x7vg9aM9WLnrl59LFWt7XoHKWo
         7fnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734624501; x=1735229301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQEr6GSEtuEIr80AgS3GqbdNAQ58Tai2FwrUUBAgQXs=;
        b=qLsyasusV2kG7GOWoZ6/AOwax+vrUbGG2v79GO+Hbo1iMIYSr7xlsomicy5pmK8Mq+
         XYBGTDic8kQnfKfMeZlQJdt6l+KStkQAPsuBdKMg+hAhXxTvxucH2wIMei8TjGs7Y84C
         4hGA39L5/ELdqVaRxUJI0RCvQFpb6m/CKuRl/6ZqrxLMPH6W9rgDmvHXgnM+KOOj6kNp
         pe4q3AQHQx+SMTlmURN1Q3ofTGouzXNr7PS8+4734rrV75M9MFrgH+XGvf0UCg6Dvljh
         9nLY2Ql7NWiNbA6PbEUPTomJIC3odEGNXf8kxmBOfy3rCASmAAZ3/K172Lt02v5i7PCG
         2scg==
X-Forwarded-Encrypted: i=1; AJvYcCUgXnQkDwV56KbDYMjpWbflijrTM9rRBQ9cafgU69gltkcHo1d24ayQyFR+Agb4w3PspVTN4dMeeL0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL94sCEkaAo9OUeUmROy6ohxXDITbqFKWcFxx5ZGLVdLdzdMP+
	jjHqT+FQCNGmqX1yP2ABFjpxUkhzZJpGPSw/qqpCyv9o3tKaa3m7e4zZmlWWOaLJoAU8Z25Z7sr
	YZI4dacsBB1GegAVT3NXk74mzeWvsiBD7wgd8
X-Gm-Gg: ASbGncsAGr7wD7ardoUsVE6v/1taY75V4f1LlNS1uchjkZ0iTpzx6xC8XiXKzTGn3DM
	kctpNgDc8WDHBx+Qa5f1OgZRtyHgUQa6oSRoWtw==
X-Google-Smtp-Source: AGHT+IGwsQcyLlf1a93KTfVc5eZas6UKzid4em28ST7skzxkFy/tov3QwCf8dLyO0bw5a5+gaQtzzoEMgu99ZDqR8K4=
X-Received: by 2002:a05:622a:7:b0:466:975f:b219 with SMTP id
 d75a77b69052e-46a3b979807mr4450551cf.8.1734624500958; Thu, 19 Dec 2024
 08:08:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241217103035.GD11133@noisy.programming.kicks-ass.net>
 <CAJuCfpHzsQeejdPPbDdA6B3Wa=-KusnYRUyt1U0WnCRr8OKfGw@mail.gmail.com>
 <20241218094104.GC2354@noisy.programming.kicks-ass.net> <20241218100601.GI12500@noisy.programming.kicks-ass.net>
 <kfltsrry7qjuycyqpe2wune2ejad6kvusm2zixvfbtprbnw2lv@wcafrui6qaa7>
 <CAJuCfpFYZkc===SXF35s3C0xg3q5RjpCiOQhwK=9_3RnFUye1g@mail.gmail.com>
 <20241218161850.GG2354@noisy.programming.kicks-ass.net> <CAJuCfpHDRCoaBfE8y6AppKveSTgayyTNfDyQWH=gMzO-Pkuqpw@mail.gmail.com>
 <20241218174428.GQ2354@noisy.programming.kicks-ass.net> <CAJuCfpEKg_h5pw2AxdF1wmFMt4xdOxYqv7U1uVMYcuSCB4kHuA@mail.gmail.com>
 <20241219085311.GA26551@noisy.programming.kicks-ass.net>
In-Reply-To: <20241219085311.GA26551@noisy.programming.kicks-ass.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 19 Dec 2024 08:08:09 -0800
Message-ID: <CAJuCfpGafwBehugTB+D2M03zsbnvO_L8zZb1gzHYtfu5uYugvg@mail.gmail.com>
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, akpm@linux-foundation.org, willy@infradead.org, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 12:53=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Wed, Dec 18, 2024 at 09:58:12AM -0800, Suren Baghdasaryan wrote:
>
> > And remove_vma will be just freeing the vmas. Is that correct?
>
> Yep.
>
> > I'm a bit confused because the original thinking was that
> > vma_mark_detached() would drop the last refcnt and if it's 0 we would
> > free the vma right there. If that's still what we want to do then I
> > think the above sequence should look like this:
>
> Right; sorry about that. So my initial objection to that extra sync was
> based on the reasons presented -- but having had to look at the unmap
> path again (my mm-foo is somewhat rusty, I've not done much the past few
> years) I realized that keeping a VMA alive beyond unmapping PTEs is just
> plain daft.
>
> So yes, back to your original semantics, but cleaned up to not need that
> extra sync point -- instead relying on the natural placement of
> vma_start_write() after unhooking from the mm. And not for reasons of
> the race, but for reasons of integrity -- VMA without PTEs is asking for
> more trouble.

Ack. Thanks for clarification!
