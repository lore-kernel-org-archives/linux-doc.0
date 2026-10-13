Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9370952F260
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 17:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914142; cv=pass; b=JLK/D53hZcpdqDw5AMGwvC0iAtqMbVevSFhJOASYqonWnRyqBgqhHI6vAZo/00v/dYt3AdWQMl3b/wSMX3UdaBebBVPvP7imDSX9NPLhVrM4vqiH1AIAk0/z6LZdr9vfyN4rWdoIfh3UlkwHBISHAgcmVC0X0WFrylGEIgNqTLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914142; c=relaxed/simple;
	bh=SQgjO5qMcrjkdqWkFJWQ2/5aeiMU8vBt2jrTtWhC0bw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t5wci58IoYawcfXltx25csxR0ubRzD1oWu/5AaRuY1CIvESLpq8EX95d7rl6FCAJ01o2ZFineg5Y4tMlrrMQDCpCBMmLob9ORZx16LJsDuLmTD9ZNebYfTwRBwSQ39J7eSL9Kx7jiI+DKAFTCe6ZWbcvUI6W9pojiDCFXROL9f8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b=JNXQg/VP; arc=pass smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b="JNXQg/VP"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-745497ac8fcso932868137.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 10:55:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791914138; cv=none;
        d=google.com; s=arc-20260327;
        b=WDGAWkmx0Q0NEAjfz3Sy9AkqQwOXXouiYPo+ooJS8LtC0Ragno4goUweIz0ExhozGm
         drxyWzK7NMLW8wyBCK98pjqLpjkAzbscr6JNErmz//N3/CF8FZZ7xE7Z4qTN+jzCKeST
         fymQGnXe1eiMEUrrYHLsfURAd+hkKBIF1Kw6Ms0JXkhKQxYJZmoLgB6AFM2IWTVOygqv
         Tf768d722m4W+515OtxzjeyoB3tKs50kv7PrTY7H3lYQChFJHLHeNua8BT8ZYnzDdZ5w
         Q+rLE6muCdBIPKFeH0RUId8/d7Tbx5pl8b+Pur6Z1PYGZ/2twbUTBJyWbcUn8gkP62vM
         Qp0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xw10GollzpDXFQSLBXSRG9PlzHoCfGflID06EBih6gE=;
        fh=Fmug7SFcBBRuffrGgF/JeAvSD+A2946db9C3BIMnJSc=;
        b=dTgymx/hb2DN1mRdPvjG4vJibKRIHgvB0idmgTyPbq5/irIXh6AgD2H7UUUZrW97Vi
         ecEnuLrJ1VOctdi6/HLcrcs0jjEVU0FZlsWbL3wJX0kuhlLpeBpq+X4Tkt1mkVG/ri6w
         Ul57Q8t8pr7gqLHINs0n+VotkW5gEvqfIX3RRL4V0GCMU2nMWsXQHWVO7K6b/W0jimuI
         4Jmmvrn8C/rsu97HK8mjrGpmb1AuT5bfRhE/Hwl4LVZKvgVCawc1mUy45ld42SUHYPL3
         IsnYbBzAUYIHnKPsJDfeaNli/y6L9RBPJXip746ukEKy3GEzg6qHvwM9vSDkNoSiTueW
         6yfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1791914138; x=1792518938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xw10GollzpDXFQSLBXSRG9PlzHoCfGflID06EBih6gE=;
        b=JNXQg/VPNBWzxhfwnGsYc8nw7bu2uInI8zdyWeaDgFlcDS9O4Go81kChcz9YmrbGiu
         tidJ+GJ741R/bS9MC0l++8xX/cIuOEGxn2mC0tAon5YQ7a6k/yiAXD13xhozJ3PwwALm
         z7qUefr4rpgAEJjWdYjAbiXJ3IfCrey3Sknd+DDQePCmufbcccnLS5l1fWtf2PcMJ6do
         0B/mVcSCVGy126WhsPGX3R7PFDOKjPla98LnX8eyZV+jAjb5eyEPOLsDbPvZPND/2pE9
         aex0p1YZdx2wa4UQ+VNHnwuqU3MmQ5c2WvHZckXykd1ioU7bfUv75p/kIWyM4A990Y7q
         P0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914138; x=1792518938;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xw10GollzpDXFQSLBXSRG9PlzHoCfGflID06EBih6gE=;
        b=KLaNjqJYDxUOmJBi1yGl0gfyE0lkuAqDXY6T4EXutJgZC9Gsinx/mrrr+8DQaAwFd9
         eLl2Siy3S9eNL/LImXxX+SmZRxkx0RcKc4i1o7juXkdsLn9UwoCtKRSy43UBpw0I3TOk
         OHdpTPXc2gAbrl01ePPxqzfDsBx0/049VHZC22mEYBgLaCqimmJsSbHmoz/yrkAC9Ck4
         m0uI20M+SVoRPt0nAsswumu1J8pwHn/V8XIDZPDvde8YcKH3JQtBL2wg1UKQUD6B3sxp
         fKTCa2vMsnUeCTzfC/7yH0img5eh3/gxXiHXACy9JWHsaF6Y8ybXkNgtX8ry9sIrJYgu
         Ohcw==
