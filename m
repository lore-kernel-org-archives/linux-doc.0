Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793754880;
	b=ZAWBPEWbhLnL41/t4RRiS00rZsu+HCSVsKbxts66DeH7DmW612IojmLbHqRQfogiLY+H
	 AqAORyJ/NLALTZhL26EZop22Yqqg+J+/i5JZajUUufkfydk6VhM7OUu999Js0USoWP7JY
	 j0d2mlMlwrvaSGELB6jSOj28QHdUdcyBdkJGnmbQ3//mBg4bqBI7JwL+1zd70/zf9YNtO
	 I7dpoqi+NCSZMRJxIoDImC/1KVl8SPBTZowXTHOWn1KcMPCw1MFIC4ySuHzQmHjLthxt9
	 iJTbxLhZz5cib73JMHCSGGZ3NmfTVLwE6gslKYKjHfZLOdR7ZopK8H2X7EbKJNKgEIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iGrlFhobszoDubbYHr5z1P67t+I99oDwFpibAkY+FJc=;
	b=hJm523dG7fLjxCHxOFxbgTOSCwdmZ4s2OY9I/ufzZUpzio1Ma14vET6DDLDLQ3+TOk10
	 EsmkCQXBSM7A61jDnxDRMF9jBWCwphkBGVV6JPXg/Pt00a5WaWLL1M4cMeiKdQa3Uo12Q
	 xyOkfLidt2crKktEH88yEByw8pFJ1Js1C5xztbPmflakAwu1MAvA2r0Hly/VR0mH3Kl16
	 Eu3iBJWbFQubxlaEVAaHz9ADv2S7/Z+nEW/D6m2RpFiYgsHMynYkShuXTSa6TDDi2cbit
	 TjtiNuFE6BASGZLdNiGTFSKTSiUm5FT2zwhhHFTi5EXOSBmzIFNx19YFHGLTcKC57qg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IR9x7CF7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F545606A32C
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 01:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F545606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IR9x7CF7
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso2008143a12.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 17:14:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793754879; cv=none;
        d=google.com; s=arc-20260327;
        b=jeeMeZpQsuZy0vOGGcymuR1T4t4+NOxt8JG1fTfSAzKCXzIdEAd8rGVEpsDHMQYr6x
         pzKymJOMnCrZExm1cYrxKAXDVR88pzU+STMs+mMEKUKSxOC9utyFoX7Bjw0RW/rboOMp
         dFx1KGgYj/qN/98+4IOBR+U2NeWK+iEc4LOy8qie1zSbaEEQDMaET8QbqHkVBYaG8aKZ
         3cLc9jK+1d8mVI/2m+eBCWl+y7rSZaEdc2TdBQS+Q6G814P0uhLwPf7ZOVd0fKxLQaAU
         d0Kk2iHX3VIw22Sol4GjnA2D1Do8pAm/h3twf41h3C8MPVB8PF5mJZ+s6Vm8vilH+pFU
         wj9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iGrlFhobszoDubbYHr5z1P67t+I99oDwFpibAkY+FJc=;
        fh=AYRZP+Js07hi1KtBr7DgLEjOEz5v1HUbPaK1OM5viBg=;
        b=IOFDCOH5XeBNKAVZLshGBx76i3y6HugfK7zhVNa6gDZytY2WT7NJx0LbYwUVdS7aap
         DxT4S400XsEd/ar1qiTNqUzW+6DBqwYsPH3d2z65uYQCaqpHfl3dLARRPTwmLKI08Dr3
         69Z1aUnpDNZ7xTRNpTKhhLa5KBdzfjtqWxvntQKzNvd8mCrZmlOd3inIi/RKBxK457qH
         dSarq1mHPIBHZU2WBrH3/XDL29t/4BEN6/85rkLqzh3zSJM1345CbHTF7jHiADCkYoHY
         J57+baTLpxE5oC99/nSmZD+EYnF3gUVHPo3IOQE4FQIohHVL7qmoHuhZhhyu3X/Apru2
         a9Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793754879; x=1794359679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iGrlFhobszoDubbYHr5z1P67t+I99oDwFpibAkY+FJc=;
        b=IR9x7CF7c4Mx0rniIXPJTap8Sl2/dr9gnbELz6lBJ5PjaAf02D1YAm2LSs37v81qCo
         DJ71amOTkdnMI00EPyhPmP/6O+dR1fHBGhBB8N08HS6IJb3bavA83yLJPIT5q1bmVYfO
         U9I8Mv1AhAISD9gQHYCQU9CqQs9uRSuFf/GBXxNes4jOmAx8FJ1/EC6+PRLfHwtyJlGh
         4bs/oRUDp3W+5e0rZ33XgLzI9zfcEnyXv3UPZwfkyHp9gepUycTy312afEDxLJBu+uDY
         JrNO004oX9+ApUMczZEAcZ/liFPBCKXYAxWJ3CGOVdhpd9Rcsvf05tTRbO/lhbaNTijb
         aS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793754879; x=1794359679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGrlFhobszoDubbYHr5z1P67t+I99oDwFpibAkY+FJc=;
        b=u79lSs7a0An54+1E0OsttpRMeNkNMj8oK6gzPiCJlZCTwx2xFwhdj3nr+3JSbRCY/m
         UxrcvMCOn8DLFr6Km5ZrsJqM4en6dBXAW2Yiq6IK2SkJtObDNrXNTIXYDZ/uIAiJtPi0
         zaaYQ8It7+vL0uFjbStAagjrj0mFu/fF3fGiqmAoW+kCazasrt93w+tuJY+ULvz8eNKy
         LbAFupKDGriLdfnKkXcKsTX1rx1UXcfJ6AnrznQoXU6JTsj17Lu9qdZ8jiY4bZ6nOTsk
         afnAOQbNhvdBmRmHAK3xFamlgVzWhOEKKyjEruyTfIGbwqM0AkkjdHQFnX3GjsAWMfAV
         hjsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfmPe5rgZJvZBMFDuKTLTpcw0O6WWWeMsHwWViZFlbaPZ/nOaz/0arRcKaIQxWBGv1mGagRDgZ2ZA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4Tnf9EA0iSeSB2vZYMITxZ0QGF3f+fjcDas8f4V0L/nGJtX02
	n6QPSPzA2TDstZRbpvXvoIy23C5//25FTpO9mpdlQfqanmIatQawJz/OTWljptcfRUfswAmkJB0
	+kMKPausxLwQ4XBrJ1kmcirIMgSoZrLvXpE6Szff7
