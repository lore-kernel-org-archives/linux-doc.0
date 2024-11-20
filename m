Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5EA1420DD
	for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2024 16:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732119258; cv=none; b=PkILv+QauNVi08OS6tsJFQIrCNgqvPOfdxl3TaVjboLiFT+aodr10pS5WC+Sxk04pOEgg1WUc0KnqWp5fCCmo71iONaPMdlD9g4eFSAEzeUSDNcLlIz7ewIjEnouqshuL6So29iWgnGGBeu5qYF7xVib/RJ5RY2HDQCyIK6kMEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732119258; c=relaxed/simple;
	bh=g7QfRcSQn+gmJxBWhXW/TDF3sI8DjgoFIAHLcTGc4so=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XUSugQTlvVAlYLmH5o4hCrekyTkLnwD9jb0c85I4IJc3WoSD7gMbjX6Y+bCa3qLHh5EVHSh23MLYmZzQdB9mDcrw0hFv8CDW2oHUVuzp8vGMGY9VbYKXVjwdPBwnRc1FSQYUg8sefrjY4qHTozTSO7JC/9XieEdZkAH6gxHXMZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=cdtUej7x; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="cdtUej7x"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4613162181dso32377971cf.3
        for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2024 08:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1732119255; x=1732724055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36mHAHuOoczvUZMevzRpdY4PbCa8tx9CNRg6h+RZgJg=;
        b=cdtUej7x3IYT7y9XJ5WDfNS9BQ4CEugaJF8mLkReIuZbp5SQ/cK64/1lRDqsOpxXJh
         Y8Ff8MiwLAO1wHoXCjkhaDeld6ozrWthThzAp+so1nL2OdjduAekmqw8OsIqhh41Jzai
         ibnhz7uY0+tDvht+9a/2BttZjOLFPQ1avZApk899yvcXXedUBE3p7pVbDOtCsw6s/+Iz
         duWxuy8NdbUiBfYvGo0HhnYCvH6vB9vyAu4HLJ7JbfePlXAaf+09m/GzcmXv7mXA9nLi
         b03CrcZYUWBWHkCZr04GHkHYIfBBzxX0kbGb1aANjN16nwSLG/eN6ARZF9GZaeL/hVlY
         SLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732119255; x=1732724055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36mHAHuOoczvUZMevzRpdY4PbCa8tx9CNRg6h+RZgJg=;
        b=O8Q4CohNSPcninIbt72RZtm69szre/u6dATVE1cFJY2DOJ5ercV5/kO+3NX2+wMnEW
         Ia7YKrEtSsi0yQ+cDEzisTujHYFwRV2Zd95avwh0+SSBIf/0IkLlDcaIQ565VcNBBoVZ
         SQDtn+JF+NKvlY/4WZ5YCyfq6Lagn1FsRm8aQzgEwwnQ6TXKEnbus7k9ThSAJtlfe5vM
         EnLJoPaq9lZyn2BKT1x6nkNThsYniIqWLv8IojldVbRAuhxXMAcl1SwqeDBUWAwQdv7d
         Nq3Rho3HgwN/jnayXPUqao2CT172O0gskaDQZnMxG5EiBWr4T46yB22AhVj5FYUp5mb6
         A6ig==
X-Forwarded-Encrypted: i=1; AJvYcCU/Tq4MPj9J7Ywe4D5IrUwN7A+r0vBBf86y9LsBnTaa0TcfGFf47vJncSayLscisK/ISAuIrdx0Iuk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYOOnYRVy7dzuN0MaxQcUg9uPj2cS5kDmiqslTtTL6aOG2QNOp
	nJoCIM0j+FeRn/nA8LU3AnScHuBHC2X6aAgLOT5uChGCenV8b6GJKrigqnoB8nvLUs0YSgCGzKu
	WRzLvjPpxSVWytJlSBVkJjM9Cte+ozHkhAtDBtA==
X-Google-Smtp-Source: AGHT+IFt7Yq3qdxAOZPq5rfspDx9bBIP2Xc48nqDhvTlFobjMOD2awIarz0pB2lJFk6Gsup7XNJxHXCOtbCvhDGq3MA=
X-Received: by 2002:a05:622a:14d2:b0:458:5ed8:628 with SMTP id
 d75a77b69052e-464777e2232mr41870841cf.2.1732119255280; Wed, 20 Nov 2024
 08:14:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241116175922.3265872-1-pasha.tatashin@soleen.com>
 <ZzuRSZc8HX9Zu0dE@google.com> <CA+CK2bAAigxUv=HGpxoV-PruN_AhisKW675SxuG_yVi+vNmfSQ@mail.gmail.com>
 <2024111938-anointer-kooky-d4f9@gregkh> <CA+CK2bD88y4wmmvzMCC5Zkp4DX5ZrxL+XEOX2v4UhBxet6nwSA@mail.gmail.com>
 <ZzzXqXGRlAwk-H2m@google.com> <CA+CK2bD4zcXVATVhcUHBsA7Adtmh9LzCStWRDQyo_DsXxTOahA@mail.gmail.com>
 <CAJD7tkZDSZ4QjLhkWQ3RV_vEwzTfCMtFcWX_Fx8mj-q0Zg2cOw@mail.gmail.com>
