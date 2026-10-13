Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F776344D83
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 14:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900322; cv=pass; b=YVF8lUBWUdOChrqpbc/ncZxnAqoTm3c+sdVj35+cXurT26Zee/derhp/ccW4spJu1B9rwL35EwEhrIoXGFufv0d4I6tTZrLN1+spYlbUialBPsJhW5bmZsDK8zgfbFx+04rK4XzqBLka4bbgvuu4iPbTX7IGszkUqHTpG9IrYbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900322; c=relaxed/simple;
	bh=efwpqbn4KqWJ83/+b8Z3Sx2CVCm9Kiqp5MA7PhTFAxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HNH/Wqapgj6djWHAFk6HRXKyBOplrPRNcYKpu/7xa/PrgBWhV5VyBuAzFVS8RLpBEKKlxLQSiz0i/JLvzCi88w8hCTxnLG8SIQui0JH+xmCg+m4ZNtDfgSgfh+dSSVZgvgYxhUr021FlnPToLRaH1TVj0IxKTwt6fMvzUSe/Uec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OILuzQQN; arc=pass smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OILuzQQN"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93cb9e9405fso150226085a.2
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 07:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791900320; cv=none;
        d=google.com; s=arc-20260327;
        b=GiHmF/BQ59LIFWgcOSGNrmeRjecXTgmoR/4oxbdIL39a1hRz/L7mFBo05lA6aiITHv
         WDmVJE4X6+Qru0WMDWZqJJVvM9V6aObF2xs1BrDQmEezV041iCylQlhC6FhH183MmBYI
         I9YlK3MDALvQLRLWnmk72czCk+kBKJRGpSfR2nqhZ9ROFF095BUJZ89Txeof0E8sLbxp
         wA+WvmlTiVzvHP+LRfP87hlsOkvMb9JJIIun5hp+40AiMn+KAvRZrMM/CLSYezCguEJM
         l4srykQKCRjE3oYjJSVCIcTSU3Dovsl/BBFTu/aXOWB3SeojuASy7ErETN/rebVKZlxB
         Kx8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GPXKi2ja3hfSSIKvSqSAyf4VTe85ag1sZhdhO7l5KOM=;
        fh=AMlIMJ2g+f830RntUbMYd6HuYAbltaLJGIzyGWQA0Bk=;
        b=cEj6enG8xEVg4pVl0ArpjOs3weaHYotAWEjyVvQPRVQN7Q8O5CB/o4g6jkKChnsi31
         +oaSNyzb/PlmFUlzmntbTaAVnCyHrjHkQmQ2k57PaPHfFSHVKq2QA8BOBznB6CSrX2IR
         +cYZ1LYcl+U9sCkblJicTPA9wsvPYmsf6UmVwhx89MEaxMFus9KpAA7bi5MmdqBxvRbU
         j4OL+xtHRZrHqAj58ErUz1LbP+hV4cx7XoEBbjCubESZDKGJJ2Xn+ctOgl3zfSqAyHjM
         /FC2nfaNT87r7JjOnYHgEBIDZYgx2Y22uYiK96eWqJ6vNlEzQrF/XGdI7qwtbyqKd/k9
         0G0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791900320; x=1792505120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GPXKi2ja3hfSSIKvSqSAyf4VTe85ag1sZhdhO7l5KOM=;
        b=OILuzQQNGHitUqKN6lSOHQRrLS5lHihOw7H22eT0VBoJwPqFgkweGJNKLeMOqKAjf4
         zvfkgJfM+GXapEQwdQkKBKXeJCp5lVdeKdkQnQ8CeODyN6OfoFsrNvgqGBwLJndNn3yv
         lsdEd0lkmZcaMkxR7sHIQeCzd7PdTPDXo5C8Z2oelqXgQbv7VmWVf94YaXpUjQD9N/I9
         VlniGbbz3zrOHWwP2aVA8tc5tsr72LpZ7gfdg2fJlXEhly2gmVTsSLGJGZfwpb5dI321
         pwTxc8xC7xTcvLqstvZghpwoK/b2LINceM4Sla6EoH8sec8hDHYlfhL1h1W8J28OVIG9
         71iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900320; x=1792505120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPXKi2ja3hfSSIKvSqSAyf4VTe85ag1sZhdhO7l5KOM=;
        b=QFvW4G3cB6tS2w8wUt7A2jh2D6zeHnjFJ6xpGX1+EiXnLP91ZS/j7OlhTsmeI5jaOH
         1Cq/LCEs7HaloTlrLz98S73wEqnKYX+8I7gi2sftR2fkckgBewKBfHO4cTS4KEHWSTPP
         wY/2/VKf44onYE9f6fXalgi7a3fVlk8rp/NYMb5EQg+/gqxutSvXHgf2yp1YRTMSHFoT
         5jQffHQ8+kxs3cyEJlNvyRBiGfGamRbLPRuC5DIIVDFXyJckYNyco09ud6z29+PONB5E
         t+LDtw+yhKi4GIbTMMe7zbeea2AWo2hdFeX0J/wXek0qoKWxnX5GDCQ8Xw8LKzrKgn8x
         pCkg==
X-Forwarded-Encrypted: i=1; AKwUvBzjD2j6pTuyY4Xer9Ai2OJftgxjH/kF1P2sjWvTbFJMXXLnZZRsFszr+4jpxEILYxkP6Va5w3rJrIs=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5IZ1pbGBEDQymadmEpFTnm/2W1VxoeXktqGBPyGQi/NXhhL6x
	00oqaozXgLBGLLzKN54O5k+HH/Nvw+EMwjQRGvLhJ+PSNKQkZLW9AX5Dev000B7zfqBNTW2Pl+0
	pcWEOji0eK3t6RzMPnmuMLvRtfN+CNc8=