X-Forwarded-Encrypted: i=1; AKwUvBxUJnUnUEpseEjEikHLYLZC3tdAiOWbbSosyW+kzhmv8z36GIGpgvKVnjrhKuB5kdaXUi/A848KJ4Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXcAezHo8MR9KIitofDsUViDUAUYgm5W/vchSuIQdaPGjTw/pI
	qFbDIiRVtIEQ9SfUfdByldhXallioGW/O3LnRX2hIaC7a4XiV+O6ZXGJiyjW2ENc1xncFEUxkaQ
	jeXOWPVEZ1GkJPIqLBf5rTJl4jW+eKSeWEKR3HmChChc0sWUh0tbmAgThQw==
X-Gm-Gg: AYBFou3XfGVbw6x7WyF+n9Ua8rW3OBSejYV+SeMlFOw9zck3lK41SlaUzdZ1Aac84oa
	UFkLRPBnFaxTqjxYUk6QYq99mmpHjtVb86x553s1reOByA87vE1xX7cFdAGkMskU0TXMVe88k8L
	Tm4MsciDyNInQkU7tKKywSUIj9ve1Cn3mrF3bEIUVPQTo4WzBNy8e+Sl3q6IgiXZJgylrbdVR5G
	znz22n+PP7pQXQyriaIjIoEzwTpx14IflM2AOJd8lXB7fPtrReIyTh0DVZy1M9El9qkKuNFEcMu
	uUUWRYc1vaGwk3HXBTpcHV0uXY4I+iDe3vUtwip5DczdzJIMc0l6++OpJZW5hydez+IuGPwR8F5
	kOUy6d+xItmJ+ePfVB2HvSwfKT3ktbCHeq1LRP7aH0wD2B/Rpo4XX6Ek8L64sn24KY1XeWQLIL8
	AO4XmqBJR/4HFKnyIBk9u4YKDdEf3tm8mwQkI45gs=
X-Received: by 2002:a05:6102:f85:b0:7af:4a46:4c12 with SMTP id
 ada2fe7eead31-7cb36987a6bmr3459618137.2.1791914138076; Tue, 13 Oct 2026
 10:55:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013002701.1957686-1-rjethwani@purestorage.com> <as37-A3DKONrFuxs@krikkit>
In-Reply-To: <as37-A3DKONrFuxs@krikkit>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Tue, 13 Oct 2026 10:55:26 -0700
X-Gm-Features: AclHuK_wQkqntYOIxy2Ar-py7TItAzxl71amVVkxjGfGZLHJpFnvXugBsb0o8yY
Message-ID: <CAKaoeS1E7jMyP8F9a+SAheE4+o6RG2VOdA5uiSjZe5yX+E0wEg@mail.gmail.com>
Subject: Re: [PATCH net] tls: refuse RX records after record-number exhaustion
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: Jakub Kicinski <kuba@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 2:38=E2=80=AFAM Sabrina Dubroca <sd@queasysnail.net=
> wrote:
>
> 2026-10-12, 18:27:01 -0600, Rishikesh Jethwani wrote:
> > A receive socket records sequence-number exhaustion only in sk_err.
> > After processing record UINT64_MAX, it advances the counter to zero and
> > reports EBADMSG, but SO_ERROR or sock_error() can clear that error.
>
> I vaguely remember a discussion around making some fatal errors more
> permanent (ie not use sk_err).

