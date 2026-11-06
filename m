Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793932912;
	b=meuYMMh9/GZ4AJ2YG8oN+qKiLMhNLiagEe0EJVTzQQil8ZJqCYr6h6YlJzOXxK6QX2vZ
	 eyl5l1/u1cBmLEWgp6BBofYk5k0naUgJCWVpw6g8JbbO2JejGigv2bL4r5rzeCn40CNti
	 uQ2NGvpJIs6ggigb+ZCMMdfzbxcd3Yf8o/IUyLB4DcxeciM9V4vBuqvKRRM8M6IwReg9f
	 xycek2XtnsDnhIEYZQf/57MJp2RctGdQly4h7iXwsOMvbXZEGd6s6qQtyVCuahTW0jjMC
	 /ri3dPik/suo69qp6nAjTwhTafLhChFs6yQqoHDCuzmqVkbQL2LSqKTBlqVgAJ0vfeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rXPT9ftSD1W4Pls/uGVHMwPU27w36zSFUh8Oy468MZ0=;
	b=QHTI7V2AVV94M3+M5GMFNgevqk/w2vhqalijLq27MeF9o4Od9p/kzlBncrRaSBNJq0Sw
	 UP3X56RzJxXp0IJMjJPXlLSLeX42KPosyXLkj9tGqZsPlkUZIjTkDCh3/6Rj0cPNSviTp
	 6As03OweM83z9PR5iAOpqbsty7gzrlkjy/v6/zkEHsVpsrZaYnFkQsg4amWN3XkAmw9QR
	 Ax8UVrLh5rzkBNI6yOIjPMCEd4aFufW9tWvAWiZHN09WRt1OXod7jMyOjpnG0juGQXe0j
	 xYS9l3nlkfl5HHltf5Kfm1EuSbm4r/mseelwBrBESY0wGPkV0Huifp8htYGpmk5qkHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRSk5lqN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE36606A328
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 02:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AE36606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRSk5lqN
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso156140f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 18:41:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793932910; cv=none;
        d=google.com; s=arc-20260327;
        b=LHgvPyx2eg1gFh0IHD6s9juobBzNLItvyi1SlWYKuZlmn121mLQ6gBZqSAv6l1N5r7
         a+vAaClOSf2oP/8E3IkeVCIyfHxhs1nH0K+md50PejnMAg7uJ14WcS0w+84fFCtNlaoU
         s4Ph+z8wgqTFfjZqhZJIvSgv6FGzhWABV3/7ckWL5I5FeLCGVoYoQ1Q3GyJg4kr8QZs2
         MWZhXgSLy+dW8Y9WxD6dCoUZf2G6F48BSHb7eshNlEusNP7kushrC6PCXOXXJ8vmlzpI
         xM6BY307F2pA77TdH+/EmA2KqEnUFVPbjx2+x7f9V0wI1yD12cpZllCNh0ro0Exz8Xk3
         /M7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rXPT9ftSD1W4Pls/uGVHMwPU27w36zSFUh8Oy468MZ0=;
        fh=kfc5AbSWOoceKa3lHV31JF84ug7Bg7z+q2PbPAsXv/Y=;
        b=KDHenAbLkgRTQuu+3CFTkbekpgfLC0PIQGlmLynNv0kaQtaMSskpYiBV7riRuFnAHH
         +E3Bcl2ta1Ym1Gho80khvQoyvdvqkK1E1Xjg0SDfDn7lYQjYDvdmvJRYBbNZLkvjd6H1
         03UOhwfP/Q8bVHMczEEknGRHMCSmMgycPm2kUfOEljjn3N20pxKefuQIFWAqYx+X1RM+
         m3xrnOXy4vn23wrIWxIS2Ze0y0pKBoF6LN4RNrPdnoBnj0nrVizMGBFprkOlwkA9BBAS
         g8+o+iHTqOf1Mx6FUFVTxDp1PfEeCJ2jxDd7Hw6/tYL6ldkaUy6QiImPvGnbPZTonz6F
         0X2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793932910; x=1794537710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rXPT9ftSD1W4Pls/uGVHMwPU27w36zSFUh8Oy468MZ0=;
        b=NRSk5lqNe80aQecN8piJscSed2+4dtCYF9cGKNuDh3/Ps2IsTNKGDK0qxR3Ll2RHQN
         wJSBtjwUVLEnQYuobMm18u8tV1W6vuW7HlIVYLU1QhRckCEwhKSJneuJ15I/923U8H+1
         5zCzKUBMJDwAercoUth0AkAAHtDsSQVIcusHk1QTTZVyHXmlR3/KDCgdjbcIMkPKfBVn
         0vVsedn4fTjRLwtQKkjKzph/kJhi0E+M5N8jRlNrTsYUf/u4mYkOBxz8xg/SIbK9XgXv
         3HzEyd2rUKbDT9HV6yzVwcHhcwlj3kLSDIMfLFb6nBw5ePVFDceVrelnSpGWxmV+zcWq
         fwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793932910; x=1794537710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rXPT9ftSD1W4Pls/uGVHMwPU27w36zSFUh8Oy468MZ0=;
        b=rBnCKGv/lwQfMTqKcfs84Geqw/HV5heiD2YXkeDjVWkqtG9MpVhf+aOyNXkoXH5/vl
         5/Efwy3Q5lqdZQ4FtgLtrWrRQBV2bIwP58QuIGTaL7+9R9nzNQiDPHXmH+DHAelraAKC
         sAKYN5G96HbZTQTQdw7is9TsCoE1vvIhIuC/xKXImrO2SwW793oxGCZeQd1q95U+W1mG
         Vb7Cgku9EY1wCcU6k+l/RsSDzduWKTnHVEjasS/C7drOblfDDuJLEaK63DGZusqeLMi4
         e6cbXRpuZLYKINIF4It6DjojtL+LrNZ+/C6y/HUFCZFYeD1Y8u7DhPq67PBiz7Sn8tq8
         hglw==