In-Reply-To: <CAJD7tkZDSZ4QjLhkWQ3RV_vEwzTfCMtFcWX_Fx8mj-q0Zg2cOw@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 20 Nov 2024 11:13:37 -0500
Message-ID: <CA+CK2bC-jNxUgp9JB=H9GsMu1FrxyqXxCe_v1G-43A1-eed0VA@mail.gmail.com>
Subject: Re: [RFCv1 0/6] Page Detective
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, akpm@linux-foundation.org, corbet@lwn.net, 
	derek.kiernan@amd.com, dragan.cvetic@amd.com, arnd@arndb.de, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, tj@kernel.org, 
	hannes@cmpxchg.org, mhocko@kernel.org, shakeel.butt@linux.dev, 
	muchun.song@linux.dev, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	vbabka@suse.cz, jannh@google.com, shuah@kernel.org, vegard.nossum@oracle.com, 
	vattunuru@marvell.com, schalla@marvell.com, david@redhat.com, 
	willy@infradead.org, osalvador@suse.de, usama.anjum@collabora.com, 
	andrii@kernel.org, ryan.roberts@arm.com, peterx@redhat.com, oleg@redhat.com, 
	tandersen@netflix.com, rientjes@google.com, gthelen@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 2:36=E2=80=AFPM Yosry Ahmed <yosryahmed@google.com>=
 wrote:
>
> On Tue, Nov 19, 2024 at 11:30=E2=80=AFAM Pasha Tatashin
> <pasha.tatashin@soleen.com> wrote:
> >
> > On Tue, Nov 19, 2024 at 1:23=E2=80=AFPM Roman Gushchin <roman.gushchin@=
linux.dev> wrote:
> > >
> > > On Tue, Nov 19, 2024 at 10:08:36AM -0500, Pasha Tatashin wrote:
> > > > On Mon, Nov 18, 2024 at 8:09=E2=80=AFPM Greg KH <gregkh@linuxfounda=
tion.org> wrote:
> > > > >
> > > > > On Mon, Nov 18, 2024 at 05:08:42PM -0500, Pasha Tatashin wrote:
> > > > > > Additionally, using crash/drgn is not feasible for us at this t=
ime, it
> > > > > > requires keeping external tools on our hosts, also it requires
> > > > > > approval and a security review for each script before deploymen=
t in
> > > > > > our fleet.
> > > > >
> > > > > So it's ok to add a totally insecure kernel feature to your fleet
> > > > > instead?  You might want to reconsider that policy decision :)
> > > >
> > > > Hi Greg,
> > > >
> > > > While some risk is inherent, we believe the potential for abuse her=
e
> > > > is limited, especially given the existing  CAP_SYS_ADMIN requiremen=
t.
> > > > But, even with root access compromised, this tool presents a smalle=
r
> > > > attack surface than alternatives like crash/drgn. It exposes less
> > > > sensitive information, unlike crash/drgn, which could potentially
> > > > allow reading all of kernel memory.
> > >
> > > The problem here is with using dmesg for output. No security-sensitiv=
e
> > > information should go there. Even exposing raw kernel pointers is not
> > > considered safe.
> >
> > I am OK in writing the output to a debugfs file in the next version,
> > the only concern I have is that implies that dump_page() would need to
> > be basically duplicated, as it now outputs everything via printk's.
>
> Perhaps you can refactor the code in dump_page() to use a seq_buf,
> then have dump_page() printk that seq_buf using seq_buf_do_printk(),
> and have page detective output that seq_buf to the debugfs file?

Good idea, I will look into modifying it this way.

> We do something very similar with memory_stat_format(). We use the

void mem_cgroup_print_oom_meminfo(struct mem_cgroup *memcg)
{
        /* Use static buffer, for the caller is holding oom_lock. */
        static char buf[PAGE_SIZE];
        ....
        seq_buf_init(&s, buf, sizeof(buf));
        memory_stat_format(memcg, &s);
        seq_buf_do_printk(&s, KERN_INFO);
}

This is a callosal stack allocation, given that our fleet only has 8K
stacks. :-)

> same function to generate the memcg stats in a seq_buf, then we use
> that seq_buf to output the stats to memory.stat as well as the OOM
> log.
