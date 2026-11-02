Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642078;
	b=hlS7FYjkNMKFp1l/hSbteiwd1XD/0UN10/8OIyNY/ZP192Q6+RdvgX7LOEb3dlRTzosI
	 HSqJ484tlVoEf6Ifh8fz3BIjYFxfBYZG5PU3PcmmLJ4ifMaWtcRQopfoc7u0elNcOxjqq
	 dfp2+snsKEnpsgdbEXYYfqm/t9f3M8L1EBbtQciE+SrYB/Ep6iq9YwWznZOIxqchEam3E
	 xK+sHZriQvYy4cSAOGFyBfAgj3nc1JvlGt8sZAFmTXZVBnhrs80IZEwDFlCRHZ7E3zAXR
	 Ca9wYMs1mVtxEwrqeowwLbQFODIkp4886VSIjAS0O7lzCsxSR/9isU3dpPj2S6Y2NHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=scZeb17XXKm1k29PX4odbDUwJgulUaI/xTz9Vkg+cZk=;
	b=GKU6KBdifVkdXSlk2ODdoiarfan9D779HVFjXSjD07Xu091iSL97HceZ+tOWLVQFpmy3
	 bHIG61lACiVNEhx2WPM97DUspGUsFIbzSYcLAyZiMszGiZy9tIdluRl88YSWI52C4i3ro
	 /lBJ2hUZdCuLpGyKa5nQHva5Or3nMI5SHSbX7t8032Gs0G7Zpb7TMagLnvfVbl7+87y7G
	 hy0DGYWR8xjZnTnHbfx86MVf9T9t843ELxWRFGAq/uxEz35KqIyOV2a+mqkCkyvXSH2D0
	 Pd2u9zURYXYPghjceKlPe75eiKssRd/ra3RWkfGe2RWxopD9j5UnSOfjYNw8OOEKFIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gUUKJZ6i;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2B6606B0FA
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 17:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE2B6606B0FA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gUUKJZ6i
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so779356a12.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 09:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793642077; x=1794246877; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=scZeb17XXKm1k29PX4odbDUwJgulUaI/xTz9Vkg+cZk=;
        b=gUUKJZ6iE6kMeJX2wngFOmJfdj34tHNdukYJ2763/cO78pWzbLpFiKwzNJXe3kied2
         6kOgIXV1pK+gXNCLw7PW7dyddapp/S+ZcVxmvmI8KmVa0VoZ4G5IHs5nppxRYhKPGT7Y
         CXLAw5MZ/pUJt6atuEm+Ut8tbfdqBO8uutAUQDoZnwmkmueSobeQS8dX5HM8wTn402vr
         3wS6ZRFTtpf0Gb3m6ojljLsWlt9sPRQFXyDhejy0lUVPBqlO0SD1ofi3XKsNk3TfQJWy
         TpJPR76fGTxghSMr+8VmSiaWD7DKO/AYuW3IK0YYGNoTMz8CzEs3U9466f6bOQmwQYZm
         GWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793642077; x=1794246877;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scZeb17XXKm1k29PX4odbDUwJgulUaI/xTz9Vkg+cZk=;
        b=QQq6c8qEYo1Xezh1klI2cWn4nbPUjZ8wUnFeKlc5v0NpW6/LlmlFcm+HCMGxIyAITZ
         pwNU4+in/XWA9kdek6SnVDsRRHagHvaR8REwyQ87SAs0LsnMF+M4rYmWsZcfxxlAt0Lu
         kOs8N3V5M1RncAR5JHkFyt/XfUQ3XRJf+M1gZFfIP1g6/7Rqj1F20DXKqbHve2i9bGiG
         SI4iOA6HdH/D8Itxie6zQ3i63Wv9wMqrXPnN6Qu+kU3uSHzVbQ1cCbkKOZnTxt/N2mrq
         Pn6qj1BVzepFC3MXrvaPzvWHAL2kEcYFqsp5GE5yLPRTz1EJQ2rMB8HSHSHFTnlX7HFv
         lJDA==
X-Forwarded-Encrypted: i=1; AKwUvBynPOth8bQZK8fCFNO/XyQXYDuTHJfgEy9AgOzgq/J/j40vfzCxySaDkOMOte/XApbtpew4JVyAhmc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jvPB2hXcoXvHv8narAL6vldBBm7Mnqf0QwfV0nfrffcXDrq1P
	1bfAMbmUuqw6+70ryoO4D3wpNk9FDzzA8dHk4rxt6JI5Hr67NPGUUzkr