X-Gm-Gg: AYBFou1ov8kcynn1XRQi4enMlv9NzKzRKb08wHegR8An58UCIWn1Egyx0pj4xe3IhDq
	h4NL5jxQNjjlbsSgtn73G/tflgyiWKJTvzI3O3sHLDEi6BQVgHrD1WOsA9mdHn+ZxyMOaz7BY9x
	V+dq8OiqItyU2eEWxEX6/R5e1pcbm+O9f1Dv8NcjJycuwGx3q6FNMcRJEpFpLwvkzffC3OA5DYy
	jAiiGITRCI4oz7njAySARBOftshTYHEc5VDg1Cr32alZtmw2uUK/JIx698gF8x4Us9k+qMHk5hU
	mXYNZiSZCq9e6mVDGuzJzN3C22JnFqFYezBI/t5JxJIylxz64r0ulNy0MzFTZjjwh+BfzQSlgw/
	Gmok9c5GZGvDpiIrpNBarTusnaFcCHkhjm+cNSBZt3w6qORI91yby/S972VajDYljHTujPgk=
X-Received: by 2002:a17:906:9946:b0:c4d:939:526b with SMTP id
 a640c23a62f3a-c4d0939530bmr80653766b.0.1793754878307; Tue, 03 Nov 2026
 17:14:38 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-9-wusamuel@google.com>
 <20261028134012.01d52e94@pumpkin> <CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
 <20261030100215.6f8e0d4f@pumpkin>
In-Reply-To: <20261030100215.6f8e0d4f@pumpkin>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 3 Nov 2026 17:14:26 -0800
X-Gm-Features: AclHuK-cSPxC_sFXLW9VVvDKj-9cMyP8tHQ9MAfu7xEMrtFl6vQvJ8w_LlboHFk
Message-ID: <CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: David Laight <david.laight.linux@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 3:02=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Thu, 29 Oct 2026 15:05:45 -0700
> Samuel Wu <wusamuel@google.com> wrote:
[...]
> > BY_NAME matches names exactly, like kallsyms_lookup_name(), so they
> > would be different symbols at different addresses. Please correct me
> > if I'm missing something here!
>
> Only that the user might really want one of the copies.
> Sometimes there is only the copy.

Good point. I'll have v3 add KALLSYMS_F_PREFIX + pos/next_pos
pagination to cover these. A prefix query for "foo." also finds the
copies when plain foo does not exist (expanded on this in my reply to
Andrii's Oct 30 mail in this thread).

[...]
> > > Have you tried measuring it with my patches that speed up the kernel
> > > 'search by name' code?
> > > That speeds the lookup by a factor of ~18 (testing the code in usersp=
ace).
> >
> > Not yet. Can you point me to the latest version? Happy to try it out.
>
> I've just forwarded you all the patches.
> (They include patches to the tests and scripts/kallsyms)
> I'll copy you (and the other people getting this email) for v3.

Thanks for forwarding the patches! I'll be looking out for your v3. I
tested them across baseline, baseline + my series, and baseline + my
series + your series, using the same two benchmarks and setups as v2
patchseries:

Loading a BPF program with 11 typeless ksyms via libbpf (8-CPU x86-64
Cuttlefish VM, 273k /proc/kallsyms lines; BY_NAME, unfiltered, so each
query also scans ~35.8k module symbols for ambiguity):
- Base: 156.1 ms
- Base + my v3 series: 2.05 ms
- Base + my v3 series + your v2 series: 1.95 ms

Perfetto symbolizer (8-CPU x86-64 VM, 175k /proc/kallsyms lines;
BY_ADDR; init / 50k cached symbolizations):
- Base: 129.1 ms / 28.0 ms
- Base + my v3 series: 0.04 ms / 3.4 ms
- Base + my v3 series + your v2 series: 0.04 ms / 3.1 ms

I'm seeing your series help most when the vmlinux name search
dominates: on the Cuttlefish VM, a vmlinux-filtered BY_NAME call is
5-7x faster (hit: 8.3 us -> 1.7 us, miss: 9.5 us -> 1.4 us).

[...]
> > > > +     __u64 query_flags;      /* in - query mode (enum kallsyms_que=
ry_flags) */
>
> There is no need for a command here - use the ioctl cmd.

Agreed, done in v3
