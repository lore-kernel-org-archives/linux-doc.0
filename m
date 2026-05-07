Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9003ED5A9
	for <linux-doc@vger.kernel.org>; Thu,  7 May 2026 11:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778154757; cv=pass; b=GUWBlctyKmGfeB8LvvzCT1spT2j0Xz1atXG+sBmgFWAWjnHOodTkQTGxB31GflDqI9b1U/FqiuQuOix+10yBkPM7m67le9l4n65LO6YYkKd8tJR+0oZ9KouDi0zkwSi1cZN/9YAGrxzjmgfq9Ab7pOsoyiXcFp09NVH3y9czJjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778154757; c=relaxed/simple;
	bh=h2fMYnCYIrNFnwnb1qtbtb1UtOtqen5sV4Rb7709pMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tTtSPVxEeNhuIHe8W80fbiswEABaW2yxmE6Ky2dzEsZ3DtfGmb4b9Jb0R31ennCl+3fEhmMGZ/rvE92Dr9r8xNBy4vfGgW+1YnfCeAwjlx2Efs5jY5PZUelZE4Z4X6unoCrWSitD0QAOSvzYJZTusDlOTQ1Q88nq+GU97GWpR6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kW2XKo/2; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kW2XKo/2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891b4934ffso87795e9.0
        for <linux-doc@vger.kernel.org>; Thu, 07 May 2026 04:52:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778154752; cv=none;
        d=google.com; s=arc-20240605;
        b=M/sDYHaE9g8gHbQANfCnHge0esCHFbN7DEK/+OTpOwRSFNfkOkc9A55FQoWEyoyebx
         wB0yhv8ePed1fNoVpjRFxyuCwu4MrtjMkaxcHZ0mxiLFVzjNvezkwjZ/mXYrm/G+XGjv
         jACO1tBJaucCI1ENaFCSwpcsqOWdP2GY7K1Pu7ATu7+2dRHGzCtNQXgbLTh2qf66BuAz
         z3nNDbob+uBDR2M8cAh89MBhVKTUCYafUPTzRl9kjM4DJ7ZGuCOVRV1fIjzDP9NDAd1/
         YH75NBz7FuTv4X+NDS6rEdPKcdJv8GmAKmEGW5f0zQDht9qZMWMp1UWvPjfeus00Uyna
         pvQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h2fMYnCYIrNFnwnb1qtbtb1UtOtqen5sV4Rb7709pMQ=;
        fh=aIE+k+INUf0TxV8kbJWTySBDIf9W3JcwnkgrLL3IStI=;
        b=CUJ2VAN28RRbMNzDibXt4l+XCLLMsBUV8RNLgESr2E9kn6YDI0/CGfuV+8foSKqW3k
         rGnvxBbVEkVexrJKgMfibeXa3DcV4nFvaUqdsOZqaOL9cB4xTxygGKJMzlT408dbwhh6
         lx+0O5hAAbkRr/0hkO43NtP/FvhdgrK/i2SFt9phg9O1SJk2xIQRSBWKX+xvCnfoFv1w
         l0Abd5Ns19KUBbWmAlzzmN7s2AzrNHTWcjq1X+3XVrRXJMp9+LuFXpJXoZq7+XznX/lO
         i1auXfBzJUlkmK372twt13ULs+3UUVs18bX8k135fRMmB/k4QaxF2LxjBYrRBdup04S+
         DXBw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778154752; x=1778759552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2fMYnCYIrNFnwnb1qtbtb1UtOtqen5sV4Rb7709pMQ=;
        b=kW2XKo/2q5pr1pzq7vS83d9qQljQOLF8yntYCFp1Av0/YCA1hD8LDGA9h/8gpBcHBE
         VhCZEWfgT+sfJpJDGN8N4tum+/o1ovX2W9UDO1mwdTx/S2bZrn6uoxln8PnBaFx2IbCc
         ZbPjfZz042MLORVc7pz5K5Aw6Cdm9gDlzOG+XzX8PWT/roW4XHyTLG0J6SjxTp/2liNl
         rwT8bNFjGx60Rm45/4LwsvBU+ffLArxXl6E3na05jmQ5OC5wkyji4ba5o2jVFcD8TjvX
         HhULalHl+3xl36yEJ1gC+OiXxBXU6qRmFqPGdL3YVrGJigdogH8FNdtNIOD+K7NornIU
         eYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778154752; x=1778759552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h2fMYnCYIrNFnwnb1qtbtb1UtOtqen5sV4Rb7709pMQ=;
        b=kNai4yBaE38yFSs/y90jy/66R2qOAmuuu9c15BE+/L1TcgTfAjp8bVO6cZT3pLiXkD
         rHonxUigI6kPjpm3Tk6o10qhrr+tbAsIsGlttl1PjAXNzoyfINvS4o8jlJzvEOZa9dca
         FkkVY9i79gT6zXsv7zrM22ulIEBtT5084qE2CO328vZaR8xKG92aqs4WnjMf5n6a72Sw
         l74tduQiu045GVtxcmArCIxnvJ2Uzwl2N2v/aQM8DR5VBGeXzgrjGBvAkpDy/zhbib57
         ye2Jp4El5pRL34aNqx0YuPdJaKcj4RhXceLGVj7GV7HAQtyKRjtKlP9OTCZixBkU3+V/
         WcsA==
