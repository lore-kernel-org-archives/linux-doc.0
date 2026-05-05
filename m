Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D89D381AE6
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 14:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777991588; cv=pass; b=eECAWbk9W3uWF2XhCSSE0LjyFKvTxxyzINA5t9d8B1ufHvktZFtoXhlFNdUDSd6Bkus9w1kdwXJc4S2RZvLrhM5+lmwAKOqtB6JE2RuSRLD/XEI/6UidWqIQqjHROFNFMhv0ZDT4JPu3jXjKhhySDfvRO0uC6uRSTQWYsCmO9Jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777991588; c=relaxed/simple;
	bh=5h+jyKMMIPTXybgbDkdR5LLDHZaQlqwfa7Kw+QHGnoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eV8QNduEnjKkQR+XFf/UsWDs9dfFIOnZdoZwUOFTux4BnqjHhSNTCJuJICM9PdT6hTcXTigO5C2KbBFMo8Ki+WYrwZyRAU7JG+LU+y7l+Hew2MqKtGCKI9ZewC/8Q2ostFgdEFT94AVhNCUkjb6lC+0pFNo3l2Mw48cR0YtTW4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KbH5deyv; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KbH5deyv"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48d1c670255so50625e9.0
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 07:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777991584; cv=none;
        d=google.com; s=arc-20240605;
        b=GYvAeP0SqhBgTYGjVLyunKZtzH4hH9GvoSHERDyUF6c8PSYgM3iJn3BicLX9HumQ5m
         aL9WnufEgROqkmFrFwMXBtkF5zSpiJ55PGyTmsw21ztodJL4iO7kMRhat9NZGQbvga5t
         oTOu6x48vGqH9gWp4jND5WRVe7txwGzPf0F9YuTFd/CHgZeVzL+DTa3h1UVwE4l7Pu8K
         UZY7Zh0IFQkhx+D4EBx/V1NNRJdy0ZCRTdHijqe3cmWMsno+3+cFkYaPnI75cY3/syQF
         tELNa3UIxsWva6Vz+6rl47jZ3Uql763G5nZLtpDHve3QwVF7lhHPXRSamqUgBIg2zgiU
         B28g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5h+jyKMMIPTXybgbDkdR5LLDHZaQlqwfa7Kw+QHGnoc=;
        fh=T+ScKXF3Vn2ZtaeWLnfgDqSCr5tu7tZimqa28AYl+2I=;
        b=GYShRiVDgt7wB5q4H2zK+jxoiiHBDP4goKNCm2AhET9Snia/QVK+HNsA9jJlLVg0n7
         4yc/oWJGoEWHpuup2P6suTvgg7685XuKvFSsNs/AdfVgd8DobbaVejiJkuZxGsdEoLJE
         JFjBZDzCNCIYOKp8ukwTizmDnKKDlrJIGGg22r8vjoxW4cfndI8GdCks21f8gkXHOp59
         +MxFYTmACBx3iUbbB3hUygtTenb4ArXHdc7MqnXYxRlO0H8ukDXwrugJ6OspGaD2BqaV
         DZtH8f2T4DaIMCb9+93eVviCQkFi+cGFOOfcmnr57wadICU7k0jamGSPswZDF0QzeDaN
         Zyfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777991584; x=1778596384; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5h+jyKMMIPTXybgbDkdR5LLDHZaQlqwfa7Kw+QHGnoc=;
        b=KbH5deyvNLMsTZsp8dKuX2f+nNnmzTa9MF+MUCAqtuqLvL6IBR/CoXhYAMnuY7kz+p
         mBHh+5riix6HEOBVewCDNAEAA6vzqwhN6MY8Z0MYiIcxpLG3Qpt7EqbZcFhnSIPUz2Br
         oPmcpfwC2MVNkeT9MeLSDMR0XuCHdNEPTsTrRML9FL7BJZ5FzHSGTdHbx1rKrf+1lOzE
         G011fLOsL3FJaI9EBCvu/KLl5sHAyEgmPb8FmyrBfb+AgwAlzpOgBcgU8mIPtTs5qQNC
         LjtvXRx0/pRE0NRjBmmhCyCaLiz7Au/lXrtUz2XpZumyHy6oIALzrGVLwDgEDRuYmeb5
         fwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777991584; x=1778596384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5h+jyKMMIPTXybgbDkdR5LLDHZaQlqwfa7Kw+QHGnoc=;
        b=FKhORl3d9ww+Mo1q7gDWuG+ZfLwl1y+m31n/wz75Cp4zUOn+zh/Y72tBG9/Lz8WmM8
         XAQ3s6mn/iNr0NSP6ZwtMzaEX3OsfQMh7jHukgJJBMUK8H6v6Tjz1Q/qa1YkZ8xYkkdR
         Ozlo8AjefBVERWx0LnWlYG11QLRIokAa1RQGPoGq9wtbYxcAJ7KEuWrDHqNXCH0vtzKC
         2GbWQ+HX7sqyU81K3RG1Y4sKYFrp0j1oJ0E/Yy49T+m/tu41sqY/Q5Gf6CwTI6iPALU3
         /WehLYR8X2fN+lLWNrvZ1GsLAgOR88Ea4ysuOg3VkG5DZLacwomacFRnU7mBn9yJ0UiR
         v8Zg==
