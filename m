Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879268;
	b=lzra6FnDojehyynoQFwcfoKIgq444UmZ71ivjmzKQLAkq7z3UaEJQqXoPcZkE/NvniA4
	 kGnAHgDerZBabNZTsaSkZbf94hOdI5PUf/U3PdyujD9Tt+HdrOfs/OHt7kOXe4TZyX/0/
	 SAkvKFZtWbFOpHe9S+Z6lldyM8vsetef0KbM1logxOR+z3pSj4uKwS9GwsaRIMW+vmTN7
	 PPh4fvXDA9D+Z+PeKgEVQSWrfVGn6y5ehnMwjrro9xgVtduc39g3EbiToAIIT2vGGivIN
	 UW0eu+pzjjtvLXLpmDjOIm+aR0i1yyoq6R1CUxf6Qwws1DfDf/WTL8nYagASHJCh6AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879268;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6NFvMXt49n0aMhQ+tPrYzjCU429v93v4p/pcosygBN4=;
	b=wpEI65G9uhSnvtV/Cxgu38XaXexdt0UXL+6ysBdyaqctBZq08MJU40G1N0cg5g2eAcls
	 FlQ3EhNv3Wjn8RmFdBIhjQLcNgvjNnukCJBR77bEXNunUwm0uWDEgIzikZj711RJ+9BQ+
	 BzQQ5Sz7kfDwpkT+4V1sdMsY8tjGVmZKscMnuImwQL7BacOjQ0s7ekEnTjwpvndWqyh6E
	 Bug0qsFT8jDU68/8U2UJ5IXoty6bNbMmU1hmV1QXQsBxmR0dMiJteGIbThZTgNG8ZuIVQ
	 9TSqJxKIcuZcjRSVcy8Szd4LXsSQsQ8Px7vS5qpAdRX9g1bnNrOLVqCNneOp/syyzFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TXyO5odc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB72606A329
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 01:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TXyO5odc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96231F000C8
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 01:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794879267;
	bh=6NFvMXt49n0aMhQ+tPrYzjCU429v93v4p/pcosygBN4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TXyO5odcsAp87+zayuxVviAd5mVihReFEhyekjHo/UnS0k0+VPdXzGwVjFDNLN6Bn
	 RYzRcIVIS5WhSh6hOqI1qO2BkY4cGsMpYm3/tQXY+wgtxDW/wAAXeuwV2q+UHg3Dsm
	 20RUhPHB/6HK6gLQys1EbpJfGQfrJx8snGqz4ZqRKMLUAboBZqQpDE54/1RWytJ9hY
	 BvWnqm+BffC8Wnnl+NZ590ly+bia+USZKVL1G6kP48uHNG2UOxxXJufuDp+AJxOkuJ
	 9usGjjazXJR4mz0y81QovlVKWhjZLxkXYFBNYlP50Ts/QdX2lCfa0OfkTFZidtGGMp
	 H6HT8lMBi4g3Q==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso5768803a12.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 17:34:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGFj/bS/nCiIu9ou0/DYIeP5aPrzrsLqHLTUG4xSHoA+Nw7yxvg2tKStkhofS55P+GxjXPZVFtsnMI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4WWKH3wv8FIuWLzJzrh1FfaXQI4HToFZ8Su2C5MN1BT9ih/A6
	E18pmgp0wDe4tJTWOzx04CK74ylHTkXGxDcka1KUUZs/SZSzlt2JD0xbhpq15c3LCDnax96EHuv
	gWQr2U36tcvgOi8AcGB8xbauznJ+jQoM=
X-Received: by 2002:a17:906:c14d:b0:c50:5cd7:2901 with SMTP id
 a640c23a62f3a-c509640bfa8mr990170866b.23.1794879266573; Mon, 16 Nov 2026
 17:34:26 -0800 (PST)
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
 <CAKYAXd9KT=1vLYsnRKxmiM6pLJQNACXuodD8wNQzb8S5apiuRQ@mail.gmail.com> <CA+Fu+LPL7xqpV_vjjjehedOFtuuBqgZHZTSqJ+FgweUpYo2uBw@mail.gmail.com>
