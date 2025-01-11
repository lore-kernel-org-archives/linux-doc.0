Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A6B1B87F4
	for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 20:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736629105; cv=none; b=C0/f657YWu81rVN/4Sj7TXBxVVIcUgShgTUDWSrtYMtBI6NIVa7LinjFhJg7C5BMzhDXcV9OfXQ3FxnbraWdts1bFLJTSb1fTIBoPe7EBxjcY6GljG2D0JsWUbS3frfDoiE5YjyI2PJM5JnQRTpfUklPiy43GV7jXJHfOH6vTgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736629105; c=relaxed/simple;
	bh=v79JXz19dn1yP49kduRgqO3sQr9izaHDCyX7i3OuiB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GdJFw6ixbX0y4DS5XezRF0NMKWv2tM14oULtWcRhljaHWTsmos0gRce8qdo7fSbVs4nUn2ZwGDcXItgE432+XirHga0bvSBNnZB7XQVQbW4jY3S0VqrxQM8RyTf7NEn+pO3+D/Qsaq2rmF1kMEdEtrgSlDJ5YbMDvaHQV8RU5SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tOURsdGk; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tOURsdGk"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4679b5c66d0so80161cf.1
        for <linux-doc@vger.kernel.org>; Sat, 11 Jan 2025 12:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736629102; x=1737233902; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftZzyIqX3mHNDWEANVElLio/pbBE7ElHR3A8nRuBNzE=;
        b=tOURsdGkh4sqHQGgu+jANFfGTbdZ8HyjlbNKupELvW9k0D2oqHw20WQc3Rl1qNex0q
         4eNEQTpzw7l5xYMz1/Ymnu2mIWJZN7fDU1i8nSil++EWRVQ7v82FgLVhCzgBn1E7LRBg
         VOxATAv2fePiBlqfAKYGeACU256WQOCBCgca0t7DSWsOJjdTTq0LvyafBhCfYqGC5rdu
         woihZJ4c9cyVuSa0doqKYBCDiWzlDWVmujc5uu+zvrf2g1DVWM00rrWJ9btwoQf/1gUN
         UjaOKQ52H9K0IEZYf+E7YX6itAbHXHduYE4OruOTvm2vMGjLi/38vjSIT+3OlDTtFHY+
         p0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736629102; x=1737233902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftZzyIqX3mHNDWEANVElLio/pbBE7ElHR3A8nRuBNzE=;
        b=Mc49+ADpCtg2sV+r5wcWMt+Mq4HERCaVRbBojYhka+eF0IC+xDMe8huWMsE3K9Ouch
         YR5SKJMaoPQ1fz7jCtj7F26Bl3nRY8BYTT1X8BRyyIJZQXJsLPmy8dtvaa4yS0WECE4Z
         jH9OsXebWB59FfNSSCeh3gFL3Ngdo/vQQEvHFMTaqCRRWs0yz0aPhGmE3btBI7iiI6Op
         OSeWlJvp8CFyzvZYnqlfDICiFqbkHBNGIWdnmG+dgUD6naFThnP2qQCbv4/ajaROOhQ4
         GppdPvG5RXHXePqtcaD9v3zfVkrLqlclR09acGpxZFbnnK3Qrdv/hswxv1XeTYUcZRjX
         cUWg==
X-Forwarded-Encrypted: i=1; AJvYcCVDWuu704rK8TMkFGk5COV0a0zIWW+SMpEllgAn1LUdy434PTT08W7b99Kyb81pxdUJwiL4mDM/Vmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYfUQoN4OZiEScJm8LPCE1k6vpRvzOlwgBKtvJ7To9N1bSaqSJ
	AfK+lG+gxMKArQqNRAnLR8CJZuFgrf50x/HK2F3Qhfqi3FmWvcdF8bSrMm19+1iggBLQ9pj8VuD
	8XbkN5frJzvcos3gC/JaqxN3Sm/eyn3GJPqL2
X-Gm-Gg: ASbGncsOzR955YynOiZQIeah7ojz0EgNNuI4p1kxckABfklTfINU8K+eZnn75FKHqYa
	QNsPxlOcrh4sHcfprSaE8c7cLQZK1m5fBJxHk5A==
X-Google-Smtp-Source: AGHT+IFXCMjy8qnKgqdXQ+sAiDeEWKj4IZ1TIwwlPRJU4df+QWcrr0N/iHabmvxc9vLDix0idv/SHr65SsbW0Nlu1AM=
X-Received: by 2002:a05:622a:1a15:b0:46c:8336:ad9 with SMTP id
 d75a77b69052e-46c87e0a8ccmr7945601cf.12.1736629102121; Sat, 11 Jan 2025
 12:58:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-12-surenb@google.com>
 <gdipfy63r4wxiqlnglsjzatpej6jjswimuzadm2l57o2e45u56@qfd763n4ysft>
 <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com> <CAGudoHH6TKX8EnoK2aSSBc_4EKgOWV=bRAqreFWbEqBJL5RcKQ@mail.gmail.com>
In-Reply-To: <CAGudoHH6TKX8EnoK2aSSBc_4EKgOWV=bRAqreFWbEqBJL5RcKQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 11 Jan 2025 12:58:10 -0800
X-Gm-Features: AbW1kvaJ43SEywDn5XzSIyXFLgO9NV09UA7g7hE5IJyHZ53Gp9uaIDe6HvGxsK4
Message-ID: <CAJuCfpHGzOdRH++=7CKqG5RHPZq82wqr+kbvHX+4-N0e4s_FJg@mail.gmail.com>
Subject: Re: [PATCH v9 11/17] mm: replace vm_lock and detached flag with a
 reference count
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, oliver.sang@intel.com, mgorman@techsingularity.net, 
	david@redhat.com, peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, 
	paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, 
	hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, richard.weiyang@gmail.com, 
	corbet@lwn.net, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 11, 2025 at 12:31=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> =
wrote:
>
> On Sat, Jan 11, 2025 at 9:14=E2=80=AFPM Suren Baghdasaryan <surenb@google=
.com> wrote:
> >
> > On Sat, Jan 11, 2025 at 3:24=E2=80=AFAM Mateusz Guzik <mjguzik@gmail.co=
m> wrote:
> > > The previous modification of this spot to raw_read_seqcount loses the
> > > acquire fence, making the above comment not line up with the code.
> >
> > Is it? From reading the seqcount code
> > (https://elixir.bootlin.com/linux/v6.13-rc3/source/include/linux/seqloc=
k.h#L211):
> >
> > raw_read_seqcount()
> >     seqprop_sequence()
> >         __seqprop(s, sequence)
> >             __seqprop_sequence()
> >                 smp_load_acquire()
> >
> > smp_load_acquire() still provides the acquire fence. Am I missing somet=
hing?
> >
>
> That's fine indeed.
>
> In a different project there is an equivalent API which skips
> barriers, too quick glance suggested this is what's going on here. My
> bad, sorry for false alarm on this front. :)

No worries. Better to double-check than to merge a bug.
Thanks,
Suren.

>
> --
> Mateusz Guzik <mjguzik gmail.com>