Do you have a pointer to that thread? If there's a preferred way to make
these errors sticky, I'd rather use it than add a one-off flag.

> > parser-ready record also bypasses the socket-error check in the record
> > wait. The receiver can then accept a record authenticated for sequence
> > zero under the same exhausted key.
>
> I guess, but what's the problem with wrapping as long as we don't
> reuse the same record number?

You're right, in practice there isn't one. The only way to get there is
for userspace to install a rec_seq close to the limit, so sequence 0 was
never used under that key and nothing can be replayed. Starting there
already breaks RFC 8446 5.3, which requires the first record under a
key to use sequence number 0.

What's left is consistency. Today the wrap gives at most one EBADMSG,
and none if the next record has already been parsed. After that recv
continues at record 0, which is neither rekeying nor terminating. TX
behaves the same way: the UINT64_MAX record is queued, and it goes out
once SO_ERROR is cleared.

So I'll drop the security framing and the Fixes tag. I can either drop
the patch, or send a minimal version for net/net-next that makes the wrap
error stick on both RX and TX, without touching the rekey path. Which
would you prefer?

> > Getting there needs an initial record number installed close to the
> > limit, since 2^64 records cannot be exchanged in practice, and a peer
> > that sends the wrapped record, which the Linux TX path refuses to do.
> >
> > Mark the RX key exhausted when its record number wraps, and refuse to
> > wait for or decrypt another record under it, or to replace the key.
> > Plaintext that is already decrypted can still be read. RFC 8446 lets a
> > sender retire a key with a KeyUpdate as its last record, so in that
> > case leave sk_err alone, report the pending key update as usual and
> > let the new TLS_RX key clear the mark.
> >
> > Add fixed AES-GCM wire vectors and TLS 1.2/1.3 selftests for queued
> > wrapped records, SO_ERROR clearing, splice, peek, partial reads, TLS
> > 1.3 key replacement and a KeyUpdate in the last record. Every case
> > first verifies the penultimate record succeeds. The vectors avoid a
> > userspace crypto dependency and the TX path's refusal to generate the
> > maximum-number record.
>
> For 1.3, just do a "silent rekey" (change the key but don't send a
> keyupdate) on the TX side to record number 0 with the same key? And it
> should be enough to test this with just 1.3.

Agreed, that gets rid of the fixed vectors. Since 1.3 only uses the
record number in the nonce, TX can also produce the UINT64_MAX record
cleanly, using rec_seq 0 and the IV XORed with UINT64_MAX. If the patch
stays, the test will be 1.3-only and built that way.

> > diff --git a/net/tls/tls_main.c b/net/tls/tls_main.c
> > index fbb274287aa5..63bef0153182 100644
> > --- a/net/tls/tls_main.c
> > +++ b/net/tls/tls_main.c
> > @@ -730,6 +730,15 @@ static int do_tls_setsockopt_conf(struct sock *sk,=
 sockptr_t optval,
> >                       conf =3D TLS_SW;
> >               }
> >       } else {
> > +             struct tls_sw_context_rx *rx_ctx =3D tls_sw_ctx_rx(ctx);
> > +
> > +             /* Only a KeyUpdate may follow the last record number */
> > +             if (update && rx_ctx->rec_seq_exhausted &&
> > +                 !rx_ctx->key_update_pending) {
>
> I'm really confused by this.

It refused a TLS_RX rekey after a
a wrap that didn't include a KeyUpdate. A new key is harmless, as you
say, so I'll remove it.

> > +                     rc =3D -EBADMSG;
> > +                     goto err_crypto_info;
> > +             }
> > +
>
> --
> Sabrina