In-Reply-To: <CA+Fu+LPL7xqpV_vjjjehedOFtuuBqgZHZTSqJ+FgweUpYo2uBw@mail.gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 17 Nov 2026 10:34:13 +0900
X-Gmail-Original-Message-ID: <CAKYAXd--x9UajLQwzRUwxRZ7PFW5T02xyHdSAnThAo326p_kxw@mail.gmail.com>
X-Gm-Features: AclHuK-kfPqc8Bh37Jzng9-4IO0zn_61dopqd1mYNeZxWXG2ijut7JfpzpvArRM
Message-ID: <CAKYAXd--x9UajLQwzRUwxRZ7PFW5T02xyHdSAnThAo326p_kxw@mail.gmail.com>
Subject: Re: [PATCH RFC v1] ksmbd: add use_unbound_wq module parameter for the
 ksmbd-io workqueue
To: Stefan Chulski <stefan.chulski@broadcom.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ilya Lifshits <ilya.lifshits@broadcom.com>, Huiwen He <hehuiwen@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 9:52=E2=80=AFPM Stefan Chulski
<stefan.chulski@broadcom.com> wrote:
>
> On Mon, Nov 16, 2026 at 2:10=E2=80=AFPM Namjae Jeon <linkinjeon@kernel.or=
g> wrote:
> >
> > On Mon, Nov 16, 2026 at 4:49=E2=80=AFPM Stefan Chulski
> > <stefan.chulski@broadcom.com> wrote:
> > >
> > > The "ksmbd-io" workqueue has always been per-CPU. Commit 69635d7f4b34
> > > ("fs: WQ_PERCPU added to alloc_workqueue users") only made that
> > > default explicit as part of the treewide transition to unbound-by-def=
ault;
> > > it was not a ksmbd-specific decision.
> > >
> > > Per-CPU work keeps request processing on the CPU that queued it, whic=
h
> > > is good for cache locality, but it also runs work on CPUs that were
> > > isolated from workqueue noise (isolcpus=3D, nohz_full=3D) and prevent=
s the
> > > scheduler from placing blocked or long-running workers elsewhere.
> > > Which behaviour is better depends on the workload and platform.
> > >
> > > Add a boolean use_unbound_wq module parameter. It defaults to false, =
so
> > > behaviour is unchanged unless it is set; when true, "ksmbd-io" is
> > > allocated with WQ_UNBOUND instead of WQ_PERCPU. The "ksmbd-break"
> > > workqueue is already WQ_UNBOUND and is not affected.
> > >
> > > Document the parameter in ksmbd.rst.
> > >
> > > Signed-off-by: Stefan Chulski <stefan.chulski@broadcom.com>
> > Hi Stefan,
> >
> > Do you have numbers comparing the per-CPU and unbound queues,
>
> Yes, on our systems we observed up to an 18% performance improvement
> when using the unbound workqueue.
>
> The primary reason for this improvement is that with the default
> per-CPU workqueue, ksmbd-io work can sometimes start on a CPU that is
> already heavily loaded. Because it is bound to that specific CPU, the
> scheduler cannot move it to a less loaded or idle CPU, leading to
> bottlenecks. By using WQ_UNBOUND, the scheduler is free to migrate the
> work to less loaded CPUs, which significantly improves our CPU cycle
> efficiency.
>
> > How does this compare with the earlier following RFC ?
> >
> > https://lore.kernel.org/linux-cifs/20261022092514.2590010-1-huiwen.he@l=
inux.dev/
> >
> > Thanks.
>
> While both address the underlying scheduling limitations of per-CPU
> workqueues for ksmbd, my patch introduces the `use_unbound_wq` module
> parameter rather than changing the behavior unconditionally. Because
> the optimal behavior (cache locality vs. load balancing) heavily
> depends on the specific workload and platform, this approach keeps the
> existing per-CPU behavior as the default while allowing platforms to
> easily opt-in to the unbound workqueue when it yields better
> performance.
Could you provide the benchmark setup and actual results? If
WQ_UNBOUND generally performs better across representative workloads,
We could make it the default and provide a module parameter to opt
into WQ_PERCPU instead.

Thanks!
>
> Thanks,
> Stefan