X-Forwarded-Encrypted: i=1; AKwUvBxxWCFpZmQlEeLPqTCENLxp+PzHzjabyfL0gR+/3f8D3gFx5cCf/vH2woQ0bQ5jlv3n3xGSu7sNtIo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zxwJuMigQ3V5ubD92Huvv3j/zy+sBS7pSDeE1tedDd74iq8Nf
	UiPHv4Ig1x92ZXoJ1TdhxnQGzWWREhqvHyDEL+sc5NsOyQK/TBftKPMtCACGvibTEl/2ZUbNqCm
	EtJxauLK/HwnkN0LD/oqENv7ZOZIMrYA=
X-Gm-Gg: AYBFou1h+PA/K8RTn0dgOEwO2nTSDQe7RGEleaM5j3qcoDTwCBrPp4KI9jR7WS+vmJY
	CjQvlMZjwuFeESax9nFMyK/Ii/Z2vIK1Yk0rXlRfp3oT06GbOEV56OQyAl2jkjQOcEo2qzGwCzo
	vMQXrSkNViBK2Sq0ae3yu3siXQMMPh4D/WNUszRxnw8cDMGnBMHy3GWXajSKrsFuV7kYJD5wqZ6
	as1cWHuN8M17Q17CpsGcerjODos5oi/axftNQkXWylcvsO0dj5W9qDp3dtdqtI58s5tNdiI6WcZ
	fE1C2hFlNZTN19GXuzFFoth7WynfhXMViEE8mx9fx7i3jsg3xdIfPhnvQoI9W39uOzIOgGGE8Hy
	0FueT9mzCm6POrJKSFQAlNA+Re9KssRosO2MjkKzgm96oGAKEmciSL/gFYTw=
X-Received: by 2002:a05:600c:4f13:b0:4a1:d8fc:8165 with SMTP id
 5b1f17b1804b1-4b6de1c645dmr14873335e9.20.1793932909304; Thu, 05 Nov 2026
 18:41:49 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009160010.1829642-1-kunwu.chan@gmail.com>
 <20261009160010.1829642-2-kunwu.chan@gmail.com> <20261012104208.GQ4121339@noisy.programming.kicks-ass.net>
 <CAN_Opa9S2ObHYqa+w5Tqh8PFPRijo=iUZDk97aCYmNZT_75yVQ@mail.gmail.com>
In-Reply-To: <CAN_Opa9S2ObHYqa+w5Tqh8PFPRijo=iUZDk97aCYmNZT_75yVQ@mail.gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 6 Nov 2026 10:41:37 +0800
X-Gm-Features: AclHuK8qaZa9j-EaRF6SECEA-dJP4xeAumfQIepVXAc0Je3LqIVzsucrbjhA_sM
Message-ID: <CAN_Opa96ww9yOwDVOERLkrByxMU6Dha9f5=i2vFjAWSr4hvUYg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] perf/core: add AUX buffer ownership for kernel events
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, sj@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, james.clark@linaro.org, 
	akpm@linux-foundation.org, lianux.mm@gmail.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, wangkefeng.wang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 5:41=E2=80=AFPM KunWu Chan <kunwu.chan@gmail.com> w=