X-Forwarded-Encrypted: i=1; AFNElJ9hLpysapGMsg9VyYF/Bc9pmxXny7+BcwbpydMz9HQkhlvMixWvOyMe9X99vY9myPVC/ZpOBwqHBVs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye+LP+Y1IXaAHbudFI0cge9wUUc3KZqKBJg+4Aomkwu1VaFdlo
	mf7ffP11y9SRN8AWGI4+5AcmnUzoihZ6le2jYBhbAN98rqJwCfDiqJpm+oOf2u74nRxBImN4/hf
	bFRQOE7Gc1r5rQ2/h/xwTVmgP9SKrZRrUmscUMt+u
X-Gm-Gg: AeBDiet/yOQlU0T+3keINh6WQN2OiWM9Vklez+9B2eJ/g3p0VHwNbTBauqLG1AtTuxx
	H9fJ1CzyEgeBDmVyC9HphXljbSxnbKWxAgS6tvFF+u4219zca4TF9kxGHPGCpXD5JWfoFWZ89Uo
	Wr7fq35F49CAePIzVVoeqe2+fQI9cpJb2EJl8LNfy1pFzJiqBjJUxTje/aBm3kI2cUtt2RuYdDH
	sZW9uKidQC0Ro6Tlog/RgSExqzYgZ+Re9jO66PTFywAQf0fzPx7AKokquttvyaP/EoJd7/fnP+R
	vXht1sE+0UB8BMPKntLWBmI61CzKZODmiW1SecubbbI9DSudfIDnUFQYLEW4
X-Received: by 2002:a05:600d:6450:10b0:48a:55dc:9c1e with SMTP id
 5b1f17b1804b1-48e5d45d30dmr663245e9.10.1778154751362; Thu, 07 May 2026
 04:52:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHijbEXhuVRgkkPA2dAC=njGBU7vpAbxAbsSmxvvPznO-ckVRA@mail.gmail.com>
 <cf945dda-f526-4544-bc43-22f70acb28f5@amd.com> <CAHijbEXQfm4QDDfo1yiVBV9mVvogGqt_BAu2ipnhqa-EDOKteg@mail.gmail.com>
 <CABdmKX1pDc7wpLVQzM0ihH6AfW+=KWdyaZuorMqWCbC80Y7-Bw@mail.gmail.com> <b9c1b7a3-12a8-4104-b98f-a1e57b343046@amd.com>
