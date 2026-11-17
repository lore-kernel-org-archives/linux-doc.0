Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905508;
	b=qdD3okuny74KFfDfTYdlikL/sbQAwVUbQhacmQUI0lmuKLF36sM9mMZusjTNT3B58OOL
	 Y51mswiwyO4E7AgrQCt77vzPqNO4R+a2Xw/yVM4GZ3MdpGgrT4FKiRvBE2FfVKfuB1b2o
	 6fcPs6+qRFlz/4hrVujN1o1uo7EOxRuw60wwC3X4oPZxiiys36BwdbXksbVr5B0cnJn3o
	 pQPwmJWAO0VVanAO8J8DuBjYujRs+B4bM8blKOqzphyZHr1ELv1L4RaOYhKuiF0MKypQM
	 MfP7xkmwPPPpoAAAI0eomQbakc0xVtLMc5P1eeC0vM2B/h6wJJmsxkkg6vKmxEM5JQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905508;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=s4yCKzF4YDIiI5PlcqBi7tYBGUxCwcilhm4zOkc48Yg=;
	b=YQyDQczv+LWslxvGCwLZVxYuLtu0nmVoxoREu5rhfS8bZ47D5VAw6IjC4/BLck85dWw5
	 ydiM32wRnHFFpOeVtf2f3G0Co5jCYMarqb6fZ5PN0cSwtPsLA0Ep9ir2G9bJZzb+rlqZK
	 gjE1tud6RGCrZiebgXzScZUSbjCtw/ZfcvF2yTX2YW1lo6VqrTkRavECeFSP0dUoEf/fD
	 ith6oP9YZvAQG9xg9L8CM0qplI5e/nzHVoGPcaaoR9A+xXWKzlb64kInHBuhtEOB9kLSf
	 u7vUQMVlnlqQar0Yl7L92QqXh41GVxyq7pJ3l32ABDyfkIvjPmk4UnG662ZNnPoymPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hB58cieY;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC40606A337
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 08:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EC40606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hB58cieY
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b3bf3bef9aso94324a91.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 00:51:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905508; x=1795510308;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s4yCKzF4YDIiI5PlcqBi7tYBGUxCwcilhm4zOkc48Yg=;
        b=xQHqQY2lsmcJU7UGWR3MuXOMjzCaA2LQVkIcL9Y7YhE73rCIiVIz0e3P8+DMm741bt
         bh1LiYT+Yg0kHWNPqx1v12zO/tw8YaC4qXsajYRg/Bx2IOmNHkw99w3EY6IzcFV/y0/s
         TPBnJpJqYLS1SuHGNT/byNsnk6fUOQh67Fbdvl2Vg1ZeIdstYmgyFxKjjNOCMGTkeYdX
         rLMquSr2o632f1rTzwEOhDKCha1R1wXVEE1iHvlzr1txb0UPpnWygYdibDjvgZeUT7ji
         WrD5EjrUlVguhuyzZknSAszNqc4ecJdHWrbKpA+RD2w4HvfYQobyncigXiZgaF6pwmPo
         9nYg==
X-Forwarded-Encrypted: i=1; AL+hErHHguvuQTDynp7LKDojWJNWJow3shKPtz30V6djyDq1i7LSs1TPXDL2lqGxBwdkg/cgZA3BJyy4v+A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mwsnHdyY1zb9hf+8nPIaa0K91sFvqP6tjcmOAzYPmw7SEJogX
	xsK2iV08i4H2xoNyL2tQ5bPuTxADsJBrL5bRvjmDQzXHvzEZdDjH0GA3pOumZCWhd5CkSlvEdSS
	YmkceLyoINbZv0U4FyWp39vX70vbxbAUFHhVdhDM95iHtOUFzBui5BM3mtzguCNHWj4fRgxyK9r
	9NsFH/xiLzrHI0+yuKb+Od92t25zMgWuyDK/YjGa2UvynFC26g/WxCd7Keewu6I7GC8jSgMaIAo
	SdsrUyTI4Ix58Z98g==
X-Gm-Gg: AZFdTZeGKBqBZNfdbWCZl5yI09a9G7Cq6O2FewTGYRxMLf1/iwt+uExt0xQVdmPpjYD
	8LX4Uxu2nfFH76UJk2TlMf9iNpeNfPxPN6vvl2b2t3V+wSPB3NsYz4aIXXuaqawltWd4ukkhrmx
	udCTxhpvpaofv6wcxkwHGXJO5tbdfoDd4Ch3EOZCLymVfK0K4/uPpdALKGZCF8t72eeTczFLTc7
	ykaqINCrRWbPf6IcD1MzQZmMzhX2BmakMCdUXGo/dH2NAwjhJH1VJLfWSlklres9INrVeVdXYk2
	oIGWDWCBnKjq/UF71eBFAlvCYq08OwxlYOv8jwL9HUnZDmnD9xobpio96UqB0UF0eB+2Yd5V3Ga
	5ZKm1Z6DUSn6C+O85vWYKK9JKwWWSdJD9ZDOe8Fjhh6H+5QaTPCXvBvgaDdP87ioqvSksIrivoN
	oZldeR3fEOvH/vfLmySRPTbQDKy9CBqV/bzDVHEg==