X-Gm-Gg: AYBFou35Dju99CQ04OxmvpVDn/7a09GCmXuTvTCI2Liehzr4ayxz8+uJJtc0RFKxZhY
	ujM8Sw+Raq2OPCaCBnreiMZ8y21p5ElAumeWAJoUSo22e7k9OBIwEyKXfSCDkScOgqjCPPoTtb2
	DIUDqMpHQagvaUhnzRxuTAqb0pgLJ+i6mJ/+95gulsy/naGzHoPB3LrgVmh0Zdq4RaM+pikliD2
	hBkTFNUCNslSnFwx56BfJrmiq25GudJboEwHAletzrlAoxylnE+ml1WhGop8WnEMnDklG6ZITDv
	IzrY+V+x2F2WsoV206l+GUMpvPRdmNPx/y8CRB4p5tglfNn+vGPK0w3qLAGukKQAP+zK6/goy1C
	5ojAl48P+qq8WHQfXRyDcc1P4RDcnSmrfWl4hSjlO2JsjRxMiWgIgXjZCvAyFpZlAE8qILVgXxG
	rEqb/aSRmlE1kfm9fzM7oc9krRSwcSTTcAoMrgkashfuNtvvALUwxxCUzLjtmSNDQBpeQOQfUE+
	KEdjkYoiUquEj8s4t4BtYD9F64zxgaLzCgfK+GIS3p/rgScxJOysSab+X28P6WE/w8ql313VKzn
	LhNu7zNfnC7j2seMiyOY7CwxK2XktWNwzCDnpBfAnrr3rkwkwn+CXJi4QcWIP6NAhWOJOZM0w6V
	nw4pDpi1j1RyXLDmXwDZldM8a91OWqXEzgg==
X-Received: by 2002:a17:90b:2e90:b0:3ac:86a0:5764 with SMTP id 98e67ed59e1d1-3ae898311b8mr7938750a91.64.1793642076815;
        Mon, 02 Nov 2026 09:54:36 -0800 (PST)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8826a769sm7170534a91.4.2026.11.02.09.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 09:54:35 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 17:54:34 +0000
Message-Id: <DMKX1TT24BEL.328L6X0AO3CDS@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Jonathan Corbet" <corbet@lwn.net>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, <bpf@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] bpf: Use "new" URL to show if net-next is open
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261102111509.357269-2-u.kleine-koenig@baylibre.com>
 <DMKVOUX2GDZN.2Y8MKLR367NU8@gmail.com> <aujNf7TVDcwMYeLC@monoceros>
In-Reply-To: <aujNf7TVDcwMYeLC@monoceros>

On Mon Nov 2, 2026 at 5:51 PM UTC, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> On Mon, Nov 02, 2026 at 04:50:37PM +0000, Alexei Starovoitov wrote:
>> On Mon, Nov 02, 2026 at 03:15 AM Uwe Kleine-K=C3=B6nig <u.kleine-koenig@=
baylibre.com> wrote:
>> >  For non-subscribers to kernel mailing lists, there is also a status
>> >  page run by David S. Miller on net-next that provides guidance:
>> >
>> > -  http://vger.kernel.org/~davem/net-next.html
>> > +  https://netdev.bots.linux.dev/net-next.html
>>=20
>> The link is not the only stale part. The whole paragraph is wrong.
>> We apply patches during the merge window too.
>>=20
>> diff --git a/Documentation/bpf/bpf_devel_QA.rst b/Documentation/bpf/bpf_=
devel_QA.rst
>> index 4729efd..f6b9533 100644
>> --- a/Documentation/bpf/bpf_devel_QA.rst
>> +++ b/Documentation/bpf/bpf_devel_QA.rst
>> @@ -231,19 +231,9 @@ load or urgency.
>>=20
>>  Q: Are patches applied to bpf-next when the merge window is open?
>>  -----------------------------------------------------------------
>> -A: For the time when the merge window is open, bpf-next will not be
>> -processed. This is roughly analogous to net-next patch processing,
>> -so feel free to read up on the netdev docs at
>> -Documentation/process/maintainer-netdev.rst about further details.
>> -
>> -During those two weeks of merge window, we might ask you to resend
>> -your patch series once bpf-next is open again. Once Linus released
>> -a ``v*-rc1`` after the merge window, we continue processing of bpf-next=
.
>> -
>> -For non-subscribers to kernel mailing lists, there is also a status
>> -page run by David S. Miller on net-next that provides guidance:
>> -
>> -  http://vger.kernel.org/~davem/net-next.html
>> +A: Yes.
>
> Even better. Do you care to get this change in then?

Pls send a patch.