In-Reply-To: <b9c1b7a3-12a8-4104-b98f-a1e57b343046@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 7 May 2026 04:52:19 -0700
X-Gm-Features: AVHnY4LrtQD1vp6VlN2Vm6s4bEP0BXc-IojZFRNiMBPSNFKjm4nQmQFAY7f1gs8
Message-ID: <CABdmKX0KQqD=QtongicEBL5y-3xMvf94YC3wqH_FynLVTJaAew@mail.gmail.com>
Subject: Re: Regression due to /sys/kernel/dmabuf/buffers removal
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Julian Orth <ju.orth@gmail.com>, corbet@lwn.net, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 4:35=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> On 5/5/26 16:32, T.J. Mercier wrote:
> > On Tue, May 5, 2026 at 6:00=E2=80=AFAM Julian Orth <ju.orth@gmail.com> =
wrote:
> >>
> >> On Tue, May 5, 2026 at 2:41=E2=80=AFPM Christian K=C3=B6nig <christian=
.koenig@amd.com> wrote:
> >>>
> >>> Hi Julian,
> >>>
> >>> On 5/5/26 14:25, Julian Orth wrote:
> >>>> In ab4c3dcf9a71582503b4fb25aeab884c696cab25 ("dma-buf: Remove DMA-BU=
F
> >>>> sysfs stats") the /sys/kernel/dmabuf/buffer directory was removed.
> >>>>
> >>>> I've been using this interface, specifically the exporter_name file,
> >>>> to detect dmabufs created via udmabuf. Such dmabufs show "udmabuf" i=
n
> >>>> exporter_name. I've been doing this for two reasons: 1) to detect th=
at
> >>>> mmap on such buffers will be fast and 2) to detect that GPU access t=
o
> >>>> such buffers will be slow.
> >>>
> >>> Crap, I really hoped that Android was the only user of that sysfs int=
erface since that approach turned out to be quite broken.
> >>>
> >>> It's number one rule on Linux that we don't break userspace. So I hop=
e that you don't insist on bringing that interface back, but if you do I wi=
ll just revert the removal until we found a better solution.
> >>
> >> Bringing it back shouldn't be necessary.
> >>
> >>>
> >>>> With the removal of that file, that detection mechanism no longer wo=
rks.
> >>>>
> >>>> I'm not particularly fond of that mechanism but it was the only one
> >>>> providing that functionality that I could find at the time. If there
> >>>> is another one, ideally an ioctl on the dmabuf, please let me know.
> >>>
> >>> The virtual fdinfo file you can find under /proc/$pid/fdinfo/$fd also=
 contains the exporter name for the DMA-buf.
> >>>
> >>> You can find the full documentation here: https://docs.kernel.org/fil=
esystems/proc.html#dma-buffer-files
> >>>
> >>> Is that sufficient?
> >>
> >> I think that is sufficient. I probably didn't use fdinfo initially
> >> because 1) it's a lot more work to parse and 2) I wasn't sure if it
> >> was intended to be machine-readable or if there could sometimes be
> >> newlines in the values and such.
> >>
> >>>
> >>> Additional to that the debugfs for DMA-buf also contains that informa=
tion and I'm open to the suggestion with the IOCTL.
> >>
> >> My application runs as a regular user so it cannot access /sys/kernel/=
debug.
> >>
> >> Having an IOCTL would be ideal if it is not too much work. I'll fall
> >> back to fdinfo for now.
> >>
> >> Thanks, Julian
> >
> > Phew, I'm glad fdinfo suits your needs.
>
> Yeah, exactly my thinking as well :)
>
> A college questioned me this week how to find DMA-buf stats for debugging=
 and it turned out that Google points to the outdated DMA-buf sysfs documen=
tation instead of the debugfs one.
>
> No idea why, maybe we need to improve the documentation here a bit.

Ah, this? https://source.android.com/docs/core/graphics/implement-dma-buf-g=
pu-mem

I will update it to mark it as deprecated, and only applicable to
kernels < 6.18 where CONFIG_DMABUF_SYSFS_STATS was first disabled.

source.android.com updates are usually released with the platform,
which is very soon for Android 17.

> > Adding an ioctl would introduce new UAPI so I think we'd want to avoid
> > that unless absolutely necessary.
>
> CRIU has some similar requirements, e.g. they need to know the exporting =
driver of a DMA-buf.
>
> Not sure if the fdinfo file will be sufficient for that case or not. But =
yeah I agree that we only need this if actually necessary.
>
> Regards,
> Christian.
>
> >
> > Thanks,
> > T.J.
> >
> >>>
> >>> Regards,
> >>> Christian.
> >>>
> >>>>
> >>>> Shipping an entire BPF compiler in my application, which the origina=
l
> >>>> patch suggests as the replacement, is not an option when the removed
> >>>> alternative was simply reading a file.
> >>>>
> >>>> Thanks, Julian
> >>>
>