X-Gm-Gg: AYBFou2l9O8EZr6qQ56GZ0wDn3XtMbCL+Mi4AXBtst4yqoBjt+/rGynjc5mbMUVTmmV
	eRyzf2+b5SuTyXyoOm1LSN46MEgM19ioSfDEss2V0je6DxDtdEKZ7uYHlquwvv5cqkz1F8TeBhn
	f6SEp9WnRLM7+45Bo8W3uFHqh2O9+2ipbg+ceERySjxVFLwofJKN//n8PtcbEy+3ewoNW1QIPin
	DzoycRpECPzArY6wzvZ0gOQ4O9Hjth65JtYlGerKw/h2DjVB0CcKfTeRz/M/zYq4aD2wDHgARk5
	E/e/V7+INqr9t6qXMXt4j79yyHiNAMdmp6aNxiIWO6aWGAiph5UFeHAnwejJsz2hJrMS+PQQxqO
	1RTNn3ANA4j8uf2BMikxIZBs=
X-Received: by 2002:a05:620a:3947:b0:93e:78b7:fa4e with SMTP id
 af79cd13be357-93ebd24b2fcmr2220976385a.37.1791900320079; Tue, 13 Oct 2026
 07:05:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005171529.1378809-1-kunwu.chan@gmail.com>
 <20261005171529.1378809-9-kunwu.chan@gmail.com> <as3aMmPdCHCXW6Ci@U-YXDQC754-96.local>
 <as4ooZSWA2lAIceu@tardis.local> <ef3fd68d-f35e-4071-9523-0cd14396d860@efficios.com>
In-Reply-To: <ef3fd68d-f35e-4071-9523-0cd14396d860@efficios.com>
From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Tue, 13 Oct 2026 22:05:08 +0800
X-Gm-Features: AclHuK9Y6wjNtKPnooCMgRZOapMzF0kyKCufRscUU_wsuFWoqVB6jP59bjMM3m0
Message-ID: <CAJhGHyBd5wuLO9H7bHJDO==2=z8MGQ3ehvszLiB1brztpRXu8A@mail.gmail.com>
Subject: Re: [PATCH RFC v3 08/15] locking/lockdep: use hazptr to wait for
 dynamic key lookups
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Boqun Feng <boqun@kernel.org>, Kunwu Chan <kunwu.chan@gmail.com>, paulmck@kernel.org, 
	corbet@lwn.net, mingo@redhat.com, frederic@kernel.org, 
	neeraj.upadhyay@kernel.org, josh@joshtriplett.org, urezki@gmail.com, 
	dave@stgolabs.net, lianux.mm@gmail.com, stern@rowland.harvard.edu, 
	parri.andrea@gmail.com, will@kernel.org, peterz@infradead.org, 
	npiggin@gmail.com, dhowells@redhat.com, j.alglave@ucl.ac.uk, 
	luc.maranget@inria.fr, akiyks@gmail.com, dlustig@nvidia.com, 
	joelagnelf@nvidia.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	longman@redhat.com, rostedt@goodmis.org, qiang.zhang@linux.dev, 
	brads@mainlining.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, lkmm@lists.linux.dev, linux-doc@vger.kernel.org, 
	rcu@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 9:04=E2=80=AFPM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> On 2026-10-13 08:48, Boqun Feng wrote:
> > On Tue, Oct 13, 2026 at 03:40:36PM +0800, Lai Jiangshan wrote:
> [...]
> >>
> >> This breaks the forward-progress argument used by the underlying
> >> hazptr implementation: after removing an object from publication,
> >> there should not be a continuing stream of new readers acquiring
> >> that same object. Here, the bucket is never unpublished.
> >>
> >> For example, let B be the bucket containing key K:
> >>
> >>    Updater                    Reader                 Scan kthread
> >>    -------                    ------                 ------------
> >>    Unlink K from B
> >>    hazptr_synchronize(B)
> >>                               Acquire B
> >>                                                      Observe B;
> >>                                                      retain waiter
> >>                               Release B
> >>                               Acquire B again
> >>                                                      Observe B;
> >>                                                      retain waiter
> >>                               Release B
> >>                               ...                    ...
> >>
> >
> > This is more of an implementation issue,
> I agree with Boqun about the point that this is really an implementation
> issue.
>
> If we care about forward progress in the scenario of a repeated
> address reuse, we just need to wire up a "0/1" low bit phase tag and
> make hazptr acquire pick it up and set it within its hazptr slot. This
> will ensure forward progress in that scenario. hazptr synchronzie
> would therefore flip this phase between 0 and 1, and check that the
> pointer it's looking for is not set in the other phase, in alternance,
> handling both phases within one synchronize. Indeed, this phase concept
> comes from the realm of RCU implementations.

Regardless of which implementation approach is adopted, this would effectiv=
ely
introduce a new read-side synchronization mechanism based on hazard pointer=
s.
I would prefer to see it introduced under a distinct name in the
kernel, so that its
semantics and intended usage can be clearly distinguished from those of
conventional hazard pointers.

Thanks,
Lai

>
> I think that the overall mindset so far has been "RCU does this" and
> "Hazard pointers do this" as if those were entirely predefined
> mechanisms. I think the way forward is not "one or the other", but
> rather to combine the strengths of each of those mechanisms into
> something better.
>
> Thanks,
>
> Mathieu
>
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> https://www.efficios.com