X-Forwarded-Encrypted: i=1; AFNElJ9WYNRFKYQvr6T+YZ1W1ClrONIjXoQ5WspPwCaXEUeO/iMpinff19viHBoMhPf1dNlp5bW3qx2Kpng=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1rexmGhpEC10HNRU043Y1CMHdM6xCj00hdmSZg1EKb5JsP4Ch
	6+BHIQKQ5etRlQ6FITwGPpTyOQ1S4aJX35r9mf/JouIPxn4JJE5zUf7loGZ+4iJRFhE5wdCXHlV
	1TSsX0UDc4+upFpuyKk0IyT2jqB1NeSneCxchY/VC
X-Gm-Gg: AeBDietWAuhwvxBDx5wmhgJVxBPuoSfhupjf3Eh93742Z0A0mrvE44x5W/z9ykrBlGS
	xTfqwWP8rH+6kxlVrefuJZG5h0Tt+GTg/hciBXokpzUHxQ0rBoliXZsEs7QAjyaxvXwrwPyN2l4
	3aperQIJFGoyM1kvzXWp+KtUoQqnDdwaJt3txx9syHeVzdkrHHU2EXjPb7DXcF2p1yooDi334Gt
	MGLTDKlKAceVDQz0Ww8MfL4ijxzvWYtPzsn3yzhZEbXmoPWkkaaxpKisPLDOI+2HUJMS6gvRIJh
	A2fv0YMZ4/txLQcvee4vZ9qBwZMq6emJvpPjKgK3nY3gXMZN4yUXPyb8xHv3LspPVytjKyI=
X-Received: by 2002:a05:600d:8498:20b0:48a:5f32:62d0 with SMTP id
 5b1f17b1804b1-48d1474eebdmr937275e9.12.1777991583578; Tue, 05 May 2026
 07:33:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHijbEXhuVRgkkPA2dAC=njGBU7vpAbxAbsSmxvvPznO-ckVRA@mail.gmail.com>
 <cf945dda-f526-4544-bc43-22f70acb28f5@amd.com> <CAHijbEXQfm4QDDfo1yiVBV9mVvogGqt_BAu2ipnhqa-EDOKteg@mail.gmail.com>
In-Reply-To: <CAHijbEXQfm4QDDfo1yiVBV9mVvogGqt_BAu2ipnhqa-EDOKteg@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 5 May 2026 07:32:51 -0700
X-Gm-Features: AVHnY4L-CqRCk9K_YM_TIPhfxSGrpHWAX4Wk2aGhZey2Xo5NNg91bzKueU3NeaU
Message-ID: <CABdmKX1pDc7wpLVQzM0ihH6AfW+=KWdyaZuorMqWCbC80Y7-Bw@mail.gmail.com>
Subject: Re: Regression due to /sys/kernel/dmabuf/buffers removal
To: Julian Orth <ju.orth@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	corbet@lwn.net, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 6:00=E2=80=AFAM Julian Orth <ju.orth@gmail.com> wrot=
e:
>
> On Tue, May 5, 2026 at 2:41=E2=80=AFPM Christian K=C3=B6nig <christian.ko=
enig@amd.com> wrote:
> >
> > Hi Julian,
> >
> > On 5/5/26 14:25, Julian Orth wrote:
> > > In ab4c3dcf9a71582503b4fb25aeab884c696cab25 ("dma-buf: Remove DMA-BUF
> > > sysfs stats") the /sys/kernel/dmabuf/buffer directory was removed.
> > >
> > > I've been using this interface, specifically the exporter_name file,
> > > to detect dmabufs created via udmabuf. Such dmabufs show "udmabuf" in
> > > exporter_name. I've been doing this for two reasons: 1) to detect tha=
t
> > > mmap on such buffers will be fast and 2) to detect that GPU access to
> > > such buffers will be slow.
> >
> > Crap, I really hoped that Android was the only user of that sysfs inter=
face since that approach turned out to be quite broken.
> >
> > It's number one rule on Linux that we don't break userspace. So I hope =
that you don't insist on bringing that interface back, but if you do I will=
 just revert the removal until we found a better solution.
>
> Bringing it back shouldn't be necessary.
>
> >
> > > With the removal of that file, that detection mechanism no longer wor=
ks.
> > >
> > > I'm not particularly fond of that mechanism but it was the only one
> > > providing that functionality that I could find at the time. If there
> > > is another one, ideally an ioctl on the dmabuf, please let me know.
> >
> > The virtual fdinfo file you can find under /proc/$pid/fdinfo/$fd also c=
ontains the exporter name for the DMA-buf.
> >
> > You can find the full documentation here: https://docs.kernel.org/files=
ystems/proc.html#dma-buffer-files
> >
> > Is that sufficient?
>
> I think that is sufficient. I probably didn't use fdinfo initially
> because 1) it's a lot more work to parse and 2) I wasn't sure if it
> was intended to be machine-readable or if there could sometimes be
> newlines in the values and such.
>
> >
> > Additional to that the debugfs for DMA-buf also contains that informati=
on and I'm open to the suggestion with the IOCTL.
>
> My application runs as a regular user so it cannot access /sys/kernel/deb=
ug.
>
> Having an IOCTL would be ideal if it is not too much work. I'll fall
> back to fdinfo for now.
>
> Thanks, Julian

Phew, I'm glad fdinfo suits your needs.

Adding an ioctl would introduce new UAPI so I think we'd want to avoid
that unless absolutely necessary.

Thanks,
T.J.

> >
> > Regards,
> > Christian.
> >
> > >
> > > Shipping an entire BPF compiler in my application, which the original
> > > patch suggests as the replacement, is not an option when the removed
> > > alternative was simply reading a file.
> > >
> > > Thanks, Julian
> >