rote:
>
> On Mon, Oct 12, 2026 at 6:42=E2=80=AFPM Peter Zijlstra <peterz@infradead.=
org> wrote:
> >
> > On Fri, Oct 09, 2026 at 11:59:48PM +0800, Kunwu Chan wrote:
> > > Add an in-kernel AUX owner reference and setup/release helpers for
> > > kernel-created perf events that need an AUX buffer without a userspac=
e
> > > mmap.  The setup path validates that the event is a kernel event with
> > > no parent, rejects non-power-of-two page counts and negative watermar=
k
> > > values, allocates the perf buffer and AUX pages, records the kernel
> > > owner, and attaches the buffer under the same lock.
> > >
> > > perf_event_release_aux() stops AUX writers, frees AUX storage, and
> > > detaches the buffer, in that order, matching the AUX teardown orderin=
g
> > > of perf_mmap_close(): perf_pmu_output_stop() walks event->rb->event_l=
ist
> > > and rb_free_aux() must run while the buffer is still referenced by th=
e
> > > event.  The single event->rb reference is dropped by
> > > ring_buffer_attach(event, NULL) itself, so the release path does not
> > > put it again.
> > >
> > > Both functions run under event->mmap_mutex, the lock that already
> > > serialises ring-buffer attach/detach transitions for an event:
> > > perf_mmap(), perf_mmap_close(), _perf_event_set_output() and
> > > _free_event() all hold it around ring_buffer_attach().  Concurrent
> > > perf_event_release_aux() callers therefore go through the same
> > > serialisation point, and a second release call, or a release of a
> > > buffer this API does not own, is a no-op.
> > >
> > > Keep aux_mmap_count dedicated to userspace mappings.
> > > perf_aux_output_begin() accepts a writer while either a userspace or =
kernel
> > > owner remains, preserving the existing teardown ordering.
> > >
> >
> > > diff --git a/kernel/events/internal.h b/kernel/events/internal.h
> > > index c03c4f2eea57..760b7659ad87 100644
> > > --- a/kernel/events/internal.h
> > > +++ b/kernel/events/internal.h
> > > @@ -48,6 +48,12 @@ struct perf_buffer {
> > >       int                             aux_nr_pages;
> > >       int                             aux_overwrite;
> > >       refcount_t                      aux_mmap_count;
> > > +     /*
> > > +      * In-kernel AUX owner reference, set by perf_event_setup_aux()=
:
> > > +      * admits writers and ties the AUX teardown to
> > > +      * perf_event_release_aux() when no userspace mmap holds the bu=
ffer.
> > > +      */
> > > +     refcount_t                      aux_kernel_count;
> > >       unsigned long                   aux_mmap_locked;
> > >       void                            (*free_aux)(void *);
> > >       refcount_t                      aux_refcount;
> >
> > This doesn't make sense to me. If the even is a kernel event, then ther=
e
> > cannot be mmap users, so adding another refcount is just for giggles?
>
> Hi Peter,
>
> I added `aux_kernel_count` to keep `aux_mmap_count`
> specific to userspace mappings. The two paths have different
> teardown responsibilities: `perf_mmap_close()` handles mmap
> cleanup, while `perf_event_release_aux()` stops AUX output,
> frees the AUX pages and detaches the buffer for a kernel
> consumer.
>
> `perf_aux_output_begin()` checks both counts so writers are
> admitted while either owner remains.
>
> Would you suggest a simpler approach here?
>
> Thanks,
> Kunwu

Gentle ping.

On your aux_kernel_count question: the separate count
is for teardown, not admission control.

When aux_mmap_count reaches zero, perf_mmap_close() subtracts from
mmap_user->locked_vm and vma->vm_mm->pinned_vm before calling
rb_free_aux().
A kernel owner has neither of these accounting requirements.

Reusing the count would therefore require either branching in
perf_mmap_close() on owner type, or duplicating the teardown in
release_aux().
Keeping separate counts lets each side handle its
own teardown without needing to know about the other.

If you'd prefer a single count with teardown selected by owner type,
I'm happy to rework it.

Thanks,
Kunwu