X-Received: by 2002:a17:90b:2543:b0:3b1:ae88:5c31 with SMTP id 98e67ed59e1d1-3b1b0cc9714mr12800498a91.43.1794905507662;
        Tue, 17 Nov 2026 00:51:47 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abb97b44sm1527077a91.2.2026.11.17.00.51.47
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 00:51:47 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a065e2933fso5900953b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 00:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794905506; x=1795510306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s4yCKzF4YDIiI5PlcqBi7tYBGUxCwcilhm4zOkc48Yg=;
        b=hB58cieY5b8UwhK1MBXmQ8KGG0LZz8/e5NSGWg6whcFiDUdWJ3ilIoNekl+HyBk0Dd
         qjsFbLQ8yyU9+rMOplOuiPp4mR7t5V+zOU66yJGPVJESgEh2RWlOY0arvu0YQBGVRKuZ
         7cpC3C1yzjKHMiQSkRxarMVSAyY80Q6QlP/9Y=
X-Forwarded-Encrypted: i=1; AL+hErGQI9lzq04bodE5sUHmpWm6/TpYdy2wX+050Feho1KScs53q/7FS3+4hLRV42+z+nAzPk6UlUXmyu4=@vger.kernel.org
X-Received: by 2002:a05:6a00:4215:b0:883:71f6:5fb with SMTP id d2e1a72fcca58-8beb5bacc27mr13819087b3a.13.1794905505990;
        Tue, 17 Nov 2026 00:51:45 -0800 (PST)
X-Received: by 2002:a05:6a00:4215:b0:883:71f6:5fb with SMTP id
 d2e1a72fcca58-8beb5bacc27mr13819068b3a.13.1794905505604; Tue, 17 Nov 2026
 00:51:45 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116074849.475815-1-stefan.chulski@broadcom.com>
 <CAKYAXd9KT=1vLYsnRKxmiM6pLJQNACXuodD8wNQzb8S5apiuRQ@mail.gmail.com>
 <CA+Fu+LPL7xqpV_vjjjehedOFtuuBqgZHZTSqJ+FgweUpYo2uBw@mail.gmail.com> <CAKYAXd--x9UajLQwzRUwxRZ7PFW5T02xyHdSAnThAo326p_kxw@mail.gmail.com>
In-Reply-To: <CAKYAXd--x9UajLQwzRUwxRZ7PFW5T02xyHdSAnThAo326p_kxw@mail.gmail.com>
From: Stefan Chulski <stefan.chulski@broadcom.com>
Date: Tue, 17 Nov 2026 10:51:33 +0200
X-Gm-Features: AclHuK_RHNY-A8YWsfLMtfZRg8kMifDdxlLsMR_xEYE8xYRbaSFIuqvBKZGGKlU
Message-ID: <CA+Fu+LPnXMd9rMtywkZL77XzLq8n+8AiBW2T8Cau10YnVbofiQ@mail.gmail.com>
Subject: Re: [PATCH RFC v1] ksmbd: add use_unbound_wq module parameter for the
 ksmbd-io workqueue
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ilya Lifshits <ilya.lifshits@broadcom.com>, Huiwen He <hehuiwen@kylinos.cn>, 
	Gil Benamar <gil.benamar@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, Nov 17, 2026 at 3:34=E2=80=AFAM Namjae Jeon <linkinjeon@kernel.org>=
 wrote:
>
> On Mon, Nov 16, 2026 at 9:52=E2=80=AFPM Stefan Chulski
> <stefan.chulski@broadcom.com> wrote:
> >
> > On Mon, Nov 16, 2026 at 2:10=E2=80=AFPM Namjae Jeon <linkinjeon@kernel.=
org> wrote:
> >
> > While both address the underlying scheduling limitations of per-CPU
> > workqueues for ksmbd, my patch introduces the `use_unbound_wq` module
> > parameter rather than changing the behavior unconditionally. Because
> > the optimal behavior (cache locality vs. load balancing) heavily
> > depends on the specific workload and platform, this approach keeps the
> > existing per-CPU behavior as the default while allowing platforms to
> > easily opt-in to the unbound workqueue when it yields better
> > performance.
> Could you provide the benchmark setup and actual results? If
> WQ_UNBOUND generally performs better across representative workloads,
> We could make it the default and provide a module parameter to opt
> into WQ_PERCPU instead.

These are the results from our embedded systems featuring dual-core ARM CPU=
s.
The benchmark setup is fairly simple: writing to a USB disk over the
network. Because the network traffic is a single 5-tuple TCP stream,
it is pinned to one of the CPUs (depending on the 5-tuple hash).

We tested this on two different platforms and saw the following
throughput improvements:
Platform 1: Improved from 178 MB/s to 210 MB/s
Platform 2: Improved from 215 MB/s to 263 MB/s

Regards,
Stefan
